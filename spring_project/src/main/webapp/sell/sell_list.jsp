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
<script>
    function submitForm() {
        document.getElementById('deleteForm').submit();
    }
</script>
<!-- Main content -->

<div class="taesol_registration-page" id="minho_main">

	<div class="row container-fluid login" >
<%@include file="/inc/user_page.jsp" %>
					<div class="col-sm-9 right" >

	<table class="table table-striped table-hover">
		<colgroup>
		<col style="width:5%">
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:15%">
			
			<col style="width:15%">
			<col style="width:15%">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
			<th scope="col">번호</th>
				<th scope="col">코드</th>
				<th scope="col">가격</th>
				<th scope="col">수량</th>
				<th scope="col">등록일</th>
				
				<th scope="col">수정일</th>
				<th scope="col">해당제품</th>
				<th scope="col">관리</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
		 	<c:forEach var="dto"  items="${list}"  varStatus="status">
				<tr>
				<td>${paging.listtotal - status.index - (paging.pstartno)}</td>
				<td>${dto.sell_code}</td>
				<td>${dto.sell_price}</td>
				<td>${dto.sell_quantity}</td>
				<td>
				<fmt:parseDate var="in_date" value="${dto.sell_creation_date}" pattern="yyyy-MM-dd"/>
		        <fmt:formatDate value="${in_date}" pattern="yyyy년MM월dd일"/>
				</td>
				<td>
				<c:forEach var="correction" items="${dto.sell_correction_dateList}" varStatus="correctionStatus">
			        <c:if test="${correction != null or correctionStatus.index eq status.index}">
			            <fmt:parseDate var="in_date" value="${correction.sell_correction_date}" pattern="yyyy-MM-dd"/>
		                <fmt:formatDate value="${in_date}" pattern="yyyy년MM월dd일"/>
			        </c:if>
			    </c:forEach>
				</td>
				<td> <!-- 해당 제품으로 이동하는 식으로 구현 -->
				<c:forEach var="correction" items="${dto.detail_getProduct_code}" varStatus="correctionStatus">
			        <c:if test="${correction != null or correctionStatus.index eq status.index}">
			       <a  href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${correction.detail_product_code}" class="btn btn-default">제품이동</a>
			        </c:if>
			    </c:forEach>
				
				</td>
				<td><a href="${pageContext.request.contextPath}/sell/sell_update.sell?sell_code=${dto.sell_code}" class="btn btn-default">수정</a></td>
				<td>
				<form id="deleteForm" action="${pageContext.request.contextPath}/sell/sell_delete.sell" method="POST">
        		<input type="hidden" name="sell_code" value="${dto.sell_code}">
        		<!-- 해당 방식으로 버튼을 처리할시에는 GET 방식을 사용하지 않기 때문에 쿼리스트링이 주소창에 들어나는 문제를 해결할 수 있다. -->
        		<input type="hidden" name="sell_user_id" value="${sessionScope.user.user_id}">
        				<a href="#" onclick="submitForm()" class="btn btn-default">삭제</a>
    			</form></td>
				</tr>
			</c:forEach>
			
		</tbody>			
		<tfoot>
			<tr><td colspan="3"  class="ts-text-center">
			<ul  class="pagination">
				<c:if  test="${paging.start>= paging.bottomlist}">      <!--  10(90) <<<< 이전 11(100)  -->
				 <li>
				 <a href="${pageContext.request.contextPath}/sell/sell_list.sell?sell_user_id=${sessionScope.user.user_id}&pstartno=${(paging.start-2)*paging.onepagelist}">이전</a>
				</li>
				</c:if>
				<c:forEach  begin="${paging.start}"  end="${paging.end}" var="i">     <!-- 1(0)  2(10)  20 -->
				  <li   <c:if  test="${paging.current== i}"> class="active" </c:if>  > 
				  <a href="${pageContext.request.contextPath}/sell/sell_list.sell?sell_user_id=${sessionScope.user.user_id}&pstartno=${(i-1)*paging.onepagelist}">${i}</a>
				  </li>
				</c:forEach>
				
				<c:if  test="${paging.pagetotal> paging.end}">      <!-- 10(90) 다음>>>> 11(100)  -->
				 <li>													<!-- 21 22 23 24 25 26       -->
				 <a href="${pageContext.request.contextPath}/sell/sell_list.sell?sell_user_id=${sessionScope.user.user_id}&pstartno=${(paging.end)*paging.onepagelist}">다음</a>
				</li>
				</c:if>
			</ul>
			</td></tr>
		</tfoot>
	</table>
				</div>
					</div>	
					</div>
					

<%@include file="../inc/footer.jsp" %> 