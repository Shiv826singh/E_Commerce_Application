package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Payment, Integer> {
}