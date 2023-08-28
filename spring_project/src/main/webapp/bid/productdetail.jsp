<%@page import="com.spring.dto.user.UserDto"%>
<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 	<input type='hidden' id="product_code" value="${dto.product_code}" /> 
 	<% 
		String user_id = "";
 		UserDto udto = null;
 		if( (udto = (UserDto)session.getAttribute("user")) != null ) {
 			user_id = udto.getUser_id();
 		}
 		out.print("<input type=\"hidden\" id=\"user_id\" value='"+user_id+"' />");
 	%>

	<div class="container" style="margin-top:20px;">
	<div class="col">
		
		<div class="col-sm-6">
			<img alt="${dto.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${dto.image_target}"  class="img-responsive" style="width:440px; height: 440px; margin:auto;">
		</div>
		
		<div class="col-sm-6">
			<strong class="text-left" style="text-decoration: underline;">${dto.product_brand}</strong>
			<p class="text-left">${dto.product_name}</p>
			<p class="text-left" style="font-size: 10px; color:gray;">${dto.product_title}</p>
			
			<hr/>
			
			<div class="text-left" style="float:left; font-size:10px; color:gray;">사이즈</div>
			<div class="text-right" style="float:right;" id="sizesel" data-toggle="modal" data-target="#myModal">
			<strong id="nowsize">모든사이즈</strong><img src="${pageContext.request.contextPath}/inc/image/bid/down.png" alt="누르기" style="width: 20px; height:17px;"/>
			</div>
			
			<br/>
			<hr/>
			
			<div class="text-left" style="float:left; font-size:10px; color:gray;">최근거래가</div>
			<div class="text-right" style="float:right;"><strong id="recent_price"><fmt:formatNumber value="${transhistory[0].order_total_price}" pattern="#,###,###,###" /> 원</strong></div>
			
			<br/>
			<br/>
			
			<div class="col">
				<div class="col-sm-6">
					<button class="btn btn-info form-control buybtn"><span style="float:left;">구매</span><span style="float:right;" id="min_price"></span></button>
					
				</div>
				<c:choose>
				<c:when test="${!empty sessionScope.user.user_id}">
				<div class="col-sm-6">
	 				<a href="${pageContext.request.contextPath}/sell/sell_detail_list.sell?product_code=${dto.product_code}"><button class="btn btn-danger form-control"><span style="float:left;">판매</span><span style="float:right;"></span></button></a>
	 				
				</div>
				</c:when>
				
				<c:otherwise>
					<div class="col-sm-6">
	 				<a href="${pageContext.request.contextPath}/user/user_login_view.user"><button class="btn btn-danger form-control"><span style="float:left;">판매</span><span style="float:right;"></span></button></a>
				</div>
				</c:otherwise>
				</c:choose>
			</div> 
			
			<br/>
			<br/>
			
			<div class="col">
				<div class="col-sm-12">
					<button class="btn btn-default form-control" id="wishlist" ><img alt="wish" src="${pageContext.request.contextPath}/inc/image/bid/wishno.png" style="width: 20px; height:17px;" id="wishimg">관심상품 ${dto.wishcnt}</button>
				</div>
			</div>
			<br/>
			<br/>
			<br/>
			
			<h4>상품정보</h4>
			
			<hr/>
			
			<dl class="col">
				<div class="col-sm-4" style=" border-right : thin solid #e9ecef;">
					<dt>모델번호</dt>
					<dd>${dto.product_number}</dd>
				</div>
				<div class="col-sm-4" style=" border-right : thin solid #e9ecef;">
					<dt>출시일</dt>
					<dd>${dto.product_date}</dd>
				</div>
				<div class="col-sm-4">
					<dt>발매가</dt>
					<dd><fmt:formatNumber value="${dto.product_price}" pattern="#,###,###,###" /></dd>
				</div>
			</dl>
			<br/>
			<br/>
			<hr/>
			
			<h4>체결된 거래</h4>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">사이즈</th>
						<th class="text-right" scope="col">거래가</th>
						<th class="text-right" scope="col">거래일</th>
					</tr>
				</thead>
				<tbody class="transhistory">
					<c:forEach items="${transhistory}" var="trans">
						<tr>
							<td>${trans.size}</td>
							<td class="text-right"><fmt:formatNumber value="${trans.order_total_price}" pattern="#,###,###,###" /></td>
							<td class="text-right">${trans.order_date}</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
