package com.cyberlearn.service;

import com.cyberlearn.model.Category;
import com.cyberlearn.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
    
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
}