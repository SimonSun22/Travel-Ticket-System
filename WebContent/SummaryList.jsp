<%@page import="java.sql.*"%>
<%@page import="com.CS336.pkg.ApplicationDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select a.flight_num,b.company,c.Customer_Name from ticket a left join flights b on a.flight_num = b.flight_num left join customerlist c on a.flight_num = c.Flight_Num");
	out.println("List of Summary is <br/>");
	out.println("Flight_Num	Company	Customer_Name<br/>");
	while(rs.next()){
		out.println(rs.getString(1)+"	"+rs.getString(2)+"	"+rs.getString(3)+"<br/>");
	}
%>
</body>
</html>