<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html data-bs-theme="light">

<head>

    <title>Apply for Job</title>

    <jsp:include page="/components/common_css_js.jsp"/>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{
            background:linear-gradient(135deg,#6a11cb,#8e2de2);
            min-height:100vh;
            font-family:'Segoe UI',sans-serif;
        }

        .apply-container{
            padding:60px 15px;
        }

        .apply-card{

            background:rgba(255,255,255,0.95);

            border-radius:30px;

            overflow:hidden;

            box-shadow:0 20px 50px rgba(0,0,0,0.25);
        }

        .left-panel{

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            color:white;

            padding:50px;
            height:100%;
        }

        .left-panel h2{

            font-weight:800;

            margin-bottom:25px;
        }

        .left-panel p{

            line-height:1.8;
            opacity:0.9;
        }

        .right-panel{

            padding:50px;
        }

        .form-control{

            border-radius:12px;

            height:50px;

            margin-bottom:20px;
        }

        .apply-btn{

            width:100%;

            border:none;

            padding:14px;

            border-radius:12px;

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            color:white;

            font-weight:700;

            transition:.3s;
        }

        .apply-btn:hover{

            transform:translateY(-3px);

            box-shadow:0 10px 20px rgba(106,17,203,0.4);
        }

        .icon-box{

            width:70px;
            height:70px;

            border-radius:50%;

            background:rgba(255,255,255,0.2);

            display:flex;

            align-items:center;
            justify-content:center;

            font-size:30px;

            margin-bottom:25px;
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp"/>

<div class="container apply-container">

    <div class="row justify-content-center">

        <div class="col-lg-10">

            <div class="apply-card">

                <div class="row no-gutters">

                    <!-- LEFT -->

                    <div class="col-md-5">

                        <div class="left-panel">

                            <div class="icon-box">

                                <i class="fa fa-briefcase"></i>

                            </div>

                            <h2>

                                Join Our Team

                            </h2>

                            <p>

                                Thank you for your interest in joining our company.

                                We are looking for passionate individuals who want
                                to build innovative solutions and grow their careers.

                            </p>

                            <p>

                                Please fill out the application form carefully.

                            </p>

                        </div>

                    </div>


                    <!-- RIGHT -->

                    <div class="col-md-7">

                        <div class="right-panel">

                            <h3 class="mb-4">

                                Apply Now

                            </h3>


                            <% if(request.getAttribute("error") != null){ %>

                            <div class="alert alert-danger">

                                <%= request.getAttribute("error") %>

                            </div>

                            <% } %>


                            <form action="/career/apply"
                                  method="post">

                                <input type="text"
                                       name="fullName"
                                       class="form-control"
                                       placeholder="Full Name"
                                       required>


                                <input type="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="Email Address"
                                       required>


                                <input type="text"
                                       name="phone"
                                       class="form-control"
                                       placeholder="Phone Number"
                                       required>


                                <input type="text"
                                       name="jobRole"
                                       class="form-control"
                                       value="${jobRole}"
                                       readonly>


                                <input type="url"
                                       name="cvFile"
                                       class="form-control"
                                       placeholder="Google Drive / LinkedIn / Portfolio Link"
                                       required>


                                <button type="submit"
                                        class="apply-btn">

                                    Submit Application

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/components/chatbot.jsp"/>

</body>

</html>