<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page
	import="com.shop.model.*,com.shop.controller.*,com.shop.dao.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
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
	<br>
	<form action="show" method="POST">
		<div class="container">
			<b>Customer name : </b><input type="text" value="${name}" />
		</div>
		<br> <br> <br>
		<div class="container">
			<br> <br> <br>
			<table class="table" border='4px'>
				<thead>
					<tr>
						<th>Item Id</th>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>

					</tr>
				</thead>

				<tbody>
					<c:forEach items="${selectedItemList}" var="iList"
						varStatus="status">

						<tr>
							<td>${iList.id}</td>

							<td><img src="./images/${iList.image_url}"
								style="width: 90px; max-height: 90px; float: left"></td>
							<td>${iList.name}</td>
							<td>${iList.price}</td>
							<td>${qtList[status.index]}</td>

						</tr>

					</c:forEach>

				</tbody>
			</table>
			<center>
				<b><h3>
						Total Order :
						<c:out value="${totalprice}" />
					</h3></b> <br> <br> <input type='submit' class='btn btn-primary'
					value='Continue' name='action' />
			</center>
	</form>


</body>
</html>