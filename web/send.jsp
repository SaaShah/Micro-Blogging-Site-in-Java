<%@ page language="java" import="java.sql.*" 
         import="java.util.*" %>

<html>
    <body>
<%
    // This scriptlet declares and initializes "date"
    System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
%>

<%!public static int ide=0;
private int getid(){
    return ide++;
}

%>

<%Class.forName("com.mysql.jdbc.Driver");%>

<%
String uname=request.getParameter("n");
getid();

try{
Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/chat_clients","root","saad");
Statement statement=conn.createStatement();

String sql= "INSERT INTO client VALUES ("

 + "'"
 +date
 + "','"
 +uname
 + "','"
 +request.getRemoteHost()
 +"')";

statement.executeUpdate(sql);
                String redirectURL = "home.jsp";
                response.sendRedirect(redirectURL);
                         
}catch(Exception e)
{out.println("ERROR");}
%>



    </body>
</html>
