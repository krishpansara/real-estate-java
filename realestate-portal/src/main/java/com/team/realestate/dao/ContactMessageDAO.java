package com.team.realestate.dao;

import java.util.ArrayList;
import java.util.List;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.ContactMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactMessageDAO {

	public List<ContactMessage> getAllContactMessages() {
		List<ContactMessage> contactMessage = new ArrayList<>();
		
		String sql = "SELECT `id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `submitted_at` FROM `contact_messages`";
		try {
			

			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ContactMessage cm = new ContactMessage();
				cm.setId(rs.getInt("id"));
				cm.setFirstName(rs.getString("first_name"));
				cm.setLastName(rs.getString("last_name"));
				cm.setEmail(rs.getString("email"));
				cm.setPhone(rs.getString("phone"));
				cm.setSubject(rs.getString("subject"));
				cm.setMessage(rs.getString("message"));
				cm.setSubmittedAt(rs.getTimestamp("submitted_at").toLocalDateTime());
				contactMessage.add(cm);
			}
		} catch (SQLException e) {
            e.printStackTrace();
		}
		
		return contactMessage;
	}



    public boolean save(ContactMessage cm) {
        String INSERT_SQL = "INSERT INTO contact_messages (first_name, last_name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?, ?)";
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