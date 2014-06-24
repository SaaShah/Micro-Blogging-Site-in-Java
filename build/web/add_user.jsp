<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" session="true"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing</title>
    </head>
    <body>
        
        <%!
            String username,password,email;
            Boolean status=false;
    %>
        

            
                <%
                try{
                        
                        
                         username=request.getParameter("username");
                         password=request.getParameter("password1");
                         email=request.getParameter("email"); 
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");
                Statement s=c.createStatement();

                String sql;
                sql="INSERT INTO member "
                        + "VALUES ('"
                        + username
                        + "','"
                        + password
                        + "','"
                        + email
                        + "');";
                
                int flag=s.executeUpdate(sql);
                
                if(flag>0){
                    session.getId();
                     
                                       %>
                    <jsp:useBean id="mybean" class="mypack.handle" scope="session"/>
            <jsp:setProperty name="mybean"  property="*" />

        <%mybean.setter(username);        
        
        

                String redirectURL = "home.jsp";
                response.sendRedirect(redirectURL);
                         }
                
                else{ 
                    

                String redirectURL = "fail.jsp";
                response.sendRedirect(redirectURL);

                }

                }catch(Exception e){

                out.println("FAIL"+e.getMessage());
                }
                %>
        
        
    </body>
</html>
