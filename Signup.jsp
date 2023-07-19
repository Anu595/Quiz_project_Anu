<%-- 
    Document   : Signup
    Created on : 12 Jun, 2023, 9:37:09 AM
    Author     : anuve
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
            %>