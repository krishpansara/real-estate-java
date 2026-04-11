<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favorite Properties - Real Estate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; color: #2d3436; }

        .page-banner {
            background: linear-gradient(135deg, #1dd1a1 0%, #10ac84 100%);
            padding: 3rem 0 2rem;
            color: white;
            margin-bottom: 2.5rem;
            position: relative;
            overflow: hidden;
        }
        .page-banner::before {
            content: '';
            position: absolute;
            top: -50%; right: -10%;
            width: 400px; height: 400px;
            background: rgba(255,255,255,0.05);
            border-radius: 50%;
        }
        .page-banner h1 { font-size: 2rem; font-weight: 700; margin-bottom: .4rem; }
        .page-banner p  { font-size: 1rem; opacity: .85; margin: 0; }
        .page-banner .badge-count {
            display: inline-block;
            background: rgba(255,255,255,.25);
            border-radius: 20px;
            padding: 3px 14px;
            font-size: .85rem;
            font-weight: 600;
            margin-left: 10px;
            vertical-align: middle;
        }

        .property-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            height: 100%;
        }
        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }
        .property-image {
            position: relative;
            height: 220px;
            overflow: hidden;
        }
        .property-image img {
            width: 100%; height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .property-card:hover .property-image img { transform: scale(1.05); }

        .purpose-badge {
            position: absolute;
            top: 14px; left: 14px;
            padding: 5px 14px;
            border-radius: 20px;
            font-size: .78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .05em;
        }
        .badge-rent { background: rgba(29,209,161,.92); color: white; }
        .badge-sale { background: rgba(255,107,107,.92); color: white; }

        .property-content { padding: 1.4rem; }
        .property-title {
            font-size: 1.05rem;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: .4rem;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .property-location {
            color: #636e72;
            font-size: .88rem;
            margin-bottom: .8rem;
            display: flex;
            align-items: center;
            gap: .4rem;
        }
        .property-location i { color: #1dd1a1; }

        .property-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }
        .meta-item {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: .82rem;
            color: #636e72;
        }
        .meta-item i { color: #1dd1a1; font-size: .8rem; }

        .property-price {
            font-size: 1.4rem;
            font-weight: 700;
            color: #10ac84;
            margin-bottom: 1rem;
        }
        .property-price small {
            font-size: .8rem;
            font-weight: 400;
            color: #636e72;
        }

        .property-actions {
            display: flex;
            gap: .5rem;
            padding-top: 1rem;
            border-top: 1px solid #f0f0f0;
        }
        .btn-action {
            flex: 1; padding: .6rem 1rem;
            border-radius: 8px;
            font-weight: 500; font-size: .88rem;
            transition: all 0.25s ease;
            border: none; cursor: pointer;
            font-family: 'Poppins', sans-serif;
        }
        .btn-view { background: #e8f8f5; color: #10ac84; }
        .btn-view:hover { background: #1dd1a1; color: white; }
        .btn-remove { background: #ffe8e8; color: #e74c3c; }
        .btn-remove:hover { background: #e74c3c; color: white; }

        .empty-state {
            text-align: center;
            padding: 5rem 2rem;
            background: white;
            border-radius: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,.06);
        }
        .empty-state .icon-wrap {
            width: 100px; height: 100px;
            background: rgba(29,209,161,.1);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1.5rem;
        }
        .empty-state i { font-size: 2.8rem; color: #1dd1a1; }
        .empty-state h3 { font-size: 1.5rem; color: #2d3436; margin-bottom: .75rem; }
        .empty-state p  { color: #636e72; margin-bottom: 1.8rem; }
        .btn-explore {
            display: inline-flex; align-items: center; gap: 8px;
            background: linear-gradient(135deg, #1dd1a1, #10ac84);
            color: white; border: none;
            padding: .75rem 2rem;
            border-radius: 50px;
            font-weight: 600; font-size: .95rem;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            text-decoration: none;
            transition: opacity .2s, transform .15s;
        }
        .btn-explore:hover { opacity: .9; transform: translateY(-2px); color: white; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(24px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .card-col { animation: fadeInUp .5s ease both; }
        .card-col:nth-child(1) { animation-delay: .05s; }
        .card-col:nth-child(2) { animation-delay: .12s; }
        .card-col:nth-child(3) { animation-delay: .19s; }
        .card-col:nth-child(4) { animation-delay: .26s; }
        .card-col:nth-child(5) { animation-delay: .33s; }
        .card-col:nth-child(6) { animation-delay: .40s; }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/component/header.jsp" />

    <!-- Banner -->
    <div class="page-banner">
        <div class="container position-relative">
            <h1>
                <i class="fas fa-heart me-2"></i>My Favorites
                <span class="badge-count">${fn:length(favorites)} saved</span>
            </h1>
            <p>Properties you have saved for later</p>
        </div>
    </div>

    <div class="container pb-5">

        <c:choose>
            <c:when test="${not empty favorites}">
                <div class="row g-4">
                    <c:forEach var="p" items="${favorites}">
                        <div class="col-lg-4 col-md-6 card-col">
                            <div class="property-card">
                                <div class="property-image">
                                    <c:choose>
                                        <c:when test="${not empty p.images}">
                                            <img src="${pageContext.request.contextPath}/assets/images/property_images/${p.images[0]}"
                                                 alt="${p.title}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&q=80"
                                                 alt="No Image">
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="purpose-badge ${p.purpose == 'rent' ? 'badge-rent' : 'badge-sale'}">
                                        <i class="fas fa-tag me-1"></i>${p.purpose}
                                    </span>
                                </div>
                                <div class="property-content">
                                    <h3 class="property-title">${p.title}</h3>
                                    <div class="property-location">
                                        <i class="fas fa-map-marker-alt"></i>
                                        ${p.locality}, ${p.city}
                                    </div>
                                    <div class="property-meta">
                                        <div class="meta-item">
                                            <i class="fas fa-door-open"></i> ${p.bedrooms} BHK
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-building"></i> ${p.propertyType}
                                        </div>
                                    </div>
                                    <div class="property-price">
                                        &#8377; <fmt:formatNumber value="${p.price}" pattern="#,##,##0"/>
                                        <c:if test="${p.purpose == 'rent'}"><small>/month</small></c:if>
                                    </div>
                                    <div class="property-actions">
                                        <a href="${pageContext.request.contextPath}/property/detail?id=${p.propertyId}"
                                           class="btn-action btn-view text-center text-decoration-none">
                                            <i class="fas fa-eye me-1"></i> View
                                        </a>
                                        <form action="${pageContext.request.contextPath}/favorite/remove"
                                              method="post" style="flex:1;margin:0">
                                            <input type="hidden" name="propertyId" value="${p.propertyId}">
                                            <button type="submit" class="btn-action btn-remove w-100">
                                                <i class="fas fa-heart-broken me-1"></i> Remove
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>

            <c:otherwise>
                <div class="empty-state">
                    <div class="icon-wrap">
                        <i class="far fa-heart"></i>
                    </div>
                    <h3>No Favorites Yet</h3>
                    <p>You haven't saved any properties yet.<br>Browse listings and tap the heart icon to save them here.</p>
                    <a href="${pageContext.request.contextPath}/page?name=explore" class="btn-explore">
                        <i class="fas fa-search"></i> Explore Properties
                    </a>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <jsp:include page="/WEB-INF/views/component/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>