<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM question_answer";
			String Command = session.getAttribute("Command").toString(); 
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Question Number</td>
			<td>Question</td>
			<td>Answer</td>
		</tr>
			<%
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("qid") %></td>
					<td><%= result.getString("question") %></td>
					<td><%= result.getString("answer") %></td>
				</tr>
				
			<% }
			
			//close the connection.
			db.closeConnection(con);
			%>
			
		</table>
		
		
		<form action="QuestionQueryPage.jsp" method="POST"  >
		<br>Type the question number you want to answer:
       	<input type="text" name="textarea1"/> <br/>
       	<br>Write your answer:
       	<input type="text" name="textarea2"/> <br/>
       	<input type="submit" name="Command" value="repAsk"/>
     	</form>
		<br>

		<%} catch (Exception e) {
			out.print(e);
		}%>
	
</body>
</html>