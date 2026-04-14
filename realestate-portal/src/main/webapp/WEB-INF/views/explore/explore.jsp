<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - Real Estate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">
    <!-- Bootstrap CSS FIRST -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@300;400;500;600&family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS AFTER Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">
    
    <style>
        :root {
            --primary-color: #00CED1;
            --primary-dark: #00A8AA;
            --text-dark: #2C3E50;
            --text-light: #6C757D;
            --border-color: #E5E7EB;
            --card-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            --card-hover-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            color: var(--text-dark);
            background-color: #F9FAFB;
            overflow-x: hidden;
        }
        
        
        /* Page Header */
        .page-header {
            background: linear-gradient(135deg, #00CED1 0%, #00A8AA 100%);
            padding: 3rem 0 2rem;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            opacity: 0.3;
        }
        
        .page-header h1 {
            font-family: 'Merriweather', serif;
            color: #fff;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            animation: fadeInUp 0.6s ease 0.2s both;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Search Filters */
        .search-filters {
            background: #fff;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
            position: relative;
            animation: fadeInUp 0.6s ease 0.3s both;
        }
        
        .filter-group {
            position: relative;
        }
        
        .filter-input {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 0.75rem 1rem;
            font-size: 0.95rem;
            transition: var(--transition);
            width: 100%;
        }
        
        .filter-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 206, 209, 0.1);
            outline: none;
        }
        
        .filter-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
        }
        
        .filter-input.with-icon {
            padding-left: 2.75rem;
        }
        
        .search-btn {
            background: var(--primary-color);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: var(--transition);
            width: 100%;
        }
        
        .search-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 206, 209, 0.3);
        }
        
        /* Results Section */
        .results-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            animation: fadeInUp 0.6s ease 0.4s both;
        }
        
        .results-count {
            font-size: 1.1rem;
            color: var(--text-dark);
            font-weight: 600;
        }
        
        .sort-dropdown {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 0.5rem 2.5rem 0.5rem 1rem;
            font-size: 0.95rem;
            background: #fff;
            cursor: pointer;
            transition: var(--transition);
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg width='12' height='8' viewBox='0 0 12 8' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1 1.5L6 6.5L11 1.5' stroke='%236C757D' stroke-width='2' stroke-linecap='round'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
        }
        
        .sort-dropdown:focus {
            border-color: var(--primary-color);
            outline: none;
        }
        
        /* Property Cards */
        .property-card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: var(--transition);
            height: 100%;
            animation: fadeInUp 0.6s ease both;
        }
        
        .property-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--card-hover-shadow);
        }
        
        .property-image {
            position: relative;
            overflow: hidden;
            height: 220px;
        }
        
        .property-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }
        
        .property-card:hover .property-image img {
            transform: scale(1.08);
        }
        
        .property-content {
            padding: 1.5rem;
        }
        
        .property-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .property-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }
        
        .property-location {
            color: var(--text-light);
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }
        
        .property-location i {
            color: var(--primary-color);
        }
        
        .property-link {
		    text-decoration: none;
		    color: inherit;
		    display: block;
		}
        
        /* Show More Button */
        .show-more-container {
            text-align: center;
            margin: 3rem 0;
            animation: fadeInUp 0.6s ease 0.8s both;
        }
        
        .show-more-btn {
            background: #fff;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            border-radius: 8px;
            padding: 0.9rem 3rem;
            font-weight: 600;
            transition: var(--transition);
            cursor: pointer;
        }
        
        .show-more-btn:hover {
            background: var(--primary-color);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 206, 209, 0.3);
        }
     
        
        /* Responsive */
        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 1.8rem;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-btn {
                width: 100%;
            }
            
            .results-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .footer-links {
                font-family: 'Poppins', sans-serif;
                flex-direction: column;
                align-items: flex-start;
                gap: 0.8rem;
            }
        }
    </style>
