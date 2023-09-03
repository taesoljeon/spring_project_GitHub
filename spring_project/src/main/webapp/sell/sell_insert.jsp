<%-- <%@page import="org.apache.ibatis.reflection.SystemMetaObject"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css">

<%@include file="../inc/header.jsp" %> 
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>

						<form action="${pageContext.request.contextPath}/sell/sell_insert.sell" method="post" id="registrationform">
							<fieldset>
								<legend>매물등록</legend>
								<div class="form-group">
									<label for="sell_price">매물가격</label> <input type="text"
										id="sell_price" name="sell_price" class="form-control">
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
										<input type="hidden" name="sell_detail_code" value="${param.detail_code}" >
										<input type="hidden" name="sell_condition_code" value="2" >
										<input type="submit" value="입력" class="btn btn-info">
										<input type="reset"   onclick="history.go(-1);"    value="취소"  class="btn btn-danger">
									</div>
								</div>
</fieldset>
</form>


<%@include file="../inc/footer.jsp" %> 