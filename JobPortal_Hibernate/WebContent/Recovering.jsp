<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Recover your ID with sectoken</h3>
	
	<form name="frm" method="post" action="Recovering">
	
		<table>
					<tr>
						<td>Enter Your Security token :</td>
						<td><input type="text" name="stk"></td>
					</tr>
					
					<tr>
						<td><input type="submit" value="GetCredentials"></td>
					</tr>
				</table>
	
	</form>
</body>
</html>