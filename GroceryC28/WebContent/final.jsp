
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


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
	<center>
		<br>
		<h2 style='color: red'>You have successfully ordered your
			products</h2>
		<br> <br>
		<h1 style='color: #FF00CC'>
			Thankyou for visiting us <a><image src="e.jpeg" style="width:4%"></image></a>
		</h1>
	</center>
</body>
</html>