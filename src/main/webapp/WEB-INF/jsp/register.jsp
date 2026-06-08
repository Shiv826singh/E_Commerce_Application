<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String lang = (String) session.getAttribute("lang");
if (lang == null) lang = "en";
%>

<!DOCTYPE html>
<html data-bs-theme="light">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <jsp:include page="/components/common_css_js.jsp" />

    </head>
    <body class="register-bg">
    <jsp:include page="/components/navbar.jsp" />
        <div class="row mt-2">
            <div class="col-md-6 offset-md-3">
                <div class="card register-card" style="background:rgba(255,255,255,0.95);border-radius:25px;border:none;box-shadow:0 20px 50px rgba(111,66,193,0.35);">
               <%
                   String msg = (String) request.getAttribute("success");
                   if (msg != null) {
               %>

               <div style="background-color:#d4edda; color:#155724; padding:10px; text-align:center; border-radius:5px; margin-bottom:10px;">
                   <%= msg %>
               </div>

               <%
                   }
               %>

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

               <div class="card-body">
                   <div class="text-center">

                       <img src="/img/User1.png"
                            width="170"
                            height="170"
                            style="border-radius:50%; border:5px solid #6f42c1; object-fit:cover; box-shadow:0 10px 30px rgba(111,66,193,0.45);">

                   </div>
                   <h3 class="text-center mt-3"
                       style="
                                color:#6f42c1;
                                font-weight:700;
                                letter-spacing:1px;">
                       <%= lang.equals("hi") ? "यहाँ रजिस्टर करें" : "Create Your Account" %>
                   </h3>
                                  <form action="/auth/send-otp" method="post">
                                      <div class="form-group mb-2">
                                                 <label>User Name</label>
                                                 <input type="text" name="userName" class="form-control custom-input"  placeholder="Enter here" required>
                                      </div>

                                      <div class="form-group mb-2">
                                         <label for="exampleInputEmail1">Email address</label>
                                         <input type="email" name="userEmail" placeholder="Enter here" class="form-control custom-input"  id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                     </div>
                                      <div class="form-group mb-2">
                                          <label>Password:</label>
                                          <input type="password" name="userPassword" class="form-control custom-input"  placeholder="Enter password" required>
                                      </div>
                                      <div class="form-group mb-2">
                                          <label for="phone">Phone Number</label>
                                          <input type="tel" name="userPhone" class="form-control custom-input"  id="phone" placeholder="Enter phone number" required>
                                      </div>
                                      <div class="form-group mb-2">
                                          <label for="address">Address</label>
                                          <textarea class="form-control custom-input" name="userAddress" id="address" rows="3" placeholder="Enter your address" required></textarea>
                                      </div>
                                      <div class="d-flex justify-content-center mt-3">
                                          <button type="submit" class="btn btn-success mr-2" style="width: 120px;">
                                          <%= lang.equals("hi") ? "सबमिट करें" : "Submit" %>
                                          </button>

                                          <button type="reset" class="btn btn-primary" class="btn btn-success mr-2" style="width: 120px;">
                                              <%= lang.equals("hi") ? "रीसेट करें" : "Reset" %>
                                          </button>

                                      </div>

                                 </form>
                                 <div class="text-center mt-3">
                                     <small>
                                         <%= lang.equals("hi") ? "क्या आपका पहले से अकाउंट है?" : "Already have an account?" %>
                                         <a href="/user/login" style="color:#6f42c1; font-weight:bold;">
                                             <%= lang.equals("hi") ? "यहाँ लॉगिन करें" : "Login here" %>
                                         </a>
                                     </small>
                                 </div>
                             </div>

               </div>
             </div>
        </div>
    <jsp:include page="/components/chatbot.jsp" />
    </body>
</html>