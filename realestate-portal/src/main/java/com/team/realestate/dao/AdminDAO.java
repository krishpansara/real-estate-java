package com.team.realestate.dao;

import java.sql.*;
import java.util.*;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.Property;
import com.team.realestate.model.User;


public class AdminDAO {

    public static class DashboardStats {
    	private int totalProperties;
    	private int activeListings;
    	private int totalUsers;
    	private int soldProperties;

    
	    public int getTotalProperties() {
	        return totalProperties;
	    }
	
	    public void setTotalProperties(int totalProperties) {
	        this.totalProperties = totalProperties;
	    }
	
	    public int getActiveListings() {
	        return activeListings;
	    }
	
	    public void setActiveListings(int activeListings) {
	        this.activeListings = activeListings;
	    }
	
	    public int getTotalUsers() {
	        return totalUsers;
	    }
	
	    public void setTotalUsers(int totalUsers) {
	        this.totalUsers = totalUsers;
	    }
	    
	    public int getTsoldProperties() {
	        return soldProperties;
	    }
	
	    public void setsoldProperties(int soldProperties) {
	        this.soldProperties = soldProperties;
	    }

    }
    public DashboardStats getDashboardStats() {
        DashboardStats stats = new DashboardStats();

        try {
            Connection conn = DBConnection.getConnection();

            // Total properties
            String sql1 = "SELECT COUNT(*) FROM properties";
            ResultSet rs1 = conn.createStatement().executeQuery(sql1);
            if (rs1.next()) stats.setTotalProperties(rs1.getInt(1));

            // Active listings
            String sql2 = "SELECT COUNT(*) FROM properties WHERE status = 'Active'";
            ResultSet rs2 = conn.createStatement().executeQuery(sql2);
            if (rs2.next()) stats.setActiveListings(rs2.getInt(1));

            // Total users
            String sql3 = "SELECT COUNT(*) FROM users";
            ResultSet rs3 = conn.createStatement().executeQuery(sql3);
            if (rs3.next()) stats.setTotalUsers(rs3.getInt(1));
            
            String sql4 = "SELECT COUNT(*) FROM users WHERE status = 'Sold'";
            ResultSet rs4 = conn.createStatement().executeQuery(sql4);
            if (rs4.next()) stats.setsoldProperties(rs4.getInt(1));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return stats;
    }

  
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM users ORDER BY user_id DESC";
            ResultSet rs = conn.createStatement().executeQuery(sql);

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));
                u.setEmail(rs.getString("email"));
                u.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   
    public List<Property> getAllProperties() {
        List<Property> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM properties ORDER BY property_id DESC";
            ResultSet rs = conn.createStatement().executeQuery(sql);

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   
    public List<Property> getRecentProperties(int limit) {
        List<Property> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM properties ORDER BY property_id DESC LIMIT ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

  
    public List<Property> getPropertiesByUser(int userId) {
        List<Property> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM properties WHERE user_id = ? ORDER BY property_id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   
    private Property mapRow(ResultSet rs) throws SQLException {
        Property p = new Property();
        p.setTitle(rs.getString("title"));
        p.setDescription(rs.getString("description"));
        p.setPurpose(rs.getString("purpose"));
        p.setPropertyType(rs.getString("property_type"));
        p.setPrice(rs.getDouble("price"));
        p.setBedrooms(rs.getInt("bedrooms"));
        p.setBathrooms(rs.getInt("bathrooms"));
        p.setAreaSize(rs.getInt("area_size"));
        p.setPropertyAge(rs.getInt("property_age"));
        p.setFurnishing(rs.getString("furnishing"));
        p.setFacing(rs.getString("facing"));
        p.setAvailability(rs.getString("availability"));
        p.setPriceNegotiable(rs.getBoolean("price_negotiable"));
        p.setCity(rs.getString("city"));
        p.setLocality(rs.getString("locality"));
        p.setGoogleMapUrl(rs.getString("google_map_url"));
        return p;
    }
}