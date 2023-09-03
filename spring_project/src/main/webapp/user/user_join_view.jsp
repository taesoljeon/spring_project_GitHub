<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<script>
var result = "${success}";
var kakao = "${sessionScope.kakao}";
//var kakao = "${kakao_id}";
 console.log(kakao);
	if (result.indexOf('등록된') !== -1) {
		alert(result);
	}
</script>
<div id="minho_main">
	<div class="row container-fluid login">
		<div class="col-sm-12 center">
			<form
				action="${pageContext.request.contextPath}/user/user_join_action.user"
				method="post" id="form">
				<h2 class="mainText">회원 가입</h2>
				<div class="form-group fg">
					<label for="user_id" class="lf">아이디</label>
					<!--네이버 로그인 적용하면서 변경 -->
					<c:choose>
					<c:when test="${sns_naver_code != null}">
					<input type="text" class="form-control fc" id="user_id" name="user_id" pattern="^[a-zA-Z0-9]+$">
					</c:when>
					<c:otherwise>
					<input type="text" class="form-control fc" id="user_id" name="user_id" pattern="^[a-zA-Z0-9]+$" 
					<c:if test="${kakao_id != null}">
    					value="<c:out value='${kakao_id}' />" 
   						placeholder="<c:out value='${kakao_id}' />"
   						readonly
					</c:if> />
					</c:otherwise>
					</c:choose>
					<!--네이버 로그인 적용하면서 변경 -->
					<span class="id_ajax"></span>
				</div>
				<div class="form-group fg">
					<label for="password" class="lf">비밀번호</label>
					<input type="password" class="form-control fc" id="user_password" name="user_password" />

				</div>
				<div class="form-group fg">
					<label for="password_check" class="lf">비밀번호 확인</label>
					<input type="password" class="form-control fc" id="password_check" name="password_check" />
				</div>
				<div class="form-group fg">
					<label for="user_name" class="lf">이름</label>
					<input type="text" class="form-control fc" id="user_name" name="user_name" pattern="^[가-힣]+$" />
				</div>
				<div class="form-group fg">
					<label for="user_telephone_number" class="lf">휴대폰번호</label>
					<input type="text" class="form-control fc" id="user_telephone_number" name="user_telephone_number" maxlength="11" pattern="^[0-9]+$" />
					<span class="telephone_ajax"></span>					
				</div>
				<div class="form-group fg">
					<label for="user_birth_date" class="lf">생년월일</label>
					<input type="date" class="form-control fc" id="user_birth_date" name="user_birth_date" />
				</div>
				<div class="form-group fg">
					<label for="user_gender" class="lf" >성별</label>
					<select class="from-control fcc" id="user_gender" name="user_gender">
					<option value="default">성별</option>
					<option value="남">남</option>
					<option value="여">여</option>
					</select>
				</div>
				<div class="form-group fg">
					<label for="user_bank" class="lf" >은행</label>
					<select class="from-control fcc" id="user_bank" name="user_bank">
					<option value="default">은행</option>
					<option value="국민은행">국민은행</option>
					<option value="신한은행">신한은행</option>
					<option value="기업은행">기업은행</option>
					<option value="우리은행">우리은행</option>
					<option value="하나은행">하나은행</option>
					<option value="농협">농협</option>
					<option value="수협">수협</option>
					<option value="새마을금고">새마을금고</option>
					<option value="케이뱅크">케이뱅크</option>
					<option value="카카오뱅크">카카오뱅크</option>
					</select>
				</div>
				<div class="form-group fg">
					<label for="user_account_number" class="lf">계좌번호</label>
					<input type="text" class="form-control fc" id="user_account_number" name="user_account_number" maxlength="10" placeholder="10자리 고정" pattern="^[0-9]+$" />
				</div>
				<div class="form-group fg">
				<label for="postcode" class="lf" >우편번호</label><br/>
				<input type="text" id="postcode" name="postcode" class="fcp" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" class="bcp" value="우편번호 찾기"><br>
				<input type="text" id="address" name="address" class="form-control fcp2" placeholder="주소">
				<input type="text" id="extraAddress" name="extraAddress" class="form-control fcp2" placeholder="참고항목">
				<input type="text" id="detailAddress" name="detailAddress" class="form-control fcp2" placeholder="상세주소">
				</div>
				<c:if test="${sns_naver_code != null}">
				<input type="hidden" name="user_naver_code" id="user_naver_code" value="${sns_naver_code}">
				</c:if>
				<div class="form-group fg">
				<input type="submit" class="btn-block bb" value="회원가입" />
				</div>
				<div class="form-group fg">
				<a href="javaScript:history.go(-1);" title="뒤로 가기" class="btn-block ba">뒤로 가기</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 우편 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
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
	// 아이디 중복 체크 ajax
	$("#user_id").on("keyup", function() {
 		if ($("#user_id").val().trim()!="") {
			$.ajax({
				url : "user_id_check_ajax.user",
				type : "POST",
				dataType : "text",
				data: {"user_id" : $('#user_id').val() },
				success : function(data) {
					$(".id_ajax").html(data);
				},
				error : function(xhr, status, msg) {
					alert(status + "/" + msg);
				}
			});
		}
	});
	
	// 휴대폰번호 중복 체크 ajax
	$("#user_telephone_number").on("keyup", function() {
		if($("#user_telephone_number").val().trim()!="") {
			$.ajax({
				url : "user_telephone_check_ajax.user",
				type : "POST",
				dataType : "text",
				data : { "user_telephone_number" : $('#user_telephone_number').val() },
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
			if ($("#user_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#user_id").focus();
				return false;
			}
			if ($("#id_check").data('check') == 'checked') {
				alert("아이디가 중복됩니다.\n다시입력해주세요.");
				$("#user_id").focus();
				return false;
			}

			if ($("#user_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_password").focus();
				return false;
			}
			if ($("#password_check").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				$("#password_check").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_telephone_number").val() == "") {
				alert("휴대폰번호을 입력해주세요.");
				$("#user_telephone_number").focus();
				return false;
			}
			if ($("#telephone_check").data('check') == 'checked') {
				alert("휴대폰번호가 중복됩니다.\n다시입력해주세요.");
				$("#user_telephone_number").focus();
				return false;
			}
			if ($("#user_brith_date").val() == "") {
				alert("생년월일을 입력해주세요.");
				$("#user_brith_date").focus();
				return false;
			}
			if ($("#user_gender").val() == "default") {
				alert("성별을 선택해주세요.");
				$("#user_gender").focus();
				return false;
			}
			if ($("#user_bank").val() == "default") {
				alert("은행을 선택해주세요.");
				$("#user_bank").focus();
				return false;
			}
			if ($("#user_account_number").val() == "") {
				alert("계좌번호를 선택해주세요.");
				$("#user_account_number").focus();
				return false;
			}			
			if ($("#detailAddress").val() == "" || $("#extraAddress").val() == "" || $("#address").val() == "" || $("#postcode").val() == "") {
				alert("주소를 입력해주세요.");
				$("#postcode").focus();
				return false;
			}
			if ($("#user_password").val() != $("#password_check").val()) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.\n다시 입력해주세요.");
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