<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Real Estate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/style.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assests/css/header_style.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assests/css/footer_style.css">
</head>

<body>

<div class="layout">

<!-- Header -->
<jsp:include page="/WEB-INF/views/component/header.jsp" />

<main class="main">

<section class="hero">
    <div class="container">

        <div class="hero-text">
            <h1>Modern living for everyone</h1>

            <p>
                We provide a complete service for the sale,
                purchase or rental of real estate.
                We have been operating in Spain more than 15 years.
            </p>

            <div class="search-box">
                <input type="text" placeholder="Search of location">

                <select>
                    <option>Property type</option>
                    <option>House</option>
                    <option>Apartment</option>
                </select>

                <button>Search</button>
            </div>
        </div>

        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/assests/images/house.jpg" alt="House">
        </div>

    </div>
</section>

</main>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/component/footer.jsp" />

</div>

</body>

</html>
