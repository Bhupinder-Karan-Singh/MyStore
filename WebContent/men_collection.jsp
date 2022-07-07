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
	var queryString = window.location.search;
	var urlParams = new URLSearchParams(queryString); 
	var parameter1 = urlParams.get("product_name");
	var parameter2 = urlParams.get("category");
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var res = this.responseText;
			var obj = JSON.parse(res.trim());
			console.log(obj);
			var arr = obj.ans; 
			console.log(arr);
			var ans = "<table>";
			for (var i = 0; i < arr.length; i++) {
				 if(i%3 == 0 || i==0) {
						ans += "<tr>";
				 }
				ans += "<td style=\"padding:10px 10px 10px 10px;text-align:center;\"><img src= \" "+ arr[i].product_photo +" \" style=\" width:auto; border-radius: 0.5em;\" ><br><br><label class=\"text-dark\" ><b>Price : $"+arr[i].price+"</b></label><br><br><input type = \"button\" value=\"Add to cart\" class=\"btn btn-outline-dark btn-block\" onClick=\"add_product(\'"+arr[i].product_id+"\')\" /> &nbsp</td>";
			}
			ans += "</tr>";
			ans += "</table>";
			document.getElementById("output").innerHTML = ans;
		}
	};
	var url = "./showproducts?product_name="+parameter1+"&category="+parameter2;
	xhttp.open("GET", url, true);
	xhttp.send();
});
function add_product(product_id) {
	 if (confirm("Are you sure to add the product to cart")) {
		var httpreq = new XMLHttpRequest();
        httpreq.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
            	 window.location.replace("cart.jsp");
             }
          };
        httpreq.open("GET", "./add_product?product_id=" + product_id, true);
        httpreq.send();
	 }
}
</Script>
</head>
<body style="background-color: #F3F5F9; text-align:center">
	<%  String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) {   
    %>
    <%@include file="navbar2.jsp"%>
	<br>
	<br>
	<div class="container" style="text-align: center">
		<br> <b>Men Collection</b>
		<hr>
		<div class="container" style="display: flex; flex-direction: row; text-align: left;">
				<div class="nav flex-column nav-pills" aria-orientation="vertical">
				<a class="nav-link text-dark" href="userhome.jsp"><b>Home</b></a>
				<div class="dropdown-divider"></div>
				<a class="nav-link active" href="men_collection.jsp?product_name=default&category=men"><b>Men
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
			<div class="container" style="margin-left: 10%; width: 50%;">
             <div id="output"></div>
			</div>
		</div>
	<hr>
	<label class="text-dark">&copy; MyStore 2022</label>
	</div>
	<% } else {
			response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again"); } %>
</body>
</html>

