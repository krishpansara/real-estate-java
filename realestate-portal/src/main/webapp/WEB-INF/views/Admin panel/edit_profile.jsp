<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Prevent caching
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
    response.setDateHeader("Expires", 0);
    
    // Check if user is logged in and is Admin - if not, redirect to login
    if (session.getAttribute("userId") == null || !"Admin".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
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
<title>Edit Property</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shared.css">

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
.form-container {
  background:#fff;
  padding:25px;
  border-radius:6px;
  max-width:600px;
}

.form-group {
  margin-bottom:15px;
}

.form-group label {
  display:block;
  margin-bottom:6px;
  font-weight:600;
}

.form-group input,
.form-group select,
.form-group textarea {
  width:100%;
  padding:8px;
  border:1px solid #ccc;
  border-radius:4px;
}

.form-actions {
  margin-top:20px;
  display:flex;
  gap:10px;
}

.btn-primary { background:#2563eb; color:#fff; }
.btn-secondary { background:#64748b; color:#fff; }
</style>
</head>
<body>

<!-- SIDEBAR -->
   <jsp:include page="/WEB-INF/views/Admin panel/componant/sidebar.jsp" />

<div class="main">
  <div class="topbar">
    <h2>Edit Property</h2>
    <span class="admin-badge">Admin</span>
  </div>

  <div class="form-container">

    <!-- Normally this would submit to your controller -->
    <form action="#" method="post">

      <div class="form-group">
        <label>Property Title</label>
        <input type="text" name="title" value="Green Villa">
      </div>

      <div class="form-group">
        <label>Location</label>
        <input type="text" name="location" value="Rajkot">
      </div>

      <div class="form-group">
        <label>Type</label>
        <select name="type">
          <option>Apartment</option>
          <option selected>Villa</option>
          <option>Plot</option>
          <option>Bungalow</option>
          <option>Commercial</option>
        </select>
      </div>

      <div class="form-group">
        <label>Price</label>
        <input type="text" name="price" value="1.2 Cr">
      </div>

      <div class="form-group">
        <label>Status</label>
        <select name="status">
          <option selected>Active</option>
          <option>Pending</option>
          <option>Sold</option>
        </select>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">Update Property</button>
        <a href="${pageContext.request.contextPath}/page?name=properties">
          <button type="button" class="btn btn-secondary">Cancel</button>
        </a>
      </div>

    </form>

  </div>

</div>

</body>
</html>