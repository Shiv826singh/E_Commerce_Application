package com.example.E_Commerce_Application.controller;


import com.example.E_Commerce_Application.dto.OrderDTO;
import com.example.E_Commerce_Application.dto.OrderRequest;
import com.example.E_Commerce_Application.entity.Order;
import com.example.E_Commerce_Application.entity.OrderItem;
import com.example.E_Commerce_Application.entity.User;
import com.example.E_Commerce_Application.repository.OrderRepository;
import com.example.E_Commerce_Application.service.EmailService;
import com.example.E_Commerce_Application.service.OrderService;
import org.springframework.web.bind.annotation.*;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.lang.reflect.Type;

import java.time.LocalDate;
import java.util.*;
import com.razorpay.RazorpayClient;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;

@Controller
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private EmailService emailService;
    @Autowired
    private OrderService orderService;

    @Value("${razorpay.key.id}")
    private String razorpayKeyId;

    @Value("${razorpay.key.secret}")
    private String razorpayKeySecret;



    @PostMapping("/place-order")
    public String placeOrder(

            @ModelAttribute OrderRequest request,
            HttpSession session,
            Model model
    ) {

        User user =
                (User) session.getAttribute("current-user");

        if(user == null){
            return "redirect:/login";
        }

        Gson gson = new Gson();

        Type listType =
                new TypeToken<List<Map<String,Object>>>(){}.getType();

        List<Map<String,Object>> cart =
                gson.fromJson(request.getCartData(), listType);

        Order order = new Order();

        order.setUserId(user.getId());

        order.setFirstName(request.getFirstName());
        order.setLastName(request.getLastName());
        order.setEmail(request.getEmail());
        order.setPhone(request.getPhone());

        order.setAddress(request.getAddress());

        order.setCity(request.getCity());
        order.setState(request.getState());
        order.setPincode(request.getPincode());

        order.setPaymentMethod(
                request.getPaymentMethod()
        );
        // Razorpay Details Save

        order.setRazorpayOrderId(
                request.getRazorpayOrderId()
        );

        order.setRazorpayPaymentId(
                request.getRazorpayPaymentId()
        );

        order.setRazorpaySignature(
                request.getRazorpaySignature()
        );

        order.setPaymentStatus("Pending");

        order.setOrderStatus("Order Placed");

        double itemsTotal = 0;

        List<OrderItem> orderItems =
                new ArrayList<>();

        for(Map<String,Object> item : cart){

            OrderItem orderItem =
                    new OrderItem();

            int qty =
                    ((Double)item.get("productQuantity"))
                            .intValue();

            double price =
                    ((Double)item.get("productPrice"));

            double total =
                    qty * price;

            itemsTotal += total;

            orderItem.setProductId(
                    ((Double)item.get("productId"))
                            .intValue()
            );

            orderItem.setProductName(
                    item.get("productName").toString()
            );

            orderItem.setQuantity(qty);

            orderItem.setPrice(total);

            orderItem.setOrder(order);

            orderItems.add(orderItem);
        }

        double gst =
                Math.round(itemsTotal * 0.18);

        double finalAmount =
                itemsTotal + gst + 99;

        order.setItemsTotal(itemsTotal);

        order.setGst(gst);

        order.setDeliveryCharge(99);

        order.setFinalAmount(finalAmount);

        LocalDate shippingDate =
                LocalDate.now().plusDays(7);

        order.setShippingDate(
                shippingDate.toString()
        );

        order.setOrderItems(orderItems);

        if(request.getPaymentMethod().equalsIgnoreCase("COD")){

            order.setPaymentStatus("Pending");

        }else{

            order.setPaymentStatus("Paid");
        }

        orderRepository.save(order);

        try{

            emailService.sendOrderEmail(order);

        }catch(Exception e){

            System.out.println(e.getMessage());
        }

        model.addAttribute("order", order);

        return "order_success";
    }
    // To show my orders
    @GetMapping("/my-orders")
    public String myOrders(HttpSession session, Model model) {

        User user = (User) session.getAttribute("current-user");

        // check if user is logged in
        if (user == null) {
            return "redirect:/login";
        }

        List<OrderDTO> orders =
                orderService.getOrdersByUserId(user.getId());

        model.addAttribute("orders", orders);

        return "my_orders";
    }

    @PostMapping("/cancel-order/{orderId}")
    public String cancelOrder(
            @PathVariable UUID orderId
    ) {

        orderService.cancelOrder(orderId);

        return "redirect:/my-orders";
    }

    @PostMapping("/create-razorpay-order")
    @ResponseBody
    public String createRazorpayOrder(
            @RequestParam double amount) {

        try {

            RazorpayClient client =
                    new RazorpayClient(
                            razorpayKeyId,
                            razorpayKeySecret
                    );

            JSONObject options =
                    new JSONObject();

            options.put(
                    "amount",
                    (int)(amount * 100)
            );

            options.put(
                    "currency",
                    "INR"
            );

            options.put(
                    "receipt",
                    "txn_" + System.currentTimeMillis()
            );

            com.razorpay.Order order =
                    client.orders.create(options);

            return order.toString();

        } catch (Exception e) {

            System.err.println("Razorpay Error: " + e.getMessage());

            return "{\"error\":\"Unable to create Razorpay Order\"}";
        }
    }

    @PostMapping("/payment-success")
    @ResponseBody
    public String paymentSuccess(
            @RequestParam("razorpay_payment_id") String paymentId,
            HttpSession session
    ) {

        Order order =
                (Order) session.getAttribute("pendingOrder");

        if(order == null){

            return "Order not found";
        }

        order.setPaymentStatus("Paid");

        order.setOrderStatus("Order Placed");

        orderRepository.save(order);

        try{

            emailService.sendOrderEmail(order);

        }catch(Exception e){

            System.out.println(e.getMessage());
        }

        session.removeAttribute("pendingOrder");

        return "success";
    }

}