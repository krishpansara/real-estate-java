package com.team.realestate.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.User;




@WebServlet("/sign_up")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		
		
		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

		User user = new User();
		
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setEmail(email);
		user.setPasswordHash(hashedPassword);
		
		
		UserDAO userDao = new UserDAO();
		
		int userId = userDao.registerUser(user);

		
		if(userId != -1) {
			Cookie userEmailCookie = new Cookie("email", email);
			Cookie userIdCookie = new Cookie("userId", String.valueOf(userId));
			
			userEmailCookie.setMaxAge(30 * 60);
			userIdCookie.setMaxAge(30 * 60);
			
			userEmailCookie.setPath(request.getContextPath());
			userIdCookie.setPath(request.getContextPath());
			
			response.addCookie(userIdCookie);
			response.addCookie(userEmailCookie);			
			
			Cookie[] cookies = request.getCookies();

			if(cookies != null){

			    for(Cookie c : cookies){

			        System.out.println("Cookie Name: " + c.getName());
			        System.out.println("Cookie Value: " + c.getValue());

			    }
			}
			
			
			response.sendRedirect(request.getContextPath() + "/page?name=home");
//			response.sendRedirect("home");
		}else {
			
			response.sendRedirect(request.getContextPath() + "/page?name=sign_up");
//			response.sendRedirect("sign_up");
		}
	}

}
