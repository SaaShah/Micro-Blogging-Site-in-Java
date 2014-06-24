<%@page language="java" import="java.sql.*" import="java.util.*" import="java.io.*"%>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection cd=DriverManager.getConnection("jdbc:mysql://127.0.0.1:500/micro_blog","root","saad");
Statement sd=cd.createStatement();
ResultSet rsd=sd.executeQuery("select * from thread ORDER BY timestamp DESC;");

%>

    <%!int count=0;%>


<html lang="en-US">
<head>
    
    <script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 
   if( document.myForm.username.value == "" )
   {
     alert( "Enter username!" );
     document.myForm.username.focus() ;
     return false;
   }
   if( document.myForm.password1.value == "" )
   {
     alert( "Enter Password!!" );
     document.myForm.password1.focus() ;
     return false;
   }
   if( document.myForm.password2.value == "" )
   {
     alert( "Confirm Password!!" );
     document.myForm.password2.focus() ;
     return false;
   }
   
      if( document.myForm.password2.value !==  document.myForm.password1.value )
   {
     alert( "Password do not match!!" );
     document.myForm.password2.focus() ;
     return false;
   }
   
      if( document.myForm.email.value == "" )
   {
     alert( "Enter email address!" );
     document.myForm.email.focus() ;
     return false;
   } else{
       var x=document.forms["myForm"]["email"].value;
 var atpos=x.indexOf("@");
 var dotpos=x.lastIndexOf(".");
 if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
   {
   alert("Not a valid e-mail address");
   return false;
   }
   }
   
   return( true );
}

//-->
</script>
<meta charset="UTF-8" />
<title>MICRO BLOG - WELCOME</title>
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

<h2>Sign Up !</h2>
    <form name="myForm" action="add_user.jsp" onsubmit="return validate()" method="post">
<ul>
<li>Enter Username</li>
<li><input type="text" name="username" style="width: 100px;"/></li>
<li>Enter Password</li>
<li><input type="password" name="password1" style="width: 100px;" /></li>
<li>Verify Password</li>
<li><input type="password" name="password2" style="width: 100px;" /></li>
<li>Enter Email</li>
<li><input type="text" name="email" style="width: 100px;" /></li>
<li><input type="submit" value="SUBMIT" style="width: 100px; height: 30px"  /></li>
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
for(count=0;count<11;count++){
    while (rsd.next()) 
{
%>   

<article class="post">
<header>
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
