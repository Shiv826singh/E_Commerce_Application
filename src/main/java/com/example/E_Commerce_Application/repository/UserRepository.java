package com.example.E_Commerce_Application.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.E_Commerce_Application.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUserEmail(String userEmail);
    User findByUserEmailAndUserPassword(String email, String password);
}