<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html data-bs-theme="light">

<head>

    <title>About Us</title>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <jsp:include page="/components/common_css_js.jsp" />

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{
            background:#f4f7fb;
            font-family:'Segoe UI',sans-serif;
            overflow-x:hidden;
        }

        .hero-section{

            min-height:90vh;

            background:
                    linear-gradient(rgba(0,0,0,0.70),
                    rgba(0,0,0,0.70)),

                    url('https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?q=80&w=1600&auto=format&fit=crop');

            background-size:cover;
            background-position:center;

            display:flex;
            align-items:center;
            color:white;
        }

        .hero-title{

            font-size:4rem;
            font-weight:800;
            line-height:1.2;
        }

        .hero-title span{
            color:#a855f7;
        }

        .hero-text{

            font-size:1.2rem;
            color:#ddd;
            line-height:1.9;
            margin-top:20px;
        }

        .hero-btn{

            margin-top:30px;

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            color:white;
            padding:14px 34px;

            border:none;
            border-radius:50px;

            font-weight:600;

            text-decoration:none;

            display:inline-block;

            transition:0.3s;
        }

        .hero-btn:hover{

            transform:translateY(-3px);
            color:white;
        }

        .section-title{

            text-align:center;
            margin-bottom:60px;
        }

        .section-title h2{

            font-size:2.7rem;
            font-weight:800;
            color:#111827;
        }

        .section-title p{

            color:#6b7280;
            max-width:700px;
            margin:auto;
            margin-top:15px;
        }

        .feature-card{

            background:white;

            border-radius:25px;

            padding:40px 30px;

            text-align:center;

            transition:0.4s;

            height:100%;

            box-shadow:0 10px 25px rgba(0,0,0,0.06);
        }

        .feature-card:hover{

            transform:translateY(-10px);

            box-shadow:0 15px 40px rgba(111,66,193,0.18);
        }

        .feature-icon{

            width:90px;
            height:90px;

            margin:auto;
            margin-bottom:25px;

            border-radius:50%;

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            display:flex;
            justify-content:center;
            align-items:center;

            color:white;

            font-size:2rem;
        }

        .feature-card h4{

            font-weight:700;
            margin-bottom:15px;
        }

        .stats-section{

            background:linear-gradient(135deg,#111827,#1f2937);

            color:white;

            padding:80px 0;
        }

        .stat-box{

            text-align:center;
        }

        .stat-box h2{

            font-size:3rem;
            font-weight:800;
            color:#a855f7;
        }

        .developer-section{

            padding:100px 0;
        }

        .developer-card{

            background:white;

            border-radius:30px;

            padding:50px;

            box-shadow:0 15px 40px rgba(0,0,0,0.08);
        }

        .developer-name{

            font-size:2.5rem;
            font-weight:800;
            color:#6a11cb;
        }

        .footer-section{

            background:#111827;

            color:white;

            padding:30px 0;

            text-align:center;
        }

        .premium-badge{

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            color:white;

            display:inline-block;

            padding:8px 18px;

            border-radius:50px;

            font-size:0.9rem;

            margin-bottom:20px;
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />



<!-- HERO SECTION -->

<section class="hero-section">

    <div class="container">

        <div class="row align-items-center">

            <div class="col-md-7">

                <div class="premium-badge">

                    Premium E-Commerce Platform

                </div>

                <h1 class="hero-title">

                    Smart Shopping
                    Experience With
                    <span>Modern Technology</span>

                </h1>

                <p class="hero-text">

                    Our E-Commerce platform delivers a smooth,
                    secure and premium shopping experience
                    with modern UI, fast performance,
                    responsive design and advanced features
                    built using Java Spring Boot technology.

                </p>

                <a href="/"
                   class="hero-btn">

                    Explore Products

                </a>

            </div>

        </div>

    </div>

</section>



<!-- FEATURES -->

<section class="py-5">

    <div class="container">

        <div class="section-title">

            <h2>

                Why Choose Our Platform

            </h2>

            <p>

                We provide high quality shopping solutions
                with professional design and advanced functionality.

            </p>

        </div>

        <div class="row g-4">

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="fa fa-cart-shopping"></i>

                    </div>

                    <h4>

                        Easy Shopping

                    </h4>

                    <p>

                        Simple and user friendly shopping
                        experience with modern cart system.

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="fa fa-shield-halved"></i>

                    </div>

                    <h4>

                        Secure Platform

                    </h4>

                    <p>

                        Secure authentication system and
                        protected user experience.

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="fa fa-bolt"></i>

                    </div>

                    <h4>

                        Fast Performance

                    </h4>

                    <p>

                        Optimized pages with smooth
                        and fast loading experience.

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- STATS -->

<section class="stats-section">

    <div class="container">

        <div class="row">

            <div class="col-md-4">

                <div class="stat-box">

                    <h2>100+</h2>

                    <p>

                        Products

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="stat-box">

                    <h2>24/7</h2>

                    <p>

                        Customer Support

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="stat-box">

                    <h2>99%</h2>

                    <p>

                        User Satisfaction

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- DEVELOPER SECTION -->

<section class="developer-section">

    <div class="container">

        <div class="developer-card">

            <div class="row align-items-center">

                <div class="col-md-8">

                    <h5 class="text-uppercase text-muted">

                        Website Developer

                    </h5>

                    <h2 class="developer-name">

                        Shiv Prakash Singh

                    </h2>

                    <p class="mt-4 text-secondary">

                        This E-Commerce website is designed
                        and developed using modern technologies
                        like Java, Spring Boot, JSP,
                        Bootstrap and MySQL.

                        The project focuses on premium UI,
                        scalability, responsive design,
                        cart management and professional
                        user experience.

                        Developed During Internship at Talking Crooks IT Pvt Ltd

                    </p>

                </div>

                <div class="col-md-4 text-center">

                    <i class="fa fa-code"
                       style="font-size:120px;
                       color:#8e2de2;"></i>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- FOOTER -->

<section class="footer-section">

    <div class="container">

        <h5>

            Premium E-Commerce Website

        </h5>

        <p class="mb-0">

            Developed By Shiv Prakash Singh

        </p>

    </div>

</section>



<jsp:include page="/components/chatbot.jsp" />

</body>

</html>