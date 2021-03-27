<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,javax.servlet.http.*,javax.servlet.*,java.io.PrintWriter" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <body onload="setTimeout(function() { document.frm1.submit() }, 2000)">
   
                <% try {
                	String firstname=request.getParameter("firstname");
                	session.setAttribute("firstname",firstname);
                    String lastname=request.getParameter("lastname");
                    String adhar=request.getParameter("adhar");
                    String mobile=request.getParameter("contact");
                    String email=request.getParameter("email");
                    String passangers=request.getParameter("passangers");
                   
                    String gender=request.getParameter("gender");
                    String password=request.getParameter("password");
                    String address=request.getParameter("address");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root", "Awsedrftgyhujikolp!123");
                    Statement statement = connection.createStatement();
                    
                   
            		String sql = "INSERT INTO `flyaway`.`customer` VALUES('"+firstname+"','"+lastname+"','"+email+"','"+adhar+"','"+mobile+"','"+address+"','"+gender+"','"+password+"')";
            		
            		
            		statement.executeUpdate(sql);
            		pageContext.setAttribute("adhar",adhar);
            		pageContext.setAttribute("passangers",passangers);
            		
                }
                catch (Exception e)
                {System.out.println(e.getMessage());}
                
            
            %>
            
            
      
            
               
            <form  name="frm1" action="payment_form.jsp" method="post">
            <input name="adhar" type="hidden" value="${param.adhar}" >
            <input name="passangers" type="hidden" value="${param.passangers}" >
            </form>
            
            <%--pageContext.setAttribute("sql",sql);
            response.sendRedirect("payment_form.jsp");--%>
            		
  <%-- out.print(pageContext.findAttribute("sql")); --%>
      

</body>
</html>