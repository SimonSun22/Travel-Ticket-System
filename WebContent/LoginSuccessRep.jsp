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
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="Login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%>  You are now logged in!
<a href='Logout.jsp'>Log out</a>

		<%
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			//Create a SQL statement
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM aircrafts";
			String str1 = "SELECT * FROM airport";
			//String Command = session.getAttribute("Command").toString(); 
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			ResultSet result1 = stmt1.executeQuery(str1);
			
			
		%>

	<table>
	<tr>
		<td>
		<form action="QuestionQueryPage.jsp" method="post">
            <input type="submit" name="Command" value="All Questions">
    	</form>
		</td>
		
		
		
	</tr>
	</table>
	
	<table>
	<tr>
		<td>
		<form action="RepReserveForCustomer.jsp" method="post">
		
            <input type="submit" name="Command" value="Reserve Ticket For Customer">
    	</form>
		</td>
	</tr>
	</table>
	<table>
	
	<table>
	<tr>
		<td>
		<form action="RepCancelForCustomerCheck.jsp" method="post">
            <input type="submit" name="Command" value="Cancel Ticket For Customer">
    	</form>
		</td>
	</tr>
	</table>
	<table>
	
	<table>
	<tr>
		<td>
		<form action="showFlightsInAirport.jsp" method="post">
		Airport you want to search: <input type="text" name="airport"/> <br/>
            <input type="submit" name="Command" value="All flights in the airport">
    	</form>
		</td>
	</tr>
	</table>
	
	<table>
	<tr>
		<td>
		<form action="showWaitingList.jsp" method="post">
		Flight Number: <input type="text" name="flight_num"/> <br/>
        Departure Airport:<input type="text" name="d_air"/> <br/>
        Arrival Airport: <input type="text" name="a_air"/> <br/>
        Departure Date:<input type="text" name="d_date"/> <br/>
            <input type="submit" name="Command" value="Retrieve Customers on Waiting List">
    	</form>
		</td>
	</tr>
	</table>

	<table>
	
	<tr>
		<td>
		<form action="RepQueryPage.jsp" method="post">
		NEW Airline code: <input type="text" name="airline"/> <br/>
        NEW Aircraft model:<input type="text" name="model"/> <br/>
            <input type="submit" name="Command" value="Add Aircrafts">
            <input type="submit" name="Command" value="Delete Aircrafts">
    	</form>
		</td>
	</tr>
	</table>
	
	
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Aircraft Index</td>
			<td>Aircraft Model</td>
			<td>Airline Id</td>
			<td>Number of Seats</td>
			
		</tr>
			<%
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("aircraft_index") %></td>
					<td><%= result.getString("aircraft_model") %></td>
					<td><%= result.getString("2-letter-id") %></td>
					<td><%= result.getString("number_seats") %></td>
					
				</tr>
				
			<% }
			
			//close the connection.
			//db.closeConnection(con);
			%>
			
		</table>
		
		<table>
	<tr>
		<td>
		<form action="RepQueryPage.jsp" method="post">
		Aircraft Index: <input type="text" name="index"/> <br/>
		NEW Airline code: <input type="text" name="airline"/> <br/>
        NEW Aircraft model:<input type="text" name="model"/> <br/>
       	Change number of seats:<input type="text" name="seats"/> <br/>
            <input type="submit" name="Command" value="Edit Aircrafts">
    	</form>
		</td>
	</tr>
	</table>
	
	<table>
	
	<tr>
		<td>
		<form action="RepQueryPage2.jsp" method="post">
		NEW Airport: <input type="text" name="airport"/> <br/>
            <input type="submit" name="Command" value="Add Airport">
            <input type="submit" name="Command" value="Delete Airport">
    	</form>
		</td>
	</tr>
	</table>
	
	
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Airports on file</td>
		</tr>
			<%
			while (result1.next()) { %>
				<tr>    
					<td><%= result1.getString("3-letter-id") %></td>
				</tr>
				
			<% }
			
			//close the connection.
			db.closeConnection(con);
			%>
			
		</table>


<%
    }
%>
</body>
</html>