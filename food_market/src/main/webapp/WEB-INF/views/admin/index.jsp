<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/adminLogo.png"><title>관리자 페이지</title>
 <!-- Styles -->
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/icomoon/style.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/default.css" rel="stylesheet"/>
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet"/>
        <link href="assets/plugins/nvd3/nv.d3.min.css" rel="stylesheet">
<!-- Theme Styles -->
        <link href="assets/css/ecaps.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var category1=${category1};
	var category2=${category2};
	var category3=${category3};
	var category4=${category4};
	var category5=${category5};
	var totalProduct = category1+category2+category3+category4+category5;
	
	var chrome = ${chrome};
	var edge = ${edge};
	var explorer = ${explorer};
	var safari = ${safari};
	var etc = ${etc};
	var browser = chrome + edge + explorer + safari + etc;
	
	var year0 = ${year0}; var year1 = ${year1}; var year2 = ${year2}; var year3 = ${year3}; var year4 = ${year4};
	var year5 = ${year5}; var year6 = ${year6}; var year7 = ${year7}; var year8 = ${year8}; var year9 = ${year9};
	var year10 = ${year10}; var year11 = ${year11}; var year12 = ${year12}; var year13 = ${year13}; var year14 = ${year14};
	var year15 = ${year15}; var year16 = ${year16}; var year17 = ${year17}; var year18 = ${year18}; var year19 = ${year19};
	var year20 = ${year20}; var year21 = ${year21}; var year22 = ${year22}; var year23 = ${year23}; var year24 = ${year24};
	var year25 = ${year25}; var year26 = ${year26}; var year27 = ${year27}; var year28 = ${year28}; var year29 = ${year29};
	
	var month0 = ${month0}; var month1 = ${month1}; var month2 = ${month2}; var month3 = ${month3}; var month4 = ${month4};
	var month5 = ${month5}; var month6 = ${month6}; var month7 = ${month7}; var month8 = ${month8}; var month9 = ${month9};
	var month10 = ${month10}; var month11 = ${month11}; var month12 = ${month12}; var month13 = ${month13}; var month14 = ${month14};
	var month15 = ${month15}; var month16 = ${month16}; var month17 = ${month17}; var month18 = ${month18}; var month19 = ${month19};
	var month20 = ${month20}; var month21 = ${month21}; var month22 = ${month22}; var month23 = ${month23}; var month24 = ${month24};
	var month25 = ${month25}; var month26 = ${month26}; var month27 = ${month27}; var month28 = ${month28}; var month29 = ${month29};
	
	var day0 = ${day0}; var day1 = ${day1}; var day2 = ${day2}; var day3 = ${day3}; var day4 = ${day4};
	var day5 = ${day5}; var day6 = ${day6}; var day7 = ${day7}; var day8 = ${day8}; var day9 = ${day9};
	var day10 = ${day10}; var day11 = ${day11}; var day12 = ${day12}; var day13 = ${day13}; var day14 = ${day14};
	var day15 = ${day15}; var day16 = ${day16}; var day17 = ${day17}; var day18 = ${day18}; var day19 = ${day19};
	var day20 = ${day20}; var day21 = ${day21}; var day22 = ${day22}; var day23 = ${day23}; var day24 = ${day24};
	var day25 = ${day25}; var day26 = ${day26}; var day27 = ${day27}; var day28 = ${day28}; var day29 = ${day29};
	
	var chrome0 = ${chrome0}; var chrome1 = ${chrome1}; var chrome2 = ${chrome2}; var chrome3 = ${chrome3}; var chrome4 = ${chrome4};
	var chrome5 = ${chrome5}; var chrome6 = ${chrome6}; var chrome7 = ${chrome7}; var chrome8 = ${chrome8}; var chrome9 = ${chrome9};
	var chrome10 = ${chrome10}; var chrome11 = ${chrome11}; var chrome12 = ${chrome12}; var chrome13 = ${chrome13}; var chrome14 = ${chrome14};
	var chrome15 = ${chrome15}; var chrome16 = ${chrome16}; var chrome17 = ${chrome17}; var chrome18 = ${chrome18}; var chrome19 = ${chrome19};
	var chrome20 = ${chrome20}; var chrome21 = ${chrome21}; var chrome22 = ${chrome22}; var chrome23 = ${chrome23}; var chrome24 = ${chrome24};
	var chrome25 = ${chrome25}; var chrome26 = ${chrome26}; var chrome27 = ${chrome27}; var chrome28 = ${chrome28}; var chrome29 = ${chrome29};
	
	var edge0 = ${edge0}; var edge1 = ${edge1}; var edge2 = ${edge2}; var edge3 = ${edge3}; var edge4 = ${edge4};
	var edge5 = ${edge5}; var edge6 = ${edge6}; var edge7 = ${edge7}; var edge8 = ${edge8}; var edge9 = ${edge9};
	var edge10 = ${edge10}; var edge11 = ${edge11}; var edge12 = ${edge12}; var edge13 = ${edge13}; var edge14 = ${edge14};
	var edge15 = ${edge15}; var edge16 = ${edge16}; var edge17 = ${edge17}; var edge18 = ${edge18}; var edge19 = ${edge19};
	var edge20 = ${edge20}; var edge21 = ${edge21}; var edge22 = ${edge22}; var edge23 = ${edge23}; var edge24 = ${edge24};
	var edge25 = ${edge25}; var edge26 = ${edge26}; var edge27 = ${edge27}; var edge28 = ${edge28}; var edge29 = ${edge29};
	
	var explorer0 = ${explorer0}; var explorer1 = ${explorer1}; var explorer2 = ${explorer2}; var explorer3 = ${explorer3}; var explorer4 = ${explorer4};
	var explorer5 = ${explorer5}; var explorer6 = ${explorer6}; var explorer7 = ${explorer7}; var explorer8 = ${explorer8}; var explorer9 = ${explorer9};
	var explorer10 = ${explorer10}; var explorer11 = ${explorer11}; var explorer12 = ${explorer12}; var explorer13 = ${explorer13}; var explorer14 = ${explorer14};
	var explorer15 = ${explorer15}; var explorer16 = ${explorer16}; var explorer17 = ${explorer17}; var explorer18 = ${explorer18}; var explorer19 = ${explorer19};
	var explorer20 = ${explorer20}; var explorer21 = ${explorer21}; var explorer22 = ${explorer22}; var explorer23 = ${explorer23}; var explorer24 = ${explorer24};
	var explorer25 = ${explorer25}; var explorer26 = ${explorer26}; var explorer27 = ${explorer27}; var explorer28 = ${explorer28}; var explorer29 = ${explorer29};
	
	var safari0 = ${safari0}; var safari1 = ${safari1}; var safari2 = ${safari2}; var safari3 = ${safari3}; var safari4 = ${safari4};
	var safari5 = ${safari5}; var safari6 = ${safari6}; var safari7 = ${safari7}; var safari8 = ${safari8}; var safari9 = ${safari9};
	var safari10 = ${safari10}; var safari11 = ${safari11}; var safari12 = ${safari12}; var safari13 = ${safari13}; var safari14 = ${safari14};
	var safari15 = ${safari15}; var safari16 = ${safari16}; var safari17 = ${safari17}; var safari18 = ${safari18}; var safari19 = ${safari19};
	var safari20 = ${safari20}; var safari21 = ${safari21}; var safari22 = ${safari22}; var safari23 = ${safari23}; var safari24 = ${safari24};
	var safari25 = ${safari25}; var safari26 = ${safari26}; var safari27 = ${safari27}; var safari28 = ${safari28}; var safari29 = ${safari29};
	
	var etc0 = ${etc0}; var etc1 = ${etc1}; var etc2 = ${etc2}; var etc3 = ${etc3}; var etc4 = ${etc4};
	var etc5 = ${etc5}; var etc6 = ${etc6}; var etc7 = ${etc7}; var etc8 = ${etc8}; var etc9 = ${etc9};
	var etc10 = ${etc10}; var etc11 = ${etc11}; var etc12 = ${etc12}; var etc13 = ${etc13}; var etc14 = ${etc14};
	var etc15 = ${etc15}; var etc16 = ${etc16}; var etc17 = ${etc17}; var etc18 = ${etc18}; var etc19 = ${etc19};
	var etc20 = ${etc20}; var etc21 = ${etc21}; var etc22 = ${etc22}; var etc23 = ${etc23}; var etc24 = ${etc24};
	var etc25 = ${etc25}; var etc26 = ${etc26}; var etc27 = ${etc27}; var etc28 = ${etc28}; var etc29 = ${etc29};
	
	var vis0 = ${vis0}; var vis1 = ${vis1}; var vis2 = ${vis2}; var vis3 = ${vis3}; var vis4 = ${vis4};
	var vis5 = ${vis5}; var vis6 = ${vis6}; var vis7 = ${vis7}; var vis8 = ${vis8}; var vis9 = ${vis9};
	var vis10 = ${vis10}; var vis11 = ${vis11}; var vis12 = ${vis12}; var vis13 = ${vis13}; var vis14 = ${vis14};
	var vis15 = ${vis15}; var vis16 = ${vis16}; var vis17 = ${vis17}; var vis18 = ${vis18}; var vis19 = ${vis19};
	var vis20 = ${vis20}; var vis21 = ${vis21}; var vis22 = ${vis22}; var vis23 = ${vis23}; var vis24 = ${vis24};
	var vis25 = ${vis25}; var vis26 = ${vis26}; var vis27 = ${vis27}; var vis28 = ${vis28}; var vis29 = ${vis29};
	
	var fruit=${fruit};
	var vegetable=${vegetable};
	var meat=${meat};
	var rice=${rice};
	var fish=${fish};
	
	var fruitSales=${fruitSales};
	var vegetableSales=${vegetableSales};
	var meatSales=${meatSales};
	var riceSales=${riceSales};
	var fishSales=${fishSales};
	
	
	google.charts.load('current', {packages : [ 'corechart']});
	google.charts.setOnLoadCallback(drawMultSeries1);
	google.charts.setOnLoadCallback(drawMultSeries2);
	google.charts.setOnLoadCallback(drawMultSeries3);
	google.charts.setOnLoadCallback(drawMultSeries4);
	
	function drawMultSeries1() {
		var data1 = new google.visualization.DataTable();
	          data1.addColumn('string','카테고리');
	          data1.addColumn('number','상품 수');
	          data1.addRows([
	              ['과일',category1/totalProduct*100],
	              ['채소',category2/totalProduct*100],
	              ['정육',category3/totalProduct*100],
	              ['곡식',category4/totalProduct*100],
	              ['수산',category5/totalProduct*100]
	          ]);
	    
		var options1 = {
			chartArea : {width : '80%', height:'80%'},
			legend:{position: 'right'},
		};
		
		var chart1 = new google.visualization.PieChart(document.getElementById('chart1'));
	    chart1.draw(data1, options1);
	
	};
	
	function drawMultSeries2() {
		var data2 = new google.visualization.DataTable();
	          data2.addColumn('string','카테고리');
	          data2.addColumn('number','주문 수');
	          data2.addColumn('number','결제 금액');
	          data2.addRows([
	              ['과일',fruit,fruitSales],
	              ['채소',vegetable,vegetableSales],
	              ['정육',meat,meatSales],
	              ['곡식',rice,riceSales],
	              ['수산',fish,fishSales]
	          ]);
	    
		var options2 = {
			legend:{position: 'top'},
			hAxis : {title : '카테고리'},
		    seriesType : 'bars',
			series: {
	               0: { targetAxisIndex: 0 },
	               1: {type: "line", targetAxisIndex:1},
	           },
           	vAxes: {
               0: { title: '주문 수',minValue:0 },
               1: { title: '결제 금액',minValue:0  }
           	}
		};
		
		var chart2 = new google.visualization.ComboChart(document.getElementById('chart2'));
	    chart2.draw(data2, options2);
	
	};
	
	function drawMultSeries3() {
		var data3 = new google.visualization.DataTable();
	          data3.addColumn('string','브라우저');
	          data3.addColumn('number','접속 수');
	          data3.addRows([
	              ['Chrome',chrome/browser*100],
	              ['Edge',edge/browser*100],
	              ['Explorer',explorer/browser*100],
	              ['Safari',safari/browser*100],
	              ['Etc',etc/browser*100]
	          ]);
	    
		var options3 = {
			chartArea : {width : '100%', height:'100%'},
			legend:{position: 'right'}
		};
		
		var chart3 = new google.visualization.PieChart(document.getElementById('chart3'));
	    chart3.draw(data3, options3);
	
	};
	
	function drawMultSeries4() {
		var data = new google.visualization.DataTable();
        data.addColumn('date', '날짜');
        data.addColumn('number', '총방문자');
        data.addColumn('number', 'chrome');
        data.addColumn('number', 'edge');
        data.addColumn('number', 'explorer');
        data.addColumn('number', 'safari');
        data.addColumn('number', 'etc');
        data.addRows([
          [new Date(year0, month0, day0), vis0, chrome0, edge0, explorer0, safari0, etc0],  [new Date(year1, month1, day1), vis1, chrome1, edge1, explorer1, safari1, etc1],
          [new Date(year2, month2, day2), vis2, chrome2, edge2, explorer2, safari2, etc2], [new Date(year3, month3, day3), vis3, chrome3, edge3, explorer3, safari3, etc3],
          [new Date(year4, month4, day4), vis4, chrome4, edge4, explorer4, safari4, etc4], [new Date(year5, month5, day5), vis5, chrome5, edge5, explorer5, safari5, etc5],
          [new Date(year6, month6, day6), vis6, chrome6, edge6, explorer6, safari6, etc6], [new Date(year7, month7, day7), vis7, chrome7, edge7, explorer7, safari7, etc7], 
          [new Date(year8, month8, day8), vis8, chrome8, edge8, explorer8, safari8, etc8], [new Date(year9, month9, day9), vis9, chrome9, edge9, explorer9, safari9, etc9], 
          [new Date(year10, month10, day10), vis10, chrome10, edge10, explorer10, safari10, etc10], [new Date(year11, month11, day11), vis11, chrome11, edge11, explorer11, safari11, etc11],
          [new Date(year12, month12, day12), vis12, chrome12, edge12, explorer12, safari12, etc12], [new Date(year13, month13, day13), vis13, chrome13, edge13, explorer13, safari13, etc13], 
          [new Date(year14, month14, day14), vis14, chrome14, edge14, explorer14, safari14, etc14], [new Date(year15, month15, day15), vis15, chrome15, edge15, explorer15, safari15, etc15], 
          [new Date(year16, month16, day16), vis16, chrome16, edge16, explorer16, safari16, etc16], [new Date(year17, month17, day17), vis17, chrome17, edge17, explorer17, safari17, etc17],
          [new Date(year18, month18, day18), vis18, chrome18, edge18, explorer18, safari18, etc18], [new Date(year19, month19, day19), vis19, chrome19, edge19, explorer19, safari19, etc19], 
          [new Date(year20, month20, day20), vis20, chrome20, edge20, explorer20, safari20, etc20], [new Date(year21, month21, day21), vis21, chrome21, edge21, explorer21, safari21, etc21], 
          [new Date(year22, month22, day22), vis22, chrome22, edge22, explorer22, safari22, etc22], [new Date(year23, month23, day23), vis23, chrome23, edge23, explorer23, safari23, etc23],
          [new Date(year24, month24, day24), vis24, chrome24, edge24, explorer24, safari24, etc24], [new Date(year25, month25, day25), vis25, chrome25, edge25, explorer25, safari25, etc25], 
          [new Date(year26, month26, day26), vis26, chrome26, edge26, explorer26, safari26, etc26], [new Date(year27, month27, day27), vis27, chrome27, edge27, explorer27, safari27, etc27], 
          [new Date(year28, month28, day28), vis28, chrome28, edge28, explorer28, safari28, etc28], [new Date(year29, month29, day29), vis29, chrome29, edge29, explorer29, safari29, etc29]
        ]);


        var options = {
        		chartArea : {width: '75%',	height: '90%'},
          hAxis: {
            format: 'MM/dd',
            gridlines: {count:5}
          },
          vAxis: {
            gridlines: {color: 'none'},
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart4'));

        chart.draw(data, options);
	};
	
});

