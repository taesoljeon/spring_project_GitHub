<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<script>
var result = "${success}";
var contextPath = "${pageContext.request.contextPath}";
	if (result.indexOf('완료') !== -1) {
		alert(result);
		location.href = contextPath + '/user/user_admin_read.user';
	} else if (result.indexOf('실패') !== -1)  {
		alert(result);
	}
</script>

<div id="minho_main">
	<div class="row container-fluid login">
	
		<%@include file="/inc/admin_page.jsp" %>
		
		<div class="col-sm-9 right">
		<div class="adminBoxCh">
			<h3 class="adminNameCh">${userDto.user_name}님의 상세보기</h3>
		<div class="form-group fgCh">
			<label for="user_id" class="adminMyLf2">아이디</label>
			<input type="text" class="adminMyfc2" id="user_id" name="user_id" placeholder="${userDto.user_id}" readonly />
		</div>
		<div class="form-group fgCh">
			<label for="user_password" class="adminMyLf2">비밀번호</label>
			<input type="password" class="adminMyfc2" id="user_password" name="user_password" value="${userDto.user_password}" readonly />
			<a class="adminMyBcp2" href="${pageContext.request.contextPath}/user/user_password_change.user?user_id=${userDto.user_id}&user_password=${userDto.user_password}"
			   title="비밀번호 변경 폼 이동">변경</a>
		</div>
		<div class="form-group fgCh">
			<label for="user_role" class="adminMyLf2">권한</label>
			<input type="text" class="adminMyfc2" id="user_role" name="user_role"
				   placeholder=
			<c:choose>
				<c:when test="${userDto.user_role_code eq 1 }">
				"메인관리자"
				</c:when>
				<c:when test="${userDto.user_role_code eq 2 }">
				"서브관리자"
				</c:when>
				<c:otherwise>
				"일반회원"
				</c:otherwise>
			</c:choose>
				   readonly />
		</div>
		<div class="form-group fgCh">
			<label for="user_name" class="adminMyLf2">이름</label>
			<br>
			<input type="text" class="adminMyfc2" id="user_name" name="user_name" placeholder="${userDto.user_name}" readonly />
			<a class="adminMyBcp2" href="${pageContext.request.contextPath}/user/user_name_change.user?user_id=${userDto.user_id}&user_name=${userDto.user_name}"
			   title="이름 변경 폼 이동">변경</a>			
		</div>
		<div class="form-group fgCh">
			<label for="user_telephone_number" class="adminMyLf2">휴대폰번호</label>
			<br>			
			<input type="text" class="adminMyfc2" id="user_telephone_number" name="user_telephone_number" placeholder="${userDto.user_telephone_number}" readonly />
			<a class="adminMyBcp2" href="${pageContext.request.contextPath}/user/user_telephone_change.user?user_id=${userDto.user_id}&user_telephone_number=${userDto.user_telephone_number}"
			   title="휴대폰번호 변경 폼 이동">변경</a>			
		</div>
		<div class="form-group fgCh">
			<label for="user_birth_date" class="adminMyLf2">생년월일</label>
			<br>
			<input type="text" class="adminMyfc2" id="user_birth_date" name="user_birth_date" placeholder="${userDto.user_birth_date}" readonly />	
		</div>
		<div class="form-group fgCh">
			<label for="user_gender" class="adminMyLf2">성별</label>
			<br>			
			<input type="text" class="adminMyfc2" id="user_gender" name="user_gender" placeholder="${userDto.user_gender}" readonly />	
		</div>
		<div class="form-group fgCh">
			<label for="user_address" class="adminMyLf2">우편번호</label>
			<br>			
			<input type="text" class="adminMyfc2" id="user_address" name="user_address" placeholder="${userDto.user_address}" readonly />
			<a class="adminMyBcp2" href="${pageContext.request.contextPath}/user/user_address_change.user?user_id=${userDto.user_id}&user_address=${userDto.user_address}"
			   title="우편번호 변경 폼 이동">변경</a>			
		</div>
		<c:if test="${userDto.user_role_code eq 2 || userDto.user_role_code eq 3 }">
		<div class="form-group fgChBt">
		<a href="#"
		class="btn-block bb" onclick="delete_confirm(event)" title="삭제 하기">삭제 하기</a>
		</div> <!-- 온클릭에서 링크타짐 -->
		</c:if>
		<div class="form-group fgChBb">
			<a href="javaScript:history.go(-1);" title="뒤로 가기" class="btn-block ba">뒤로 가기</a>
		</div>
		</div>
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
	
function delete_confirm(event) {
    event.preventDefault();
    if (!confirm("정말로 삭제하시겠습니까?")) {
        alert("삭제가 취소되었습니다.");
    } else {
        alert("삭제되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/user/user_delete_action.user?user_id=${userDto.user_id}";
    }
}
</script>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>