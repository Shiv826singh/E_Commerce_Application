package com.example.E_Commerce_Application.controller;

import org.springframework.ui.Model;
import com.example.E_Commerce_Application.entity.JobApplication;
import com.example.E_Commerce_Application.service.JobApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CareerController {

    @Autowired
    private JobApplicationService jobApplicationService;
    @GetMapping("/apply")
    public String showApplyForm(
            @RequestParam String jobRole,
            Model model){

        model.addAttribute(
                "jobRole",
                jobRole);

        return "apply_job";
    }

    @PostMapping("/career/apply")
    public String applyJob(
            @ModelAttribute JobApplication application,
            RedirectAttributes redirectAttributes) {

        jobApplicationService.saveApplication(application);

        redirectAttributes.addFlashAttribute(
                "success",
                "Application submitted successfully!"
        );

        return "redirect:/Careers";
    }
}