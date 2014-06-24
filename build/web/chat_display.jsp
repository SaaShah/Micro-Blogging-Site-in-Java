<%@page language="java" import="java.sql.*" import="java.util.*" import="java.io.*"%>
<html>
<body>
    
<script language="javascript" type="text/javascript">
window.onload=toBottom;

function toBottom()
{
window.scrollTo(0, document.body.scrollHeight);
}
</script>

<%Class.forName("com.mysql.jdbc.Driver");%>

<%

try{

Connection cd=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/chat_clients","root","saad");
Statement sd=cd.createStatement();
ResultSet rsd=sd.executeQuery("select * from client");
response.setIntHeader("Refresh", 2);
%>
<%=request.getRemoteAddr()%>
<table border="0">

    <%!int count=0;%>

<%

    while (rsd.next()) 
{
%>
<tr>
<td><%out.println(rsd.getString("chat")+"<br>");%></td>
</tr>
<%
    }
%>
</table>
<%
cd.close();

}catch(Exception e)
        {out.println("ERROR, Please Refresh.");}
%>
</body>
</html>
