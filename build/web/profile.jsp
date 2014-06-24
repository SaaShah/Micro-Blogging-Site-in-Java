<%@page language="java" import="java.sql.*" import="java.util.*" import="java.io.*"%>
<%java.util.Date date = new java.util.Date(); %> 


    <%!int count=0;%>


<html lang="en-US">
    <head>
    
    <script type="text/javascript">
<!--
// Form validation code will come here.
function notnull()
{
 
   if( document.myForm1.u.value == "" )
 
   {
     document.myForm1.u.focus() ;
     return false;
   }
   return( true );
}

function notnull()
{
 
   if( document.myForm2.thread.value == "" )
 
   {
     document.myForm2.thread.focus() ;
     return false;
   }
   return( true );
}

//-->
</script>
<meta charset="UTF-8" />
<title>Home</title>
<link href="style.css" rel="stylesheet" type="text/css">

 </head>

<body>
    <div class="chat_button" >
<script type="text/javascript">
<!-- 
    function toggle_visibility(id) {
       var e = document.getElementById(id);
       
       if(e.style.display == 'none')
          e.style.display = 'block';
       else
          e.style.display = 'none';
    }
//-->
</script>

    <nav id="CB">

<ul>
	<li><a href="#" onclick="toggle_visibility('chat');">Chat ON/OFF</a></li>
</ul>
</nav>

    </div>
     
    <div class="chat_window" id="chat" onclick="document.myForm.n.focus();">
             
        <iframe border="0" src="chat_display.jsp" style="width:250px;height:256px;"></iframe>
        <iframe border="0" src="chat_send.jsp" style="width:250px;height:45px;"></iframe>                                             

    </div>
    
<section id="page">
<div id="pagewrap">
<section id="sidebar">
<h2>Topics</h2>
<ul>
<li><a href="#">Web Design</a></li>
<li><a href="#">Graphics Design</a></li>
<li><a href="#">Music</a></li>
<li><a href="#">Movies</a></li>
<li><a href="#">Entertainment</a></li>
<li><a href="#">School</a></li>
</ul>

<h2>Search</h2>
<form name="myForm1" onsubmit="return notnull();" action="search.jsp" method="POST">
<ul>
<li><input type="text" name="u" id="u" style="width: 100px;" ></li>
<li><input  type="submit" value="Search"  style="width: 100px; height: 30; "></li>
<li></li>
</ul>             
</form>

</section>
    
<section id="contents">
<header id="mainheader">
<h1>Micro<span>Blogs</span></h1>
<span><p><form action="post.jsp" name="myForm2" onsubmit="return notnull();" method="POST"><input type="text" name="thread" id="thread" style="width: 300px; height: 30; " />
        <input type="submit" value="POST" style="width: 100px; height: 30; "></form></p></span>
</header>

    <%
try{
    String searchit=request.getParameter("searchit");
Class.forName("com.mysql.jdbc.Driver");
Connection cd=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");
Statement sd=cd.createStatement();
ResultSet rsd=sd.executeQuery("select * from thread WHERE user ='"
 + session.getAttribute("user")
 + "';");

%>
<section id="main">
<article class="post">

<%
for(count=0;count<11;count++){
    while (rsd.next()) 
{ 
%>   
<article class="post">
<header>
   <h2><%out.print(rsd.getString("thread"));%></h2>
<p><%out.print(rsd.getString("user"));%> ~ <%out.print(rsd.getString("timestamp"));%></p>
</header>
</article>
<%
    }
}    
cd.close();

}catch(Exception e)
        {out.println("ERROR DISPLAY"+" -- " +e.getMessage());}
%>

<div class="wp-pagenavi">
<span class="current">1</span><a href="/page/2/" title="2">2</a><a href="/page/3/" title="3">3</a><a href="/page/4/" title="4">4</a><a href="/page/5/" title="5">5</a><a href="/page/6/" title="6">6</a><a href="/page/7/" title="7">7</a><a href="/page/8/" title="8">8</a><a href="/page/2/">Next &raquo;</a><span class="extend">...</span><a href="/page/27/" title="Last &raquo;">Last &raquo;</a></div>
    <div class="clear"></div>


</section>
<footer id="pagefooter">
<div class="footerwrap">
<p class="siteinfo">

2013 &copy; All Rights Reserved | MircoBlog.com
</p>
</div>

</footer>
</section>
<section id="social">
<div id="socialwrap">


<nav id="mainnav">
<h2>Navigate</h2>

<ul>

	<li class="current">
    <a href="home.jsp">Home</a></li>   <li><a href="profile.jsp">Profile</a></i>
    <li><a href="#" onclick="toggle_visibility('chat');">Chat</a></li>
   <li><a href="signout.jsp">Sign out</a></li>
</ul>
</nav>

<section id="tweets">
<h2>Updates</h2>
<ul>
	<li class="firsttwt"> <span>Random Annonymous Chatting Service is now embbedded.</span></li>
    <li> <span>Improved new algorithms for evaluating hot topics.</span>
    <li> <span>You can now automatically post your m-Blogs to tweeter.</span>
    <span class="twtrlink"><a href="#">View Tweet</a></span>
    </li>
    <li> <span>Happy Birthday to m-Blogs! Suggest new features you want to see in our favorite. </span>
    
</ul>
</section>
<section id="sociallinks">
<h2>Social</h2>
<a href="#"><img src="images/socialicons/facebook.png" width="32" height="32" alt="fb"></a> <a href="#"><img src="images/socialicons/twitter.png" width="32" height="32" alt="twitter"></a><a href="#"><img src="images/socialicons/digg.png" width="32" height="32" alt="digg"></a><a href="#"><img src="images/socialicons/technorati.png" width="32" height="32" alt="technorati"></a><a href="#"><img src="images/socialicons/youtube.png" width="32" height="32" alt="youtube"></a><a href="#"><img src="images/socialicons/reddit.png" width="32" height="32" alt="reddit"></a><a href="#"><img src="images/socialicons/flickr.png" width="32" height="32" alt="flickr"></a><a href="#"><img src="images/socialicons/rss.png" width="32" height="32" alt="rss"></a></section>
</div>
</section>

<div class="clear"></div>
</div>
</section>


</body>
</html>
