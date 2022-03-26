<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QandA Page</title>
</head>
<body>

	<br>Browse All the Questions and Answers:
	<br>
		<form action="QuestionQueryPage.jsp" method="POST"  >
       	<input type="submit" name="Command" value="Browse"/>
     	</form>
	<br>

	<br>Search for keyword:
	<br>
		<form action="QuestionQueryPage.jsp" method="POST"  >
       	<input type="text" name="textarea"/> <br/>
       	<input type="submit" name="Command" value="Search By Question And Answer"/>
     	</form>
	<br>
	
	<br>Ask your question:
		<form action="QuestionQueryPage.jsp" method="POST"  >
       	<input type="text" name="textarea"/> <br/>
       	<input type="submit" name="Command" value="Ask"/>
     	</form>
	<br>

</body>
</html>