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
<%
	String choiceType  = request.getParameter("choice");

%>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="Login.jsp">Please Login</a></p>
<%} else {
	String username = session.getAttribute("user").toString();
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet useridInput;
    useridInput = st.executeQuery("select id from information where username='" + username + "'");
    while(useridInput.next()){
    	String id = useridInput.getString("id");
    	session.setAttribute("id", id);
    }
	db.closeConnection(con);

%>
Welcome <%=session.getAttribute("user")%>  You are now logged in!<br>
<a href='Upcomingflight.jsp'> Upcoming flight</a></p><br>
<a href='HistoryFlight.jsp'> History Reservations</a></p><br>
<a href='AlertPage.jsp'> Alert</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>
<form action="SearchingCheck.jsp" method="POST"  >
	Departure Airport: <input type="text" name="dep_airport"/> <br/>
	Arrival Airport: <input type="text" name="arr_airport"/> <br/>
	
	Trip Type:
	<br>
	<input type="radio" name="command" value="one" > One Way Trip 	<br>
	Departure date: <input type="text" name="dep_date1"/> 
	<br>
	<input type="radio" name="command" value="round" > Round Trip 	<br>
	Departure date: <input type="text" name="dep_date2"/> 
	Departure date: <input type="text" name="dep_date3"/> 
	<br>
	<input type="radio" name="command2" value="flexible" > Flexible Date<br>
	<input type="radio" name="command2" value="not" > Not Flexible Date<br>
	<input type="hidden" name="choiceType" value="<%=choiceType %>">
	
 	<form action="SearchingCheck.jsp">
	<input type="submit" value="Search">
	</form>	
	
	</form>	
	<br>
	<form action="QuestionAndAnswer.jsp" method="post">
        	<input type="submit" value="Ask questions">
    </form>
	<br/>
	
<%
    }
%>
</body>
</html>