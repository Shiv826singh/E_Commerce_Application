package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobApplicationRepository
        extends JpaRepository<JobApplication, Long> {

}