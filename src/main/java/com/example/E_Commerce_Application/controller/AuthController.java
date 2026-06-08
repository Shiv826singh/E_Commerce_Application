package com.example.E_Commerce_Application.controller;

import com.example.E_Commerce_Application.dto.RegisterRequest;
import com.example.E_Commerce_Application.entity.User;
import com.example.E_Commerce_Application.service.OtpService;
import com.example.E_Commerce_Application.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private OtpService otpService;

    @Autowired
    private UserService userService;

    // ================= SEND OTP =================

    @PostMapping("/send-otp")
    public String sendOtp(
            @ModelAttribute RegisterRequest request,
            HttpSession session,
            Model model
    ) {

        if(userService.isEmailExist(
                request.getUserEmail()
        )){

            model.addAttribute(
                    "error",
                    "Email already exists"
            );

            return "register";
        }

        // Save temp data
        session.setAttribute(
                "registerData",
                request
        );

        // Send OTP
        otpService.sendEmailOtp(
                request.getUserEmail()
        );

        otpService.sendPhoneOtp(
                request.getUserPhone()
        );

        model.addAttribute(
                "email",
                request.getUserEmail()
        );

        model.addAttribute(
                "phone",
                request.getUserPhone()
        );

        return "verify_otp";
    }

    // ================= VERIFY OTP =================

    @PostMapping("/verify-otp")
    public String verifyOtp(

            @RequestParam String emailOtp,

            @RequestParam String phoneOtp,

            HttpSession session,

            Model model
    ) {

        RegisterRequest request =
                (RegisterRequest)
                        session.getAttribute(
                                "registerData"
                        );

        if(request == null){

            return "redirect:/register";
        }

        boolean emailVerified =
                otpService.verifyEmailOtp(
                        request.getUserEmail(),
                        emailOtp
                );

        boolean phoneVerified =
                otpService.verifyPhoneOtp(
                        request.getUserPhone(),
                        phoneOtp
                );

        if(!emailVerified ||
                !phoneVerified){

            model.addAttribute(
                    "error",
                    "Invalid OTP"
            );

            return "verify_otp";
        }

        // Create User

        User user = new User();

        user.setUserName(
                request.getUserName()
        );

        user.setUserEmail(
                request.getUserEmail()
        );

        user.setUserPassword(
                request.getUserPassword()
        );

        user.setUserPhone(
                request.getUserPhone()
        );

        user.setUserAddress(
                request.getUserAddress()
        );

        user.setEmailVerified(true);

        user.setPhoneVerified(true);

        userService.registerUser(user);

        session.removeAttribute(
                "registerData"
        );

        session.setAttribute(
                "success",
                "✅ Registration Successful! Please login now."
        );

        return "redirect:/login";
    }

    // ================= FORGET PASSWORD OTP =================
    @PostMapping("/send-reset-otp")
    @ResponseBody
    public String sendResetOtp(@RequestParam String email,
                               @RequestParam String phone,
                               HttpSession session) {

        User user = userService.findByEmail(email);

        if (user == null) {
            return "Email not found";
        }

        if (!user.getUserPhone().equals(phone)) {
            return "Phone number does not match";
        }

        // Email session me save kar do
        session.setAttribute("resetEmail", email);

        // Tumhara existing OTP Service OTP generate aur send karega
        otpService.sendPhoneOtp(phone);

        return "OTP_SENT";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String email,
                                @RequestParam String otp,
                                @RequestParam String captcha,
                                @RequestParam String generatedCaptcha,
                                @RequestParam String newPassword,
                                HttpSession session,
                                Model model) {

        String sessionEmail = (String) session.getAttribute("resetEmail");

        if (sessionEmail == null) {
            model.addAttribute("error", "Session expired");
            return "forgot_password";
        }

        if (!sessionEmail.equals(email)) {
            model.addAttribute("error", "Email mismatch");
            return "forgot_password";
        }

        // Captcha Verify
        if (!captcha.equalsIgnoreCase(generatedCaptcha)) {
            model.addAttribute("error", "Invalid CAPTCHA");
            return "forgot_password";
        }

        User user = userService.findByEmail(email);

        if (user == null) {
            model.addAttribute("error", "User not found");
            return "forgot_password";
        }

        // OTP Verify using existing OtpService
        boolean phoneVerified = otpService.verifyPhoneOtp(
                user.getUserPhone(),
                otp
        );

        if (!phoneVerified) {
            model.addAttribute("error", "Invalid OTP");
            return "forgot_password";
        }

        // Password Update
        user.setUserPassword(newPassword);

        userService.updateUser(user);

        // Session cleanup
        session.removeAttribute("resetEmail");

        // SweetAlert message
        session.setAttribute(
                "success",
                "✅ Password updated successfully. Please login."
        );

        return "redirect:/user/login";
    }

    @GetMapping("/forgot-password")
    public String forgotPasswordPage() {

        return "forgot_password";
    }
}