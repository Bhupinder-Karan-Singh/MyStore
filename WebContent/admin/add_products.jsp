<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>About my store</title>
<Script type="text/javascript" src="../js/bootstrap.js"></Script>
<Script type="text/javascript" src="../js/jquery.min.js"></Script>
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript">
$(document).ready(function () {
    $("#category").change(function () {
        var val = $(this).val();
        if (val == "men") {
            $("#product_type").html("<option disabled selected value> --Select Product Type -- </option><option value=\"shirts\">Shirt</option><option value=\"tshirt\">T-Shirt</option><option value=\"trousers\">Trousers</option><option value=\"shorts\">Shorts</option><option value=\"footwear\">Footwear</option>");
        } else if (val == "women") {
            $("#product_type").html("<option disabled selected value> --Select Product Type -- </option><option value=\"dresses\">Dresses</option><option value=\"shirts\">Shirts</option><option value=\"jeans\">Jeans</option><option value=\"shorts\">Shorts</option><option value=\"footwear\">Footwear</option>");
        } 
    });
});
</script>
</head>
<body style="background-color: #F3F5F9; text-align:center;">
	<% 
    String session_email = (String)session.getAttribute("session_email");
    if(session_email != null) 
    {   
    %>
      <%@include file="navbar2.jsp"%>
    <br><br><br><br>
	
	<div class="container" style="width: 600px; height:500px; border-radius: 1em 1em; padding: 1em 1em 1em 1em; box-shadow: 0px 0px 8px grey;">
	<br>

		<form action="../add_new_product" method="post" id="formSignup"
			class="validate-form"  enctype="multipart/form-data">

			<h4 class="form-group text-dark" style="text-align: center">
				Add new product</h4><br>
			<div class="form-group">
				<select name="select1" id="category" class="form-control" autofocus>
				        <option disabled selected value> --Select Category -- </option>
                        <option value="men">Men</option>
                        <option value="women">Women</option>
               </select>
           </div>
           
			<div class="form-group">
				<select name="select2" id="product_type" class="form-control">
				<option disabled selected value> -- Product Type -- </option>
               </select>
           </div>
               
			<div class="form-group">
				<input type="text" class="form-control" name="price" id="price"
					placeholder="Price"
					data-rule-required="true" required />
			</div>
			
			<div class="form-group">
			<input  type = "file" name="file1" class="form-group"/>
			   <span class="text-dark">*Product photo (png format only)</span><br>
			</div>
			
			<div class="form-group">
				<input type="submit" class="btn btn-dark btn-block" value="Add Product" />
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
	</div><br><br>
	<hr><label class="text-dark">&copy; MyStore 2022</label>
   <% 
    } else { 
    	response.sendRedirect("./login.jsp?msg=Session Expired !!! Please Login again");
     }
    %>
</body>
</html>

