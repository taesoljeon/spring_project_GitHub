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
			<form
				action="${pageContext.request.contextPath}/user/user_id_find_action.user"
				method="get" id="form">
				<h2 class="mainText">아이디 찾기</h2>
				<div class="form-group fg">
					<label for="telephone" class="lf">휴대폰 번호</label>
					<input type="text" class="form-control fc" id="telephone" name="telephone" maxlength="11" pattern="^[0-9]+$" />
					<p class="pText">가입 시 등록한 휴대폰 번호를 입력하시면 아이디를 알려드립니다.</p>
				</div>
				<div class="form-group fg">
				<input type="submit" class="btn-block bb" value="아이디 찾기" />
				</div>
				<div class="form-group fg">
				<a href="javaScript:history.go(-1);" title="뒤로 가기" class="btn-block ba">뒤로 가기</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$("#form").submit(function() {
			if ($("#telephone").val() == "") {
				alert("휴대폰 번호를 입력해주세요.");
				$("#telephone").focus();
				return false;
			}
		});
	});
</script>


<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>