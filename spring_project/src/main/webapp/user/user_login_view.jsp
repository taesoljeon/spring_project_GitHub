<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<script>
var result = "${success}";
var url = "${url}";
var contextPath = "${pageContext.request.contextPath}";
	 if (result.indexOf('통합') !== -1)  {
		alert(result);
		location.href = contextPath + url;
	} else if (result.indexOf('로그인') !== -1)  {
		alert(result);
	} else if (result.indexOf('비활성화된') !== -1)  {
		alert(result);
	}
</script>
<div id="minho_main">
	<div class="row container-fluid login">
		<div class="col-sm-12 center">
			<form
				action="${pageContext.request.contextPath}/user/user_login_action.user"
				method="get" id="form">
				<h3 class="text">PROJECT</h3>
				<h2 class="mainText">LOGIN PAGE</h2>
				<div class="form-group fg">
					<label for="id" class="lf">아이디</label> <input type="text" class="form-control fc" id="id" name="id" pattern="^[a-zA-Z0-9]+$" />
				</div>
				<div class="form-group fg">
					<label for="password" class="lf">비밀번호</label> <input type="password" class="form-control fc" id="password" name="password" />
				</div>
				<div class="form-group fg">
				<input type="submit" class="btn-block bb" value="로그인" />
				</div>
				<div class="form-group fg">
				<a class="btn-block bbKakao" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=e2b176eed25937ded4a7fa7a3ef1dc01&redirect_uri=http://localhost:8080/spring_project/user/user_kakao_login.user">카카오 로그인</a>
				</div>
				<div class="form-group fg">
				<a class="btn-block bbNaver" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Kuh4ildpcXBpoQ6puw1Y&state=STATE_STRING&redirect_uri=http://3.34.141.136:8080/spring_project/user/user_naver_login.user">네이버 로그인</a>
				</div>
				<div class="from-group fg">
				<a class="leftA" href="${pageContext.request.contextPath}/user/user_join_view.user" title="회원가입">회원가입</a>
				<a class="centerA" href="${pageContext.request.contextPath}/user/user_id_find_view.user" title="아이디 찾기">아이디 찾기</a>
				<a class="rightA" href="${pageContext.request.contextPath}/user/user_password_find_view.user" title="비밀번호 찾기">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$("#form").submit(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
		});
	});
</script>


<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>