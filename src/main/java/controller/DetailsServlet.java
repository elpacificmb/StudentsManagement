
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DetailsServlet", urlPatterns = {"/DetailsServlet"})
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get current session
        HttpSession session = request.getSession();
        //check if session exists
        if(session.getAttribute("user")!=null){
            //redirect to profile page is session exists
            response.sendRedirect("profile.details");
        }else{
            //redirect to index page is session is null
            response.sendRedirect("login.jsp");
        }
    }

}
