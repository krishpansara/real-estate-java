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
                <a href="${pageContext.request.contextPath}/page?name=profile" class="profile-icon" title="Profile">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </a>
            </div>
        </nav>
    </div>
</header>