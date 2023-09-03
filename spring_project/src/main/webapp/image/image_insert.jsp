<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %> 
<script>
$("#image_title").on("blur", function() {
    var dateValue = $(this).val().trim();
    if (dateValue === "") {
      alert("내용을 입력해주세요.");
    }
  });
});
</script>
			<div id="minho_main">
				<div class="row container-fluid login" >
					<%@include file="/inc/admin_page.jsp" %>
					<div class="col-sm-9 right " >
			
			<h3>이미지 업로드</h3>
			
			<form action="${pageContext.request.contextPath}/image/image_insert.image" method="post" 
			       enctype="multipart/form-data">
			       <div class="col-sm-6">
				<div class="form-group row">
				  <label for="image_title"  >이미지 이름</label>
				  <input type="text"   name="image_title"   id="image_title"   class="form-control" > 
				</div>
					</div>	
			       
			       <div class="col-sm-6">
				<div class="form-group">
				  <label for="file">이미지</label>
				  <input type="file"   name="file"   id="file"   class="form-control" > 
				</div>
				</div>
					   																		
				<div class="form-group">
				  
				   
				</div>					
				
				<div class="form-group  text-right">			
				<input type="hidden"   name="image_product_code"   id="image_product_code" value="${param.image_product_code}">
						 <input type="submit"   value="입력"  class="btn btn-info">  
						 <input type="reset"   onclick="history.go(-1);"    value="취소"  class="btn btn-danger"    >  
						 <a href="${pageContext.request.contextPath}/product/product_list.product" class="btn btn-default">목록보기</a> 
				</div>
				
			</form>

</div>
</div>
</div>
<!--					 -->
<!--  Footer.html  -->
<!--					 -->
<%@include file="../inc/footer.jsp" %> 