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
</div>