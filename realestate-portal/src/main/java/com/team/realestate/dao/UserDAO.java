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

    // ✅ Get properties posted by user
    public List<Property> getUserPostedProperties(int userId) {
        List<Property> addedProperties = new ArrayList<>();

        String sql = "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, p.bedrooms, " +
                     "p.city, p.locality, p.created_at, " +
                     "(SELECT image_url FROM property_images WHERE property_id = p.property_id LIMIT 1) AS image_url " +
                     "FROM properties p WHERE p.status = 'active' AND p.user_id = ?";

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

                if (rs.getTimestamp("created_at") != null) {
                    p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }

                List<String> images = new ArrayList<>();
                String img = rs.getString("image_url");
                if (img != null && !img.isEmpty()) {
                    images.add(img);
                }
                p.setImages(images);

                addedProperties.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return addedProperties;
    }


    // ✅ Get user by ID (merged version)
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

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));

                if (rs.getTimestamp("created_at") != null) {
                    user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error in getUserById: " + e.getMessage());
        }

        return user;
    }

    public boolean updateUserRole(int userId, String role) {
        String sql = "UPDATE users SET role = ? WHERE user_id = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, role);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // ✅ Get recent users
    public List<User> getRecentUser() {
        List<User> recentUsersList = new ArrayList<>();

        String sql = "SELECT user_id, first_name, last_name, email, created_at " +
                     "FROM users ORDER BY created_at DESC LIMIT 7";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setEmail(rs.getString("email"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));

                if (rs.getTimestamp("created_at") != null) {
                    u.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }

                recentUsersList.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return recentUsersList;
    }


    // ✅ Get all users
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        String sql = "SELECT user_id, role, first_name, last_name, email, phone, city, created_at FROM users";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setRole(rs.getString("role"));
                u.setEmail(rs.getString("email"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));
                u.setCity(rs.getString("city"));
                u.setPhone(rs.getString("phone"));

                if (rs.getTimestamp("created_at") != null) {
                    u.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }

                userList.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }


    // ✅ Get user by email
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
                user.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }


    // ✅ Register user
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


    // ✅ Save reset token
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


    // ✅ Get user by reset token
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


    // ✅ Update password & clear token
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


    // ✅ Update password
    public boolean updatePassword(int userId, String newHashedPassword) {
        String sql = "UPDATE users SET password_hash=? WHERE user_id=?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, newHashedPassword);
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get full profile details by user ID
    public User getUserProfileById(int userId) {
        User user = null;
        String sql = "SELECT user_id, first_name, last_name, email, password_hash, phone, date_of_birth, gender, " +
                "street_address, city, state, zip_code, country, profile_picture, aadhar_number, created_at " +
                "FROM users WHERE user_id = ?";

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
                user.setPhone(rs.getString("phone"));
                user.setDateOfBirth(rs.getDate("date_of_birth"));
                user.setGender(rs.getString("gender"));
                user.setStreetAddress(rs.getString("street_address"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setZipCode(rs.getString("zip_code"));
                user.setCountry(rs.getString("country"));
                user.setProfilePicture(rs.getString("profile_picture"));
                user.setAadharNumber(rs.getString("aadhar_number"));
                if (rs.getTimestamp("created_at") != null) {
                    user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // ✅ Update editable user profile fields
    public boolean updateUserProfile(User user) {
        String sql = "UPDATE users SET first_name = ?, last_name = ?, email = ?, phone = ?, date_of_birth = ?, " +
                "gender = ?, street_address = ?, city = ?, state = ?, zip_code = ?, country = ?, " +
                "profile_picture = ?, aadhar_number = ? WHERE user_id = ?";

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
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get profile stats: total, active and sold properties
    public int[] getUserPropertyStats(int userId) {
        int[] stats = new int[] {0, 0, 0};
        String sql = "SELECT " +
                "COUNT(*) AS total_properties, " +
                "SUM(CASE WHEN LOWER(status) = 'active' THEN 1 ELSE 0 END) AS active_properties, " +
                "SUM(CASE WHEN LOWER(status) = 'sold' THEN 1 ELSE 0 END) AS sold_properties " +
                "FROM properties WHERE user_id = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                stats[0] = rs.getInt("total_properties");
                stats[1] = rs.getInt("active_properties");
                stats[2] = rs.getInt("sold_properties");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return stats;
    }
}