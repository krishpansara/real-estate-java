package com.team.realestate.dao;

import java.sql.*;
import java.util.*;

import com.team.realestate.db.DBConnection;
import com.team.realestate.model.Property;

public class PropertyDAO {
	public List<Property> getAllPropertiesForCard(){
		List<Property> propertiesForCard = new ArrayList<>();
		
		String allPropertiesForCard = 
			    "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, p.bedrooms, p.city, p.locality, p.created_at, " +
			    "(SELECT image_url FROM property_images WHERE property_id = p.property_id LIMIT 1) AS image_url " +
			    "FROM properties p WHERE p.status = 'active'";
		
		try {
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(allPropertiesForCard);
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

			    propertiesForCard.add(p);
    		}
			
		} catch (Exception e ) {
            e.printStackTrace();
    	}
    	return propertiesForCard;
	}
	
	public List<Property> searchPropertiesForCard(String location, String propertyType, String bedrooms, String priceRange, String sortBy){
		List<Property> propertiesForCard = new ArrayList<>();
		
		StringBuilder query = new StringBuilder(
			    "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, p.bedrooms, p.city, p.locality, p.created_at, " +
			    "(SELECT image_url FROM property_images WHERE property_id = p.property_id LIMIT 1) AS image_url " +
			    "FROM properties p WHERE p.status = 'active'"
		);
		
		// Apply search filters
		if (location != null && !location.trim().isEmpty()) {
			query.append(" AND (p.city LIKE ? OR p.locality LIKE ?)");
		}
		
		if (propertyType != null && !propertyType.trim().isEmpty()) {
			query.append(" AND p.property_type = ?");
		}
		
		if (bedrooms != null && !bedrooms.trim().isEmpty()) {
			if ("5".equals(bedrooms)) {
				query.append(" AND p.bedrooms >= 5");
			} else {
				query.append(" AND p.bedrooms = ?");
			}
		}
		
		if (priceRange != null && !priceRange.trim().isEmpty()) {
			if ("600000+".equals(priceRange)) {
				query.append(" AND p.price >= 600000");
			} else if (priceRange.contains("-")) {
				String[] range = priceRange.split("-");
				query.append(" AND p.price >= ? AND p.price <= ?");
			}
		}
		
		// Apply sorting
		if ("price-low".equals(sortBy)) {
			query.append(" ORDER BY p.price ASC");
		} else if ("price-high".equals(sortBy)) {
			query.append(" ORDER BY p.price DESC");
		} else if ("newest".equals(sortBy)) {
			query.append(" ORDER BY p.created_at DESC");
		} else if ("bedrooms".equals(sortBy)) {
			query.append(" ORDER BY p.bedrooms DESC");
		} else {
			query.append(" ORDER BY p.created_at DESC");
		}
		
		try {
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(query.toString());
    		
    		int paramIndex = 1;
    		
    		// Set parameters for location
    		if (location != null && !location.trim().isEmpty()) {
    			String locationPattern = "%" + location + "%";
    			ps.setString(paramIndex++, locationPattern);
    			ps.setString(paramIndex++, locationPattern);
    		}
    		
    		// Set parameters for property type
    		if (propertyType != null && !propertyType.trim().isEmpty()) {
    			ps.setString(paramIndex++, propertyType);
    		}
    		
    		// Set parameters for bedrooms
    		if (bedrooms != null && !bedrooms.trim().isEmpty() && !"5".equals(bedrooms)) {
    			ps.setInt(paramIndex++, Integer.parseInt(bedrooms));
    		}
    		
    		// Set parameters for price range
    		if (priceRange != null && !priceRange.trim().isEmpty() && !priceRange.equals("600000+")) {
    			if (priceRange.contains("-")) {
    				String[] range = priceRange.split("-");
    				ps.setDouble(paramIndex++, Double.parseDouble(range[0]));
    				ps.setDouble(paramIndex++, Double.parseDouble(range[1]));
    			}
    		}
    		
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

			    propertiesForCard.add(p);
    		}
			
		} catch (Exception e ) {
            e.printStackTrace();
    	}
    	return propertiesForCard;
	}
	
	public List<Property> getAllProperties(){
		List<Property> properties = new ArrayList<>();
		
		String allProperties = "SELECT * FROM `properties`";
		
		try {
    		Connection con = DBConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement(allProperties);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			
    		}
			
		} catch (Exception e ) {
            e.printStackTrace();
    	}
    	
    	return properties;
	}
    
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
				p.setPropertyId(rs.getInt("property_id"));
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

    // INSERT PROPERTY
    public int insertProperty(Property p, int userId) {

        int id = 0;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO properties " +
                "(user_id,title,description,purpose,property_type,price," +
                "bedrooms,bathrooms,area_size,property_age,furnishing," +
                "facing,availability,price_negotiable,city,locality,google_map_url) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
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

    // ✅ Unchanged
    public void insertImages(int propertyId, List<String> images) {
        try {
            Connection con = DBConnection.getConnection();
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

    // ✅ New — fetch property with owner info
    public Property getPropertyById(int propertyId) {
        Property p = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT pr.*, " +
                         "u.first_name, u.last_name, u.email AS owner_email, u.phone " +
                         "FROM properties pr " +
                         "JOIN users u ON pr.user_id = u.user_id " +
                         "WHERE pr.property_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Property();
                p.setPropertyId(rs.getInt("property_id"));
                p.setUserId(rs.getInt("user_id"));
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
                p.setStatus(rs.getString("status"));
                p.setOwnerFirstName(rs.getString("first_name"));
                p.setOwnerLastName(rs.getString("last_name"));
                p.setOwnerEmail(rs.getString("owner_email"));
                p.setOwnerPhone(rs.getString("phone"));
                p.setImages(getImagesByPropertyId(propertyId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // ✅ New — fetch images
    public List<String> getImagesByPropertyId(int propertyId) {
        List<String> images = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT image_url FROM property_images WHERE property_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("image_url"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return images;
    }

    // Get properties by user ID
    public List<Property> getPropertiesByUserId(int userId) {
        List<Property> properties = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            if (con == null) {
                System.err.println("Database connection failed");
                return properties;
            }
            String sql = "SELECT p.property_id, p.title, p.purpose, p.property_type, p.price, p.bedrooms, p.city, p.locality, p.status, p.created_at " +
                         "FROM properties p WHERE p.user_id = ?";
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
                p.setCreatedAt(rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null);

                // Get images separately
                List<String> images = getImagesByPropertyId(p.getPropertyId());
                p.setImages(images != null ? images : new ArrayList<>());

                properties.add(p);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error in getPropertiesByUserId: " + e.getMessage());
        }
        return properties;
    }
}