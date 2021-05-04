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
String status=request.getParameter("status");
if(status.equals("otpwrong"))
{
	%>OTP is Wrong...<br><a href="index.jsp">Landing Page</a><%
}
else if(status.equals("wronglogin"))
{
	%>Invalid Details Please Check<br><a href="index.jsp">Landing Page</a><%
}
else if(status.equals("invalidsession"))
{
	%>Invalid Session Please Login<br><a href="index.jsp">Landing Page</a><%
}
%>
</body>
</html>