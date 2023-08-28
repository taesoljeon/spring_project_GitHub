<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="col-sm-3 left">
			<h2 class="menu">
				<a href="${pageContext.request.contextPath}/user/user_admin_menu.user"
				   title="관리자 메뉴">관리자 메뉴
				</a>
			</h2>
		<div class="box">
			<h3 class="mainMenu">관리자 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/user/user_admin_read.user"
				   title="관리자 관리" onclick="main_role(event)">관리자 관리
				 </a>
			</h4>
		</div>
		<div class="box">
			<h3 class="mainMenu">회원 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/user/user_member_read.user"
				   title="회원 관리">회원 관리
				   </a>
			</h4>
		</div>
		<div class="box">
			<h3 class="mainMenu">상품 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/product/product_list.product" title="상품 관리">상품 관리</a>
			</h4>
		</div>
		<div class="box">
			<h3 class="mainMenu">판매 관리</h3>
			<h4 class="subMenu">
				<a href="#" title="판매 관리">판매 관리</a>
			</h4>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/user/user_sell_report.user"
				   title="매출 내역 확인">매출 내역 확인
				</a>
			</h4>
			</div>
		<div class="box">
			<h3 class="mainMenu">주문 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/admin_orderList.bid" title="주문 관리">주문 관리</a>
			</h4>
		</div>
		<div class="box">
			<h3 class="mainMenu">입찰 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/bid/admin_bid_list.bid" title="입찰 관리">입찰 관리</a>
			</h4>
		</div>
		<div class="box">
			<h3 class="mainMenu">게시판 관리</h3>
			<h4 class="subMenu">
				<a href="${pageContext.request.contextPath}/noticeboard/noticeboard.noticeboard" title="공지사항 관리">공지사항 관리</a>
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
		
