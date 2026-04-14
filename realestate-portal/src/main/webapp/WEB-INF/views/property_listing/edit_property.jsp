<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/page?name=login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Edit Property - Real Estate</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer_style.css">

  <style>
    :root {
      --primary: #1dd1a1;
      --primary-dark: #10ac84;
      --bg: #f8f9fa;
      --card: #ffffff;
      --ink: #2d3436;
      --muted: #636e72;
      --border: #e9ecef;
    }
    body { font-family: 'Poppins', sans-serif; background: var(--bg); color: var(--ink); }
    .page-head { display: flex; align-items: center; gap: 14px; margin-bottom: 28px; }
    .back-btn {
      width: 40px; height: 40px; border-radius: 50%; border: none; background: var(--card);
      box-shadow: 0 3px 12px rgba(0,0,0,.1); display: grid; place-items: center; cursor: pointer;
    }
    .back-btn i { color: var(--primary-dark); font-size: .95rem; }
    .page-head h1 { font-size: 1.5rem; font-weight: 700; margin: 0; }
    .page-head p { font-size: 13px; color: var(--muted); margin: 0; }
    .scard { background: var(--card); border-radius: 15px; padding: 24px; box-shadow: 0 5px 20px rgba(0,0,0,.06); margin-bottom: 20px; }
    .scard-title { font-size: .95rem; font-weight: 600; margin-bottom: 18px; display: flex; align-items: center; gap: 8px; }
    .scard-title i { color: var(--primary); }
    .form-label { font-size: 13px; font-weight: 500; color: var(--ink); margin-bottom: 6px; }
    .form-control, .form-select {
      border-radius: 10px !important; border: 1.5px solid var(--border) !important; background: var(--bg) !important;
      font-size: 13.5px; color: var(--ink); padding: 10px 14px;
    }
    .form-control:focus, .form-select:focus {
      border-color: var(--primary) !important; box-shadow: 0 0 0 3px rgba(29,209,161,.15) !important; background: #fff !important;
    }
    .btn-submit {
      background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
      color: #fff; border: none; border-radius: 11px; padding: 14px; font-weight: 600; font-size: 15px;
      width: 100%; box-shadow: 0 6px 20px rgba(29,209,161,.35);
    }
    .sold-switch-wrap {
      border: 1px solid #ffe0e0; background: #fff5f5; border-radius: 10px; padding: 14px 16px;
    }
  </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/component/header.jsp" />

