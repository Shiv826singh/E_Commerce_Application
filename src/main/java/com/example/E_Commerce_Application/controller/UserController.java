package com.example.E_Commerce_Application.controller;

import com.example.E_Commerce_Application.repository.UserRepository;
import com.example.E_Commerce_Application.service.OtpService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.E_Commerce_Application.entity.User;
import com.example.E_Commerce_Application.service.UserService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OtpService otpService;

    @GetMapping("/register")
    public String showRegisterPage() {

        return "register";   // register.jsp
    }


    @GetMapping("/login")
    public String showLoginPage() { // http://localhost:8080/user/login
        return "login";
    }
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {

        if (userService.isEmailExist(user.getUserEmail())) {
            redirectAttributes.addFlashAttribute("error", "Email already exists!");
            return "redirect:/user/register";
        }

        userService.registerUser(user);

        redirectAttributes.addFlashAttribute("success", "Registration Successful!");

        return "redirect:/user/register";
    }


    @PostMapping("/login")
    public String loginUser(@RequestParam("userEmail") String email,
                            @RequestParam("userPassword") String password,
                            HttpServletRequest request,
                            RedirectAttributes redirectAttributes) {

        User user = userService.loginUser(email, password);

        // ❌ invalid user
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "Invalid Email or Password!");
            return "redirect:/user/login";
        }

        // ✅ VERY IMPORTANT (session में user save करो)
        request.getSession().setAttribute("current-user", user);

        // ✅ check user type
        if (user.getUserType().equals("admin")) {
            return "redirect:/admin";   // admin.jsp    http://localhost:8080/admin    to access admin page
        } else {
            return "redirect:/?category=all";   // Home page with all products
        }
    }

    @GetMapping("/setLang")
    public String setLanguage(@RequestParam String lang,
                              HttpServletRequest request) {

        // session me language save
        request.getSession().setAttribute("lang", lang);

        // previous page ka URL nikaalo
        String referer = request.getHeader("Referer");

        // agar null ho to default page
        if (referer == null) {
            return "redirect:/";
        }

        // same page pe wapas bhejo
        return "redirect:" + referer;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {

        request.getSession().invalidate();  // session destroy

        return "redirect:/user/login";
    }

    @PostMapping("/update-profile")
    public String updateProfile(

            @RequestParam String userName,

            @RequestParam String userAddress,

            HttpServletRequest request

    ) {

        User user =
                (User) request
                        .getSession()
                        .getAttribute("current-user");

        if(user == null){

            return "redirect:/login";
        }

        user.setUserName(userName);

        user.setUserAddress(userAddress);

        userRepository.save(user);

        request.getSession()
                .setAttribute("current-user",
                        user);

        request.getSession()
                .setAttribute("successMessage",
                        "Profile Updated Successfully!!");

        return "redirect:/";
    }

    @GetMapping("/change-email")
    public String changeEmailPage(HttpServletRequest request) {

        User user =
                (User) request.getSession()
                        .getAttribute("current-user");

        if(user == null){

            return "redirect:/login";
        }

        return "change_email";
    }

    @PostMapping("/send-email-otp")
    public String sendEmailOtp(

            @RequestParam String newEmail,

            HttpServletRequest request

    ) {

        otpService.sendEmailOtp(newEmail);

        request.getSession()
                .setAttribute("pendingEmail",
                        newEmail);

        return "redirect:/user/verify-email";
    }
    @GetMapping("/verify-email")
    public String verifyEmailPage(HttpServletRequest request){

        if(request.getSession()
                .getAttribute("pendingEmail") == null){

            return "redirect:/";
        }

        return "verify_email";
    }

    @PostMapping("/verify-email")
    public String verifyEmail(

            @RequestParam String otp,

            HttpServletRequest request

    ) {

        String email =
                (String) request.getSession()
                        .getAttribute("pendingEmail");

        User user =
                (User) request.getSession()
                        .getAttribute("current-user");

        if(email == null || user == null){

            return "redirect:/login";
        }

        boolean verified =
                otpService.verifyEmailOtp(
                        email,
                        otp
                );

        if(!verified){

            request.getSession()
                    .setAttribute("successMessage",
                            "Invalid OTP");

            return "redirect:/user/verify-email";
        }

        user.setUserEmail(email);

        user.setEmailVerified(true);

        userRepository.save(user);

        request.getSession()
                .setAttribute("current-user",
                        user);

        request.getSession()
                .removeAttribute("pendingEmail");

        request.getSession()
                .setAttribute("successMessage",
                        "Email Updated Successfully");

        return "redirect:/";
    }

    @GetMapping("/change-phone")
    public String changePhonePage(HttpServletRequest request){

        User user =
                (User) request.getSession()
                        .getAttribute("current-user");

        if(user == null){

            return "redirect:/login";
        }

        return "change_phone";
    }

    @PostMapping("/send-phone-otp")
    public String sendPhoneOtp(

            @RequestParam String newPhone,

            HttpServletRequest request

    ) {

        otpService.sendPhoneOtp(newPhone);

        request.getSession()
                .setAttribute(
                        "pendingPhone",
                        newPhone
                );

        return "redirect:/user/verify-phone";
    }

    @GetMapping("/verify-phone")
    public String verifyPhonePage(
            HttpServletRequest request
    ){

        if(request.getSession()
                .getAttribute("pendingPhone")
                == null){

            return "redirect:/";
        }

        return "verify_phone";
    }

    @PostMapping("/verify-phone")
    public String verifyPhone(

            @RequestParam String otp,

            HttpServletRequest request

    ) {

        String phone =
                (String) request.getSession()
                        .getAttribute("pendingPhone");

        User user =
                (User) request.getSession()
                        .getAttribute("current-user");

        if(phone == null || user == null){

            return "redirect:/login";
        }

        boolean verified =
                otpService.verifyPhoneOtp(
                        phone,
                        otp
                );

        if(!verified){

            request.getSession()
                    .setAttribute(
                            "successMessage",
                            "Invalid OTP"
                    );

            return "redirect:/user/verify-phone";
        }

        user.setUserPhone(phone);

        user.setPhoneVerified(true);

        userRepository.save(user);

        request.getSession()
                .setAttribute(
                        "current-user",
                        user
                );

        request.getSession()
                .removeAttribute("pendingPhone");

        request.getSession()
                .setAttribute(
                        "successMessage",
                        "Phone Updated Successfully"
                );

        return "redirect:/";
    }

}
