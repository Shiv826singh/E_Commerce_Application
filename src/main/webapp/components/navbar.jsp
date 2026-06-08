<%
com.example.E_Commerce_Application.entity.User user =
    (com.example.E_Commerce_Application.entity.User) session.getAttribute("current-user");
%> <!-- बिना इसके user == null कभी सही काम नहीं करेगा। -->


<!-- To show Successfull messege When user Update MyProfile -->
<%
String success =
(String) session.getAttribute("successMessage");

if(success != null){
%>

<div class="alert alert-success text-center mb-0" id="successAlert">

    <%= success %>

</div>

<%
session.removeAttribute("successMessage");
}
%>




<style>

.profile-header{

    background: linear-gradient(135deg,#6f42c1,#8e44ec);

    color:white;

    border-radius:15px 15px 0 0;

    padding:20px;
}

.profile-body{

    background:#fafafa;

    padding:30px;
}

.premium-input{

    border-radius:12px;

    padding:12px;

    border:1px solid #ddd;

    transition:0.3s;
}

.premium-input:focus{

    border-color:#6f42c1;

    box-shadow:0 0 10px rgba(111,66,193,0.2);
}

.premium-save-btn{

    width:100%;

    padding:12px;

    border:none;

    border-radius:12px;

    color:white;

    font-weight:600;

    background:linear-gradient(135deg,#6f42c1,#8e44ec);

    transition:0.3s;
}

.premium-save-btn:hover{

    transform:translateY(-2px);

    box-shadow:0 5px 15px rgba(111,66,193,0.3);

    color:white;
}

#profileModal .modal-content{

    border:none;

    border-radius:18px;

    overflow:hidden;

    box-shadow:0 10px 35px rgba(0,0,0,0.15);
}

</style>








<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #6f42c1;">
    <a class="navbar-brand d-flex align-items-center"
       href="/">

        <img src="/img/logo.png"
             width="45px"
             class="me-2">

        <span class="fw-bold">
        ECommerce
    </span>

    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">

        <!-- Left side -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/about">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/Careers">Careers</a>
            </li>


        </ul>

        <!-- Right side -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown ml-2">
                <a class="nav-link dropdown-toggle text-white" href="#" data-toggle="dropdown">
                    Language
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="/user/setLang?lang=en">English</a>
                    <a class="dropdown-item" href="/user/setLang?lang=hi">Hindi</a>
                </div>
            </li>


            <li class="navbar-nav ml-auto">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 20px;"></i><span class="ml-0 cart-items">( 0 )</span></a>
            </li>

                <!-- 🌙 Dark/Light Toggle Button -->
            <li class="nav-item">
                <button onclick="toggleTheme()" class="theme-btn ml-2" style="border:none;outline:none;cursor:pointer;">
                    Dark / Light
                </button>
            </li>

           <%
               if(user == null){

           %>
           <!-- ❌ if Not logged in -->
            <li class="nav-item">
                  <a class="nav-link" href="/user/login">Login</a>
            </li>

            <li class="nav-item">
                   <a class="nav-link" href="/register">Register</a>
             </li>

            <%
                 } else {

            %>

             <!-- ✅ if user is Logged in -->

            <li class="nav-item">
                <a class="nav-link" href="/my-orders">

                    <i class="fa fa-shopping-bag"></i>

                    My Orders

                </a>
            </li>

             <li class="nav-item">

                 <a class="nav-link"
                    href="#"
                    data-toggle="modal"
                    data-target="#profileModal">

                     Welcome, <%= user.getUserName() %>

                 </a>

             </li>

             <li class="nav-item">
                   <a class="nav-link" href="/user/logout">Logout</a>
             </li>

             <%
                }
             %>


        </ul>

    </div>

    <%
    if(user != null){
    %>

    <div class="modal fade"
         id="profileModal"
         tabindex="-1">

        <div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header profile-header">

               <div>

                   <h4 class="mb-0">
                       <i class="fa fa-user-circle mr-2"></i>
                       My Profile
                   </h4>

                   <small>
                       Manage your account details
                   </small>

               </div>

               <button type="button"
                       class="close text-white"
                       data-dismiss="modal">

                   &times;

               </button>

           </div>

                <form action="/user/update-profile"
                      method="post">

                    <div class="modal-body profile-body">

                        <div class="text-center mb-4">

                            <div style="
                                 width:80px;
                                 height:80px;
                                 border-radius:50%;
                                 background:#6f42c1;
                                 color:white;
                                 font-size:35px;
                                 line-height:80px;
                                 margin:auto;">

                                <%= user.getUserName().substring(0,1).toUpperCase() %>

                            </div>

                            <h5 class="mt-2">

                                <%= user.getUserName() %>

                            </h5>

                        </div>

                        <div class="form-group">

                            <label>Name</label>

                            <input type="text"
                                   class="form-control premium-input"
                                   name="userName"
                                   value="<%= user.getUserName() %>"
                                   required>

                        </div>

                        <div class="form-group">

                            <label>Address</label>

                            <textarea class="form-control premium-input"
                                      rows="4"
                                      name="userAddress"
                                      required><%= user.getUserAddress()==null?"":user.getUserAddress() %></textarea>

                        </div>

                        <div class="form-group">

                            <label>Email</label>

                            <div class="input-group">

                                <input type="text"
                                       class="form-control premium-input"
                                       value="<%= user.getUserEmail() %>"
                                       readonly>

                                <div class="input-group-append">

                                    <a href="/user/change-email"
                                       class="btn btn-warning">

                                        Change

                                    </a>

                                </div>

                            </div>

                            <small>

                                Status :

                                <% if(user.isEmailVerified()){ %>

                                    <span class="text-success">

                                        Verified

                                    </span>

                                <% } else { %>

                                    <span class="text-danger">

                                        Not Verified

                                    </span>

                                <% } %>

                            </small>

                        </div>

                        <div class="form-group">

                            <label>Phone Number</label>

                            <div class="input-group">

                                <input type="text"
                                       class="form-control premium-input"
                                       value="<%= user.getUserPhone() %>"
                                       readonly>

                                <div class="input-group-append">

                                    <a href="/user/change-phone"
                                       class="btn btn-warning">

                                        Change

                                    </a>

                                </div>

                            </div>

                            <small>

                                Status :

                                <% if(user.isPhoneVerified()){ %>

                                    <span class="text-success">
                                        Verified
                                    </span>

                                <% } else { %>

                                    <span class="text-danger">
                                        Not Verified
                                    </span>

                                <% } %>

                            </small>

                        </div>

                    </div>

                    <div class="modal-footer">

                        <button class="btn premium-save-btn">

                            <i class="fa fa-save mr-2"></i>

                            Save Changes

                        </button>

                    </div>

                </form>
                </div>

            </div>

        </div>

    </div>

    <%
    }
    %>


<script>

    setTimeout(function(){

        let alertBox =
                document.getElementById("successAlert");

        if(alertBox){

            alertBox.style.display = "none";

        }

    },5000);

</script>


</nav>