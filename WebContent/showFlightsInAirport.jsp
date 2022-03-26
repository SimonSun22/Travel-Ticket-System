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
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			
			String airport = request.getParameter("airport");
			String str = "SELECT * FROM flights where dep_airport='" + airport + "' or arr_airport='" + airport + "'";
			
			ResultSet result = stmt.executeQuery(str);
			
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Flight Number</td>
			<td>Departure Airport</td>
			<td>Arrival Airport</td>
			<td>Departure Date</td>
			<td>Departure Time</td>
			<td>Arrival Time</td>
		</tr>
			<%
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("dep_airport") %></td>
					<td><%= result.getString("arr_airport") %></td>
					<td><%= result.getString("dep_date") %></td>
					<td><%= result.getString("dep_time") %></td>
					<td><%= result.getString("arr_time") %></td>
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