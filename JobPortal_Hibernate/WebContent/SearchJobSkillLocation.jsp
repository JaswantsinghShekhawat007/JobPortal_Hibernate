<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.job_portal.entities.Job"%>
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
String skill=request.getParameter("skill");
String location=request.getParameter("location");
%>

Skill: <%=skill %><br>
Location: <%=location %>
<hr>
<%
try
{
	Session ses;
	Configuration cfg=new Configuration().configure();
	SessionFactory  sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
	ses=sf.getCurrentSession();
	ses.beginTransaction();

	Query q=ses.createQuery("from Job where skill=:id and availablestat=:id1 and location=:id2");
	q.setParameter("id",skill);
	q.setParameter("id1","yes");
	q.setParameter("id2",location);
	List lst=q.getResultList();
if(lst.size()>0)
{
	%>
<table border="1" width="50%" style="text-align:center">
<tr>
<th >JobID</th>
<th>Issue Date</th>
<th>Company UserID</th>
<th>Location</th>
<th>Package Per Anum</th>
</tr>

	
<%
	Job obj;
	for(int i=0;lst.size()>i;i++)
	{
		obj=(Job) lst.get(i);
		
	%>
	
	<tr>
			<td><%=obj.getJobid() %></td>
			<td>
			
			<%
			Date date=obj.getIssuedate();
			 SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
			 String dt=formatter.format(date);
			%>
			<%=dt %>
			</td>
			
		<td><%=obj.getCompanyuserid() %></td>
		<td><%=obj.getLocation() %></td>
		<td><%=obj.getPacperanum() %></td>
	</tr>
	
	</table>
	
	 <%
	 }
}
else
{
	%>Their is no such Job in such skill and location<%
	}
	

	
	
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}

%>
<a href="index.jsp">Back</a>


</body>
</html>