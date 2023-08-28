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
				action="${pageContext.request.contextPath}/user/user_telephone_change_action.user"
				method="post" id="form">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">휴대폰번호 변경</h3>
					<div class="form-group fgCh">
						<label for="telephone" class="lfCh">새 휴대폰번호</label> <input
							type="text" class="form-control fcCh" id="telephone"
							name="telephone" maxlength="11" pattern="^[0-9]+$" /> <input
							type="hidden" id="user_telephone_number"
							name="user_telephone_number" value="${user_telephone_number}" />
							<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>							
						<span class="telephone_ajax"></span>
					</div>
					<div class="form-group fgChBt">
						<input type="submit" class="btn-block bb" value="변경하기" />
					</div>
					<div class="form-group fgChBb">
						<a href="javaScript:history.go(-1);" title="뒤로 가기"
							class="btn-block ba">뒤로 가기</a>
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
	
	// 휴대폰번호 중복 체크 ajax
	$("#telephone").on("keyup", function() {
		if ($("#telephone").val().trim() != "") {
			$.ajax({
				url : "user_telephone_check_ajax.user",
				type : "POST",
				dataType : "text",
				data : {
					"user_telephone_number" : $('#telephone').val()
				},
				success : function(data) {
					$(".telephone_ajax").html(data);
				},
				error : function(xhr, status, msg) {
					alert(status + "/" + msg);
				}
			});
		}
	});
	// 빈칸 체크 및 중복 체크
	$(document).ready(function() {
		$("#form").submit(function() {
			if ($("#telephone").val() == "") {
				alert("새 휴대폰번호를 입력해주세요.");
				$("#telephone").focus();
				return false;
			}
			if ($("#telephone").val() == $("#user_telephone_number").val()) {
				alert("기존 휴대폰번호와 같습니다.\n다시 입력해주세요.");
				$("#telephone").focus();
				return false;
			}
			if ($("#telephone_check").data('check') == 'checked') {
				alert("휴대폰번호가 중복됩니다.\n다시입력해주세요.");
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