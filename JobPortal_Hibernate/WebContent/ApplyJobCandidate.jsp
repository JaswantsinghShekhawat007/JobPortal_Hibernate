<%@page import="com.job_portal.beans.sendemail"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.job_portal.beans.JobApplliedID_generator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.job_portal.entities.JobApplied"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
	String candidateuserid=String.valueOf(session.getAttribute("userid"));
	String jobid=request.getParameter("jobid");
	String companyuserid=request.getParameter("companyuserid");
	
	
	try
	{
		Session ses;
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(JobApplied.class).buildSessionFactory();
		ses=sf.getCurrentSession();
		ses.beginTransaction();

		Query q=ses.createQuery("from JobApplied where candidateuserid=:id and jobid=:id1");
		q.setParameter("id",candidateuserid);
		q.setParameter("id1",jobid);
		List lst=q.getResultList();
		
		if(lst.size()>0)
		{
			%>
			You have applied for this previosly....
			<%
		}
		else
		{
			JobApplied ja = new JobApplied();
			ja.setJobappid(JobApplliedID_generator.generateJobAppliedID());
			ja.setCandidateuserid(candidateuserid);
			ja.setCompanyuserid(companyuserid);
			ja.setJobid(jobid);
			 SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
			    Date date = new Date();
			    String dt=formatter.format(date);
			    date=formatter.parse(dt);
			    ja.setApplydate(date);
			    ses.save(ja);
			    ses.getTransaction().commit();
			    %>
				Job Application Submitted.....
				<%
		}

	
	
	}
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
	
	
%>

<a href="Candidate.jsp">Home</a>

<%
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>