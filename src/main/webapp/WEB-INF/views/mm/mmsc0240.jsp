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
				<li class="breadcrumb-item active">수입검사현황(월별) (후가공)</li>
			</ol>
		</nav>
	</header>
	<div class="pb-2" id="yearGubun"></div>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
		
			<!------------ left top ----------->
			<div class="list-half col-7" id="">
				<div class="card">
					<div class="row">
						<h6 class="list-half-tit col-11">불량율 현황(단위 : %)</h6>
						<button type="button" class="btn btn-primary float-right mr-2" id="btnObject">목표관리</button>
					</div>
					<div class="card-body">
						<div class="chart-container1" style="width:auto; height:299px; border:1px solid #ddd; 
							padding:10px; border-radius:8px; background-color: #2C2B40; ">
							<canvas id="line-chart"></canvas>
						</div>
				 	</div>
				</div>
			</div>
			<!------------ right top ----------->
			<div class="list-half col-5" id="">
				<div class="card">
				 <h6 class="list-half-tit">누적 유형별 점유율 (단위 : %)</h6>
				 <div class="card-body">
				    <!-- 컨텐츠 영역 -->
				    <div class="chart-container1" style="width:auto; height:299px; border:1px solid #ddd; 
						padding:10px; border-radius:8px; background-color: #2C2B40; ">
						<canvas id="line-chart2"></canvas>
					</div>
				 </div>
				</div>
			</div>
			<!------------ left bottom ----------->
			<div class="list-half left-sidebar-fix col-7" id="left-list">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="inspectMonitorTable" class="table table-bordered table-striped">
							<colgroup>
								<col width="6%">
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
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th></th>
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
							<tbody id="dataList"></tbody>
						</table>
					</div>
				</div>
			</div>
			<!--=============== right list half ===============-->
			<div class="list-half col-5 p-0" id="">	
			   <!-- 오른쪽 half중 top -->		
			   <div class="list-half-bot-150" id="">
			  	  <div class="card p-0">
				   <div class="card-body">
				    <!-- 컨텐츠 영역 -->
				    <table id="inspectAccumMonitorTable" class="table table-bordered">
						<%-- <colgroup>
                            <col width="10%">
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                            <col width="15%">
                        </colgroup> --%>
						<thead class="thead-light">
						<tr>
							<th>불량항목</th>
							<c:forEach var="faultyType" items="${faultyTypeList}" varStatus="status">
								<th class="text-center">${faultyType.faultyTypeNm}</th>
							</c:forEach>
						</tr>
						</thead>
						<tbody class="thead-light" id="dataList"></tbody>
					</table>
				   </div>
				  </div>
			   </div>	
			   <!-- 오른쪽 half중 bottom -->	
			    <div class="list-half-bot-240" id="">
				  <div class="card">
				   <h6 class="list-half-tit">주요 중점 관리 사항</h6>
				   <div class="">
				   <div class="card-body col-sm-12 p-1 mb-2">
					    <button type="button" class="btn btn-primary float-right mr-1 d-none"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnSaveConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-warning float-right mr-1 "
							id="btnDel">삭제</button>
						<button class="btn btn-warning d-none"
							id="btnDelConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnEdit">수정</button>
						<button class="btn btn-primary d-none" id="btnEditConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">추가</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<div class="table-responsive">
						<table id="monPriManageAdmTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
							<thead class="thead-light">
								<tr>
								  <th>순번</th>
								  <th>내용</th>
								</tr>
							</thead>
							<tbody class="thead-light" id="">
							</tbody>
						</table>
					</div>
				   </div>
				  </div>
			   </div>
			</div>
			<!--======================== /left-list ========================-->
		</div>
	</div>
</div>

<!-- Modal Start-->
<div class="modal fade" id="objectivePopupModal" tabindex="-1"
	role="dialog" aria-labelledby="objectivePopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document"
		style="min-width: 1500px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="objectivePopupLabel">목표관리</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form">
					<div class="table-responsive">
						<table id="objectivePopupTable"
							class="table table-sm table-bordered">
							<thead class="thead-light">
								<tr>
									<th>KPI</th>
									<th>가중치</th>
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
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnObjectSave">저장</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->

