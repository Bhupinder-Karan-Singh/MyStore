<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>

<meta charset="ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<Script type="text/javascript" src="../js/bootstrap.js"></Script>

</head>

<body style="background-color: #F3F5F9;text-align:center;">
<%@include file="navbar.jsp"%>

  <% String session_email = (String)session.getAttribute("session_email");
     String session_name = (String)session.getAttribute("session_name");
  
    if(session_email != null)   {
        session.setAttribute("email",session_email);
        session.setAttribute("name",session_name);
        response.sendRedirect("userhome.jsp?msg2="+session_name);
     } else {  	 %>
	<br>
	<br>
	<div class="container" style="width: 400px; height:590px;">
		<br>
		<br>

		<form action="../Login_admin" method="post">
			<h4 class="form-group text-dark" style="text-align: center">
				Administrator Login</h4>
			<div class="form-group">
				<input type="text" class="form-control" name="email" id="email"
					placeholder="email" autofocus="autofocus" required />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="password"
					id="password" placeholder="password" required />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Login" />
			</div>
			<div class="form-group" style="text-align: center;">
				<a class="text-dark" href="../login.jsp">User login</a>
			</div>
		</form>
		<br>
		<br>
		<div class="form-group" style="text-align: center;">
			<%  String msg = request.getParameter("msg");
				String msg2 = request.getParameter("msg2");
				if (msg != null) { %>
					<label class="alert alert-danger"><%=msg%></label> <% 
				} if (msg2 != null) { %>
					<label class="alert alert-success"><%=msg2%></label> <%
				} else{
					msg="";
					msg="";
				} %>
		   </div>
	</div>
	<hr><label class="text-dark">&copy; MyStore 2022</label>
	<% 	
     } 
    %>
</body>
</html>

