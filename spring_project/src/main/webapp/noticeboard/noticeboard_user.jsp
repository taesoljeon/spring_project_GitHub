<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
		<div class="taesol_noticeboard" id="minho_main" style="padding-right: 50px;
    padding-left: 50px;">
	
			<h3  style="border-bottom: 2px solid;">공지사항</h3>
			<div>
			
			<c:forEach var="dto"  items="${list}"  varStatus="status">
			<div id="noticeboard_user_list">
    				<p><a href="${pageContext.request.contextPath}/noticeboard/noticeboard_user_read.noticeboard?noticeboard_code=${dto.noticeboard_code}" title="공지상세보기">
    ${dto.noticeboard_title}</a></p>
			</div>
			</c:forEach>
			
			</div>
			
			
			<div class="text-center">
			<ul  class="pagination">
				<c:if  test="${paging.start>= paging.bottomlist}">      <!--  10(90) <<<< 이전 11(100)  -->
				 <li>
				 <a href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard?pstartno=${(paging.start-2)*paging.onepagelist}">이전</a>
				</li>
				</c:if>
				<c:forEach  begin="${paging.start}"  end="${paging.end}" var="i">     <!-- 1(0)  2(10)  20 -->
				  <li   <c:if  test="${paging.current== i}"> class="active" </c:if>  > 
				  <a href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard?pstartno=${ (i-1)*paging.onepagelist}">${i}</a>
				  </li>
				</c:forEach>
				
				<c:if  test="${paging.pagetotal> paging.end}">      <!-- 10(90) 다음>>>> 11(100)  -->
				 <li>													<!-- 21 22 23 24 25 26       -->
				 <a href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard?pstartno=${(paging.end)*paging.onepagelist}">다음</a>
				</li>
				</c:if>
			</ul>
			</div> <!-- end paging text-center -->
			
	</div>

	

<%@include file="../inc/footer.jsp" %> 