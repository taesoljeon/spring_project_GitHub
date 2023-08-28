<%-- <%@page import="org.apache.ibatis.reflection.SystemMetaObject"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css"> --%>
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
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
$("#taesol_product_date").on("blur", function() {
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

						<div class="row container-fluid login" >
						<%@include file="/inc/admin_page.jsp" %>
						<form action="${pageContext.request.contextPath}/product/product_insert.product" method="post" id="registrationform">
							<fieldset>
								<h3>상품등록</h3>
								<div class="form-group">
									<label for="product_brand">브랜드명</label> <input type="text"
										id="taesol_product_brand" name="product_brand" class="form-control">
								</div>
								<div class="form-group">
									<label for="product_name">제품명</label><input type="text" id="taesol_product_name"
										name="product_name" value="" class="form-control" >
								</div>
								<div class="form-group">
									<label for="product_number">품번</label> <input type="text"
										id="taesol_product_number" name="product_number" class="form-control">
								</div>
								<div class="form-group">
									<label for="product_price">발매가</label> <input type="text"
										id="taesol_product_price" name="product_price" class="form-control">
								</div>
								<div class="form-group">
									<label for="product_date">출시일</label> <input type="date"
										id="taesol_product_date" name="product_date" class="form-control">
								</div>
								<div class="form-group">
									<label for="taesol_product_title">제품설명</label>
									<textarea rows="10" cols="60" name="product_title" id="taesol_product_title"
										class="form-control"></textarea>
								</div>

								<div class="form-group">
									<label for="product_category_code">카테고리</label>
									<select name="product_category_code">
										<option value="100">신발</option>
										<option value="101">스니커즈</option>
										<option value="102">샌들</option>
										<option value="103">구두</option>
									</select>
								</div>		
							<div class="form-group text-right">
									<div>
										<input type="submit" value="입력" class="btn btn-info">
										<input type="reset"   onclick="history.go(-1);"    value="취소"  class="btn btn-danger">
									</div>
								</div>
</fieldset>
</form>
</div>
</div>
<%@include file="../inc/footer.jsp" %> 