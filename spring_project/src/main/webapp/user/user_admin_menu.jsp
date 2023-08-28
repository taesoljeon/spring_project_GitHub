<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<div id="minho_main">
	<div class="row container-fluid login">
	
		<%@include file="/inc/admin_page.jsp" %>
		
		<div class="col-sm-9 right">
			<div class="adminBox">
				<div class="lAdminProfile">
					<h3 class="adminName">${sessionScope.user.user_name}</h3>
					<h4 class="adminId">${sessionScope.user.user_id}</h4>
				</div>
				<div class="rAdminProfile">
					<c:choose>
						<c:when test="${sessionScope.user.user_role_code eq 1}">
							<h3 class="adminRole">메인관리자</h3>
						</c:when>
						<c:otherwise>
							<h3 class="adminRole">서브관리자</h3>
						</c:otherwise>
					</c:choose>
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
</script>

<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>