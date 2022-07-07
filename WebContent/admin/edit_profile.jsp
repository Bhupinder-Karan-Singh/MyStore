<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>

<meta charset="ISO-8859-1">
<title>About my store</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/style.css">
<Script type="text/javascript" src="../js/bootstrap.js"></Script>

</head>

<body style="background-color: #F3F5F9">

	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
      <%@include file="navbar2.jsp"%>
	<br><br><br>

	<div class="container" style=" display: flex; flex-direction: row;">
		<div class="nav flex-column nav-pills" aria-orientation="vertical" >
         <a class="nav-link active" href="edit_profile.jsp">Edit Profie</a><div class="dropdown-divider"></div>
         <a class="nav-link text-dark" href="delete_account.jsp">Delete account</a>
         </div>
	     <div>
	     </div>
	</div>
	<% 
    }
    else {
    	response.sendRedirect("login.jsp?msg=Session Expired !!! Please Login again");
     }
    %>

	
	<script>
    $(document).ready(function (){
        $("#formSignup").validate();
    })
    </script>
</body>
</html>

