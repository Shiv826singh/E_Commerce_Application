# 🛒 E-Commerce Application

A full-stack, production-ready **E-Commerce Web Application** built using **Java Spring Boot**, designed to provide a seamless online shopping experience for customers while offering powerful administrative controls for managing products, categories, orders, and users.

The application follows a layered architecture and integrates modern third-party services such as **Razorpay**, **Cloudinary**, and **Email Services** to simulate a real-world e-commerce ecosystem.

---

## 📌 Project Overview

This project enables customers to browse products, manage their shopping cart, place orders using multiple payment methods, track order history, and update their profiles securely. It also provides a comprehensive admin dashboard for inventory and category management.

The system focuses on:

- Secure user authentication
- OTP-based verification
- Real-time order processing
- Online payment integration
- Cloud-based image storage
- Responsive user experience
- Scalable backend architecture

---

## ✨ Key Features

### 👤 User Management

- User Registration and Login System
- Session-Based Authentication
- Role-Based Access Control (Admin/User)
- User Logout Functionality
- Profile Update System
- Change Email with OTP Verification
- Change Phone Number with OTP Verification
- Forgot Password with OTP Verification
- CAPTCHA-Based Password Reset Protection

---

### 🔐 OTP Verification System

- Email OTP Verification
- Phone OTP Verification
- OTP Validation during Registration
- OTP-Based Password Recovery
- OTP-Based Email Update
- OTP-Based Phone Update

---

### 🛍 Product Management

#### Customer Features

- Browse Products
- Product Search Functionality
- Category-Based Product Filtering
- Product Pagination
- Product Details Display
- Responsive Product Listing

#### Admin Features

- Add New Products
- Edit Existing Products
- Delete Products
- Upload Product Images
- Low Stock Monitoring
- Product Inventory Management

---

### 📂 Category Management

- Create Categories
- View Categories
- Delete Categories
- Assign Products to Categories
- Category-Based Product Organization

---

### 🛒 Shopping Cart

- Add Products to Cart
- Quantity Management
- Remove Items from Cart
- Local Storage Based Cart Persistence
- Cart Review Before Checkout
- Multi-Item Checkout Support

---

### 💳 Checkout & Payment System

#### Cash on Delivery (COD)

- Place Orders Using COD
- Automatic Order Creation
- Pending Payment Status Handling

#### Razorpay Integration

- Secure Online Payments
- UPI Support
- Credit Card Payments
- Debit Card Payments
- Net Banking Support
- Razorpay Order Creation
- Razorpay Payment ID Storage
- Razorpay Order ID Storage
- Razorpay Signature Tracking
- Payment Status Updates

---

### 📦 Order Management

- Place Orders
- Generate Unique Order IDs (UUID)
- Store Complete Shipping Information
- Store Order Items
- Order Summary Generation
- View My Orders
- Cancel Orders
- Shipping Date Estimation
- Payment Status Tracking
- Order Status Tracking
- Order Success Confirmation Page

---

### 📧 Email Notification System

- Order Confirmation Emails
- Automated Email Delivery
- Customer Notification Support

---

### ☁️ Cloud Image Management

Integrated with **Cloudinary** for cloud-based image handling.

Features include:

- Product Image Upload
- Secure Image URLs
- Cloud Storage
- Optimized Media Delivery

---

### 📊 Admin Dashboard

Provides insights and operational controls including:

- Total User Count
- Total Category Count
- Total Product Count
- Category-wise Product Distribution Charts
- Low Stock Analytics
- Product Management Controls

---

### 🔍 Search & Filtering

- Keyword-Based Product Search
- Category Filtering
- Combined Search and Filter Support
- Paginated Results

---

### 🔒 Security Features

- Session-Based Authentication
- Access Restriction for Admin Routes
- Protected Checkout Process
- OTP Verification Layers
- CAPTCHA Validation
- Secure Payment Gateway Integration

---

## 🏗 Architecture

The application follows a layered architecture:

```text
Controller Layer
        ↓
Service Layer
        ↓
Repository Layer
        ↓
Database Layer
```

This architecture promotes:

- Separation of Concerns
- Maintainability
- Scalability
- Easier Testing and Debugging

---

## 🛠 Technologies Used

### Backend

- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- Hibernate
- Maven

### Frontend

