package com.example.E_Commerce_Application.controller;

import com.example.E_Commerce_Application.entity.Chatbot;
import com.example.E_Commerce_Application.repository.ChatbotRepository;
import com.example.E_Commerce_Application.service.OpenRouterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/chat")
public class ChatController {

    @Autowired
    private ChatbotRepository repo;

    @Autowired
    private OpenRouterService openRouterService;

    @PostMapping
    public Map<String, String> chat(
            @RequestBody Map<String, String> request
    ) {

        String msg = request.get("message");

        List<Chatbot> list =
                repo.findByQuestionContainingIgnoreCase(msg);

        String reply;

        if (!list.isEmpty()) {

            reply = list.get(0).getAnswer();

        } else {

            reply = openRouterService.getResponse(msg);
        }

        return Map.of(
                "reply",
                reply
        );
    }
}