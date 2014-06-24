function notnull(x)
{
 
   if( document.myForm.x.value == "" )
 
   {
	alert("WORKING");
     document.myForm.x.focus() ;
     return false;
   }
   return( true );
}
