<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">공정검사현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<!-- <li class="nav-item"><a class="nav-link active show"
								id="tab1Nav" data-toggle="tab" href="#tab1">불량손실비용</a></li> -->
							<li class="nav-item"><a class="nav-link active show" 
								id="tab2Nav" data-toggle="tab" href="#tab2">생산성지표</a></li>
							<li class="nav-item"><a class="nav-link" 
								id="tab3Nav" data-toggle="tab" href="#tab3">공정불량 그래프</a></li>
						<!-- 	<li class="nav-item"><a class="nav-link" 
								id="tab3Nav" data-toggle="tab" href="#tab3">업체별 불량현황</a></li> -->
						</ul>
					</div>
					<div class="mb-5" id="yearGubun"></div>
					<div id="myTabContent" class="tab-content">
						<%-- <div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<div class="chart-container1" style="width:auto; height:360px; border:1px solid #ddd; 
								padding:10px; border-radius:8px; background-color: #2C2B40; ">
									<canvas id="line-chart"></canvas>
								</div>
								<hr>
								<div class="table-responsive">
									<table id="faultyLossCostTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="7%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>항목/월</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
									</table>
								</div>
							</form>
						</div> --%>
						<div class="tab-pane fade active show" id="tab2">
							<form id="form2">
								<div class="table-responsive">
									<div class="chart-container" style="width:auto; height:460px;  border:1px solid #ddd; 
								padding:10px; border-radius:8px;  background-color: #2C2B40;">
										<canvas id="line-chart"></canvas>
									</div>
									<hr>
									<table id="prodIndicaTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="7%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="8%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>항목/월</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
											</tr>
										</thead>
										<tbody id="dataList2"></tbody>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab3">
							<form id="form3">
								<div class="table-responsive">
									<div class="chart-container" style="width:auto; height:430px;  border:1px solid #ddd; 
									padding:10px; border-radius:8px;  background-color: #2C2B40;">
										<canvas id="line-chart2"></canvas>
									</div>
									<hr>
									<table id="procFaultyRateTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="9%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>항목/월</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody id="dataList3"></tbody>
									</table>
								</div>
							</form>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0160";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공정검사현황");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var prodYear = serverDateTo.substring(0,4);
	var prodGubun = "001";
	
	var mhValue1TB;
	var mhValue2TB;
	var mhValue3TB;

	var outputQtyTB;
	var faultyQtyTB;
	var ppmTB;
	var totalPpmTB;
	
	var mhValue1Arr = [];
	var mhValue2Arr = [];
	var mhValue3Arr = [];

	var outputQtyArr = [];
	var ppmArr = [];
	var totalPpmArr = [];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');

	var sumPpm=0;
	var outputQtyTotal = 0;
	var faultyQtyTotal = 0;
	var ppmTotal = 0;
	var totalPpmVal = 0;

	//공통코드 처리 시작
	var prodGubunCode = new Array(); //구분
	<c:forEach items="${prodGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	prodGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료

	var html1 = '<div class="row float-left ml-2" style="width:80%; float-right">';
	html1 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select></div>';
	html1 += '&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<select class="custom-select" id="searchOption"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	$('#yearGubun').html(html1);

	//선택박스 처리
	selectBoxAppend(prodGubunCode, "searchOption", "", "");

	
	//조회버튼 클릭 시 
	$('#btnRetv').on('click', function() {
		
		prodYear = $('#YEAR option:selected').val();
		prodGubun = $('#searchOption option:selected').val();
		$('.all_td').text('0');
		
		if($('#tab2Nav').is('.active')){
			a();
		}else if($('#tab3Nav').is('.active')){
			b();
		}
		
	});


	$(document).ready(function (){
		$('.all_td').text('0');
		a();
	});


	//생산성지표 선
	$('#tab2Nav').on('click',function(){
		$('.all_td').text('0');
		a();
	});


	$('#tab3Nav').on('click',function(){
		$('.all_td').text('0');
		b();
	});
	
	
	
	var htmlDiv = '&nbsp;&nbsp;<label class="input-label-sm">%</label></div></td>';
	
	//***********************생산성지표**************************
	//작업능률 TB
	mhValue1TB = '<tr><th style="text-align:center;">작업능률</th>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue1_12_mon"></td></tr>'

	//종합능률 TB
	mhValue2TB = '<tr><th style="text-align:center;">종합능률</th>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue2_12_mon"></td></tr>'


	//인원가동률 TB
	mhValue3TB = '<tr><th style="text-align:center;">인원가동률</th>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="mhValue3_12_mon"></td></tr>'

	//품질경향분석 테이블	
	$('#prodIndicaTable > #dataList2').append(mhValue1TB + mhValue2TB + mhValue3TB);
	
	
	//***********************공정불량율 그래프**************************
	//작업수량 TB
	outputQtyTB = '<tr><th style="text-align:center;">작업수량</th>'
		+'<td class="text-right"><span class="all_td" id="outputQty_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputQty_total_mon"></td></tr>'

	//불량수량 TB
	faultyQtyTB = '<tr><th style="text-align:center;">불량수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyQty_total_mon"></td>'


	//PPM TB
	ppmTB = '<tr><th style="text-align:center;">PPM</th>'
		+'<td class="text-right"><span class="all_td" id="ppm_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="ppm_total_mon"></td></tr>'

	//누적PPM TB
	totalPpmTB = '<tr><th style="text-align:center;">누적PPM</th>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="sumPpm_total_mon"></td></tr>'

	//공정불량 그래프 테이블	
	$('#procFaultyRateTable > #dataList3').append(outputQtyTB + faultyQtyTB + ppmTB + totalPpmTB );

	
		
	function a(){	
		$.ajax({
			url : "<c:url value='mm/prodIndicaList' />",
			type : "GET",
			data : {
				'prodYear' : function(){return prodYear;},
				'prodGubun' : function(){return prodGubun;},
				},
			success : function(res){
				let data = res.data;

				console.log(data);
					$.each(data,function(key,value){
						$.each(value,function(key2,value2){
							$('#'+key2+"_"+value.prodMon+"_mon").text(value2);
						});
					});
				
				//*********Chart.js**********
				//작업능률 배열
				for(var i=0; i<12; i++){
					var mhValue1ArrVal = i<9?$('#mhValue1_0'+(i+1)+'_mon').text():$('#mhValue1_'+(i+1)+'_mon').text();
					mhValue1Arr[i] = mhValue1ArrVal==""?parseFloat("0"):parseFloat(mhValue1ArrVal);
				} 

				//종합능률 배열
				for(var i=0; i<12; i++){
					var mhValue2ArrVal = i<9?$('#mhValue2_0'+(i+1)+'_mon').text():$('#mhValue2_'+(i+1)+'_mon').text();
					mhValue2Arr[i] = mhValue2ArrVal==""?parseFloat("0"):parseFloat(mhValue2ArrVal);
				} 

				//인원가동률 배열
				for(var i=0; i<12; i++){
					var mhValue3ArrVal = i<9?$('#mhValue3_0'+(i+1)+'_mon').text():$('#mhValue3_'+(i+1)+'_mon').text();
					mhValue3Arr[i] = mhValue3ArrVal==""?parseFloat("0"):parseFloat(mhValue3ArrVal);
				} 
				
				setChart(mhValue1Arr,mhValue2Arr,mhValue3Arr);
			}
		}); 
	};

	
	function b(){	
		$.ajax({
			url : "<c:url value='mm/procFaultyRateList' />",
			type : "GET",
			data : {
				'prodYear' : function(){return prodYear;},
				'prodGubun' : function(){return prodGubun;},
				},
			success : function(res){
				let data = res.data;
				
				$.each(data,function(key,value){
					$.each(value,function(key2,value2){
						$('#'+key2+"_"+value.prodMon+"_mon").text(value2);

						if(key2 == "ppm"){
							sumPpm += parseFloat(value2);
						}

						$('#sumPpm'+"_"+value.prodMon+"_mon").text(sumPpm);

						switch(key2){
						case "outputQty" : 
							outputQtyTotal+=parseInt(value2);
							break;
						case "faultyQty" : 
							faultyQtyTotal+=parseInt(value2);
							break;
						case "ppm" : 
							ppmTotal+=parseInt(value2);
							break;
						}
					});
				});
				

				//작업수량 누계
				$('#outputQty_total_mon').text(addCommas(uncomma(outputQtyTotal)));
	
				//불량수량 누계
				$('#faultyQty_total_mon').text(addCommas(uncomma(faultyQtyTotal)));

				//PPM 누계
				$('#ppm_total_mon').text(addCommas(uncomma(ppmTotal)));
				

				//누적 PPM 누계
				for(var i=0; i<12; i++){
					var sumPpmVal = i<9?$('#sumPpm_0'+(i+1)+'_mon').text():$('#sumPpm_'+(i+1)+'_mon').text();
					
					totalPpmVal += parseFloat(sumPpmVal);
				}

				$('#sumPpm_total_mon').text(totalPpmVal.toFixed(3)+'%');
				
				//*********Chart.js**********
				//작업수량 배열
				for(var i=0; i<12; i++){
					var outputQtyArrVal = i<9?$('#outputQty_0'+(i+1)+'_mon').text():$('#outputQty_'+(i+1)+'_mon').text();
					outputQtyArr[i] = outputQtyArrVal==""?parseFloat("0"):parseFloat(outputQtyArrVal);
				} 

				//PPM 배열
				for(var i=0; i<12; i++){
					var ppmArrVal = i<9?$('#ppm_0'+(i+1)+'_mon').text():$('#ppm_'+(i+1)+'_mon').text();
					ppmArr[i] = ppmArrVal==""?parseFloat("0"):parseFloat(ppmArrVal);
				} 

				//누적PPM 배열
				for(var i=0; i<12; i++){
					var totalPpmArrVal = i<9?$('#sumPpm_0'+(i+1)+'_mon').text():$('#sumPpm_'+(i+1)+'_mon').text();
					totalPpmArr[i] = totalPpmArrVal==""?parseFloat("0"):parseFloat(totalPpmArrVal);
				} 
				
				setChart2(outputQtyArr,ppmArr,totalPpmArr);
			}
		}); 
	};


	//***********************Chart.js**************************
	function setChart(arr1,arr2,arr3){
		
		var lineChart = new Chart(ctx,{
			type : 'bar',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:'작업능률',
						type : 'bar', 
						data : arr1,
						backgroundColor:'#FD9644',
						borderColor:'#FD9644',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						label:'종합능률',
						type : 'line',
						data  : arr2,
						backgroundColor:'#4B7BEC',
						borderColor:'#4B7BEC',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						label:'인원가동률',
						type : 'line',
						data  : arr3,
						backgroundColor:'#65CAA5',
						borderColor:'#65CAA5',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
						ticks:{
							fontColor: '#E6E6E6',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						ticks:{
							max:1000,
							min:0,
							stepSize:100,
							fontColor: '#FFF6F5',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}]
				},
				legend:{
					labels :{
						fontColor:'#FFF6F5',
						fontSize:14
					},
					display:true
				}
			}
		});
		
	}


	function setChart2(arr1,arr2,arr3){
		
		var lineChart = new Chart(ctx2,{
			type : 'line',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:'작업수량',
						data : arr1,
						backgroundColor:'#FD9644',
						borderColor:'#FD9644',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						label:'PPM',
						data  : arr2,
						backgroundColor:'#4B7BEC',
						borderColor:'#4B7BEC',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						label:'누적PPM',
						data  : arr3,
						backgroundColor:'#65CAA5',
						borderColor:'#65CAA5',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
						ticks:{
							fontColor: '#E6E6E6',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						ticks:{
							max:10000,
							min:0,
							stepSize:1000,
							fontColor: '#FFF6F5',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}]
				},
				legend:{
					labels :{
						fontColor:'#FFF6F5',
						fontSize:14
					},
					display:true
				}
			}
		});
		
	}
	
	//***********************Chart.js**************************
	
	
    //콤마(,) 생성
    function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	} 


</script>
<script>
    $(document).ready(function(){
        setDateBox();
    }); 
  // select box 연도 , 월 표시
  function setDateBox(){
      var dt = new Date();
      var com_year = dt.getFullYear();
      
      // 발행 뿌려주기
      $("#YEAR").append("<option value=''>년도</option>");
      // 올해 기준으로 -1년부터 +5년을 보여준다.
      for(var y = (com_year-1); y <= (com_year+5); y++){
          $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
      }

      $('#YEAR').val(prodYear).prop('selected',true);
     
  }
</script>
</body>
</html>
