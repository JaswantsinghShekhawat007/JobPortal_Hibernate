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
	String jobid=request.getParameter("jobid");
	
%>
<h2>Edit Job</h2>
<hr>
<form method="post" action="ModifyJobEmployer">
<input type="hidden" name="jobid" value="<%=jobid%>">
Enter Updated Skill: <input type="text" name="skill" ><br>
Enter Updated Location: <input type="text" name="location"><br>
Enter Updated Package per Anum: <input type="number" name="pacperanum"><br>
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