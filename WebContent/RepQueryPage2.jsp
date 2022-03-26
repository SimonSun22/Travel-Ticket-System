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
	String airport = request.getParameter("airport");
	

	if (command.equals("Add Airport")) {
		String insert = "INSERT INTO airport(`3-letter-id`)"
				+ "VALUES (?)";
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, airport);
		ps.executeUpdate();

		con.close();
		response.sendRedirect("LoginSuccessRep.jsp");
		
	}
	else if (command.equals("Delete Airport")) {
		String delete = "DELETE from airport where `3-letter-id`= '" + airport + "'";
		PreparedStatement ps = con.prepareStatement(delete);
		ps.executeUpdate();

		con.close();
		response.sendRedirect("LoginSuccessRep.jsp");
		
	}
	else {
		out.print("Failed!");
	}
	
} catch (Exception ex) {
	out.print(ex);
	out.print(" failed :()");
}
	
%>


</body>
</html>