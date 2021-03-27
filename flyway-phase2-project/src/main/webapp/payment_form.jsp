<%@page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.*,javax.servlet.http.*,javax.servlet.*,java.util.*, java.io.*,java.lang.*,java.sql.ResultSet" %>
   
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment form</title>
</head>
<body>
<caption><h2 style="color:green;">Registered Successfully!</h2></caption>
    </div>
    
<h1 align="center">FLYAWAY</h1>
<h3 align="center">Airline Ticket Booking Portal</h3>
    <hr>

<%
try {
String adhar=request.getParameter("adhar");
String passangers=request.getParameter("passangers");
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root", "Awsedrftgyhujikolp!123");
Statement statement = connection.createStatement();


String sql = "SELECT * FROM `flyaway`.`customer` WHERE adhar="+adhar;
//String pas ="SELECT Price FROM `flyaway`.`book` WHERE FromCity="${param.from}"  AND ToCity="${param.to}" AND date_flight="${param.date_flight};

//out.print(sql);
ResultSet rs =statement.executeQuery(sql);%>
<div><table align="center" border="1" width="50%" cellspacing="1" cellpadding="0" bordercolor="black" border="1">
  <h2 align="center">User Details</h2>
<tr>
    <th><font size="2"/>First Name </th>
    <th><font size="2"/>Last Name</th>
    <th><font size="2"/>Email</th>
    <th><font size="2"/>Adhar</th>
    <th><font size="2"/>Mobile</th>
    <th><font size="2"/>Address</th>
    <th><font size="2"/>Gender</th>
   
</tr>

	
	
<%while(rs.next()) {%>
<tr>
    <td><% out.println(rs.getString("firstname")); %></td>
    <td><% out.println(rs.getString("lastname")); %></td>
    <td><% out.println(rs.getString("email")); %></td>
    <td><% out.println(rs.getString("adhar")); %></td>
     <td><% out.println(rs.getString("mobile")); %></td>
    <td><% out.println(rs.getString("address")); %></td>
    <td><% out.println(rs.getString("gender")); %></td>
</tr>
</table>
</div>
	
<%}
	rs.close();
	statement.close();
	connection.close(); 
	
}
catch (Exception e)
{System.out.println(e.getMessage());
out.println(e.getMessage());}%>


<br><br>
<div>
  <form align="center" action="success.jsp" method="post" style="margin:10px;">
  <table align="center" border="1"  cellspacing="1" cellpadding="0" bordercolor="black" border="1">
    <tr>
     <td>Card No.</td>
     <td><input type="text" name="card" /></td>
    </tr>
    <tr>
     <td>Card Holder's Name</td>
     <td><input type="text" name="name" /></td>
    </tr>
     <tr>
     <td>CVV No.</td>
     <td><input type="text" name="cvv" /></td>
    </tr>
    
   </table>
    <br/>   <input style="margin-left:0px;" type="submit" value="PAY" />
   <br/>
   <input name="passangers" type="hidden" value="${param.passangers}" >
   <a style="margin-left:0px;" href="search.jsp">Cancel</a>
   <input name="passangers" type="hidden" value="${param.passangers}" >
                <input name="card" type="hidden" value="${param.card}" >
  </form>
  
 
</div>
</body>
</html>