package com.team.realestate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.team.realestate.db.DBConnection;
import com.team.realestate.model.ContactMessage;

public class ContactDAO {

    public boolean saveMessage(ContactMessage msg) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO contact_messages (first_name, last_name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, msg.getFirstName());
            ps.setString(2, msg.getLastName());
            ps.setString(3, msg.getEmail());
            ps.setString(4, msg.getPhone());
            ps.setString(5, msg.getSubject());
            ps.setString(6, msg.getMessage());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}