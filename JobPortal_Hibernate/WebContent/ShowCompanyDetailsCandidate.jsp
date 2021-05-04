<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.job_portal.entities.UserData"%>
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
	String companyuserid=request.getParameter("userid");
%>
<%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory sf=cfg.addAnnotatedClass(UserData.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from UserData where userid=:id");
	q.setParameter("id",companyuserid);
	
	List lst=q.getResultList();

	UserData obj=(UserData) lst.get(0);
	%>
	Company Name: <%=obj.getName() %><br>
	Email: <%=obj.getEmail()%>
<a href="Candidate.jsp">Home</a>
<%
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>