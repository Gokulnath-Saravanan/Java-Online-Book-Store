	<%@page import="com.entity.BookDetails"%>
	<%@page import="com.DB.DBConnect"%>
	<%@page import="com.DAO.BookDAOImpl"%>
	<%@page import="java.util.List" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>All Recent Book</title>
	<%@include file="all_component/allCss.jsp"%>
	<style type="text/css">
	.back-image {
		background: url("img/HomePage.jpg");
		height: 50vh;
		width: 100%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	.crd-ho:hover {
		background-color: #f7f7f7;
	}
	</style>
	</head>
	<body>
		<%@include file="all_component/navbar.jsp"%>
	
		<div class="container">
		<h2 class="text-center">RECENT BOOKS</h2>
			<div class="row p-3">
				<%
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list2 = dao2.getAllRecentBook();
				for (BookDetails b : list2) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho mt-4">
						<div class="card-body text-center">
							<img alt="" src="Book/<%=b.getPhotoName()%>"
								style="width: 200px; height: 300px" class="img-thumlin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
	
								<%
								if (b.getBookCategory().equals("Old")) {
								%>
								Category:<%=b.getBookCategory()%>
							<div class="row">
								<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
									href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
									<i class="fa-solid fa-indian-rupee-sign fa-sm"
									style="color: #ffffff;"></i></a>
							</div>
							<%
							} else {
							%>
							Category:<%=b.getBookCategory()%></p>
							<div class="row">
								<a href="" class="btn btn-danger btn-sm ml-1">Add Cart</a> <a
									href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
									href="" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
									class="fa-solid fa-indian-rupee-sign fa-sm"
									style="color: #ffffff;"></i></a>
							</div>
							<%
							}
							%>
	
						</div>
					</div>
				</div>
				<%
				}
				%>
				</div>
			</div>
	</body>
	</html>