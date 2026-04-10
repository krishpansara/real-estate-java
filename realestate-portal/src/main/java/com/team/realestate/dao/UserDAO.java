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

public class UserDAO {
	
	public User getUserById(int userId) {
		User currUser = null;
		
		User user = null;
		String sql = "SELECT * FROM users WHERE userId = ?";
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
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
				
			}
			
		} catch (Exception e) {
            e.printStackTrace();
        }
					
		return currUser;
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
 // Add these two methods inside your existing UserDAO class

    public void saveResetToken(String email, String token, Timestamp expiry) {
        String sql = "UPDATE users SET reset_token = ?, token_expiry = ? WHERE email = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            ps.setTimestamp(2, expiry);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserByResetToken(String token) {
        User user = null;
        String sql = "SELECT * FROM users WHERE reset_token = ? AND token_expiry > NOW()";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
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

    public void updatePasswordAndClearToken(String email, String newHashedPassword) {
        String sql = "UPDATE users SET password_hash = ?, reset_token = NULL, token_expiry = NULL WHERE email = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newHashedPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}