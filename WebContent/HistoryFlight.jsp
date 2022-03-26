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
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>
<%@ page import ="java.sql.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<table>
<tr>    
			<th>ID</th>
			<th>Flight Number</th>
			<th>Ticket Number</th>
			<th>Fare</th>
			<th>Departure Date</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			
		</tr>
		
<% try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st2 = con.createStatement();
	Statement st = con.createStatement();
	Date today = new Date();
	SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
	String current = date_format.format(today);

	String username = session.getAttribute("user").toString();
	if((session.getAttribute("user") == null))
		out.println("You do not have upcoming flight.");
	else{
    	ResultSet useridInput;
        useridInput = st2.executeQuery("select id from information where username='" + username + "'");
        if(useridInput.next()){
        	String id = useridInput.getString("id");
        	
        	String ticket="select * from ticket where id='" + id + "' and dep_date<'" + current + "'";
        	ResultSet result;
            result = st.executeQuery(ticket);
        	while(result.next()){%>        	
    		<tr>        		
    		<td><%= result.getString("id")%></td>
    		<td><%= result.getString("flight_num")%></td>
    		<td><%= result.getString("ticket_num")%></td>
    		<td><%= result.getString("fare")%></td>
    		<td><%= result.getString("dep_date")%></td>
    		<td><%= result.getString("dep_airport")%></td>
    		<td><%= result.getString("arr_airport")%></td>
    		<tr>    
    		
    	<%}
        }
	
	}
	
	
	db.closeConnection(con);
	%>
	
<% } catch (Exception e) {
	out.print(e);
}%>

</table>
</form>	
</body>
</html>