<%@page import="com.job_portal.entities.Job"%>
<%@page import="org.hibernate.query.Query"%>
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
String jobid=request.getParameter("jobid");
try 
{
	Session ses;
	Configuration cfg=new Configuration().configure(); 
	SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();
	
	Query q=ses.createQuery("update Job set availablestat=:availablestat where jobid=:id");
	q.setParameter("availablestat","no");
	q.setParameter("id",jobid);
	int i=q.executeUpdate();
	ses.getTransaction().commit();
	if(i>0)
	{
		%>Job Deleted SuccessFully!!!<br><a href="Employer.jsp">Home</a><%
	}
	
}
catch (Exception e) 
{
	// TODO: handle exception
	System.out.print(e.getMessage());
}
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>