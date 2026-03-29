<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
      <div class="stat-value">184</div>
    </div>
    <div class="stat-card">
      <div class="stat-label">Active Listings</div>
      <div class="stat-value">97</div>
    </div>
    <div class="stat-card">
      <div class="stat-label">Total Users</div>
      <div class="stat-value">312</div>
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
          <tr><th>Property</th><th>Type</th><th>Price</th><th>Status</th></tr>
        </thead>
        <tbody>
          <tr>
            <td>Green Valley Villa</td><td>Villa</td><td>1.2 Cr</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
          <tr>
            <td>Sky Tower Apt 4B</td><td>Apartment</td><td>45 L</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
          <tr>
            <td>Sunrise Plot - 12</td><td>Plot</td><td>18 L</td>
            <td><span class="badge badge-orange">Pending</span></td>
          </tr>
          <tr>
            <td>Blue Lake Cottage</td><td>Bungalow</td><td>78 L</td>
            <td><span class="badge badge-red">Sold</span></td>
          </tr>
          <tr>
            <td>Prime Commercial Space</td><td>Commercial</td><td>2.1 Cr</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
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
          <tr><th>Name</th><th>Role</th><th>Joined</th><th>Status</th></tr>
        </thead>
        <tbody>
          <tr>
            <td>Rohan Mehta</td><td>Buyer</td><td>18 Feb 2026</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
          <tr>
            <td>Priya Sharma</td><td>Agent</td><td>17 Feb 2026</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
          <tr>
            <td>Amit Patel</td><td>Seller</td><td>15 Feb 2026</td>
            <td><span class="badge badge-orange">Inactive</span></td>
          </tr>
          <tr>
            <td>Neha Joshi</td><td>Buyer</td><td>14 Feb 2026</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
          <tr>
            <td>Karan Singhvi</td><td>Seller</td><td>12 Feb 2026</td>
            <td><span class="badge badge-green">Active</span></td>
          </tr>
        </tbody>
      </table>
    </div>

  </div><!-- /recent-grid -->

</div><!-- /main -->
</body>
</html>
