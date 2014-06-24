<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>

<html>
    <body>
<% 
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");

                Statement s=c.createStatement();

                String u=request.getParameter("u");
                String p=request.getParameter("p");

                String tp=null;
                
                String sql="select * from member";
                sql="select * from member "
                        + "where name='"
                        + u
                        + "';";
                
                ResultSet rs=s.executeQuery(sql);
                while(rs.next()){                 
                tp=rs.getString("password");
                }
                if(tp.equalsIgnoreCase(p)){
                    %>

            <jsp:useBean id="mybean" class="mypack.handle" scope="session"/>
            <jsp:setProperty name="mybean"  property="*" />
    
            <%mybean.setter(u);%>  
        
        <%

                String redirectURL = "home.jsp";
                response.sendRedirect(redirectURL);
                         }
                
                else{ 

                String redirectURL = "fail.jsp";
                response.sendRedirect(redirectURL);

                }
                } catch(Exception e){

                String redirectURL = "fail.jsp";
                response.sendRedirect(redirectURL);
                }
                %>
    </body>
</html>