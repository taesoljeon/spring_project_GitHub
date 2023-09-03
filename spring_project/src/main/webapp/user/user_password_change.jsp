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
	if (result.indexOf('완료') !== -1) {
		alert(result);
		location.href = contextPath + url;
	} else if (result.indexOf('실패') !== -1)  {
		alert(result);
	}
</script>

<div id="minho_main">
	<div class="row container-fluid login">
	
<c:choose>
	<c:when test="${sessionScope.user.user_role_code eq 1 || sessionScope.user.user_role_code eq 2 }">
		<%@include file="/inc/admin_page.jsp" %>		
	</c:when>
	<c:otherwise>
		<%@include file="/inc/user_page.jsp" %>
	</c:otherwise>
</c:choose>
		
		<div class="col-sm-9 right">
			<form
				action="${pageContext.request.contextPath}/user/user_password_change_action.user"
				method="post" id="form">
				<div class="adminBoxCh">
										<h3 class="adminNameCh">비밀번호 변경</h3>
					<c:if test="${sessionScope.user.user_id == user_id}">
					<div class="form-group fgCh">
						<label for="password" class="lfCh">이전 비밀번호</label> <input
							type="password" class="form-control fcCh" id="user_password"
							name="user_password" />
					</div>
					
					</c:if>
					<div class="form-group fgCh">
						<label for="change_password" class="lfCh">새 비밀번호</label> <input
							type="password" class="form-control fcCh" id="change_password"
							name="change_password" />
						<input type="hidden" id="password" name="password" value="${user_password}"/>
						<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>								
					</div>
					<div class="form-group fgCh">
						<label for="password_check" class="lfCh">새 비밀번호 확인</label> <input
							type="password" class="form-control fcCh" id="password_check"
							name="password_check" />
					</div>
				<div class="form-group fgChBt">
				<input type="submit" class="btn-block bb" value="변경하기" />
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
function main_role(e) {
	  if (${sessionScope.user.user_role_code} !== 1) {
		event.preventDefault(); // 페이지 이동 막기
	    alert('메인 관리자 권한 페이지입니다.');
	  }
	}
	// 빈칸 체크 및 중복 체크
	$(document).ready(function() {
		$("#form").submit(function() {
			if (${sessionScope.user.user_id == user_id}) {
				if ($("#user_password").val() == "") {
					alert("이전 비밀번호를 입력해주세요.");
					$("#user_password").focus();
					return false;
				}
				if ($("#user_password").val() != $("#password").val() ) {
					alert("이전 비밀번호와 맞지않습니다.\n다시 입력해주세요.");
					$("#user_password").focus();
					return false;
				}
				if ($("#change_password").val() == $("#password").val() ) {
					alert("이전 비밀번호와 동일합니다.\n다시 입력해주세요.");
					$("#change_password").focus();
					return false;
				}
			}
			if ($("#change_password").val() == "") {
				alert("새 비밀번호를 입력해주세요.");
				$("#change_password").focus();
				return false;
			}
			if ($("#password_check").val() == "") {
				alert("새 비밀번호 확인을 입력해주세요.");
				$("#password_check").focus();
				return false;
			}
			if ($("#change_password").val() != $("#password_check").val()) {
				alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.\n다시 입력해주세요.");
				$("#change_password").focus();
				return false;
			}
		});
	});
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>