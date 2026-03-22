<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@300;400;500;600&family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/about_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css"> 

</head>

<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/Auth_component/auth_header.jsp" />

<main class="main">

<section class="about">
<div class="container">

<div class="about-wrapper">

    <!-- LEFT IMAGE -->
    <div class="about-image">
        <img src="${pageContext.request.contextPath}/assets/images/about_img.jpg" alt="Team">
        <div class="dots"></div>
    </div>

    <!-- RIGHT TEXT -->
    <div class="about-content">
        <h2>About us</h2>

        <p>
        We are a company that connects the world of real estate and finance.
        We provide a complete service for the sale, purchase or rental of
        real estate. Our advantage is more than 15 years of experience and
        soil in attractive locations in Slovakia with branches in Bratislava and Košice.
        </p>

        <p>
        We have a connection to all banks on the Slovak market,
        so we can solve everything under one roof. By constantly innovating
        our business activities, we move forward and we are able to offer
        truly above-standard services that set us apart from the competition.
        </p>
    </div>

</div>
</div>
</section>


</main>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/component/footer.jsp" />

</body>
</html>