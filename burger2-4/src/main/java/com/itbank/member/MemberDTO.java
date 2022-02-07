package com.itbank.member;

//USERID    NOT NULL VARCHAR2(500)  
//USERPW    NOT NULL VARCHAR2(500)  
//USERNAME  NOT NULL VARCHAR2(500)  
//GENDER    NOT NULL VARCHAR2(100)  
//PHONE     NOT NULL VARCHAR2(500)  
//EMAIL     NOT NULL VARCHAR2(800)  
//USERGRADE NOT NULL VARCHAR2(100)  
//ADDRESS   NOT NULL VARCHAR2(1000)
// emailAuth

public class MemberDTO {

	private String userid, userpw, username, gender, phone, email, usergrade, address, emailAuth;

	public String getEmailAuth() {
		return emailAuth;
	}

	public void setEmailAuth(String emailAuth) {
		this.emailAuth = emailAuth;
	}

	public String getUserid() {
		return userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public String getUsername() {
		return username;
	}

	public String getGender() {
		return gender;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getUsergrade() {
		return usergrade;
	}

	public String getAddress() {
		return address;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}

	public void setAddress(String address) {
		this.address = address;
	}

		
	
}
