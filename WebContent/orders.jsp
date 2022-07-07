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
			console.log(arr);
			var ans = "<div class=\"container\">";
			for (var i = 0; i < arr.length; i++) {
			    ans += "<div class=\"row\" style =\"width:auto; margin:15px; border-radius: 0.5em 0.5em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey; margin-bottom: 50px; \">";
			    ans += "<div class=\"col\" style =\"padding:10px; width:auto; \"><label class=\"text-dark\" ><b>Order_id : "+arr[i].order_id+"</b></label></div>";
				ans += "<div class=\"col\" style =\"padding:10px;width:auto; \"><label class=\"text-dark\" ><b>Price : $"+arr[i].total_price+"</b></label></div>";
				ans += "<div class=\"col\" style =\"padding:10px;width:auto;\"><input type = \"button\" value=\"Cancel Order\" class=\"btn btn-outline-dark btn-block\" onClick=\"cancel_order(\'"+arr[i].order_id+"\')\" /></div>";
				ans += "</div><hr>";
			  }
			ans += "</div>";
			if(i==0){
				document.getElementById("output").innerHTML = "<label style=\"margin-top:50%\" class=\"alert alert-dark\">No order placed</label>";
			}else{
			
			document.getElementById("output").innerHTML = ans;
			}
		}
	};
	var url = "./fetch_orders";
	xhttp.open("GET", url, true);
	xhttp.send();
});

function cancel_order(order_id) {
	 if (confirm("Are you sure to cancel the order "+ order_id)) {
		var httpreq = new XMLHttpRequest();
       httpreq.onreadystatechange = function () {
          if (this.readyState == 4 && this.status == 200) {
          	 window.location.replace("orders.jsp");
             }
      };
      var url = "./cancel_order?order_id=" + order_id;
      httpreq.open("GET",url , true);
      httpreq.send();
	 }
}

</Script>
</head>

<body style="background-color: #F3F5F9; text-align:center">

	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
    <%@include file="navbar2.jsp"%>
	<br>
	<br>
	<div class="container" style="text-align: center">
		<br> <b>MyStore Orders</b> 
		<hr>
		<div class="container"
			style="display: flex; flex-direction: row; text-align: left;">
			<div class="nav flex-column nav-pills" aria-orientation="vertical">
				<a class="nav-link text-dark" href="userhome.jsp"><b>Home</b></a>
				<div class="dropdown-divider"></div>
				<a class="nav-link text-dark" href="men_collection.jsp?product_name=default&category=men"><b>Men
				</b></a> <a class="nav-link text-dark" href="men_collection.jsp?product_name=shirts&category=men"><font
					size="2px;">Shirts</font></a> <a class="nav-link text-dark"
					href="men_collection.jsp?product_name=trousers&category=men"><font size="2px;">Trousers</font></a> <a
					class="nav-link text-dark" href="men_collection.jsp?product_name=tshirts&category=men"><font
					size="2px;">T-Shirts</font></a> <a class="nav-link text-dark"
					href="men_collection.jsp?product_name=shorts&category=men"><font size="2px;">Shorts</font></a> <a
					class="nav-link text-dark" href="men_collection.jsp?product_name=footwear&category=men"><font
					size="2px;">Footwear</font></a>
				<div class="dropdown-divider"></div>
				<a class="nav-link text-dark" href="women_collection.jsp?product_name=default&category=women"><b>Women
				</b></a> <a class="nav-link text-dark" href="women_collection.jsp?product_name=dresses&category=women"><font
					size="2px;">Dresses</font></a> <a class="nav-link text-dark"
					href="women_collection.jsp?product_name=shirts&category=women"><font size="2px;">Shirts</font></a> <a
					class="nav-link text-dark" href="women_collection.jsp?product_name=jeans&category=women"><font
					size="2px;">Jeans</font></a> <a class="nav-link text-dark"
					href="women_collection.jsp?product_name=tops&category=women"><font size="2px;">Tops</font></a> <a
					class="nav-link text-dark" href="women_collection.jsp?product_name=footwear&category=women"><font
					size="2px;">Footwear</font></a>
		    	</div>
			<div class="container"
			style="padding-left:5%; margin-left: 20%; width: 40%; text-align: center;">
				<div id="output" style="text-align: center;"></div>
			</div>
		</div>
	</div>

	<hr>
	<label class="text-dark">&copy; MyStore 2022</label>

	<%
		} else {
			response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again");
		}
	%>
	

</body>
</html>

