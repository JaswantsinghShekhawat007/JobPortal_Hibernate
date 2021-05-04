
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
New Job Added Successfully....<br>
<a href="Employer.jsp">Home</a>
<%
	}
	else
	{
		%>
		Their  is something wrong please Try Again...<br>
		<a href="Employer.jsp">Home</a>
		<%
	}
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>