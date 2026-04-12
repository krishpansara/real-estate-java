<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="sidebar">
  <div class="sidebar-logo">Real<span>Estate</span></div>

  <a class="nav-item ${param.name == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/page?name=dashboard">
     Dashboard
  </a>

  <a class="nav-item ${param.name == 'users' ? 'active' : ''}" href="${pageContext.request.contextPath}/page?name=users">
     Users
  </a>

  <a class="nav-item ${param.name == 'properties' ? 'active' : ''}" href="${pageContext.request.contextPath}/page?name=properties">
     Properties
  </a>
  
  <a class="nav-item ${param.name == 'contact' ? 'active' : ''}" href="${pageContext.request.contextPath}/page?name=contact"}>
  	Contact
  </a>
  
  <!-- Logout Button -->
  <div class="sidebar-logout">
    <form action="${pageContext.request.contextPath}/logout" method="POST" style="width: 100%; margin: 0;">
      <button type="submit" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i> Logout
      </button>
    </form>
  </div>
</div>

<style>
  .sidebar-logout {
    margin-top: auto;
    padding: 1rem;
    border-top: 1px solid rgba(0, 206, 209, 0.2);
  }

  .logout-btn {
    width: 100%;
    padding: 0.75rem 1rem;
    background: linear-gradient(135deg, #00CED1 0%, #00A8AA 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 0.95rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
  }

  .logout-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 206, 209, 0.3);
  }

  .logout-btn:active {
    transform: translateY(0);
  }

  .logout-btn i {
    font-size: 1rem;
  }

  /* Ensure sidebar uses flexbox to push logout to bottom */
  .sidebar {
    display: flex;
    flex-direction: column;
    height: 100vh;
  }

  .sidebar > :not(.sidebar-logout) {
    flex: 0 1 auto;
  }

  .sidebar-logout {
    flex: 0 0 auto;
    margin-top: auto;
  }
</style>