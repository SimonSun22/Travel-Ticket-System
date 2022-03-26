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

<form action="RepCancelForCustomer.jsp" method="POST"  >
Type the customer userid here: <input type="text" name="userid"/> <br/>
Type the flight number here: <input type="text" name="num"/> <br/>
Type the departure date here: <input type="text" name="d_date"/> <br/>
<input type="submit" value="Submit">
	</form>	
</body>
</html>