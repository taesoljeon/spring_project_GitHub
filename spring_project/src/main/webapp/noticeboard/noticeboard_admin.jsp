<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
		
		<div class="taesol_noticeboard" id="minho_main">
	<div class="row container-fluid login" >
						<%@include file="/inc/admin_page.jsp" %>
						<div class="col-sm-9 right" >
			<div class="noticeboard-Part1">
			<h3  style="border-bottom: 2px solid;">공지사항</h3>
			<table class="table table-striped noticeboardTable">
			<colgroup>
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:55%">
			<col style="width:15%">
			<col style="width:10%">
			<col style="width:10%">

		</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">코드</th>
						<th scope="col" style="text-align: center;">제목</th>
						<th scope="col">등록일자</th>
						<th scope="col">작성자</th>
						<th scope="col">조회</th>
						
					</tr>
				</thead>
			<tbody>
			
			</tbody>
			<tfoot>
			
			</tfoot>
			</table>
			</div> <!-- end noticeboard-Part1 -->
			<h3 class="noticeboard-iud" style="border-bottom: 2px solid;">공지사항 작성</h3>
			<form action="${pageContext.request.contextPath}/" method="GET" id="noticeboardInsertForm" >
			<div class="form-group">
				<label for="noticeboard_title">제목</label>
				<input type="text" id="noticeboard_title" name="noticeboard_title" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="noticeboard_content">공지내용</label>
				<textarea rows="20" cols="60" name="noticeboard_content" id="noticeboard_content" 
				class="form-control" style="overflow: auto;">
				</textarea>
			</div>
			<div class="form-group">
				<input type="hidden" name="noticeboard_code_hidden" id="noticeboard_code_hidden" value="${noticeboard.noticeboard_code}" >
				<input type="hidden" name="noticeboard_user_id" id="noticeboard_user_id" value="${sessionScope.user.user_id}" >
			<div class="notice_insert">
				<input type="button" value="작성" class="btn btn-info" title="공지사항 작성" id="noticeboardInsert">
			</div>
			<div class="notice_update_delete">
			
			</div>
			</div>
			</form>
	</div>

	</div>
	</div> <!-- end taesol_noticeboard -->
	
	
	
	<script>
	$(document).ready(function(){
        var pageSet = 0; // 초기 페이지 번호 설정
        noticeboardList(pageSet);
        
     // 페이지 번호 클릭 시 이벤트 처리
        $(".pagination").on("click", "button", function(e) {
            e.preventDefault(); 
            var pageSet = parseInt($(this).text()); // 클릭한 페이지 번호 가져오기
            noticeboardList(pageSet); // 해당 페이지 데이터 로딩
        });
		
        $(document).on("click", "#noticeboard_main", function() {
            window.location.href = "/spring_project/noticeboard/noticeboard.noticeboard";
            //$("#noticeboardInsertForm").each(function(){ this.reset(); });
        	//$(".noticeboard-Part1").show();
        }); // 목록보기
       
        // 수정하기 시작
        $(document).on("click", "#noticeboardUpdate", function() {
        	
        	var noticeboard_title = $("#noticeboard_title").val();
			var noticeboard_content = $("#noticeboard_content").val();
			var noticeboard_user_id = $("#noticeboard_user_id").val();
			var noticeboard_code = $("#noticeboard_code_hidden").val();
			
			if ( noticeboard_title == ""){ alert("빈칸입니다.\n제목을 작성해주세요."); $("#noticeboard_title").focus(); return false; }
			if ( noticeboard_content == ""){ alert("빈칸입니다.\n내용을 작성해주세요."); $("#noticeboard_content").focus(); return false; }
			if ( noticeboard_user_id == "" || noticeboard_user_id == null){
			alert("세션이 만료되었습니다\n로그인 페이지로 이동합니다.");
			window.location.href = "/spring_project/user/user_login_view.user"; return false;}
			$.ajax({
				url: "/spring_project/noticeboard/noticeboard_update.noticeboard",
				type: "POST",
				dataType: "json",
				data: JSON.stringify({noticeboard_title: noticeboard_title, noticeboard_content: noticeboard_content, noticeboard_user_id: noticeboard_user_id, noticeboard_code: noticeboard_code}),
				contentType: "application/json;charset=UTF-8",
				error: function(xhr, status, msg) { alert(status + "/" + msg); },
				success: function(json) { if(json.result == true ){
					
					var pageSet = 0; noticeboardList(pageSet);
					//$("#noticeboard_title").val("");
					//$("#noticeboard_content").val("");
					$("#noticeboardInsertForm").each(function(){ this.reset(); });
					$(".notice_insert").show();
					$(".notice_update_delete").empty();
					$(".noticeboard-iud").text("공지사항 작성");
					$(".noticeboard-Part1").show(); alert("수정이 완료되었습니다.");}  }
					
			});
        	
        });// 수정하기 끝
        
     // 삭제하기 시작
        $(document).on("click", "#noticeboardDelete", function() {
        	var noticeboard_title = $("#noticeboard_title").val();
        	var noticeboard_user_id = $("#noticeboard_user_id").val();
			var noticeboard_code = $("#noticeboard_code_hidden").val();
			
        	
			if ( noticeboard_user_id == "" || noticeboard_user_id == null){
				alert("세션이 만료되었습니다\n로그인 페이지로 이동합니다.");
				window.location.href = "/spring_project/user/user_login_view.user"; return false;}
				
			if(confirm(noticeboard_title + "\n해당 게시글을 삭제하시겠습니까?") ){
				$.ajax({
					url: "/spring_project/noticeboard/noticeboard_delete.noticeboard",
					type: "DELETE",
					dataType: "json",
					data: JSON.stringify({noticeboard_user_id: noticeboard_user_id, noticeboard_code: noticeboard_code}),
					contentType: "application/json;charset=UTF-8",
					error: function(xhr, status, msg) { alert(status + "/" + msg); },
					success: function(json) {
						var pageSet = 0; noticeboardList(pageSet);
						$("#noticeboardInsertForm").each(function(){ this.reset(); });
						$(".notice_insert").show();
						$(".notice_update_delete").empty();
						$(".noticeboard-iud").text("공지사항 작성");
						$(".noticeboard-Part1").show(); alert("삭제가 완료되었습니다.");}  
				});
			}// end confirm(if)
        });// 삭제하기 끝
	 });
	
	function noticeboardList(pageSet) {
			
		$.ajax({
			url: "/spring_project/noticeboard/noticeboard_list.noticeboard?pstartno=" + (pageSet), // 페이지 번호를 직접 변수로 사용
	        type: "GET",
	        dataType: "json",
	        contentType: "application/json;charset=UTF-8",
	        error: function (xhr, status, msg) {
	            alert(status + "/" + msg);
	        },
	        success: function (json) {
	            $(".noticeboardTable tbody").empty();
	            var total = json.data.length;
	            $.each(json.data, function (idx, noticeboard) {
	            	var creationDate = new Date(noticeboard.noticeboard_creation_date);

	                var formattedDate = creationDate.getFullYear() + "년" +
	                                    (creationDate.getMonth() + 1) + "월" +
	                                    creationDate.getDate() + "일";
	            	
	                $("<tr>")
	                    .append($("<td>").html(total - idx))
	                    .append($("<td>").html(noticeboard.noticeboard_code))
	                    .append($("<td style='text-align: center;'>").html(noticeboard.noticeboard_title))
	                    .append($("<td>").html(formattedDate))
	                    .append($("<td>").html(noticeboard.noticeboard_user_id))
	                    .append($("<td>").html("<input type='button' class='noticeboardRead' value='조회' />"))
	                    .append( $("<input type='hidden' class='noticeboard_code' name='noticeboard_code' />").val(noticeboard.noticeboard_code))
	                    .appendTo(".noticeboardTable tbody");
	            });
	            
	            function generatePagination(paging) {
	    		    var paginationHtml = '<tr><td colspan="8" class="text-center"><ul class="pagination">';
	    		    /* var url = '${pageContext.request.contextPath}/noticeboard/noticeboard.noticeboard?pstartno='; */

	    		    if (paging.start >= paging.bottomlist) {
	    		        paginationHtml += '<li><button class="button">' + (paging.start-2)*paging.onepagelist + '</button></li>';
	    		    }

	    		    for (var i = paging.start; i <= paging.end; i++) {
	    		        var activeClass = (paging.current == i) ? 'class="active"' : '';
	    		        paginationHtml += '<li ' + activeClass + '><button class="button" onclick="noticeboardList(' + (i-1)*paging.onepagelist + ')">' + i + '</button></li>';
	    		    }

	    		    if (paging.pagetotal > paging.end) {
	    		        paginationHtml += '<li><button class="button">' + (paging.end)*paging.onepagelist + '</button></li>';
	    		    }

	    		    paginationHtml += '</ul></td></tr>';
	    		    return paginationHtml;
	    		} // end generatePagination
	            
	            var paging = json.paging; 
	            var paginationHtml = generatePagination(paging);
	     		
	            $(".noticeboardTable tfoot").empty();
	            $(".noticeboardTable tfoot").append(paginationHtml); 
	            
	            
	        } // end noticeboardList success
	        
	    }); // end noticeboardList ajax
	
	}// end noticeboardList
	
	//function noticeboardInsert() {
		$("#noticeboardInsert").on("click", function(){
			var noticeboard_title = $("#noticeboard_title").val();
			var noticeboard_content = $("#noticeboard_content").val();
			var noticeboard_user_id = $("#noticeboard_user_id").val();
			
			if ( noticeboard_title == ""){ alert("빈칸입니다.\n제목을 작성해주세요."); $("#noticeboard_title").focus(); return false; }
			if ( noticeboard_content == ""){ alert("빈칸입니다.\n내용을 작성해주세요."); $("#noticeboard_content").focus(); return false; }
			if ( noticeboard_user_id == "" || noticeboard_user_id == null){
			alert("세션이 만료되었습니다\n로그인 페이지로 이동합니다.");
			window.location.href = "/spring_project/user/user_login_view.user"; return false;}
			if(confirm("게시글을 작성하시겠습니까?") ){
			$.ajax({
				url: "/spring_project/noticeboard/noticeboard_insert.noticeboard",
				type: "POST",
				dataType: "json",
				data: JSON.stringify({noticeboard_title: noticeboard_title, noticeboard_content: noticeboard_content, noticeboard_user_id: noticeboard_user_id}),
				contentType: "application/json;charset=UTF-8",
				error: function(xhr, status, msg) { alert(status + "/" + msg); },
				success: function(json) { if(json.result == true ){
					var pageSet = 0;
					noticeboardList(pageSet);} alert("작성이 완료되었습니다."); }
				
			}); // end noticeboardInsert ajax
			$("#noticeboardInsertForm").each(function(){ this.reset(); });
			} // end confirm(if)
		}); // end $(#noticeboardInsert)
	//} // end noticeboardInsert
	
		$("body").on("click", ".noticeboardRead", function(){
			var noticeboard_code = $(this).closest('tr').find('.noticeboard_code').val();
			$.ajax({
				url: "/spring_project/noticeboard/noticeboard_read.noticeboard/" + noticeboard_code,
				type: "GET",
				dataType: "json",
				contentType: "application/json;charset=UTF-8",
				error : function(xhr, status, msg) { alert( status + "/" + msg); },
				success : noticeboardReadResult
			});
		});
	
	function noticeboardReadResult(json){
		
		$(".noticeboard-Part1").hide();
		$(".notice_insert").hide();
		$(".notice_update_delete").empty();
		$("#noticeboard_title").val(json.data.noticeboard_title);
		$("#noticeboard_content").val(json.data.noticeboard_content);
		$("#noticeboard_code_hidden").val(json.data.noticeboard_code);
		$(".noticeboard-iud").text("공지사항 수정/삭제");
		$(".notice_update_delete")
				.append( $("<input type='button' value='수정' class='btn btn-info' title='공지사항 수정' id='noticeboardUpdate'>") )
				.append( $("<input type='button' value='삭제' class='btn btn-danger' title='공지사항 삭제' id='noticeboardDelete'>") )
				.append( $("<input type='button' value='목록보기' class='btn btn-default' title='공지사항 목록' id='noticeboard_main'>") );
	}
	

</script>

<%@include file="../inc/footer.jsp" %> 