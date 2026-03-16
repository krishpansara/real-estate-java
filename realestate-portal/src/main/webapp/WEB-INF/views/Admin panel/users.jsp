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
    <button class="btn btn-primary" onclick="openAddModal()">+ Add User</button>
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
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>

        <!-- User 1 -->
        <tr>
          <td>1</td>
          <td><strong>Rohan Mehta</strong></td>
          <td>rohan@email.com</td>
          <td>9876543210</td>
          <td>Admin</td>
          <td>Rajkot</td>
          <td>18 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <!-- User 2 -->
        <tr>
          <td>2</td>
          <td><strong>Priya Sharma</strong></td>
          <td>priya@email.com</td>
          <td>9123456789</td>
          <td>User</td>
          <td>Ahmedabad</td>
          <td>17 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <!-- User 3 -->
        <tr>
          <td>3</td>
          <td><strong>Amit Patel</strong></td>
          <td>amit@email.com</td>
          <td>9988776655</td>
          <td>User</td>
          <td>Surat</td>
          <td>15 Feb 2026</td>
          <td><span class="badge badge-orange">Inactive</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <!-- User 4 -->
        <tr>
          <td>4</td>
          <td><strong>Neha Joshi</strong></td>
          <td>neha@email.com</td>
          <td>9654321087</td>
          <td>User</td>
          <td>Vadodara</td>
          <td>14 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <!-- User 5 -->
        <tr>
          <td>5</td>
          <td><strong>Karan Singhvi</strong></td>
          <td>karan@email.com</td>
          <td>9001122334</td>
          <td>User</td>
          <td>Rajkot</td>
          <td>12 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>

        <!-- User 6 -->
        <tr>
          <td>6</td>
          <td><strong>Meena Trivedi</strong></td>
          <td>meena@email.com</td>
          <td>9811223344</td>
          <td>User</td>
          <td>Jamnagar</td>
          <td>10 Feb 2026</td>
          <td><span class="badge badge-green">Active</span></td>
          <td>
            <button class="btn btn-edit">Edit</button>
            <button class="btn btn-delete">Delete</button>
          </td>
          
        </tr>

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