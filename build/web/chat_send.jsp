<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    
    <script type="text/javascript">
<!--
// Form validation code will come here.
function notnull()
{
 
   if( document.myForm.n.value == "" )
 
   {
     document.myForm.n.focus() ;
     return false;
   }
   return( true );
}

//-->
</script>
    </head>
<body onload="document.myForm.n.focus()">
    
    <form name="myForm" action="chat_handler.jsp" onsubmit="return notnull();" method="POST">
<table border = "0">
    
        <tr><td></td><td><input type="text" name="n" id="n" ></td>
            <td><input type="submit" value ="SEND" /></td></tr>
        </tr>
   
</table>
        
         </form>
</body>
</html>