<!-- 			<h4 class='col' style="font-weight: bold;">시세<span style='float:right; font-size:15px; font-weight:lighter; color:gray;'>전체</span></h4> -->
			<h4 class='col' style="font-weight: bold;">
				시세<select id='chartSel' 
					style='float: right; font-size: 15px; font-weight: lighter; color: gray;'>
					<option value='null'>전체</option>
					<option value="1 WEEK">1주일</option>
					<option value="1 MONTH">1개월</option>
					<option value="3 MONTH">3개월</option>
					<option value="6 MONTH">6개월</option></select>
			</h4>
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  			<div id="chart_div"></div>
  			
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			<!--   차트차트차트차트차트차트차트차트차트차트차트차트    -->
			
		</div>
	</div>
	
	</div>
	
	<!--  사이즈 선택 모달  -->
	<div class="modal fade" id="myModal" role="dialog" >
    
    <div class="modal-dialog" style="width:350px;">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="text-center" id="sizeh4">사이즈</h4>
        </div>
        
        <div class="modal-body">
        	<div class="col">
        	
        	<c:forEach items="${sizeList}" var="sizes">
        		<div class="btn btn-default mysize" data-dismiss="modal" style="margin:4px; width:30%; height:43px;">
        			<p class="sizesize" style="font-size:12px; font-weight: bold; margin:0px 0px 0px;">${sizes.size}</p>
        			<p class="min_price" style="font-size:6px; color:red;">
	        			<c:choose>
	        				<c:when test="${sizes.min_price == 0}">-</c:when>
	        				<c:otherwise><fmt:formatNumber value="${sizes.min_price}" pattern="#,###,###,###" /></c:otherwise>
	        			</c:choose>
        			</p>
        			<input type="hidden" class="size_code" value="${sizes.size_code}"/>
        		</div>
        	</c:forEach>
        	
        	</div>
        	<br/>
        	<br/>
        </div>
        
      </div>
    </div>
  </div>
	
	
	<!--  관심상품 사이즈 모달 -->
	<div class="modal fade" id="myModal1" role="dialog" >
    
    <div class="modal-dialog" style="width:350px;">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="text-center">사이즈</h4>
        </div>
        
        <div class="modal-body">
        	<div class="col">
        	
        	<c:forEach items="${sizeList}" var="sizes">
        		<div class="btn btn-default mywish" data-dismiss="modal" style="margin:4px; width:30%; height:43px;">
        			<p class="wish_sizes" style="font-size:12px; font-weight: bold; margin:0px 0px 0px;">${sizes.size}</p>
        			<p style="font-size:6px; color:red;"><img src="${pageContext.request.contextPath}/inc/image/bid/wishno.png" alt="관심상품" style="width: 20px; height:17px;" class="wishimg"/></p>
        			<input type="hidden" class="wish_size_code" value="${sizes.size_code}" />
        		</div>
        	</c:forEach>
        	
        	</div>
        	<br/>
        	<br/>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  <!--  구매 사이즈 모달  -->
	<div class="modal fade" id="myModal2" role="dialog" >
    
    <div class="modal-dialog" style="width:350px;">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="text-center">구매</h4>
        </div>
        
        <div class="modal-body">
        	<div class="col">
        	
        	<c:forEach items="${sizeList}" var="sizes">
        		<div class="btn btn-default buysize" style="margin:4px; width:30%; height:43px;">
        			<p class="sizesize" style="font-size:12px; font-weight: bold; margin:0px 0px 0px;">${sizes.size}</p>
        			
        			<c:choose>
        				<c:when test="${sizes.min_price == 0}"><p class="min_price" style="font-size:6px; color:red;">구매입찰</p></c:when>
        				<c:otherwise><p class="min_price" style="font-size:6px; color:red;"><fmt:formatNumber value="${sizes.min_price}" pattern="#,###,###,###" /></p></c:otherwise>
        			</c:choose>
        			
        			<input type="hidden" class="size_code" value="${sizes.size_code}" />
        		</div>
        	</c:forEach>
        	
        	</div>
        	<br/>
        	<br/>
        	
        	<div id="buybtn">
        	</div>
        	
        </div>
        
      </div>
    </div>
  </div>
  
  <!--  form 태그  -->
	<form action="${pageContext.request.contextPath}/bid/product_buy.bid" method="POST" accept-charset="UTF-8">
		<input type="hidden" value="${dto.product_code}" id="productcodeform" name="product_code">
