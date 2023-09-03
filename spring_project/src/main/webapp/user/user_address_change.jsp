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
				action="${pageContext.request.contextPath}/user/user_address_change_action.user"
				method="post" id="form">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">우편번호 변경</h3>
					<div class="form-group fgCh">
						<input type="text" id="postcode" name="postcode" class="fcp"
							placeholder="우편번호"> <input type="button"
							onclick="execDaumPostcode()" class="bcpCh" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address"
							class="form-control fcp2" placeholder="주소"> <input
							type="text" id="extraAddress" name="extraAddress"
							class="form-control fcp2" placeholder="참고항목"> <input
							type="text" id="detailAddress" name="detailAddress"
							class="form-control fcp2" placeholder="상세주소"> <input
							type="hidden" id="user_address" name="user_address"
							value="${user_address}" />
							<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>							
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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function main_role(e) {
	  if (${sessionScope.user.user_role_code} !== 1) {
		event.preventDefault(); // 페이지 이동 막기
	    alert('메인 관리자 권한 페이지입니다.');
	  }
	}

	//우편 API
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	// 빈칸 체크 및 중복 체크
	$(document).ready(function() {
		$("#form").submit(function() {
			if ($("#detailAddress").val() == "" || $("#extraAddress").val() == "" || $("#address").val() == "" || $("#postcode").val() == "") {
				alert("주소를 입력해주세요.");
				$("#postcode").focus();
				return false;
			}
			if ($("#postcode").val() + " " + $("#address").val() + $("#extraAddress").val() + " " + $("#detailAddress").val() == $("#user_address").val()) {
				alert("기존 주소와 동일합니다.\n다시 입력해주세요.");
				$("#postcode").focus();
				return false;				
			}
		});
	});
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>