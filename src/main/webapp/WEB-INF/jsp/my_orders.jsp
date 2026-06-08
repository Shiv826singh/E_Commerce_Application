<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%@ page import="com.example.E_Commerce_Application.dto.OrderDTO" %>

<%@ page import="com.example.E_Commerce_Application.dto.OrderItemDTO" %>

<%
    List<OrderDTO> orders =
            (List<OrderDTO>) request.getAttribute("orders");
%>

<html>

<head>

    <title>My Orders</title>

    <jsp:include page="/components/common_css_js.jsp" />

    <style>

        body{
            background:#f5f6fa;
            font-family:Segoe UI;
        }

        .order-card{

            background: linear-gradient(135deg, #ffffff, #f8fbff);

            border-left: 8px solid #0d6efd;

            border-radius: 22px;

            padding: 28px;

            margin-bottom: 30px;

            box-shadow: 0 10px 30px rgba(0,0,0,0.08);

            transition: all 0.3s ease;
        }

        .order-card:hover{

            transform: translateY(-6px);

            box-shadow: 0 14px 35px rgba(0,0,0,0.15);
        }

        .product-box{

            background:#f9fafc;

            border:1px solid #e3e6ea;

            border-radius:14px;

            padding:18px;

            margin-top:12px;

            transition:0.3s;
        }

        .product-box:hover{

            background:#eef5ff;
        }

        .status{

            padding:7px 16px;

            border-radius:20px;

            font-size:14px;

            font-weight:600;
        }

        .success{

            background:#d1f7df;

            color:#0f8a43;
        }

        .pending{

            background:#fff4d6;

            color:#b78103;
        }

        body{

            background: linear-gradient(to right, #eef2f7, #f8fbff);

            font-family: Segoe UI;
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />

<div class="container mt-5">

    <h2 class="mb-4">

        My Orders

    </h2>

    <%

        if(orders == null || orders.isEmpty()){

    %>

    <div class="alert alert-warning">

        No Orders Found

    </div>

    <%

    }else{

        for(OrderDTO order : orders){

    %>

    <div class="order-card">

        <div class="d-flex justify-content-between">

            <div>

                <h5>

                    Order ID:
                    <%= order.getOrderId() %>

                </h5>

                <small class="text-muted">

                    <%= order.getOrderDate() %>

                </small>

            </div>

            <div>

                <span class="status success">

                    <%= order.getOrderStatus() %>

                </span>

            </div>

        </div>

        <hr>

        <h6>

            Payment Method:
            <%= order.getPaymentMethod() %>

        </h6>

        <h6>

            Payment Status:
            <%= order.getPaymentStatus() %>

        </h6>

        <h6>

            Shipping Date:
            <%= order.getShippingDate() %>

        </h6>

        <hr>

        <h5>

            Ordered Products

        </h5>

        <%

            for(OrderItemDTO item :
                    order.getOrderItems()){

        %>

        <div class="product-box">

            <div class="d-flex justify-content-between">

                <div>

                    <strong>

                        <%= item.getProductName() %>

                    </strong>

                    <br>

                    Quantity:
                    <%= item.getQuantity() %>

                </div>

                <div>

                    ₹ <%= item.getPrice() %>

                </div>

            </div>

        </div>

        <%

            }

        %>

        <hr>

        <div class="d-flex justify-content-between align-items-center">

            <div>

                <h5>
                    Total Amount
                </h5>

                <h4 class="text-success">
                    ₹ <%= order.getTotalAmount() %>
                </h4>

            </div>

            <div>

                <form action="/cancel-order/<%= order.getOrderId() %>"
                      method="post">

                    <button type="submit"
                            class="btn btn-danger"
                            onclick="return confirm('Are you sure to cancel this order?')">

                        Cancel Order

                    </button>

                </form>

            </div>

        </div>

    </div>

    <%

            }

        }

    %>

</div>

</body>

</html>