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
	ResultSet rs = st.executeQuery("select a.Customer_Name from customerlist a inner join (select t.flight_num,MAX(t.ticket_num) as ticket_num from ticket t ) b on a.Flight_Num = b.flight_num");
	out.println("Most Total Revenue Customer is <br/>");
	if(rs.next()){
		out.println("flight_num:"+rs.getString(1)+"<br/>");
	}
%>
</body>
</html>