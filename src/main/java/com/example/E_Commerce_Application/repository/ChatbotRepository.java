package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.Chatbot;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChatbotRepository extends JpaRepository<Chatbot, Integer> {

    List<Chatbot> findByQuestionContainingIgnoreCase(String question);
}
