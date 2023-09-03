<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %> 
<script>
// blur JavaScript 이벤트 중 하나로, 요소에서 포커스가 벗어났을 때 발생하는 이벤트
$("#image_title").on("blur", function() {
    var dateValue = $(this).val().trim();
    if (dateValue === "") {
      alert("내용을 입력해주세요.");
    }
  });
});
</script>
	<div class="container">
			<h3>이미지 업데이트</h3>

			<form action="${pageContext.request.contextPath}/image/image_update.image" method="post" 
			       enctype="multipart/form-data">
				<div class="form-group">
				  <label for="file">이미지</label>
				  <input type="file"   name="file"   id="file"   class="form-control" > 
				</div>	
				<div class="form-group">
				  <label for="image_title"  >이미지 설명</label>
				  <input type="text"   name="image_title"   id="image_title"   class="form-control" > 
				</div>																			
				<div class="form-group">
				</div>					
				
				<div class="form-group  text-right">			
				<input type="hidden"   name="image_product_code"   id="image_product_code" value="${param.image_product_code}">
						 <input type="submit"   value="입력"  class="btn">  
						 <input type="reset"   onclick="history.go(-1);"    value="취소"  class="btn"    >  
						 <a href="${pageContext.request.contextPath}/product/product_list.product"   class="btn btn-info"   >목록보기</a>
				</div>
			</form>
</div>


<%@include file="../inc/footer.jsp" %> 