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
<a href='BuyTicketPage.jsp'>Buy Ticket</a></p><br>
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>

<% try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();

	String id =session.getAttribute("id").toString();
	
	ResultSet result;
	result= st.executeQuery("select * from waitinglist where waiting_id ='"+id+"'");
	if(result.next()){
		String flight_num = result.getString("waiting_flightnum");
		String dep_date = result.getString("dep_date");
		String dep_airport = result.getString("dep_airport");
		String arr_airport = result.getString("arr_airport");
		int n =0;
		ResultSet check;
		check= st.executeQuery("select * from flights where flight_num ='"+flight_num+"' and dep_date ='"+dep_date+"'and available_seat >'"+n+"' ");
		if(check.next()){
			out.println("You could buy ticket for Flight Number " + flight_num);
			session.setAttribute("dep_airport", dep_airport);
			session.setAttribute("arr_airport", arr_airport);
			
		}
		else
			out.println("Please wait for seats...");

	}
	else
	{
		out.println("NO Alert!");
	}
	
	
	db.closeConnection(con);

}
catch (Exception e) {
	out.print(e);
}%>

</body>
</html>