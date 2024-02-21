<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All NEW Book</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<h2 class="text-center">NEW BOOKS</h2>
	<div class="container">
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-4">
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
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1 p-1">Add Cart</a>
						<%
							}else{
							%>
						<a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId()%>"
							class="btn btn-danger btn-sm ml-0 p-1">Add Cart</a>
						<% 
							}
							
							%>
							<a href="" class="btn btn-success btn-sm ml-1 mr-1 p-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm p-1"><%=b.getPrice()%> 
							<i class="fa-solid fa-indian-rupee-sign fa-sm" style="color: #ffffff;"></i></a>
						</div>
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