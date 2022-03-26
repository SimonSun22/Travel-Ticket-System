<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.CS336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions Query</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	Statement st = con.createStatement();

	String Command = request.getParameter("Command");   
	String text = request.getParameter("textarea");
	String questionNum = request.getParameter("textarea1");
	String answer = request.getParameter("textarea2");
	
	
	if (Command.equals("Ask")) {
		
		String insert = "INSERT INTO question_answer(question)"
				+ "VALUES (?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert);
		ps.setString(1, text);
		ps.executeUpdate();
		out.println("Quesiton posted");
		out.println("<a href='QuestionAndAnswer.jsp'>Back to Question and Answer Page</a>");
		
	}
	else if (Command.equals("Search By Question And Answer")){
		session.setAttribute("Command", Command);
		session.setAttribute("textarea", text);
		response.sendRedirect("showQuestion.jsp");
	}
	else if (Command.equals("Browse")){
		session.setAttribute("Command", Command);
		response.sendRedirect("showQuestion.jsp");
	}
	else if (Command.equals("All Questions")) {
		session.setAttribute("Command", Command);
		response.sendRedirect("showQuestionToRep.jsp");
	}
	else {
		String update = "UPDATE question_answer set answer=? where qid=" + questionNum;
		PreparedStatement ps = con.prepareStatement(update);
		ps = con.prepareStatement(update);
		ps.setString(1, answer);
		ps.executeUpdate();
		out.println("Quesiton posted");
		out.println("<a href='QuestionAndAnswer.jsp'>Back to Question and Answer Page</a>");
		response.sendRedirect("showQuestionToRep.jsp");
	}
	
%>


</body>
</html>