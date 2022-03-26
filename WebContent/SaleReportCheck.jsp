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
	String month = request.getParameter("Month");
	ResultSet rs = st.executeQuery("select (sum(CAST(t.ticket_num AS SIGNED)*t.fare)) as Amount from ticket t where DATE_FORMAT(t.dep_date,'%Y-%m') = '"+month+"'");
	out.println(month+" sales volume is ");
	if(rs.next()){
		out.println(rs.getInt(1));
	}
%>
</body>
</html>