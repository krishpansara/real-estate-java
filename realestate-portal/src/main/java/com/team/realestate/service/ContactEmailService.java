package com.team.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class ContactEmailService {

    @Autowired
    private JavaMailSender mailSender;

    // 1. Confirmation email → sent to the user who filled the form
    public void sendConfirmationToUser(String toEmail, String firstName) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(toEmail);
        msg.setFrom("saniya.bloch10@gmail.com");   // ← same Gmail as WebConfig
        msg.setSubject("We received your message – Real Estate Portal");
        msg.setText("Hi " + firstName + ",\n\n"
                + "Thank you for contacting us! We have received your message and will get back to you within 24 hours.\n\n"
                + "Best regards,\nReal Estate Portal Team");
        mailSender.send(msg);
    }

    // 2. Notification email → sent to admin/team so they know someone submitted
    public void sendNotificationToAdmin(String firstName, String lastName,
                                        String email, String phone,
                                        String subject, String message) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo("saniya.bloch10@gmail.com");     // ← admin email to receive notifications
        msg.setFrom("saniya.bloch10@gmail.com");
        msg.setSubject("New Contact Form Submission: " + subject);
        msg.setText("New message received from the contact form:\n\n"
                + "Name    : " + firstName + " " + lastName + "\n"
                + "Email   : " + email + "\n"
                + "Phone   : " + phone + "\n"
                + "Subject : " + subject + "\n"
                + "Message :\n" + message);
        mailSender.send(msg);
    }
}