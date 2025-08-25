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
				<li class="breadcrumb-item active">수입검사현황 (레이저)</li>
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
					<div class="card-header card-tab p-0 mb-2 d-none">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item"><a class="nav-link active show"
								id="tab1Nav" data-toggle="tab" href="#tab1">품질경향분석</a></li>
							<li class="nav-item"><a class="nav-link" 
								id="tab2Nav" data-toggle="tab" href="#tab2">원인별 불량누적현황</a></li>
						<!-- 	<li class="nav-item"><a class="nav-link" 
								id="tab3Nav" data-toggle="tab" href="#tab3">업체별 불량현황</a></li> -->
						</ul>
					</div>
					<div class="pb-3" id="yearGubun"></div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<div class="chart-container1" style="width:auto; height:360px; border:1px solid #ddd; 
								padding:10px; border-radius:8px; background-color: #2C2B40; ">
									<canvas id="line-chart"></canvas>
								</div>
								<hr>
								<div class="table-responsive">
									<table id="qualityTrendAnlyTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="4%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											            
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											            
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											<col width="3%">
											            
											<col width="3%">
											<col width="3%">
											<col width="3%">
											
											
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>구분</th>
												<th>1일</th>
												<th>2일</th>
												<th>3일</th>
												<th>4일</th>
												<th>5일</th>
												<th>6일</th>
												<th>7일</th>
												<th>8일</th>
												<th>9일</th>
												<th>10일</th>
												<th>11일</th>
												<th>12일</th>
												<th>13일</th>
												<th>14일</th>
												<th>15일</th>
												<th>16일</th>
												<th>17일</th>
												<th>18일</th>
												<th>19일</th>
												<th>20일</th>
												<th>21일</th>
												<th>22일</th>
												<th>23일</th>
												<th>24일</th>
												<th>25일</th>
												<th>26일</th>
												<th>27일</th>
												<th>28일</th>
												<th>29일</th>
												<th>30일</th>
												<th>31일</th>
												<th>누계</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab2">
							<form id="form2">
								<div class="table-responsive">
									<div class="chart-container" style="width:auto; height:300px;  border:1px solid #ddd; 
								padding:10px; border-radius:8px;  background-color: #2C2B40;">
										<canvas id="line-chart2"></canvas>
									</div>
									<hr>
									<table id="faultyStatusTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="5%">
											<col width="4%">
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
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th colspan="2">구분</th>
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
												<th>누계</th>
											</tr>
										</thead>
										<tbody id="dataList2"></tbody>
									</table>
								</div>
							</form>
						</div>
						<%-- <div class="tab-pane fade" id="tab3">
							<form id="form3">
								<div class="table-responsive">
									<table id="companyFaultyStatusTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="10%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th colspan="2">구분</th>
												<th>입고수량</th>
												<th>합격수량</th>
												<th>불량수량</th>
												<th>불량율</th>
												<th>점유율</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
									</table>
								</div>
							</form>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사현황 (레이저)");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var year = serverDateTo.substring(0,4);
	let mon = serverDateTo.substring(5,7);
	var kg;
	var preInWhsQtyTB;
	var pairCntTB;
	var faultyCntTB;
	var faultyRateTB;
	var targetRateTB;
	var achvRateTB;
	
	var value2Transf;
	var preInWhsQtySum=0;
	var pairCntSum=0;
	var faultyCntSum=0;
	var faultyRateSum=0;
	var targetRateSum=0;
	var maxTargetRateSum=0;
	var faultyTotalVal=0;
	var faultyTypeTotalVal=0;
	var quantityTotalValue=0;
	var shareTotalValue=0;
	var quantityValue=0;
	var shareValue=0;
	
	var faultyRateArr = [];
	var faultyTotalArr = [];
	var chartDataValue=[];
	let targetTotalArr =[];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');
	var count = "${faultyTypeCount}";

	var arr = [];
	for(var i=0; i<count; i++){
	  arr[i] = [];
	  for(var j=0; j<12; j++){
	    arr[i][j] = null;
	  }
	}
	
	var inspectDesc = new Array(); //불량유형
	<c:forEach items="${inspectDesc}" var="info">
	var json = new Object();
	json.key = "${info.etc2}";
	json.value = "${info.baseInfoNm}";
	inspectDesc.push(json);
	</c:forEach>


	var html1 = '<div class="row float-left ml-2" style="width:80%; float-right">';
	html1 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">월</label><div class="form-group input-sub m-0 row">';
	html1 += '<select name="MON" id="MON" title="월" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary float-right mr-2 d-none" id="btnObjSave">목표등록</button>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning float-right mr-2 d-none" id="btnObjChange">목표수정</button>';

	$('#yearGubun').html(html1);

	//조회버튼 클릭 시 
	$('#btnRetv').on('click', function() {
		year = $('#YEAR option:selected').val();
		mon = $('#MON option:selected').val();
		
		//품질경향분석
		preInWhsQtySum=0;
		pairCntSum=0;
		faultyCntSum=0;
		faultyRateSum=0;
		targetRateSum=0;
		maxTargetRateSum=0;
		faultyTotalVal=0;

		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		
		$('.all_td').text('0');
		$('.per').text('0%');
		$('.per').val('0');
		a();
		b();

		lineChart.destroy();
		barChart.destroy();
	});
	
	//품질경향분석 조회
	$(document).ready(function (){
		$('.all_td').text('0');
		$('.per').text('0%');
		$('.per').val('0');
		a();
		b();
	});
	
	//tab1Nav 클릭 시
	$('#tab1Nav').on('click',function(){
		$('#btnObjChange').removeClass('d-none');
		
	});

	//tab2Nav 클릭 시
	$('#tab2Nav').on('click',function(){
		$('#btnObjChange').addClass('d-none');
		
	});

	//목표수정 버튼 클릭시
	$('#btnObjChange').on('click',function(){

		$('#btnObjSave').removeClass('d-none');
		
		for(var i=0; i<31; i++){
			i<9?$('#targetRate_0'+(i+1)+'_date').attr('disabled',false):$('#targetRate_'+(i+1)+'_date').attr('disabled',false);
		}
	});

	//목표등록 버튼 클릭시
	$('#btnObjSave').on('click',function(){

		var check=true;
		var dataArray = new Array();
		

		for(var i=0; i<31; i++){
			var rowData = new Object();
			
			rowData.qcObjGubun = '001';
			rowData.qcObjYear = $('#YEAR :selected').val()==""?year:$('#YEAR :selected').val();
			rowData.qcObjMon = $('#MON :selected').val()==""?mon:$('#MON :selected').val();
			
			rowData.qcObjDate = i<9?('0'+(i+1)):(i+1);
			rowData.qcObjValue = i<9?$('#targetRate_0'+(i+1)+'_date').val():$('#targetRate_'+(i+1)+'_date').val();

			dataArray.push(rowData);
			console.log(rowData);
		}

		$.ajax({
			url : '<c:url value="qm/qcObjAdmCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {

			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('등록되었습니다.');

					a();
					$('#btnObjSave').addClass('d-none');
					
					for(var i=0; i<12; i++){
						i<9?$('#targetRate_0'+(i+1)+'_mon').attr('disabled',true):$('#targetRate_'+(i+1)+'_mon').attr('disabled',true);
					}

				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
		
	});




	



	//***********************품질경향분석**************************
	
	//단위(KG)
	kg = '<tr><th style="text-align:center;">단위(KG)</th>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id=""></td></tr>';
		
	//입고수량 TB
	preInWhsQtyTB = '<tr><th style="text-align:center;">입고수량</th>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_31_date"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_sum_date"></td></tr>';

	//합격수량 TB
	pairCntTB = '<tr><th style="text-align:center;">합격수량</th>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_31_date"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_sum_date"></td></tr>';


	//불합격수량 TB
	faultyCntTB = '<tr><th style="text-align:center;">불합격수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_31_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_sum_date"></td></tr>';
		
	//불량율(%) TB
	faultyRateTB = '<tr><th style="text-align:center;">불량율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_31_date"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_sum_date"></td></tr>';

	var htmlDiv = '&nbsp;&nbsp;<label class="input-label-sm">%</label></div></td>';
	//2020년 목표(%) TB
	targetRateTB = '<tr><th style="text-align:center;">목표(%)</th>'
		+'<td class="text-right"><span class="all_td" id="targetRate_01_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_02_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_03_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_04_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_05_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_06_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_07_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_08_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_09_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_10_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_11_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_12_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_13_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_14_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_15_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_16_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_17_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_18_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_19_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_20_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_21_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_22_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_23_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_24_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_25_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_26_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_27_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_28_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_29_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_30_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td" id="targetRate_31_date" name="targetRate">'+htmlDiv
		+'<td class="text-right"><span class="all_td per" id="targetRate_sum_date"></td></tr>';

	//달성율 TB
	achvRateTB = '<tr><th style="text-align:center;">달성율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="achvRate_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_31_date"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_sum_date"></td></tr>';

	//누적불량율(%) TB
	faultyTotalTB = '<tr><th style="text-align:center;">누적불량율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_31_date"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_sum_date"></td></tr>';


	//품질경향분석 테이블	
	$('#qualityTrendAnlyTable > #dataList').append(preInWhsQtyTB+faultyCntTB+faultyRateTB+targetRateTB+achvRateTB)
	console.log();
	
	
	//***********************원인별 불량누적현황**************************
	
	$.each(inspectDesc,function(key,value){
		$('#faultyStatusTable > #dataList2').append(
				'<tr><th rowspan="2" style="text-align:center;">'+value.value+'</th>'
				+'<td><span>수량</td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_01_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_02_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_03_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_04_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_05_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_06_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_07_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_08_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_09_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_10_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_11_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_12_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_13_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_14_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_15_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_16_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_17_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_18_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_19_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_20_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_21_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_22_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_23_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_24_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_25_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_26_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_27_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_28_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_29_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_30_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_31_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_sum_mon"></td></tr>'
				+'<td><span>점유율</td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_01_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_02_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_03_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_04_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_05_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_06_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_07_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_08_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_09_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_10_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_11_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_12_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_13_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_14_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_15_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_16_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_17_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_18_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_19_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_20_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_21_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_22_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_23_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_24_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_25_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_26_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_27_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_28_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_29_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_30_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_share_31_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_sum_mon"></td></tr>'
		 	)
	});
		
		

	//TOTAL불량수량 TB
	faultyTypeTotalTB = '<tr><th colspan="2" style="text-align:center;">TOTAL 불량수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_01_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_02_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_03_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_04_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_05_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_06_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_07_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_08_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_09_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_10_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_11_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_12_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_13_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_14_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_15_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_16_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_17_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_18_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_19_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_20_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_21_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_22_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_23_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_24_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_25_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_26_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_27_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_28_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_29_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_30_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_31_date"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_sum_mon"></td></tr>'

		
	//원인별 불량누적현황 테이블
	$('#faultyStatusTable > #dataList2').append(faultyTypeTotalTB);
	

	//품질경향분석
	function a(){	
		$.ajax({
			url : "<c:url value='qm/qualityTrendAnlyDayList'/>",
			type : "GET",
			data : {
				'qcObjYear' : year,
				'qcObjMon' : mon,
				'mainGubun' : function(){return '001';},
				'objGubun' : function(){return '001';},
			},
			success : function(res){
				let data = res.data;

				console.log(data);
				$.each(data,function(key,value){
						$.each(value,function(key2,value2){

							value2Transf = (key2=="preInWhsQty"||key2=="pairCnt"||key2=="faultyCnt")?addCommas(value2):value2;
							$('#'+key2+"_"+value.qcObjDate+"_date").text(value2Transf);
							$('#'+key2+"_"+value.qcObjDate+"_date").val(value2Transf);
		
							switch(key2){
							case "preInWhsQty" : 
								preInWhsQtySum+=parseInt(value2);
								break;
							case "pairCnt" : 
								pairCntSum+=parseInt(value2);
								break;
							case "faultyCnt" : 
								faultyCntSum+=parseFloat(value2);
								break;
							case "faultyRate" : 
								faultyRateSum+=parseFloat(value2);
								break;
							case "targetRate" : 
								if(maxTargetRateSum < value2) {
									maxTargetRateSum = value2;
								}
								targetRateSum+=parseFloat(value2);
								break;
							}

							console.log('입고수량누계:'+preInWhsQtySum);

							//누적불량율
							$("#faultyTotal_"+value.qcObjMon+"_mon").text(parseFloat(((faultyCntSum/(preInWhsQtySum==0?1:preInWhsQtySum))*100).toFixed(3))+'%');
							
						});
					});

				//쿼리로 못하겠어서 강제 일치화
				$('[name=targetRate]').text(maxTargetRateSum + '%');
				
				//*********누계**********
				
				//입고수량 누계
				$('#preInWhsQty_sum_date').text(addCommas(uncomma(preInWhsQtySum)));
	
				//합격수량 누계
				$('#pairCnt_sum_date').text(addCommas(uncomma(pairCntSum)));
	
				//불합격수량 누계
				$('#faultyCnt_sum_date').text(addCommas(uncomma(faultyCntSum)));
	
				var faultyCntVal = parseFloat($('#faultyCnt_sum_date').text());
				var preInWhsQtyVal = parseFloat(uncomma($('#preInWhsQty_sum_date').text()))==0?1:parseFloat(uncomma($('#preInWhsQty_sum_date').text()));
	
				//불량율(%) 누계
				$('#faultyRate_sum_date').text((faultyCntVal/preInWhsQtyVal).toFixed(3)+"%");  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림
	
				//목표(%) 누계
				$('#targetRate_sum_date').text(maxTargetRateSum + '%');

				var achvRateVal = parseFloat($('#faultyRate_sum_date').text())<=0.2?
						"100%":((parseFloat($('#targetRate_sum_date').text())/parseFloat($('#faultyRate_sum_date').text()))).toFixed(3);

				//달성율(%) 누계
				$('#achvRate_sum_date').text(achvRateVal + '%');

				//누적불량율 누계
				for(var i=0; i<31; i++){
					var faultyTotalMonVal = i<9?$('#faultyTotal_0'+(i+1)+'_date').text():$('#faultyTotal_'+(i+1)+'_date').text();
					
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}
				
				$('#faultyTotal_sum_date').text(faultyTotalVal.toFixed(3)+'%');

				//*********Chart.js**********
				//불량율 배열
				for(var i=0; i<31; i++){
					
					var faultyRateArrVal = i<9?$('#faultyRate_0'+(i+1)+'_date').text():$('#faultyRate_'+(i+1)+'_date').text();
					
					faultyRateArr[i] = faultyRateArrVal==""?parseFloat("0"):parseFloat(faultyRateArrVal);
				} 
	
				//목표 배열
				for(var i=0; i<31; i++){
					if (faultyRateArr[i] == 0) {
						targetTotalArr[i] = Number('·');
					} else {
						targetTotalArr[i] = maxTargetRateSum;
					}
				} 
				
				setChart(faultyRateArr,targetTotalArr);

			}
		}); 
	};

	
	//원인별 불량누적현황 조회
	function b(){	
		$.ajax({
			url : "<c:url value='qm/faultyStatusList' />",
			type : "GET",
			data : {
				'faultyTypeDate' : year
			},
			success : function(res){
				let data = res.data;

//				console.log(data)
				$.each(data,function(key,value){
					$('#'+value.faultyTypeSeq+"_quantity_"+value.faultyTypeDate.substring(4,6)+"_mon").text(addCommas(value.faultyTypeQty));
					$('#'+value.faultyTypeSeq+"_share_"+value.faultyTypeDate.substring(4,6)+"_mon").text(value.faultyTypeRate);

					chartDataValue[key]=value.faultyTypeNm;

					
					
					//TOTAL 불량수량
					$('#faultyTypeTotal_'+value.faultyTypeDate.substring(4,6)+'_mon').text(addCommas(uncomma(value.faultyTypeTotal)));
					
				});

				for(var i=0; i<9; i++) {
					if($('#faultyTypeTotal_0'+(i+1)+'_mon').text() == "") {
						$('#faultyTypeTotal_0'+(i+1)+'_mon').text("0");
					}
				} 

				for(var i=9; i<12; i++) {
					if($('#faultyTypeTotal_'+(i+1)+'_mon').text() == "") {
						$('#faultyTypeTotal_'+(i+1)+'_mon').text("0");
					}
				} 

				//수량 누계
				for(var j=1; j<=count; j++){
					for(var i=0; i<12; i++){

						quantityValue = i<9?$('#'+j+'_quantity_0'+(i+1)+'_mon').text():$('#'+j+'_quantity_'+(i+1)+'_mon').text();
						
						quantityValue2 = quantityValue==""?"0":uncomma(quantityValue);
						quantityTotalValue += parseInt(quantityValue2);
					}
					$('#'+j+'_quantity_sum_mon').text(addCommas(quantityTotalValue)); 
					quantityTotalValue=0;
				}
				
				//점유율 누계
				for(var j=1; j<=count; j++){
					for(var i=0; i<12; i++){
						shareValue = i<9?$('#'+j+'_share_0'+(i+1)+'_mon').text():$('#'+j+'_share_'+(i+1)+'_mon').text();
						shareTotalValue += parseFloat(shareValue);
					}
					$('#'+j+'_share_sum_mon').text(shareTotalValue.toFixed(2)+'%');
					shareTotalValue=0;
				}
				
				
				//누적불량율 누계 
				for(var i=0; i<12; i++){
					var faultyTypeTotalMonVal = i<9?$('#faultyTypeTotal_0'+(i+1)+'_mon').text():$('#faultyTypeTotal_'+(i+1)+'_mon').text();

					faultyTypeTotalMonVal = faultyTypeTotalMonVal==""?"0":uncomma(faultyTypeTotalMonVal);
					faultyTypeTotalVal += parseFloat(faultyTypeTotalMonVal);
				}

				$('#faultyTypeTotal_sum_mon').text(addCommas(faultyTypeTotalVal));
				
				
				//*********Chart.js**********
				
				for(var i=0; i<count; i++){
					for(var j=0; j<12; j++){
						arr[i][j] = j<9?uncomma($('#'+(i+1)+'_quantity_0'+(j+1)+'_mon').text()):uncomma($('#'+(i+1)+'_quantity_'+(j+1)+'_mon').text());
						
					} 
				}
				g마켓
				setChart2(chartDataValue,arr);

			}
		}); 
	
	}; 

	//***********************Chart.js**************************
	function setChart(arr1,arr2){
		
		window.lineChart = new Chart(ctx,{
			type : 'bar',
			data : {
				labels:["1일","2일","3일","4일","5일","6일","7일","8일","9일","10일"
					,"11일","12일","13일","14일","15일","16일","17일","18일","19일","20일"
					,"21일","22일","23일","24일","25일","26일","27일","28일","29일","30일","31일"],
				datasets: [
					{
						type : 'line',
						label:'목표(%)',
						data  : arr2,
						backgroundColor:'#E44034',
						borderColor:'#E44034',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						type : 'bar',
						label:'불량율(%)',
						data  : arr1,
						backgroundColor:'#60BA45',
						borderColor:'#60BA45',
						borderWidth:4,
						//lineTension:0,
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
							max:20,
							min:0,
							stepSize:2,
							fontColor: '#FFF6F5',
							fontSize: 14,
							callback: function(value, index, ticks) {
		                        return value + '%';
		                    }
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

	function setChart2(labelData,arr){
		
		window.barChart = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:"외관",
						data  : arr[0],
						backgroundColor:'#CEF6F5',
						borderColor:'#CEF6F5',
						fill :false
					},
					{
						label:"물성",
						data  : arr[1],
						backgroundColor:'#81F7F3',
						borderColor:'#81F7F3',
						fill :false
					},
					{
						label:"포장",
						data  : arr[2],
						backgroundColor:'#5882FA',
						borderColor:'#5882FA',
					},
					{
						label:"혼입",
						data  : arr[3],
						backgroundColor:'#CECEF6',
						borderColor:'#CECEF6',
					},
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
						//stacked:true,
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
						//stacked:true,
						ticks:{
							max:3000,
							min:0,
							stepSize:300,
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
						fontSize:13
					},
					display:true,
					//position :''
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
	    return x.replace(/,/g, '');
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
      var mon = dt.getMonth()+1;
      
	  // 발행 뿌려주기
      $("#YEAR").append("<option value=''>년도</option>");
      // 올해 기준으로 -1년부터 +5년을 보여준다.
      for(var y = (com_year-1); y <= (com_year+5); y++){
          $("#YEAR").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '년' +'</option>');
      }

   	  // 발행 뿌려주기
      $("#MON").append("<option value=''>월</option>");
      for(var i=1; i<=12; i++){
      	$("#MON").append('<option value="'+(i<10?'0'+i:i)+'" '+(i==mon?'selected':'')+'>'+i+'월'+'</option>'); 
  	  }
  }
</script>

</body>
</html>
