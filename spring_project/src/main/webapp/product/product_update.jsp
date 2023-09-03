
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/header.jsp"%>
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("taesol_product_brand").value 	= "${productVO.product_brand}";
        document.getElementById("taesol_product_name").value 	= "${productVO.product_name}";
        document.getElementById("taesol_product_number").value 	= "${productVO.product_number}";
        document.getElementById("taesol_product_price").value 	= "${productVO.product_price}";
        document.getElementById("taesol_product_date").value 	= "${productVO.product_date}";
        document.getElementById("taesol_product_title").value 	= "${productVO.product_title}";
    });
</script>
<script>
$(document).ready(function() {
  $("form").submit(function(event) {
    var isEmpty = false;
    $("input[type='text']").each(function() {
      if ($(this).val().trim() === "") {
        isEmpty = true;
        return false; // 빈 칸이 하나라도 있으면 반복문 종료.
      }
    });
    if (isEmpty) {
      event.preventDefault(); // 폼 제출 막기
      alert("빈 칸을 입력해주세요.");
    }
  });
});
$("#taesol_product_date").on("blur", function() {	//해당 요소에 대한 포커스를 잃었을때 실행
    var dateValue = $(this).val().trim();
    if (dateValue === "") {
      alert("날짜를 입력해주세요.");
    }
  });
});
$("#taesol_product_title").on("blur", function() {
    var dateValue = $(this).val().trim();
    if (dateValue === "") {
      alert("내용을 입력해주세요.");
    }
  });
});

</script>

<div class="taesol_registration-page" id="minho_main">
	<div class="row container-fluid login">
		<%@include file="/inc/admin_page.jsp"%>
		<form
			action="${pageContext.request.contextPath}/product/product_update.product"
			method="post" id="registrationform">
			<fieldset>
				<legend>상품정보</legend>
				<div class="form-group">
					<label for="product_brand">브랜드명</label> <input type="text"
						id="taesol_product_brand" name="product_brand"
						class="form-control">
				</div>
				<div class="form-group">
					<label for="product_name">제품명</label><input type="text"
						id="taesol_product_name" name="product_name" class="form-control">
				</div>
				<div class="form-group">
					<label for="product_number">품번</label> <input type="text"
						id="taesol_product_number" name="product_number"
						class="form-control">
				</div>
				<div class="form-group">
					<label for="product_price">발매가</label> <input type="text"
						id="taesol_product_price" name="product_price"
						class="form-control">
				</div>
				<div class="form-group">
					<label for="product_date">출시일</label> <input type="date"
						id="taesol_product_date" name="product_date" class="form-control">
				</div>
				<div class="form-group">
					<label for="taesol_product_title">제품설명</label>
					<textarea rows="10" cols="60" name="product_title"
						id="taesol_product_title" class="form-control"></textarea>
				</div>
				<div class="col-sm-7">
					<div class="form-group">
						<label for="product_category_code">등록된 카테고리</label> <span>
							<c:choose>
								<c:when test="${productVO.product_category_code == 100}">신발</c:when>
								<c:when test="${productVO.product_category_code == 101}">스니커즈</c:when>
								<c:when test="${productVO.product_category_code == 102}">샌들</c:when>
								<c:when test="${productVO.product_category_code == 103}">구두</c:when>

								<c:when test="${productVO.product_category_code == 200}">상의</c:when>
								<c:when test="${productVO.product_category_code == 201}">반팔 티셔츠</c:when>
								<c:when test="${productVO.product_category_code == 202}">긴팔 티셔츠</c:when>
								<c:when test="${productVO.product_category_code == 203}">후드</c:when>

								<c:when test="${productVO.product_category_code == 300}">하의</c:when>
								<c:when test="${productVO.product_category_code == 301}">반바지</c:when>
								<c:when test="${productVO.product_category_code == 302}">청바지</c:when>
								<c:when test="${productVO.product_category_code == 303}">스커트</c:when>

								<c:when test="${productVO.product_category_code == 400}">지갑</c:when>
								<c:when test="${productVO.product_category_code == 401}">반지갑</c:when>
								<c:when test="${productVO.product_category_code == 402}">카드지갑</c:when>
								<c:when test="${productVO.product_category_code == 403}">체인지갑</c:when>
								<c:otherwise>${productVO.product_category_code}</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>

				<div class="form-group">
					<label for="product_category_code">수정 카테고리</label> <select
						name="product_category_code">
						<option value="100">신발</option>
						<option value="101">스니커즈</option>
						<option value="102">샌들</option>
						<option value="103">구두</option>

						<option value="200">상의</option>
						<option value="201">반팔 티셔츠</option>
						<option value="202">긴팔 티셔츠</option>
						<option value="203">후드</option>

						<option value="300">하의</option>
						<option value="301">반바지</option>
						<option value="302">청바지</option>
						<option value="303">스커트</option>

						<option value="400">지갑</option>
						<option value="401">반지갑</option>
						<option value="402">카드지갑</option>
						<option value="403">체인지갑</option>
					</select>
				</div>
				<div class="form-group text-right">
					<div>
						<input type="hidden" name="product_code"
							value="${productVO.product_code}"> <input type="submit"
							value="수정하기" class="btn btn-default"
							style="background-color: black; color: white;"> <a
							href="${pageContext.request.contextPath}/product/product_list.product"
							class="btn btn-info">목록보기</a> <input type="reset"
							onclick="history.go(-1);" value="취소" class="btn btn-danger">
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>
<%@include file="../inc/footer.jsp"%>
