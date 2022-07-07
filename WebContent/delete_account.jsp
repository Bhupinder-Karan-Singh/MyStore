<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>

<meta charset="ISO-8859-1">
<title>MyStore</title>
<Script type="text/javascript" src="js/bootstrap.js"></Script>
<Script type="text/javascript" src="js/jquery.min.js"></Script>
<link rel="stylesheet" href="css/bootstrap.css">
 <style>
        .error {
            color:orange;
        }
    </style>
    <script type="text/javascript">   
           function check()
           {
               var pass = document.getElementById("password").value;
               var cpass = document.getElementById("cpassword").value;
               if(pass!=cpass)
               {
            	   window.location.replace("delete_account.jsp?msg=Pasword and confirm password do not match");
            	   return false;
               }
               else{
            	   return true;
               }
           }
        </script>
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
		<div class="nav flex-column nav-pills " aria-orientation="vertical" ><br><br><br>
         <a class="nav-link text-dark" href="edit_profile.jsp">Edit Profie</a><div class="dropdown-divider"></div>
         <a class="nav-link text-dark" href="update_address.jsp">Update Address</a><div class="dropdown-divider"></div>
         <a class="nav-link active" href="delete_account.jsp">Delete account</a>
         </div>
	     
	     <div class="container" style="margin-left:10%; margin-top:50px; text-align:center; height:auto; width:50%; border-radius: 1em 1em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey;" >
	       <div class="container">
	       <form action="./delete_account" method="post" id="formSignup" class="validate-form">

			<h4 class="form-group text-dark" style="text-align: center">
				Delete Account</h4>
			<div class="form-group">
				<input type="password" class="form-control" name="password"
					id="password" placeholder="password" data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="cpassword"
					id="cpassword" placeholder=" Confirm password"
					data-rule-required="true" data-rule-equalto="#password"
					data-msg-equalto="Password and confirm password do not match"
					required />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Delete Account" onclick="return check();"/>
			</div>
			</form>
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
	     </div>
	     
	</div>
	<% 
    }
    else {
    	response.sendRedirect("login?msg=Session Expired !!! Please Login again");
     }
    %>
     <script>
    $(document).ready(function (){
        $("#formSignup").validate();
    })
    </script>
</body>
</html>

