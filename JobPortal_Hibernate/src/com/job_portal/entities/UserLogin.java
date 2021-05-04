package com.job_portal.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userlogin")
public class UserLogin 
{
	
	// Mapping Our Properties With Database Table
	
	@Id
	@Column(name="userid")
	private String userid;
	
	@Column(name="password")
	private String password;
	
	@Column(name="usertype")
	private String usertype;
	
	public UserLogin() {
		userid="";
		password="";
		usertype="";
	}
	
	// Generated Setter And Getter Below
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	
	
}