- JSP
- HTML5
- CSS3
- Bootstrap
- JavaScript<img width="1920" height="1080" alt="Screenshot (1137)" src="https://github.com/user-attachments/assets/41ebf37a-7ea8-4116-830f-388c33f84642" />
<img width="1920" height="1080" alt="Screenshot (1136)" src="https://github.com/user-attachments/assets/757bbf04-67f8-49ab-b65e-4b1b476941dd" />
<img width="1920" height="1080" alt="Screenshot (1135)" src="https://github.com/user-attachments/assets/235a2fba-e2f8-4877-8fcf-c4c4d30351d6" />
<img width="1920" height="1080" alt="Screenshot (1134)" src="https://github.com/user-attachments/assets/85ca36ce-f197-47e5-8a5f-bc67ea83c2e0" />
<img width="1920" height="1080" alt="Screenshot (1133)" src="https://github.com/user-attachments/assets/786033e5-5ca3-485b-8975-0f01edf547f1" />
<img width="1920" height="1080" alt="Screenshot (1132)" src="https://github.com/user-attachments/assets/e5932e9a-5cba-46ac-a7d9-d71c5d652ba0" />
<img width="1920" height="1080" alt="Screenshot (1131)" src="https://github.com/user-attachments/assets/611391f4-fbc6-4ecd-9dbe-91b55b837a97" />
<img width="1920" height="1080" alt="Screenshot (1130)" src="https://github.com/user-attachments/assets/776f0de5-7a87-4b3a-b395-1b4e3081620b" />
<img width="1920" height="1080" alt="Screenshot (1129)" src="https://github.com/user-attachments/assets/ed17ebcd-b7b2-4887-9362-66ccbb26eda6" />
<img width="1920" height="1080" alt="Screenshot (1128)" src="https://github.com/user-attachments/assets/e7835592-58f0-4781-aed4-8110e55f9865" />
<img width="1920" height="1080" alt="Screenshot (1127)" src="https://github.com/user-attachments/assets/f662bc0c-2647-41dc-9f82-bd1332d3557c" />
<img width="1920" height="1080" alt="Screenshot (1126)" src="https://github.com/user-attachments/assets/9eedbcd2-371c-49ed-8918-413086d9ae69" />
<img width="1920" height="1080" alt="Screenshot (1125)" src="https://github.com/user-attachments/assets/77302042-82f7-4587-955c-5c77342e96f8" />
<img width="1920" height="1080" alt="Screenshot (1124)" src="https://github.com/user-attachments/assets/4d9eb21f-617a-4e34-930c-a6277a9eccde" />
<img width="1920" height="1080" alt="Screenshot (1123)" src="https://github.com/user-attachments/assets/7f8646f2-fe1f-4150-8fc8-302f63428a44" />
<img width="1920" height="1080" alt="Screenshot (1122)" src="https://github.com/user-attachments/assets/0a8842d9-70c0-48b0-a4fc-4ca59734e1cc" />
<img width="1920" height="1080" alt="Screenshot (1121)" src="https://github.com/user-attachments/assets/b01ae1b8-d769-4689-bea6-a9e26affa60c" />
<img width="1920" height="1080" alt="Screenshot (1120)" src="https://github.com/user-attachments/assets/576dae60-83c5-4a6a-907b-9f6b0c88efc0" />
<img width="1920" height="1080" alt="Screenshot (1119)" src="https://github.com/user-attachments/assets/cdc183d7-8cff-474d-b7a2-a394fa8b098e" />
<img width="1920" height="1080" alt="Screenshot (1118)" src="https://github.com/user-attachments/assets/7677e6f1-4b14-4672-ba70-2d20682817b4" />
<img width="1920" height="1080" alt="Screenshot (1117)" src="https://github.com/user-attachments/assets/d4888105-8a5b-4777-97fc-7a22980f6f4e" />
<img width="1920" height="1080" alt="Screenshot (1116)" src="https://github.com/user-attachments/assets/c0eebe01-4fc2-474d-98df-9c7413feabcd" />
<img width="1920" height="1080" alt="Screenshot (1115)" src="https://github.com/user-attachments/assets/71c18600-8a8a-4017-931b-bdbe4225bd58" />
<img width="1920" height="1080" alt="Screenshot (1114)" src="https://github.com/user-attachments/assets/7fdf7efb-d95f-4b23-98bf-5de74ddc4f23" />
<img width="1920" height="1080" alt="Screenshot (1113)" src="https://github.com/user-attachments/assets/c9492931-94d0-47f7-9e30-4fae24e00a7f" />
<img width="1920" height="1080" alt="Screenshot (1112)" src="https://github.com/user-attachments/assets/35c557de-244e-41e6-a469-a1a89feca8fe" />
<img width="1920" height="1080" alt="Screenshot (1111)" src="https://github.com/user-attachments/assets/412c44e3-57dd-4993-914c-4a8e1e7e04cb" />
<img width="1920" height="1080" alt="Screenshot (1110)" src="https://github.com/user-attachments/assets/bb99ce24-4630-4562-b0fc-b71c28a3a014" />
<img width="1920" height="1080" alt="Screenshot (1109)" src="https://github.com/user-attachments/assets/8efd421b-4f13-4259-87a3-b4c75f1b6f9b" />
<img width="1920" height="1080" alt="Screenshot (1108)" src="https://github.com/user-attachments/assets/23a5fff0-002f-47bc-a172-19bb663015a7" />
<img width="1920" height="1080" alt="Screenshot (1107)" src="https://github.com/user-attachments/assets/7fcf9386-a271-45df-aaaa-3fd27bc42c8e" />
<img width="1920" height="1080" alt="Screenshot (1106)" src="https://github.com/user-attachments/assets/e1bf1ada-f2ee-46eb-ad82-7c29d5e1518d" />
<img width="1920" height="1080" alt="Screenshot (1105)" src="https://github.com/user-attachments/assets/cafc08a3-d4b1-4ca5-948d-9b7c36369746" />
<img width="1920" height="1080" alt="Screenshot (1104)" src="https://github.com/user-attachments/assets/18734854-35da-4d30-a0b9-1dde60b90c8b" />
<img width="1920" height="1080" alt="Screenshot (1103)" src="https://github.com/user-attachments/assets/2c5b61ef-a87f-4155-b1bd-3679e83926ef" />
<img width="1920" height="1080" alt="Screenshot (1102)" src="https://github.com/user-attachments/assets/72771963-a492-4682-9ddb-3e6ff589e794" />
<img width="1920" height="1080" alt="Screenshot (1101)" src="https://github.com/user-attachments/assets/3a7922e6-3cee-4ec9-a3f6-4f822c5a773f" />
<img width="1920" height="1080" alt="Screenshot (1100)" src="https://github.com/user-attachments/assets/c6a8b125-9408-49b2-94cf-c8acba4f4896" />
<img width="1920" height="1080" alt="Screenshot (1099)" src="https://github.com/user-attachments/assets/b9451e2f-894b-4d54-88a3-c279c5655622" />
<img width="1920" height="1080" alt="Screenshot (1098)" src="https://github.com/user-attachments/assets/c35718dd-bea4-436f-a0c7-6190b1edead6" />
<img width="1920" height="1080" alt="Screenshot (1097)" src="https://github.com/user-attachments/assets/91d8c33d-211b-45d3-9222-3ed0d8ec11f6" />
<img width="1920" height="1080" alt="Screenshot (1096)" src="https://github.com/user-attachments/assets/226d6c71-5b56-479a-8216-3acf604a8666" />
<img width="1920" height="1080" alt="Screenshot (1095)" src="https://github.com/user-attachments/assets/4683d9be-5da9-4b62-bbc6-a94142f05f5a" />
<img width="1920" height="1080" alt="Screenshot (1094)" src="https://github.com/user-attachments/assets/44689e86-5960-4c6d-afec-975e378d4056" />
<img width="1920" height="1080" alt="Screenshot (1093)" src="https://github.com/user-attachments/assets/440b4928-725c-4b6b-8ff1-4abc1ffa1e76" />
<img width="1920" height="1080" alt="Screenshot (1092)" src="https://github.com/user-attachments/assets/b32bc09b-1fcc-4441-af2f-4afee41b6c9a" />


