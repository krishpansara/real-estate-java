package com.team.realestate.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		
		User user = userDao.getUserByEmail(email);
		
		if( user != null && BCrypt.checkpw(password, user.getPasswordHash())) {
			System.out.println("1");
			HttpSession session = request.getSession();
			System.out.println("12");
			session.setAttribute("userId", user.getId());
			System.out.println("13");
			session.setAttribute("userName", user.getFirstName()+ " " + user.getLastName());
			System.out.println("14");
			session.setAttribute("userEmail", user.getEmail());
			System.out.println("15");

System.out.println("Session created: " + session.getId());
System.out.println("UserId stored: " + session.getAttribute("userId"));
			
//			response.sendRedirect(request.getContextPath() + "/page?name=home");
		}else {
			response.sendRedirect(request.getContextPath() + "/page?name=login");
		}
	}

}
