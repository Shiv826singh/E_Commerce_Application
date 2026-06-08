<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.E_Commerce_Application.entity.Order" %>
<%@ page import="com.example.E_Commerce_Application.entity.OrderItem" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Order order = (Order) request.getAttribute("order");

    SimpleDateFormat sdf =
            new SimpleDateFormat("dd MMM yyyy hh:mm a");
%>

<html>
<head>

    <title>Order Placed Successfully</title>

    <meta charset="UTF-8">

    <jsp:include page="/components/common_css_js.jsp" />

    <style>

        body{
            background: linear-gradient(to right,#eef2ff,#f8f9fa);
            font-family: 'Segoe UI', sans-serif;
        }

        .success-container{
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .success-card{
            background: white;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 12px 35px rgba(0,0,0,0.08);
        }

        .top-section{
            background: linear-gradient(135deg,#198754,#28c76f);
            color: white;
            text-align: center;
            padding: 45px 20px;
        }

        .check-circle{
            width: 100px;
            height: 100px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 55px;
            margin-bottom: 20px;
        }

        .top-section h1{
            font-weight: 700;
            margin-bottom: 10px;
        }

        .top-section p{
            font-size: 17px;
            opacity: 0.95;
        }

        .content-section{
            padding: 40px;
        }

        .section-title{
            font-size: 22px;
            font-weight: 700;
            color: #6f42c1;
            margin-bottom: 20px;
        }

        .info-box{
            background: #faf7ff;
            border-radius: 18px;
            padding: 25px;
            border: 1px solid #eee;
            margin-bottom: 30px;
        }

        .info-item{
            display: flex;
            justify-content: space-between;
            margin-bottom: 14px;
            font-size: 16px;
        }

        .info-item strong{
            color: #444;
        }

        .product-box{
            border: 1px solid #eee;
            border-radius: 16px;
            padding: 18px;
            margin-bottom: 15px;
            transition: 0.3s;
        }

        .product-box:hover{
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
        }

        .product-name{
            font-size: 18px;
            font-weight: 600;
            color: #222;
        }

        .amount{
            font-weight: 700;
            color: #198754;
            font-size: 18px;
        }

        .summary-card{
            background: #f8f9ff;
            border-radius: 18px;
            padding: 25px;
            border: 1px solid #eee;
        }

        .summary-item{
            display: flex;
            justify-content: space-between;
            margin-bottom: 14px;
            font-size: 17px;
        }

        .final-total{
            font-size: 28px;
            font-weight: 700;
            color: #198754;
        }

        .status-badge{
            background: #d1ffe4;
            color: #198754;
            padding: 8px 18px;
            border-radius: 30px;
            font-weight: 600;
            display: inline-block;
        }

        .btn-home{
            background: linear-gradient(135deg,#6f42c1,#8e44ec);
            color: white;
            border: none;
            padding: 14px 30px;
            border-radius: 12px;
            font-weight: 700;
            font-size: 17px;
            transition: 0.3s;
        }

        .btn-home:hover{
            transform: scale(1.03);
            color: white;
            box-shadow: 0 8px 20px rgba(111,66,193,0.25);
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />

<div class="container success-container">

    <div class="success-card">

        <!-- TOP SECTION -->

        <div class="top-section">

            <div class="check-circle">
                ✓
            </div>

            <h1>Order Placed Successfully</h1>

            <p>
                Thank you for shopping with us.
                Your order has been confirmed.
            </p>

        </div>

        <!-- CONTENT -->

        <div class="content-section">

            <div class="row">

                <!-- LEFT -->

                <div class="col-lg-7">

                    <h3 class="section-title">
                        Customer Details
                    </h3>

                    <div class="info-box">

                        <div class="info-item">
                            <strong>Name</strong>
                            <span>
                                <%= order.getFirstName() %>
                                <%= order.getLastName() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Email</strong>
                            <span>
                                <%= order.getEmail() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Phone</strong>
                            <span>
                                <%= order.getPhone() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Address</strong>
                            <span>
                                <%= order.getAddress() %>,
                                <%= order.getCity() %>,
                                <%= order.getState() %> -
                                <%= order.getPincode() %>
                            </span>
                        </div>

                    </div>

                    <h3 class="section-title">
                        Ordered Products
                    </h3>

                    <%
                        for(OrderItem item : order.getOrderItems()){
                    %>

                    <div class="product-box">

                        <div class="d-flex justify-content-between">

                            <div>

                                <div class="product-name">
                                    <%= item.getProductName() %>
                                </div>

                                <small class="text-muted">
                                    Quantity :
                                    <%= item.getQuantity() %>
                                </small>

                            </div>

                            <div class="amount">
                                ₹ <%= item.getPrice() %>
                            </div>

                        </div>

                    </div>

                    <%
                        }
                    %>

                </div>

                <!-- RIGHT -->

                <div class="col-lg-5">

                    <div class="summary-card">

                        <h3 class="section-title">
                            Order Summary
                        </h3>

                        <div class="info-item">
                            <strong>Order ID</strong>
                            <span>
                                <%= order.getOrderId() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Order Date</strong>
                            <span>
                                <%= sdf.format(order.getOrderDate()) %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Shipping Date</strong>
                            <span>
                                <%= order.getShippingDate() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Payment Method</strong>
                            <span>
                                <%= order.getPaymentMethod() %>
                            </span>
                        </div>

                        <div class="info-item">
                            <strong>Payment Status</strong>
                            <span class="status-badge">
                                <%= order.getPaymentStatus() %>
                            </span>
                        </div>

                        <hr>

                        <div class="summary-item">
                            <span>Items Total</span>
                            <span>
                                ₹ <%= order.getItemsTotal() %>
                            </span>
                        </div>

                        <div class="summary-item">
                            <span>GST (18%)</span>
                            <span>
                                ₹ <%= order.getGst() %>
                            </span>
                        </div>

                        <div class="summary-item">
                            <span>Delivery Charge</span>
                            <span>
                                ₹ <%= order.getDeliveryCharge() %>
                            </span>
                        </div>

                        <hr>

                        <div class="summary-item final-total">
                            <span>Total</span>
                            <span>
                                ₹ <%= order.getFinalAmount() %>
                            </span>
                        </div>

                        <div class="text-center mt-4">

                            <a href="/?category=all"
                               class="btn btn-home">

                                Continue Shopping

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>