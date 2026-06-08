package com.example.E_Commerce_Application.repository;

import com.example.E_Commerce_Application.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {


    Page<Product> findAll(Pageable pageable);
    // ✅ SEARCH BAR METHOD IN HOME PAGE
    List<Product> findBypNameContainingIgnoreCase(String keyword);

    @Query("""
           SELECT p.categ.categoryTitle,
                  COUNT(p)
           FROM Product p
           GROUP BY p.categ.categoryTitle
           """)
    List<Object[]> getProductCountByCategory();
    @Query("""
       SELECT p
       FROM Product p
       WHERE p.pQuantity <= 10
       ORDER BY p.pQuantity ASC
       """)
    List<Product> getLowStockProducts();
}
