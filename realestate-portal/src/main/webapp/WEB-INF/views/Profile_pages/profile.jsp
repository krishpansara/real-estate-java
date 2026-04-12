<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // Prevent caching
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in - if not, redirect to login
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/page?name=login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="pragma" content="no-cache">
    <title>My Profile - Real Estate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">    
    
    <!-- Prevent Back Navigation Script -->
    <script>
        window.onload = function() {
            // Prevent back button after successful login
            window.history.pushState(null, null, window.location.href);
            window.addEventListener('popstate', function() {
                window.history.pushState(null, null, window.location.href);
            });
            
            // Block Alt+Left/Right arrow keys
            document.addEventListener('keydown', function(e) {
                if ((e.altKey && e.code === 'ArrowLeft') || (e.altKey && e.code === 'ArrowRight')) {
                    e.preventDefault();
                    return false;
                }
            });
        };
    </script>    
    
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; color: #2d3436; }

        .profile-header {
            background: linear-gradient(135deg, #1dd1a1 0%, #10ac84 100%);
            color: white;
            padding: 3rem 0 6rem 0;
            margin-bottom: -3rem;
            position: relative;
            overflow: hidden;
        }
        .profile-header::before {
            content: '';
            position: absolute; top: -50%; right: -10%;
            width: 500px; height: 500px;
            background: rgba(255,255,255,0.05);
            border-radius: 50%;
        }
        .profile-container { position: relative; z-index: 1; }

        .profile-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            padding: 2.5rem;
            margin-top: 2rem;
            animation: fadeInUp 0.6s ease;
        }

        .profile-avatar {
            width: 140px; height: 140px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            display: flex; align-items: center; justify-content: center;
            font-size: 3.5rem; color: white;
            margin: 0 auto 1.5rem;
            box-shadow: 0 8px 25px rgba(29,209,161,0.3);
            overflow: hidden;
        }
        .profile-avatar img { width: 100%; height: 100%; border-radius: 50%; object-fit: cover; }

        .profile-info h2 { font-size: 2rem; font-weight: 600; margin-bottom: 0.5rem; color: #2d3436; }
        .profile-info p { color: #636e72; font-size: 1.05rem; margin-bottom: 0.3rem; display: flex; align-items: center; justify-content: center; gap: 8px; }
        .profile-info .icon { font-size: 1rem; color: #1dd1a1; }

        .profile-stats {
            display: flex; justify-content: center; gap: 3rem;
            margin-top: 2rem; padding-top: 2rem;
            border-top: 2px solid #f0f0f0;
        }
        .stat-item { text-align: center; }
        .stat-item .number { font-size: 2rem; font-weight: 700; color: #1dd1a1; display: block; }
        .stat-item .label { color: #636e72; font-size: 0.9rem; margin-top: 0.3rem; }

        .action-buttons { display: flex; gap: 1rem; justify-content: center; margin-top: 2rem; flex-wrap: wrap; }

        .btn-primary-custom {
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            border: none; color: white;
            padding: 0.9rem 2.5rem; border-radius: 50px;
            font-weight: 600; font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(29,209,161,0.3);
            display: inline-flex; align-items: center; gap: 0.5rem;
            text-decoration: none;
        }
        .btn-primary-custom:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(29,209,161,0.4); color: white; }

        .btn-outline-custom {
            background: transparent; border: 2px solid #1dd1a1; color: #1dd1a1;
            padding: 0.9rem 2.5rem; border-radius: 50px;
            font-weight: 600; font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none;
        }
        .btn-outline-custom:hover { background: #1dd1a1; color: white; transform: translateY(-2px); }

        .btn-logout {
            background: transparent; border: 2px solid #ff6b6b; color: #ff6b6b;
            padding: 0.9rem 2.5rem; border-radius: 50px;
            font-weight: 600; font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-flex; align-items: center; gap: 0.5rem; cursor: pointer;
        }
        .btn-logout:hover { background: #ff6b6b; color: white; transform: translateY(-2px); }

        .properties-section { padding: 4rem 0; }
        .section-title { font-size: 2rem; font-weight: 700; color: #2d3436; margin-bottom: 1rem; position: relative; display: inline-block; }
        .section-title::after { content: ''; position: absolute; bottom: -8px; left: 0; width: 60px; height: 4px; background: linear-gradient(90deg, #1dd1a1, #10ac84); border-radius: 2px; }
        .section-subtitle { color: #636e72; font-size: 1.1rem; margin-bottom: 3rem; }

        .property-card { background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 5px 20px rgba(0,0,0,0.08); transition: all 0.3s ease; margin-bottom: 2rem; height: 100%; animation: fadeInUp 0.6s ease; }
        .property-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.12); }
        .property-image { position: relative; height: 220px; overflow: hidden; }
        .property-image img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s ease; }
        .property-card:hover .property-image img { transform: scale(1.05); }
        .property-image .no-image { width: 100%; height: 100%; background: #f0f0f0; display: flex; align-items: center; justify-content: center; font-size: 3rem; color: #ccc; }

        .property-badge { position: absolute; top: 15px; right: 15px; padding: 0.4rem 1rem; border-radius: 20px; font-size: 0.85rem; font-weight: 600; color: white; }
        .badge-active { background: rgba(29,209,161,0.95); }
        .badge-sold { background: rgba(255,107,107,0.95); }
        .badge-inactive { background: rgba(99,110,114,0.95); }

        .property-content { padding: 1.5rem; }
        .property-title { font-size: 1.1rem; font-weight: 600; color: #2d3436; margin-bottom: 0.5rem; line-height: 1.4; }
        .property-location { color: #636e72; font-size: 0.95rem; margin-bottom: 0.5rem; display: flex; align-items: center; gap: 0.5rem; }
        .property-location .icon { color: #1dd1a1; }
        .property-type-badge { display: inline-block; background: #e8f8f5; color: #10ac84; padding: 0.2rem 0.8rem; border-radius: 20px; font-size: 0.8rem; font-weight: 500; margin-bottom: 0.8rem; }
        .property-price { font-size: 1.4rem; font-weight: 700; color: #1dd1a1; margin-bottom: 1rem; }
        .property-actions { display: flex; gap: 0.5rem; padding-top: 1rem; border-top: 1px solid #f0f0f0; }
        .btn-action { flex: 1; padding: 0.6rem 1rem; border-radius: 8px; font-weight: 500; font-size: 0.9rem; transition: all 0.3s ease; border: none; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 0.4rem; }
        .btn-edit { background: #e8f8f5; color: #1dd1a1; }
        .btn-edit:hover { background: #1dd1a1; color: white; }
        .btn-delete { background: #ffe8e8; color: #ff6b6b; }
        .btn-delete:hover { background: #ff6b6b; color: white; }

        .empty-state { text-align: center; padding: 4rem 2rem; }
        .empty-state .icon { font-size: 5rem; color: #dfe6e9; margin-bottom: 1.5rem; }
        .empty-state h3 { font-size: 1.5rem; color: #636e72; margin-bottom: 1rem; }
        .empty-state p { color: #b2bec3; margin-bottom: 2rem; }

        .alert-success-custom { background: #e8f8f5; color: #10ac84; border-radius: 10px; padding: 1rem 1.5rem; margin-bottom: 1.5rem; display: flex; align-items: center; gap: 1rem; border: none; }

        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

        @media (max-width: 768px) {
            .profile-stats { gap: 1.5rem; }
            .action-buttons { flex-direction: column; }
            .btn-primary-custom, .btn-outline-custom, .btn-logout { width: 100%; justify-content: center; }
        }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/component/header.jsp" />

    <section class="profile-header">
        <div class="container profile-container">
            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <c:if test="${param.success == 'true'}">
                        <div class="alert-success-custom">
                            <i class="fas fa-check-circle"></i>
                            <span>Profile updated successfully!</span>
                        </div>
                    </c:if>

                    <div class="profile-card text-center">
                        <!-- Avatar -->
                        <div class="profile-avatar">
                            <c:choose>
                                <c:when test="${not empty user.profilePicture}">
                                    <img src="${pageContext.request.contextPath}/assets/images/profile_pictures/${user.profilePicture}" alt="Profile Picture">
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-user"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Info -->
                        <div class="profile-info">
                            <h2>${user.firstName} ${user.lastName}</h2>
                            <p><span class="icon"><i class="fas fa-envelope"></i></span> ${user.email}</p>
                            <c:if test="${not empty user.phone}">
                                <p><span class="icon"><i class="fas fa-phone"></i></span> ${user.phone}</p>
                            </c:if>
                            <c:if test="${not empty user.city}">
                                <p><span class="icon"><i class="fas fa-map-marker-alt"></i></span> ${user.city}<c:if test="${not empty user.country}">, ${user.country}</c:if></p>
                            </c:if>
                            <p>
                                <span class="icon"><i class="fas fa-calendar-alt"></i></span>
                                Member since ${memberSince}
                            </p>
                        </div>

                        <!-- Stats -->
                        <div class="profile-stats">
                            <div class="stat-item">
                                <span class="number">${totalProperties}</span>
                                <span class="label">Properties Listed</span>
                            </div>
                            <div class="stat-item">
                                <span class="number">${activeProperties}</span>
                                <span class="label">Active</span>
                            </div>
                            <div class="stat-item">
                                <span class="number">${soldProperties}</span>
                                <span class="label">Sold</span>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/page?name=property_listing" class="btn-outline-custom">
                                <i class="fas fa-plus"></i> Add Property
                            </a>
                            <a href="${pageContext.request.contextPath}/edit-profile" class="btn-outline-custom">
                                <i class="fas fa-edit"></i> Edit Profile
                            </a>
                            <form method="post" action="${pageContext.request.contextPath}/logout" style="margin:0;">
                                <button class="btn-logout" type="submit">
                                    <i class="fas fa-sign-out-alt"></i> Logout
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- My Properties -->
    <section class="properties-section">
        <div class="container">
            <div class="mb-4">
                <h2 class="section-title">My Properties</h2>
                <p class="section-subtitle">Manage all your listed properties</p>
            </div>

            <c:choose>
                <c:when test="${empty userProperties}">
                    <div class="empty-state">
                        <div class="icon"><i class="fas fa-home"></i></div>
                        <h3>No properties listed yet</h3>
                        <p>Start listing your properties to see them here.</p>
                        <a href="${pageContext.request.contextPath}/page?name=property_listing" class="btn-primary-custom">
                            <i class="fas fa-plus"></i> Add Your First Property
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <c:forEach var="prop" items="${userProperties}">
                            <div class="col-lg-4 col-md-6">
                                <div class="property-card">
                                    <div class="property-image">
                                        <c:choose>
                                            <c:when test="${not empty prop.images}">
                                                <img src="${pageContext.request.contextPath}/assets/images/property_images/${prop.images[0]}" alt="${prop.title}">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="no-image"><i class="fas fa-image"></i></div>
                                            </c:otherwise>
                                        </c:choose>

                                        <%-- ✅ FIXED: c:choose inside class attribute is invalid JSP.
                                             Use EL ternary expression instead. --%>
                                        <span class="property-badge ${prop.status == 'active' ? 'badge-active' : prop.status == 'sold' ? 'badge-sold' : 'badge-inactive'}">
                                            ${prop.status}
                                        </span>
                                    </div>
                                    <div class="property-content">
                                        <h3 class="property-title">${prop.title}</h3>
                                        <div class="property-location">
                                            <span class="icon"><i class="fas fa-map-marker-alt"></i></span>
                                            ${prop.locality}<c:if test="${not empty prop.locality && not empty prop.city}">, </c:if>${prop.city}
                                        </div>
                                        <span class="property-type-badge">${prop.propertyType} • For ${prop.purpose}</span>

                                        <%-- ✅ FIXED: Added fmt taglib at top of file so this now works --%>
                                        <div class="property-price">₹<fmt:formatNumber value="${prop.price}" pattern="#,##,##0"/></div>

                                        <div class="property-actions">
                                            <a href="${pageContext.request.contextPath}/property/detail?id=${prop.propertyId}" class="btn-action btn-edit">
                                                <i class="fas fa-eye"></i> View
                                            </a>
                                            <form method="post" action="${pageContext.request.contextPath}/property/delete" style="flex:1; margin:0;">
                                                <input type="hidden" name="propertyId" value="${prop.propertyId}">
                                                <button type="submit" class="btn-action btn-delete w-100"
                                                        onclick="return confirm('Delete this property? This cannot be undone.')">
                                                    <i class="fas fa-trash-alt"></i> Delete
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/component/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
