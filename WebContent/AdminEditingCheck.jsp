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
<%
ApplicationDB db  = new ApplicationDB();	
Connection con = db.getConnection();

//Create a SQL statement
Statement stmt = con.createStatement();	
String choiceType = request.getParameter("choiceType");

if (choiceType.equals("Add Customer")){
	String insert = "INSERT INTO customerlist(ID_Num,Customer_Name,Flight_Num) VALUES (?,?,?)";  
    Connection conn = db.getConnection();
    
	String Customer_Name = request.getParameter("Customer_Name");
	String Flight_Num = request.getParameter("Flight_Num");
	String ID_Num = request.getParameter("ID_Num");
    try {
        PreparedStatement pst = conn.prepareStatement(insert);
        
        pst.setString(1, ID_Num);
        pst.setString(2, Customer_Name);
        pst.setString(3, Flight_Num);     
        pst.executeUpdate();
        pst.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    out.println("Add customer success!");
}


if (choiceType.equals("Update Customer")){
	String update = "UPDATE customerlist SET Customer_Name=?,Flight_Num= ? where ID_Num = ?";
    Connection conn = db.getConnection();
    
	String Customer_Name = request.getParameter("Customer_Name");
	String Flight_Num = request.getParameter("Flight_Num");
	String ID_Num = request.getParameter("ID_Num");
    
    try {
        PreparedStatement pst = conn.prepareStatement(update); 
        pst.setString(1, Customer_Name);
        pst.setString(2, Flight_Num);  
        pst.setString(3, ID_Num);
        pst.executeUpdate();
        pst.close(); 
    } catch (SQLException e) {
        e.printStackTrace();
    }
    out.println("Update customer success!");
}

if (choiceType.equals("Delete Customer")){
    String delete = "delete from customerlist where ID_Num = ?"; 
    Connection conn = db.getConnection();
    String ID_Num = request.getParameter("ID_Num");
    try {
        PreparedStatement pst = conn.prepareStatement(delete);
        pst.setString(1, ID_Num);
        pst.executeUpdate();
        pst.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    out.println("Delete customer success!");
}
		
%>
</body>
</html>