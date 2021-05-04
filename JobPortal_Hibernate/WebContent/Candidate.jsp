<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="entitybeans.Job"%>
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
%>
UserID: <%=session.getAttribute("userid") %><br>
<a href="ChangePasswordCandidate.jsp">Change Password</a><br>

<hr>
<h3>Search Job Based on Skill</h3>

<form name="frm" method="post" action="SearchJobCandidate.jsp">
Enter Skill:  <select name="skill" >

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
	
	

	
	
}
catch(Exception ex)
{
	out.println("Error : "+ex);
}

%>
                        </select><br>
                    <input type="submit" value="Search">    

</form>

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