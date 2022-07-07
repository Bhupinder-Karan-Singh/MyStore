<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>MyStore</title>
<Script type="text/javascript" src="js/bootstrap.js"></Script>
<Script type="text/javascript" src="js/jquery.min.js"></Script>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
   
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">MyStore</a>&nbsp;&nbsp;&nbsp;
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent" >
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="login.jsp" >Login</a></li>&nbsp;&nbsp;&nbsp;
					<li class="nav-item"><a class="nav-link" href="signup.jsp">Signup</a></li>
				</ul>

				<form class="form-inline my-2 my-lg-0" action="search.jsp">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search products" aria-label="Search" required>
					<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

</body>
</html>