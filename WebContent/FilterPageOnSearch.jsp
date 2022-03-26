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
			<th>Number of Stops</th>
			<th>Economy Class Price</th>
			<th>Business Class Price</th>
			<th>First Class Price</th>
			<th>Duration of time</th>
			
		</tr>
		
<% try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String sortType = request.getParameter("filtertype");
	
	//String searchTripType = session.getAttribute("tripType").toString();
	String deptAirport = session.getAttribute("dep_airport").toString();
	String arriAirport = session.getAttribute("arr_airport").toString();
	String oneWayDate = session.getAttribute("dep_date1").toString();
	
		
		if(sortType.equals("non_stop")){
		ResultSet result;
		String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' and stops=0";
		
		result = st.executeQuery(str);
	

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
					
				</tr>
			<% }
		}
		else if(sortType.equals("one_stop")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' and stops=1";
			
			result = st.executeQuery(str);
		

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					    <td><%= result.getString("company")%></td>
					    <td><%= result.getString("dep_time")%></td>
						<td><%= result.getString("arr_time")%></td>
						<td><%= result.getString("stops")%></td>
						<td><%= result.getString("econ_rate")%></td>
						<td><%= result.getString("bus_rate")%></td>
						<td><%= result.getString("first_rate")%></td>
						
					</tr>
				<% }
			}
		else if(sortType.equals("two_stop")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' and stops=2";
			
			result = st.executeQuery(str);
		

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					    <td><%= result.getString("company")%></td>
					    <td><%= result.getString("dep_time")%></td>
						<td><%= result.getString("arr_time")%></td>
						<td><%= result.getString("stops")%></td>
						<td><%= result.getString("econ_rate")%></td>
						<td><%= result.getString("bus_rate")%></td>
						<td><%= result.getString("first_rate")%></td>
						
					</tr>
				<% }
			}
        else if(sortType.equals("two_more_stop")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport='" + arriAirport + "' and dep_date='" + oneWayDate + "' and stops>2";
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("d_early_morning")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and dep_time >= '00:00:00' and dep_time <= '07:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("d_morning_noon")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and dep_time >= '08:00:00' and dep_time <= '15:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("d_afternoon_evening")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and dep_time >= '16:00:00' and dep_time <= '23:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("a_early_morning")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and arr_time >= '00:00:00' and arr_time <= '07:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("a_morning_noon")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and arr_time >= '08:00:00' and arr_time <= '15:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
        else if(sortType.equals("a_afternoon_evening")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and arr_time >= '16:00:00' and arr_time <= '23:59:59'" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
		else if(sortType.equals("under200")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and econ_rate >= 0 and econ_rate <= 199" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
		else if(sortType.equals("under400")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and econ_rate >= 200 and econ_rate <= 399" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
			</tr>
		<% }
		}
		else if(sortType.equals("above400")){
			ResultSet result;
			String str = "SELECT * FROM flights WHERE dep_airport='" + deptAirport + "' and arr_airport ='" + arriAirport + "' and econ_rate >= 400" ;
			result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("company")%></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
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