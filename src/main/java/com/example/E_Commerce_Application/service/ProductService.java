package com.example.E_Commerce_Application.service;

import com.example.E_Commerce_Application.entity.Category;
import com.example.E_Commerce_Application.entity.Product;
import com.example.E_Commerce_Application.repository.CategoryRepository;
import com.example.E_Commerce_Application.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository repo;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepo;

    public void addProduct(Product product, int categoryId) {
        Optional<Category> optionalCategory = categoryRepo.findById(categoryId);

        if (optionalCategory.isEmpty()) {
            throw new RuntimeException("Invalid Category ID");
        }

        Category category = optionalCategory.get();
        product.setCateg(category);
        repo.save(product);
    }

    public void deleteProduct(int id) {

        if (repo.existsById(id)) {
            repo.deleteById(id);
        } else {
            throw new RuntimeException("Product not found!");
        }
    }
    public long getProductCount() {
        return productRepository.count();
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Page<Product> getAllProductsByPage(int pageNo) {

        Pageable pageable = PageRequest.of(pageNo, 10);

        return productRepository.findAll(pageable);
    }

    // GET PRODUCT BY ID
    public Product getProductById(int id) {

        return repo.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
    }



    // UPDATE PRODUCT
    public void updateProduct(Product product) {

        repo.save(product);
    }

    // ✅ SEARCH PRODUCTS FOR SEARCH BAR THAT IS IN HOME PAGE
    public List<Product> searchProducts(String keyword){

        return productRepository
                .findBypNameContainingIgnoreCase(keyword);
    }
    public List<Object[]> getProductCountByCategory(){
        return productRepository.getProductCountByCategory();
    }
    public List<Product> getLowStockProducts(){
        return productRepository.getLowStockProducts();
    }
}
