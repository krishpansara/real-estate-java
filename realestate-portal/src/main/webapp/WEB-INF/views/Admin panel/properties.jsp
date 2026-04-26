<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<title>Admin - Properties</title>
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
  .property-details-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 12px;
  }
  .property-detail {
    background: #f8f9fb;
    border: 1px solid #e9edf3;
    border-radius: 8px;
    padding: 10px 12px;
  }
  .property-detail label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 4px;
  }
  .property-detail p {
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

<div class="main">
  <div class="topbar">
    <h2>Property Management</h2>
    <span class="admin-badge">Admin</span>
  </div>
  <c:if test="${param.success == 'status_updated'}">
    <div class="status-message status-success">Property status updated successfully.</div>
  </c:if>
  <c:if test="${not empty param.error}">
    <div class="status-message status-error">
      <c:choose>
        <c:when test="${param.error == 'invalid_status'}">Invalid status selected. Choose Active or Inactive.</c:when>
        <c:when test="${param.error == 'status_update_failed'}">Unable to update property status. Please try again.</c:when>
        <c:otherwise>Something went wrong. Please try again.</c:otherwise>
      </c:choose>
    </div>
  </c:if>

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
		      	p.status eq 'inactive' ? 'badge-red' : 
			    p.status eq 'pending' ? 'badge-orange' :
			    p.status eq 'sold' ? 'badge-red' : ''}">
			    ${p.status}
			</span></td>
      		<td>${p.createdAt}</td>
      		<td>
            	<button
                class="btn btn-edit"
                onclick="openEditModal(this)"
                data-propertyid="${p.propertyId}"
                data-title="${p.title}"
                data-city="${p.city}"
                data-type="${p.propertyType}"
                data-price="${p.price}"
                data-purpose="${p.purpose}"
                data-status="${p.status}"
                data-posted="${p.createdAt}">
                Edit
              </button>
            	<button class="btn btn-delete">Delete</button>
          </td>
      	</tr>
      
      </c:forEach>
      </tbody>
    </table>
  </div>
<!-- EDIT PROPERTY STATUS MODAL -->
<div class="modal-overlay" id="prop-modal">
  <div class="modal">
    <h3 id="modal-title">Edit Property</h3>
    <form action="${pageContext.request.contextPath}/admin/properties/update-status" method="post">
      <input type="hidden" id="edit-id" name="propertyId">

      <div class="property-details-grid">
        <div class="property-detail">
          <label>Title</label>
          <p id="detail-title">-</p>
        </div>
        <div class="property-detail">
          <label>City</label>
          <p id="detail-city">-</p>
        </div>
        <div class="property-detail">
          <label>Type</label>
          <p id="detail-type">-</p>
        </div>
        <div class="property-detail">
          <label>Purpose</label>
          <p id="detail-purpose">-</p>
        </div>
        <div class="property-detail">
          <label>Price</label>
          <p id="detail-price">-</p>
        </div>
        <div class="property-detail">
          <label>Posted On</label>
          <p id="detail-posted">-</p>
        </div>
        <div class="form-group">
          <label for="p-status">Status</label>
          <select id="p-status" name="status" required>
            <option value="active">Active</option>
            <option value="inactive">Inactive</option>
          </select>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-outline" onclick="closeModal()">Cancel</button>
        <button type="submit" class="btn btn-primary">Save Status</button>
      </div>
    </form>
  </div>
</div>
</div>
<script>

function closeModal() {
	  document.getElementById('prop-modal').classList.remove('open');
	}
	
function openEditModal(button) {
	  document.getElementById('modal-title').textContent = 'Edit Property';
	  document.getElementById('edit-id').value = button.dataset.propertyid;
	  document.getElementById('detail-title').textContent = button.dataset.title || '-';
	  document.getElementById('detail-city').textContent = button.dataset.city || '-';
	  document.getElementById('detail-type').textContent = button.dataset.type || '-';
	  document.getElementById('detail-purpose').textContent = button.dataset.purpose || '-';
	  document.getElementById('detail-price').textContent = button.dataset.price || '-';
	  document.getElementById('detail-posted').textContent = button.dataset.posted || '-';
	  const status = (button.dataset.status || 'active').toLowerCase();
	  document.getElementById('p-status').value = status === 'inactive' ? 'inactive' : 'active';
	  document.getElementById('prop-modal').classList.add('open');
	}

</script>
</body>
</html>