<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Verify Phone</title>

    <jsp:include page="/components/common_css_js.jsp"/>

</head>

<body>

<jsp:include page="/components/navbar.jsp"/>

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body">

            <h3>

                Verify Phone OTP

            </h3>

            <form action="/user/verify-phone"
                  method="post">

                <div class="form-group">

                    <label>

                        Enter OTP

                    </label>

                    <input type="text"
                           name="otp"
                           class="form-control"
                           required>

                </div>

                <button class="btn btn-success">

                    Verify OTP

                </button>

            </form>

        </div>

    </div>

</div>

</body>

</html>