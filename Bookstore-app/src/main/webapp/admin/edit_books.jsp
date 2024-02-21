<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT BOOKS</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-2">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label><input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label><input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label><input
									name="price" type="number" class="form-control"
									value="<%=b.getPrice()%>" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status*</label><select
									name="status" class="form-control" id="inputState">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>


</body>
</html>