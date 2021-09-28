<%-- 
    Document   : register
    Created on : Jul 10, 2021, 6:16:29 PM
    Author     : ELPACIFIC
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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

        <%
            Connection con;
            String msg = "";
            String color = "";
            if (request.getMethod().compareToIgnoreCase("post") == 0) {
                try {
                    String rollNumber = request.getParameter("rollNumber");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String confirmPassword = request.getParameter("confirmPassword");
                    if (rollNumber != "" && rollNumber != "" && password != "") {
//                        if (password != confirmPassword) {
//                            color = "red";
//                            msg = "Passwords do not match";
//                        } else {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");
                            String query = "INSERT INTO user(rollNumber,email,password) VALUES (?,?,?)";

                            PreparedStatement pst = con.prepareStatement(query);

                            pst.setString(1, rollNumber);
                            pst.setString(2, email);
                            pst.setString(3, password);

                            pst.executeUpdate();

                            color = "green";
                            msg = "Student Added Succesfully";
//                        }

                    } else {
                        color = "red";
                        msg = "No blank field is allowed";
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                    color = "red";
                    msg = "Error Occured";
                }
            }
        %>

        <main class="container">

            <div class="w-50 m-auto text-center p-3 bg-body rounded shadow-sm">

                <div class="">

                    <form id="form" method="post" action="register.jsp" class="form-signin">
                        <h1 class="h3 mb-3 fw-normal">Please sign up</h1>

                        <div class="form-group col-12 p-0">
                            <h4 style="color:<%= color%>"><%= msg%></h4>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" name="rollNumber" class="form-control" id="floatingInput" placeholder="202010036">
                            <label for="floatingInput">Roll Number</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="confirmPassword" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Confirm Password</label>
                        </div>

                        <button class="w-50 btn btn-lg btn-primary mx-2" type="submit">Register</button>
                        <div>
                            <p class="mt-2 mb-2 text-muted">Have an account? <a href="login.jsp">Login</a></p>
                        </div>
                        <p class="mt-3 mb-2 text-muted">Elpacific &copy; 2021</p>
                    </form>
                </div>

            </div>

        </main>

        <!-- JavaScript: Bootstrap Bundle with Popper -->
        <script src="js/bootstrap.bundle.min.js" ></script>
    </body>
</html>