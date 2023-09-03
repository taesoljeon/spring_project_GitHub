<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<script>
var result = "${success}";
	if (result.indexOf('성공') !== -1) {
		alert(result);
	} else if (result.indexOf('실패') !== -1)  {
		alert(result);
	}
</script>

<div id="minho_main">
	<div class="row container-fluid login">
	
		<%@include file="/inc/admin_page.jsp" %>

			<form action=""  id="form">
		<div class="col-sm-9 right">
			<div class="col-sm-8">
				<h2 class="mainAdminText">회원 관리</h2>
			</div>
			<div class="col-sm-2">
				<select id="where" name="where" class="gum">
					<option value="default">조건별</option>
					<option value="1">생성일자순</option>
					<option value="2">아이디순</option>
					<option value="3">이름순</option>
				</select>
			</div>
			<div class="col-sm-2">
				<div class="dropdown">
					<button class="btn dropdown-toggle gumBtn" type="button"
						data-toggle="dropdown">
						계정상태 조정 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li class="dropdown-header">계정 권한 조정</li>
						<li><a id="yes" title="회원 계정 활성화">활성화</a></li>
						<li><a id="no" title="회원 계정 비활성화">비활성화</a></li>
					</ul>
				</div>
			</div>
			<table class="table table-striped tt">
				<thead>
					<tr>
						<th scope="col"><input type="checkbox" id="check_all"
							name="check_all" /></th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">휴대폰번호</th>
						<th scope="col">성별</th>
						<th scope="col">생년월일</th>
						<th scope="col">주소지</th>
						<th scope="col">생성일자</th>
						<th scope="col">계정상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" id="check" name="check"
								value="${dto.user_id}" />
							</td>
							<td><a
								href="${pageContext.request.contextPath}/user/user_admin_detail.user?user_id=${dto.user_id}"
								title="${dto.user_id} 상세 이동">${dto.user_id}</a></td>
							<td>${dto.user_name}</td>
							<td>${dto.user_telephone_number}</td>
							<td>${dto.user_gender}</td>
							<td>${dto.user_birth_date}</td>
							<td>${dto.user_address}</td>
							<td>${dto.user_join_date}</td>							
							<td>
							<c:choose>
								<c:when test="${dto.user_condition_code == 1}">활성화</c:when>
								<c:otherwise>비활성화</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

				<div class="text-center">
					<ul class="pagination">
						<c:if test="${paging.start>= paging.bottomlist}">
							<!--  10(90) <<<< 이전 11(100)  -->
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/user/user_member_read.user?pstartno=${(paging.start-2)*paging.onepagelist}">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${paging.start}" end="${paging.end}" var="i">
							<!-- 1(0)  2(10)  20 -->
							<li class="page-item"
								<c:if  test="${paging.current== i}"> class="active" </c:if>>
								<a class="page-link"
								href="${pageContext.request.contextPath}/user/user_member_read.user?pstartno=${ (i-1)*paging.onepagelist}">${i}</a>
							</li>
						</c:forEach>

						<c:if test="${paging.pagetotal> paging.end}">
							<!-- 10(90) 다음>>>> 11(100)  -->
							<li class="page-item">
								<!-- 21 22 23 24 25 26       --> <a class="page-link"
								href="${pageContext.request.contextPath}/user/user_member_read.user?pstartno=${(paging.end)*paging.onepagelist}">다음</a>
							</li>
						</c:if>
					</ul>
				</div>
		</div>
		</form>
	</div>
</div>



<script>
function main_role(e) {
	  if (${sessionScope.user.user_role_code} !== 1) {
		event.preventDefault(); // 페이지 이동 막기
	    alert('메인 관리자 권한 페이지입니다.');
	  }
	}
	
$(document).ready(function() {
	// 전체 선택
	$("#check_all").on("click",function() {
		if ($("#check_all").is(":checked")==true){
			$(":checkbox[name=check]").prop("checked",true);
		} else {
			$(":checkbox[name=check]").prop("checked",false);
		}
	});

 // 등급순 아이디순 이름순

 $("#where").on("change", function() {
	  if ($(this).val() == "1") {
		  $.ajax({
			 url : "user_read_ajax.user",
			 type : "GET",
			 data : { "where" : $("#where").val() },
             success: listResult,
			 error : function(xhr, status, msg){
					alert(xhr + "/" + status + "/" + msg);
			 }
		  });
	  } else if ($(this).val() == "2") {
		  $.ajax({
				 url : "user_read_ajax.user",
				 type : "GET",
				 data : { "where" : $("#where").val() },
	             success: listResult,
				 error : function(xhr, status, msg){
						alert(xhr + "/" + status + "/" + msg);
				 }
			  });
	  } else if ($(this).val() == "3") {
		  $.ajax({
				 url : "user_read_ajax.user",
				 type : "GET",
				 data : { "where" : $("#where").val() },
	             success: listResult,
				 error : function(xhr, status, msg){
						alert(xhr + "/" + status + "/" + msg);
				 }
			  });
	  }
	});
 
 function listResult(data) {
	    console.log(data.result); // result: true
	    console.log(data.data); // data: [{}, {}]
	    console.log(data);
	    $(".tt").find("tbody").empty();
	    var total = data.data.length;
	    $.each(data.data, function(idx, dto) {
	        var $tr = $("<tr>");

	        $tr.append($("<td>").html("<input type='checkbox' id='check' name='check' value='" + dto.user_id +"'>"))
	            .append($("<td>").html("<a href='${pageContext.request.contextPath}/user/user_admin_detail.user?user_id=" + dto.user_id + "' title='${user.user_id} 상세 이동'>" + dto.user_id + "</a>"))
	            .append($("<td>").html(dto.user_name))
	            .append($("<td>").html(dto.user_telephone_number))
	            .append($("<td>").html(dto.user_gender))
	            .append($("<td>").html(dto.user_birth_date))
	            .append($("<td>").html(dto.user_address))
	            .append($("<td>").html(dto.user_join_date))
	            .append($("<td>").html(dto.user_condition_code == 1 ? "활성화" : "비활성화"))
	            .appendTo(".tt tbody"); // 2-0, 2-1
	    });
	}

	
	// 활성화 체크
	$("#yes").on("click", function() {
		if ($(":checkbox[name=check]:checked").length==0){
			alert('선택된 관리자가 없습니다.');
		} else {
			$("#form").attr("action","${pageContext.request.contextPath}/user/user_yes_action.user");
			$("#form").attr("method","post");
			$("#form").submit();
		}
	});
	
	// 비활성화 체크
	$("#no").on("click", function() {
		if ($(":checkbox[name=check]:checked").length==0){
			alert('선택된 관리자가 없습니다.');
		} else {
			$("#form").attr("action","${pageContext.request.contextPath}/user/user_no_action.user");
			$("#form").attr("method","post");
			$("#form").submit();
		}
	});
});
</script>
 
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>