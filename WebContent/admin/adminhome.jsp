<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>About my store</title>
<Script type="text/javascript" src="../js/bootstrap.js"></Script>
<Script type="text/javascript" src="../js/jquery.min.js"></Script>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body style="background-color: #F3F5F9">
	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
      <%@include file="navbar2.jsp"%>
	<br>
	<br>
	<div class="container" style="text-align:center"><br><br>
	<b>Welcome</b> Admin
	</div>
	
   <% 
    } else { 
    	response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again");
     }
    %>
</body>
</html>

