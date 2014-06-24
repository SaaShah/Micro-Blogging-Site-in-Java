<%@page session="true" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>

<html>
    <body>

        <%=request.getAttribute("room")%>
        <%=request.getAttribute("cou")%>
        <%=request.getAttribute("u2")%>
        <%=request.getAttribute("u1")%>
        
        
<%
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/mychat","root","saad");
                Statement s=c.createStatement();
                String sql="CREATE  TABLE room"
                        +request.getAttribute("room")
                        +"(stamp VARCHAR(45) NOT NULL , chat VARCHAR(45) NULL , hostname VARCHAR(45) NULL , PRIMARY KEY (stamp) );";
                                
                s.executeUpdate(sql);

                } catch(Exception e){

                out.println("Unable to ALLOCATE"+e.getMessage());
                }
                %>

    </body>
</html>
