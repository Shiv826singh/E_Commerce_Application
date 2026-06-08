<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String lang = (String) session.getAttribute("lang");
if (lang == null) lang = "en";
%>
<html data-bs-theme="light">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Login - Ecommerce</title>
    <jsp:include page="/components/common_css_js.jsp" />
</head>
<body class="login-bg">
  <jsp:include page="/components/navbar.jsp" />
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card"
                style="
                background: linear-gradient(
                135deg,
                rgba(255,255,255,0.96),
                rgba(245,240,255,0.96)
                );
                border-radius:25px;
                border:none;
                box-shadow:0 15px 40px rgba(111,66,193,0.35);
                overflow:hidden;">

                   <%
                   String error = (String) request.getAttribute("error");
                   if (error != null) {
                   %>
                       <div style="color:white;background:red;padding:10px;text-align:center;">
                           <%= error %>
                       </div>
                   <%
                   }
                   %>



                  <div class="card-body text-center">

                      <img src="/img/logimg.jpeg"
                           width="140px"
                           class="mb-1"/>

                      <h3 style="
                                 color:#6f42c1;
                                 font-weight:700;
                                  margin-bottom:10px;">
                          <%= lang.equals("hi") ? "यहाँ लॉगिन करें" : "Login Here !!" %>
                      </h3>

                    <form action="/user/login" method="post">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="userEmail" required>
                       <small id="emailHelp" class="form-text text-muted">
                           <%= lang.equals("hi")
                               ? "हम आपका ईमेल किसी के साथ साझा नहीं करेंगे।"
                               : "We'll never share your email with anyone else." %>
                       </small>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="userPassword" required>
                      </div>

                      <div class="container text-center">
                      <button type="submit" class="btn btn-primary">
                      <%= lang.equals("hi") ? "सबमिट करें" : "Submit" %>
                      </button>

                      <button type="reset" class="btn btn-primary">
                          <%= lang.equals("hi") ? "रीसेट करें" : "Reset" %>
                      </button>

                      </div>
                    </form>
                    <div class="text-center mt-3">
                        <small>
                            <%= lang.equals("hi") ? "क्या आपका अकाउंट नहीं है?" : "Don't have an account?" %>
                            <a href="/user/register" style="color:#6f42c1; font-weight:bold;">
                                <%= lang.equals("hi") ? "यहाँ रजिस्टर करें" : "Register here" %>
                            </a>
                        </small>
                    </div>
                    <div class="text-center mt-2">

                        <a href="/auth/forgot-password"
                           style="
                               color:#dc3545;
                               font-weight:600;
                               text-decoration:none;">

                            <i class="fa fa-key"></i>

                            <%= lang.equals("hi")
                                ? "पासवर्ड भूल गए?"
                                : "Forgot Password?" %>

                        </a>

                    </div>



                </div>



             </div>
            </div>
        </div>
    </div>
     <jsp:include page="/components/chatbot.jsp" />

     <!--To show a Alert in Login page, when password Updated Successful-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%
String success = (String) session.getAttribute("success");

if(success != null){
%>

<script>
Swal.fire({
    icon: 'success',
    title: 'Success',
    text: '<%= success %>',
    confirmButtonColor: '#6f42c1'
});
</script>

<%
session.removeAttribute("success");
}
%>



</body>
</html>
