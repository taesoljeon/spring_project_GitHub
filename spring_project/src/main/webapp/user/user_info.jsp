<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

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
			<div class="adminBox">
				<div class="lAdminProfile">
					<h3 class="adminName">${userDto.user_name}</h3>
					<h4 class="adminId">${userDto.user_id}</h4>
				</div>
				<div class="rAdminProfile">
					<c:choose>
						<c:when test="${sessionScope.user.user_role_code eq 1}">
							<h3 class="adminRole">메인관리자</h3>
						</c:when>
						<c:when test="${sessionScope.user.user_role_code eq 2}">
							<h3 class="adminRole">서브관리자</h3>
						</c:when>
						<c:otherwise>
							<h3 class="adminRole">일반회원</h3>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<h2 class="mainAdminText">로그인 정보</h2>
			<div class="form-group adminMyFg">
				<label for="user_id" class="adminMyLf">아이디</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_id"
				name="user_id" placeholder="${userDto.user_id}" readonly />
			</div>
			<div class="form-group adminMyFg">
				<label for="user_password" class="adminMyLf">비밀번호</label><br/>
				<input type="password" class="from-control adminMyfc" id="user_password"
				name="user_password" value="${userDto.user_password}" readonly />
				<a class="adminMyBcp"
				href="${pageContext.request.contextPath}/user/user_password_change.user?user_id=${userDto.user_id}&user_password=${userDto.user_password}"
				title="비밀번호 변경 폼 이동">변경</a>
			</div>
			<div class="form-group adminMyFg">
				<label for="user_role" class="adminMyLf">권한</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_role" name="user_role"
				placeholder=
					<c:choose>
						<c:when test="${sessionScope.user.user_role_code eq 1 }">"메인관리자"</c:when>
						<c:when test="${sessionScope.user.user_role_code eq 2 }">"서브관리자"</c:when>
						<c:otherwise>"일반회원"</c:otherwise>
					</c:choose>
				readonly />
			</div>
			 	<c:if test="${sessionScope.user.user_role_code eq 3 }">
			 	<div class="form-group adminMyFg">
				<label for="user_com_code" class="adminMyLf">통합 계정</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_role" name="user_role"
				placeholder=
				<c:choose>
					<c:when test="${sessionScope.user.user_com_code eq 1 }">"카카오 통합 계정"</c:when>
					<c:otherwise>"일반 계정"</c:otherwise>					
				</c:choose>
				readonly />
				</div>
				</c:if>

				
			<div class="form-group adminMyFg">
				<label for="user_name" class="adminMyLf">이름</label><br/>
				<input	type="text" class="from-control adminMyfc" id="user_name"
				name="user_name" placeholder="${userDto.user_name}" readonly />
				<a class="adminMyBcp"
				href="${pageContext.request.contextPath}/user/user_name_change.user?user_id=${userDto.user_id}&user_name=${userDto.user_name}"
				title="이름 변경 폼 이동">변경</a>
			</div>
			<div class="form-group adminMyFg">
				<label for="user_telephone_number" class="adminMyLf">휴대폰번호</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_telephone_number" name="user_telephone_number"
				placeholder="${userDto.user_telephone_number}" readonly />
				<a class="adminMyBcp"
				href="${pageContext.request.contextPath}/user/user_telephone_change.user?user_id=${userDto.user_id}&user_telephone_number=${userDto.user_telephone_number}"
				title="휴대폰번호 변경 폼 이동">변경</a>
			</div>
			<div class="form-group adminMyFg">
				<label for="user_birth_date" class="adminMyLf">생년월일</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_birth_date"
				name="user_birth_date" placeholder="${userDto.user_birth_date}"
				readonly />
			</div>
			<div class="form-group adminMyFg">
				<label for="user_gender" class="adminMyLf">성별</label><br/>
				<input type="text" class="from-control adminMyfc" id="user_gender"
				name="user_gender" placeholder="${userDto.user_gender}" readonly />
			</div>
			<div class="form-group adminMyFg">
				<label for="user_address" class="adminMyLf">우편번호</label><br/>
				<input class="from-control adminMyfc" type="text" id="user_address"
				name="user_address" placeholder="${userDto.user_address}" readonly>
				<a class="adminMyBcp"
				href="${pageContext.request.contextPath}/user/user_address_change.user?user_id=${userDto.user_id}&user_address=${userDto.user_address}"
				title="우편번호 변경 폼 이동">변경</a>
			</div>
			
			<c:if test="${sessionScope.user.user_role_code eq 3}">
				<div class="form-group adminMyFg">
				<a href="${pageContext.request.contextPath}/user/user_member_delete.user" title="회원 탈퇴">회원 탈퇴</a>
				</div>
			</c:if>
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
</script>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>