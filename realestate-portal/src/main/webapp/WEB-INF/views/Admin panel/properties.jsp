<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Properties</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shared.css">

</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">Real<span>Estate</span></div>

  <a class="nav-item" href="${pageContext.request.contextPath}/page?name=dashboard">
     Dashboard
  </a>

  <a class="nav-item " href="${pageContext.request.contextPath}/page?name=users">
     Users
  </a>

  <a class="nav-item active"  href="${pageContext.request.contextPath}/page?name=properties">
     Properties
  </a>
</div>

<div class="main">
  <div class="topbar">
    <h2>Property Management</h2>
    <span class="admin-badge">Admin</span>
  </div>

  <div class="card">
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Title</th>
          <th>Location</th>
          <th>Type</th>
          <th>Price</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>

        <tr>
          <td>1</td>
          <td>Green Villa</td>
          <td>Rajkot</td>
          <td>Villa</td>
          <td>1.2 Cr</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <tr>
          <td>2</td>
          <td>Sky Apartment</td>
          <td>Ahmedabad</td>
          <td>Apartment</td>
          <td>45 L</td>
          <td><span class="badge badge-orange">Pending</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <tr>
          <td>3</td>
          <td>Sunrise Plot</td>
          <td>Surat</td>
          <td>Plot</td>
          <td>18 L</td>
          <td><span class="badge badge-red">Sold</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <tr>
          <td>4</td>
          <td>Blue Lake Cottage</td>
          <td>Vadodara</td>
          <td>Bungalow</td>
          <td>78 L</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <tr>
          <td>5</td>
          <td>Prime Commercial Space</td>
          <td>Ahmedabad</td>
          <td>Commercial</td>
          <td>2.1 Cr</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

      </tbody>
    </table>
  </div>

</div>
</body>
</html>