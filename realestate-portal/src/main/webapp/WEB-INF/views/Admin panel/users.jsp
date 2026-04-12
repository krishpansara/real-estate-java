<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<title>Admin - Users</title>
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
          <th>Role</th>
          <th>City</th>
          <th>Joined</th>
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>

        <c:forEach var="user" items="${userList}">
        <tr>
          <td>${user.userId}</td>
          <td><strong>${empty user.firstName ? "-" : user.firstName} ${empty user.lastName ? "-" : user.lastName} </strong></td>
          <td>${empty user.email ? "-" : user.email}</td>
          <td>${empty user.phone ? "-" : user.phone}</td>
          <td>${empty user.role ? "-" : user.role}</td>
          <td>${empty user.city ? "-" : user.city}</td>
          <td>${empty user.createdAt ? "-" : user.createdAt}</td>
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

<script>
function openAddModal() {
  document.getElementById('modal-title').textContent = 'Add New User';
  document.getElementById('edit-id').value = '';
  ['u-name','u-email','u-phone','u-city'].forEach(id => document.getElementById(id).value = '');
  document.getElementById('u-role').value   = 'User';
  document.getElementById('u-status').value = 'Active';
  document.getElementById('user-modal').classList.add('open');
}


function closeModal() {
  document.getElementById('user-modal').classList.remove('open');
}

function saveUser() {
  const name = document.getElementById('u-name').value.trim();
  const email = document.getElementById('u-email').value.trim();
  if (!name || !email) { alert('Name and Email are required.'); return; }

  const id = document.getElementById('edit-id').value;
  const user = {
    id:      id ? parseInt(id) : nextId++,
    name,
    email,
    phone:   document.getElementById('u-phone').value.trim(),
    role:    document.getElementById('u-role').value,
    city:    document.getElementById('u-city').value.trim(),
    joined:  id ? users.find(u => u.id === parseInt(id)).joined : today(),
    status:  document.getElementById('u-status').value,
  };

  if (id) {
    const idx = users.findIndex(u => u.id === parseInt(id));
    users[idx] = user;
  } else {
    users.push(user);
  }
  closeModal();
  filterUsers();
}

</script>
</body>
</html>