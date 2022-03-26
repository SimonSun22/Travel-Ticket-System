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
Choose your operation!

<%

%>
<br>

   <form action="AddCustomer.jsp" method="POST"  >    	 		
       <input type="submit" name = "choice" value="Add Customer"/>
     </form><br>
   <form action="UpdateCustomer.jsp" method="POST"  >    	 		
       <input type="submit" name = "choice" value="Update Customer"/>
     </form><br>
   <form action="DeleteCustomer.jsp" method="POST"  >    	 		
       <input type="submit" name = "choice" value="Delete Customer"/>
     </form><br>

</body>
</html>