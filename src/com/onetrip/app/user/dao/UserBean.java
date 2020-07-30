package com.onetrip.app.user.dao;

public class UserBean {
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_gender;
	private int user_age;
	private String user_address;
	private String user_email;
	private String user_hp;
	private String user_photo;
	private int user_login_type;
	//private int user_admin; 
	
	



	public UserBean() {;}


	public int getUser_login_type() {
		return user_login_type;
	}


	public void setUser_login_type(int user_login_type) {
		this.user_login_type = user_login_type;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_gender() {
		return user_gender;
	}


	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}


	public int getUser_age() {
		return user_age;
	}


	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_hp() {
		return user_hp;
	}


	public void setUser_hp(String user_hp) {
		this.user_hp = user_hp;
	}


	public String getUser_photo() {
		return user_photo;
	}


	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}


//	public int getUser_admin() {
//		return user_admin;
//	}
//
//
//	public void setUser_admin(int user_admin) {
//		this.user_admin = user_admin;
//	}
//	
	
 
}
