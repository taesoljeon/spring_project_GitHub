<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css">
<%@include file="../inc/header.jsp" %> 
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>
<!-- Main content -->
<section class="container"  style="margin-top:10%">
	<table class="table table-striped table-hover">
		<colgroup>
			<col style="width:20%">
			<col style="width:20%">
			<col style="width:20%">
			<col style="width:40%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">코드</th>
				<th scope="col">사이즈</th>
				<th scope="col">제품코드</th>
				<th scope="col">매물등록</th>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach var="dto"  items="${list}"  varStatus="status">
				<tr>
				<td>${dto.detail_code}</td>
				<td>
				<c:choose>
				<c:when test="${dto.detail_size_code == 1}">230</c:when>
				<c:when test="${dto.detail_size_code == 2}">235</c:when>
				<c:when test="${dto.detail_size_code == 3}">240</c:when>
				<c:when test="${dto.detail_size_code == 4}">245</c:when>
				<c:when test="${dto.detail_size_code == 5}">250</c:when>
				
				<c:when test="${dto.detail_size_code == 6}">255</c:when>
				<c:when test="${dto.detail_size_code == 7}">260</c:when>
				<c:when test="${dto.detail_size_code == 8}">265</c:when>
				<c:when test="${dto.detail_size_code == 9}">270</c:when>
				<c:when test="${dto.detail_size_code == 10}">275</c:when>
				
				<c:when test="${dto.detail_size_code == 11}">280</c:when>
				<c:when test="${dto.detail_size_code == 12}">285</c:when>
				<c:when test="${dto.detail_size_code == 13}">290</c:when>
				<c:when test="${dto.detail_size_code == 14}">295</c:when>
				<c:when test="${dto.detail_size_code == 15}">300</c:when>
				
				<c:otherwise></c:otherwise>
				</c:choose>
				</td>
				<td>${dto.detail_product_code}</td>
				<td class="btn btn-default"><a href="${pageContext.request.contextPath}/sell/sell_insert.sell?detail_code=${dto.detail_code}">매물등록</a></td>
				</tr>
			</c:forEach>
		</tbody>			
	</table>
</section>
<%@include file="../inc/footer.jsp" %> 