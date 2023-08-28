<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" %>  

<%@include file="../inc/header.jsp" %> 
<!--					 -->
<!--  header.html  -->
	<script>
		var result = "${success}";
		if(result =="fail"){ alert("비밀번호를 확인해주세요!"); history.go(-1);}
		else if(result.length != 0){alert(result);}
	</script>
	
	<div class="container  spring2_detail">
			<h3>이미지상세페이지</h3> 			
  			 
			<div class="form-group"  >
			  <span class="glyphicon glyphicon-plus"><label for="bname">이미지 코드</label></span>
			  <input type="text" id="bname"  name="bname" value="${imageVO.image_code}"  readonly="readonly" class="form-control" /> 
			</div>
					
			<div  class="form-group"   >
			  <span class="glyphicon glyphicon-plus"> <label for="btitle">이미지이름</label></span>
			  <input type="text" id="btitle"  name="btitle" value="${imageVO.image_title}"  readonly="readonly" class="form-control" /> 
			</div>	
			<div>
					<span class="glyphicon glyphicon-plus"><label for="bcontent">이미지</label></span>
					<img src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${imageVO.image_target}">
					<%-- <img src="file:/C:/spring_sts3/spring_Team/TESTIMG/${imageVO.image_target}"> --%>

				</div>

			<div class="row  text-right">
					<form action="${pageContext.request.contextPath}/image/image_delete.image" method="post">
  <input type="hidden" name="image_product_code" value="${imageVO.image_product_code}">
  <button type="submit" class="btn btn" style="background-color: red; color: white;">삭제하기</button></form>
				 <a href="${pageContext.request.contextPath}/image/image_update.image?image_product_code=${imageVO.image_product_code}"  class="btn btn"  style="background-color: black; color: white;" >수정</a> 
				 <a href="${pageContext.request.contextPath}/product/product_list.product"   class="btn btn-info">목록보기</a>  
			</div>	
	</div>

<!--					 -->
<!--  Footer.html  -->
<!--					 -->
<%@include file="../inc/footer.jsp" %> 
