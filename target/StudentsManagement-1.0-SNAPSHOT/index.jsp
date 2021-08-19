<%-- 
    Document   : index
    Created on : Jul 10, 2021, 6:16:29 PM
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
        <title>Students Management System</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>

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

            <div class="my-3 p-3 bg-body rounded shadow-sm">
                <h5 class="border-bottom pb-2 mb-2">List of All Students</h5>
                <div class="d-flex align-items-center p-1 my-1 rounded shadow-sm">
                    <div class="me-auto mb-2 mb-lg-0">
                        <a href="addStudent.jsp">
                            <Button class="btn btn-outline-primary">Add Student</Button>
                        </a>
                    </div>
                    <form class="d-flex" action="index.jsp" method="POST">
                        <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-secondary" type="submit">Search</button>
                    </form>
                </div>
                Welcome! <%=session.getAttribute("useremail")%>

                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Student ID</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Marks</th>
                            <th scope="col">Grade</th>
                            <th scope="col"></th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");

                            String search = request.getParameter("search");

                            if (search != null && search.length() > 0) {
                                String query = "SELECT * FROM student WHERE studentID = ?";// ? = placeholder
                                pst = con.prepareStatement(query);
                                pst.setString(1, search);// Bind the value to the placeholder
                            } else {
                                String query = "SELECT * FROM student";
                                pst = con.prepareStatement(query);
                            }

                            rs = pst.executeQuery();// Execute the prepared statement and fetch results

                            while (rs.next()) {
                        %>
                        <tr>
                            <th scope="row"><%= rs.getString("studentID")%></th>
                            <td><%=rs.getString("firstName")%></td>
                            <td><%=rs.getString("lastName")%></td>
                            <td><%=rs.getString("gender")%></td>
                            <td><%=rs.getString("marks")%></td>
                            <td><%=rs.getString("grade")%></td>

                            <td>
                                <a class="btn btn-outline-warning" href="detailsStudent.jsp?id=<%=rs.getString("studentID")%>" role="button">Details</a>&nbsp;
                                <a class="btn btn-outline-success" href="editStudent.jsp?id=<%=rs.getString("studentID")%>" role="button">Edit</a>&nbsp;
                                <a class="btn btn-outline-danger" href="removeStudent.jsp?id=<%=rs.getString("studentID")%>" role="button">Delete</a>
                            </td>
                        </tr>
                        <% }%>	

                    </tbody>
                </table>
                <p class="mt-5 mb-3 text-muted text-center">Elpacific &copy; 2021</p>
            </div>
        </main>
        <!-- JavaScript: Bootstrap Bundle with Popper -->
        <script src="js/bootstrap.bundle.min.js" ></script>
    </body>
</html>
