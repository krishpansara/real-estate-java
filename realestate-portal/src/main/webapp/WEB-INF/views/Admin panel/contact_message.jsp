<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
   <jsp:include page="/WEB-INF/views/Admin panel/componant/sidebar.jsp" />


<!-- MAIN -->
<div class="main">
  <div class="topbar">
    <h2>User Management</h2>
    <span class="admin-badge">Admin</span>
  </div>
  <div class="toolbar">
    <h3>All Users</h3>
<!-- 
    <button class="btn btn-primary" onclick="openAddModal()">+ Add User</button>
 -->
  </div>
  <div class="card">
  
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Subject</th>
          <th>Message</th>
          <th>Submitted At</th>
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>

        <c:forEach var="cm" items="${allContactMessages}">
		  <tr>
		    <td>${cm.id}</td>
		    
		    <td>
		      <strong>
		        ${empty cm.firstName ? "-" : cm.firstName}
		        ${empty cm.lastName ? "-" : cm.lastName}
		      </strong>
		    </td>
		    
		    <td>${empty cm.email ? "-" : cm.email}</td>
		    <td>${empty cm.phone ? "-" : cm.phone}</td>
		    
		    <td>${empty cm.subject ? "-" : cm.subject}</td>
		    
		    <td>
		      ${empty cm.message ? "-" : cm.message}
		    </td>
		    
		    <td>
		      ${empty cm.submittedAt ? "-" : cm.submittedAt}
		    </td>
		    
		    <td>
		      <button class="btn btn-edit">Edit</button>
		      <button class="btn btn-delete">Delete</button>
		    </td>
		  </tr>
		</c:forEach>

      </tbody>

    </table>
  </div>
  <!-- ADD / EDIT USER MODAL -->
	<div class="modal-overlay" id="user-modal">
	  <div class="modal">
	    <h3 id="modal-title">Add New User</h3>
	    <input type="hidden" id="edit-id">
	
	    <div class="form-row">
	      <div class="form-group">
	        <label>Full Name *</label>
	        <input type="text" id="u-name" placeholder="Enter full name">
	      </div>
	      <div class="form-group">
	        <label>Email *</label>
	        <input type="email" id="u-email" placeholder="Enter email">
	      </div>
	    </div>
	
	    <div class="form-row">
	      <div class="form-group">
	        <label>Phone</label>
	        <input type="text" id="u-phone" placeholder="Enter phone number">
	      </div>
	      <div class="form-group">
	        <label>Role</label>
	        <select id="u-role">
	          <option>User</option>
	          <option>Admin</option>
	        </select>
	      </div>
	    </div>
	
	    <div class="form-row">
	      <div class="form-group">
	        <label>Status</label>
	        <select id="u-status">
	          <option>Active</option>
	          <option>Inactive</option>
	        </select>
	      </div>
	      <div class="form-group">
	        <label>City</label>
	        <input type="text" id="u-city" placeholder="Enter city">
	      </div>
	    </div>
	
	    <div class="modal-footer">
	      <button class="btn btn-outline" onclick="closeModal()">Cancel</button>
	      <button class="btn btn-primary" onclick="saveUser()">Save User</button>
	    </div>
	  </div>
	</div>
  

</div>

</body>
</html>