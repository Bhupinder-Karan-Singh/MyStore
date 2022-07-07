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
<Script type="text/javascript">
$(document).ready(function() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var res = this.responseText;
			var obj = JSON.parse(res.trim());
			console.log(obj);
			var arr = obj.ans; 
			var house;
			var street;
			var city;
			var province;
			var country;
			var postal;
			console.log(arr);
			for (var i = 0; i < arr.length; i++) {
				 house = arr[i].house;
				 street = arr[i].street;
				 city = arr[i].city;
				 province = arr[i].province;
				 country = arr[i].country;
				 postal = arr[i].postal;
			}
			document.getElementById("house").value = house;
			document.getElementById("street").value = street;
			document.getElementById("city").value = city;
			document.getElementById("province").value = province;
			document.getElementById("country").value = country;
			document.getElementById("postal").value = postal;
		}
	};
	var url = "./get_address";
	xhttp.open("GET", url, true);
	xhttp.send();

});
</Script>
</head>

<body style="background-color: #F3F5F9">

	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
      <%@include file="navbar2.jsp"%>
	<br><br><br>

	<div class="container"style="display: flex; flex-direction: row;">
		<div class="nav flex-column nav-pills" aria-orientation="vertical"><br><br><br>
         <a class="nav-link text-dark" href="edit_profile.jsp">Edit Profie</a><div class="dropdown-divider"></div>
         <a class="nav-link  active" href="update_address.jsp">Update Address</a><div class="dropdown-divider"></div>
         <a class="nav-link text-dark" href="delete_account.jsp">Delete account</a>
         </div>
	     
	     <div class="container" style="margin-left:10%; margin-top: 50px;text-align:center; height:auto; width:50%; border-radius: 1em 1em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey;" >
	       <div class="container">
	       <form action="./update_address" method="post" id="formSignup" class="validate-form">

			<h4 class="form-group text-dark" style="text-align: center">
				Update Address</h4>
			<div class="form-group">
				<input type="text" class="form-control" name="house" id="house"
					placeholder="House No." autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="street" id="street"
					placeholder="street" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="city" id="city"
					placeholder="city" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type=text class="form-control" name="province" id="province"
					placeholder="province" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="country" id="country"
					placeholder="country" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="postal" id="postal"
					placeholder="postal" autofocus="autofocus"
					data-rule-required="true" required />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Update" />
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
    	response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again");
     }
    %>
</body>
</html>

