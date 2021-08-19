
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ELPACIFIC
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Work on doPost method
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //Get username and password from login.jsp
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Connection conn;
        
        //Database
        try{
            //Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            //Open database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost/mis","root","");
            //Execute a query
            Statement stmt = conn.createStatement();
            //Get data from database
            ResultSet res = stmt.executeQuery("SELECT * FROM user WHERE email='"+email+"' AND password='"+password+"'");
            
            if(res.next()){
                //Create session
                HttpSession session = request.getSession();
                //get name of the username input field
                String useremail = request.getParameter("email");
                session.setAttribute("useremail", useremail);
                //if username and password true then redirect to welcome page
                response.sendRedirect("index.jsp");
            }else{
                out.println("Wrong username or password");
                response.sendRedirect("login.jsp");
            }
            //close connection
            conn.close();
            
        }catch(IOException | ClassNotFoundException | SQLException e){
            out.println(e.getMessage());
        }
    }

}
