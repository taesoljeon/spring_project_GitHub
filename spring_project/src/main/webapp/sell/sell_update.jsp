<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/inc/product.css">
<%@include file="../inc/header.jsp"%>
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("taesol_sell_price").value 	= "${sellVO.sell_price}";
        document.getElementById("taesol_sell_quantity").value 	= "${sellVO.sell_quantity}";
    });
</script>
<div class="taesol_registration-page" id="minho_main">

	<div class="row container-fluid login" >
<%@include file="/inc/user_page.jsp" %>
					<div class="col-sm-9 right" >
	<form action="${pageContext.request.contextPath}/sell/sell_update.sell" method="post" id="registrationform">
		<fieldset>
			<legend>상품정보</legend>
			<div class="form-group">
				<label for="product_name">매물가격</label><input type="text"
					id="taesol_sell_price" name="sell_price" class="form-control">
			</div>
			<div class="form-group">
				<label for="sell_quantity">매물수량</label>
									<select name="sell_quantity"  id="sell_quantity" class="form-control">
										<option value="1">1켤레</option>
										<option value="2">2켤레</option>
										<option value="3">3켤레</option>
										<option value="4">4켤레</option>
										<option value="5">5켤레</option>
										<option value="6">6켤레</option>
										<option value="7">7켤레</option>
										<option value="8">8켤레</option>
										<option value="9">9켤레</option>
										<option value="10">10켤레</option>
									</select>
			</div>
			
			<div class="form-group text-right">
				<div>
				<input type="hidden" name="sell_user_id" value="${sessionScope.user.user_id}" >
					<input type="hidden" name="sell_code" value="${sellVO.sell_code}">
					<input type="submit" value="수정하기" class="btn btn-info">
					<input type="reset" onclick="history.go(-1);" value="취소" class="btn btn-danger">
				</div>
			</div>
		</fieldset>
	</form>
</div>
</div>
</div>
<%@include file="../inc/footer.jsp"%>
