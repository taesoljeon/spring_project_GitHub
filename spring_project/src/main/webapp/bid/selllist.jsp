<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<div id="minho_main">
	<div class="row container-fluid login">
	<%@include file="/inc/user_page.jsp" %>
		<div class="col-sm-9 right">
				<h3>판매 목록</h3>
	<br>
		
		<c:forEach var='sell' items="${selllist}">
		<div class="col">
		
			<div class="col-sm-2">
				<img alt="${sell.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${sell.image_target}" class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-4"><a href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${sell.product_code}" title="제품 상세보기">
				<strong>${sell.product_brand}</strong>
				<p style="margin-bottom:2px;">${sell.product_name}</p>
				<strong>${sell.size}</strong>
			</a></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
					<p style="float:right; color:red; font-size:18px;">판매완료</p><br>
					<br>
					<span style="float:right; font-size:13px;">판매일자 ${sell.order_date}</span><br>
					<strong style="float:right;">판매금액 : <fmt:formatNumber value="${sell.order_total_price}" pattern="#,###,###,###" /> 원</strong>
				<br>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<hr>
		</c:forEach>
		</div>
		
	</div>
</div>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>