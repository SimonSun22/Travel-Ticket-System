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
<br>
<input type="text" name="triptype" placeholder="Trip Type"> 
	<br>
	Sort By:
	<input type="radio" name="button1" value="econ_rate" > Economy Price
	<input type="radio" name="button1" value="bus_rate" > Business Class Price
	<input type="radio" name="button1" value="first_rate" > First Class Price
    <input type="radio" name="button1" value="dep_time" > Departure Time
    <input type="radio" name="button1" value="arr_time"> Arrival Time
    <input type="radio" name="button1" value="duration"> Duration Of Flight
	<br>
	
	Filter By:
	<input type="text" name="price" placeholder="Price"> 
	<input type="date" name="stops" placeholder="Number of Stops"> 
	<input type="date" name="airline" placeholder="Airline"> 
	<br>
	
	<input type="text" name="dep-air" placeholder="Departure Airport"> 
	<input type="date" name="departing-date" placeholder="Departing Date"> 
	

	<br>
 	<input type="text" name="arr-air" placeholder="Arrival Airport" > 
	<input type="date" name="returning-date" placeholder="Returning Date"> 
	<br>
	
	<input type="submit" value="Search">
</body>
</html>