</script>

</head>
<body>
<!-- Page Container -->
<div class="page-container">
<!-- Page Sidebar -->
    <jsp:include page="leftMenu.jsp"></jsp:include>
<!-- /Page Sidebar -->

<!-- Page Content -->
<div class="page-content">
    <!-- Page Header -->
<div class="page-header">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
           		<!-- 사이드 메뉴 접기 / 펴기  -->
               <ul class="nav navbar-nav">
                   <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fa fa-bars"></i></a></li>
               </ul>
           </div><!-- /.navbar-collapse -->
       </div><!-- /.container-fluid -->
    </nav>
</div><!-- /Page Header -->
<!-- Page Inner -->
<div class="page-inner">
	<!-- 타이틀 -->
    <div class="page-title">
        <h3 class="breadcrumb-header">Dashboard</h3>
    </div>
  
    <div id="main-wrapper">
    	<!-- 하단 1 -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-white stats-widget">
                    <div class="panel-body">
                        <div class="pull-left">
                            <span class="stats-number">${todayMember } 명</span>
                            <p class="stats-info">신규 가입자</p>
                        </div>
                        <div class="pull-right">
                            <i class="icon-arrow_upward stats-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-white stats-widget">
                    <div class="panel-body">
                        <div class="pull-left">
                            <span class="stats-number">${visitCount} 명</span>
                            <p class="stats-info">방문자</p>
                        </div>
                        <div class="pull-right">
                            <i class="icon-arrow_upward stats-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-white stats-widget">
                    <div class="panel-body">
                        <div class="pull-left">
                            <span class="stats-number">${todayOrder }</span>
                            <p class="stats-info">당일 주문량</p>
                        </div>
                        <div class="pull-right">
                            <i class="icon-arrow_upward stats-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-white stats-widget">
                    <div class="panel-body">
                        <div class="pull-left">
                            <span class="stats-number">￦ ${todaySales }</span>
                            <p class="stats-info">당일 매출액</p>
                        </div>
                        <div class="pull-right">
                            <i class="icon-arrow_upward stats-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- Row -->
        
        <!-- 하단 2 -->
		<div class="row">
			<div class="panel panel-white" style="width: 32%;height:350px;float: left;margin-right: 15px;">
				<div class="panel-heading clearfix">
                  <h4 class="panel-title">방문자 브라우저</h4>
				</div>
				<div class="panel-body">
					<div id="chart3"></div>
				</div>
			</div>
		<div class="panel panel-white" style="width: 60%;height:350px;float: left;margin-right: 15px;">
				<div class="panel-heading clearfix">
                  <h4 class="panel-title" style="padding:0;">홈페이지 방문자(30일)</h4>
				</div>
				<div class="panel-body">
					<div id="chart4" style="padding-top:40px;"></div>
				</div>
			</div>
			<div class="panel panel-white" style="width: 32%;height:350px;float: left;margin-right: 15px;">
				<div class="panel-heading clearfix">
                  <h4 class="panel-title">카테고리별 상품 수</h4>
				</div>
				<div class="panel-body">
					<div id="chart1"></div>
				</div>
			</div>
			<div class="panel panel-white" style="width: 60%;height:350px;float: left;margin-right: 15px;">
				<div class="panel-heading clearfix">
                  <h4 class="panel-title">${thisMonth }&nbsp;&nbsp; 카테고리별 주문 수</h4>
				</div>
				<div class="panel-body">
					<div id="chart2"></div>
				</div>
			</div>
			
			
		</div><!-- Row -->
       
   </div><!-- Main Wrapper -->
</div><!-- /Page Inner -->
</div><!-- /Page Content -->
</div><!-- /Page Container -->


<!-- Javascripts -->
    <script src="assets/plugins/jquery/jquery-3.1.0.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/plugins/uniform/js/jquery.uniform.standalone.js"></script>
    <script src="assets/plugins/switchery/switchery.min.js"></script>
    <script src="assets/plugins/d3/d3.min.js"></script>
    <script src="assets/plugins/nvd3/nv.d3.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.symbol.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="assets/plugins/chartjs/chart.min.js"></script>
    <script src="assets/js/ecaps.min.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
</body>
</html>