</head>
<body>
    
    <!-- Navigation -->
    <jsp:include page="/WEB-INF/views/component/header.jsp" />

    <!-- Page Header -->
    <div class="page-header">
        <div class="container">
            <h1>Search for an offer</h1>
            
            <!-- Search Filters -->
            <div class="search-filters">
                <div class="row g-3">
                    <div class="col-md-3">
                        <div class="filter-group">
                            <i class="fas fa-map-marker-alt filter-icon"></i>
                            <input type="text" class="filter-input with-icon" placeholder="Search of location" id="locationInput">
                        </div>
                    </div>
                   
                    <div class="col-md-2">
                        <select class="filter-input" id="propertyType">
                            <option value="">Property type</option>
                            <option value="apartment">Apartment</option>
                            <option value="house">House</option>
                            <option value="condo">Condo</option>
                            <option value="villa">Villa</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select class="filter-input" id="bedrooms">
                            <option value="">Bedrooms</option>
                            <option value="1">1 Bedroom</option>
                            <option value="2">2 Bedrooms</option>
                            <option value="3">3 Bedrooms</option>
                            <option value="4">4 Bedrooms</option>
                            <option value="5">5+ Bedrooms</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="filter-input" id="priceRange">
                            <option value="">Select price</option>
                            <option value="0-200000">Under 200,000₹</option>
                            <option value="200000-400000">200,000₹ - 400,000₹</option>
                            <option value="400000-600000">400,000₹ - 600,000₹</option>
                            <option value="600000+">Over 600,000₹</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="search-btn" onclick="performSearch()">
                            <i class="fas fa-search me-2"></i> Search
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="container">
        
        <!-- Results Header -->
        <div class="results-header">
            <div class="results-count">
                <span id="resultsCount">${resultsCount > 0 ? resultsCount : 'No'}</span> results found
            </div>
            <select class="sort-dropdown" id="sortBy" onchange="applySortOrSearch()">
                <option value="default" ${sortBy == 'default' ? 'selected' : ''}>Sort by</option>
                <option value="price-low" ${sortBy == 'price-low' ? 'selected' : ''}>Price: Low to High</option>
                <option value="price-high" ${sortBy == 'price-high' ? 'selected' : ''}>Price: High to Low</option>
                <option value="newest" ${sortBy == 'newest' ? 'selected' : ''}>Newest First</option>
                <option value="bedrooms" ${sortBy == 'bedrooms' ? 'selected' : ''}>Most Bedrooms</option>
            </select>
        </div>
        
        <!-- Property Cards Grid -->
        <div class="row g-4" id="propertyGrid">
         	<c:choose>
         		<c:when test="${empty properties}">
         			<div class="col-12">
         				<div style="text-align: center; padding: 3rem; background: #f9fafb; border-radius: 12px;">
         					<i class="fas fa-search" style="font-size: 3rem; color: #00CED1; margin-bottom: 1rem;"></i>
         					<h4 style="color: #2C3E50; margin-top: 1rem;">No properties found</h4>
         					<p style="color: #6C757D;">Try adjusting your search criteria or filters to find more properties.</p>
         				</div>
         			</div>
         		</c:when>
         		<c:otherwise>
         			<c:forEach var="property" items="${properties}">
	            		<div class="col-md-6 col-lg-4">
			                <a href="${pageContext.request.contextPath}/property/detail?id=${property.propertyId}" class="property-link">
			                    <div class="property-card">
			                        <div class="property-image">
			                            <c:choose>
			                                <c:when test="${not empty property.images and property.images.size() > 0}">
			                                    <img src="<%= request.getContextPath() %>/assets/images/property_images/${property.images[0]}" alt="${property.title}" onerror="this.src='https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=600&h=400&fit=crop'">
			                                </c:when>
			                                <c:otherwise>
			                                    <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=600&h=400&fit=crop" alt="Property">
			                                </c:otherwise>
			                            </c:choose>
			                        </div>
			                        <div class="property-content">
			                            <h3 class="property-title">${ property.title }</h3>
			                            <div class="property-price">${ property.price }₹</div>
			                            <div class="property-location">
			                                <i class="fas fa-map-marker-alt"></i>
			                                ${ property.city }
			                            </div>
			                        </div>
			                    </div>
			                </a>
		            	</div>
	            	</c:forEach>
         		</c:otherwise>
         	</c:choose>
        <c:if test="${not empty properties}">
            <div class="col-12">
                <div class="show-more-container">
                    <button class="show-more-btn">Show more</button>
                </div>
            </div>
        </c:if>
        </div>
    </div>
    
    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/component/footer.jsp" />
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Get current values from the form
        function getSearchParams() {
            const location = document.getElementById('locationInput').value;
            const propertyType = document.getElementById('propertyType').value;
            const bedrooms = document.getElementById('bedrooms').value;
            const priceRange = document.getElementById('priceRange').value;
            const sortBy = document.getElementById('sortBy').value;
            
            return {
                location: location,
                propertyType: propertyType,
                bedrooms: bedrooms,
                priceRange: priceRange,
                sortBy: sortBy
            };
        }
        
        // Perform search with filters
        function performSearch() {
            const params = getSearchParams();
            
            // Build query string
            let queryString = '?name=explore';
            if (params.location) queryString += '&location=' + encodeURIComponent(params.location);
            if (params.propertyType) queryString += '&propertyType=' + encodeURIComponent(params.propertyType);
            if (params.bedrooms) queryString += '&bedrooms=' + encodeURIComponent(params.bedrooms);
            if (params.priceRange) queryString += '&priceRange=' + encodeURIComponent(params.priceRange);
            if (params.sortBy && params.sortBy !== 'default') queryString += '&sortBy=' + encodeURIComponent(params.sortBy);
            
            // Redirect with search parameters
            window.location.href = '${pageContext.request.contextPath}/page' + queryString;
        }
        
        // Apply sort or search filters
        function applySortOrSearch() {
            performSearch();
        }
        
        // Initialize form values on page load
        window.addEventListener('DOMContentLoaded', function() {
            // Pre-populate form with current filter values if they exist
            const currentLocation = '${location}';
            const currentPropertyType = '${propertyType}';
            const currentBedrooms = '${bedrooms}';
            const currentPriceRange = '${priceRange}';
            const currentSortBy = '${sortBy}';
            
            if (currentLocation) document.getElementById('locationInput').value = currentLocation;
            if (currentPropertyType) document.getElementById('propertyType').value = currentPropertyType;
            if (currentBedrooms) document.getElementById('bedrooms').value = currentBedrooms;
            if (currentPriceRange) document.getElementById('priceRange').value = currentPriceRange;
            if (currentSortBy && currentSortBy !== 'default') document.getElementById('sortBy').value = currentSortBy;
        });
    </script>
</body>
</html>
