package com.team.realestate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.team.realestate.dao.MessageDAO;
import com.team.realestate.dao.PropertyDAO;
import com.team.realestate.model.Property;
import com.team.realestate.service.MessageEmailService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageEmailService messageEmailService;

    @PostMapping("/send")
    public String sendMessage(
            @RequestParam("propertyId") int propertyId,
            @RequestParam("message")    String message,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        // ✅ Must be logged in
        if (session == null || session.getAttribute("userId") == null) {
            return "redirect:/page?name=login";
        }

        int senderId       = (int)    session.getAttribute("userId");
        String senderName  = (String) session.getAttribute("userName");
        String senderEmail = (String) session.getAttribute("userEmail");

        // ✅ Guard empty message
        if (message == null || message.trim().isEmpty()) {
            return "redirect:/property/detail?id=" + propertyId + "&status=error";
        }

        // ✅ Fetch property + owner
        PropertyDAO propertyDAO = new PropertyDAO();
        Property property = propertyDAO.getPropertyById(propertyId);

        if (property == null) {
            return "redirect:/page?name=home";
        }

        int receiverId = property.getUserId();

        // ✅ Save to DB
        MessageDAO messageDAO = new MessageDAO();
        boolean saved = messageDAO.saveMessage(
            propertyId, senderId, receiverId, message.trim());
        System.out.println("✅ Message saved: " + saved);

        // ✅ Send emails
        messageEmailService.sendMessageToOwner(
            property.getOwnerEmail(),
            property.getOwnerFirstName() + " " + property.getOwnerLastName(),
            senderName, senderEmail,
            property.getTitle(), message.trim()
        );
        messageEmailService.sendConfirmationToSender(
            senderEmail, senderName, property.getTitle()
        );

        return "redirect:/property/detail?id=" + propertyId + "&status=sent";
    }
}