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
	<%@include file="/inc/admin_page.jsp" %>
		<div class="col-sm-9 right">
				<h3>입찰 내역</h3>
	<br>
		<ul class="nav nav-tabs col">
		  <li class="active col-sm-4"><a data-toggle="tab" href="#home">입찰중</a></li>
		  <li class=' col-sm-4'><a data-toggle="tab" href="#menu1">거래완료</a></li>
		  <li class=' col-sm-4'><a data-toggle="tab" href="#menu2">입찰취소</a></li>
		</ul>
		
		<div class="tab-content" >
		  <div id="home" class="tab-pane fade in active">
		  <br>
		  </div>
		  <div id="menu1" class="tab-pane fade">
		  <br>
		  </div>
		  <div id="menu2" class="tab-pane fade">
		  <br>
		  </div>
		</div>
		
		<c:forEach var='bid' items="${bidlist}">
		<div class="test${bid.bid_condition_code}">
		<div class="col">
		
			<div class="col-sm-2">
				<img alt="${bid.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${bid.image_target}" class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-4"><a href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${bid.product_code}" title="제품 상세보기">
				<strong>${bid.product_brand}</strong><br>
				<p style="margin-bottom:2px;">${bid.product_name}</p>
				<strong>${bid.size}</strong>
			</a></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
				<c:choose>
					<c:when test="${bid.bid_condition_code == 1}"><p style="float:right; color:blue; font-size:18px;">입찰중</p></c:when>
					<c:when test="${bid.bid_condition_code == 2}"><p style="float:right; color:black; font-size:18px;">거래완료</p></c:when>
					<c:when test="${bid.bid_condition_code == 3}"><p style="float:right; color:red; font-size:18px;">입찰취소</p></c:when>
				</c:choose>
					<br>
					<span style="float:right; font-size:13px;">입찰일자 ${bid.bid_creation_date}</span><br>
					<strong style="float:right;">입찰가 : <fmt:formatNumber value="${bid.bid_price}" pattern="#,###,###,###" /> 원</strong><br>
					<c:if test="${bid.bid_condition_code == 1}">
						<br><span class="text-right" style="float:right; font-size:12px; color:gray;" id="bidcancle"><a href="${pageContext.request.contextPath}/bid/admin_bid_cancle.bid?bid_code=${bid.bid_code}" style="color:gray;">입찰취소</a></span>
					</c:if>
				<br>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<hr>
		</div>
		</c:forEach>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#results").hide();
		$("#home").append($(".test1"));
		$("#menu1").append($(".test2"));
		$("#menu2").append($(".test3"));
		if (${not empty result}) {
			alert('${result}');
		}
	});
	
	$("#bidcancle").on("click",function() {
		if (!confirm('입찰을 취소시키시겠습니까?')) {
			return false;
		}
	})
	
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>
