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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<a href='BuyTicketPage.jsp'>Buy Ticket</a></p><br>
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>
<table>
<tr>    
			<th>Flight Number</th>
			<th>Flight Company</th>
			<th>Departure Airport</th>
			<th>Departure Date</th>
			<th>Departure Time</th>
			<th>Arrival Airport</th>
			<th>Arrival Date</th>
			<th>Arrival Time</th>
			<th>Type</th>
			<th>Stop</th>
			<th>Economy Price</th>
			<th>Business Price</th>
			<th>First class Price</th>
			
		</tr>
		
<% try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	String tripType = request.getParameter("command");
	String flexible = request.getParameter("command2");
	String dep_airport = request.getParameter("dep_airport");
	String arr_airport = request.getParameter("arr_airport");
	String dep_date1 = request.getParameter("dep_date1");
	String dep_date2 = request.getParameter("dep_date2");
	String dep_date3 = request.getParameter("dep_date3");
	
	session.setAttribute("tripType", tripType);
	session.setAttribute("dep_airport", dep_airport);
	session.setAttribute("arr_airport", arr_airport);
	session.setAttribute("dep_date1", dep_date1);
	session.setAttribute("dep_date2", dep_date2);
	session.setAttribute("dep_date3", dep_date3);


	ResultSet result;
	ResultSet StopsResult;

	
	
 	
	
	if(tripType.equals("one")&&flexible.equals("not")){
		String str = "SELECT * FROM flights where dep_airport= '" + dep_airport + "' and arr_airport= '" + arr_airport + "' and dep_date= '" + dep_date1 + "'";
		 result = st.executeQuery(str);
		

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
				</tr>
			<% }
	}
	else if(tripType.equals("round")&&flexible.equals("not")){
		String str1 = "SELECT * FROM flights where dep_airport= '" + dep_airport + "' and arr_airport= '" + arr_airport + "' and dep_date= '" + dep_date2 + "'";
		 result = st.executeQuery(str1);
	

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
				</tr>
			<% }
			String str2 = "SELECT * FROM flights where arr_airport= '" + dep_airport + "' and arr_airport= '" + dep_airport + "' and dep_date= '" + dep_date3 + "'";
			 result = st.executeQuery(str2);
		

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
					</tr>
				<% }
	}
	else if(tripType.equals("round")&&flexible.equals("flexible")){
		
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date_format.parse(dep_date2));
		calendar.add(Calendar.DATE, -3);
		String dep2min3 = date_format.format(calendar.getTime());

		
		calendar.setTime(date_format.parse(dep_date2));
		calendar.add(Calendar.DATE, 3);
		String dep2add3 = date_format.format(calendar.getTime());

		
		calendar.setTime(date_format.parse(dep_date3));
		calendar.add(Calendar.DATE, -3);
		String dep3min3 = date_format.format(calendar.getTime());

	
		calendar.setTime(date_format.parse(dep_date3));
		calendar.add(Calendar.DATE, 3);
		String dep3add3 = date_format.format(calendar.getTime());

		
		String str1 = "SELECT * FROM flights where dep_airport= '" + dep_airport + "' and arr_airport= '" + arr_airport + "'and dep_date>= '" + dep2min3 + "'and dep_date<= '" + dep2add3 + "'";
		 result = st.executeQuery(str1);
	

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
				</tr>
			<% }
			String str2 = "SELECT * FROM flights where dep_airport= '" + arr_airport + "' and arr_airport= '" + dep_airport + "'and dep_date>= '" + dep3min3 + "'and dep_date<= '" + dep3add3 + "'";
			 result = st.executeQuery(str2);

				while (result.next()) { %>
					<tr>    
						<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("stops")%></td>
					<td><%= result.getString("econ_rate")%></td>
					<td><%= result.getString("bus_rate")%></td>
					<td><%= result.getString("first_rate")%></td>
					</tr>
				<% }
	}
	else if(tripType.equals("one")&&flexible.equals("flexible")){
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date_format.parse(dep_date1));
		calendar.add(Calendar.DATE, -3);
		String dep1min3 = date_format.format(calendar.getTime());
		
		calendar.setTime(date_format.parse(dep_date1));
		calendar.add(Calendar.DATE, 3);
		String dep1add3 = date_format.format(calendar.getTime());
		
		String str = "SELECT * FROM flights where dep_airport= '" + dep_airport + "' and arr_airport= '" + arr_airport + "' and dep_date>= '" + dep1min3 + "'and dep_date<= '" + dep1add3 + "'";
		 result = st.executeQuery(str);
		

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
					<td><%= result.getString("company") %></td>
				    <td><%= result.getString("dep_airport")%></td>
					<td><%= result.getString("dep_date")%></td>
				    <td><%= result.getString("dep_time")%></td>
				    <td><%= result.getString("arr_airport")%></td>
					<td><%= result.getString("arr_date")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("type")%></td>
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
		Sort by:
		<br>
		</form>	
		<form action="SortingPageOnSearch.jsp" method="POST"  >
		<input type="radio" name="ordertype" value="eco_price" > Economy Class Price From Low to High<br>
		<input type="radio" name="ordertype" value="bus_price" > Business Class Price From Low to High<br>
		<input type="radio" name="ordertype" value="fir_price" > First Class Price From Low to High<br>
		<input type="radio" name="ordertype" value="dep_time" > Departure time<br>
		<input type="radio" name="ordertype" value="arr_time" > Arrival time<br>
		<input type="radio" name="ordertype" value="duration_time" > Duration of time<br>
	
		<input type="submit" value="Submit">
		</form>	
		<br>
		
		Filter by Stops:
		<br>
		</form>	
		<form action="FilterPageOnSearch.jsp" method="POST"  >
		<input type="radio" name="filtertype" value="non_stop" >Non-Stop<br>
		<input type="radio" name="filtertype" value="one_stop" >One stop<br>
		<input type="radio" name="filtertype" value="two_stop" >Two stops<br>
		<input type="radio" name="filtertype" value="two_more_stop" >Two+ stops<br>	
		Filter by departure time:
		<br>
		<input type="radio" name="filtertype" value="d_early_morning" >00:00 - 7:59<br>
		<input type="radio" name="filtertype" value="d_morning_noon" >8:00 - 15:59<br>
		<input type="radio" name="filtertype" value="d_afternoon_evening" >16:00 - 23:59<br>
		Filter by arrival time:
		<br>
		<input type="radio" name="filtertype" value="a_early_morning" >00:00 - 7:59<br>
		<input type="radio" name="filtertype" value="a_morning_noon" >8:00 - 15:59<br>
		<input type="radio" name="filtertype" value="a_afternoon_evening" >16:00 - 23:59<br>
		Filter by economy class price:
		<br>
		<input type="radio" name="filtertype" value="under200" >0$ - 199$<br>
		<input type="radio" name="filtertype" value="under400" >200$ - 399$<br>
		<input type="radio" name="filtertype" value="above400" >400$+<br>
		
		<input type="submit" value="Submit">
		</form>	
		<br>
		

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	</form>	
		</body>
</html>