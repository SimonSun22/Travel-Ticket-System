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
<a href='LoginSuccessCustomer.jsp'>Home</a></p><br>
<a href='Logout.jsp'>Log out</a></p><br>
   <%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();

	ResultSet rs=null;
	ResultSet rs2=null;

	String flight_num = request.getParameter("flight_num");
	String company = request.getParameter("company");
	String backflight_num = request.getParameter("back_num");
	String backcompany = request.getParameter("back_company");
	String id =session.getAttribute("id").toString();
	String dep_date1 = request.getParameter("dep_date1");
	String dep_date2 = request.getParameter("dep_date2");
	String dep_airport = session.getAttribute("dep_airport").toString();
	String arr_airport = session.getAttribute("arr_airport").toString();
	String classtype = request.getParameter("classtype");
	String tripType = request.getParameter("triptype");
	String classtype2 = request.getParameter("classtype2");

	int n =1;
	int m =0;
	int p =0;
	int u =0;
	 try
	 {
		
		String sql1="Update flights set available_seat = available_seat-"+n+" where flight_num = '"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"' ";
		st.executeUpdate(sql1);
		String sql2;
		if(tripType.equals("round")){
			 sql2="Update flights set available_seat = available_seat-"+n+" where flight_num = '"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"' ";
			 st2.executeUpdate(sql2);
			 

		}
		sql1="select available_seat from flights where flight_num='"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"'";
		rs=st.executeQuery(sql1);
		if(tripType.equals("round")){
			sql2="select available_seat from flights where flight_num='"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"'";
			rs2=st2.executeQuery(sql2);
		}

		int x=0;
		int y=0;
		int z=0;
		while(rs.next()){
			x=rs.getInt("available_seat");
		}
		if(tripType.equals("round")){
			while(rs2.next()){
				z=rs2.getInt("available_seat");
			}
		}
		
		if(x<0&&z<0)
		{
			out.println("<br><pre>Sorry!! There no seats. You are at the waiting list for Flight Number " + flight_num +"and Flight Number " +backflight_num);
			sql1="Update flights set available_seat = available_seat+"+n+" where flight_num = '"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"'";
			st.executeUpdate(sql1);
			
			String waiting1="Insert Into waitinglist(waiting_flightnum,waiting_company,dep_airport,arr_airport,dep_date,waiting_id)" 
			+ "VALUES (?,?,?,?,?,?)";

			
	 		PreparedStatement psw1 = con.prepareStatement(waiting1);
	 		psw1.setString(1, flight_num);
	 		psw1.setString(2, company);
	 		psw1.setString(3, dep_airport);
	 		psw1.setString(4, arr_airport);
	 		psw1.setString(5, dep_date1);
	 		psw1.setString(6, id);
	 		psw1.executeUpdate();

			sql2="Update flights set available_seat = available_seat+"+n+" where flight_num = '"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"'";
			
			st2.executeUpdate(sql2);
			
			String waiting2="Insert Into waitinglist(waiting_flightnum,waiting_company,dep_airport,arr_airport,dep_date,waiting_id)" 
					+ "VALUES (?,?,?,?,?,?)";

					
			 		PreparedStatement psw2 = con.prepareStatement(waiting2);
			 		psw2.setString(1, backflight_num);
			 		psw2.setString(2, company);
			 		psw2.setString(3, arr_airport);
			 		psw2.setString(4, dep_airport);
			 		psw2.setString(5, dep_date2);
			 		psw2.setString(6, id);
			 		psw2.executeUpdate();
			
		}
		else if(x<0)
		{
			out.println("<br><pre>Sorry!! There no seats. You are at the waiting list for Flight Number " + flight_num);
			sql1="Update flights set available_seat = available_seat+"+n+" where flight_num = '"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"'";
			st.executeUpdate(sql1);
			String waiting1="Insert Into waitinglist(waiting_flightnum,waiting_company,dep_airport,arr_airport,dep_date,waiting_id)" 
					+ "VALUES (?,?,?,?,?,?)";

					
			 		PreparedStatement psw1 = con.prepareStatement(waiting1);
			 		psw1.setString(1, flight_num);
			 		psw1.setString(2, company);
			 		psw1.setString(3, dep_airport);
			 		psw1.setString(4, arr_airport);
			 		psw1.setString(5, dep_date1);
			 		psw1.setString(6, id);
			 		psw1.executeUpdate();

			z=z+1;
			sql2="Select econ_rate, bus_rate,first_rate from flights where flight_num = '"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"'";
			rs2=st2.executeQuery(sql2);
			int back=0;
			while(rs2.next())
			{
				if(classtype2.equals("eco"))
						p=rs2.getInt("econ_rate");
				else if(classtype2.equals("business"))
						p=rs2.getInt("bus_rate");
				else if(classtype2.equals("first"))
						p=rs2.getInt("first_rate");
				back=1;
			}
			u=m+p;
			if(back==1){
			out.println("<br><br><br><br>Your ticket number : "+z);
			out.println("<br><br>From : "+arr_airport);
			out.println("<br><br>To : "+dep_airport);
	 		out.println("<br><br>Date : "+dep_date2);
	 		out.println("<br><br>Number of Tickets : "+n);
	 		out.println("<br><br>Total Cost: "+u);
	 		sql2="Insert Into ticket(id,flight_num,ticket_num, fare,dep_date,dep_airport,arr_airport,classtype)" + "VALUES (?,?,?,?,?,?,?,?)";
	 		PreparedStatement ps2;

	 		ps2 = con.prepareStatement(sql2);
			ps2.setString(1, id);
			ps2.setString(2, backflight_num);
			ps2.setInt(3, z);
			ps2.setInt(4, p);
			ps2.setString(5, dep_date2);
			ps2.setString(6, arr_airport);
			ps2.setString(7, dep_airport);
			ps2.setString(8, classtype2);
	 		ps2.executeUpdate();
			}
			else 
				out.println("<br><pre>Sorry! No flight are there.</pre>");

		}
		else if(z<0){
					out.println("<br><pre>Sorry!! There no seats. You are at the waiting list for Flight Number " + backflight_num);
					sql2="Update flights set available_seat = available_seat+"+n+" where flight_num = '"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"'";
					st2.executeUpdate(sql2);
			
					String waiting2="Insert Into waitinglist(waiting_flightnum,waiting_company,dep_airport,arr_airport,dep_date,waiting_id)" 
								+ "VALUES (?,?,?,?,?,?)";

					
			 		PreparedStatement psw2 = con.prepareStatement(waiting2);
			 		psw2.setString(1, backflight_num);
			 		psw2.setString(2, company);
			 		psw2.setString(3, arr_airport);
			 		psw2.setString(4, dep_airport);
			 		psw2.setString(5, dep_date2);
			 		psw2.setString(6, id);

			 		psw2.executeUpdate();
			 		
					x=x+1;
					sql1="Select econ_rate, bus_rate,first_rate from flights where flight_num = '"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"'";
					rs=st.executeQuery(sql1);
					int has = 0;
					while(rs.next())
					{
						if(classtype.equals("eco"))
								m=rs.getInt("econ_rate");
						else if(classtype.equals("business"))
								m=rs.getInt("bus_rate");
						else if(classtype.equals("first"))
								m=rs.getInt("first_rate");
						has = 1;
					}
					u=m+p;
					if(has == 1)
					{
						out.println("<br>Tickets Booked");
						out.println("<br><br><br><br>Your ticket number : "+x);
						out.println("<br><br>From : "+dep_airport);
						out.println("<br><br>To : "+arr_airport);
				 		out.println("<br><br>Date : "+dep_date1);
				 		out.println("<br><br>Number of Tickets : "+n);
				 		out.println("<br><br>Total Cost: "+u);
				 		sql1="Insert Into ticket(id,flight_num,ticket_num, fare,dep_date,dep_airport,arr_airport,classtype)" + "VALUES (?,?,?,?,?,?,?,?)";
				 		PreparedStatement ps = con.prepareStatement(sql1);

						ps.setString(1, id);
						ps.setString(2, flight_num);
						ps.setInt(3, x);
						ps.setInt(4, m);
						ps.setString(5, dep_date1);
						ps.setString(6, dep_airport);
						ps.setString(7, arr_airport);
						ps.setString(8, classtype);
				 		ps.executeUpdate();
					}
					else
						out.println("<br><pre>Sorry! No flight are there.</pre>");

		}
		else
		{
			x=x+1;
			z=z+1;
			sql1="Select econ_rate, bus_rate,first_rate from flights where flight_num = '"+flight_num+"'and company = '"+company+"'and dep_date = '"+dep_date1+"'";
			rs=st.executeQuery(sql1);

			if(tripType.equals("round")){
				sql2="Select econ_rate, bus_rate,first_rate from flights where flight_num = '"+backflight_num+"'and company = '"+backcompany+"'and dep_date = '"+dep_date2+"'";

				rs2=st2.executeQuery(sql2);
			}
		int has = 0;
		int back=0;
		while(rs.next())
		{
			if(classtype.equals("eco"))
					m=rs.getInt("econ_rate");
			else if(classtype.equals("business"))
					m=rs.getInt("bus_rate");
			else if(classtype.equals("first"))
					m=rs.getInt("first_rate");
			has = 1;
		}
		if(tripType.equals("round")){
			while(rs2.next())
			{
				if(classtype2.equals("eco"))
						p=rs2.getInt("econ_rate");
				else if(classtype2.equals("business"))
						p=rs2.getInt("bus_rate");
				else if(classtype2.equals("first"))
						p=rs2.getInt("first_rate");
			}
			back=1;
		}
		u=m+p;
		if(has == 1)
		{
			out.println("<br>Tickets Booked");
			out.println("<br><br><br><br>Your ticket number : "+x);
			out.println("<br><br>From : "+dep_airport);
			out.println("<br><br>To : "+arr_airport);
	 		out.println("<br><br>Date : "+dep_date1);
	 		out.println("<br><br>Number of Tickets : "+n);
	 		if(tripType.equals("round")){
				out.println("<br><br><br><br>Your ticket number : "+z);
				out.println("<br><br>From : "+arr_airport);
				out.println("<br><br>To : "+dep_airport);
		 		out.println("<br><br>Date : "+dep_date2);
		 		out.println("<br><br>Number of Tickets : "+n);
			}
	 		out.println("<br><br>Total Cost: "+u);
			

	 		sql1="Insert Into ticket(id,flight_num,ticket_num,fare,dep_date,dep_airport,arr_airport,classtype)" 
	 		+ "VALUES (?,?,?,?,?,?,?,?)";
	 		PreparedStatement ps = con.prepareStatement(sql1);
	 		PreparedStatement ps2;

			ps.setString(1, id);
			ps.setString(2, flight_num);
			ps.setInt(3, x);
			ps.setInt(4, m);
			ps.setString(5, dep_date1);
			ps.setString(6, dep_airport);
			ps.setString(7, arr_airport);
			ps.setString(8, classtype);

	 		ps.executeUpdate();
	 		
	 		if(tripType.equals("round")&&back==1){
	 			sql2="Insert Into ticket(id,flight_num,ticket_num, fare,dep_date,dep_airport,arr_airport,classtype)" + "VALUES (?,?,?,?,?,?,?,?)";
		 		ps2 = con.prepareStatement(sql2);
				ps2.setString(1, id);
				ps2.setString(2, backflight_num);
				ps2.setInt(3, z);
				ps2.setInt(4, p);
				ps2.setString(5, dep_date2);
				ps2.setString(6, arr_airport);
				ps2.setString(7, dep_airport);
				ps2.setString(8, classtype2);

		 		ps2.executeUpdate();
	 		}
	 		else if(tripType.equals("round")&&back==0)
				out.println("<br><pre>Sorry! No flight are there.</pre>");
 
		}
		else 
			out.println("<br><pre>Sorry! No flight are there.</pre>");
		}
		
	 }catch(Exception e){}
	 finally
	 {
		 try{
		 st.close();
		 st2.close();
		 rs.close();
		 rs2.close();
		 con.close();
		 }catch(Exception e){}
	 }
	%>
	
</body>
</html>