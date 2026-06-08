package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.CancelledOrder;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CancelledOrderRepository
        extends JpaRepository<CancelledOrder, Integer> {
}