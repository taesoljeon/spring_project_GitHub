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
				<h3>구매 목록</h3>
	<br>
		
		<c:forEach var='buy' items="${buylist}">
		<div class="col">
		
			<div class="col-sm-2">
				<img alt="${buy.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${buy.image_target}"  class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-4"><a href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${buy.product_code}" title="제품 상세보기">
				<strong>${buy.product_brand}</strong>
				<p style="margin-bottom:2px;">${buy.product_name}</p>
				<strong>${buy.size}</strong>
			</a></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
					<p style="float:right; color:red; font-size:18px;">구매완료</p><br>
					<br>
					<span style="float:right; font-size:13px;">주문일자 ${buy.order_date}</span><br>
					<strong style="float:right;">총 결제금액 : <fmt:formatNumber value="${buy.order_total_price}" pattern="#,###,###,###" /> 원</strong>
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