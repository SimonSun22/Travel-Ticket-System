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
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>


<%
try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String id = session.getAttribute("id").toString();
	String flight_num=request.getParameter("flight_num");
	String dep_date=request.getParameter("dep_date");

	ResultSet classtype;
	classtype= st.executeQuery("select classtype from ticket where id ='"+id+"' and flight_num ='"+flight_num+"' and dep_date ='"+dep_date+"'");
	
	if (classtype.next()){
		String type = classtype.getString("classtype");
		if(type.equals("eco"))
			out.println("You cannot cancel because your class is economy.");
		else{
			String sql = "Delete from ticket where id ='"+id+"' and flight_num ='"+flight_num+"'and dep_date ='"+dep_date+"'";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
			int n=1;
			String update="Update flights set available_seat = available_seat+"+n+" where flight_num ='"+flight_num+"'and dep_date ='"+dep_date+"'";
			st.executeUpdate(update);
			out.println("Your ticket is canceled now.");}
	}
	else
		out.println("Are you sure that you type correct?");
	
	db.closeConnection(con);
}
catch (Exception e) {
	out.print(e);
}
%>
</body>
</html>