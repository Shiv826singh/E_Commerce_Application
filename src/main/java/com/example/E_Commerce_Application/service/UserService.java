package com.example.E_Commerce_Application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.E_Commerce_Application.entity.User;
import com.example.E_Commerce_Application.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public void registerUser(User user) {
        userRepository.save(user);
    }
    public boolean isEmailExist(String email) {
        return userRepository.findByUserEmail(email) != null;
    }

    public User loginUser(String email, String password) {
        return userRepository.findByUserEmailAndUserPassword(email, password);
    }
    public User findByEmail(String email) {
        return userRepository.findByUserEmail(email);
    }

    public void updateUser(User user) {
        userRepository.save(user);
    }

}
