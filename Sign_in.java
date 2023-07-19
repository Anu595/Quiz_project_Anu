package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sign_in extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("username");

        String password = request.getParameter("password");

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
            String sel = "select * from signup where username=? and password=?";
            PreparedStatement ps = con.prepareStatement(sel);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
          
             if(rs.first()){
            response.sendRedirect("Quizlist.html");
        }
        else
        {
            out.print("<h3 style='color:red;'> User email or password is incorrect.</h3>");
        }

        } catch (Exception e) {
            out.print(e);
        } finally {
            try {
                con.close();
            } catch (Exception ex) {
                out.print(ex);
            }
        }
    }
}
