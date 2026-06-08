<!-- Here first check if user is login then move to checkout page otherwise redirect to login.jsp page -->
<!-- Its code is in HomeController -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title>Secure Checkout</title>

    <jsp:include page="/components/common_css_js.jsp" />

    <style>

        body{
            background: linear-gradient(to right, #f8f9fa, #eef2ff);
            font-family: 'Segoe UI', sans-serif;
        }

        .checkout-container{
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .checkout-card{
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            background: white;
        }

        .checkout-header{
            background: linear-gradient(135deg,#6f42c1,#8e44ec);
            color: white;
            padding: 30px;
        }

        .checkout-header h2{
            font-weight: 700;
            margin-bottom: 5px;
        }

        .section-title{
            font-size: 22px;
            font-weight: 700;
            color: #6f42c1;
            margin-bottom: 25px;
        }

        .form-label{
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-control{
            border-radius: 12px;
            padding: 14px;
            border: 1px solid #ddd;
            transition: 0.3s;
        }

        .form-control:focus{
            border-color: #6f42c1;
            box-shadow: 0 0 0 0.2rem rgba(111,66,193,0.15);
        }

        .summary-card{
            background: #faf7ff;
            border-radius: 18px;
            padding: 25px;
            border: 1px solid #eee;
        }

        .summary-item{
            display: flex;
            justify-content: space-between;
            margin-bottom: 16px;
            font-size: 16px;
        }

        .total-section{
            border-top: 2px dashed #ddd;
            padding-top: 18px;
            margin-top: 18px;
        }

        .total-price{
            font-size: 28px;
            font-weight: 700;
            color: #198754;
        }

        .payment-box{
            border: 1px solid #ddd;
            border-radius: 14px;
            padding: 15px;
            margin-bottom: 12px;
            transition: 0.3s;
            cursor: pointer;
            background: white;
        }

        .payment-box:hover{
            border-color: #6f42c1;
            background: #f6f0ff;
            transform: translateY(-2px);
        }

        .checkout-btn{
            width: 100%;
            padding: 14px;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            background: linear-gradient(135deg,#6f42c1,#8e44ec);
            border: none;
            transition: 0.3s;
            color: white;
        }

        .checkout-btn:hover{
            transform: scale(1.02);
            box-shadow: 0 6px 18px rgba(111,66,193,0.3);
            color: white;
        }

        .secure-text{
            text-align: center;
            color: gray;
            margin-top: 15px;
            font-size: 14px;
        }

        .badge-custom{
            background: #e9d8fd;
            color: #6f42c1;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />

<div class="container checkout-container">

    <div class="checkout-card">

        <div class="checkout-header d-flex justify-content-between align-items-center">

            <div>
                <h2>Secure Checkout</h2>
                <p class="mb-0">
                    Complete your purchase safely & securely
                </p>
            </div>

            <div>
                <span class="badge-custom">
                    100% Secure Payment
                </span>
            </div>

        </div>

        <div class="card-body p-4 p-md-5">

            <!-- FULL FORM START -->

            <form id="checkoutForm"
                  action="/place-order"
                  method="post">

                <input type="hidden"
                       name="cartData"
                       id="cartData">

                <!-- Razorpay Hidden Fields -->

                <input type="hidden"
                           name="razorpayPaymentId"
                           id="razorpayPaymentId">

                <input type="hidden"
                           name="razorpayOrderId"
                           id="razorpayOrderId">

                <input type="hidden"
                           name="razorpaySignature"
                           id="razorpaySignature">

                <div class="row g-5">

                    <!-- LEFT SECTION -->

                    <div class="col-lg-7">

                        <h4 class="section-title">
                            Billing Information
                        </h4>

                        <div class="row">

                            <div class="col-md-6 mb-4">

                                <label class="form-label">
                                    First Name
                                </label>

                                <input type="text"
                                       name="firstName"
                                       class="form-control"
                                       placeholder="John"
                                       required>

                            </div>

                            <div class="col-md-6 mb-4">

                                <label class="form-label">
                                    Last Name
                                </label>

                                <input type="text"
                                       name="lastName"
                                       class="form-control"
                                       placeholder="Doe">

                            </div>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">
                                Email Address
                            </label>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="john@example.com"
                                   required>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">
                                Phone Number
                            </label>

                            <input type="number"
                                   name="phone"
                                   class="form-control"
                                   placeholder="Enter phone number"
                                   required>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">
                                Shipping Address
                            </label>

                            <textarea rows="4"
                                      name="address"
                                      class="form-control"
                                      placeholder="Enter complete address"
                                      required></textarea>

                        </div>

                        <div class="row">

                            <div class="col-md-4 mb-4">

                                <label class="form-label">
                                    City
                                </label>

                                <input type="text"
                                       name="city"
                                       class="form-control"
                                       placeholder="City"
                                       required>

                            </div>

                            <div class="col-md-4 mb-4">

                                <label class="form-label">
                                    State
                                </label>

                                <input type="text"
                                       name="state"
                                       class="form-control"
                                       placeholder="State"
                                       required>

                            </div>

                            <div class="col-md-4 mb-4">

                                <label class="form-label">
                                    Pincode
                                </label>

                                <input type="number"
                                       name="pincode"
                                       class="form-control"
                                       placeholder="Pincode"
                                       required>

                            </div>

                        </div>

                    </div>

                    <!-- RIGHT SECTION -->

                    <div class="col-lg-5">

                        <div class="summary-card">

                            <h4 class="section-title">
                                Order Summary
                            </h4>

                            <!-- PRODUCTS -->

                            <div id="checkout-items"></div>

                            <hr>

                            <div class="summary-item">

                                <span>Items Total Cost</span>

                                <span id="items-total"></span>

                            </div>

                            <div class="summary-item">

                                <span>Delivery Charges</span>

                                <span id="delivery-charge">
                                    ₹ 99
                                </span>

                            </div>

                            <div class="summary-item">

                                <span>GST (18%)</span>

                                <span id="gst-amount"></span>

                            </div>

                            <div class="total-section">

                                <div class="summary-item total-price">

                                    <span>Total</span>

                                    <span id="final-total"></span>

                                </div>

                            </div>

                            <!-- PAYMENT -->

                            <h5 class="mt-4 mb-3">
                                Select Payment Method
                            </h5>

                            <div class="payment-box">

                                <label class="w-100 d-flex align-items-center">

                                    <input type="radio"
                                           checked
                                           name="paymentMethod"
                                           value="COD"
                                           class="me-2">

                                    Cash On Delivery

                                </label>

                            </div>

                            <div class="payment-box">

                                <label class="w-100 d-flex align-items-center">

                                    <input type="radio"
                                           name="paymentMethod"
                                           value="ONLINE"
                                           class="me-2">

                                    Razorpay / UPI / Debit Card

                                </label>

                            </div>

                            <div class="payment-box">

                                <label class="w-100 d-flex align-items-center">

                                    <input type="radio"
                                           name="paymentMethod"
                                           value="BANKING"
                                           class="me-2">

                                    Internet Banking

                                </label>

                            </div>

                            <!-- BUTTON -->

                            <button type="button"
                                    id="payButton"
                                    class="btn checkout-btn mt-4">

                                Proceed To Payment

                            </button>

                            <div class="secure-text">
                                🔒 Your transaction is secured with SSL encryption
                            </div>

                        </div>

                    </div>

                </div>

            </form>

            <!-- FULL FORM END -->

        </div>

    </div>

</div>

<script>

    let cart =
        JSON.parse(localStorage.getItem("selectedCart")) || [];

    let checkoutItems =
        document.getElementById("checkout-items");

    let total = 0;

    let html = "";

    if(cart.length === 0){

        checkoutItems.innerHTML = `
            <div class="alert alert-warning">
                No items selected
            </div>
        `;

    }else{

        cart.forEach(item => {

            let qty = item.productQuantity;

            let price = item.productPrice;

            let itemTotal = qty * price;

            total += itemTotal;

            html +=

                '<div class="border-bottom pb-2 mb-2">' +

                '<div class="fw-bold">' +
                item.productName +
                '</div>' +

                '<small>' +
                'Qty: ' + qty +
                ' | Price: ₹ ' + itemTotal +
                '</small>' +

                '</div>';

        });

        checkoutItems.innerHTML = html;

        document.getElementById("items-total")
            .innerText = "₹ " + total;

        let gst = Math.round(total * 0.18);

        document.getElementById("gst-amount")
            .innerText = "₹ " + gst;

        let finalTotal = total + gst + 99;

        document.getElementById("final-total")
            .innerText = "₹ " + finalTotal;
    }

  document.getElementById("payButton")
      .addEventListener("click", function () {

          let form =
              document.getElementById("checkoutForm");
          let paymentMethod =
              document.querySelector(
                  "input[name='paymentMethod']:checked"
              ).value;

          let cart =
              localStorage.getItem("selectedCart");

          document.getElementById("cartData").value = cart;

          /*
              COD
          */
          if(paymentMethod === "COD"){

              form.submit();

              return;
          }

          /*
              Razorpay
          */
          let totalAmount =
              total + Math.round(total * 0.18) + 99;

          fetch("/create-razorpay-order",{

              method:"POST",

              headers:{
                  "Content-Type":
                  "application/x-www-form-urlencoded"
              },

              body:
                  "amount=" + totalAmount
          })

          .then(response => response.json())

          .then(data => {

              if(data.error){

                  alert(data.error);

                  return;
              }

              var options = {

                  "key":"${razorpayKeyId}",

                  "amount":
                      data.amount,

                  "currency":
                      data.currency,

                  "name":
                      "Premium E-Commerce",

                  "description":
                      "Order Payment",

                  "order_id":
                      data.id,

                 handler:function(response){

                     document.getElementById(
                         "razorpayPaymentId"
                     ).value =
                         response.razorpay_payment_id;

                     document.getElementById(
                         "razorpayOrderId"
                     ).value =
                         response.razorpay_order_id;

                     document.getElementById(
                         "razorpaySignature"
                     ).value =
                         response.razorpay_signature;

                     document.querySelector(
                         "input[name='paymentMethod']:checked"
                     ).value = "ONLINE";

                     form.submit();
                 },
                  "prefill":{

                      "name":
                          document.getElementsByName("firstName")[0].value,

                      "email":
                          document.getElementsByName("email")[0].value,

                      "contact":
                          document.getElementsByName("phone")[0].value
                  },

                  "theme":{
                      "color":"#6f42c1"
                  }
              };

              var rzp =
                  new Razorpay(options);

              rzp.open();
          })

          .catch(error => {

              console.error(error);

              alert("Payment failed.");
          });

      });

</script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</body>
</html>