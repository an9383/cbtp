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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">생산계획관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive" style="height: 430px;">
						<table id="bizOrderTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>수주상세번호</th>
									<th>구분</th>
									<th>품명</th>
									<th class="text-center">주문수량</th>
									<th>납기일</th>
									<th>전달사항</th>
									<th>생산지연사유</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="card-body col-sm-12 p-2">
						<button type="button" class="btn btn-warning float-right mr-1"
							id="rowDelete" disabled>삭제</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnEdit">수정</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="rowAdd" disabled>추가</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<div class="table-responsive">
						<table id="workOrderTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="5%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="5%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>수주상세번호</th>
									<th>LOT번호</th>
									<th>구분</th>
									<th>품명(type)</th>
									<th>납기일</th>
									<th>생산예정일</th>
									<th>주문수량</th>
									<th>지시수량</th>
									<th>긴급여부</th>
									<th>재작업여부</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<button type="button" class="btn btn-primary float-right mr d-none"
						id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<%-- <div class="right-list right-sidebar right-sidebar-fix"
				id="rfSidenav" style="width: 35%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand2"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
					</div>
				</div>
				<div class="card-header card-tab mb-3">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">E-BOM</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">M-BOM</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<!--/오른쪽 등록 부분 상단 버튼 영역-->
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active show" id="tab1">
						<div class="card-body col-sm-12 p-1">
							<button type="button" class="btn btn-warning float-right mr-1" id="btnDel" disabled>삭제</button>
							<button class="btn btn-warning d-none" id="btnDelConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
							<button type="button" class="btn btn-danger float-right mr-1" id="btnAllDel" disabled>전체삭제</button>
							<button class="btn btn-warning d-none" id="btnAllDelConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
						</div>
						<div class="table-responsive">
							<table id="purchaseOrderBasicDtl" class="table table-bordered">
								<colgroup>
									<col width="5%">
									<col width="17%">
									<col width="23%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="10%">
									<col width="10%">
									<col width="9%">
								</colgroup>
								<thead>
									<tr>
										<th>
											<input type="checkbox" class="checkbox_sm" name="checkboxAll" id="checkboxAll" value="">
										</th>
										<th>CODE</th>
										<th>ITEM</th>
										<th>REV</th>
										<th>구분</th>
										<th>Type</th>
										<th>SPEC</th>
										<th>단위</th>
										<th>소모량</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab2">
						<div class="table-responsive">
							<table id="purchaseOrderDetailDtl" class="table table-bordered">
								<colgroup>
									<col width="15%">
									<col width="20%">
									<col width="20%">
									<col width="30%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>중공정명</th>
										<th class="text-center">소공정코드</th>
										<th>소공정명</th>
										<th>등록유무</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div> --%>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "wmsc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","생산계획관리"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";
	var index = 0;
	var contDtlNoVal = null;
	var contGubunVal = null;
	var itemNmVal = null;
	var itemCdVal = null;
	var itemRevVal = null;
	var etcDlVal = null;
	var workOrdNoVal = null;
	var dtlOrdCntVal = null;
	var lotNo = null;
	var ordDtlDesc = null;

	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
		console.log(activeTab);
	});

	var workEmerYnCode = new Array(); //단위
	<c:forEach items="${workEmerYnCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	//영업주문관리 목록조회(외부)
	let bizOrderTable = $('#bizOrderTable').DataTable({
		dom : "<'row'<'col-sm-5 col-md-3'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-2'i><'col-sm-12 col-md-5'p>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 10,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return rcvDateOutFromCal.replace(/-/g, '');
				},
				'endDate' : function() {
					return rcvDateOutToCal.replace(/-/g, '');
				}
			},
		},
		rowId : 'contNo',
		columns : [
				{
					data : 'contDtlNo'
				},
				{
					data : 'contGubunNm'
				},
				{
					data : 'itemNm'
				},
				{
					data : 'dtlOrdCnt'
				},
				{
					data : 'etcDl',
					render : function(data, type, row, meta) {
						var result = (data == null) ? ""
								: moment(data).format(
										"YYYY-MM-DD");
						return result;
					}
				}, 
				{data : 'etcDa'},
				{data : 'etcSd'}
				 ],
		columnDefs : [ {
			"targets" : [ 3 ],
			render : $.fn.dataTable.render.number(','),
			"className" : "text-right"
		}, {
			"className" : "text-center",
			"targets" : "_all"
		} ],
		order : [ [ 0, 'desc' ] ],
		buttons : [
			'copy',
			'excel',
			'print'
			]

	});

	//영업주문관리 외부 목록 클릭시
	$('#bizOrderTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');

		} else {
			$('#bizOrderTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
		sideView = 'edit';
		$('#btnSave').addClass('d-none');
		$('#rowAdd').attr('disabled', true);
		$('#rowDelete').attr('disabled', true);
		
		contDtlNoVal = bizOrderTable.row(this).data().contDtlNo;	//수주상세번호
		contGubunNmVal = bizOrderTable.row(this).data().contGubunNm;	//구분
		contGubunVal = bizOrderTable.row(this).data().contGubun;	//구분
		itemCdVal = bizOrderTable.row(this).data().itemCd;			//품명
		itemRevVal = bizOrderTable.row(this).data().itemRev;		//품명
		itemNmVal = bizOrderTable.row(this).data().itemNm;			//품명
		etcDlVal = bizOrderTable.row(this).data().etcDl;			//납기일
		dtlOrdCntVal = bizOrderTable.row(this).data().dtlOrdCnt;	//주문수량
		
		
		
		/* $.ajax({
			url : '<c:url value="/bs/bizOrderDtlRead"/>',
			type : 'GET',
			data : {
				'contDtlNo' : function() {
					return contDtlNo;
				}
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
					sideView = 'edit';

					$('#contDtlNo').val(data.contDtlNo);
					$('#contGubun').val(data.contGubun);
					$('#contGubunNm').val(data.contGubunNm);
					$('#itemNm').val(data.itemNm);
					$('#itemCd').val(data.itemCd);
					$('#itemRev').val(data.itemRev);
					$('#dtlOrdCnt').val(addCommas(data.dtlOrdCnt));
					//$('#workOrdQty').val(data.workOrdQty);
					$('#shipReqDate').val(moment(data.shipReqDate).format("YYYY-MM-DD"));	
					$('#etcDaContent').text(res.etcDaData);
					$('#etcSdContent').text(res.etcSdData);
				} else {
					toastr.error(res.message);
				}
			}
		}); */

		$('#workOrderTable').DataTable().ajax.reload(function() {});
		$('#workOrderDtlTable').DataTable().ajax.reload(function() {});

		$('#btnEdit').attr('disabled', false);

	});

	//작지테이블 
	let workOrderTable = $('#workOrderTable').DataTable({
		language : lang_kor,
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 5,
		//ordering: false,
		ajax : {
			url : '<c:url value="po/workOrderDataList"/>',
			type : 'GET',
			data : {

				'contDtlNo' : function() {
					return contDtlNoVal;
				}
			},
		},
		rowId : 'workOrdNo',
		columns : [
				{
					data : 'contDtlNo',
					render : function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '<input class="form-control" type="text" name="contDtlNo" value="'+contDtlNoVal+'" style="border:none; text-align:center" disabled/>';
						}
					}
				},
				{
					data : 'workOrdNo',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return '<input class="form-control" type="text" name="workOrdNo" style="max-width:100%; text-align:center;" placeholder="처리중..." disabled/>';
						}
					}
				},
				{
					data : 'itemGubunNm',
					render : function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '<input class="form-control" type="text" name="itemGubunNm" value="'+contGubunNmVal+'" style="border:none; text-align:center" disabled/>';
						}
					}
				},
				{
					data : 'itemNm',
					render : function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '<input class="form-control" type="text" name="itemNm" value="'+itemNmVal+'" style="border:none; text-align:center" disabled/>';
						}
					}
				},
				{
					data : 'dlvDate',
					render : function(data, type, row, meta) {
						if(data!=null){
							return  (data == null) ? "" : moment(data).format("YYYY-MM-DD");
						}else{
							return '<input class="form-control" type="text" name="itemNm" value="'+moment(etcDlVal).format('YYYY-MM-DD')+'" style="border:none; text-align:center" disabled/>';
						}
					}
				},
				{
					data : 'outputDate',
					render : function(data, type, row, meta) {
						var html = "";

						if (data != null) {
							html = '<div class="form-group input-sub m-0">';
							html += '<input class="form-control" type="text" id="outputDate'
									+ index
									+ '" value="'
									+ moment(data).format(
											"YYYY-MM-DD")
									+ '" name="outputDate" disabled>';
							html += '<button onclick="fnPopUpCalendar(outputDate'
									+ index
									+ ',outputDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
									+ index
									+ '" name="btnOutputDate" type="button" disabled>';
							html += '<span class="oi oi-calendar"></span></button>';
							html += '</div>';
							index++;

						} else {
							html = '<div class="form-group input-sub m-0">';
							html += '<input class="form-control" type="text" id="outputDate'+index+'" value="'+serverDate+'" name="outputDate" disabled/>';
							html += '<button onclick="fnPopUpCalendar(outputDate'
									+ index
									+ ',outputDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
									+ index
									+ '" name="btnOutputDate" type="button" >';
							html += '<span class="oi oi-calendar"></span></button>';
							html += '</div>';
							index++;
						}

						return html;

					}
				}, {
					data : 'dtlOrdCnt',
					render : function(data, type, row, meta) {
						if(data!=null){
							return addCommas(data);
						}else{
							return '<input class="form-control" type="text" name="dtlOrdCnt" value="'+addCommas(dtlOrdCntVal)+'" style="border:none; text-align:right;" disabled/>';
						}
					}
				}, {
					data : 'workOrdQty',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" name="workOrdQty" value="'
									+ addCommas(data)
									+ '"style="max-width:100%; text-align:right;" disabled/>';
						} else {
							return '<input class="form-control" type="text" name="workOrdQty" style="max-width:100%; text-align:right;" />';
						}
					}
				},
				{
					data : 'workEmerYn',
					render : function(data, type, row, meta) {
						var html;
						html = selectBoxHtml2(workEmerYnCode,'workEmerYn', data, row, meta);
						return html;
					}
				}, {
					data : 'reworkYn',
					render : function(data,type,row,meta){
						if(data=="Y"){
							return '재작업';
						}else{
							return '정상';
						}
					}
				}, {
					data : 'ordDesc',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return '<input class="form-control" type="text" name="ordDesc" style="max-width:100%;" disabled/>';
						}
					}
				},  ],
		columnDefs : [ 
			{"targets" : [ 6, 7 ], render : $.fn.dataTable.render.number(','), "className" : "text-right"}, 
			{"className" : "text-center", "targets" : "_all"}, 
		],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {

			var api = this.api();
			for(var i=0; i<api.data().count(); i++){
				if(api.row(i).data().reworkYn == "Y"){
					console.log(api.row(i).data().ordLotNo);
					$('#'+api.row(i).data().workOrdNo).addClass('bg-danger2');
				}else{
					$('#'+api.row(i).data().workOrdNo).removeClass('bg-danger2');
				}
			}

			$('#workOrderTable tbody tr').find('td select').attr('disabled', true);
			$('#workOrderTable tbody tr').find('td input[name=workOrdNo]').attr('disabled', true);
		},
	});


	//작지목록 클릭시
	$('#workOrderTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#workOrderTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		workOrdNoVal = workOrderTable.row(this).data().workOrdNo;
		$('#rowDelete').attr('disabled', false);
	});

	//작지상세 테이블 
	let workOrderDtlTable = $('#workOrderDtlTable').DataTable({
		language : lang_kor,
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 5,
		//ordering: false,
		ajax : {
			url : '<c:url value="po/workOrderDataList"/>',
			type : 'GET',
			data : {

				'contDtlNo' : function() {
					return contDtlNo;
				}
			},
		},
		rowId : 'ordLotNo',
		columns : [
				{
					data : 'workOrdNo',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" name="workOrdNo" value="'
									+ data
									+ '"style="max-width:100%;" disabled/>';
						} else {
							return '<input class="form-control" type="text" name="workOrdNo" style="max-width:100%; text-align:center;" placeholder="처리중..." disabled/>';
						}
					}
				},
				{
					data : 'ordLotNo',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" name="ordLotNo" value="'
									+ data
									+ '"style="max-width:100%;" disabled/>';
						} else {
							return '<input class="form-control" type="text" name="ordLotNo" style="max-width:100%; text-align:center;" placeholder="처리중..." disabled/>';
						}
					}
				},
				{
					data : 'outputDate',
					render : function(data, type, row, meta) {
						var html = "";

						if (data != null) {
							html = '<div class="form-group input-sub m-0">';
							html += '<input class="form-control" type="text" id="outputDate'
									+ index
									+ '" value="'
									+ moment(data).format(
											"YYYY-MM-DD")
									+ '" name="outputDate" disabled>';
							html += '<button onclick="fnPopUpCalendar(outputDate'
									+ index
									+ ',outputDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
									+ index
									+ '" name="btnOutputDate" type="button" disabled>';
							html += '<span class="oi oi-calendar"></span></button>';
							html += '</div>';
							index++;

						} else {
							html = '<div class="form-group input-sub m-0">';
							html += '<input class="form-control" type="text" id="outputDate'+index+'" value="'+serverDate+'" name="outputDate" disabled/>';
							html += '<button onclick="fnPopUpCalendar(outputDate'
									+ index
									+ ',outputDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
									+ index
									+ '" name="btnOutputDate" type="button" >';
							html += '<span class="oi oi-calendar"></span></button>';
							html += '</div>';
							index++;
						}

						return html;

					}
				},
				{
					data : 'workOrdQty',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" name="workOrdQty" value="'
									+ addCommas(data)
									+ '"style="max-width:100%; text-align:right;" disabled/>';
						} else {
							return '<input class="form-control" type="text" name="workOrdQty" style="max-width:100%; text-align:right;" />';
						}
					}
				},
				{
					data : 'workEmerYn',
					render : function(data, type, row, meta) {
						var html;
						html = selectBoxHtml2(workEmerYnCode,
								'workEmerYn', data, row, meta);
						return html;
					}
				},
				{
					data : 'reworkYn',
					render : function(data, type, row, meta) {
						if(data=="Y"){
							return '재작업';
						}else{
							return '정상';
						}
					}
				},
				{
					data : 'ordDesc',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" name="ordDesc" value="'
									+ data
									+ '"style="max-width:100%;" disabled/>';
						} else {
							return '<input class="form-control" type="text" name="ordDesc" style="max-width:100%;" disabled/>';
						}
					}
				}, ],
		columnDefs : [ {
			"className" : "text-center",
			"targets" : "_all"
		}, ],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {
			$('#workOrderDtlTable tbody tr').find('td select').attr('disabled', true);
			$('#workOrderDtlTable tbody tr').find('td input[name=workOrdNo]').attr('disabled', true);
		},
	});

	//작지상세테이블 선택시
	$('#workOrderDtlTable tbody').on('click','tr',
	function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');

		} else {
			$('#workOrderDtlTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
		
	});

	//영업주문관리(외부 일자)
	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutFrom" name="rcvDateOutFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateOutFrom,rcvDateOutFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutTo" name="rcvDateOutTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateOutTo,rcvDateOutTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnOutRetv">조회</button>'
	html1 += '</div>';

	$('#bizOrderTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	$('#btnOutRetv').on('click', function() {
		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
		rcvDateOutToCal = $('#rcvDateOutTo').val();

		$('#bizOrderTable').DataTable().ajax.reload(function() {
		});
		$('#workOrderTable').DataTable().clear().draw();
		$('#form').each(function() {
			this.reset();
		});

	});

	//수정버튼 클릭시
	$('#btnEdit').on('click',function() {
		if (sideView != "edit") {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		//화면처리				
		$('#rowAdd').attr('disabled', false);
		$('#rowDelete').attr('disabled', true);
		$('#workOrderTable tbody tr').find('input[name=ordDesc] ').attr('disabled', false);
		$('#workOrderTable tbody tr').find('input[name=workOrdQty] ').attr('disabled', false);
		$('#workOrderTable tbody tr').find('td button').attr('disabled', false);
		$('#workOrderTable tbody tr').find('td select').attr('disabled', false);
		$('#btnSave').removeClass('d-none');

		sideView = "edit"
	});

	// 열추가
	$('#rowAdd').on('click',function() {

		$('#workOrderTable').DataTable().row.add({"workEmerYn" : "002"}).draw(false);
		$('#workOrderTable tbody tr').find('td select').attr('disabled', false);
		$('#workOrderTable tbody tr').find('td input[name=ordDesc]').attr('disabled', false);

		$('#btnSave').removeClass('d-none');

	});

	// 열삭제
	$('#rowDelete').on('click',function() {

		//삭제여부 판단
		$.ajax({
			url : '<c:url value="po/workOrderAdmDelete"/>',
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNoVal
			},
			success : function(res) {
				if (res.result == "ok") {
					toastr.success("삭제되었습니다.");
					$('#workOrderTable').DataTable().rows('.selected').remove().draw(false);
					//$('#workOrderTable').DataTable().ajax.reload(function(){});

				} else if (res.result == "exist") {
					toastr.error("이미 작업지시에 들어간 작지번호입니다.");
				} else {
					toastr.error(res.message);
				}
			}
		});

	});

	$('#btnSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
		var workOrdQty = 0;
		if (workOrderTable.data().count() == 0) {
			toastr.warning('라인을 추가해주세요');
			$('#rowAdd').focus();
			check = false;
			return false;
		}

		$('#workOrderTable tbody tr').each(
		function(index, item) {
			if ($(this).find('td input').eq(4).val() == "") {
				toastr.warning('생산예정일을 입력해주세요.');
				check = false;
				return false;
			}
			if ($(this).find('td input').eq(6).val() == "") {
				toastr.warning('지시수량을 입력해주세요.');
				check = false;
				return false;
			}

			var rowData = new Object();

			rowData.contDtlNo = contDtlNoVal;
			rowData.itemCd = itemCdVal;
			rowData.itemGubun = contGubunVal;
			rowData.itemRev = itemRevVal;
			rowData.dlvDate = etcDlVal;
			rowData.dtlOrdCnt = dtlOrdCntVal;
			rowData.dtlOrdQty = dtlOrdCntVal;
			
			rowData.workOrdNo = $(this).find('td input[name=workOrdNo]').val();
			rowData.outputDate = $(this).find('td input[name=outputDate]').val().replace(/-/g, "");;
			rowData.workOrdQty = $(this).find('td input[name=workOrdQty]').val().replace(/,/g,'');
			rowData.workEmerYn = $(this).find('td select[name=workEmerYn] option:selected').val();
			rowData.ordDesc = $(this).find('td input[name=ordDesc]').val();
			workOrdQty += parseInt($(this).find('td input[name=workOrdQty]').val().replace(/,/g,''));
			dataArray.push(rowData);
			console.log(dataArray)
		});

		if (workOrdQty > parseInt(dtlOrdCntVal)) {
			toastr.warning('주문수량을 초과하였습니다.');
			check = false;
			return false;
		}

		var url = '<c:url value="/po/workOrderAdmCreate"/>';	
		if (check == true) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
	
						$('#btnSave').addClass('d-none');
						$('#workOrderTable').DataTable().ajax.reload(function() {});
						$('#workOrderDtlTable').DataTable().ajax.reload(function() {});
						$('#workOrderDtlTable tbody tr').find('td input').attr('disabled',true);
						$('#workOrderDtlTable tbody tr').find('td button').attr('disabled', true);
						$('#workOrderDtlTable tbody tr').find('td select').attr('disabled', true);
						$('#rowDelete').attr('disabled', true);
						$('#rowAdd').attr('disabled',true);
						if (sideView == 'add') {
							toastr.success("등록되었습니다.");
						} else {
							toastr.success("수정되었습니다.");
						}
	
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
	
				}
			});
		}

	});

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=workOrdQty]", function(event){
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas(uncomma($(this).val())));
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
</script>
<style>
.bg-danger2 {
  background-color: #FF7878 !important;
}
</style>
   	

</body>
</html>
