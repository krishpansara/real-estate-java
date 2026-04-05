package com.team.realestate.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.AdminDAO;
import com.team.realestate.dao.ContactMessageDAO;
import com.team.realestate.dao.PropertyDAO;
import com.team.realestate.dao.UserDAO;
import com.team.realestate.model.ContactMessage;
import com.team.realestate.model.Property;
import com.team.realestate.model.User;

@Controller
public class PageController {
    
    // Add this method for root path
	@GetMapping("/page")
	public String page(@RequestParam("name") String name, Model model) {

	    if ("home".equals(name)) {
	        return "Home_Pages/home";
	    } 
	    else if ("contact_us".equals(name)) {
	        return "Home_Pages/contact_us";
	    } 
	    else if ("top_offers".equals(name)) {
	        return "Home_Pages/top_offers";
	    } 
	    else if ("explore".equals(name)) {
	        return "explore/explore";
	    } 
	    else if ("about".equals(name)) {
	        return "Home_Pages/about";
	    } 
	    else if ("login".equals(name)) {
	        return "auth/login";
	    } 
	    else if ("sign_up".equals(name)) {
	        return "auth/sign_up";
	    } 
	    else if ("detailed_view".equals(name)) {
	        return "detail_offer/detail_offer";
	    } 
	    else if ("property_listing".equals(name)) {
	        return "property_listing/property_listing";
	    }
	    else if ("profile".equals(name)) {
	        return "Profile_pages/profile";
	    }
	    else if ("favourite".equals(name)) {
	        return "Favorite/Favorite";
	    }
	    else if ("edit_profile".equals(name)) {  
	        return "Profile_pages/edit_profile";
	    } 
	    else if ("forgot_password".equals(name)) {
	        return "auth/forgot_password";
	    }
	    else if ("properties".equals(name)) {
	    	PropertyDAO propertyDao = new PropertyDAO();
	    	List<Property> propertiesList = propertyDao.getAllAdminProperties();
	    	model.addAttribute("propertiesList", propertiesList);
	        return "Admin panel/properties";
	    }
	    else if ("users".equals(name)) {
	        UserDAO userDAO = new UserDAO();
	        List<User> userList = userDAO.getAllUsers();
	        model.addAttribute("userList", userList);
	        return "Admin panel/users";
	    }
	    else if ("contact".equals(name)) {
	    	ContactMessageDAO cmd = new ContactMessageDAO();
	    	List<ContactMessage> allContactMessages = cmd.getAllContactMessages();
	    	model.addAttribute("allContactMessages", allContactMessages);
	      return "Admin panel/contact_message";
	    }
	    else if ("dashboard".equals(name)) {
	    	AdminDAO adminDAO = new AdminDAO();
	    	PropertyDAO propertyDao = new PropertyDAO();
	    	UserDAO userDAO = new UserDAO();
	    	
    	 	AdminDAO.DashboardStats stats = adminDAO.getDashboardStats();
    	 	
    	 	List<Property> recentProperties = propertyDao.getRecentProperties();
    	 	List<User> recentUsers = userDAO.getRecentUser();
    	 	
	        model.addAttribute("recentUsers", recentUsers);
	        model.addAttribute("recentProperties", recentProperties);
	        model.addAttribute("stats", stats);
	        
	        return "Admin panel/dashboard";
	    }
	    else if ("home_auth".equals(name)) {
	        return "Auth_Duplicate/home_auth";
	    }
	    else if ("contact_us_auth".equals(name)) {
	        return "Auth_Duplicate/contact_us_auth";
	    }
	    else if ("about_auth".equals(name)) {
	        return "Auth_Duplicate/about_auth";
	    }
	    else {
	        return "redirect:/";
	    }
    }
}