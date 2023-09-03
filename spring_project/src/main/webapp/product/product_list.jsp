<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/product.css">
<%@include file="../inc/header.jsp" %>
<script>
var result = '${success}'; console.log(result);
if(result =="fail"){ alert("오류가 발생했습니다."); history.go(-1); }
else if(result.length != 0){ alert(result); }
</script>
<div class="taesol_registration-page" id="minho_main">
	<div class="row container-fluid login" >
						<%@include file="/inc/admin_page.jsp" %>
							<div class="col-sm-9 right productBox " >

<!-- Main content -->

	<table class="table table-striped table-hover">
		<colgroup>
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:10%">
			
			<col style="width:10%">
			<col style="width:15%">
			<col style="width:15%">
			<col style="width:15%">
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">코드</th>
				<th scope="col">브랜드명</th>
				<th scope="col">제품명</th>
				<th scope="col">품번</th>
				
				<th scope="col">발매가</th>
				<th scope="col">출시일</th>
				<th scope="col">수정일자</th>
				<th scope="col">제품이미지</th>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach var="dto"  items="${list}"  varStatus="status">
				<tr>
				<td>${paging.listtotal - status.index - (paging.pstartno)}</td>
				<td>${dto.product_code}</td>
				<td>${dto.product_brand}</td>
				<td style="font-weight: bold;"><a href="${pageContext.request.contextPath}/product/product_read.product?product_code=${dto.product_code}">
				<c:set var="brandName" value="${dto.product_name}" />
				<c:choose>
				  <c:when test="${fn:length(brandName) > 10}">
				    ${fn:substring(brandName, 0, 10)}...
				  </c:when>
				  <c:otherwise>
				    ${brandName}
				  </c:otherwise>
				</c:choose>
		        </a></td>
		        <td>
				<c:set var="brandNumber" value="${dto.product_number}" />
				<c:choose>
				  <c:when test="${fn:length(brandNumber) > 7}">
				    ${fn:substring(brandNumber, 0, 7)}...
				  </c:when>
				  <c:otherwise>
				    ${brandNumber}
				  </c:otherwise>
				</c:choose>
		        </td>
				
				<td>${dto.product_price}</td>
				<td>
			
				<fmt:parseDate var="in_date" value="${dto.product_date}" pattern="yyyy-MM-dd"/>
		        <fmt:formatDate value="${in_date}" pattern="yyyy년MM월dd일"/>
				</td>
				<td>
			    <c:forEach var="correction" items="${dto.product_correction_dateList}" varStatus="correctionStatus">
			        <c:if test="${correction != null or correctionStatus.index eq status.index}">
			            <fmt:parseDate var="in_date" value="${correction.product_correction_date}" pattern="yyyy-MM-dd"/>
		                <fmt:formatDate value="${in_date}" pattern="yyyy년MM월dd일"/>
			        </c:if>
			    </c:forEach>
				</td>
				<td>
				<c:forEach var="i_dto" items="${image_list}" varStatus="status2">
        <c:if test="${i_dto.image_product_code eq dto.product_code}">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/image/image_read.image?image_product_code=${dto.product_code}">이미지</a>
        </c:if>
        </c:forEach>
				</td>
				</tr>
			</c:forEach>
		</tbody>		
		<tfoot>
			<tr><td colspan="3"  class="ts-text-center">
			<ul  class="pagination">
				<c:if  test="${paging.start>= paging.bottomlist}">      <!--  10(90) <<<< 이전 11(100)  -->
				 <li>
				 <a href="${pageContext.request.contextPath}/product/product_list.product?pstartno=${(paging.start-2)*paging.onepagelist}">이전</a>
				</li>
				</c:if>
				<c:forEach  begin="${paging.start}"  end="${paging.end}" var="i">     <!-- 1(0)  2(10)  20 -->
				  <li   <c:if  test="${paging.current== i}"> class="active" </c:if>  > 
				  <a href="${pageContext.request.contextPath}/product/product_list.product?pstartno=${ (i-1)*paging.onepagelist}">${i}</a>
				  </li>
				</c:forEach>
				
				<c:if  test="${paging.pagetotal> paging.end}">      <!-- 10(90) 다음>>>> 11(100)  -->
				 <li>													<!-- 21 22 23 24 25 26       -->
				 <a href="${pageContext.request.contextPath}/product/product_list.product?pstartno=${(paging.end)*paging.onepagelist}">다음</a>
				</li>
				</c:if>
			</ul>
			</td></tr>
		</tfoot>	
	</table>
	<div class="text-right">
					<a href="${pageContext.request.contextPath}/product/product_insert.product" class="btn btn-info">제품등록</a>
			</div>
			
		</div>
		</div>
		</div>

<%@include file="../inc/footer.jsp" %> 