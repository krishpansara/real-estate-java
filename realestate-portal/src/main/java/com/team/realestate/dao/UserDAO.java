package com.team.realestate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.User;
import com.team.realestate.model.Property;

public class UserDAO {
	
	
	public List<Property> getUserPostedProperties(int userId) {
		List<Property> addedProperties = new ArrayList<>();
		
		String allPropertiesForCard = 
			    "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, p.bedrooms, p.city, p.locality, p.created_at, " +
			    "(SELECT image_url FROM property_images WHERE property_id = p.property_id LIMIT 1) AS image_url " +
			    "FROM properties p " +
			    "WHERE p.status = 'active' AND p.user_id = ?";
		
		try {
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(allPropertiesForCard);
    		ps.setInt(1, userId);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			Property p = new Property();

			    p.setPropertyId(rs.getInt("property_id"));
			    p.setTitle(rs.getString("title"));
			    p.setPurpose(rs.getString("purpose"));
			    p.setPropertyType(rs.getString("property_type"));
			    p.setPrice(rs.getDouble("price"));
			    p.setBedrooms(rs.getInt("bedrooms"));
			    p.setCity(rs.getString("city"));
			    p.setLocality(rs.getString("locality"));
			    p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());

			    // image from subquery or join
			    List<String> images = new ArrayList<>();
			    String img = rs.getString("image_url");
			    if (img != null && !img.isEmpty()) {
			        images.add(img);
			    }
			    p.setImages(images);

			    addedProperties.add(p);
    		}
			
		} catch (Exception e ) {
            e.printStackTrace();
    	}
    	return addedProperties;	
	}
	
	public User getUserById(int userId) {
		User user = null;
		try {
			
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.err.println("Database connection failed in getUserById");
				return null;
			}
			
			String sql = "SELECT * FROM users WHERE user_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPasswordHash(rs.getString("password_hash"));
				user.setPhone(rs.getString("phone"));
				user.setCreatedAt(rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null);
			}
			
			conn.close();
			
		} catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error in getUserById: " + e.getMessage());
        }
					
		return user;
	}
	
	public List<User> getRecentUser(){
		List<User> recentUsersList = new ArrayList<>();
		String recentUsersSql = "SELECT `user_id`, `first_name`, `last_name`, `email`, `created_at` FROM `users` ORDER BY `created_at` desc LIMIT 7";
		try { 
			Connection conn = DBConnection.getConnection(); 
			PreparedStatement recentUsersPs = conn.prepareStatement(recentUsersSql);
			ResultSet recentUsersRs = recentUsersPs.executeQuery();
			
			while( recentUsersRs.next() ) {
				User u = new User();
				u.setUserId(recentUsersRs.getInt("user_id"));
				u.setEmail(recentUsersRs.getString("email"));
				u.setFirstName(recentUsersRs.getString("first_name"));
				u.setLastName(recentUsersRs.getString("last_name"));
				u.setCreatedAt(recentUsersRs.getTimestamp("created_at").toLocalDateTime());
				recentUsersList.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return recentUsersList;
	}
	
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		String userSql = "SELECT `user_id`, `role`, `first_name`, `last_name`, `email`, `phone`, `city`, `created_at` FROM `users`";
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement userPs = conn.prepareStatement(userSql);
			ResultSet userRs = userPs.executeQuery();
			
			
			while( userRs.next() ) {
				User u = new User();
				u.setUserId(userRs.getInt("user_id"));
				u.setRole(userRs.getString("role"));
				u.setEmail(userRs.getString("email"));
				u.setFirstName(userRs.getString("first_name"));
				u.setLastName(userRs.getString("last_name"));
				u.setCity(userRs.getString("city"));
				u.setPhone(userRs.getString("phone"));
				u.setCreatedAt(userRs.getTimestamp("created_at").toLocalDateTime());
				userList.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public User getUserByEmail(String email) {
		User user = null;
		String sql = "SELECT * FROM users WHERE email = ?";
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPasswordHash(rs.getString("password_hash"));
				user.setRole(rs.getString("role"));
				
			}
			
		} catch (Exception e) {
            e.printStackTrace();
        }
		
		return user;
	}

    public int registerUser(User user) {
    	int userId = -1;
    	String sql = "INSERT INTO users(first_name,last_name,role,email,password_hash) VALUES(?,?,?,?,?)";

        try {

            Connection conn = DBConnection.getConnection();

            
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, "User");
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPasswordHash());

            ps.executeUpdate();
            
            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
            	userId = rs.getInt(1);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return userId;
    }
}