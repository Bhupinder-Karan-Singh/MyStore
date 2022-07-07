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
			var ans = "<table>";
			for (var i = 0; i < arr.length; i++) {
				 if(i%9 == 0 || i==0) {
						ans += "<tr>";
				 }
				ans += "<td style=\"padding:10px 10px 10px 10px;text-align:center;\"><img src= \" "+ arr[i].product_photo +" \" style=\" width:100px; height:140px;border-radius: 0.5em;\" ><br><br><label class=\"text-dark\" ><b>Price : $"+arr[i].price+"</b></label></td>";
			}
			ans += "</tr>";
			ans += "</table>";
			document.getElementById("output").innerHTML = ans;
		}
	};
	var url = "./search";
	xhttp.open("GET", url, true);
	xhttp.send();
});
</Script>
</head>
<body>
    <%
    String session_email = (String) session.getAttribute("session_email");
    if(session_email != null) {
     %>
        <%@include file="navbar2.jsp"%>
     <% 
       } else {
    %>
       <%@include file="navbar.jsp"%>
    <%
       }
    %>
	<br><br>
	<div class="container" style="text-align:center;"><br>
	<b>Welcome to MyStore</b>  <hr></div>
	<div class="container" style="margin-left: 10%; width: 50%;">
    <div id="output" style="margin-left: 5%;text-align:center;"></div>
    </div>
	<div class="form-group" style="text-align: center;">
	<hr><label class="text-dark">&copy; MyStore 2022</label>
	</div>
</body>
</html>

