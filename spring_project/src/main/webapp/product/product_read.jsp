<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css">
<%@ include file="/inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css">
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>

	<div id="minho_main">
						<div class="row container-fluid login" >
						
							<%@include file="/inc/admin_page.jsp" %>
							<div class="col-sm-9 right productBox " >
								<h3 id="productTitle" class="taesolInfo">상품정보</h3>
								<div class="form-group p1">
									<label for="product_brand">브랜드명</label> <input type="text"
										id="taesol_product_brand" name="product_brand" class="form-control taesol-text" 
										value="${productVO.product_brand}">
								</div>
								<div class="form-group p1">
									<label for="product_name">제품명</label><input type="text" id="taesol_product_name"
										name="product_name" class="form-control" value="${productVO.product_name}" >
								</div>
								<div class="form-group p1">
									<label for="product_number">품번</label> <input type="text"
										id="taesol_product_number" name="product_number" class="form-control" 
										value="${productVO.product_number}" >
								</div>
								<div class="form-group p1">
									<label for="product_price">발매가</label> <input type="text"
										id="taesol_product_price" name="product_price" class="form-control" value="${productVO.product_price}" >
								</div>
								<div class="form-group p1">
									<label for="product_date">출시일</label> <input type="date"
										id="taesol_product_date" name="product_date" class="form-control" value="${productVO.product_date}" >
								</div>
								<div class="form-group p1">
									<label for="taesol_product_title">제품설명</label>
									<textarea rows="10" cols="60" name="product_title" id="taesol_product_title"
										class="form-control"  >${productVO.product_title}</textarea>
								</div>

								<div class="form-group p1">
									<label for="product_category_code">카테고리</label>
									<span>
									<c:choose>
										<c:when test="${productVO.product_category_code == 100}">신발</c:when>
										<c:when test="${productVO.product_category_code == 101}">스니커즈</c:when>
										<c:when test="${productVO.product_category_code == 102}">샌들</c:when>
										<c:when test="${productVO.product_category_code == 103}">구두</c:when>
										<c:otherwise>${productVO.product_category_code}</c:otherwise>
									</c:choose>
									</span>
								</div>


<div class="form-group text-right">
				<div>
			
					<c:if test="${image_check eq 0}">
					<a href="${pageContext.request.contextPath}/image/image_insert.image?image_product_code=${productVO.product_code}" class="btn btn-default">제품이미지업로드</a>
					</c:if>
					<c:if test="${image_check eq 1}">
					<button class="btn btn-danger">이미지 있음</button>
					</c:if>
						
					<a href="${pageContext.request.contextPath}/product/product_update.product?product_code=${productVO.product_code}" class="btn btn-default">제품수정</a>
					<a href="${pageContext.request.contextPath}/product/product_list.product" class="btn btn-info">목록보기</a>
					<input type="reset"   onclick="history.go(-1);"    value="취소"  class="btn btn-danger"    >  
				</div>
				</div>
</div>
</div>
</div>
<%@include file="../inc/footer.jsp" %> 