### Database

- MySQL

### Authentication & Security

- HTTP Session Management
- OTP Verification
- CAPTCHA Validation

### Payment Gateway

- Razorpay

### Cloud Services

- Cloudinary

### Email Services

- JavaMail Sender

### JSON Processing

- Gson
- org.json

### Build & Dependency Management

- Maven

### Version Control

- Git
- GitHub

### Deployment

- Render
- Railway

---

## 📈 Project Highlights

- ✅ Full-Stack E-Commerce Solution
- ✅ Production-Oriented Architecture
- ✅ Real Payment Gateway Integration
- ✅ OTP-Based Verification System
- ✅ Cloud Image Upload Support
- ✅ Order Tracking & Management
- ✅ Admin Analytics Dashboard
- ✅ Responsive User Interface
- ✅ UUID-Based Order Processing
- ✅ Deployment Ready

---

## 🚀 Future Enhancements

- Product Reviews and Ratings
- Wishlist Functionality
- Coupon & Discount Engine
- Real-Time Order Tracking
- Invoice PDF Generation
- Admin Sales Reports
- Multi-Vendor Marketplace Support
- JWT & Spring Security Integration
- Docker and Kubernetes Deployment
- Progressive Web App (PWA) Support

---

## 👨‍💻 Developer

**Shiv Prakash Singh**

Java Full-Stack Developer passionate about building scalable, secure, and user-centric web applications using modern technologies and industry best practices.

> *"Transforming ideas into reliable software solutions through clean architecture, secure integrations, and continuous learning."*

---

## ⭐ If you found this project useful, please consider giving it a star on GitHub.
