<%@page session="true" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<%@page import="org.w3c.dom.css.Counter"%>
<html>
<body>

        <%! 
        public static int counter=0;
        public static int room=0;
        
        public String user1=null;
        public String user2=null;
        %>
        <%=request.getRemoteAddr()%>
        
        
        <%

        counter++;
        if(counter%2!=0){
            user1=request.getRemoteAddr();
            out.println("Connected, Waiting for partner...");
            while(counter%2!=0){}
                       } else{
                        user2=request.getRemoteAddr();
                       }
            room++; 
            session.setAttribute("u1", user1);
                        session.setAttribute("u2", user1);
                        session.setAttribute("room", room);
                        session.setAttribute("cou", counter);
                        

        String redirectURL = "chat_room_handler.jsp";
        response.sendRedirect(redirectURL);

%>                                                                                 

        

</body>
</html>
