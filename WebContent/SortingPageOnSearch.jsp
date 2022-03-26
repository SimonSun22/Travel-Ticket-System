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

<table>
<tr>    
			<th>Aircraft ID</th>
			<th>Airline ID</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Economy Class Price</th>
			<th>Business Class Price</th>
			<th>First Class Price</th>
			<th>Duration of time</th>
			
		</tr>
		
<% try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String sortType = request.getParameter("ordertype");
	
	String searchTripType = session.getAttribute("tripType").toString();
	String deptAirport = session.getAttribute("dep_airport").toString();
	String arriAirport = session.getAttribute("arr_airport").toString();
	String oneWayDate = session.getAttribute("dep_date1").toString();
		
		if(sortType.equals("eco_price")){
		ResultSet result;
		String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' Order By econ_rate";
		
		result = st.executeQuery(str);
	

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
					
				</tr>
			<% }
		}
		else if(sortType.equals("bus_price")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' Order By bus_rate";
			
			result = st.executeQuery(str);
		

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					    <td><%= result.getString("company")%></td>
					    <td><%= result.getString("dep_time")%></td>
						<td><%= result.getString("arr_time")%></td>
						<td><%= result.getString("econ_rate")%></td>
						<td><%= result.getString("bus_rate")%></td>
						<td><%= result.getString("first_rate")%></td>
						
					</tr>
				<% }
			}
		else if(sortType.equals("fir_price")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' Order By first_rate";
			
			result = st.executeQuery(str);
		

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					    <td><%= result.getString("company")%></td>
					    <td><%= result.getString("dep_time")%></td>
						<td><%= result.getString("arr_time")%></td>
						<td><%= result.getString("econ_rate")%></td>
						<td><%= result.getString("bus_rate")%></td>
						<td><%= result.getString("first_rate")%></td>
						
					</tr>
				<% }
			}
        else if(sortType.equals("dep_time")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' order by dep_time";
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
		else if(sortType.equals("arr_time")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' order by arr_time";
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
		
		else if(sortType.equals("duration_time")){
			ResultSet result;
			String str = "SELECT *, TIME(abs(timediff(dep_time, arr_time))) as 'duration of time' FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' order by TIME(abs(timediff(dep_time, arr_time)))";
			result = st.executeQuery(str);
			
		while (result.next()) { %>
			<tr>    
					<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
					<td><%= result.getString("duration of time")%></td>
			</tr>
		<% }
		}
		

	db.closeConnection(con);
	%>
</table>

	
<%} catch (Exception e) {
	out.print(e);
}%>
</form>	
</body>
</html>