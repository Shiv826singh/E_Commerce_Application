package com.example.E_Commerce_Application.service;

import com.example.E_Commerce_Application.entity.Category;
import com.example.E_Commerce_Application.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service

public class CategoryService {

    @Autowired
    private CategoryRepository repo;

    public void addCategory(Category category) {
        repo.save(category);
    }

    public void deleteCategory(int id) {

        if (repo.existsById(id)) {
            repo.deleteById(id);
        } else {
            throw new RuntimeException("Category not found!");
        }
    }

    public Optional<Category> getCategoryById(int id) {
        return repo.findById(id);
    }

    public long getCategoryCount() {
        return repo.count();
    }
    public List<Category> getAllCategories() {
        return repo.findAll();
    }
}