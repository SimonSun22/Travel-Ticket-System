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
<%@ page import ="java.sql.*" %>
<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			String filter = request.getParameter("filtertype");
			String str = "SELECT * FROM flights" ;
			ResultSet result = stmt.executeQuery(str);
		%>
	<table>
		<tr>    
			<th>Flight Number</th>
			<th>
				<%if (filter.equals("dep_time1")){
					out.print(" Arrival Time ");
					out.print(" Economy Price ");}
				else if (filter.equals("arr_time1")){
					out.print(" Departure Time ");
					out.print(" Economy Price ");}	
				else if (filter.equals("price1")){
					out.print(" Departure Time ");
					out.print(" Arrival Time ");}	
				%>
			</th>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td>
						<% if (filter.equals("dep_time1")){ %>
							<td><%= result.getString("flight_num") %></td>
							<td><%= result.getString("arr_time")%>
								<%= result.getString("econ_rate")%></td>
						<% }else if (filter.equals("arr_time1")){ %>
				    <td><%= result.getString("flight_num")%></td>
				    <td><%= result.getString("dep_time")%>
					   	<%= result.getString("econ_rate")%></td>								
						<% }else if (filter.equals("price1")){ %>
				    <td><%= result.getString("flight_num")%></td>
				    <td><%= result.getString("dep_time")%>
						<%= result.getString("arr_time")%></td>
						<% } %>
					</td>
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