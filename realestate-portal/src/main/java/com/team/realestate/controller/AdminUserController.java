package com.team.realestate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.UserDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminUserController {

    @PostMapping("/admin/users/update-role")
    public String updateUserRole(@RequestParam("userId") int userId,
                                 @RequestParam("role") String role,
                                 HttpSession session) {

        Object sessionUserId = session.getAttribute("userId");
        String sessionRole = (String) session.getAttribute("userRole");
        if (sessionUserId == null || sessionRole == null || !"Admin".equalsIgnoreCase(sessionRole)) {
            return "redirect:/page?name=login&error=login_required";
        }

        String normalizedRole = role == null ? "" : role.trim().toLowerCase();
        if (!"user".equals(normalizedRole) && !"admin".equals(normalizedRole)) {
            return "redirect:/page?name=users&error=invalid_role";
        }

        String dbRole = "admin".equals(normalizedRole) ? "Admin" : "User";
        UserDAO userDAO = new UserDAO();
        boolean updated = userDAO.updateUserRole(userId, dbRole);

        if (updated) {
            return "redirect:/page?name=users&success=role_updated";
        }
        return "redirect:/page?name=users&error=role_update_failed";
    }
}
