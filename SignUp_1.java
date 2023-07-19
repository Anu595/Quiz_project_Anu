
package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SignUp_1 extends HttpServlet {
 public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String email = request.getParameter("email");        
        String password = request.getParameter("password");
       
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
            String insert = "insert into signup(username,email,password)values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, username);
            ps.setString(2, email);            
            ps.setString(3, password);           
            int rs = ps.executeUpdate();
            if(rs>0){
//               out.print("<h3>Registeration successful</h3>");
                 response.sendRedirect("Quizlist.html");
            }
            else{
                 response.sendRedirect("UserSignup.html");
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
