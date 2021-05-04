package com.job_portal.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="jobapplied")
public class JobApplied {
	
	@Id
	@Column(name="jobappid")
	private String jobappid;
	
	
	@Column(name="candidateuserid")
	private String candidateuserid;
	
	@Column(name="companyuserid")
	private String companyuserid;
	
	@Column(name="jobid")
	private String jobid;
	
	@Column(name="applydate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date applydate;
	
	
	
	public JobApplied()
	{
		jobappid="";
		candidateuserid="";
		jobid="";
		companyuserid="";
		applydate=new Date();
	}





	public String getCompanyuserid() {
		return companyuserid;
	}



	public void setCompanyuserid(String companyuserid) {
		this.companyuserid = companyuserid;
	}



	public String getJobappid() {
		return jobappid;
	}



	public void setJobappid(String jobappid) {
		this.jobappid = jobappid;
	}



	public String getCandidateuserid() {
		return candidateuserid;
	}

	public void setCandidateuserid(String candidateuserid) {
		this.candidateuserid = candidateuserid;
	}

	public String getJobid() {
		return jobid;
	}

	public void setJobid(String jobid) {
		this.jobid = jobid;
	}



	public Date getApplydate() {
		return applydate;
	}



	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	
	
	

}
