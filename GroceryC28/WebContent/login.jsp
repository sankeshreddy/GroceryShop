
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Online Groceries Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table, th, td {
	border: 2px solid black;
}
</style>
<script>
	function getMe() {
		alert("Please Login First !");
	}
</script>
</head>
<body style="background-color: white;">
	<nav class="navbar" style="background-color: #cccc00">


		<div class="container">
			<div class="navbar-header">
				<a><image src="gs.jpg" style="width:60%"></image></a>

			</div>

			<ul class="nav navbar-nav navbar-right">
				<br>

				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#Login">Login</button>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#SignUp">SignUp</button>

			</ul>
			<br> <br>
		</div>
	</nav>

	<center>
		<h1 style="color: red">OUR SERVICES</h1>
	</center>
	<br>
	<br>
	<br>
	<div class="modal" id="Login">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter Email and Password !</h4>

				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="show" method="post">

						<div class="form-group">
							<label for="email">Email address :</label> <input type="email"
								class="form-control" name="email">
						</div>
						<div class="form-group">
							<label for="pwd">Password :</label> <input type="password"
								class="form-control" name="pwd">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<div class="form-group">
						<input type="submit" class="btn btn-primary" name="action"
							value="Login">
					</div>
				</div>
				</form>

			</div>
		</div>
	</div>
	<div class="modal" id="SignUp">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter Details to Register !</h4>

				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="show" method="post">
						<div class="form-group">
							<label for="name">Name : </label> <input type="text"
								class="form-control" name="name">
						</div>
						<div class="form-group">
							<label for="email">Email address :</label> <input type="email"
								class="form-control" name="email">
						</div>
						<div class="form-group">
							<label for="pwd">Password :</label> <input type="password"
								class="form-control" name="pwd">
						</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<div class="form-group">
						<input type="submit" class="btn btn-primary" name="action"
							value="SignUp">
					</div>
				</div>
				</form>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<div class="col-xs-4">
								<img src="images/bru.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/fortune.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/curd.jpg" class="img-responsive">
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-xs-4">
								<img src="images/freedom.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/paneer.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/rin.jpg" class="img-responsive">
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-xs-4">
								<img src="images/rl.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/soya.jpg" class="img-responsive">
							</div>
							<div class="col-xs-4">
								<img src="images/se.jpg" class="img-responsive">
							</div>
						</div>

					</div>

					<div class="item">
						<div class="row">
							<div class="row">
								<div class="col-xs-4">
									<img src="images/tide.jpg" class="img-responsive">
								</div>
								<div class="col-xs-4">
									<img src="images/tj.jpg" class="img-responsive">
								</div>
								<div class="col-xs-4">
									<img src="images/wheel.jpg" class="img-responsive">
								</div>
							</div>
						</div>
					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- End of carousel -->
			<br> <br> <br> <br> <br> <br>

			<form method="post" action="show">
				<div class="column">

					<div class="col-sm-3">
						<b>Select Category :</b> <select class="form-control"
							style="width: 200px;" name="category">
							<option value="-1">Select Category</option>
							<c:forEach items="${categoryList}" var="cList">
								<option value="${cList}">${cList}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-2">
						<br> <input type="submit" class="btn btn-primary"
							name="action" value="Go" style="float: center;" />
					</div>
				</div>


			</form>

			<br> <br> <br>
			<form action="" method="post">
				<div class="container">
					<br> <br> <br>
					<table class="table table-hover" border='4px'>
						<thead>
							<tr>

								<th>Image</th>
								<th>Name</th>
								<th>UnitPrice</th>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${itemList}" var="iList">

								<tr>
									<td><img src="./images/${iList.image_url}"
										style="width: 90px; max-height: 90px; float: left"></td>
									<td>${iList.name}</td>
									<td>${iList.price}</td>


								</tr>

							</c:forEach>

						</tbody>
					</table>
			</form>
</body>
</html>