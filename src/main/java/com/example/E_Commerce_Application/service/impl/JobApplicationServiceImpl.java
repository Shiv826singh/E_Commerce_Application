package com.example.E_Commerce_Application.service.impl;

import com.example.E_Commerce_Application.entity.JobApplication;
import com.example.E_Commerce_Application.repository.JobApplicationRepository;
import com.example.E_Commerce_Application.service.JobApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JobApplicationServiceImpl implements JobApplicationService {

    @Autowired
    private JobApplicationRepository repository;

    @Override
    public void saveApplication(JobApplication application) {

        repository.save(application);

    }
}
