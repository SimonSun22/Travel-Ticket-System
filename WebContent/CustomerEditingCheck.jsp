<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
    ApplicationDB customer = new ApplicationDB();	
	Connection con = customer.getConnection();
	
	String Customer_Name = request.getParameter("Customer_Name");
	String Flight_Num = request.getParameter("Flight_Num");
	String ID_Num = request.getParameter("ID_Num");
	String Customer_Rep = request.getParameter("Customer_Rep");
	
	
	Statement ci = con.createStatement();	
	String AdminOption = request.getParameter("choiceType");
	
	if (AdminOption == null){
		System.out.print("failed");
	}
	
	if (AdminOption.equals("Add Customer")) {
		

		String insert = "INSERT INTO customer(Customer_Name, Flight_Num,ID_Num,Customer_Rep)"
				+ "VALUES (?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);

		
		ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, Customer_Name);
		ps.setString(2, Flight_Num);
		ps.setString(3, ID_Num);
		ps.setString(4, Customer_Rep);
		//Run the query against the DB
		ps.executeUpdate();	
		
    }
	
	con.close();
	
}
	
	catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
	
	
	/* if (AdminOption.equals("Edit Customer")){
		System.out.print("Edit");
	}
	
	if (AdminOption.equals("Delete Customer")){
		System.out.print("Delete");
	}*/
%>
</body>
</html>