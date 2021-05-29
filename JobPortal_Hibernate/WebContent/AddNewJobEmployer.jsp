<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Employer</title>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
%>
<h2>Add a New Job</h2>
<hr>
<form method="post" action="AddNewJobEmployer">
Enter Skill: <input type="text" name="skill"><br>
Enter Location: <input type="text" name="location"><br>
Enter Package per Anum: <input type="number" name="pacperanum"><br>
<input type="submit" value="Submit">
</form>

<%
}
else
{
	response.sendRedirect("Failure.jsp?status=invalidsession");
}
%>
</body>
</html>
