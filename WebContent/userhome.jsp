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
$(document).ready(function(){

	[...document.querySelectorAll('.first-column')].map(column => {
	column.style.setProperty('--animation', 'slide');
	column.style.setProperty('height', '200%');
	column.innerHTML = column.innerHTML + column.innerHTML;
	});

	});
</Script>
<style>
.myimages {
     display: flex;
     overflow: hidden;
     width:800px;
     background: #F3F5F9;
     height:500px;
     
 }

 .myimages img {
     max-width: 100%;
     vertical-align: middle;
     border: 2px solid white;
     box-sizing: border-box;
     transition: opacity .2s
 }

 .myimages:hover img {
     opacity: 0.5
 }

 .myimages img:hover {
     opacity: 1
 }

 .first-column {
     animation: var(--animation, none) 40s infinite linear;
     padding-left:20px; padding-right:20px;
 }

 .first-column:hover {
     animation-play-state: paused
 }

 .first-column:nth-of-type(odd) {
     align-self: flex-end;
     --direction: 50%
 }

 @keyframes slide {
     to {
         -webkit-transform: translateY(var(--direction, -50%));
         transform: translateY(var(--direction, -50%))
     }
 }
</style>
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
	<div class="container" style="text-align:center;"><br>
	<b>Welcome to MyStore</b>  <hr>
	<div class="container" style=" display: flex; flex-direction: row; text-align:left; ">
	<div class="nav flex-column nav-pills" aria-orientation="vertical">
				<a class="nav-link active " href="userhome.jsp"><b>Home</b></a>
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
     
      <div class="container" style="margin-left:10%; width:50%; " >
      
         <div class="container" style="margin-left: 20px;display: grid;place-items: center">
         
         <div class="myimages">
   
          <div class="first-column"> 
          <a href="#"><img src="images/men/1.png"  alt="image"></a> 
          <a href="#"><img src="images/men/2.png"  alt="image"></a> 
          <a href="#"><img src="images/men/3.png"  alt="image"></a> 
          <a href="#"><img src="images/men/4.png"  alt="image"></a> 
          <a href="#"><img src="images/men/5.png"  alt="image"></a> 
          <a href="#"><img src="images/men/6.png"  alt="image"></a> 
          <a href="#"><img src="images/men/7.png"  alt="image"></a> 
          <a href="#"><img src="images/men/8.png"  alt="image"></a> 
          <a href="#"><img src="images/men/9.png"  alt="image"></a> 
          <a href="#"><img src="images/men/10.png" alt="image"></a> 
          </div>
          <div class="first-column"> 
          <a href="#"><img src="images/products/men/1.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/2.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/3.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/4.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/5.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/6.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/7.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/8.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/9.png"  alt="image"></a> 
          <a href="#"><img src="images/products/men/10.png" alt="image"></a> 
          </div>
          <div class="first-column"> 
          <a href="#"><img src="images/women/1.png"  alt="image"></a> 
          <a href="#"><img src="images/women/2.png"  alt="image"></a> 
          <a href="#"><img src="images/women/3.png"  alt="image"></a> 
          <a href="#"><img src="images/women/4.png"  alt="image"></a> 
          <a href="#"><img src="images/women/5.png"  alt="image"></a> 
          <a href="#"><img src="images/women/6.png"  alt="image"></a> 
          <a href="#"><img src="images/women/7.png"  alt="image"></a> 
          <a href="#"><img src="images/women/8.png"  alt="image"></a> 
          <a href="#"><img src="images/women/9.png"  alt="image"></a> 
          <a href="#"><img src="images/women/10.png" alt="image"></a> 
          </div>
          <div class="first-column"> 
          <a href="#"><img src="images/products/women/1.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/2.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/3.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/4.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/5.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/6.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/7.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/8.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/9.png"  alt="image"></a> 
          <a href="#"><img src="images/products/women/10.png" alt="image"></a> 
          </div>
          
         </div>
         </div>     
         </div>
	  </div>  
     </div>
      <hr><label class="text-dark">&copy; MyStore 2022</label>
   <% 
    }
    else {
    	response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again");
     }
    %>
</body>
</html>

