<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script language="Javascript" type="text/javascript">
function verifypassword() {
	 pw = document.frm.newpswd.value;
	 cpw = document.frm.cnfnewpswd.value; 
	 if (pw != cpw) {
		 
		 alert("Password doesn't match..");
			return false;
	}
	 else{
		 return true;
	}
}

</script>
</head>
<body>
<%
if(session.getAttribute("userid") != null)
{
   
%>
<h2>Change Password</h2>
<hr>
<form name="frm" method="post" action="ChangePasswordCandidate" onsubmit="return verifypassword()">
Enter Current Password: <input type="password" name="currpass" required="required"><br>
Enter New Password: <input type="password" name="newpswd" required="required"><br>
Re-Enter New Password: <input type="password" name="cnfnewpswd" required="required"><br>
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