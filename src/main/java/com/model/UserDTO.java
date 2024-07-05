package com.model;

import java.sql.Date;

public class UserDTO {
	private int userid;
	private String username;
	private String useremail;
	private String userpassword;
	private String usermobileno;
	private Date dob;
	private String gender;
	private String address;
	private double tokenAmount;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUsermobileno() {
		return usermobileno;
	}

	public void setUsermobileno(String usermobileno) {
		this.usermobileno = usermobileno;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getTokenAmount() {
		return tokenAmount;
	}

	public void setTokenAmount(double tokenAmount) {
		this.tokenAmount = tokenAmount;
	}

}