<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>

<form action="SuccessBuying.jsp" method="POST"  >
Flight Number:<input type="text" name="flight_num"/> <br/>
Airline Company:<input type="text" name="company"/> <br/>
Departure Date: <input type="text" name="dep_date1"/> <br/>
Class Type:<br/>
<input type="radio" name="classtype" value="eco" > Economy 	<br>
<input type="radio" name="classtype" value="business" > Business <br>
<input type="radio" name="classtype" value="first" > First <br>
Trip Type:<br/>
<input type="radio" name="triptype" value="one" > One Way 	<br>
<input type="radio" name="triptype" value="round" > Round Trip	<br>
Back Flight Number: <input type="text" name="back_num"/> <br/>
Back Airline Company: <input type="text" name="back_company"/> <br/>
Back Departure Date: <input type="text" name="dep_date2"/> <br/>
Class Type:<br/>
<input type="radio" name="classtype2" value="eco" > Economy 	<br>
<input type="radio" name="classtype2" value="business" > Business <br>
<input type="radio" name="classtype2" value="first" > First <br>
<input type="submit" value="Submit">
	</form>	
</body>
</html>