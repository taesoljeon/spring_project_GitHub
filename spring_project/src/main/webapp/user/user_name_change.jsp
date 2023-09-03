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
		console.log('n');
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
				action="${pageContext.request.contextPath}/user/user_name_change_action.user"
				method="post" id="form">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">이름 변경</h3>
					<div class="form-group fgCh">
						<label for="change_name" class="lfCh">새 이름</label> <input
							type="text" class="form-control fcCh" id="change_name"
							name="change_name" />
							<input type="hidden" id="user_name" name="user_name" value="${user_name}"/>
							<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>
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
			if ($("#change_name").val() == "") {
				alert("새 이름을 입력해주세요.");
				$("#change_name").focus();
				return false;
			}
			if ($("#change_name").val() == $("#user_name").val()) {
				alert("기존 이름과 동일합니다.\n다시 입력해주세요.");
				$("#change_name").focus();
				return false;
			}
		});
	});
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>