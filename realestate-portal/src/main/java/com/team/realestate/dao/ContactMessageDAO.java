package com.team.realestate.dao;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.ContactMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactMessageDAO {

    private static final String INSERT_SQL =
        "INSERT INTO contact_messages (first_name, last_name, email, phone, subject, message) " +
        "VALUES (?, ?, ?, ?, ?, ?)";

    public boolean save(ContactMessage cm) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, cm.getFirstName());
            ps.setString(2, cm.getLastName());
            ps.setString(3, cm.getEmail());
            ps.setString(4, cm.getPhone());
            ps.setString(5, cm.getSubject());
            ps.setString(6, cm.getMessage());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}