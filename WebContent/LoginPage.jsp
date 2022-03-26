<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome</title>
	</head>
	
	<body>

		Welcome to the ticket system <!-- the usual HTML way -->
	
		<br>Please enter your account information below
	<br>
		<form action="LoginCheck.jsp" method="POST"  >
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       			Select your user type as follow:<br/>
       			<input type="radio" name="command" value="customer"/>Customer<br/>
	   			<input type="radio" name="command" value="admin"/>Administrator<br/>
	   			<input type="radio" name="command" value="cus reps"/>Customer Representative<br/>
       <input type="submit" value="Submit"/>
       <br/><br/>Author: Group40
     <br/>GroupMember: Chen Tongji, Luo Hao, Sun Denghao
     </form>
	<br>
	

</body>
</html>

