
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>flight details</title>
</head>
<body>
    <sql:setDataSource var="flyaway" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/flyaway?useSSL=false" user="root" password="Awsedrftgyhujikolp!123"/>
   
    <sql:query var="listUsers" dataSource="${flyaway}">
       SELECT * FROM `flyaway`.`book` WHERE FromCity="${param.from}"  AND ToCity="${param.to}" AND date_flight="${param.date_flight}";  
       
  </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Available Flights</h2></caption>
            <tr>
                <th>From City</th>
                 <th>To City</th>
                  <th>Arrival Time</th>
                   <th>Departure Time</th>
                    <th>Price</th>
                     <th>Date</th>
            </tr>
            <c:forEach var="book" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${book.FromCity}" /></td>
                    <td><c:out value="${book.ToCity}" /></td>
                     <td><c:out value="${book.ArrivalTime}" /></td>
                    <td><c:out value="${book.DepartureTime}" /></td>
                    <td><c:out value="${book.Price}" /></td>
                    <td><c:out value="${book.date_flight}" /></td>
                    <td><a href="reg.html">Book</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>