<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Users</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shared.css">

<style>
  .toolbar {
    display:flex;
    justify-content:space-between;
    margin-bottom:16px;
  }
</style>
</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
  <div class="sidebar-logo">Real<span>Estate</span></div>

  <a class="nav-item" href="${pageContext.request.contextPath}/page?name=dashboard">
     Dashboard
  </a>

  <a class="nav-item active" href="${pageContext.request.contextPath}/page?name=users">
     Users
  </a>

  <a class="nav-item" href="${pageContext.request.contextPath}/page?name=properties">
     Properties
  </a>
</div>

<!-- MAIN -->
<div class="main">
  <div class="topbar">
    <h2>User Management</h2>
    <span class="admin-badge">Admin</span>
  </div>

  <div class="toolbar">
    <h3>All Users</h3>
    <button class="btn btn-primary">+ Add User</button>
  </div>

  <div class="card">
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Role</th>
          <th>City</th>
          <th>Joined</th>
          <th>Status</th>
        </tr>
      </thead>

      <tbody>

        <!-- User 1 -->
        <tr>
          <td>1</td>
          <td><strong>Rohan Mehta</strong></td>
          <td>rohan@email.com</td>
          <td>9876543210</td>
          <td>Buyer</td>
          <td>Rajkot</td>
          <td>18 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
        </tr>

        <!-- User 2 -->
        <tr>
          <td>2</td>
          <td><strong>Priya Sharma</strong></td>
          <td>priya@email.com</td>
          <td>9123456789</td>
          <td>Agent</td>
          <td>Ahmedabad</td>
          <td>17 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
        </tr>

        <!-- User 3 -->
        <tr>
          <td>3</td>
          <td><strong>Amit Patel</strong></td>
          <td>amit@email.com</td>
          <td>9988776655</td>
          <td>Seller</td>
          <td>Surat</td>
          <td>15 Feb 2026</td>
          <td><span class="badge badge-orange">Inactive</span></td>
        </tr>

        <!-- User 4 -->
        <tr>
          <td>4</td>
          <td><strong>Neha Joshi</strong></td>
          <td>neha@email.com</td>
          <td>9654321087</td>
          <td>Buyer</td>
          <td>Vadodara</td>
          <td>14 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
        </tr>

        <!-- User 5 -->
        <tr>
          <td>5</td>
          <td><strong>Karan Singhvi</strong></td>
          <td>karan@email.com</td>
          <td>9001122334</td>
          <td>Seller</td>
          <td>Rajkot</td>
          <td>12 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
        </tr>

        <!-- User 6 -->
        <tr>
          <td>6</td>
          <td><strong>Meena Trivedi</strong></td>
          <td>meena@email.com</td>
          <td>9811223344</td>
          <td>Agent</td>
          <td>Jamnagar</td>
          <td>10 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
        </tr>

      </tbody>
    </table>
  </div>

</div>
</body>
</html>