<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Change Phone</title>

    <jsp:include page="/components/common_css_js.jsp"/>

</head>

<body>

<jsp:include page="/components/navbar.jsp"/>

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body">

            <h3>

                Change Phone Number

            </h3>

            <form action="/user/send-phone-otp"
                  method="post">

                <div class="form-group">

                    <label>

                        New Mobile Number

                    </label>

                    <input type="text"
                           name="newPhone"
                           class="form-control"
                           maxlength="10"
                           required>

                </div>

                <button class="btn btn-primary">

                    Send OTP

                </button>

            </form>

        </div>

    </div>

</div>

</body>

</html>