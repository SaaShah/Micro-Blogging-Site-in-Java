<%@page language="java" import="java.sql.*" import="java.util.*" import="java.io.*"%>
<html>
<body>


<%

try{
Class.forName("com.mysql.jdbc.Driver");
Connection cd=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");
Statement sd=cd.createStatement();
ResultSet rsd=sd.executeQuery("select * from thread ORDER BY timestamp DESC;");

%>

<table border="0">

    <%!int count=0;%>

<%

    while (rsd.next()) 
{
%>

<tr><td><%out.println(rsd.getString("user"));%>:</td>
    <td>
<table border="0">
    <tbody>
        <tr>
            <td></td>
            <td><%out.println(rsd.getString("thread"));%></td>
        </tr>
    </tbody>
</table>
</td>
    


</tr>

<%
    }
%>

</table>

<%
cd.close();

}catch(Exception e)
        {out.println("ERROR");}
%>


</body>
</html>
