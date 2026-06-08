package com.example.E_Commerce_Application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class OtpService {

    @Autowired
    private JavaMailSender mailSender;

    // Store OTP temporarily
    private Map<String, String> emailOtpMap =
            new HashMap<>();

    private Map<String, String> phoneOtpMap =
            new HashMap<>();

    // ================= EMAIL OTP =================

    public void sendEmailOtp(String email) {

        String otp = generateOtp();

        emailOtpMap.put(email, otp);

        SimpleMailMessage message =
                new SimpleMailMessage();

        message.setTo(email);

        message.setSubject("Email Verification OTP");

        message.setText(

                "Dear User,\n\n"

                        + "Welcome to E-Commerce Application.\n\n"

                        + "Thank you for registering with us.\n\n"

                        + "Your Email Verification OTP is:\n\n"

                        + "OTP : " + otp + "\n\n"

                        + "This OTP is valid for 5 minutes.\n\n"

                        + "Please do not share this OTP with anyone for security reasons.\n\n"

                        + "If you did not request this verification, please ignore this email.\n\n"

                        + "Regards,\n"

                        + "E-Commerce Application Team"
        );

        mailSender.send(message);

        System.out.println(
                "EMAIL OTP: " + otp
        );
    }

    public boolean verifyEmailOtp(
            String email,
            String otp
    ) {

        String storedOtp =
                emailOtpMap.get(email);

        return storedOtp != null &&
                storedOtp.equals(otp);
    }

    // ================= PHONE OTP =================

    public void sendPhoneOtp(String phone) {

        String otp = generateOtp();

        phoneOtpMap.put(phone, otp);

        // Console OTP
        System.out.println(
                "PHONE OTP for "
                        + phone +
                        " : " + otp
        );
    }

    public boolean verifyPhoneOtp(
            String phone,
            String otp
    ) {

        String storedOtp =
                phoneOtpMap.get(phone);

        return storedOtp != null &&
                storedOtp.equals(otp);
    }

    // ================= COMMON =================

    private String generateOtp() {

        Random random = new Random();

        int otp =
                100000 +
                        random.nextInt(900000);

        return String.valueOf(otp);
    }
}