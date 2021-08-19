<%-- 
    Document   : login
    Created on : Jul 10, 2021, 6:16:29 PM
    Author     : ELPACIFIC
--%>

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

        <main class="container">

            <div class="w-50 m-auto text-center p-3 bg-body rounded shadow-sm">

                <div class="text-center div-form">

                    <form id="form" action="LoginServlet" method="POST" class="form-signin">
                        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                        <div class="form-floating mb-3">
                            <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>

                        <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                        <button name="login" class="w-50 btn btn-lg btn-primary mx-2" type="submit">Login</button>
                        <div>
                            <p class="mt-2 mb-2 text-muted">Don't have an account? <a href="register.jsp">Register</a></p>
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

