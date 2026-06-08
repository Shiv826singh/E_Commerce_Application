<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.E_Commerce_Application.entity.Product" %>
<%@ page import="com.example.E_Commerce_Application.entity.User" %>
<%@ page import="com.example.E_Commerce_Application.helper.Helper" %>

<%
    User user = (User) session.getAttribute("current-user");

    if(user == null){
        response.sendRedirect("/login");
        return;
    }

    List<Product> products =
            (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>View Products</title>

    <jsp:include page="/components/common_css_js.jsp"/>

    <style>

        body{
            background: #f4f7fc;
            font-family: 'Segoe UI', sans-serif;
        }

        .dashboard-header{
            background: linear-gradient(135deg,#0f172a,#1e293b);
            color: white;
            border-radius: 18px;
            padding: 30px;
            margin-top: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .dashboard-header h2{
            font-weight: 700;
        }

        .search-box{
            background: white;
            border-radius: 14px;
            padding: 18px;
            margin-top: 20px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .search-input{
            border-radius: 12px;
            height: 48px;
        }

        .product-card{
            border: none;
            border-radius: 18px;
            overflow: hidden;
            transition: 0.3s;
            background: white;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            height: 100%;
        }

        .product-card:hover{
            transform: translateY(-6px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.15);
        }

        .product-img{
            width: 100%;
            height: 230px;
            object-fit: contain;
            background: #fff;
            padding: 10px;
        }

        .price{
            color: #0d6efd;
            font-size: 22px;
            font-weight: 700;
        }

        .discount{
            background: #198754;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 13px;
        }

        .card-title{
            font-size: 20px;
            font-weight: 700;
        }

        .product-desc{
            color: #6c757d;
            font-size: 14px;
            min-height: 60px;
        }

        .action-btn{
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
        }

        .empty-box{
            background: white;
            border-radius: 18px;
            padding: 60px;
            text-align: center;
            margin-top: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp"/>

<div class="container py-4">

    <!--To show alert message-->

    <%
        String msg = (String) session.getAttribute("msg");

        if(msg != null){
    %>

    <div class="alert alert-info text-center font-weight-bold">

        <%= msg %>

    </div>

    <%
            session.removeAttribute("msg");
        }
    %>



    <!-- HEADER -->

    <div class="dashboard-header">

        <div class="d-flex justify-content-between align-items-center flex-wrap">

            <div>

                <h2>
                    <i class="fa fa-shopping-bag"></i>
                    Product Management
                </h2>

                <p class="mb-0">
                    View, search and manage all products.
                </p>

            </div>

            <div>

                <a href="/admin"
                   class="btn btn-light font-weight-bold">

                    <i class="fa fa-arrow-left"></i>
                    Back To Admin

                </a>

            </div>

        </div>

    </div>


    <!-- SEARCH -->

    <div class="search-box">

        <div class="input-group">

            <div class="input-group-prepend">
                <span class="input-group-text bg-white">
                    <i class="fa fa-search"></i>
                </span>
            </div>

            <input type="text"
                   id="searchProduct"
                   class="form-control search-input"
                   placeholder="Search products..."
                   onkeyup="searchProducts()">

        </div>

    </div>


    <!-- PRODUCTS -->

    <div class="row mt-4" id="productContainer">

        <%
            if(products != null && !products.isEmpty()){

                for(Product p : products){
        %>

        <div class="col-lg-3 col-md-4 col-sm-6 mb-4 product-item">

            <div class="card product-card">

                <!-- PRODUCT IMAGE -->

                <img src="<%= p.getpPhoto() %>"
                     class="product-img"
                     alt="<%= p.getpName() %>">


                <div class="card-body d-flex flex-column">

                    <!-- PRICE -->

                    <div class="d-flex justify-content-between align-items-center mb-2">

                        <span class="price">

                            ₹ <%= p.getPriceAfterApplyingDiscount() %>

                        </span>

                        <span class="discount">

                            <%= p.getpDiscount() %>% OFF

                        </span>

                    </div>

                    <!-- TITLE -->

                    <h5 class="card-title product-name">

                        <%= p.getpName() %>

                    </h5>

                    <!-- DESCRIPTION -->

                    <p class="product-desc">

                        <%= Helper.get10Words(p.getpDesc()) %>

                    </p>

                    <!-- BUTTONS -->

                    <div class="mt-auto">

                        <div class="d-grid gap-2">

                            <!-- EDIT -->

                            <a href="/admin/edit-product/<%= p.getpId() %>"
                               class="btn btn-primary btn-sm">

                                Edit

                            </a>


                            <!-- DELETE -->

                            <form action="/admin/remove-product/<%= p.getpId() %>"
                                  method="post">

                                <button type="submit"
                                        class="btn btn-danger btn-sm">

                                    Delete

                                </button>

                            </form>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <%
            }

        } else {
        %>

        <!-- EMPTY -->

        <div class="col-12">

            <div class="empty-box">

                <i class="fa fa-box fa-4x text-secondary mb-3"></i>

                <h3>No Products Available</h3>

                <p class="text-muted">
                    Add products from admin dashboard.
                </p>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>


<!-- SEARCH SCRIPT -->

<script>

    function searchProducts() {

        let input =
            document.getElementById("searchProduct")
                .value
                .toLowerCase();

        let products =
            document.getElementsByClassName("product-item");

        for(let i = 0; i < products.length; i++){

            let name =
                products[i]
                    .querySelector(".product-name")
                    .innerText
                    .toLowerCase();

            if(name.includes(input)){

                products[i].style.display = "";

            } else {

                products[i].style.display = "none";
            }
        }
    }

</script>

</body>
</html>