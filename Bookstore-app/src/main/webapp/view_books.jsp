<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 p-5 border bg-white text-center">
				<img src="Book/<%=b.getPhotoName()%>"
					style="height: 300px; width: 200px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"> <%=b.getAuthor()%></span>
				</h4>
				<h4>
					CATEGORY:<span class="text-success"><%=b.getBookCategory()%></span>
				</h4>

			</div>
			<div class="col-md-6 p-5 border bg-white text-center">
				<h1><%=b.getBookName()%></h1>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-success">Contact The Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope-open-text"></i> Email: <%=b.getEmail()%></h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-transfer fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<%if ("Old".equals(b.getBookCategory())) 
				{ %>
				
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i>Continue Shopping</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign fa-sm"
						style="color: #ffffff;"></i> 200/-</a>
				</div>
				<%}else{%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign fa-sm"
						style="color: #ffffff;"></i> 200/-</a>
				</div>
				
				<%}
				%>
				


			</div>
		</div>
	</div>
</body>
</html>