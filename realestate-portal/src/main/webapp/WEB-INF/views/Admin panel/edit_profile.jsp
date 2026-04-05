<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Property</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shared.css">

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