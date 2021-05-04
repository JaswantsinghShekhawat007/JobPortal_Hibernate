<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.job_portal.entities.*"%>
	<%@page import="com.job_portal.beans.JobApplliedID_generator"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="org.hibernate.query.Query"%>
	<%@page import="java.util.List"%>
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
	<%
		if(session.getAttribute("userid") != null)
		{
		   String userid=String.valueOf(session.getAttribute("userid"));
		   Query q1;
	%>
	
	UserID: <%=session.getAttribute("userid") %><br>
	
	<a href="AddNewJobEmployer.jsp">Add a New Job</a><br>
	<a href="ChangePasswordEmployer.jsp">Change Password</a><br>
	<hr>
	
	<table border="1" width="50%" style="text-align:center">
	<tr>
	<th >JobID</th>
	<th>Issue Date</th>
	<th>Skill</th>
	<th>Location</th>
	<th>Package Per Anum</th>
	<th>Action</th>
	</tr>
	<%
	try
	{
		Session ses;
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(Job.class).buildSessionFactory();
		ses=sf.getCurrentSession();
		ses.beginTransaction();
	
		Query q=ses.createQuery("from Job where companyuserid=:id");
		q.setParameter("id",userid);
		List lst=q.getResultList();
	
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
				<td><%=obj.getSkill() %></td>
				<td><%=obj.getLocation() %></td>
				<td><%=obj.getPacperanum() %></td>
				<td>
				<%
				if(obj.getAvailablestat().equals("yes"))
				{
					%>
					<a href="ModifyJobEmployer.jsp?jobid=<%=obj.getJobid()%>">Modify</a>
					
					
					<a href="DeleteJobEmployer.jsp?jobid=<%=obj.getJobid()%>">Delete</a>
					<%
				}
				else
				{
				%>Job Deleted<%
				}
				%>
				</td>
			</tr>
		<%}
		
		
	
		
		
	}
	catch(Exception ex)
	{
		out.println("Error : "+ex);
	}
	
	%>
	
	</table>
	
	
	<hr>
	<a href="Logout.jsp">Logout</a>
	
	
	<%
	}
	else
	{
		response.sendRedirect("Failure.jsp?status=invalidsession");
	}
	%>

</body>
</html>