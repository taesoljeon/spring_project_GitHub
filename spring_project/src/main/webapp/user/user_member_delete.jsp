<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<script>
var result = '${success}';
var url = '${url}';
var contextPath = '${pageContext.request.contextPath}';
console.log(result + url);
	if (result.indexOf('완료') !== -1) {
		alert(result);
		location.href = contextPath + url;
	} else if (result.indexOf('실패') !== -1)  {
		alert(result);
	}
</script>

<div id="minho_main">
	<div class="row container-fluid login">
	
		<%@include file="/inc/user_page.jsp" %>
		
		<div class="col-sm-9 right">
			<form
				action="${pageContext.request.contextPath}/user/user_member_delete_action.user"
				method="post" id="form">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">회원 탈퇴</h3>
					<div class="form-group fgCh">
						<label for="change_password" class="lfCh">비밀번호</label> <input
							type="password" class="form-control fcCh" id="user_password"
							name="user_password" />
						<input type="hidden" id="user_id" name="user_id" value="${sessionScope.user.user_id}"/> 
					</div>
				<div class="form-group fgChBt">
				<input type="submit" class="btn-block bb" value="탈퇴하기" />
				</div>
				<div class="form-group fgChBb">
				<a href="javaScript:history.go(-1);" title="뒤로 가기" class="btn-block ba">뒤로 가기</a>
				</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	// 빈칸 체크 및 중복 체크
	$(document).ready(function() {
		$("#form").submit(function() {
			if ($("#user_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_password").focus();
				return false;
			}
		});
	});
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>