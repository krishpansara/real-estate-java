<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assests/css/offers_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assests/css/header_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assests/css/footer_style.css">

</head>
<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/component/header.jsp" />

<main class="main">
<section class="offers">
<div class="container">

<div class="offers-top">
    <div>
        <h2>Top offers</h2>
        <p>
        Fulfill your career dreams, enjoy all the achievements of the city
        center and luxury housing to the fullest.
        </p>
    </div>

    <button class="show-btn">Show all offers</button>
</div>

<!-- GRID WRAPPER -->
<div class="offers-slider">

<div class="card">
<img src="${pageContext.request.contextPath}/assests/images/house1.png">
<div class="card-body">
<h3>Large 4-room apartment with a beautiful terrace</h3>
<span class="price">320 000€</span>
<p>Barcelona IV.</p>
</div>
</div>

<div class="card">
<img src="${pageContext.request.contextPath}/assests/images/house2.jpg">
<div class="card-body">
<h3>Magnificent duplex in a private villa</h3>
<span class="price">315 000€</span>
<p>Barcelona II.</p>
</div>
</div>

<div class="card highlight">
<img src="${pageContext.request.contextPath}/assests/images/house3.jpg">
<div class="card-body">
<h3>5i large design apartment with terrace</h3>
<span class="price">280 000€</span>
<p>Madrid VI.</p>
</div>
</div>

<div class="card">
<img src="${pageContext.request.contextPath}/assests/images/house3.jpg">
<div class="card-body">
<h3>Elegant private apartment</h3>
<span class="price">320 000€</span>
<p>Madrid VII.</p>
</div>
</div>

</div>
</div>
</section>

</main>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/component/footer.jsp" />
</body>
</html>