<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0240";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사현황(월별) (후가공)");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var year = serverDateTo.substring(0,4);
	var serverDate = serverDateTo.substring(0,4);
	
	var preInWhsQtyTB;
	var faultyCntTB;
	var faultyRateTB;
	var targetRateTB;
	
	var value2Transf;
	var preInWhsQtySum=0;
	var faultyCntSum=0;
	var faultyRateSum=0;
	var targetRateSum=0;
	let achvRateSum=0;
	var faultyTotalVal=0;
	var quantityTotalValue=0;
	var quantityValue=0;
	var quantityValue2=0;
	var faultyTotalMonVal2 = 0;
	
	var faultyRateArr = [];
	var targetTotalArr =[];
	var faultyTypeRateArr=[];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');
	var count = "${faultyTypeCount}";

	//공통코드 처리 시작

	var inspectDesc = new Array(); //불량유형
	<c:forEach items="${inspectDesc}" var="info">
	var json = new Object();
	json.baseCd = "${info.etc2}";
	json.baseNm = "${info.baseInfoNm}";
	inspectDesc.push(json);
	</c:forEach>
	
	var kpiCode = new Array(); // kpi
	<c:forEach items="${kpiCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	kpiCode.push(json1);
	</c:forEach>

	var faultyTypeQtyCode = new Array(); //불량수량
	var faultyTypeRateCode = new Array(); //불량점유율

	
	var faultyTypeArr = new Array(); //불량유형
	<c:forEach items="${faultyTypeList}" var="info">
	faultyTypeArr["${info.faultyTypeSeq}"] = "${info.faultyTypeNm}";
	</c:forEach>

	//공통코드 처리 종료  
	
	var html1 = '<div class="row ml-4 mt-1 mb-0">';
	html1 += '<div class="form-group input-sub m-0 mr-1 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	$('#yearGubun').html(html1);

	$('#btnRetv').on('click', function() {
		year = $('#YEAR option:selected').val();

		//품질경향분석
		preInWhsQtySum=0;
		pairCntSum=0;
		faultyCntSum=0;
		faultyRateSum=0;
		targetRateSum=0;
		faultyTotalVal=0;
		achvRateSum=0;
		
		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		faultyRateTotalVal=0;
		//faultyTypeRateArr=[];
		
		$('#inspectAccumMonitorTable > #dataList > tr').remove();
		
		$('.all_td').text('0');
		a();
		b();
		c();
		
	});

	
	//품질경향분석 조회
	$(document).ready(function (){
		$('.all_td').text('0');
		a();
		b();
		c();
	});
	
	

	//월 주요 중점 관리사항 목록조회
	let monPriManageAdmTable = $('#monPriManageAdmTable').DataTable({
		dom :'',
		language : lang_kor,
		lengthChange : false,	
		destroy : true,	
		paging : false,
		searching : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="qm/monPriManageAdmList"/>',
			type : 'GET',
			data : {
					'monPriType' : '001'
				},
		},
		columns : [ 
			{
				render: function(data, type, row, meta) {	
					return meta.row+1;
	    		}
				
			},
			{data 	: 'monPriCont',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control" style="border:none; max-width:100%;" name="monPriCont" value="'+data+'" disabled>';		
					} else{
						return '<input type="text" class="form-control" style="max-width:100%;" name="monPriCont" value="">';
					}	
				}
			}, 
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [ {"targets" :"_all","className" : "text-center"
		}],
	});

	$('#monPriManageAdmTable tbody').on('click','tr',function(e){
		sideView = "edit";
    	
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#monPriManageAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#monPriManageAdmTable').DataTable().row(this).index();
	});
	


	//추가버튼 클릭시 
	$('#btnAdd').on('click',function(){
		$('#monPriManageAdmTable').DataTable().row.add({}).draw(false);
		$('#btnSave').removeClass('d-none');
	});

	//수정버튼 클릭시 
	$('#btnEdit').on('click',function(){

		if(sideView!="edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		$('input[name=monPriCont]').eq(tableIdx).attr('disabled',false);
	});

	//삭제버튼 클릭시 
	$('#btnDel').on('click',function(){
		if(sideView!="edit"){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		//삭제 하고 저장하는 식으로 처리
		$('#monPriManageAdmTable').DataTable().rows(tableIdx).remove().draw();
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		var check=true;
		var dataArray = new Array();
		
		if ($("input[name=monPriCont]").val() == "") {
			toastr.warning('내용을 입력해주세요.');
			$("input[name=monPriCont]").focus();
			return false;
		}

		$('#monPriManageAdmTable tbody tr').each(function(index,item){
			
			var rowData = new Object();
			
			rowData.monPriType = '001';
			rowData.monPriCont = $(this).find('td input[name=monPriCont]').val();

			dataArray.push(rowData);
	        console.log(rowData);
			
		});

		$.ajax({
			url : '<c:url value="qm/monPriManageAdmCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {

			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#monPriManageAdmTable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					$('#btnEdit').attr('disabled', false);

					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else if (sideView == "add") {
						toastr.success('등록되었습니다.');
					}

					sideView = 'edit';
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
	
	//불량율 현황
	
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
		+'<td class="text-right"><span class="kg" id=""></td></tr>'
		
	//입고수량 TB
	preInWhsQtyTB = '<tr><th style="text-align:center;">입고수량</th>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_sum_mon"></td></tr>'

	//불량수량 TB
	faultyQtyTB = '<tr><th style="text-align:center;">불량수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_sum_mon"></td></tr>'
		
	//불량율(%) TB
	faultyRateTB = '<tr><th style="text-align:center;">불량율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_sum_mon"></td></tr>'

	//목표(%) TB
	targetRateTB = '<tr><th style="text-align:center;">목표(%)</th>'
		+'<td class="text-right"><span class="all_td" id="targetRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_sum_mon"></td></tr>'

	//불량누계 TB
	faultyTotalTB = '<tr><th style="text-align:center;">불량누계</th>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_sum_mon"></td></tr>'


	//수입검사현황(월별) (후가공) 테이블	
	$('#inspectMonitorTable > #dataList').append(preInWhsQtyTB+faultyQtyTB+faultyRateTB+targetRateTB)	
	
	
/* 	$.each(inspectDesc,function(key,value){
		
		$('#inspectMonitorTable > #dataList').append(
			'<tr><th style="text-align:center;">'+value.baseNm+'</th>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_01_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_02_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_03_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_04_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_05_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_06_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_07_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_08_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_09_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_10_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_11_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_12_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.baseCd+'_quantity_sum_mon"></td></tr>'
	 	)
	}); */

		
// 	$('#inspectMonitorTable > #dataList').append(faultyTotalTB);

	//달성률
	achvRateTB = '<tr><th  style="text-align:center;">달성률(%)</th>'
		+'<td class="text-right"><span class="all_td" id="achvRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_sum_mon"></td>';

	$('#inspectMonitorTable > #dataList').append(achvRateTB);
	
	//품질경향분석 조회
	function a(){
		$.ajax({
			url : "<c:url value='qm/qualityTrendAnlyList' />",
			type : "GET",
			data : {
				'qcObjYear' : year,
				'mainGubun' : function(){return '002';},
				'objGubun' : function(){return '003';},
			},
			success : function(res){
				let data = res.data;

				$.each(data,function(key,value){
					$.each(value,function(key2,value2){
						
						value2Transf = (key2=="preInWhsQty"||key2=="faultyCnt")?addCommas(value2):value2;
						$('#'+key2+"_"+value.objMonth+"_mon").text(value2Transf);
	
						switch(key2){
						case "preInWhsQty" : 
							preInWhsQtySum+=parseInt(value2);
							break;
						case "faultyCnt" : 
							faultyCntSum+=parseFloat(value2);
							break;
						case "faultyRate" : 
							faultyRateSum+=parseFloat(value2);
							break;
						case "targetRate" : 
							$('#'+key2+"_"+value.objMonth+"_mon").text(value2Transf + "%");
							targetRateSum+=parseFloat(value2);
							break;
						case "achvRate" : 
							achvRateSum+=parseFloat(value2);
							break;
						}
						

					});
				});

				//*********누계**********
				
				//입고수량 누계
				$('#preInWhsQty_sum_mon').text(addCommas(uncomma(preInWhsQtySum)));
	
				//불합격수량 누계
				$('#faultyCnt_sum_mon').text(addCommas(uncomma(faultyCntSum)));
	
				var faultyCntVal = parseFloat($('#faultyCnt_sum_mon').text());
				var preInWhsQtyVal = parseFloat(uncomma($('#preInWhsQty_sum_mon').text()))==0?1:parseFloat(uncomma($('#preInWhsQty_sum_mon').text()));
	
				//불량율(%) 누계
				$('#faultyRate_sum_mon').text((faultyCntVal/preInWhsQtyVal*100).toFixed(3)+"%");  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림
	
				//목표(%) 누계
				$('#targetRate_sum_mon').text((targetRateSum==0?0:targetRateSum /data.length).toFixed(3) + "%");

				//달성률(%) 누계
				$('#achvRate_sum_mon').text((achvRateSum==0?0:achvRateSum /data.length).toFixed(3) + "%");

				//*********Chart.js**********
				//불량율 배열
				for(var i=0; i<12; i++){
					faultyRateArr[i] = $('#faultyRate_'+(i+1)+'_mon').length==0?parseFloat($('#faultyRate_0'+(i+1)+'_mon').text()):parseFloat($('#faultyRate_'+(i+1)+'_mon').text());
				} 

				//목표 배열
				for(var i=0; i<12; i++){
					targetTotalArr[i] = $('#targetRate_'+(i+1)+'_mon').length==0?parseFloat($('#targetRate_0'+(i+1)+'_mon').text()):parseFloat($('#targetRate_'+(i+1)+'_mon').text());
				} 
				
				setChart(faultyRateArr,targetTotalArr);
				
			}
		}); 
	};

	//원인별 불량누적현황 조회
	function c(){	
		$.ajax({
			url : "<c:url value='qm/faultyStatusList' />",
			type : "GET",
			data : {
				'faultyTypeDate' : year
				},
			success : function(res){
				let data = res.data;

				$.each(data,function(key,value){
					$('#'+value.faultyTypeSeq+"_quantity_"+value.faultyTypeDate.substring(4,6)+"_mon").text(addCommas(value.faultyTypeQty));

					//TOTAL 불량수량
					$('#faultyTotal_'+value.faultyTypeDate.substring(4,6)+'_mon').text(addCommas(uncomma(value.faultyTypeTotal)));
				});

				//수량 누계
				for(var j=0; j<count; j++){
					for(var i=0; i<12; i++){
						quantityValue2 = i<9?$('#'+j+'_quantity_0'+(i+1)+'_mon').text():$('#'+j+'_quantity_'+(i+1)+'_mon').text();
						quantityValue = quantityValue2==""?"0":uncomma(quantityValue2);
						quantityTotalValue += parseInt(quantityValue);
					}
					$('#'+j+'_quantity_sum_mon').text(addCommas(quantityTotalValue));
					quantityTotalValue=0;
					
				}
				
				//불량수량 누계
				for(var i=1; i<13; i++){  
					faultyTotalMonVal2 = i<9?$('#faultyTotal_0'+i+'_mon').text():$('#faultyTotal_'+i+'_mon').text();
					var faultyTotalMonVal = faultyTotalMonVal2==""?"0":uncomma(faultyTotalMonVal2);
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}

				$('#faultyTotal_sum_mon').text(addCommas(faultyTotalVal));


			}
		}); 
	};

	

	//누적 유형별 점유율
	function b(){
		$.ajax({
			url  : "<c:url value='mm/faultyTypeList'/>",
			type : "GET",
			data : {
				'faultyTypeDate' : year
			},
			success  : function(res){
				let data = res.data;
				var html="";
				var html2="";
				
				faultyTypeQtyCode = [];
				faultyTypeRateCode = [];

				if(res.result=="ok"){
					for(var i=0; i<res.listSize; i++){
						var json = new Object();
						
						json.key = data[i].faultyTypeSeq;
						json.value = data[i].faultyTypeQty;
						faultyTypeQtyCode.push(json);
					}

					for(var i=0; i<res.listSize; i++){
						var json2 = new Object();
						
						json2.key = data[i].faultyTypeSeq;
						json2.value = data[i].faultyTypeRate;
						faultyTypeRateCode.push(json2);
					}

					
					//누적 유형별 점유율 불량수량
					$.each(faultyTypeQtyCode,function(key,value){
						html += '<td class="text-right"><span id="'+value.key+'_qty">'+addCommas(value.value)+'</td>';
					});

					//누적 유형별 점유율 불량점유율
					$.each(faultyTypeRateCode,function(key,value){
						html2 += '<td class="text-right"><span  id="'+value.key+'_rate">'+value.value+'%'+'</td>';
					});
				}else{
					var colspanCount = $('#inspectAccumMonitorTable thead th').length-1;
					
					html += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
					html2 += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
				}
				

				$('#inspectAccumMonitorTable > #dataList').append(
						'<tr><th style="text-align:center;">불량수량</th>'
						+ html
						+'</tr>'
						+'<tr><th style="text-align:center;">불량점유율</th>'
						+ html2
						+'</tr>');


				
				//*********Chart.js**********
				//점유율 배열
				for(var i=0; i<count; i++){
					faultyTypeRateArr[i] = $('#'+i+'_rate').text()==""?parseFloat("0"):parseFloat($('#'+i+'_rate').text());
				} 

				setChart2(faultyTypeRateArr);
				
			}
		})
	}

	
	
	//***********************Chart.js**************************
	function setChart(arr1,arr2){
		
		var lineChart = new Chart(ctx,{
			type : 'bar',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
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

	function setChart2(arr){
		
		var lineChart2 = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:[faultyTypeArr[0],faultyTypeArr[1],faultyTypeArr[2],faultyTypeArr[3],faultyTypeArr[4],faultyTypeArr[5],faultyTypeArr[6]],
				datasets: [
					{
						type : 'bar',
						label:'점유율',
						data  : arr,
						backgroundColor:'#0DD186',
						borderColor:'#0DD186',
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
							fontSize: 11
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						ticks:{
							max:100,
							min:0,
							stepSize:20,
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
						fontColor:'#FFFFFF',
						fontSize:14
					},
					display:true
				}
			}
		});
		
	}
	
	//***********************Chart.js**************************
	
	//입력모달조회
	let objectivePopupTable = $('#objectivePopupTable').DataTable({
		language : lang_kor,
		paging : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bs/objectiveAdmReadDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDate;},
				'objGubun' : function(){return '003';},
			}
		},
		rowId : '',
		columns : [
			{
				data : 'kpi',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspectDesc, 'kpi',data, row, meta);
				}
			},
			{
				data : 'weight',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="weight" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="weight" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'jan',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="jan" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="jan" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'feb',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="feb" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="feb" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'mar',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="mar" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="mar" value="" style="max-width:100%;"/>';
					}
				}
			},

			{
				data : 'apr',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="apr" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="apr" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'may',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="may" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="may" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'jun',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="jun" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="jun" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'jul',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="jul" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="jul" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'aug',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="aug" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="aug" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'sep',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="sep" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="sep" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'oct',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="oct" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="oct" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'nov',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="nov" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="nov" value="" style="max-width:100%;"/>';
					}
				}
			},
			{
				data : 'dec',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input class="form-control text-right" type="text" name="dec" value="'
								+ data
								+ '"style="max-width:100%;" disabled/>';
					} else {
						return '<input class="form-control text-right" type="text" name="dec" value="" style="max-width:100%;"/>';
					}
				}
			}
		],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {
			$('#objectivePopupTable select').attr('disabled',
					true);

		},

	});

	let html3 = '<div class="row">';
	html3 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html3 += '<select name="YEAR2" id="YEAR2" title="년도" class="select w80 col-12 custom-select"></select>';
	html3 += '</div>';
	html3 += '</div>';

	let html4 = '';
	html4 += '<button type="button" class="btn btn-warning float-right mr-2" id="btnRowDelete">삭제</button>';
	html4 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnObjectEdit">수정</button>';
	html4 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnRowAdd">추가</button>';
	
	$('#objectivePopupTable_length').html(html3);
	$('#objectivePopupTable_filter').html(html4);

	$('#YEAR2').on('change', function() {
		serverDate = $('#YEAR2 option:selected').val();
		$('#objectivePopupTable').DataTable().ajax.reload(function() {
		});
	});
	
	$('#btnObject').on('click', function() {
		$('#objectivePopupTable').DataTable().ajax.reload(function() {
		});
		$('#objectivePopupModal').modal('show');
	});

	$('#objectivePopupTable').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#objectivePopupTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	$('#btnObjectEdit').on('click', function() {
		$('#objectivePopupTable input[type=text]').attr('disabled', false);
		$('#objectivePopupTable select').attr('disabled', false);

	});

	$('#btnRowAdd').on('click', function() {
		if ($('#objectivePopupTable').DataTable().data().count() > inspectDesc.length - 1) {
			toastr.warning(inspectDesc.length + "개이상 추가하실수 없습니다.");
			return false;
		}
		$('#objectivePopupTable').DataTable().row.add({}).draw(false);
		$('#objectivePopupTable select').attr('disabled', false);
	});

	$('#btnRowDelete').on('click',function() {
		$('#objectivePopupTable').DataTable().rows('.selected').remove().draw(false);
	});

	$('#btnObjectSave').on('click',function() {
		var dataArray = new Array();
		var duplicateCheckArray = new Array();
		var check = true;

		if ($('#objectivePopupTable').DataTable().data()
				.count() == 0) {
			toastr.warning('목록을 추가해 주세요.');
			check = false;
			return false;
		}

		if ($('select[name=YEAR2] option:selected').val() == "") {
			toastr.warning('년도를 선택해주세요');
			check = false;
			return false;
		}
		
		$('#objectivePopupTable tbody tr').each(function() {
			if ($(this).find('td select[name=kpi] option:selected').val() == "") {
				toastr.warning('kpi를 선택해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=weight]').val() == "") {
				toastr.warning('가중치를 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=jan] ').val() == "") {
				toastr.warning('1월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=feb] ').val() == "") {
				toastr.warning('2월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=mar] ').val() == "") {
				toastr.warning('3월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=apr] ').val() == "") {
				toastr.warning('4월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=may] ').val() == "") {
				toastr.warning('5월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=jun] ').val() == "") {
				toastr.warning('6월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=jul] ').val() == "") {
				toastr.warning('7월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=aug] ').val() == "") {
				toastr.warning('8월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=sep] ').val() == "") {
				toastr.warning('9월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=oct] ').val() == "") {
				toastr.warning('10월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=nov] ').val() == "") {
				toastr.warning('11월을 입력해주세요');
				check = false;
				return false;
			}
			if ($(this).find('td input[name=dec] ').val() == "") {
				toastr.warning('12월을 입력해주세요');
				check = false;
				return false;
			}

			var rowData = new Object();

			rowData.kpi = $(this).find('td select[name=kpi] option:selected').val();
			rowData.weight = $(this).find('td input[name=weight]').val();
			rowData.jan = $(this).find('td input[name=jan]').val();
			rowData.feb = $(this).find('td input[name=feb]').val();
			rowData.mar = $(this).find('td input[name=mar]').val();
			rowData.apr = $(this).find('td input[name=apr]').val();
			rowData.may = $(this).find('td input[name=may]').val();
			rowData.jun = $(this).find('td input[name=jun]').val();
			rowData.jul = $(this).find('td input[name=jul]').val();
			rowData.aug = $(this).find('td input[name=aug]').val();
			rowData.sep = $(this).find('td input[name=sep]').val();
			rowData.oct = $(this).find('td input[name=oct]').val();
			rowData.nov = $(this).find('td input[name=nov]').val();
			rowData.dec = $(this).find('td input[name=dec]').val();
			rowData.objGubun = '001';
			rowData.objYear = $('#YEAR2 option:selected').val();

			dataArray.push(rowData);
			duplicateCheckArray.push($(this).find('td select[name=kpi] option:selected').val());

		});

		if (duplicateCheck(duplicateCheckArray) == false) {
			toastr.warning('중복된 kpi는 입력할 수 없습니다.');
			check = false;
			return false;
		}

		if (check == true) {
			if (dataArray.length == 0) {
				toastr.warning('목록에 정확한 값을 선택하거나 입력해 주세요.');
				check = false;
				return false;
			}
		}
		var url = '<c:url value="bs/objectiveAdmCreate"/>';

		if (check) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if (res.result == 'ok') {

						toastr.success('저장되었습니다.');

					} else if (res.result == 'fail') {
						toastr.error("저장에 실패했습니다.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#objectivePopupTable input[type=text]').attr('disabled', true);
					$('#objectivePopupTable select').attr('disabled', true);
					$('#objectivePopupTable').DataTable().ajax.reload(function() {});
					$('#objectiveAdmTable').DataTable().ajax.reload(function() {});
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}
	});

	function selectBoxHtml2(obj, id, sVal, row, meta) {
		//$('#'+ id).empty();
		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '"><option value="">선택</option>';
		//var shtml = '<select class="mySelect" data-col="' + meta.col + '" ><option value="">선택</option>';

		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm
						+ "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	function duplicateCheck(data) {
		const dataSet = new Set();
		var result = true;

		$.each(data, function(index, item) {
			dataSet.add(item);
		});

		if (dataSet.size != data.length) {
			result = false;
		}

		return result;
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
		// 올해 기준으로 -5년부터 +1년을 보여준다.
		for(var y = (com_year-5); y <= (com_year+1); y++){
			$("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
		}
		$("#YEAR").val(year).prop("selected", true);
		      
		$("#YEAR2").append("<option value=''>년도</option>");
		// 올해 기준으로 -5년부터 +1년을 보여준다.
		for(var y = (com_year-5); y <= (com_year+1); y++){
			$("#YEAR2").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
		}
		$("#YEAR2").val(year).prop("selected", true);
	}
</script>
</body>
</html>
