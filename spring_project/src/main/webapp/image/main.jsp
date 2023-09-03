<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/main.css">
<%@include file="../inc/header.jsp" %> 

 <script>
		$(function(){
			$(".toggle_box0").hide();
			$(".toggle_control0").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box0").toggle();
			});
		});
		$(function(){
			$(".toggle_box1").hide();
			$(".toggle_control1").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box1").toggle();
			});
		});
		$(function(){
			$(".toggle_box2").hide();
			$(".toggle_control2").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box2").toggle();
			});
		});
		$(function(){
			$(".toggle_box3").hide();
			$(".toggle_control3").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box3").toggle();
			});
		});
		$(function(){
			$(".toggle_box4").hide();
			$(".toggle_control4").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box4").toggle();
			});
		});
		$(function() {
		    $(".search-button").click(function(event) {
		        var searchValue = $("#search-input").val().trim();
		        if (searchValue === "") {
		            event.preventDefault(); // 폼 제출 막기
		            alert("검색어를 입력해주세요.");
		        }
		    });
		});
		//1번방법 0- 각각의 경우에 따라 if 문을 다 만들어준다 그러면 if 문을 여러개 만들어야 되서 코드를 불필요하게 길게 해야한다.
		//2번방법 var 체크1 = 이런식으로 체크를 하면 카운트가 올라가게 해서 카운트가 2라면 alert 필터는 하나만 선택하세요 띄우기
		//3번방법 List로 넘겨서 매퍼에서 sql로 처리
		$(function() {
    function handleFilterClick() {
        if ($("#orderBy_high").prop("checked") && $("#orderBy_low").prop("checked")) {
            if ($(this).attr("id") === "orderBy_high") {
                $("#orderBy_low").prop("checked", false);
            } else {
                $("#orderBy_high").prop("checked", false);
            }
            alert("필터는 하나만 선택할 수 있습니다.");
        } else if ($("#orderBy_high").prop("checked") && $("#orderBy_date").prop("checked")) {
            if ($(this).attr("id") === "orderBy_high") {
                $("#orderBy_date").prop("checked", false);
            } else {
                $("#orderBy_high").prop("checked", false);
            }
            alert("필터는 하나만 선택할 수 있습니다.");
        } else if ($("#orderBy_low").prop("checked") && $("#orderBy_date").prop("checked")) {
            if ($(this).attr("id") === "orderBy_low") {
                $("#orderBy_date").prop("checked", false);
            } else {
                $("#orderBy_low").prop("checked", false);
            }
            alert("필터는 하나만 선택할 수 있습니다.");
        }
    }
    $("#orderBy_high, #orderBy_low, #orderBy_date").off("click", handleFilterClick).on("click", handleFilterClick);
});

		</script>

