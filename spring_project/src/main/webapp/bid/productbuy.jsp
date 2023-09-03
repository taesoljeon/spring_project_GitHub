<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/inc/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		
		<form action="${pageContext.request.contextPath}/bid/Payment.bid" method="POST" id="formform">
			<input type="hidden" name="detail_code" value="${detail_code}">
			<input type="hidden" name="price" value="" id="price">
			<input type="hidden" name="user_id" value="${user.user_id}" id="user_id">
			<input type="hidden" name="product_name" value="${dto.product_name}">
			<input type="hidden" name="success_url" value="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/bid/bidNow.bid" id="success_url">
			<input type="hidden" name="product_code" value="${dto.product_code}">
		</form>
		
		
		
		
		<h3 class="text-center">즉시 구매하기</h3>
	<section class="container" style="width:666px; background-color: #f9f9f9; margin-bottom:5px; padding:25px;">
	
		<div class="col" style="height:40px;">
			<div class="col-sm-3">
				<img alt="${dto.image_title}" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${dto.image_target}" class="img-responsive" style="width:90px; height: 90px; margin:auto;">
			</div>
			<div class="col-sm-9">
				<strong class="text-left">${dto.product_number}</strong>
				<p class="text-left">${dto.product_name}</p>
				<p class="text-left" style="font-size: 10px; color:gray; line-height: 1px;">${dto.product_title}</p>
				<strong style="line-height:1px;">${sizeList.size}</strong>
			</div>
		</div>
		
	</section>
	<section class="container" id="section2" style="width:666px; background-color: #f9f9f9; padding:25px;">
		<div class="col" style="margin:5px; padding:5px;">
			<div class="col-sm-6 text-center">
				<p>최근 거래가</p>
				<strong>
					<c:choose>
						<c:when test="${empty recentprice}">최근 거래없음</c:when>
						<c:otherwise><fmt:formatNumber value="${recentprice}" pattern="#,###,###,###" />원</c:otherwise>
					</c:choose>
				</strong>
			</div>
			
			<div class="col-sm-6 text-center">
				<p>평균 거래가</p>
				<strong>
					<c:choose>
						<c:when test="${empty avgprice}">최근 거래없음</c:when>
						<c:otherwise><fmt:formatNumber value="${avgprice}" pattern="#,###,###,###" />원</c:otherwise>
					</c:choose>
				</strong>
			</div>
		</div>
		
		<br>
		<br>
		<hr>
		
		<div class="col" style="margin:5px; padding:5px;">
			<div class="col-sm-6">
			<button id="buybid" class="btn btn-default form-control">구매 입찰</button>
			</div>
			<div class="col-sm-6">
			<button id="buynow" class="btn btn-danger form-control">즉시 구매</button>
			</div>
		</div>
		
		<br>
		<br>
		<br>

		<div id="what" style="margin:5px; padding:5px;">
<!-- 			<strong id="strong1">즉시 구매가</strong> -->
<!-- 			<p class="text-right"><span></span> <strong style="font-size:20px;"> 원</strong></p> -->
<!-- 		<form action="" method=""> -->
<!-- 			<fieldset> -->
				<label for="myprice">즉시 구매가</label><br>
				<strong style="font-size:20px; float:right;">원</strong><input type="text" maxlength="10" onkeyup="inputNumberFormat(this);" value="<fmt:formatNumber value="${sizeList.min_price}" pattern="#,###,###,###" />" class="text-right inputnum" id="myprice" style="width:80%;font-size:17px; outline: none; border:none; background-color: #f9f9f9; float:right;" readonly>
