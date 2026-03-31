package com.team.realestate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.team.realestate.db.DBConnection;

public class MessageDAO {

    public boolean saveMessage(int propertyId, int senderId,
                               int receiverId, String message) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO messages " +
                         "(property_id, sender_id, receiver_id, message) " +
                         "VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ps.setInt(2, senderId);
            ps.setInt(3, receiverId);
            ps.setString(4, message);
            ps.executeUpdate();
            System.out.println("✅ Message saved to DB");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}