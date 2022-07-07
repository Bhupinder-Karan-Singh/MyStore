<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>
<title>My Store</title>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/style.css">
<Script type="text/javascript" src="../js/bootstrap.js"></Script>
</head>

<body>
    <%
    String session_email = (String) session.getAttribute("session_email");
    
    
    if(session_email != null) {
     %>
        <%@include file="navbar2.jsp"%>
     <% 
       } else {
    %>
       <%@include file="navbar.jsp"%>
    <%
       }
    %>
	<br><br>
	
    <%@include file="carousel.jsp"%>
    
    <div class="container">

     </div>
</body>
</html>

