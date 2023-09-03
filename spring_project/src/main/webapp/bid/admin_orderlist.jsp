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
				<h3>주문 내역</h3>
	<br>
		<ul class="nav nav-tabs col">
		  <li class="active col-sm-4"><a data-toggle="tab" href="#home">주문진행 중</a></li>
		  <li class=' col-sm-4'><a data-toggle="tab" href="#menu1">주문완료</a></li>
		  <li class=' col-sm-4'><a data-toggle="tab" href="#menu2">주문취소</a></li>
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
		
		<c:forEach var='order' items="${orderlist}">
		<div class="test${order.order_condition_code}">
		<div class="col">
		
			<div class="col-sm-2">
				<img alt="${order.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${order.image_target}" class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-4"><a href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${order.product_code}" title="제품 상세보기">
				<strong>${order.product_brand}</strong><br>
				<p style="margin-bottom:2px;">${order.product_name}</p>
				<strong>${order.size}</strong>
			</a></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
				<c:choose>
					<c:when test="${order.order_condition_code == 1}"><p style="float:right; color:blue; font-size:18px;">주문진행 중</p></c:when>
					<c:when test="${order.order_condition_code == 2}"><p style="float:right; color:black; font-size:18px;">주문완료</p></c:when>
					<c:when test="${order.order_condition_code == 3}"><p style="float:right; color:red; font-size:18px;">주문취소</p></c:when>
				</c:choose>
					<br>
					<span style="float:right; font-size:13px;">주문일자 ${order.order_date}</span><br>
					<strong style="float:right;">주문금액 : <fmt:formatNumber value="${order.order_total_price}" pattern="#,###,###,###" /> 원</strong><br>
					<c:choose>
						<c:when test="${order.order_condition_code == 1}"><br><span style="float:right; font-size:12px; color:gray;" class="orderDone"><a href="${pageContext.request.contextPath}/bid/admin_orderDone.bid?order_code=${order.order_code}" style="color:gray;">주문완료</a></span>
						    <span style="float:none; font-size:12px; color:gray; position: absolute; right:88px;" class="orderCancle"><a href="${pageContext.request.contextPath}/bid/admin_orderCancle.bid?order_code=${order.order_code}" style="color:gray;">주문취소</a></span></c:when>
						<c:when test="${order.order_condition_code == 2}">
							<br><span style="float:right; font-size:12px; color:gray; " class="orderCancle"><a href="${pageContext.request.contextPath}/bid/admin_orderCancle.bid?order_code=${order.order_code}" style="color:gray;">주문취소</a></span>
						</c:when>
						<c:when test="${order.order_condition_code == 3}">
							<br><span style="float:right; font-size:12px; color:gray; " class="orderDel"><a href="${pageContext.request.contextPath}/bid/admin_orderDel.bid?order_code=${order.order_code}" style="color:gray;">주문삭제</a></span>
						</c:when>
					</c:choose>
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
	
	$(".orderDone").on("click",function() {
		if (!confirm('주문을 완료하시겠습니까?')) {
			return false;
		}
	})
	$(".orderCancle").on("click",function() {
		if (!confirm('주문을 취소하시겠습니까?')) {
			return false;
		}
	})
	$(".orderDel").on("click",function() {
		if (!confirm('주문내역을 삭제하시겠습니까?')) {
			return false;
		}
	})
	
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>