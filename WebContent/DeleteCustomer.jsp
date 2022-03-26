<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Enter Customer information:
<%@ page import ="java.sql.*" %>

<%
	String choiceType  = request.getParameter("choice");

%>
<form action="AdminEditingCheck.jsp" method="POST"  >    
Identity Number:<input type="text" name="ID_Num"/>
<input type="hidden" name="choiceType" value="<%=choiceType %>">
<input type="submit" value="delete"/>
</form><br/>
</body>
</html>