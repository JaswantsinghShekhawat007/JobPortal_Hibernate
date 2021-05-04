<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.List"%>
	<%@page import="org.hibernate.query.Query"%>
	<%@page import="com.job_portal.entities.Job"%>
	<%@page import="org.hibernate.SessionFactory"%>
	<%@page import="org.hibernate.cfg.Configuration"%>
	<%@page import="org.hibernate.Session"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<header>
	<div>
		<h4>Job Portal</h4>
	</div>
	
	<div>
		<h4> <a href="Register.jsp">Register</a> </h4>
		<h4> <a href="LogIn.jsp">Log In</a> </h4>
	</div>
	
	<div>
		<hr>
		<h2>Search Job Based on Skill and Location</h2>
		<form name="frm1" method="post" action="SearchJobSkillLocation.jsp">
		Select Skill: 
		<select name="skill" >
		<%
		try
		{
			Session ses;
			Configuration cfg=new Configuration().configure();
			SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
			ses=sf.getCurrentSession();
			ses.beginTransaction();
		
			Query q=ses.createQuery("from Job");
			List lst=q.getResultList();
		
			Job obj;
			for(int i=0;lst.size()>i;i++)
			{
				obj=(Job) lst.get(i);
				
			%>
		                            <option value="<%=obj.getSkill()%>"><%=obj.getSkill()%></option>
		                         <%}
			
			
		
			
			
		
		
		%>
		 </select><br>
		Select Location: 
		<select name="location" >
		<%
		for(int i=0;lst.size()>i;i++)
		{
			obj=(Job) lst.get(i);
			
		%>
		                        <option value="<%=obj.getLocation()%>"><%=obj.getLocation()%></option>
		                     <%
		                     }
		}
		catch(Exception ex)
		{
			out.println("Error : "+ex);
		}
		%>
		</select>
		
		<br>
		<input type="submit" value="Submit">
		</form>
		<hr>
	</div>	
</header>
</body>
</html>