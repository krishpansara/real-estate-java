package com.team.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {
    
    // Add this method for root path
	@GetMapping("/page")
	public String page(@RequestParam("name") String name) {

	    if ("home".equals(name)) {
	        return "Home_Pages/home";
	    } else if ("contact_us".equals(name)) {
	        return "Home_Pages/contact_us";
	    } else if ("top_offers".equals(name)) {
	        return "Home_Pages/top_offers";
	    } else if ("explore".equals(name)) {
	        return "explore/explore";
	    } else if ("about".equals(name)) {
	        return "Home_Pages/about";
	    } else if ("login".equals(name)) {
	        return "auth/login";
	    } else if ("sign_up".equals(name)) {
	        return "auth/sign_up";
	    } else if ("detailed_view".equals(name)) {
	        return "detail_offer/detail_offer";
	    } else if ("property_listing".equals(name)) {
	        return "property_listing/property_listing";
	    } else if ("profile".equals(name)) {
	        return "Profile_pages/profile";
	    } else if ("edit_profile".equals(name)) {  
	        return "Profile_pages/edit_profile";
	    } 
	    else if ("favorite".equals(name)) {  
	        return "Favorite/Favorite";
	    } 
	    else if ("forgot_password".equals(name)) {
	        return "auth/forgot_password";
	    }else if ("properties".equals(name)) {
	        return "Admin panel/properties";
	    }else if ("users".equals(name)) {
	        return "Admin panel/users";
	    }else if ("dashboard".equals(name)) {
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