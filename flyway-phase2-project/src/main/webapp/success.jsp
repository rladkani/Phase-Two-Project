<%@page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.*,javax.servlet.http.*,javax.servlet.*,java.util.*, java.io.*,java.lang.*,java.sql.ResultSet" %>
   
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Flight Details</title>
</head>
<body>
<div>


<caption><h2 style="color:green;">Booking Done Successfully!</h2></caption>
<% 

 try {
	 				String passangers=request.getParameter("passangers");  
	 
	 				String card=request.getParameter("card");                	
                   String holder=request.getParameter("name");
                   String cvv=request.getParameter("cvv");
                   
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root", "Awsedrftgyhujikolp!123");
                   Statement statement = connection.createStatement();
                   
                  
           		String sql = "INSERT INTO `flyaway`.`payment_table` VALUES('"+card+"','"+holder+"','"+cvv+"')";
           		
           		

//String sqlselect = "SELECT * FROM `flyaway`.`payment_table` WHERE card_no="+card;

//ResultSet rs =statement.executeQuery(sql);%>
<div><table align="center" border="1" width="50%" cellspacing="1" cellpadding="0" bordercolor="black" border="1">
  <h2 align="center">Payment Details</h2>
<tr>
    <th><font size="2"/>Card No </th>
    <th><font size="2"/>Holders's Name</th>
    <th><font size="2"/>CVV No</th>
    <th><font size="2"/>Amount Paid</th>
</tr>

<%//while(rs.next()) {%>
<tr>
    <td><% out.println(card); %></td>
    <td><% out.println(holder); %></td>
    <td><% out.println(cvv); %></td>
     <td><% //out.println((Integer.parseInt(passangers))*2000); 
     out.println("10000");%></td>
</tr>
</table>
</div>
	
<%
	
	
}
catch (Exception e)
{System.out.println(e.getMessage());
out.println(e.getMessage());}%>

           		
           	

</div>
    
</body>
</html>