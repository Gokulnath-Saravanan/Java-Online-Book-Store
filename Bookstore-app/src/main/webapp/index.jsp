<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book - mate: INDEX</title>
<%@include file="all_component/allCss.jsp"%>
<style>
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
<body style="background-color: #f0f1f2;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-image">
		<h1 class="text-center text-white">BooKmate Online Store</h1>
	</div>


	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px" class="img-thumlin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign fa-sm"
								style="color: #ffffff;"></i></a>
						</div>
						<%
						} else {
						%>
						Category:<%=b.getBookCategory()%></p>
						<div class="row">


							<% 
							if(u == null){
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}else{
							%>
							<a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<% 
							}
							
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								<a href=""class="btn btn-danger btn-sm"><%=b.getPrice()%> 
								<i class="fa-solid fa-indian-rupee-sign fa-sm"
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
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm mt-3">View
				All</a>
		</div>
	</div>

	<!-- End Recent Book -->

	<hr>

	<!-- Start NEW Book -->


	<div class="container">
		<h3 class="text-center">NEW Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px" class="img-thumlin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>

						<div class="row">
							<% 
							if(u == null){
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}else{
							%>
							<a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<% 
							}
							
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> 
								<i class="fa-solid fa-indian-rupee-sign fa-sm"style="color: #ffffff;"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm mt-3">View
				All</a>
		</div>
	</div>
	<!-- End NEW Book -->
	<hr>
	<!-- Start OLD Book -->
	<div class="container">
		<h3 class="text-center">OLD Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 300px" class="img-thumlin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-3">View
								Details</a> <a href="" class="btn btn-danger btn-sm m-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign fa-sm"
								style="color: #ffffff;"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	<div class="text-center mt-1">
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm mt-3">View
			All</a>
	</div>
	</div>
	<!-- End OLD Book -->
	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>