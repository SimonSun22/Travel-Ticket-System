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
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String newUserName = request.getParameter("newUsername");
			String newPassword = request.getParameter("newPassword");
			String backHomeButton = request.getParameter("Back");
			
			
			//Handle null input
			if(newUserName.equals("") || newPassword.equals("")) {
		    	if (newUserName.equals("")) out.println("Missing username!" + "</br>");
				if (newPassword.equals("")) out.println("Missing password!" + "</br>");
				out.println("<a href='CreateAccount.jsp'>try again</a>");
		    }
			else {
				ResultSet useridInput;
			    useridInput = stmt.executeQuery("select * from users where username='" + newUserName + "'");
			    if (useridInput.next()) {
			    	out.println("Username already exist! Please create a new one: <a href='CreateAccount.jsp'>Recreate Account</a>");
			    }
			    
			    else {
			    	 
			    	//Make an insert statement for the Sells table:
					String insert = "INSERT INTO users(username, password)"
							+ "VALUES (?, ?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					ps = con.prepareStatement(insert);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, newUserName);
					ps.setString(2, newPassword);
					//Run the query against the DB
					ps.executeUpdate();
					
					session.setAttribute("user", newUserName);
					out.print("insert succeeded");
					response.sendRedirect("LoginSuccessCustomer.jsp");
			    }
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
		}
			}
			
				
		catch (Exception ex) {
			out.print(ex);
			out.print("Insert failed :()");
		}
		
%>
</body>
</html>