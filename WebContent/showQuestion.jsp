<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			Statement st = con.createStatement();
			
			
			String Command = session.getAttribute("Command").toString(); 
			//System.out.println("TEST");
			
			
			//Run the query against the database.
			ResultSet result;
			
			if (Command.equals("Search By Question And Answer")) {
				String textarea = session.getAttribute("textarea").toString(); 
				String strByKey = " SELECT * FROM question_answer WHERE question LIKE '%" 
						+ textarea + "%' or answer LIKE '%" + textarea + "%'";
				result = stmt.executeQuery(strByKey);
			} 
			else if (Command.equals("Browse")) {
				String str = "SELECT * FROM question_answer";
				result = st.executeQuery(str);
			}
			else {
				String str = "SELECT * FROM question_answer";
				result = st.executeQuery(str);
			}
			
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

		<%} catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>