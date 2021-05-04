package com.job_portal.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="job")
public class Job {
	
	@Id
	@Column(name="jobid")
	private String jobid;
	
	@Column(name="companyuserid")
	private String companyuserid;
	
	
	@Column(name="issuedate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date issuedate;
	
	@Column(name="skill")
	private String skill;
	
	@Column(name="location")
	private String location;
	
	@Column(name="pacperanum")
	private int pacperanum;
	
	@Column(name="availablestat")
	private String availablestat;
	
	
	
	public Job()
	{
		jobid="";
		companyuserid="";
		skill="";
		issuedate=new Date();
		location="";
		pacperanum=0;
		availablestat="";
	}

	public String getJobid() {
		return jobid;
	}

	public void setJobid(String jobid) {
		this.jobid = jobid;
	}

	public String getCompanyuserid() {
		return companyuserid;
	}

	public void setCompanyuserid(String companyuserid) {
		this.companyuserid = companyuserid;
	}
	
	

	public Date getIssuedate() {
		return issuedate;
	}

	public void setIssuedate(Date issuedate) {
		this.issuedate = issuedate;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPacperanum() {
		return pacperanum;
	}

	public void setPacperanum(int pacperanum) {
		this.pacperanum = pacperanum;
	}

	public String getAvailablestat() {
		return availablestat;
	}

	public void setAvailablestat(String availablestat) {
		this.availablestat = availablestat;
	}
	
	

}
