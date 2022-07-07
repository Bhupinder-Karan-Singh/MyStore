<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>
<title>MyStore</title>
<meta charset="ISO-8859-1">
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
               var e = document.getElementById("email").value;
               if(e.indexOf("@")==-1 || e.indexOf(".")==-1 || e.indexOf(" ")>=0)
               {
            	   window.location.replace("signup.jsp?msg=Not a valid email");
                   return false;
               }
               else if(pass!=cpass)
               {
            	   window.location.replace("signup.jsp?msg=Password and confirm password do not match");
            	   return false;
               }
               else{
            	   return true;
               }
           }
        </script>
</head>

<body style="background-color : #F3F5F9; text-align:center;">
    
	<%@include file="navbar.jsp"%>
	<br><br>
	<div class="container" style="width: 400px; height:590px;">
		<br>
		<br>

		<form action="./Signup_user" method="post" id="formSignup"
			class="validate-form">

			<h4 class="form-group text-dark" style="text-align: center">
				User Sign Up</h4>
			<div class="form-group">
				<input type="email" class="form-control" name="email" id="email"
					placeholder="Email" autofocus="autofocus" data-rule-required="true"
					required />
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="name" id="name"
					placeholder="Full Name" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="password"
					id="password" placeholder="password" data-rule-required="true"
					minlength="8" maxlength="16" required />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="cpassword"
					id="cpassword" placeholder=" Confirm password"
					data-rule-required="true" data-rule-equalto="#password"
					data-msg-equalto="Password and confirm password do not match"
					required />
			</div>
			<div class="form-group">
				<input type="tel" class="form-control" name="phone" id="phone"
					placeholder="Contact number" autofocus="autofocus"
					data-rule-required="true" data-rule-number="true" minlength="10" maxlength="10" required />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Signup" onclick="return check();" />
			</div>
		</form><br>
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
    
    <script>
    $(document).ready(function (){
        $("#formSignup").validate();
    })
    </script>

</body>
</html>