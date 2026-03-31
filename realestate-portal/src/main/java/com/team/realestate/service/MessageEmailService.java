package com.team.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MessageEmailService {

    @Autowired
    private JavaMailSender mailSender;

    // Email to property owner
    public void sendMessageToOwner(String ownerEmail, String ownerName,
                                   String senderName, String senderEmail,
                                   String propertyTitle, String message) {
        try {
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setTo(ownerEmail);
            msg.setFrom("saniya.bloch10@gmail.com");
            msg.setSubject("New Inquiry for Your Property: " + propertyTitle);
            msg.setText(
                "Hello " + ownerName + ",\n\n" +
                "You have received a new message for your property: "
                + propertyTitle + "\n\n" +
                "From   : " + senderName + "\n" +
                "Email  : " + senderEmail + "\n\n" +
                "Message:\n" + message + "\n\n" +
                "Reply directly to: " + senderEmail + "\n\n" +
                "Best regards,\nReal Estate Portal Team"
            );
            mailSender.send(msg);
            System.out.println("✅ Email sent to owner: " + ownerEmail);
        } catch (Exception e) {
            System.out.println("❌ Email to owner failed: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Confirmation to sender
    public void sendConfirmationToSender(String senderEmail, String senderName,
                                         String propertyTitle) {
        try {
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setTo(senderEmail);
            msg.setFrom("saniya.bloch10@gmail.com");
            msg.setSubject("Your message has been sent – Real Estate Portal");
            msg.setText(
                "Hi " + senderName + ",\n\n" +
                "Your message regarding \"" + propertyTitle + "\" " +
                "has been sent to the owner.\n\n" +
                "The owner will contact you shortly.\n\n" +
                "Best regards,\nReal Estate Portal Team"
            );
            mailSender.send(msg);
            System.out.println("✅ Confirmation sent to: " + senderEmail);
        } catch (Exception e) {
            System.out.println("❌ Confirmation email failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
}