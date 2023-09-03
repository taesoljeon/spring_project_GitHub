<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/inc/header.jsp" %>

<div class='container' style='width:555px; height:369px; margin-top:50px; margin-bottom:150px; padding:20px; position:relative; border-color: black; border-style: solid;'>

	<h2 class='text-center'>상품 입찰이 완료되었습니다</h2>
	
	
	
	<button id="main" class="btn btn-danger" style="width:160px; height:50px; position:absolute; bottom:44px; left:66px;" >메인으로</button>
	<button id="order" class="btn" style="width:160px; height:50px; position:absolute; bottom:44px; right:66px;">입찰내역</button>
	
</div>
	
	<script>
		$("#main").on("click",function(){
			location.href='${pageContext.request.contextPath}/image/main.image';
		})
		$("#order").on("click",function(){
			location.href='${pageContext.request.contextPath}/bid/bid_list.bid';
		})
	
	</script>

<%@ include file="/inc/footer.jsp" %>