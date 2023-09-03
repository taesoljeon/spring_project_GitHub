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
				<h3>관심 상품</h3>
	<br>
		
		<c:forEach var='wish' items="${wishlist}">
		<div class="col">
		
			<div class="col-sm-2">
				<img alt="${wish.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${wish.image_target}" class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-4"><a href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${wish.product_code}" title="제품 상세보기">
				<strong>${wish.product_brand}</strong>
				<p style="margin-bottom:2px;">${wish.product_name}</p>
				<strong>${wish.size}</strong>
			</a></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
				<button class="btn btn-danger form-control buybtn" style="height:38px;">
					<input type='hidden' value='${wish.product_code}' class='product_code'>
					<input type='hidden' value='${wish.size_code}' class='size_code'>
					<span style="float:left;">구매</span>
					<c:choose>
						<c:when test="${wish.min_price == 0}"><strong style="float:right;">구매입찰</strong></c:when>
						<c:otherwise><strong style="float:right;"><fmt:formatNumber value="${wish.min_price}" pattern="#,###,###,###" />원</strong></c:otherwise>
					</c:choose>
				</button>
				<br>
				<br>
				<span class="text-right wish-del" style="float:right; font-size:12px; color:gray;"><a href="${pageContext.request.contextPath}/bid/wish_del.bid?wish_code=${wish.wish_code}" style="color:gray;">삭제</a></span>
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

<form action="${pageContext.request.contextPath}/bid/product_buy.bid" method="POST" id="formform" accept-charset="UTF-8">
	<input type='hidden' value='' name='product_code' id='product_code'>
	<input type='hidden' value='' name='size_code' id='size_code'>
</form>

<script>
	$(".buybtn").on("click", function() {
		$("#product_code").val($(this).find(".product_code").val());
		$("#size_code").val($(this).find(".size_code").val());
		$("#formform").submit();
	})
</script>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>