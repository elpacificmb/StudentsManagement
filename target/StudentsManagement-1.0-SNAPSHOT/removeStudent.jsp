<%-- 
    Document   : removeStudent
    Created on : Jul 10, 2021, 9:49:00 PM
    Author     : ELPACIFIC
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%

    Connection con;

    String studentID = request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");
    String query = "DELETE FROM  student WHERE studentID = ?";

    PreparedStatement pst = con.prepareStatement(query);

    pst.setString(1, studentID);
    pst.executeUpdate();

    response.sendRedirect("index.jsp");

%>   
