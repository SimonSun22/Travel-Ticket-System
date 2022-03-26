<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<%

try {
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	Statement stmt = con.createStatement();

	String command = request.getParameter("Command");
	String Airline = request.getParameter("airline");
	String Model = request.getParameter("model");
	String Index = request.getParameter("index");
	String Seats = request.getParameter("seats");

	if (command.equals("Add Aircrafts") && !Airline.isEmpty() && !Model.isEmpty()) {
		String insert = "INSERT INTO aircrafts(`2-letter-id`, `aircraft_model`)"
				+ "VALUES (?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, Airline);
		ps.setString(2, Model);
		ps.executeUpdate();

		con.close();

		response.sendRedirect("LoginSuccessRep.jsp");
	}
	else if (command.equals("Delete Aircrafts") && !Airline.isEmpty() && !Model.isEmpty()) {
		String delete = "DELETE from aircrafts where `aircraft_model`= '" + Model + "' and `2-letter-id`= '" + Airline + "'";
		PreparedStatement ps = con.prepareStatement(delete);
		ps.executeUpdate();

		con.close();

		response.sendRedirect("LoginSuccessRep.jsp");
	}
	else if (command.equals("Edit Aircrafts") && Airline.isEmpty() && Model.isEmpty() && !Seats.isEmpty()) {
		  String Edit = "UPDATE aircrafts set `number_seats`=? where aircraft_index=" + Index;
		  PreparedStatement ps = con.prepareStatement(Edit);
		  ps = con.prepareStatement(Edit);
		  ps.setString(1, Seats);
		  ps.executeUpdate();
		  
		  
		  out.println("Aircraft seats Edited!");
		 }
	else if (command.equals("Edit Aircrafts") && Airline.isEmpty()) {
		String Edit = "UPDATE aircrafts set `aircraft_model`=? where `aircraft_index`=" + Index;
		
		PreparedStatement ps = con.prepareStatement(Edit);
		ps = con.prepareStatement(Edit);
		ps.setString(1, Model);
		ps.executeUpdate();
		out.println("Aircraft Model Edited!");
	}
	else if (command.equals("Edit Aircrafts") && Model.isEmpty()) {
		String Edit = "UPDATE aircrafts set `2-letter-id`=? where `aircraft_index`=" + Index;
		
		PreparedStatement ps = con.prepareStatement(Edit);
		ps = con.prepareStatement(Edit);
		ps.setString(1, Airline);
		ps.executeUpdate();
		out.println("Airline Code Edited!");
	}
	else {
		out.print("Failed!");
	}
	
} catch (Exception ex) {
	out.print(ex);
	out.print("failed :()");
}
	
%>


</body>
</html>