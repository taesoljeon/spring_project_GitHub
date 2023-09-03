<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SPRING</title>
<!-- SPRING CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/spring.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header id="minho_header">
		<h1 class="spring_hidden">SPRING</h1>
		<div class="row container-fluid header">
			<h2 class="spring_hidden">HEADER - MENU</h2>
			<nav class="col-sm-3 left">
			
				<a href="${pageContext.request.contextPath}/image/main.image">
				<img class="logo" alt="LOGO" 
					src="${pageContext.request.contextPath}/inc/image/spring_logo.png" /></a>
			</nav>
			<nav class="col-sm-9 right">
				<c:choose>
					<c:when test="${sessionScope.user!=null}">
						<c:choose>
							<%-- 로그인 메뉴 (어드민) --%>
							<c:when
								test="${sessionScope.user.user_role_code eq 1 || sessionScope.user.user_role_code eq 2  }">
								<p>
									<a class="logout" href="${pageContext.request.contextPath}/user/user_logout_action.user" title="로그아웃">LOGOUT</a>
								</p>
								<p>
									<a class="mypage" href="${pageContext.request.contextPath}/user/user_admin_menu.user" title="관리자 메뉴">ADMIN MENU</a>
								</p>
								
							</c:when>
							<%-- 로그인 메뉴 (유저) --%>
							<c:when test="${sessionScope.user.user_role_code eq 3}">
									<a class="logout" href="${pageContext.request.contextPath}/user/user_logout_action.user" title="로그아웃">LOGOUT</a>
								<p>
									<a class="mypage" href="${pageContext.request.contextPath}/user/user_mypage.user" title="마이페이지">MYPAGE</a>
								</p>
								<p>
									<a class="mypage" href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard" title="공지사항">NOTICEBOARD</a>
								</p>
							</c:when>
						</c:choose>
					</c:when>
							<%-- 비로그인 메뉴 --%>
					<c:otherwise>
						<p>
						<a class="login" href="${pageContext.request.contextPath}/user/user_login_view.user" title="로그인">LOGIN</a>
						</p>
						<p>
						<a class="mypage" href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard" title="공지사항">NOTICEBOARD</a>
						</p>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
	</header>