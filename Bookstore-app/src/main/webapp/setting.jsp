<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit your Profile</title>

<style>
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
}
</style>
<%@include file="all_component/allCss.jsp"%>
</head>	
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"/>
	</c:if>

	<div class="container">
	<c:if test="${not empty userobj }">
	<h3 class="text-center">Hello, ${userobj.name }</h3>	
	</c:if>
	

		<div class="row p-5">
			<div class="col-md-4" >
			<a href="sell_book.jsp" style="color:black;">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					</div>
					
					<h3>Sell Old Book</h3>
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-4 " >
			<a href="old_book.jsp" style="color:black;">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					</div>
					
					<h3>Old Book</h3>
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-0 p-0">
			<a href="edit_profile.jsp" style="color:black;">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-user-pen fa-3x"></i>
					</div>
					
					<h3>Login And Security</h3>
					</div>
				</div>
				</a>
			</div>
			
			
			<div class="col-md-6 mt-3">
			<a href="order.jsp" style="color:black;">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-danger">
					<i class="fa-solid fa-box-open fa-3x"></i>
					</div>
					<h4> My Order</h4>
					<p>Track Your Order</p>
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-3">
			<a href="helpline.jsp" style="color:black;">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-user-circle fa-3x"></i>
					</div>
					<h4> Help Center</h4>
					<p>24x7 Services</p>
					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>