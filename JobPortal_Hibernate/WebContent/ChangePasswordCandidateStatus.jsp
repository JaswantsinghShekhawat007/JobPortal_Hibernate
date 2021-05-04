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
	String status=request.getParameter("status");
	
	if(status.equals("fail"))
	{
		%>You Have Entered Wrong Current Password Please Check....<br><%
	}
	else if(status.equals("pass"))
	{
		%>Password Change SuccessFully....<br><%
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