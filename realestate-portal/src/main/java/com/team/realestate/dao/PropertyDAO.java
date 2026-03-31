package com.team.realestate.dao;

import java.sql.*;
import java.util.*;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.Property;

public class PropertyDAO {

    private Connection con;
    
    public List<Property> getRecentProperties(){
    	List<Property> property_list = new ArrayList<>();
    	String recentProprtySql = "SELECT `title`, `property_type`, `price`, `status` FROM `properties` ORDER BY `created_at` DESC LIMIT 7";
    	
    	try {
    		
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(recentProprtySql);
    		ResultSet rs = ps.executeQuery();
    		
    		while( rs.next() ) {
				Property p = new Property();
				p.setTitle(rs.getString("title"));
				p.setPropertyType(rs.getString("property_type"));
				p.setStatus(rs.getString("status"));
				p.setPrice(rs.getDouble("price"));
				property_list.add(p);
    		}
    		
    	} catch ( Exception e ) {
            e.printStackTrace();
    	}
    	
    	return property_list;
    }
    
    public List<Property> getAllAdminProperties(){
    	List<Property> property_list = new ArrayList<>();
    	String proprtySql = "SELECT `property_id`, `title`, `purpose`, `property_type`, `price`, `city`,`status`, `created_at` FROM `properties`";
    	
    	try {
    		
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(proprtySql);
    		ResultSet rs = ps.executeQuery();
    		
    		while( rs.next() ) {
				Property p = new Property();
				p.setProprtyId(rs.getInt("property_id"));
				p.setTitle(rs.getString("title"));
				p.setPurpose(rs.getString("purpose"));
				p.setPropertyType(rs.getString("property_type"));
				p.setCity(rs.getString("city"));
				p.setStatus(rs.getString("status"));
				p.setPrice(rs.getDouble("price"));
				p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
				property_list.add(p);
    		}
    		
    	} catch ( Exception e ) {
            e.printStackTrace();
    	}
    	
    	return property_list;
    }

//    public PropertyDAO() {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            con = DriverManager.getConnection(
//                "jdbc:mysql://localhost:3306/real_estate_db",
//                "root",
//                ""
//            );
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    // INSERT PROPERTY
    public int insertProperty(Property p) {

        int id = 0;

        try {
            String sql = "INSERT INTO properties (user_id,title,description,purpose,property_type,price,bedrooms,bathrooms,area_size,property_age,furnishing,facing,availability,price_negotiable,city,locality,google_map_url) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, 1); // TEMP user
            ps.setString(2, p.getTitle());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getPurpose());
            ps.setString(5, p.getPropertyType());
            ps.setDouble(6, p.getPrice());
            ps.setInt(7, p.getBedrooms());
            ps.setInt(8, p.getBathrooms());
            ps.setInt(9, p.getAreaSize());
            ps.setInt(10, p.getPropertyAge());
            ps.setString(11, p.getFurnishing());
            ps.setString(12, p.getFacing());
            ps.setString(13, p.getAvailability());
            ps.setBoolean(14, p.isPriceNegotiable());
            ps.setString(15, p.getCity());
            ps.setString(16, p.getLocality());
            ps.setString(17, p.getGoogleMapUrl());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) id = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }

    // INSERT IMAGES
    public void insertImages(int propertyId, List<String> images) {

        try {
            String sql = "INSERT INTO property_images(property_id,image_url) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            for (String img : images) {
                ps.setInt(1, propertyId);
                ps.setString(2, img);
                ps.addBatch();
            }

            ps.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}