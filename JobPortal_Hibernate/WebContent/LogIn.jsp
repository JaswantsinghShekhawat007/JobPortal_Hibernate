<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="form">
	
		<span> LogIn </span>
		
		<form name="frm" method="POST" action="LoginUser">
			
			<table>
				<tr>
					<td>UserId :</td>
					<td><input type="text" name="uid"></td>
				</tr>
				
				<tr>
					<td>Password :</td>
					<td><input type="password" name="psw"></td>
				</tr>
				
				<tr>
					<td><input type="submit" value="LogIn"></td>
				</tr>
			</table>
			
			<h3> Don't Have An Account? <a href="Register.jsp">Register Here</a> </h3>
			<h3>Forgot The Password ? No Problem <a href="Recover.jsp">Recover Here.....</a></h3>
		
		</form>
		
	</div>

</body>
</html>