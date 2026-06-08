<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>

    <jsp:include page="/components/common_css_js.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body{
            background: linear-gradient(135deg,#6f42c1,#8e44ec);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .box{
            background:white;
            padding:35px;
            border-radius:20px;
            width:450px;
            box-shadow:0 15px 40px rgba(0,0,0,0.25);
        }

        .title{
            color:#6f42c1;
            font-weight:700;
        }

        .btn-purple{
            background:#6f42c1;
            color:white;
        }

        .btn-purple:hover{
            background:#5a32a3;
            color:white;
        }

        .captcha-box{
            font-size:22px;
            font-weight:bold;
            letter-spacing:4px;
            background:#f3f3f3;
            padding:8px 15px;
            border-radius:10px;
            display:inline-block;
            user-select:none;
        }
    </style>
</head>

<body>

<div class="box">

    <h3 class="text-center title mb-4">
        Forgot Password
    </h3>

    <% String error = (String) request.getAttribute("error");
       if(error != null){ %>

        <div class="alert alert-danger text-center">
            <%= error %>
        </div>

    <% } %>

    <form action="/auth/reset-password" method="post">

        <!-- Email -->
        <div class="form-group">
            <label>Email</label>

            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="Enter registered email"
                   required>
        </div>

        <!-- Phone -->
        <div class="form-group">
            <label>Phone Number</label>

            <input type="text"
                   name="phone"
                   class="form-control"
                   placeholder="Enter registered phone"
                   required>
        </div>

        <!-- Send OTP -->
        <button type="button"
                class="btn btn-warning btn-block mb-3"
                onclick="sendOtp()">

            Send OTP

        </button>

        <!-- OTP -->
        <div class="form-group">
            <label>OTP</label>

            <input type="text"
                   name="otp"
                   class="form-control"
                   placeholder="Enter Phone OTP"
                   required>
        </div>

        <!-- Captcha -->
        <div class="form-group">

            <label>Captcha Verification</label>

            <div class="mb-2">

                <span class="captcha-box"
                      id="captchaText"></span>

                <button type="button"
                        class="btn btn-sm btn-light ml-2"
                        onclick="generateCaptcha()">

                    Refresh

                </button>

            </div>

            <input type="hidden"
                   id="generatedCaptcha"
                   name="generatedCaptcha">

            <input type="text"
                   class="form-control"
                   name="captcha"
                   placeholder="Enter Captcha"
                   required>

        </div>

        <!-- New Password -->
        <div class="form-group">

            <label>New Password</label>

            <input type="password"
                   name="newPassword"
                   class="form-control"
                   placeholder="Enter New Password"
                   required>

        </div>

        <!-- Reset Button -->
        <button type="submit"
                class="btn btn-success btn-block">

            Reset Password

        </button>

    </form>

    <div class="text-center mt-3">

        <a href="/user/login"
           style="color:#6f42c1;font-weight:bold;">

            Back to Login

        </a>

    </div>

</div>

<script>

    function sendOtp(){

        let email =
            document.querySelector("input[name='email']").value;

        let phone =
            document.querySelector("input[name='phone']").value;

        if(email === "" || phone === ""){

            Swal.fire(
                "Warning",
                "Please enter Email and Phone first.",
                "warning"
            );

            return;
        }

        fetch(
            "/auth/send-reset-otp?email="
            + encodeURIComponent(email)
            + "&phone="
            + encodeURIComponent(phone),
            {
                method:"POST"
            }
        )
        .then(response => response.text())

        .then(data => {

            if(data === "OTP_SENT"){

                Swal.fire(
                    "Success",
                    "OTP sent successfully.",
                    "success"
                );

            }else{

                Swal.fire(
                    "Error",
                    data,
                    "error"
                );

            }

        })

        .catch(error => {

            Swal.fire(
                "Error",
                "Something went wrong.",
                "error"
            );

        });
    }

    function generateCaptcha(){

        let text = Math.random()
                       .toString(36)
                       .substring(2,7)
                       .toUpperCase();

        document.getElementById("captchaText")
                .innerText = text;

        document.getElementById("generatedCaptcha")
                .value = text;
    }

    generateCaptcha();

</script>

</body>
</html>