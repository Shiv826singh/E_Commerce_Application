<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <title>Verify OTP</title>

    <jsp:include page="/components/common_css_js.jsp" />

    <style>

        body{

            min-height:100vh;

            display:flex;

            justify-content:center;

            align-items:center;
        }

        .otp-card{

            width:450px;

            border:none;

            border-radius:20px;

            background:rgba(255,255,255,0.95);

            box-shadow:
                    0 8px 25px rgba(0,0,0,0.2);

            overflow:hidden;
        }

        .otp-header{

            background:
                    linear-gradient(
                            135deg,
                            #6f42c1,
                            #0d6efd
                    );

            color:white;

            padding:25px;

            text-align:center;
        }

        .otp-header h2{

            font-weight:bold;
        }

        .otp-body{

            padding:30px;
        }

        .custom-input{

            height:50px;

            border-radius:12px;
        }

        .verify-btn{

            height:50px;

            border-radius:12px;

            font-size:18px;

            font-weight:bold;

            transition:0.3s;
        }

        .verify-btn:hover{

            transform:scale(1.02);
        }

        .otp-info{

            font-size:14px;

            color:#666;
        }

    </style>

</head>

<body class="register-bg">

<div class="card otp-card">

    <div class="otp-header">

        <h2>OTP Verification</h2>

        <p>
            Secure Registration Verification
        </p>

    </div>

    <div class="otp-body">

        <%
            String error =
                    (String) request.getAttribute("error");

            if(error != null){
        %>

        <div class="alert alert-danger text-center">

            <%= error %>

        </div>

        <%
            }
        %>

        <form action="/auth/verify-otp"
              method="post">

            <div class="mb-4">

                <label class="fw-bold">

                    Email OTP

                </label>

                <input type="text"

                       name="emailOtp"

                       class="form-control custom-input"

                       placeholder="Enter Email OTP"

                       required>

            </div>

            <div class="mb-4">

                <label class="fw-bold">

                    Mobile OTP

                </label>

                <input type="text"

                       name="phoneOtp"

                       class="form-control custom-input"

                       placeholder="Enter Mobile OTP"

                       required>

                <div class="otp-info mt-2">

                    Mobile OTP is available in console for testing.

                </div>

            </div>

            <button class="btn btn-primary w-100 verify-btn">

                Verify & Complete Registration

            </button>

        </form>

    </div>

</div>

</body>

</html>