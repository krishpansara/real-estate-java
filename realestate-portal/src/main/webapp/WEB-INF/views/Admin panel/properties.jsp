<%@ page contentType="text/html;charset=UTF-8" %>
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
          <th>City</th>
          <th>Type</th>
          <th>Price</th>
          <th>Status</th>
          <th>Posted On</th>
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>
      <c:forEach var="p" items="${ propertiesList }">
      	<tr>
      		<td>${p.propertyId}</td>
      		<td>${p.title}</td>
      		<td>${p.city}</td>
      		<td>${p.propertyType}</td>
      		<td>${p.price}</td>
      		 <td><span class="badge 
			    ${p.status eq 'active' ? 'badge-green' : 
		      	p.status eq 'pending' ? 'badge-orange' : 
			    p.status eq 'sold' ? 'badge-red' : ''}">
			    ${p.status}
			</span></td>
      		<td>${p.createdAt}</td>
      		<td>
            	<button class="btn btn-edit" onClick="openAddModal()">Edit</button>
            	<button class="btn btn-delete">Delete</button>
          </td>
      	</tr>
      
      </c:forEach>
      </tbody>
    </table>
  </div>
<!-- ADD / EDIT PROPERTY MODAL -->
<div class="modal-overlay" id="prop-modal">
  <div class="modal">
    <h3 id="modal-title">Add New Property</h3>
    <input type="hidden" id="edit-id">

    <div class="form-group">
      <label>Property Title *</label>
      <input type="text" id="p-title" placeholder="e.g. Green Valley Villa">
    </div>

    <div class="form-row">
      <div class="form-group">
        <label>Location / City *</label>
        <input type="text" id="p-location" placeholder="e.g. Rajkot">
      </div>
      <div class="form-group">
        <label>Type</label>
        <select id="p-type">
          <option>Apartment</option>
          <option>Villa</option>
          <option>Plot</option>
          <option>Bungalow</option>
          <option>Commercial</option>
        </select>
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label>Price</label>
        <input type="text" id="p-price" placeholder="e.g. ₹45 Lakh">
      </div>
      <div class="form-group">
        <label>Area</label>
        <input type="text" id="p-area" placeholder="e.g. 1200">
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label>Bedrooms</label>
        <select id="p-beds">
          <option>1 BHK</option>
          <option>2 BHK</option>
          <option>3 BHK</option>
          <option>4 BHK</option>
          <option>4+ BHK</option>
          <option>N/A</option>
        </select>
      </div>
      <div class="form-group">
        <label>Status</label>
        <select id="p-status">
          <option>Active</option>
          <option>Pending</option>
          <option>Sold</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label>Description</label>
      <textarea id="p-desc" rows="3" placeholder="Short description (optional)..."></textarea>
    </div>

    <div class="modal-footer">
      <button class="btn btn-outline" onclick="closeModal()">Cancel</button>
      <button class="btn btn-primary" onclick="saveProperty()">Save Property</button>
    </div>
  </div>
</div>
</div>
<script>

function closeModal() {
	  document.getElementById('prop-modal').classList.remove('open');
	}
	
function openAddModal() {
	  document.getElementById('modal-title').textContent = 'Add New Property';
	  document.getElementById('edit-id').value = '';
	  ['p-title','p-location','p-price','p-area','p-desc'].forEach(id => document.getElementById(id).value = '');
	  document.getElementById('p-type').value   = 'Apartment';
	  document.getElementById('p-beds').value   = '2 BHK';
	  document.getElementById('p-status').value = 'Active';
	  document.getElementById('prop-modal').classList.add('open');
	}

</script>
</body>
</html>