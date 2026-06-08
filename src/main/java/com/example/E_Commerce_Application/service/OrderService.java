package com.example.E_Commerce_Application.service;

import com.example.E_Commerce_Application.dto.OrderDTO;
import com.example.E_Commerce_Application.entity.Order;

import java.util.List;
import java.util.UUID;

public interface OrderService {

    Order saveOrder(Order order);

    List<OrderDTO> getAllOrders();

    List<OrderDTO> getOrdersByUserId(int userId);

    Order getOrderById(UUID orderId);

    void cancelOrder(UUID orderId);
}