package com.example.E_Commerce_Application.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;
import java.util.Map;

@Service
public class OpenRouterService {

    @Value("${openrouter.api.key}")
    private String apiKey;

    public String getResponse(String userMessage) {

        try {

            WebClient client = WebClient.builder()
                    .baseUrl("https://openrouter.ai/api/v1")
                    .defaultHeader(HttpHeaders.AUTHORIZATION,
                            "Bearer " + apiKey)
                    .build();

            Map<String, Object> request = Map.of(

                    "model", "openai/gpt-oss-20b:free",

                    "messages", List.of(
                            Map.of(
                                    "role", "user",
                                    "content",
                                    "You are an Ecommerce Assistant. "
                                            + userMessage
                            )
                    )
            );

            Map response = client.post()
                    .uri("/chat/completions")
                    .contentType(MediaType.APPLICATION_JSON)
                    .bodyValue(request)
                    .retrieve()
                    .bodyToMono(Map.class)
                    .block();

            List choices =
                    (List) response.get("choices");

            Map choice =
                    (Map) choices.get(0);

            Map message =
                    (Map) choice.get("message");

            return message.get("content").toString();

        } catch (Exception e) {

            String msg = e.getMessage();

            if(msg != null && msg.contains("429")) {
                return "AI is busy right now. Please try again after a few seconds.";
            }

            return "AI service unavailable.";
        }
    }
}