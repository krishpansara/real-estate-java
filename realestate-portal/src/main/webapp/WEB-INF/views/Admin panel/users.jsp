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
  .status-message {
    padding: 10px 14px;
    border-radius: 8px;
    margin-bottom: 14px;
    font-size: 14px;
  }
  .status-success {
    background: #e8f8ef;
    color: #1f7a45;
    border: 1px solid #bfe7cf;
  }
  .status-error {
    background: #fdeeee;
    color: #a12a2a;
    border: 1px solid #f5c2c2;
  }
  .user-details-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 12px;
  }
  .user-detail {
    background: #f8f9fb;
    border: 1px solid #e9edf3;
    border-radius: 8px;
    padding: 10px 12px;
  }
  .user-detail label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 4px;
  }
  .user-detail p {
    margin: 0;
    font-weight: 600;
    color: #222;
    word-break: break-word;
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
  <c:if test="${param.success == 'role_updated'}">
    <div class="status-message status-success">User role updated successfully.</div>
  </c:if>
  <c:if test="${not empty param.error}">
    <div class="status-message status-error">
      <c:choose>
        <c:when test="${param.error == 'invalid_role'}">Invalid role selected. Choose User or Admin.</c:when>
        <c:when test="${param.error == 'role_update_failed'}">Unable to update role. Please try again.</c:when>
        <c:otherwise>Something went wrong. Please try again.</c:otherwise>
      </c:choose>
    </div>
  </c:if>
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
            <button
                class="btn btn-edit"
                onclick="openEditModal(this)"
                data-userid="${user.userId}"
                data-firstname="${empty user.firstName ? '-' : user.firstName}"
                data-lastname="${empty user.lastName ? '-' : user.lastName}"
                data-email="${empty user.email ? '-' : user.email}"
                data-phone="${empty user.phone ? '-' : user.phone}"
                data-city="${empty user.city ? '-' : user.city}"
                data-role="${empty user.role ? 'User' : user.role}"
                data-joined="${empty user.createdAt ? '-' : user.createdAt}">
                Edit
            </button>
            <button class="btn btn-delete">Delete</button>
          </td>
        </tr>
        </c:forEach>

      </tbody>
    </table>
  </div>
  <!-- EDIT USER ROLE MODAL -->
	<div class="modal-overlay" id="user-modal">
	  <div class="modal">
	    <h3 id="modal-title">Edit User</h3>
	    <form action="${pageContext.request.contextPath}/admin/users/update-role" method="post">
	      <input type="hidden" id="edit-id" name="userId">

          <div class="user-details-grid">
            <div class="user-detail">
              <label>Full Name</label>
              <p id="detail-name">-</p>
            </div>
            <div class="user-detail">
              <label>Email</label>
              <p id="detail-email">-</p>
            </div>
            <div class="user-detail">
              <label>Phone</label>
              <p id="detail-phone">-</p>
            </div>
            <div class="user-detail">
              <label>City</label>
              <p id="detail-city">-</p>
            </div>
            <div class="user-detail">
              <label>Joined On</label>
              <p id="detail-joined">-</p>
            </div>
            <div class="form-group">
              <label for="u-role">Role</label>
              <select id="u-role" name="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
              </select>
            </div>
          </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline" onclick="closeModal()">Cancel</button>
	        <button type="submit" class="btn btn-primary">Save Role</button>
	      </div>
	    </form>
	  </div>
	</div>
  

</div>

<script>
function openEditModal(button) {
  document.getElementById('modal-title').textContent = 'Edit User';
  document.getElementById('edit-id').value = button.dataset.userid;
  document.getElementById('detail-name').textContent = (button.dataset.firstname || '-') + ' ' + (button.dataset.lastname || '');
  document.getElementById('detail-email').textContent = button.dataset.email || '-';
  document.getElementById('detail-phone').textContent = button.dataset.phone || '-';
  document.getElementById('detail-city').textContent = button.dataset.city || '-';
  document.getElementById('detail-joined').textContent = button.dataset.joined || '-';

  const role = (button.dataset.role || 'User').toLowerCase();
  document.getElementById('u-role').value = role === 'admin' ? 'admin' : 'user';
  document.getElementById('user-modal').classList.add('open');
}

function closeModal() {
  document.getElementById('user-modal').classList.remove('open');
}
</script>
</body>
</html>