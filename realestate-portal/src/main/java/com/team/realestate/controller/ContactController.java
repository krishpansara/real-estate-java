package com.team.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.realestate.dao.ContactDAO;
import com.team.realestate.model.ContactMessage;
import com.team.realestate.service.ContactEmailService;

@Controller
public class ContactController {

    @Autowired
    private ContactEmailService contactEmailService;

    @PostMapping("/contact")
    public String handleContact(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName")  String lastName,
            @RequestParam("email")     String email,
            @RequestParam("phone")     String phone,
            @RequestParam("subject")   String subject,
            @RequestParam("message")   String message) {

        if (firstName == null || firstName.trim().isEmpty() ||
            email     == null || email.trim().isEmpty()     ||
            message   == null || message.trim().isEmpty()) {
            return "redirect:/page?name=contact_us&status=error";
        }

        // 1. Save to DB
        ContactMessage contactMsg = new ContactMessage();
        contactMsg.setFirstName(firstName.trim());
        contactMsg.setLastName(lastName.trim());
        contactMsg.setEmail(email.trim());
        contactMsg.setPhone(phone.trim());
        contactMsg.setSubject(subject.trim());
        contactMsg.setMessage(message.trim());

        ContactDAO dao = new ContactDAO();
        boolean saved = dao.saveMessage(contactMsg);
        System.out.println("✅ Contact form saved: " + saved);

        // 2. Send emails
        contactEmailService.sendConfirmationToUser(email, firstName);
        contactEmailService.sendNotificationToAdmin(
                firstName, lastName, email, phone, subject, message);

        return "redirect:/page?name=contact_us&status=success";
    }
}