<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
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
		console.log(arr);
	    var hst;
	    var total = 0;
		var i;
		for (i = 0; i < arr.length; i++) {
			console.log(i);
		}
		if(i==0){
			document.getElementById("items").innerHTML = "0";
			
		}else{
			document.getElementById("items").innerHTML = i;
		}
	}
};
var url = "./cart";
xhttp.open("GET", url, true);
xhttp.send();
});
</script>
</head>
<body>
	<%String session_name = (String)session.getAttribute("session_name"); %>
	<%
      if(session_name != null) {
    %>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="userhome.jsp">MyStore</a>&nbsp;&nbsp;&nbsp;
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">		   
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="userhome.jsp" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <%=session_name%> </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						    <a class="dropdown-item" href="cart.jsp">Cart</a> 
						    <div class="dropdown-divider"></div>
							<a class="dropdown-item" href="orders.jsp">Your orders</a> 
						    <div class="dropdown-divider"></div>
							<a class="dropdown-item" href="edit_profile.jsp">Account settings</a> 
						    <div class="dropdown-divider"></div>
							<a class="dropdown-item" href="./Logout_user">logout</a>
					    </div>
					 </li>&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" href="cart.jsp"><img src="images/banner_images/cart.png" style="width:20px; height:20px;" />(<label id="items"></label>)</a>
				</li>&nbsp;&nbsp;&nbsp;
				</ul>
				<form class="form-inline my-2 my-lg-0" action="search.jsp">
					<input class="form-control mr-sm-2" type="search" 
						placeholder="Search products" aria-label="Search" required>
					<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<% 
      }
      else{
    	  response.sendRedirect("./login.jsp?msg=Please login to continue");
      }
	 %>

</body>
</html>