package com.job_portal.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userdata")
public class UserData 
{

	@Id
	@Column(name="userid")
	private String userid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phno")
	private String phno;
	
	@Column(name="sectoken")
	private String sectoken;
	
	public UserData() {
		userid="";
		name="";
		email="";
		phno="";
		sectoken="";
	}
	
	// Generated Getter And Setter
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getSectoken() {
		return sectoken;
	}
	public void setSectoken(String sectoken) {
		this.sectoken = sectoken;
	}
	
	
	
}
