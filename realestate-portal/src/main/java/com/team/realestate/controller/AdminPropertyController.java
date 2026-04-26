package com.team.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.PropertyDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminPropertyController {

    @PostMapping("/admin/properties/update-status")
    public String updatePropertyStatus(@RequestParam("propertyId") int propertyId,
                                       @RequestParam("status") String status,
                                       HttpSession session) {
        Object sessionUserId = session.getAttribute("userId");
        String sessionRole = (String) session.getAttribute("userRole");
        if (sessionUserId == null || sessionRole == null || !"Admin".equalsIgnoreCase(sessionRole)) {
            return "redirect:/page?name=login&error=login_required";
        }

        String normalizedStatus = status == null ? "" : status.trim().toLowerCase();
        if (!"active".equals(normalizedStatus) && !"inactive".equals(normalizedStatus)) {
            return "redirect:/page?name=properties&error=invalid_status";
        }

        PropertyDAO propertyDAO = new PropertyDAO();
        boolean updated = propertyDAO.updatePropertyStatus(propertyId, normalizedStatus);
        if (updated) {
            return "redirect:/page?name=properties&success=status_updated";
        }
        return "redirect:/page?name=properties&error=status_update_failed";
    }
}
