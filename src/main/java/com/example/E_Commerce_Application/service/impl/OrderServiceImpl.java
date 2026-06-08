package com.example.E_Commerce_Application.service.impl;

import com.example.E_Commerce_Application.dto.OrderDTO;
import com.example.E_Commerce_Application.dto.OrderItemDTO;
import com.example.E_Commerce_Application.entity.Order;
import com.example.E_Commerce_Application.entity.OrderItem;
import com.example.E_Commerce_Application.repository.OrderRepository;
import com.example.E_Commerce_Application.service.OrderService;
import com.example.E_Commerce_Application.entity.CancelledOrder;
import com.example.E_Commerce_Application.repository.CancelledOrderRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private CancelledOrderRepository cancelledOrderRepository;

    @Override
    public Order saveOrder(Order order) {

        return orderRepository.save(order);
    }

    @Override
    public List<OrderDTO> getAllOrders() {

        List<Order> orders =
                orderRepository.findAll();

        return convertToDTOList(orders);
    }

    @Override
    public List<OrderDTO> getOrdersByUserId(int userId) {

        List<Order> orders =
                orderRepository
                        .findByUserIdOrderByOrderDateDesc(userId);

        return convertToDTOList(orders);
    }

    @Override
    public Order getOrderById(UUID orderId) {

        return orderRepository.findById(orderId)
                .orElseThrow(() ->
                        new RuntimeException("Order not found"));
    }

    @Override
    public void cancelOrder(UUID orderId) {

        Order order = orderRepository.findById(orderId)
                .orElseThrow(() ->
                        new RuntimeException("Order not found"));

        CancelledOrder cancelledOrder =
                new CancelledOrder();

        cancelledOrder.setOriginalOrderId(
                order.getOrderId()
        );

        cancelledOrder.setUserId(
                order.getUserId()
        );

        cancelledOrder.setCustomerName(
                order.getFirstName() + " " + order.getLastName()
        );

        cancelledOrder.setTotalAmount(
                order.getFinalAmount()
        );

        cancelledOrder.setPaymentMethod(
                order.getPaymentMethod()
        );

        cancelledOrder.setCancelReason(
                "Cancelled By User"
        );

        cancelledOrderRepository.save(cancelledOrder);

        orderRepository.delete(order);
    }

    // DTO Conversion Method
    private List<OrderDTO> convertToDTOList(List<Order> orders){

        List<OrderDTO> orderDTOList =
                new ArrayList<>();

        for(Order order : orders){

            OrderDTO orderDTO =
                    new OrderDTO();

            // Convert UUID to Long safely
            orderDTO.setOrderId(
                    order.getOrderId()
            );

            orderDTO.setTotalAmount(
                    order.getFinalAmount()
            );

            orderDTO.setOrderStatus(
                    order.getOrderStatus()
            );

            orderDTO.setOrderDate(
                    order.getOrderDate()
            );
            orderDTO.setPaymentMethod(
                    order.getPaymentMethod()
            );

            orderDTO.setPaymentStatus(
                    order.getPaymentStatus()
            );

            orderDTO.setShippingDate(
                    order.getShippingDate()
            );

            List<OrderItemDTO> itemDTOList =
                    new ArrayList<>();

            for(OrderItem item :
                    order.getOrderItems()){

                OrderItemDTO itemDTO =
                        new OrderItemDTO();

                itemDTO.setProductName(
                        item.getProductName()
                );

                itemDTO.setPrice(
                        item.getPrice()
                );

                itemDTO.setQuantity(
                        item.getQuantity()
                );

                itemDTOList.add(itemDTO);
            }

            orderDTO.setOrderItems(itemDTOList);

            orderDTOList.add(orderDTO);
        }

        return orderDTOList;
    }
}