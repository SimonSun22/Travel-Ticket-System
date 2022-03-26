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
			<th>Flight Number</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Economy Price</th>
			
		</tr>
		
<% try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String sortType = request.getParameter("ordertype");
if(sortType.equals("price")){
		ResultSet result;
		String str = "SELECT * FROM flights Order By econ_rate";
		result = st.executeQuery(str);
	

			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("flight_num") %></td>
				    <td><%= result.getString("dep_time")%></td>
					<td><%= result.getString("arr_time")%></td>
					<td><%= result.getString("econ_rate")%></td>
				</tr>
			<% }
}
else if(sortType.equals("dep_time")){
	ResultSet result;
	String str = "SELECT * FROM flights Order By dep_time";
	result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
			    <td><%= result.getString("dep_time")%></td>
				<td><%= result.getString("arr_time")%></td>
				<td><%= result.getString("econ_rate")%></td>
			</tr>
		<% }
}
else if(sortType.equals("arr_time")){
	ResultSet result;
	String str = "SELECT * FROM flights Order By arr_time";
	result = st.executeQuery(str);


		while (result.next()) { %>
			<tr>    
				<td><%= result.getString("flight_num") %></td>
			    <td><%= result.getString("dep_time")%></td>
				<td><%= result.getString("arr_time")%></td>
				<td><%= result.getString("econ_rate")%></td>
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