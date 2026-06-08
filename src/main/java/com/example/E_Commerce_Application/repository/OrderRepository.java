package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.Order;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface OrderRepository
        extends JpaRepository<Order, UUID> {

    List<Order> findByUserIdOrderByOrderDateDesc(
            int userId
    );
}