<div id="main"  class="container">
	<div class="text-center myr1">
		<div class="search-bar">
		<form action="${pageContext.request.contextPath}/image/main_search.image" method="POST">
			<input type="text" id="search-input" name="search" placeholder="검색어를 입력하세요">
			<input type="submit" class="search-button" value="검색">
			</form>
		</div>
	</div>	
	<div class="row">
		<div class="col-sm-2">
			<div class="mygallery">
			<form action="${pageContext.request.contextPath}/image/main_category.image" method="POST">
			 <div class="search-filter">
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >신발카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control1 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box1">
						<label for="category-shoes0">
							<input type="checkbox" name="categoryCode" id="category-shoes0" value="100">신발
						</label>
					</div>
					<div class="toggle_box1">
						<label for="category-shoes1">
							<input type="checkbox" name="categoryCode" id="category-shoes1" value="101">스니커즈
						</label>
					</div>
					<div class="toggle_box1">
						<label for="category-shoes2">
							<input type="checkbox" name="categoryCode" id="category-shoes2" value="102">샌들
						</label>
					</div>
					<div class="toggle_box1">
						<label for="category-shoes3">
							<input type="checkbox" name="categoryCode" id="category-shoes3" value="103">구두
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				
				
				
				<!-- part2 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >상의카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control2 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box2">
						<label for="category-top0">
							<input type="checkbox" name="categoryCode" id="category-top0" value="200">상의
						</label>
					</div>
					<div class="toggle_box2">
						<label for="category-top1">
							<input type="checkbox" name="categoryCode" id="category-top1" value="201">반팔 티셔츠
						</label>
					</div>
					<div class="toggle_box2">
						<label for="category-top2">
							<input type="checkbox" name="categoryCode" id="category-top2" value="202">긴팔 티셔츠
						</label>
					</div>
					<div class="toggle_box2">
						<label for="category-top3">
							<input type="checkbox" name="categoryCode" id="category-top3" value="203">후드
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part2 -->
				
				
				<!-- part3 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >하의카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control3 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box3">
						<label for="category-bottoms0">
							<input type="checkbox" name="categoryCode" id="category-bottoms0" value="300">하의
						</label>
					</div>
					<div class="toggle_box3">
						<label for="category-bottoms1">
							<input type="checkbox" name="categoryCode" id="category-bottoms1" value="301">반바지
						</label>
					</div>
					<div class="toggle_box3">
						<label for="category-bottoms2">
							<input type="checkbox" name="categoryCode" id="category-bottoms2" value="302">청바지
						</label>
					</div>
					<div class="toggle_box3">
						<label for="category-bottoms3">
							<input type="checkbox" name="categoryCode" id="category-bottoms3" value="303">스커트
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part3 -->
				
				
				
				<!-- part4 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >지갑카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control4 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box4">
						<label for="category-wallet0">
							<input type="checkbox" name="categoryCode" id="category-wallet0" value="400">지갑
						</label>
					</div>
					<div class="toggle_box4">
						<label for="category-wallet1">
							<input type="checkbox" name="categoryCode" id="category-wallet1" value="401">반지갑
						</label>
					</div>
					<div class="toggle_box4">
						<label for="category-wallet2">
							<input type="checkbox" name="categoryCode" id="category-wallet2" value="402">카드지갑
						</label>
					</div>
					<div class="toggle_box4">
						<label for="category-wallet3">
							<input type="checkbox" name="categoryCode" id="category-wallet3" value="403">체인지갑
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part4 -->
				
				
				
				
				<div><!-- start filter -->
					<div   class="filter-nav">
					<strong>필터</strong>
					<input type="button"  value="+"   class="toggle_control0 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box0">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="orderBy_date" value="date">출시일순
						</label>
					</div>
					<div class="toggle_box0">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="orderBy_high" value="high">가격이높은순
						</label>
					</div>
					<div class="toggle_box0">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="orderBy_low" value="low">가격이낮은순
						</label>
					</div>
					</div>
				</div><!-- end filter -->
				
					</div> <!-- end search-filter -->
					<input style="width: 100%;" type="submit" value="검색">
				</form> <!-- end form -->
				
			</div>  <!--  .gallery -->
		</div> <!--  .col-sm-2 -->	
		<div class="col-sm-10">

				<c:forEach  var="dto"  items="${list}"  varStatus="status">
				<div class="col-sm-3 content">
					 <a class="imgbox" href="${pageContext.request.contextPath}/bid/product_detail.bid?product_code=${dto.image_product_code}">
					  <img class="img" src="http://ec2-3-34-141-136.ap-northeast-2.compute.amazonaws.com:8080/spring_project/inc/image/${dto.image_target}" alt="이미지 클릭"></a>
						<c:forEach var="correction" items="${dto.image_main_list}" varStatus="correctionStatus">
							<p><b>브랜드:</b>${correction.product_brand}</p>
							<p><b>제품명:</b>${correction.product_name}</p>
							<p><b>품번:</b>${correction.product_number}</p>
							<p><b>출시가:</b>${correction.product_price}</p>
						</c:forEach>
				</div>
				</c:forEach>
		</div> <!--  .col-sm-10 -->			
	</div> <!--  .row -->		
</div><!-- .main  container -->
<%@include file="/inc/footer.jsp" %>