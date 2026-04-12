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
        User user = null; // ✅ FIXED: removed duplicate 'currUser' variable
        String sql = "SELECT * FROM users WHERE user_id = ?"; // ✅ FIXED: was 'userId', correct column is 'user_id'

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
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

        return user; // ✅ FIXED: was returning 'currUser' which was always null
    }

    public List<User> getRecentUser() {
        List<User> recentUsersList = new ArrayList<>();
        String recentUsersSql = "SELECT `user_id`, `first_name`, `last_name`, `email`, `created_at` FROM `users` ORDER BY `created_at` desc LIMIT 7";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement recentUsersPs = conn.prepareStatement(recentUsersSql);
            ResultSet recentUsersRs = recentUsersPs.executeQuery();

            while (recentUsersRs.next()) {
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

            while (userRs.next()) {
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

    public User getUserProfileById(int userId) {
        User user = null;
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setDateOfBirth(rs.getDate("date_of_birth"));
                user.setGender(rs.getString("gender"));
                user.setStreetAddress(rs.getString("street_address"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setZipCode(rs.getString("zip_code"));
                user.setCountry(rs.getString("country"));
                user.setProfilePicture(rs.getString("profile_picture"));
                user.setRole(rs.getString("role"));
                user.setAadharNumber(rs.getString("aadhar_number"));
                user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUserProfile(User user) {
        String sql = "UPDATE users SET first_name=?, last_name=?, email=?, phone=?, " +
                     "date_of_birth=?, gender=?, street_address=?, city=?, state=?, " +
                     "zip_code=?, country=?, profile_picture=?, aadhar_number=? WHERE user_id=?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getStreetAddress());
            ps.setString(8, user.getCity());
            ps.setString(9, user.getState());
            ps.setString(10, user.getZipCode());
            ps.setString(11, user.getCountry());
            ps.setString(12, user.getProfilePicture());
            ps.setString(13, user.getAadharNumber());
            ps.setInt(14, user.getUserId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(int userId, String newHashedPassword) {
        String sql = "UPDATE users SET password_hash=? WHERE user_id=?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newHashedPassword);
            ps.setInt(2, userId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int[] getUserPropertyStats(int userId) {
        int[] stats = {0, 0, 0};
        String sql = "SELECT " +
                     "COUNT(*) AS total, " +
                     "SUM(CASE WHEN status='active' THEN 1 ELSE 0 END) AS active_count, " +
                     "SUM(CASE WHEN status='sold' THEN 1 ELSE 0 END) AS sold_count " +
                     "FROM properties WHERE user_id=?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stats[0] = rs.getInt("total");
                stats[1] = rs.getInt("active_count");
                stats[2] = rs.getInt("sold_count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }
}
