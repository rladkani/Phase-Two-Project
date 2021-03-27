<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
  
<!DOCTYPE html>
<html>
<head>
</head>
<body  >

<br>
  
<h1 align="center">FLYAWAY</h1>

<h3 align="center">Airline Ticket Booking Portal</h3>
<br><br><br>
<h2 align="center">Enter Travel Details</h2>
<form method="post" action="search-result.jsp">
<div style="margin-left:230px ">

<br>
From City : 
 <select name="from"  style="width: 100px;">
            <option  value="-1">Source</option>
            <%
                try {
                    String Query = "SELECT * FROM `flyaway`.`book`";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root", "Awsedrftgyhujikolp!123");
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(Query);
                    while (resultSet.next()) {
            %>

            <option ><%= resultSet.getString("FromCity")%>
            </option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error " + e.getMessage());
                }
            %>
        </select>


<%---<input type="text" name = "from" placeholder="source"> --%>


To City : 


<select name="to"  style="width: 100px;">
            <option value="-1">Destination</option>
            <%
                try {
                    String Query = "SELECT * FROM `flyaway`.`book`";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root", "Awsedrftgyhujikolp!123");
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(Query);
                    while (resultSet.next()) {
            %>

            <option ><%= resultSet.getString("ToCity")%>
            </option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error " + e.getMessage());
                }
            %>
        </select>
<%-- 
<input type="text" name = "to" placeholder="destination" >--%>

Date of Travel : <input type="date" name="date_flight">
No. of Passengers : <select name="Passangers"  style="width: 100px">
            <option type="number" checked>1</option>
            <option type = "number" >2</option>
            <option type = "number" >3</option>
            <option type = "number" >4</option>
            <option type = "number" >5</option>
            <option type = "number" >6</option>
            </select>
           <br/><br/>
            <div style="margin-left:330px;">
<input type ="submit" value = "Search" style="width: 100px">

<input type ="reset" value = "Clear" style="width: 100px">
</div>
</div>


</form>
</body>
</html>