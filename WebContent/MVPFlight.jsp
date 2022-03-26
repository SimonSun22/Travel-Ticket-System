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
	ResultSet rs = st.executeQuery("select t.flight_num,t.dep_airport,t.arr_airport,MAX(t.ticket_num) as ticket_num from ticket t");
	out.println("Most Active Flights is <br/>");
	if(rs.next()){
		out.println("flight_num:"+rs.getString(1)+"<br/>");
		out.println("dep_airport:"+rs.getString(2)+"<br/>");
		out.println("arr_airport:"+rs.getString(3)+"<br/>");
		out.println("ticket_num:"+rs.getInt(4));
	}
%>
</body>
</html>