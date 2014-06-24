<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<html>
    <body>
<%
    java.util.Date date = new java.util.Date();
    %>        
            <jsp:useBean id="mybean" class="mypack.handle" scope="session"/>
            <jsp:setProperty name="mybean"  property="*" />
        
<%
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");

                Statement s=c.createStatement();

                String ttp=request.getParameter("thread");
                String un=mybean.getter();
                
                String sql="INSERT INTO thread (user,thread) VALUES ('"
                            +un 
                            +"','"
                            +ttp
                            + "');";
                                
                s.executeUpdate(sql);

                String redirectURL = "home.jsp";
                response.sendRedirect(redirectURL);
                
                } catch(Exception e){

                out.println("Unable to POST, Please try Later !");
                }
                %>
 
       
    </body>
</html>