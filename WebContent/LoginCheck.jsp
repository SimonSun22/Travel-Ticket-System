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
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement st = con.createStatement();
	
	String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String userType = request.getParameter("command");
    
    if(userid.equals("") || pwd.equals("") || userType == null) {
    	if (userid.equals("")) out.println("Missing username!" + "</br>");
		if (pwd.equals("")) out.println("Missing password!" + "</br>");
    	if (userType == null) out.println("Please select your user type!" + "</br>");
    	out.println("<a href='LoginPage.jsp'>try again</a>");
    }
    else {
    	if (userType.equals("customer")){
        	ResultSet useridInput;
            useridInput = st.executeQuery("select * from users where username='" + userid + "'");
            if (useridInput.next()) { // check if it is the matched username.
            	ResultSet passwordInput;
                passwordInput = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
                if (passwordInput.next()) { // check if it is the matched password.
                	session.setAttribute("user", userid); 
                    out.println("welcome " + userid);
                    out.println("<a href='Logout.jsp'>Log out</a>");
                    response.sendRedirect("LoginSuccessCustomer.jsp");
                }
                
                else {
                	out.println("Invalid password <a href='LoginPage.jsp'>try again</a>");
                }
                
            } else {
            	if (userType == null) {
            		out.println("Please select your user type!: <a href='LoginPage.jsp'>Redirect to homepage</a>");
            	}
            	else {
            		out.println("Username: '" + userid + "' does not exist!" + "</br>");
                	out.println("Retype your account if you made a typo: <a href='LoginPage.jsp'>Retype your account</a>" + "</br>");
                	out.println("If you don't have one, please create an account here: <a href='CreateAccount.jsp'>Create Account</a>");
            	}
      
            }
        }
        	 else if (userType.equals("admin")){
        	    	ResultSet useridInput;
        	        useridInput = st.executeQuery("select * from Admin where username='" + userid + "'");
        	        if (useridInput.next()) { // check if it is the matched username.
        	        	ResultSet passwordInput;
        	            passwordInput = st.executeQuery("select * from Admin where username='" + userid + "' and password='" + pwd + "'");
        	            if (passwordInput.next()) { // check if it is the matched password.
        	            	session.setAttribute("user", userid); 
        	                out.println("welcome " + userid);
        	                out.println("<a href='Logout.jsp'>Log out</a>");
        	                response.sendRedirect("AdminMenu.jsp");
        	            }
        	            
        	            else {
        	            	out.println("Invalid password <a href='LoginPage.jsp'>try again</a>");
        	            }
        	            
        	        } else {
        	        	if (userType == null) {
        	        		out.println("Please select your user type!: <a href='LoginPage.jsp'>Redirect to homepage</a>");
        	        	}
        	        	else {
        	        		out.println("Username: '" + userid + "' does not exist!" + "</br>");
        	            	out.println("Retype your account if you made a typo: <a href='LoginPage.jsp'>Retype your account</a>" + "</br>");
        	            	out.println("If you don't have one, please create an account here: <a href='CreateAccount.jsp'>Create Account</a>");
        	        	}
        	  
        	        }
        	    }
        	 else if (userType.equals("cus reps")){
     	    	ResultSet useridInput;
     	        useridInput = st.executeQuery("select * from CustomersRep where username='" + userid + "'");
     	        if (useridInput.next()) { // check if it is the matched username.
     	        	ResultSet passwordInput;
     	            passwordInput = st.executeQuery("select * from CustomersRep where username='" + userid + "' and password='" + pwd + "'");
     	            if (passwordInput.next()) { // check if it is the matched password.
     	            	session.setAttribute("user", userid); 
     	                out.println("welcome " + userid);
     	                out.println("<a href='Logout.jsp'>Log out</a>");
     	                response.sendRedirect("LoginSuccessRep.jsp");
     	            }
     	            
     	            else {
     	            	out.println("Invalid password <a href='LoginPage.jsp'>try again</a>");
     	            }
     	            
     	        } else {
     	        	if (userType == null) {
     	        		out.println("Please select your user type!: <a href='LoginPage.jsp'>Redirect to homepage</a>");
     	        	}
     	        	else {
     	        		out.println("Username: '" + userid + "' does not exist!" + "</br>");
     	            	out.println("Retype your account if you made a typo: <a href='LoginPage.jsp'>Retype your account</a>" + "</br>");
     	            	out.println("If you don't have one, please create an account here: <a href='CreateAccount.jsp'>Create Account</a>");
     	        	}
     	  
     	        }
     	    }
    }
    		
    
%>
</body>
</html>