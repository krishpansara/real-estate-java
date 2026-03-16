<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/images/Logo.jpg" alt="Real Estate Logo" class="logo-image">
            <span class="logo-text">Real Estate</span>
        </div>

        <nav class="nav">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/page?name=top_offers">Top offers</a>
            <a href="${pageContext.request.contextPath}/page?name=explore">Explore</a>
            <a href="${pageContext.request.contextPath}/page?name=about">About us</a>
            <a href="${pageContext.request.contextPath}/page?name=contact_us">Contact us</a>
            
            <div class="auth-buttons">
                <a href="${pageContext.request.contextPath}/page?name=login" class="btn-login">Login</a>
                <a href="${pageContext.request.contextPath}/page?name=sign_up" class="btn-signup">Sign Up</a>
            </div>

            
        </nav>
    </div>
</header>