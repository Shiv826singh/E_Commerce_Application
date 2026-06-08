package com.example.E_Commerce_Application.controller;

import com.example.E_Commerce_Application.entity.Product;
import com.example.E_Commerce_Application.entity.User;
import com.example.E_Commerce_Application.repository.UserRepository;
import com.example.E_Commerce_Application.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import com.example.E_Commerce_Application.entity.Category;
import com.example.E_Commerce_Application.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/testview")
    public String testView() {
        return "login";
    }

    @GetMapping("/Careers")
    public String Careers() {
        return "Careers";
    }

    @GetMapping("/normal")
    public String normal() {
        return "normal";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @PostMapping("/update-location")
    public String updateLocation(
            @RequestParam String city,
            @RequestParam String pincode,
            HttpSession session){

        User user =
                (User) session.getAttribute("current-user");

        if(user == null){
            return "redirect:/login";
        }

        user.setCity(city);
        user.setPincode(pincode);

        userRepository.save(user);

        session.setAttribute(
                "current-user",
                user);

        return "redirect:/";
    }





    @GetMapping("/cart-review")
    public String cartReview(HttpSession session, Model model) {
        User user = (User) session.getAttribute("current-user");

        // 🔒 security check
        if (user == null) {
            // If no user is logged in, redirect to login page
            return "redirect:/login";
        }

        // If user is logged in, allow checkout
        return "cart-review";
    }

    @Value("${razorpay.key.id}")
    private String razorpayKeyId;
    @GetMapping("/checkout")
    public String checkoutPage(HttpSession session,
                               Model model) {

        User user =
                (User) session.getAttribute("current-user");

        if(user == null){
            return "redirect:/login";
        }

        model.addAttribute(
                "razorpayKeyId",
                razorpayKeyId
        );

        return "checkout";
    }
    @GetMapping("/view_products")
    public String viewProducts(HttpSession session, Model model) {

        User user = (User) session.getAttribute("current-user");

        if (user == null) {
            return "redirect:/login";
        }

        List<Product> products = productService.getAllProducts();

        model.addAttribute("products", products);

        return "view_products";
    }




   /* @GetMapping("/")
    public String homePage(
            @RequestParam(value = "category", required = false) String catId, // 👈 category parameter
            Model model) {

        List<Category> cList = categoryService.getAllCategories(); // DB se fetch
        List<Product> allProducts = productService.getAllProducts(); // 👈 products (all)

        List<Product> list = new ArrayList<>(); // 👈 filtered list

        // 👇 filter logic
        if (catId == null || catId.equals("all")) {
            list = allProducts; // 👉 sabhi products
        } else {
            int cid = Integer.parseInt(catId);

            for (Product p : allProducts) {
                if (p.getCateg().getCategoryId() == cid) {
                    list.add(p); // 👉 selected category ke products
                }
            }
        }

        model.addAttribute("cList", cList);  // JSP me bhej diya
        model.addAttribute("list", list); // 👈 JSP को भेजा (filtered)

        return "index";  // index.jsp
    }
  */


    @GetMapping("/")
    public String homePage(

            @RequestParam(value = "category", required = false)
            String catId,

            @RequestParam(value = "page",
                    defaultValue = "1")
            int page,

            // ✅ SEARCH PARAMETER
            @RequestParam(value = "keyword",
                    required = false)
            String keyword,

            Model model) {

        // ================= CATEGORY =================

        List<Category> cList =
                categoryService.getAllCategories();

        // ================= PRODUCTS =================

        List<Product> allProducts;

        // ✅ SEARCH LOGIC
        if(keyword != null &&
                !keyword.trim().isEmpty()){

            allProducts =
                    productService.searchProducts(keyword);

        }else{

            allProducts =
                    productService.getAllProducts();
        }

        // ============================================

        List<Product> filteredProducts =
                new ArrayList<>();

        // ================= CATEGORY FILTER =================

        if (catId == null ||
                catId.equals("all")) {

            filteredProducts = allProducts;

        } else {

            int cid = Integer.parseInt(catId);

            for (Product p : allProducts) {

                if (p.getCateg()
                        .getCategoryId() == cid) {

                    filteredProducts.add(p);
                }
            }
        }

        // ================= PAGINATION =================

        int productsPerPage = 12;

        int totalProducts =
                filteredProducts.size();

        int totalPages =
                (int) Math.ceil(
                        (double) totalProducts
                                / productsPerPage
                );

        // PAGE VALIDATION

        if (page < 1) {

            page = 1;
        }

        if (page > totalPages &&
                totalPages != 0) {

            page = totalPages;
        }

        // START + END INDEX

        int start =
                (page - 1) * productsPerPage;

        int end =
                Math.min(
                        start + productsPerPage,
                        totalProducts
                );

        // CURRENT PAGE PRODUCTS

        List<Product> list =
                filteredProducts.subList(start, end);

        // ================= SEND DATA TO JSP =================

        model.addAttribute("cList", cList);

        model.addAttribute("list", list);

        model.addAttribute("currentPage", page);

        model.addAttribute("totalPages", totalPages);

        model.addAttribute("selectedCategory", catId);

        // ✅ SEND SEARCH KEYWORD
        model.addAttribute("keyword", keyword);

        return "index";
    }

}
