<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
		<div class="taesol_noticeboard" id="minho_main" style="padding-right: 315px;
    padding-left: 315px;">
		
			<h3  style="border-bottom: 2px solid;">공지사항</h3>
			<div style="margin-right: 10px;">
			<p style="display: inline-flex;
    				font-size: 12px;
    				letter-spacing: -.06px;
    				margin-bottom: 1px;">
			${noticeboard.noticeboard_creation_date}
			</p>
			<p style="font-size: 15px;
    				letter-spacing: -.15px;">
			${noticeboard.noticeboard_title}
			</p>
		
			<textarea rows="35" cols="112" style="background-color: #fafafa;
    			border-bottom: 1px px solid #ebebeb;
    			display: none;
   				font-size: 14px;
    			letter-spacing: -.21px;
    			padding: 30px 30px 28px;
    			display: block;">
				${noticeboard.noticeboard_content}
			</textarea>
			</div>
			<div style="margin-top: 30px;
    			text-align: center;">
			<a href="${pageContext.request.contextPath}/noticeboard/noticeboard_user.noticeboard" title="공지사항"  class="btn btn-default">목록보기</a>
			</div>
			
	</div>

<%@include file="../inc/footer.jsp" %> 