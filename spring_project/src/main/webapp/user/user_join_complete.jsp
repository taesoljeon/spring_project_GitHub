<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<div id="minho_main">
	<div class="row container-fluid login">
		<div class="col-sm-12 center">
			<h2 class="mainText">가입완료</h2>
			<div class="fj">
				<div class="from-group fg">
					<p class="joinMain">
						${name}님!<br />SPRINNG 회원이 되신 것을 환영합니다.
					</p>
					<p class="joinSub">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${id}</p>
				</div>
				<div class="from-group fg">
					<a class="btn-block bb"
						href="${pageContext.request.contextPath}/image/main.image"
						title="홈으로">홈으로</a>
				</div>
				<div class="from-group fg">
					<a class="btn-block ba"
						href="${pageContext.request.contextPath}/user/user_login_view.user"
						title="로그인">로그인</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>