<!-- 			</fieldset> -->
<!-- 		</form> -->
			<hr>
		
		</div>
		<button class="btn form-control" id="nextbtn" style="background-color: black; color:white; height:40px;">즉시 구매 계속</button>
		<br>
		<br>
		<br>
		</section>
		
		
		
		
		
		
				<div class="modal fade" id="myModal" role="dialog" >
    
    <div class="modal-dialog" style="width:350px;">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="text-center" id="sizeh4">사이즈</h4>
        </div>
        
        <div class="modal-body">
        
			<form
				action="${pageContext.request.contextPath}/bid/user_address_change_action.bid"
				method="post" id="form">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">우편번호 변경</h3>
					<div class="form-group fgCh">
						<input type="text" id="postcode" name="postcode" class="fcp"
							placeholder="우편번호"> <input type="button"
							onclick="execDaumPostcode()" class="bcpCh" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address"
							class="form-control fcp2" placeholder="주소"> <input
							type="text" id="extraAddress" name="extraAddress"
							class="form-control fcp2" placeholder="참고항목"> <input
							type="text" id="detailAddress" name="detailAddress"
							class="form-control fcp2" placeholder="상세주소">
					</div>
					<div class="form-group fgChBt">
						<input type="button" class="btn-block bb" id="addsubmit" value="변경하기" />
					</div>
				</div>
			</form>
        
        </div>
        
      </div>
    </div>
  </div>
		
		
		
		
		
		
				<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script>
		
		var minprice = $("#myprice").val(); // 최저가 저장
		
		$(function() {							// 즉시구매 버튼 비활성화
			if($("#myprice").val() == '0') {
				$("#buybid").trigger("click");
				$("#buynow").attr("disabled","disabled");
			}
		});
		
		
		///////////////////////////////////////////구매입찰 / 즉시구매 버튼///////////////////////////////////
		var nextbtnattr = "now";
			$("#buybid").on("click", function() {
				$(this).attr("class" , "btn btn-danger form-control");			//버튼 색깔
				$("#buynow").attr("class" , "btn btn-default form-control");	//버튼 색깔
				
				$("h3").text("구매 입찰하기");
				
				$("#string1").text("구매 희망가");
				$("#what").find("p").find("span").text("희망가 입력");
				$("#nextbtn").text("구매 입찰 계속");
				$("#nextbtn").attr("disabled" , "disabled");
				$("#nextbtn").css("background-color" , "gray");
				
				$("#myprice").attr("placeholder" , "희망가 입력");
				$("#myprice").val("");
				$("#myprice").removeAttr("readonly");
				
				nextbtnattr = 'bid';
				console.log(nextbtnattr);
			})
			$("#buynow").on("click", function() {
				$(this).attr("class" , "btn btn-danger form-control");			//버튼 색깔
				$("#buybid").attr("class" , "btn btn-default form-control");	//버튼 색깔
				
				$("h3").text("즉시 구매하기");
				
				$("#string1").text("즉시 구매가");
				$("#what").find("p").find("span").text("얼마?");
				$("#nextbtn").text("즉시 구매 계속");
				$("#nextbtn").removeAttr("disabled");
				$("#nextbtn").css("background-color" , "black");
				
				$("#myprice").attr("readonly" , "readonly");
				$("#myprice").val(minprice);
				
				nextbtnattr = 'now';
				console.log(nextbtnattr);
			})
			
			$("#myprice").on("input", function() {
				if($(this).val() == '') {
					$("#nextbtn").attr("disabled","disabled");
					$("#nextbtn").css("background-color" , "gray");
				} else {
					$("#nextbtn").removeAttr("disabled");
					$("#nextbtn").css("background-color" , "black");
				}
			})
		///////////////////////////////////////////구매입찰 / 즉시구매 버튼///////////////////////////////////
		
		
		
		
		
		
		///////////////////////////////////////////구매 계속버튼///////////////////////////////////
		var myprice = '';
		var userAddress = '';
		var section2 = function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/bid/product_buy.bid",
				type : "GET" ,
				dataType:"text",
				success : function(text) {
					$("#section2").html(text);
					userAddress = $("#user_address").text();
					$("#totalprice").text(myprice);
				} ,
				error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); } 
			});
		};
		
			$("#nextbtn").on("click",function() {
				myprice = $("#myprice").val();
				section2();
			})
			
		///////////////////////////////////////////구매 계속버튼///////////////////////////////////
			
			
		
			///////////////////////////////////////////주소 API///////////////////////////////////
			function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

			
			
	// 빈칸 체크 및 중복 체크
		$("#addsubmit").on("click", function() {
			if ($("#detailAddress").val() == "" || $("#extraAddress").val() == "" || $("#address").val() == "" || $("#postcode").val() == "") {
				alert("주소를 입력해주세요.");
				$("#postcode").focus();
				return false;
			}
			if ($("#postcode").val() + " " + $("#address").val() + $("#extraAddress").val() + " " + $("#detailAddress").val() == $("#user_address").val()) {
				alert("기존 주소와 동일합니다.\n다시 입력해주세요.");
				$("#postcode").focus();
				return false;				
			}
			
			var address = $("#postcode").val() + " " + $("#address").val() + $("#extraAddress").val() + " " + $("#detailAddress").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/bid/user_address_change_action.bid",
				type : "POST" ,
				dataType : "text" ,
				data : address ,
				contentType: "text/plain;charset=UTF-8",
				success : function(result) {
					alert(result);
					section2();
					$('#myModal').modal('hide');
				} ,
				error : function(xhr, textStatus, errorThrown) { console.log( textStatus + "(http-" + xhr.status + "/" + errorThrown); } 
			});
			
		});
		///////////////////////////////////////////주소 API///////////////////////////////////
			
		
		$("#section2").on("click", "#nextbtn2" , function() {
			$("#price").val(myprice.replaceAll(",",""));
			if( nextbtnattr == 'bid' ) {
				$("#success_url").val('http://3.34.141.136:8080/spring_project/bid/bidCreate.bid');
			} else {
				$("#success_url").val('http://3.34.141.136:8080/spring_project/bid/bidNow.bid');
			}
			console.log('${detail_code}');
			console.log($("#price").val());
			console.log('${user.user_id}');
			console.log('${dto.product_name}');
			console.log($("#success_url").val());
			$("#formform").submit();
		})
			
		
		
		
		function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }
	
	    function uncomma(str) {
	        str = String(str);
	        return str.replace(/[^\d]+/g, '');
	    } 
	    
	    function inputNumberFormat(obj) {
	        obj.value = comma(uncomma(obj.value));
	    }
	    
	    function inputOnlyNumberFormat(obj) {
	        obj.value = onlynumber(uncomma(obj.value));
	    }
	    
	    function onlynumber(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
		}
		
		
		</script>
		
	

<%@ include file="/inc/footer.jsp" %>