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
	Welcome our new user!
	
	<br>Please create your own account below
	<br>
		<form action="NewUserLoginCheck.jsp" method="POST"  >
       Please let us have your name: <input type="text" name="newUsername"/> <br/>
       Set your password here: <input type="password" name="newPassword"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <form action="LoginPage.jsp" method="POST"  >
       If you don't want to create, click here to go back: <input type="submit" value="Back to Login Page"/>
     </form>
	<br>
</body>
</html>