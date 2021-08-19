<%-- 
    Document   : detailsStudent
    Created on : Jul 11, 2021, 1:49:20 AM
    Author     : ELPACIFIC
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Student Details</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>
        <%
            Connection con;
            String msg = "";
            String color = "";
        %>

        <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">MIS</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown09" data-bs-toggle="dropdown" aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu" aria-labelledby="dropdown09">
                                <li><a class="dropdown-item" href="#">Students</a></li>
                                <li><a class="dropdown-item" href="#">Teachers</a></li>
                                <li><a class="dropdown-item" href="#">Courses</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex mb-2 mb-lg-0">
                        <a href="login.jsp">
                            <Button class="btn btn-outline-primary mx-2">Log In</Button>
                        </a>
                        <a href="register.jsp">
                            <Button class="btn btn-outline-success mx-2">Sign Up</Button>
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <main class="container">

            <div class="w-50 m-auto my-3 p-3 bg-body rounded shadow-sm">
                <h5 class="border-bottom pb-2 mb-2">Student Details</h5>

                <table class="table table-striped table-bordered table-hover">
                    <%
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");

                        String id = request.getParameter("id");

                        pst = con.prepareStatement("SELECT * FROM student WHERE studentID = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                    %>
                    <tr class="table-dark">
                        <th scope="col">Student ID</th>
                        <td scope="row"><%= rs.getString("studentID")%></td>
                    </tr>
                    <tr>
                        <th scope="col">First Name</th>
                        <td><%=rs.getString("firstName")%></td>
                    </tr>
                    <tr>
                        <th scope="col">Last Name</th>
                        <td><%=rs.getString("lastName")%></td>
                    </tr>
                    <tr>
                        <th scope="col">Gender</th>
                        <td><%=rs.getString("gender")%></td>
                    </tr>
                    <tr>
                        <th scope="col">Marks</th>
                        <td><%=rs.getString("marks")%></td>
                    </tr>
                    <tr>
                        <th scope="col">Grade</th>
                        <td><%=rs.getString("grade")%></td>
                    </tr>
                    <% }%>
                </table>
                <p class="mt-5 mb-3 text-muted text-center">Elpacific &copy; 2021</p>
            </div>
        </main>

        <!-- JavaScript: Bootstrap Bundle with Popper -->
        <script src="js/bootstrap.bundle.min.js" ></script>
    </body>
</html>