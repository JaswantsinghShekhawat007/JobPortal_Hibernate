<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.job_portal.entities.UserData"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>

<%@page import="java.sql.*"%>
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
String userid = request.getParameter("userid");
String email = request.getParameter("email"); 
try
{
	if(email == null)
	{
		Session ses;
		Configuration cfg=new Configuration().configure(); 
		SessionFactory sf=cfg.addAnnotatedClass(UserData.class).buildSessionFactory();
		ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		Query q=ses.createQuery("from UserData where userid=:id");
		q.setParameter("id",userid);
		List lst=q.getResultList();
	if(lst.size()>0)
	{
		%>
		UserID Already Exist....
		<%
		
	}
	}
	if(userid == null)
	{
		Session ses;
		Configuration cfg=new Configuration().configure(); 
		SessionFactory sf=cfg.addAnnotatedClass(UserData.class).buildSessionFactory();
		ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		Query q=ses.createQuery("from UserData where email=:id");
		q.setParameter("id",email);
		List lst=q.getResultList();
		if(lst.size()>0)
		{
			%>
			Email Already Exist....
			<%
			
		}
		
	}
	
}
catch(Exception e)
{
out.println(e);
}

%>
</body>
</html>