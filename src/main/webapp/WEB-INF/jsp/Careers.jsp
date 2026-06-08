<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html data-bs-theme="light">

<head>

    <title>Careers</title>

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

        .career-hero{

            min-height:85vh;

            background:
                    linear-gradient(rgba(0,0,0,0.72),
                    rgba(0,0,0,0.72)),

                    url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d?q=80&w=1600&auto=format&fit=crop');

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

            max-width:700px;
        }

        .hero-btn{

            margin-top:30px;

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            border:none;

            color:white;

            padding:14px 35px;

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

            font-size:2.8rem;

            font-weight:800;

            color:#111827;
        }

        .section-title p{

            color:#6b7280;

            margin-top:15px;

            max-width:700px;

            margin-left:auto;
            margin-right:auto;
        }

        .benefit-card{

            background:white;

            border-radius:25px;

            padding:40px 30px;

            text-align:center;

            height:100%;

            transition:0.4s;

            box-shadow:0 10px 30px rgba(0,0,0,0.06);
        }

        .benefit-card:hover{

            transform:translateY(-10px);

            box-shadow:0 20px 40px rgba(111,66,193,0.15);
        }

        .benefit-icon{

            width:90px;
            height:90px;

            margin:auto;
            margin-bottom:25px;

            border-radius:50%;

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            display:flex;
            align-items:center;
            justify-content:center;

            color:white;

            font-size:2rem;
        }

        .benefit-card h4{

            font-weight:700;

            margin-bottom:15px;
        }

        .job-section{

            background:#111827;

            padding:100px 0;
        }

        .job-card{

            background:white;

            border-radius:25px;

            padding:35px;

            margin-bottom:30px;

            transition:0.4s;

            box-shadow:0 10px 25px rgba(0,0,0,0.08);
        }

        .job-card:hover{

            transform:translateY(-8px);
        }

        .job-badge{

            background:#ede9fe;

            color:#6a11cb;

            padding:8px 18px;

            border-radius:50px;

            font-size:0.9rem;

            font-weight:600;

            display:inline-block;

            margin-bottom:20px;
        }

        .apply-btn{

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            border:none;

            color:white;

            padding:12px 28px;

            border-radius:12px;

            font-weight:600;

            text-decoration:none;

            display:inline-block;

            transition:0.3s;
        }

        .apply-btn:hover{

            transform:translateY(-2px);

            color:white;
        }

        .culture-section{

            padding:100px 0;
        }

        .culture-box{

            background:white;

            border-radius:30px;

            padding:60px;

            box-shadow:0 15px 35px rgba(0,0,0,0.08);
        }

        .developer-highlight{

            background:linear-gradient(135deg,#6a11cb,#8e2de2);

            color:white;

            border-radius:25px;

            padding:50px;

            margin-top:60px;
        }

        .footer-section{

            background:#111827;

            color:white;

            text-align:center;

            padding:30px 0;
        }

    </style>

</head>

<body>

<jsp:include page="/components/navbar.jsp" />



<!-- HERO SECTION -->

<section class="career-hero">

    <div class="container">

        <div class="row">

            <div class="col-md-8">

                <h1 class="hero-title">

                    Build Your Future
                    With Our
                    <span>Creative Team</span>

                </h1>

                <p class="hero-text">

                    Join our modern E-Commerce company and work on
                    innovative technologies, premium user experiences
                    and scalable digital solutions.

                    We believe in creativity, teamwork and growth.

                </p>

                <a href="#jobs"
                   class="hero-btn">

                    Explore Careers

                </a>

            </div>

        </div>

    </div>

</section>



<!-- BENEFITS -->

<section class="py-5">

    <div class="container">

        <div class="section-title">

            <h2>

                Why Work With Us

            </h2>

            <p>

                We provide a collaborative environment
                where innovation and career growth go together.

            </p>

        </div>

        <div class="row g-4">

            <div class="col-md-4">

                <div class="benefit-card">

                    <div class="benefit-icon">

                        <i class="fa fa-laptop-code"></i>

                    </div>

                    <h4>

                        Modern Technologies

                    </h4>

                    <p>

                        Work with Java, Spring Boot,
                        MySQL, Bootstrap and modern tools.

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="benefit-card">

                    <div class="benefit-icon">

                        <i class="fa fa-chart-line"></i>

                    </div>

                    <h4>

                        Career Growth

                    </h4>

                    <p>

                        Learn from real projects and
                        grow your professional skills rapidly.

                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="benefit-card">

                    <div class="benefit-icon">

                        <i class="fa fa-users"></i>

                    </div>

                    <h4>

                        Amazing Team

                    </h4>

                    <p>

                        Collaborate with passionate developers
                        and creative thinkers.

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- JOBS -->

<section class="job-section"
         id="jobs">

    <div class="container">

        <div class="section-title text-white">

            <h2 class="text-white">

                Current Openings

            </h2>

            <p class="text-light">

                Explore exciting opportunities and
                become part of our growing team.

            </p>

        </div>



        <div class="job-card">

            <div class="job-badge">

                Full Time

            </div>

            <h3>

                Java Spring Boot Developer

            </h3>

            <p class="text-muted mt-3">

                Build scalable backend systems,
                REST APIs and E-Commerce features
                using Spring Boot and MySQL.

            </p>

            <div class="mt-4">

                <a href="/apply?jobRole=Java Spring Boot Developer"
                   class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>



        <div class="job-card">

            <div class="job-badge">

                Internship

            </div>

            <h3>

                Frontend Developer Intern

            </h3>

            <p class="text-muted mt-3">

                Work on responsive UI designs
                using Bootstrap, JSP and JavaScript.

            </p>

            <div class="mt-4">

                <a href="/apply?jobRole=Frontend Developer Intern"
                   class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>



        <div class="job-card">

            <div class="job-badge">

                Remote

            </div>

            <h3>

                UI / UX Designer

            </h3>

            <p class="text-muted mt-3">

                Create premium user interfaces
                and improve customer experience.

            </p>

            <div class="mt-4">

                <a href="/apply?jobRole=UI/UX Designer"
                   class="apply-btn">
                    Apply Now
                </a>

            </div>

        </div>

    </div>

</section>



<!-- CULTURE -->

<section class="culture-section">

    <div class="container">

        <div class="culture-box">

            <div class="row align-items-center">

                <div class="col-md-7">

                    <h2 class="fw-bold mb-4">

                        Our Work Culture

                    </h2>

                    <p class="text-secondary"
                       style="line-height:1.9;">

                        We focus on innovation,
                        teamwork and continuous learning.

                        Our mission is to create modern
                        digital experiences while helping
                        team members improve their technical
                        and professional skills.

                    </p>

                    <p class="text-secondary"
                       style="line-height:1.9;">

                        We encourage creativity,
                        leadership and problem solving
                        in every project we build.

                    </p>

                </div>

                <div class="col-md-5 text-center">

                    <i class="fa fa-briefcase"
                       style="font-size:140px;
                       color:#8e2de2;"></i>

                </div>

            </div>

        </div>



        <div class="developer-highlight">

            <h5 class="text-uppercase">

                Website Developed By

            </h5>

            <h2 class="fw-bold mt-3">

                Shiv Prakash Singh

            </h2>

            <p class="mt-4"
               style="line-height:1.9;">

                Premium E-Commerce platform designed
                with professional UI, responsive layout,
                cart system and modern Spring Boot architecture.

            </p>

        </div>

    </div>

</section>



<!-- FOOTER -->

<section class="footer-section">

    <div class="container">

        <h5>

            Premium Careers Portal

        </h5>

        <p class="mb-0">

            Built With Spring Boot & Bootstrap

        </p>

    </div>

</section>



<jsp:include page="/components/chatbot.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%
    String success =
            (String) request.getAttribute("success");

    if(success != null){
%>

<script>

    Swal.fire({

        icon: 'success',

        title: 'Application Submitted!',

        text: '<%= success %>',

        confirmButtonColor: '#6a11cb',

        confirmButtonText: 'OK'

    });

</script>

<%
    }
%>

</body>

</html>