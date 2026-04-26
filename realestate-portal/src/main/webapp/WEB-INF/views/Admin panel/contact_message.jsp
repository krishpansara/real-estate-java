<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  .message-preview {
    max-width: 240px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .message-details-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 12px;
  }
  .message-detail {
    background: #f8f9fb;
    border: 1px solid #e9edf3;
    border-radius: 8px;
    padding: 10px 12px;
  }
  .message-detail-full {
    grid-column: 1 / -1;
  }
  .message-detail label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 4px;
  }
  .message-detail p {
    margin: 0;
    font-weight: 600;
    color: #222;
    white-space: pre-wrap;
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
		    
		    <td class="message-preview">${empty cm.message ? "-" : cm.message}</td>
		    
		    <td>
		      ${empty cm.submittedAt ? "-" : cm.submittedAt}
		    </td>
		    
		    <td>
		      <button
                  class="btn btn-edit"
                  onclick="openViewModal(this)"
                  data-id="${cm.id}"
                  data-name="<c:out value='${empty cm.firstName ? "-" : cm.firstName} ${empty cm.lastName ? "" : cm.lastName}'/>"
                  data-email="<c:out value='${empty cm.email ? "-" : cm.email}'/>"
                  data-phone="<c:out value='${empty cm.phone ? "-" : cm.phone}'/>"
                  data-subject="<c:out value='${empty cm.subject ? "-" : cm.subject}'/>"
                  data-message="<c:out value='${empty cm.message ? "-" : cm.message}'/>"
                  data-submitted="<c:out value='${empty cm.submittedAt ? "-" : cm.submittedAt}'/>">
                  View
              </button>
		    </td>
		  </tr>
		</c:forEach>

      </tbody>

    </table>
  </div>
  <!-- VIEW CONTACT MESSAGE MODAL -->
	<div class="modal-overlay" id="view-message-modal">
	  <div class="modal">
	    <h3>Contact Message Details</h3>
        <div class="message-details-grid">
          <div class="message-detail">
            <label>ID</label>
            <p id="view-id">-</p>
          </div>
          <div class="message-detail">
            <label>Name</label>
            <p id="view-name">-</p>
          </div>
          <div class="message-detail">
            <label>Email</label>
            <p id="view-email">-</p>
          </div>
          <div class="message-detail">
            <label>Phone</label>
            <p id="view-phone">-</p>
          </div>
          <div class="message-detail">
            <label>Subject</label>
            <p id="view-subject">-</p>
          </div>
          <div class="message-detail">
            <label>Submitted At</label>
            <p id="view-submitted">-</p>
          </div>
          <div class="message-detail message-detail-full">
            <label>Message</label>
            <p id="view-message">-</p>
          </div>
        </div>
	    <div class="modal-footer">
	      <button class="btn btn-primary" onclick="closeViewModal()">Close</button>
	    </div>
	  </div>
	</div>
  

</div>

<script>
function openViewModal(button) {
  document.getElementById('view-id').textContent = button.dataset.id || '-';
  document.getElementById('view-name').textContent = button.dataset.name || '-';
  document.getElementById('view-email').textContent = button.dataset.email || '-';
  document.getElementById('view-phone').textContent = button.dataset.phone || '-';
  document.getElementById('view-subject').textContent = button.dataset.subject || '-';
  document.getElementById('view-submitted').textContent = button.dataset.submitted || '-';
  document.getElementById('view-message').textContent = button.dataset.message || '-';
  document.getElementById('view-message-modal').classList.add('open');
}

function closeViewModal() {
  document.getElementById('view-message-modal').classList.remove('open');
}
</script>

</body>
</html>