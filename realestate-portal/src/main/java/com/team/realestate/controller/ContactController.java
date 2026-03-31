package com.team.realestate.controller;

import com.team.realestate.dao.ContactMessageDAO;
import com.team.realestate.model.ContactMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ContactController {

    private final ContactMessageDAO dao = new ContactMessageDAO();

    @PostMapping("/contact")
    public String handleContact(HttpServletRequest request,
                                RedirectAttributes redirectAttributes) {

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String phone     = request.getParameter("phone");
        String subject   = request.getParameter("subject");
        String message   = request.getParameter("message");

        // Server-side validation
        if (firstName == null || firstName.trim().isEmpty() ||
            email     == null || email.trim().isEmpty()) {

            redirectAttributes.addFlashAttribute("status", "error");
            return "redirect:/page?name=contact_us"; // ← matches your PageController
        }

        // Build model
        ContactMessage cm = new ContactMessage();
        cm.setFirstName(firstName.trim());
        cm.setLastName(lastName.trim());
        cm.setEmail(email.trim());
        cm.setPhone(phone.trim());
        cm.setSubject(subject.trim());
        cm.setMessage(message.trim());

        // Save to DB
        boolean saved = dao.save(cm);

        redirectAttributes.addFlashAttribute("status", saved ? "success" : "error");

        return "redirect:/page?name=contact_us"; // ← Spring resolves this via PageController
    }
}