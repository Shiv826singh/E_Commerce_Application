package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
}
