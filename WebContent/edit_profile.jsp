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
<script type="text/javascript">
$(document).ready(function() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var res = this.responseText;
			var obj = JSON.parse(res.trim());
			console.log(obj);
			var arr = obj.ans; 
			var name;
			var phone;
			console.log(arr);
			for (var i = 0; i < arr.length; i++) {
				 name = arr[i].name;
				 phone = arr[i].phone;
			}
			document.getElementById("name").value = name;
			document.getElementById("phone").value = phone;
		}
	};
	var url = "./get_user_detail";
	xhttp.open("GET", url, true);
	xhttp.send();

});
</script>
</head>

<body style="background-color: #F3F5F9" onload="myfunction()">

	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
      <%@include file="navbar2.jsp"%>
	<br><br><br>

	<div class="container" style=" display: flex; flex-direction: row;">
	    
		<div class="nav flex-column nav-pills" aria-orientation="vertical" ><br><br><br>
         <a class="nav-link active" href="edit_profile.jsp">Edit Profie</a><div class="dropdown-divider"></div>
         <a class="nav-link text-dark" href="update_address.jsp">Update Address</a><div class="dropdown-divider"></div>
         <a class="nav-link text-dark" href="delete_account.jsp">Delete account</a>
         </div>
         
	     <div class="container" style="margin-left:10%; margin-top:50px; text-align:center; height:auto; width:50%; border-radius: 1em 1em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey;" >
	       <div class="container">
	       <form action="./update_profile" method="post" id="formSignup" class="validate-form">

			<h4 class="form-group text-dark" style="text-align: center">
				Update Profile</h4>
			<div class="form-group">
				<input type="text" class="form-control" name="name" id="name"
					placeholder="Full Name" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="tel" class="form-control" name="phone" id="phone"
					placeholder="Contact number" autofocus="autofocus"
					data-rule-required="true" data-rule-number="true" minlength="10" maxlength="10" required />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Update" />
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

