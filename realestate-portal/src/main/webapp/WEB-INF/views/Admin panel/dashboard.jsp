<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shared.css">
<style>
  .stats-grid {
    display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 24px;
  }
  .stat-card {
    background: #fff; border-radius: 8px; padding: 20px;
    box-shadow: 0 1px 4px rgba(0,0,0,0.08);
  }
  .stat-icon { font-size: 28px; margin-bottom: 10px; }
  .stat-label { font-size: 13px; color: #777; margin-bottom: 6px; }
  .stat-value { font-size: 30px; font-weight: 700; color: #1a2e4a; }
  .stat-sub { font-size: 12px; margin-top: 6px; color: #27ae60; }
  .stat-sub.warn { color: #e74c3c; }

  .recent-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }

  @media (max-width: 900px) {
    .stats-grid { grid-template-columns: repeat(2, 1fr); }
    .recent-grid { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
  <div class="sidebar-logo">Real<span>Estate</span></div>
  <a class="nav-item  active" href="${pageContext.request.contextPath}/page?name=dashboard">
  	 Dashboard
  </a>
  <a class="nav-item" href="${pageContext.request.contextPath}/page?name=users">
     Users
  </a>
  <a class="nav-item" href="${pageContext.request.contextPath}/page?name=properties">
     Properties
  </a>
</div>

<!-- MAIN -->
<div class="main">
  <div class="topbar">
    <h2>Dashboard</h2>
    <span class="admin-badge">Admin</span>
  </div>

  <!-- STAT CARDS -->
  <div class="stats-grid">
    <div class="stat-card">
      <div class="stat-label">Total Properties</div>
      <div class="stat-value">${stats.getTotalProperties()}</div>
    </div>
    <div class="stat-card">
      <div class="stat-label">Active Listings</div>
      <div class="stat-value">${stats.getActiveListings()}</div>
    </div>

     <div class="stat-card">
      <div class="stat-label">Sold Properties</div>
      <div class="stat-value">${stats.getTsoldProperties()}</div>
    </div>
    

    <div class="stat-card">
      <div class="stat-label">Total Users</div>
      <div class="stat-value">${stats.getTotalUsers()}</div>
    </div>

       </div>
  <!-- RECENT TABLES -->
  <div class="recent-grid">

    <div class="card">
      <div class="card-header">
        <span class="card-title">Recent Properties</span>
        <a href="${pageContext.request.contextPath}/page?name=properties"><button class="btn btn-primary btn-sm">View All</button></a>
      </div>
      <table>
        <thead>
          <tr>
          	<th>Property</th>
          	<th>Type</th>
          	<th>Price</th>
          	<th>Status</th>
         </tr>
        </thead>
        <tbody>
        <c:forEach var="rp" items="${recentProperties}">
         <tr>
            <td>${rp.title}</td>
            <td>${rp.propertyType }</td>
            <td>${rp.price }</td>
            <td><span class="badge 
			    ${rp.status eq 'active' ? 'badge-green' : 
		      	rp.status eq 'pending' ? 'badge-orange' : 
			    rp.status eq 'sold' ? 'badge-red' : ''}">
			    ${rp.status}
			</span></td>
          </tr>
        
        </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="card">
      <div class="card-header">
        <span class="card-title">Recent Users</span>
        <a href="${pageContext.request.contextPath}/page?name=users"><button class="btn btn-primary btn-sm">View All</button></a>
      </div>
      <table>
        <thead>
          <tr>
	          <th>Name</th>
	          <th>Role</th>
	          <th>Joined</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var='recentUser' items="${recentUsers}">
	          <tr>
	          	<td>${empty recentUser.firstName ? "-" : recentUser.firstName } </td>
	          	<td>${empty recentUser.role ? "-" : recentUser.role } </td>
	          	<td>${empty recentUser.createdAt ? "-" : recentUser.createdAt } </td>
	          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  </div><!-- /recent-grid -->

</div><!-- /main -->
</body>
</html>