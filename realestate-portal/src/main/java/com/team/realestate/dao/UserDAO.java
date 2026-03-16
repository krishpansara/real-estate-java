package com.team.realestate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.User;

public class UserDAO {
	
	public User getUserByEmail(String email) {
		User user = null;
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM users WHERE email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("user_id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPasswordHash(rs.getString("password_hash"));
				
			}
			
		} catch (Exception e) {
            e.printStackTrace();
        }
		
		return user;
	}

    public int registerUser(User user) {
    	int userId = -1;

        try {

            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO users(first_name,last_name,email,password_hash) VALUES(?,?,?,?)";

            
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPasswordHash());

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