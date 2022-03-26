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
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement st = con.createStatement();

ResultSet ReservationList;
ReservationList = st.executeQuery("select flights.flight_num, information.firstname,information.lastname,information.id from flights,information where flights.flight_num = information.id group by flights.flight_num");
out.println("List of Reservation is <br/>");
out.println("Flight_Num	FirstName	LastName<br/>");
while(ReservationList.next()){
	out.println(ReservationList.getString(1)+"	"+ReservationList.getString(2)+"	"+ReservationList.getString(3)+"<br/>");
}
%>


</body>
</html>