<div class="container py-4" style="max-width:860px">
  <div class="page-head">
    <button class="back-btn" onclick="history.back()" title="Go Back"><i class="fas fa-arrow-left"></i></button>
    <div>
      <h1>Edit Property</h1>
      <p>Update your property listing details</p>
    </div>
  </div>

  <form action="${pageContext.request.contextPath}/property/update" method="post">
    <input type="hidden" name="propertyId" value="${property.propertyId}">

    <div class="scard">
      <div class="scard-title"><i class="fas fa-home"></i> Basic Information</div>
      <div class="mb-3">
        <label class="form-label">Property Title</label>
        <input type="text" class="form-control" name="title" value="${property.title}" required>
      </div>

      <div class="row g-3 mb-3">
        <div class="col-md-6">
          <label class="form-label">Purpose</label>
          <select class="form-select" name="purpose" required>
            <option value="SALE" ${property.purpose == 'sale' ? 'selected' : ''}>SALE</option>
            <option value="RENT" ${property.purpose == 'rent' ? 'selected' : ''}>RENT</option>
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label">Property Type</label>
          <select class="form-select" name="propertyType" required>
            <option value="Flat" ${property.propertyType == 'Flat' ? 'selected' : ''}>Flat</option>
            <option value="House" ${property.propertyType == 'House' ? 'selected' : ''}>House</option>
            <option value="Villa" ${property.propertyType == 'Villa' ? 'selected' : ''}>Villa</option>
            <option value="Plot" ${property.propertyType == 'Plot' ? 'selected' : ''}>Plot</option>
          </select>
        </div>
      </div>

      <div>
        <label class="form-label">Price (&#8377;)</label>
        <input type="number" class="form-control" name="price" min="0" value="${property.price}" required>
      </div>
    </div>

    <div class="scard">
      <div class="scard-title"><i class="fas fa-map-marker-alt"></i> Location</div>
      <div class="row g-3 mb-3">
        <div class="col-md-6">
          <label class="form-label">City</label>
          <input type="text" class="form-control" name="city" value="${property.city}" required>
        </div>
        <div class="col-md-6">
          <label class="form-label">Locality</label>
          <input type="text" class="form-control" name="locality" value="${property.locality}" required>
        </div>
      </div>
      <label class="form-label">Google Maps Embed URL</label>
      <input type="url" class="form-control" name="mapEmbedUrl" value="${property.googleMapUrl}" required>
    </div>

    <div class="scard">
      <div class="scard-title"><i class="fas fa-list-ul"></i> Property Details</div>
      <div class="row g-3 mb-3">
        <div class="col-md-4">
          <label class="form-label">Bedrooms</label>
          <input type="number" class="form-control" name="bedrooms" min="0" value="${property.bedrooms}" required>
        </div>
        <div class="col-md-4">
          <label class="form-label">Bathrooms</label>
          <input type="number" class="form-control" name="bathrooms" min="0" value="${property.bathrooms}" required>
        </div>
        <div class="col-md-4">
          <label class="form-label">Area Size (sq ft)</label>
          <input type="number" class="form-control" name="areaSize" min="0" value="${property.areaSize}" required>
        </div>
      </div>
      <div class="row g-3 mb-3">
        <div class="col-md-4">
          <label class="form-label">Property Age (years)</label>
          <input type="number" class="form-control" name="propertyAge" min="0" value="${property.propertyAge}">
        </div>
        <div class="col-md-4">
          <label class="form-label">Furnishing</label>
          <select class="form-select" name="furnishing" required>
            <option value="Furnished" ${property.furnishing == 'Furnished' ? 'selected' : ''}>Furnished</option>
            <option value="Semi-Furnished" ${property.furnishing == 'Semi-Furnished' ? 'selected' : ''}>Semi-Furnished</option>
            <option value="Unfurnished" ${property.furnishing == 'Unfurnished' ? 'selected' : ''}>Unfurnished</option>
          </select>
        </div>
        <div class="col-md-4">
          <label class="form-label">Facing</label>
          <select class="form-select" name="facing" required>
            <option value="North" ${property.facing == 'North' ? 'selected' : ''}>North</option>
            <option value="East" ${property.facing == 'East' ? 'selected' : ''}>East</option>
            <option value="South" ${property.facing == 'South' ? 'selected' : ''}>South</option>
            <option value="West" ${property.facing == 'West' ? 'selected' : ''}>West</option>
          </select>
        </div>
      </div>
      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Availability</label>
          <select class="form-select" name="availability" required>
            <option value="Immediate" ${property.availability == 'Immediate' ? 'selected' : ''}>Immediate</option>
            <option value="Within 30 Days" ${property.availability == 'Within 30 Days' ? 'selected' : ''}>Within 30 Days</option>
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label">Price Negotiable</label>
          <select class="form-select" name="negotiable" required>
            <option value="Yes" ${property.priceNegotiable ? 'selected' : ''}>Yes</option>
            <option value="No" ${!property.priceNegotiable ? 'selected' : ''}>No</option>
          </select>
        </div>
      </div>
    </div>

    <div class="scard">
      <div class="scard-title"><i class="fas fa-align-left"></i> Description</div>
      <textarea class="form-control" name="description" rows="4" required>${property.description}</textarea>
    </div>

    <div class="scard">
      <div class="scard-title"><i class="fas fa-check-circle"></i> Listing Status</div>
      <div class="sold-switch-wrap">
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" role="switch" id="markAsSold" name="markAsSold"
                 ${property.status == 'sold' ? 'checked' : ''}>
          <label class="form-check-label" for="markAsSold">
            Mark this property as sold
          </label>
        </div>
      </div>
    </div>

    <button type="submit" class="btn-submit">
      <i class="fas fa-save"></i> Update Property
    </button>
  </form>
</div>

<jsp:include page="/WEB-INF/views/component/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
