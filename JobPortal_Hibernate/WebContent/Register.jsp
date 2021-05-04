<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>

	<script language="Javascript" type="text/javascript">
            
            
            function createRequestObject() {
                var tmpXmlHttpObject;
                if (window.XMLHttpRequest) {
                        tmpXmlHttpObject = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
            
                return tmpXmlHttpObject;
            }
            
            
            var http1 = createRequestObject();

            function makeGetRequest1() {
                userid=document.frm.uid.value;
                http1.open('get', 'usidemailcheck.jsp?userid=' + userid);
                http1.onreadystatechange = processResponse1;
                http1.send(null);
            }

            function processResponse1() {
                if(http1.readyState == 4){
                    var response1 = http1.responseText;
                    document.getElementById('useridstat').innerHTML = response1;
                }
            }
            
            var http2 = createRequestObject();

            function makeGetRequest2() {
                email=document.frm.eml.value;
                http2.open('get', 'usidemailcheck.jsp?email='+email);
                http2.onreadystatechange = processResponse2;
                http2.send(null);
            }

            function processResponse2() {
                if(http2.readyState == 4){
                    var response2 = http2.responseText;
                    document.getElementById('emailstat').innerHTML = response2;
                }
            }
            
            
            function verifypassword() {
           	 psw = document.frm.psw.value;
           	 cpw = document.frm.cpw.value; 
           	 if (psw != cpw) {
           		 
           		 alert("Password Did Not Match..");
           			return false;
           	}
           	 else{
           		 return true;
           	}
           }
            
            </script>

</head>
<body>

	<div class="form">
	
		<span> Register Here  </span>
		
		<form name="frm" method="POST" action="RegisterUser" onsubmit="return verifypassword()">
			
			<table>
				<tr>
					<td>Enter UserId :</td>
					<td><input type="text" name="uid" onblur="makeGetRequest1()"></td>
					<td><div id="useridstat"></div></td>
				</tr>
				
				<tr>
					<td>Enter Your Name :</td>
					<td><input type="text" name="nm"></td>
				</tr>
				
				<tr>
					<td>Enter Email :</td>
					<td><input type="email" name="eml" onblur="makeGetRequest2()"></td>
					<td><div id="emailstat"></div></td>
				</tr>
				
				<tr>
					<td>Enter Phone Number :</td>
					<td><input type="text" name="phn"></td>
				</tr>
				
				<tr>
					<td>You Are Here As... :</td>
					<td>
						<select name="utp">
							<option value="Candidate">Candidate</option>
							<option value="Employer">Employer</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>Enter Password :</td>
					<td><input type="password" name="psw"></td>
				</tr>
				
				<tr>
					<td>Confirm Password :</td>
					<td><input type="password" name="cpw"></td>
				</tr>
				
				<tr>
					<td><input type="submit" value="Register"></td>
				</tr>
			</table>
			
			<h3> Already Have An Account? <a href="LogIn.jsp">LogIn Here</a> </h3>
		
		</form>
		
	</div>

</body>
</html>