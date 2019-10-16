
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
					data-target="#Login">
					<b>welcome ${name}</b>
				</button>
				<a class="btn btn-primary" href="logout.jsp">LogOut</a>
			</ul>
			<br> <br>
		</div>
	</nav>
	<br>
	<br>
	<form method="post" action="show">
		<div class="container">
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
						name="action" style="float: center;" value="Go " />
				</div>
			</div>
		</div>
	</form>

	<br>
	<br>
	<br>
	<form action="show" method="post">
		<div class="container">
			<br> <br> <br>
			<table class="table" border='4px'>
				<thead>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>

					</tr>
				</thead>

				<tbody>
					<c:forEach items="${itemList}" var="iList">

						<tr>

							<td><img src="./images/${iList.image_url}"
								style="width: 90px; max-height: 90px; float: left"></td>
							<td>${iList.name}</td>
							<td>${iList.price}</td>

							<td><input id="numb" type="number" min="0" max="50"
								name="quantity" value="0" required> <input type="hidden"
								name="id" value="${iList.id}" />
						</tr>

					</c:forEach>

				</tbody>
			</table>
			<br> <br> <input type="submit" class="btn btn-primary"
				style="float: right;" name="action" value="AddToCart" />
	</form>
	</div>



</body>
</html>