<%-- 
    Document   : Signup
    Created on : 12 Jun, 2023, 9:29:48 AM
    Author     : anuve
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
                 if(username.equals("admin")&&password.equals("admin")){
                    response.sendRedirect("admin.jsp"); 
                 }
                 else{
                     response.sendRedirect("Quizlist.jsp"); 
                 }
           
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
            %>
