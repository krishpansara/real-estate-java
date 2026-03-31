<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Real Estate</title>

    <!-- Bootstrap CSS (ADD THIS) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome (ADD THIS) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Custom CSS - MUST come AFTER Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/Auth_component/auth_header.jsp" />

<section class="hero">
    <div class="home-container">

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
            <img src="${pageContext.request.contextPath}/assets/images/house.jpg" alt="House">
        </div>

    </div>
</section>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/component/footer.jsp" />

</body>
</html>