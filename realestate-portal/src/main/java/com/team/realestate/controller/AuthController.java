package com.team.realestate.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

@Controller
public class AuthController {
	private UserDAO userDao = new UserDAO();
	
	@PostMapping("/sign_up")
	public String sign_up(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("password") String password, 
			@RequestParam("confirmPassword") String confirmPassword, HttpServletRequest request, HttpServletResponse response) {
		
		fname = fname != null ? fname.trim() : "";
        lname = lname != null ? lname.trim() : "";
        email = email != null ? email.trim() : "";
        
        if (fname.isEmpty() || lname.isEmpty() || email.isEmpty() || password.isEmpty() || password == null || confirmPassword.isEmpty() ||  confirmPassword == null ) {
        	return "redirect:/page?name=sign_up&error=empty_fields";
        }
        
        // Check if email already exists
        User existingUser = userDao.getUserByEmail(email);
        if (existingUser != null) {
        	return "redirect:/page?name=sign_up&error=email_exists";
        }
        
        // Password and confirm password match
        if(!password.equals(confirmPassword)) {
        	return "redirect:/page?name=sign_up&error=password_mismatch";
        }
        
        // Password length check
        if (password.length() < 6) {
            return "redirect:/page?name=sign_up&error=weak_password";
        }
        
	
		User user = new User();
		
		// Register user
		String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());
		
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setEmail(email);
		user.setPasswordHash(hashed_password);
		
		int userId = userDao.registerUser(user);
		
		if ( userId != -1) {
			
			// Prevent caching of sensitive content
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
			response.setDateHeader("Expires", 0);
			
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);
			
			// Store session data
            session.setAttribute("userId", userId);
            session.setAttribute("userName",fname + " " + lname);
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", "User");  // Default role for new users
            session.setAttribute("lastActivity", System.currentTimeMillis());
            
            System.out.println("Session created: " + session.getId());
            
			return "redirect:/page?name=home";
		} else {
			return "redirect:/page?name=login";
		}
	}
	
	//LOGIN
	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {
		email = email != null ? email.trim() : "";

        if (email.isEmpty() || password == null || password.isEmpty()) {
            return "redirect:/page?name=login&error=empty_fields";
        }
        
		User user = userDao.getUserByEmail(email);
		
		if(user != null && BCrypt.checkpw(password, user.getPasswordHash())) {
			// Prevent caching and session fixation
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
			response.setDateHeader("Expires", 0);
			
			HttpSession oldSession = request.getSession(false);
			if (oldSession != null) {
			    oldSession.invalidate();
			}
			HttpSession session = request.getSession(true);
			
			// Store session data including role
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getFirstName() + " " + user.getLastName());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());  // Store user role
            session.setAttribute("lastActivity", System.currentTimeMillis());
            
            System.out.println("Session created: " + session.getId() + ", Role: " + user.getRole());

            // Redirect based on role
            if ("Admin".equalsIgnoreCase(user.getRole())) {
                return "redirect:/page?name=dashboard";  // Redirect admin to dashboard
            } else {
                return "redirect:/page?name=home";       // Redirect user to home
            }

        } else {
            return "redirect:/page?name=login";
        }
    }
	
	// LOGOUT
    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        return "redirect:/page?name=home";
    }
    
    


}