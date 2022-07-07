<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
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
		    var hst;
		    var total = 0;
			var ans = "<table >";
			var i;
			for (i = 0; i < arr.length; i++) {
			    ans += "<tr>";
				ans += "<td style=\"padding:10px 10px 10px 10px;text-align:center;\"><img src= \" "+ arr[i].product_photo +" \" style=\"width:75%; height:75%; border-radius: 0.5em;\"><br><br><label class=\"text-dark\" ><b>Price : $"+arr[i].product_price+"</b></label><br><br><input type = \"button\" value=\"Remove\" class=\"btn btn-outline-dark btn-block\" onclick=\"remove_product(\'"+arr[i].product_id+"\')\" /><hr></td>";
				total += parseInt(arr[i].product_price);
				ans += "</tr>";
			}
			hst = (13/100) * total;
			ans += "</table>";
			document.getElementById("output").innerHTML = ans;
			document.getElementById("output2").innerHTML = total;
			if(i==0){
				document.getElementById("output").innerHTML = "<label style=\"margin-top:50%\" class=\"alert alert-dark\">Your cart is empty</label>";
				
			}else{
				var bag = document.getElementById('bag');
				document.getElementById("output3").innerHTML = i;
				bag.style.visibility='visible';
			}
			document.getElementById("output4").innerHTML =hst.toFixed(2);
			document.getElementById("output5").innerHTML =(total+hst).toFixed(2);
		}
	};
	var url = "./cart";
	xhttp.open("GET", url, true);
	xhttp.send();
});

function remove_product(product_id) {
	 if (confirm("Are you sure to remove the product "+ product_id)) {
		var httpreq = new XMLHttpRequest();
        httpreq.onreadystatechange = function () {
           if (this.readyState == 4 && this.status == 200) {
           	 window.location.replace("cart.jsp");
              }
       };
       var url = "./remove_product?product_id=" + product_id;
       httpreq.open("GET",url , true);
       httpreq.send();
	 }
}

function place_order() {
    var total_price = document.getElementById("output5").innerText;
    if (confirm("Are you sure to place the order for $"+ total_price)) {
		var httpreq = new XMLHttpRequest();
        httpreq.onreadystatechange = function () {
           if (this.readyState == 4 && this.status == 200) {
           	 window.location.replace("orders.jsp");
              }
       };
       var url = "./orders?total_price=" + total_price;
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
		<br> <b>MyStore Cart</b> 
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
				<div id="output" ></div>
			</div>
			<div class="container" id="bag"
				style="border-radius: 1em 1em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey; visibility:hidden; width: 30%; height: 50%; text-align: center; padding-bottom:30px;">
				<br>
				<div>
					<label ><b>Shopping Bag (<label id="output3"></label>)
					</b></label>
				</div><br>
				<div>
					<label>Sub Total : $<label id="output2"></label></label>
				</div>
				<div>
					<label>HST (13%) : $<label id="output4"></label></label>
				</div>
				<div>
					<label>Total : <b>$<label id="output5"></label></b></label>
				</div><hr>
				<div>
					<label><b>Payment Method</b></label>
				</div><br>
				<div>
					<label>Cash on delivery</label> &nbsp; &nbsp;<input type="radio" checked />
				</div><br>
			    <div>
			        <input type="button" value="Place Order" class="btn btn-dark" onclick="place_order()"/>
			    </div>
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

