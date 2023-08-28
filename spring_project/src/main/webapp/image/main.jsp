<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/inc/main.css">
<%@include file="../inc/header.jsp" %> 

 <script>
		$(function(){
			$(".toggle_box").hide();
			$(".toggle_control").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box").toggle();
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
		$(function(){
			$(".toggle_box5").hide();
			$(".toggle_control5").click(function(){
				if(  $(this).val() =='+'){ $(this).val("-"); }
				else{  $(this).val("+");   }
				$(".toggle_box5").toggle();
			});
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
					<input  type="button"  value="+"   class="toggle_control tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box">
						<label for="first-category-all">
							<input type="checkbox" name="categoryCode" id="first-category-shoes" value="100" checked>신발
						</label>
					</div>
					<div class="toggle_box">
						<label for="first-category-shoes">
							<input type="checkbox" name="categoryCode" id="first-category-" value="101">스니커즈
						</label>
					</div>
					<div class="toggle_box">
						<label for="first-category-clothing">
							<input type="checkbox" name="categoryCode" id="first-category-" value="102">샌들
						</label>
					</div>
					<div class="toggle_box">
						<label for="first-category-bags">

							<input type="checkbox" name="categoryCode" id="first-category-" value="103">구두
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				
				<!-- 이후에 추가할 내용 지금은 깡통 -->
				<!-- 이후에 추가할 내용 지금은 깡통 -->
				<!-- part1 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >의류카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control3 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box3">
						<label for="first-category-all">
							<input type="checkbox" name="categoryCode3" id="first-category-shoes" value="100" checked>셔츠
						</label>
					</div>
					<div class="toggle_box3">
						<label for="first-category-shoes">
							<input type="checkbox" name="categoryCode3" id="first-category-" value="101">티셔츠
						</label>
					</div>
					<div class="toggle_box3">
						<label for="first-category-clothing">
							<input type="checkbox" name="categoryCode3" id="first-category-" value="102">청바지
						</label>
					</div>
					<div class="toggle_box3">
						<label for="first-category-bags">
							<input type="checkbox" name="categoryCode3" id="first-category-" value="103">정장바지
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part1 -->
				
				
				<!-- part2 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >가방카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control4 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box4">
						<label for="first-category-all">
							<input type="checkbox" name="categoryCode4" id="first-category-shoes" value="100" checked>숄더백
						</label>
					</div>
					<div class="toggle_box4">
						<label for="first-category-shoes">
							<input type="checkbox" name="categoryCode4" id="first-category-" value="101">미니백
						</label>
					</div>
					<div class="toggle_box4">
						<label for="first-category-clothing">
							<input type="checkbox" name="categoryCode4" id="first-category-" value="102">숄더백
						</label>
					</div>
					<div class="toggle_box4">
						<label for="first-category-bags">
							<input type="checkbox" name="categoryCode4" id="first-category-" value="103">토트백
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part2 -->
				
				
				
				<!-- part3 -->
				<div> <!-- start category -->
					<div  class="filter-nav">	
					<strong  >지갑카테고리</strong>
					<input  type="button"  value="+"   class="toggle_control5 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box5">
						<label for="first-category-all">
							<input type="checkbox" name="categoryCode5" id="first-category-shoes" value="100" checked>장지갑
						</label>
					</div>
					<div class="toggle_box5">
						<label for="first-category-shoes">
							<input type="checkbox" name="categoryCode5" id="first-category-" value="101">반지갑
						</label>
					</div>
					<div class="toggle_box5">
						<label for="first-category-clothing">
							<input type="checkbox" name="categoryCode5" id="first-category-" value="102">카드지갑
						</label>
					</div>
					<div class="toggle_box5">
						<label for="first-category-bags">
							<input type="checkbox" name="categoryCode5" id="first-category-" value="103">체인지갑
						</label>
					</div>
					</div>
				</div> <!-- end category  -->
				<!-- part3 -->
				
				
				<!-- 이후에 추가할 내용 지금은 깡통 -->
				<!-- 이후에 추가할 내용 지금은 깡통 -->
				
				<div><!-- start filter -->
					<div   class="filter-nav">
					<strong>필터</strong>
					<input type="button"  value="+"   class="toggle_control2 tc" />
					</div>
					<div class="filter-select">
					<div class="toggle_box2">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="first-category-" value="date">출시일순
						</label>
					</div>
					<div class="toggle_box2">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="first-category-" value="high">가격이높은순
						</label>
					</div>
					<div class="toggle_box2">
						<label for="two-category-date">
							<input type="checkbox" name="orderBy" id="first-category-" value="low">가격이낮은순
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