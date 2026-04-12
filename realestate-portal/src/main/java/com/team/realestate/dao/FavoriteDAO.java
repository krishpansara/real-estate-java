package com.team.realestate.dao;

import java.sql.*;
import java.util.*;
import com.team.realestate.db.DBConnection;
import com.team.realestate.model.Property;

public class FavoriteDAO {

    // Toggle favorite: add if not exists, remove if exists
    // Returns true if added, false if removed
    public boolean toggleFavorite(int userId, int propertyId) {
        if (isFavorite(userId, propertyId)) {
            removeFavorite(userId, propertyId);
            return false;
        } else {
            addFavorite(userId, propertyId);
            return true;
        }
    }

    public boolean isFavorite(int userId, int propertyId) {
        String sql = "SELECT favorite_id FROM favorites WHERE user_id = ? AND property_id = ?";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addFavorite(int userId, int propertyId) {
        String sql = "INSERT IGNORE INTO favorites(user_id, property_id) VALUES(?, ?)";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeFavorite(int userId, int propertyId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND property_id = ?";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Property> getFavoritePropertiesByUserId(int userId) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, " +
                     "p.bedrooms, p.city, p.locality, p.status, p.created_at, " +
                     "(SELECT image_url FROM property_images WHERE property_id = p.property_id LIMIT 1) AS image_url " +
                     "FROM favorites f " +
                     "JOIN properties p ON f.property_id = p.property_id " +
                     "WHERE f.user_id = ? AND p.status = 'active' " +
                     "ORDER BY f.created_at DESC";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property p = new Property();
                p.setPropertyId(rs.getInt("property_id"));
                p.setTitle(rs.getString("title"));
                p.setPurpose(rs.getString("purpose"));
                p.setPropertyType(rs.getString("property_type"));
                p.setPrice(rs.getDouble("price"));
                p.setBedrooms(rs.getInt("bedrooms"));
                p.setCity(rs.getString("city"));
                p.setLocality(rs.getString("locality"));
                p.setStatus(rs.getString("status"));
                p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                List<String> images = new ArrayList<>();
                String img = rs.getString("image_url");
                if (img != null && !img.isEmpty()) images.add(img);
                p.setImages(images);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}