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
	if(request.getParameter("status").equals("pass"))
	{
		%>
		Job Modified Successfully!!!!
		<%	
	}
	else
	{
		%>
		Their is something wrong please try again....
		<%
	}
	%><br><a href="Employer.jsp">Home</a><%
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>