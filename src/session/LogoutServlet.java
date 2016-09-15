package session;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
/**
 * @author Sachin
 *
 */
public class LogoutServlet extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
              
            request.getRequestDispatcher("index.jsp").include(request, response);  
              
            HttpSession session=request.getSession(); 
            session.removeAttribute("user");
            session.invalidate();  
              out.println("<p align=\"center\">You have been logged out!</p>");
            out.close();  
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
    }  
}  