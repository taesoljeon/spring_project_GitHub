<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<div id="minho_main">
	<div class="row container-fluid login">
	<%@include file="/inc/user_page.jsp" %>
		<div class="col-sm-9 right">
			<div class="adminBox">
				<div class="lAdminProfile">
					<h3 class="adminName">${sessionScope.user.user_name}</h3>
					<h4 class="adminId">${sessionScope.user.user_id}</h4>
				</div>
				<div class="rAdminProfile">
					<h3 class="adminRole">일반회원</h3>
				</div>
			</div>
		</div>
		
	</div>
</div>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>