<%-- 		<input type="hidden" value="${dto.product_number}" id="productnumberform" name="product_number"> --%>
<%-- 		<input type="hidden" value="${dto.product_name}" id="productnameform" name="product_name"> --%>
<%-- 		<input type="hidden" value="${dto.product_title}" id="producttitleform" name="product_title"> --%>
		<input type="hidden" value="" id="sizecodeform" name="size_code">
<!-- 		<input type="hidden" value="" id="minpriceform" name="min_price"> -->
<!-- 		<input type="hidden" value="" id="recentpriceform" name="recent_price"> -->
<!-- 		<input type="hidden" value="" id="avgpriceform" name="avg_price"> -->
	</form>  
	
	<script>
	
	////////////////////////////////////////////  구매 모달   ///////////////////////////////////////////////////////
	$(".buysize").on("click", function() {
		
		thissize = $(this).find(".size_code").val();
		
		if($(this).find(".min_price").text() == '구매입찰') {
// 			$("#minpriceform").val('0');
			
			$("#buybtn").html($("<button>").attr({ "class" : "btn btn-info form-control" , "data-dismiss" : "modal" , "id" : "buybtnbtn"})
					.text($(this).find($(".min_price")).text())
					);
		} else {
// 			$("#minpriceform").val($(this).find(".min_price").text());
			
			$("#buybtn").html($("<button>").attr({ "class" : "btn btn-info form-control" , "data-dismiss" : "modal" , "id" : "buybtnbtn"})
					.text($(this).find($(".min_price")).text() + "원")
					);
		}
		
		$(".buysize").css({"border-width" : "thin" , "border-color" : "#ccc"});
		$(this).css({"border-width" : "initial" , "border-color" : "black"});
	})
	////////////////////////////////////////////////  구매 모달   ///////////////////////////////////////////////////////
	
	
	
	
	
	
	
	////////////////////////////////////////////////  구매 버튼 form  ///////////////////////////////////////////////////////
	$("#buybtn").on("click", function() {
// 		$("#productdtoform").val(thisproduct);
		$("#sizecodeform").val(thissize);
// 		console.log(thisproduct);
// 		console.log(thissize);

		$.ajax({
			url : "${pageContext.request.contextPath}/bid/product_detail_size.bid" ,
			type : "POST" ,
			dataType : "json" ,
			data : JSON.stringify({ product_code :  thisproduct , size_code : thissize }) ,
			contentType: 'application/json; charset=utf-8',
			error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); } ,
			success : function(json) {
				
				if($.isEmptyObject(json)) {
// 					$("#recentpriceform").val('0');
// 					$("#avgpriceform").val('0');
					$("form").submit();
				} else {
// 					$("#recentpriceform").val(json[0].order_total_price);
					
// 					var avgprice = [];
					
// 					$.each(json , function(index, value){
// 						avgprice.push(value.order_total_price);
// 					});
					
// 					$("#avgpriceform").val(parseInt(avgprice.reduce((acc,val) => acc + val, 0) / avgprice.length));
					
// 					console.log($("#recentpriceform").val());
// 					console.log($("#avgpriceform").val());
// 					console.log($("#minpriceform").val());
					
					$("form").submit();
				}
			}
		});
			
