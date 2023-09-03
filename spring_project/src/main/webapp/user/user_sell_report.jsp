<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/header.jsp"%>
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->
<!-- INCLUDE HEADER -->

<script>
var result = "${success}";
var url = "${url}";
var contextPath = "${pageContext.request.contextPath}";
	if (result.indexOf('완료') !== -1) {
		alert(result);
		location.href = contextPath + url;
	} else if (result.indexOf('실패') !== -1)  {
		console.log('n');
		alert(result);
	}
</script>

<div id="minho_main">
	<div class="row container-fluid login">
		<%@include file="/inc/admin_page.jsp" %>		

		
		<div class="col-sm-9 right">
				<div class="adminBoxCh">
					<h3 class="adminNameCh">매출 내역 확인</h3>
					<div class="form-group fgCh">
					  	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
						 <div id="chart_div"></div>
					</div>
				<div class="form-group fgChBb">
				<a href="javaScript:history.go(-1);" title="뒤로 가기" class="btn-block ba">뒤로 가기</a>
				</div>
				</div>
		</div>
	</div>
</div>


<script>
var list = ${list};
/* var data = {
  product_brand: [],
  product_total: []
};
var size = list.length;
for (var i = 0; i < size; i++) {
  data.product_brand.push(list[i].product_brand);
  data.product_total.push(list[i].product_total);
}
console.log(data.product_brand[0]);
 */
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([ 
        /* 오른쪽 설명 */
        ['', '', { role: 'style' }],
        /* 이름, 값, 색 */
    	[list[0].product_brand, list[0].product_total, 'color: blue']        	
      ]);

      var options = {
        title: '2023년 브랜드 판매 수',
        chartArea: {width: '75%'},
        hAxis: {
/*           title: 'Total Population', */
          minValue: 0
        },
        vAxis: {
/*           title: 'City' */
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<!-- INCLUDE FOOTER -->
<%@ include file="/inc/footer.jsp"%>