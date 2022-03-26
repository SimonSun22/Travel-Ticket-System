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
			
			String flight = request.getParameter("flight_num");
			String depart = request.getParameter("d_air");
			String arrive = request.getParameter("a_air");
			String date = request.getParameter("d_date");
			
			String str = "select waiting_flightnum, dep_airport, arr_airport, dep_date, username from waitinglist t join information i on t.waiting_id=i.id where waiting_flightnum='" + flight + "' and dep_airport='" + depart + "' and arr_airport = '" + arrive + "' and dep_date='" + date + "'";
			
			ResultSet result = stmt.executeQuery(str);
			
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Flight Number</td>
			<td>Departure Airport</td>
			<td>Arrival Airport</td>
			<td>Departure Date</td>
			<td>Customer</td>
		</tr>
			<%
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("waiting_flightnum") %></td>
					<td><%= result.getString("dep_airport") %></td>
					<td><%= result.getString("arr_airport") %></td>
					<td><%= result.getString("dep_date") %></td>
					<td><%= result.getString("username") %></td>
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