<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Change Email</title>

    <jsp:include page="/components/common_css_js.jsp"/>

</head>

<body>

<jsp:include page="/components/navbar.jsp"/>

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body">

            <h3>

                Change Email

            </h3>

            <form action="/user/send-email-otp"
                  method="post">

                <div class="form-group">

                    <label>

                        New Email

                    </label>

                    <input type="email"
                           name="newEmail"
                           class="form-control"
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