
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="backend.QuestionListJava"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
    </body>
</html>-->

<%
    
    
    Connection con = null;
    try {
        String tablename=request.getParameter("tablename");
//    tablename.trim();
//    session.setAttribute("tablename", tablename);
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
List<QuestionListJava> qlistj = new ArrayList<QuestionListJava>();

//        for (int i = 0; i <= 5; i++) {
//            String sqlj = "select * from Java where Qid=?";
//            String sqlj = "select * from Java";
//            PreparedStatement pt = con.prepareStatement(sqlj);
//            Random rand = new Random();
//            int beg = 1, end = 21;
//            int Qid = rand.nextInt(end - beg) + beg;
             String sqlj = "SELECT * FROM "+tablename+" ORDER BY RAND() LIMIT 20";
  PreparedStatement pt = con.prepareStatement(sqlj);
//  System.out.println("Random number: "+ Qid);
//            pt.setInt(1, Qid);
            

            ResultSet rs = pt.executeQuery();
            int Sino = 1;

//            while (rs.first()) {

                
                while(rs.next()){
                    QuestionListJava qj = new QuestionListJava();
                qj.setSino(Sino);

                qj.setQuestion(rs.getString("question"));
                qj.setOptA(rs.getString("OptA"));
                qj.setOptB(rs.getString("OptB"));
                qj.setOptC(rs.getString("OptC"));
                qj.setOptD(rs.getString("OptD"));
                qj.setAns(rs.getString("Ans"));
                qlistj.add(qj);
                Sino++;
//            }
    }

            request.setAttribute("questions", qlistj);
            request.setAttribute("tablename", tablename);
            RequestDispatcher rd = request.getRequestDispatcher("javaquiz_rel.jsp");
            rd.include(request, response);
        }
        catch (Exception ej) {
        out.print(ej);
    }
        finally {
        con.close();
    }
%>
