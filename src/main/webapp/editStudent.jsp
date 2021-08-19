<%-- 
    Document   : editStudent
    Created on : Jul 10, 2021, 9:10:26 PM
    Author     : ELPACIFIC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Student</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>

        <%
            Connection con;
            String msg = "";
            String color = "";
            if (request.getMethod().compareToIgnoreCase("post") == 0) {
                try {
                    String studentID = request.getParameter("studentID");
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String gender = request.getParameter("gender");;
                    String marks = request.getParameter("marks");
                    String grade = "";
                    //A = [100-80], B =]80-70], C=]70-60], D=]60-50], E=]50, 40], and F=]40-0]
                    if (Integer.parseInt(marks) <= 100 && Integer.parseInt(marks) >= 80) {
                        grade = "A";
                    } else if (Integer.parseInt(marks) < 80 && Integer.parseInt(marks) >= 70) {
                        grade = "B";
                    } else if (Integer.parseInt(marks) < 70 && Integer.parseInt(marks) >= 60) {
                        grade = "C";
                    } else if (Integer.parseInt(marks) < 60 && Integer.parseInt(marks) >= 50) {
                        grade = "D";
                    } else if (Integer.parseInt(marks) < 50 && Integer.parseInt(marks) >= 40) {
                        grade = "E";
                    } else if (Integer.parseInt(marks) < 40 && Integer.parseInt(marks) >= 0) {
                        grade = "F";
                    } else {
                        grade = "NaN";
                    }

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");
                    String query = "UPDATE student SET firstName = ?, lastName= ?, gender =? ,marks= ? ,grade= ? WHERE studentID = ?";

                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, firstName);
                    pst.setString(2, lastName);
                    pst.setString(3, gender);
                    pst.setString(4, marks);
                    pst.setString(5, grade);
                    pst.setString(6, studentID);

                    pst.executeUpdate();

                    color = "green";
                    msg = "Student Updated Succesfully";

                } catch (Exception ex) {
                    ex.printStackTrace();
                    color = "red";
                    msg = "Error Occured";
                }
            }
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

            <div class="w-50 m-auto my-3 p-2 bg-body rounded shadow-sm">
                <h5 class="border-bottom pb-2 mb-2 text-center">Edit Student</h5>

                <div class="form-group col-12 p-0">

                    <h4 style="color:<%= color%>"><%= msg%></h4>
                </div>

                <form id="form" method="post" action="editStudent.jsp" class="form-horizontal">

                    <%

                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");

                        String id = request.getParameter("id");

                        pst = con.prepareStatement("SELECT * FROM student WHERE studentID = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        String genderTest;

                        while (rs.next()) {
                            genderTest = rs.getString("gender");
                    %>

                    <div class="form-floating">
                        <div  class="col-sm-4"></div>
                        <div  class="mb-3 mx-auto">
                            <label>Student ID</label>
                            <input type="text" name="studentID" class="form-control" id="studentID" value="<%= rs.getString("studentID")%>" hidden>
                            <input type="text" class="form-control" placeholder="<%= rs.getString("studentID")%>" disabled>
                        </div>
                    </div>
                    <div class="form-floating">
                        <div  class="col-sm-4"></div>
                        <div  class="mb-2 mx-auto">
                            <label >First Name</label>
                            <input type="text" name="firstName" class="form-control" id="firstName" value="<%= rs.getString("firstName")%>">
                        </div>
                    </div>
                    <div class="form-floating">
                        <div  class="col-sm-4"></div>
                        <div  class="mb-2 mx-auto">
                            <label>Last Name</label>
                            <input type="text" name="lastName" class="form-control" id="lastName" value="<%= rs.getString("lastName")%>">
                        </div>
                    </div>
                    <div class="form-floating">
                        <div  class="mb-2 mx-auto">
                            <label>Gender</label>
                            <div class="checkbox m-1">
                                <% if (genderTest.equals("Male")) { %>
                                <input type="radio" name="gender" id="gender" value="Male"  checked="checked">
                                <% } else { %>
                                <input type="radio" name="gender" id="gender" value="Male">
                                <% }%>
                                <label >Male</label>
                            </div>
                            <div class="checkbox m-1">
                                <% if (genderTest.equals("Female")) { %>
                                <input type="radio" name="gender"  id="gender" value="Female" checked="checked">
                                <% } else { %>
                                <input type="radio" name="gender"  id="gender" value="Female">
                                <% }%>
                                <label >Female</label>
                            </div>

                        </div>
                    </div>
                    <div class="form-floating">
                        <div  class="mb-2 mx-auto">
                            <label>Marks</label>
                            <input type="text" name="marks" class="form-control" id="marks" value="<%= rs.getString("marks")%>">
                        </div>
                    </div>
                    <div  class="col-sm-4">
                        <!--<label>Grade</label>-->
                        <input type="text" name="grade" class="form-control" id="grade" hidden>

                    </div>

                        <div class="form-floating" align="center">

                        <div class="col-sm-6 mt-3">
                            <a href="index.jsp" class="btn btn-secondary" style="width: 100px;">Cancel</a> <Button class="btn btn-success" style="width: 100px;">Update</Button>
                        </div>
                        <div class="col-sm-4">
                        </div>

                    </div>
            </div>

            <% }%>
        </form>

        <p class="mt-3 mb-2 text-muted text-center">Elpacific &copy; 2021</p>
    </div>
</main>

<!-- JavaScript: Bootstrap Bundle with Popper -->
<script src="js/bootstrap.bundle.min.js" ></script>
</body>
</html>
