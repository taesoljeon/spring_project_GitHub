<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<div class="col-sm-3 left">
			<h2 class="menu">
				<a href="${pageContext.request.contextPath}/user/user_mypage.user"
				   title="마이 페이지">마이 페이지
				</a>
			</h2>
		<div class="box">
			<h3 class="mainMenu">쇼핑 정보</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/order_buy_list.bid" title="구매내역">구매 내역</a>
			</h4>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/bid_list.bid" title="구매내역">입찰 내역</a>
			</h4>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/order_sell_list.bid" title="판매내역">판매 내역</a>
			</h4>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/wish_list.bid" title="관심상품">관심 상품</a>
			</h4>		
			<h4 class="subMenu">
			<a href="${pageContext.request.contextPath}/sell/sell_list.sell?sell_user_id=${sessionScope.user.user_id}">나의 매물</a>
			</h4>	
		</div>
		<div class="box">
			<h3 class="mainMenu">내 정보</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/user/user_info.user"
				   title="로그인 정보">로그인 정보
				</a>
			</h4>
		</div>
		</div>
		
