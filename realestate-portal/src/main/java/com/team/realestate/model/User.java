package com.team.realestate.model;

public class User {
		private int user_id;
		private String first_name;
	    private String last_name;
	    private String email;
	    private String password_hash;
	    
	    public int getId() {
	    	return user_id;
	    }
	    
	    public void setId(int user_id) {
	    	this.user_id = user_id;
	    }

	    public String getFirstName() {
	        return first_name;
	    }

	    public void setFirstName(String first_name) {
	        this.first_name = first_name;
	    }

	    public String getLastName() {
	        return last_name;
	    }

	    public void setLastName(String last_name) {
	        this.last_name = last_name;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPasswordHash() {
	        return password_hash;
	    }

	    public void setPasswordHash(String password_hash) {
	        this.password_hash = password_hash;
	    }
}
