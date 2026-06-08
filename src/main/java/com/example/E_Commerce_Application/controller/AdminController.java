package com.example.E_Commerce_Application.controller;

import com.example.E_Commerce_Application.entity.User;
import jakarta.servlet.http.HttpSession;
import com.cloudinary.Cloudinary;
import org.springframework.ui.Model;
import com.example.E_Commerce_Application.entity.Category;
import com.example.E_Commerce_Application.entity.Product;
import com.example.E_Commerce_Application.repository.UserRepository;
import com.example.E_Commerce_Application.service.CategoryService;
import com.example.E_Commerce_Application.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private Cloudinary cloudinary;

    // ✅ ADD CATEGORY
    @PostMapping("/add-category")
    public String addCategory(@ModelAttribute Category category,
                              HttpSession session) {

        try {
            categoryService.addCategory(category);
            session.setAttribute("msg", "✅ Category added successfully!");
        } catch (Exception e) {
            session.setAttribute("msg", "❌ " + e.getMessage());
        }

        return "redirect:/admin";
    }







    // ❌ REMOVE CATEGORY
    @PostMapping("/delete-category")
    public String deleteCategory(@RequestParam("categoryId") int id,
                                 HttpSession session) {

        try {
            categoryService.deleteCategory(id);
            session.setAttribute("msg", "✅ Category removed successfully!");
        } catch (Exception e) {
            session.setAttribute("msg", "❌ " + e.getMessage());
        }

        return "redirect:/admin";
    }





     //ADD PRODUCT
     @PostMapping("/add-product")
     public String addProduct(
             @RequestParam("pName") String name,
             @RequestParam("pPrice") int price,
             @RequestParam("pDiscount") int discount,
             @RequestParam("pQuantity") int quantity,
             @RequestParam("pDesc") String desc,
             @RequestParam("categoryId") int categoryId,
             @RequestParam("pPhoto") MultipartFile file,
             HttpSession session) {   // ✅ ADD THIS

         try {

             // ✅ STEP 1: validate category FIRST
             Category category = categoryService.getCategoryById(categoryId)
                     .orElseThrow(() -> new RuntimeException("Invalid Category"));

             // ✅ STEP 2: file validation
             if (file.isEmpty()) throw new RuntimeException("Image required");
             if (!file.getContentType().startsWith("image/")) throw new RuntimeException("Only image allowed");
             if (file.getSize() > 2 * 1024 * 1024) throw new RuntimeException("Max 2MB");

             // ✅ STEP 3: upload to cloudinary
             Map uploadResult = cloudinary.uploader().upload(
                     file.getBytes(),
                     Map.of("folder", "ecommerce/products")
             );

             String imageUrl = uploadResult.get("secure_url").toString();

             // ✅ STEP 4: create product
             Product product = new Product();
             product.setpName(name);
             product.setpPrice(price);
             product.setpDiscount(discount);
             product.setpQuantity(quantity);
             product.setpDesc(desc);
             product.setpPhoto(imageUrl);

             // ✅ STEP 5: save product
             productService.addProduct(product, categoryId);

             // ✅ SUCCESS MESSAGE
             session.setAttribute("msg", "✅ Product added successfully!");

         } catch (Exception e) {
             e.printStackTrace();

             // ❌ ERROR MESSAGE
             session.setAttribute("msg", "❌ " + e.getMessage());
         }

         return "redirect:/admin";
     }





    // ❌ REMOVE PRODUCT
    @PostMapping("/delete-product")
    public String deleteProduct(@RequestParam("pId") int id,
                                HttpSession session) {

        try {
            productService.deleteProduct(id);
            session.setAttribute("msg", "✅ Product removed successfully!");
        } catch (Exception e) {
            session.setAttribute("msg", "❌ " + e.getMessage());
        }

        return "redirect:/admin";
    }




    // ✅ ADMIN PAGE
    @GetMapping("")
    public String adminPage(HttpSession session, Model model) {

        User user = (User) session.getAttribute("current-user");

        // 🔒 security check
        if (user == null || !user.getUserType().equals("admin")) {
            return "redirect:/login";
        }

        long userCount = userRepository.count();
        long categoryCount = categoryService.getCategoryCount();
        long productCount = productService.getProductCount();

        model.addAttribute("userCount", userCount);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("productCount", productCount);

        return "admin";   // ❗ IMPORTANT (NO redirect)
    }

    @GetMapping("/chart-data")
    @ResponseBody
    public Map<String, Object> chartData() {

        List<Object[]> data =
                productService.getProductCountByCategory();

        List<String> labels =
                new ArrayList<>();

        List<Long> values =
                new ArrayList<>();

        for (Object[] row : data) {

            labels.add(row[0].toString());

            values.add((Long) row[1]);
        }

        Map<String, Object> map =
                new HashMap<>();

        map.put("labels", labels);

        map.put("values", values);

        return map;
    }




    @PostMapping("/remove-product/{id}")
    public String removeProduct(@PathVariable int id,
                                HttpSession session) {

        try {

            productService.deleteProduct(id);

            session.setAttribute("msg",
                    "✅ Product deleted successfully!");

        } catch (Exception e) {

            session.setAttribute("msg",
                    "❌ " + e.getMessage());
        }

        return "redirect:/view_products";
    }

    @GetMapping("/edit-product/{id}")
    public String editProductPage(@PathVariable int id,
                                  Model model) {

        Product product = productService.getProductById(id);

        List<Category> categories =
                categoryService.getAllCategories();

        model.addAttribute("product", product);
        model.addAttribute("categories", categories);

        return "edit_product";
    }

    @PostMapping("/update-product")
    public String updateProduct(
            @RequestParam("pId") long id,
            @RequestParam("pName") String name,
            @RequestParam("pPrice") int price,
            @RequestParam("pDiscount") int discount,
            @RequestParam("pQuantity") int quantity,
            @RequestParam("pDesc") String desc,
            @RequestParam("categoryId") int categoryId,
            HttpSession session) {

        try {

            Product product =
                    productService.getProductById((int) id);

            product.setpName(name);
            product.setpPrice(price);
            product.setpDiscount(discount);
            product.setpQuantity(quantity);
            product.setpDesc(desc);

            Category category =
                    categoryService.getCategoryById(categoryId)
                            .orElseThrow(() ->
                                    new RuntimeException("Category not found"));

            product.setCateg(category);

            productService.updateProduct(product);

            session.setAttribute("msg",
                    "✅ Product updated successfully!");

        } catch (Exception e) {

            session.setAttribute("msg",
                    "❌ " + e.getMessage());
        }

        return "redirect:/view_products";
    }


    @GetMapping("/low-stock-data")
    @ResponseBody
    public Map<String, Object> lowStockData() {

        List<Product> products =
                productService.getLowStockProducts();

        List<String> labels =
                new ArrayList<>();

        List<Integer> values =
                new ArrayList<>();

        for(Product p : products){

            String name = p.getpName();

            if(name.length() > 20){
                name = name.substring(0,20) + "...";
            }

            labels.add(name);

            values.add(p.getpQuantity());
        }

        Map<String,Object> map =
                new HashMap<>();

        map.put("labels", labels);
        map.put("values", values);

        return map;
    }
}