// 		console.log($("#productdtoform").val());
// 		console.log($("#sizecodeform").val());
// 		console.log($("#recentpriceform").val());
// 		console.log($("#avgpriceform").val());
		
// 		$("form").submit();
		
	})
	////////////////////////////////////////////////  구매 버튼 form  ///////////////////////////////////////////////////////
	
	
	
	
		var sizecodeArr = $(".wish_size_code").map(function() {
			return $(this).val();
		});
	
	var thisproduct = $("#product_code").val();	// product_code 선언
	var thisuser = $("#user_id").val();
	var thissize = '';
	
	
	
	
	
	/////////////////////////////////////////// 최저가 구하기
// 	console.log($(".min_price").text());
	var regex = /[^0-9]/g;
// 	const result = str.replace(regex, "");
	var price = $(".min_price").map(function(){
// 		console.log($(this).text().replaceAll(",",""));
		if(!isNaN($(this).text().replaceAll(",",""))) {
			return $(this).text().replaceAll(",","");
		}
	}).get();
// 	console.log(price);
	var minPrice = Math.min.apply(null,price);
	$("#min_price").text(minPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
	/////////////////////////////////////////// 최저가 구하기
	
	
	
	/////////////////////////////////////////// 사이즈 클릭시 화면 갱신
	$(".mysize").on("click",function(){
		$("#nowsize").text($(this).find(".sizesize").text());
		thissize = $(this).find(".size_code").val(); 				// 사이즈코드 선언
		$("#min_price").text($(this).find(".min_price").text() + "원"); 	// 구매버튼의 최저가 갱신
		$.ajax({
			url : "${pageContext.request.contextPath}/bid/product_detail_size.bid" ,
			type : "POST" ,
			dataType : "json" ,
			data : JSON.stringify({ product_code :  thisproduct , size_code : thissize }) ,
			contentType: 'application/json; charset=utf-8',
			error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); } ,
			success : function(json) {
				
				if ($.isEmptyObject(json)) {
					$("tbody").empty();
					$("#recent_price").text(" 최근거래없음 ");
					$("<tr>")
					.append($("<td>").html('-'))
					.append($("<td class=\"text-right\">").html('-'))
					.append($("<td class=\"text-right\">").html('-'))
					.appendTo("tbody");
				} else {
					$("tbody").empty(); //체결된 거래 테이블 비우기
					
					$("#recent_price").text(json[0].order_total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");//최근거래가
					
					$.each( json , function(idx, json){	//체결거래 5개
						$("<tr>")
						.append($("<td>").html(json.size))
						.append($("<td class=\"text-right\">").html(json.order_total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')))
						.append($("<td class=\"text-right\">").html(json.order_date))
						.appendTo("tbody");
					})
					
				}
			}
		});
		readChart();
	});
	/////////////////////////////////////////// 사이즈 클릭시 화면 갱신
	
	
	
	
	/////////////////////////////////////////// 관심상품 클릭시 이벤트들
	$(".mywish").on("click", function() {
		var thissize = $(this).find(".wish_size_code").val();
		wishcreate(thissize);
		wishchk();
		location.reload();
	});
	/////////////////////////////////////////// 관심상품 클릭시 이벤트들
	
//////////////////////////////////////관심상품 이미지 갱신///////////////////////////////////////////////////////////////////////
	var wishchk = function() {	// 관심상품 이미지
		console.log('실행?');
		$.ajax({
			url : "${pageContext.request.contextPath}/bid/wishsizechk.bid" ,
			type : "POST" ,
			dataType : "json" ,
			data : JSON.stringify({ user_id :  thisuser , product_code : thisproduct }) ,
			contentType: 'application/json; charset=utf-8',
			success : function(result) {
				var resultArr = [];
				$.each(result, function(index, value){
					resultArr.push(value);
				});
				var temp = 0;
				$(".wish_size_code").each(function(index, value) {
					if(resultArr.includes(Number($(this).val()))) {
						$(this).closest(".mywish").find(".wishimg").attr("src","${pageContext.request.contextPath}/inc/image/bid/wishyes.png");
						temp = 1;
					} else {
						$(this).closest(".mywish").find(".wishimg").attr("src","${pageContext.request.contextPath}/inc/image/bid/wishno.png");
					}
				});
				
				if(temp == 1) {
					$("#wishimg").attr("src","${pageContext.request.contextPath}/inc/image/bid/wishyes.png");
				} else {
					$("#wishimg").attr("src","${pageContext.request.contextPath}/inc/image/bid/wishno.png");
				}
				
			},
			error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); }
		});
	}
	/////////////////////////////////////////// 관심상품 이미지 갱신////////////////////////////////////////////////////////////////////////////////////
	

	
	
	
	/////////////////////////////////////////// 관심상품 담기
	var wishcreate = function(thissize) {
		$.ajax({
			url : "${pageContext.request.contextPath}/bid/wishcreate.bid" ,
			type : "POST" ,
			data : JSON.stringify({ user_id :  thisuser , product_code : thisproduct , size_code : thissize }) ,
			contentType: 'application/json; charset=utf-8',
			success : function() {
// 				console.log("성공");
			} ,
			error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); }
		})
	};
	/////////////////////////////////////////// 관심상품 담기
	
	
	
	$("#wishlist").on("click",function() {
		if(thisuser == '') {
			if (confirm('로그인이 필요한 서비스입니다. \n지금 이동하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/user/user_login_view.user';
			}
		} else {
			$(this).attr({ "data-toggle" : "modal" , "data-target" : "#myModal1" });
		}
	})
	
	$(".buybtn").on("click", function() {
		if(thisuser == '') {
			if (confirm('로그인이 필요한 서비스입니다. \n지금 이동하시겠습니까?')) {
				location.href='${pageContext.request.contextPath}/user/user_login_view.user';
			}
		} else {
			$(this).attr({ "data-toggle" : "modal" , "data-target" : "#myModal2" });
		}
	})
	
	$(function() {
		if( ${not empty result} ) {
			alert("${result}");
		}
	})
	
	wishchk();
	</script>
	
	<script>

	var readChart = function(thisDate) {
		console.log(thisproduct);
		console.log(thissize);
		$.ajax({
			url : "${pageContext.request.contextPath}/bid/read_chart.bid" ,
			type : "POST" ,
			data : JSON.stringify({ product_code : thisproduct , size_code : thissize , dateUnit :  thisDate }) ,
			contentType : 'application/json; charset=utf-8',
			dataType : "json" ,
			success : function(result) {
				
				var chartArr = [];
				
				$.each(result, function(index, dto) {
// 					var data = ;
					chartArr.push([dto.date, dto.avgprice]);
				})
				
// 				$("#chart_div").empty();
				
				google.charts.load('current', {packages: ['corechart', 'line']});
				google.charts.setOnLoadCallback(drawCurveTypes);

				function drawCurveTypes() {
				      var data = new google.visualization.DataTable();
				      data.addColumn('string', '날짜');
				      data.addColumn('number', '평균거래가');

				      data.addRows(chartArr);
				      
				      var options = {
						chartArea: {width: '100%',height : '100%'},
						legend: { position: 'none' },
						hAxis: {textPosition: 'none'}, vAxis: {textPosition: 'in'}
				      };

				      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
				      chart.draw(data, options);
				    }
			} ,
			error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); }
		})
	}
	

	$("#chartSel").on("change" , function() {
		if($("#chartSel").val() == 'null') {
			readChart();
		} else {
			readChart($("#chartSel").val());
		}
	})
	
	readChart();
	</script>
	
<%@ include file="/inc/footer.jsp" %>