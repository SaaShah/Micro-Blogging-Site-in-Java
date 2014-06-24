<%@page language="java" import="java.sql.*" import="java.util.*" import="java.io.*"%>

<html lang="en-US">
<head>
    
<meta charset="UTF-8" />

    <script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 
   if( document.myForm.u.value == "" )
 
   {
    alert( "Please provide your Username!" );
     document.myForm.u.focus() ;
     return false;
   }
   if( document.myForm.p.value == "" )
   {
     alert( "Please provide your Password!!" );
     document.myForm.p.focus() ;
     return false;
   }
   
   return( true );
}
//-->
</script>



    </script>
<title>MICRO BLOG</title>
<link href="style.css" rel="stylesheet" type="text/css">

 </head>

<body>
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


    <h2>Member</h2>

    <form name="myForm" action="verification.jsp" onsubmit="return validate()" method="post">
<ul>
<li><input type="text" name="u" id="u" style="width: 100px;" ></li>
<li><input type="password" name="p" id="p" style="width: 100px;"></li>
<li><input  type="submit" value="LOGIN"  style="width: 100px; height: 30; "></li>
<li></li>
<li><a href="new_member.jsp">Join NOW for FREE!</a></li>
</ul>             
    </form>

</section>

    <section id="contents">


        <header id="mainheader">
            <h1>Micro<span>Blogs</span></h1>
        </header>


<section id="main">
<article class="post">


<%

try{
Class.forName("com.mysql.jdbc.Driver");
Connection cd=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");
Statement sd=cd.createStatement();
ResultSet rsd=sd.executeQuery("select * from thread ORDER BY timestamp DESC;");

for(int count=0;count<11;count++){
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
    };
    break;
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
