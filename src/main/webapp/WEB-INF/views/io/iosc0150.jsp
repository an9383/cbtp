<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!-- 작업지시 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="workOrderPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workOrderPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" style="max-width: 1250px;">
	    	<div class="modal-content">
		    	<div class="modal-header pb-0">
		        	<h4>작업지시 조회</h4>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true" style="font-size: xx-large;">&times;</span>
		        	</button>
		      	</div> 
		      	<div class="modal-body">
		      		<hr class="text-secondary">	         
	                	<table id="workOrderPopUpTable" class="table table-bordered w-100">
		               		<colgroup>
								<col width="7%">
								<col width="15%">
								<col width="25%">
								<col width="13%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
							</colgroup>
	                    <thead class="thead-light">
		                    <tr>
		                    	<th>품목구분</th>
		                    	<th>작지번호</th>
		                    	<th>품번</th>
		                    	<th>품명</th>
		                    	<th>지시수량</th>
		                    	<th>생산일자</th>
		                    	<th>긴급여부</th>
		                    </tr>
	                    </thead>
					</table>
	 		  	<hr class="text-secondary"> 
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
			</div>
		</div>
	</div>
	<!-- 작업지시 모달 종료-->

	<!-- 품목  모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemCdModal" tabindex="-1" role="dialog" aria-labelledby="itemCdLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemCdLabel">품목조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
        			<table id="itemCdTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
	                   			<th style="width : 7%">구분</th>
	                   			<th style="width : 8%">품목구분</th>
								<th style="width : 25%">품번</th>
								<th style="width : 30%">품명</th>
								<th style="width : 15%">고객사</th>
								<th style="width : 15%">상태</th>
	                   		</tr>
                   		</thead>
					</table>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 품목 코드 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">자재출고현황(레이저)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="row">
					<div class="row" id="preOutWhsDateDiv">
						<label class="input-label-sm">출고일자</label>
						<div class="form-group input-sub m-0">
							<input class="form-control" type="date" id="preOutWhsDateFrom" value="${serverDateFrom}"/>
						</div>&nbsp;&nbsp;&nbsp;
						<label class="input-label-sm">~</label>
						<div class="form-group input-sub m-0">
							<input class="form-control" type="date" id="preOutWhsDateTo" value="${serverDateTo}"/>
						</div>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div class="row d-none" id="preOutWhsMonDiv">
						<label class="input-label-sm">출고 년/월</label>
						<div class="form-group input-sub m-0">
							<input class="form-control" type="month" id="preOutWhsMonFrom" value="${serverDateFrom.substring(0,7)}"/>
						</div>&nbsp;&nbsp;&nbsp;
						<label class="input-label-sm">~</label>
						<div class="form-group input-sub m-0">
							<input class="form-control" type="month" id="preOutWhsMonTo" value="${serverDateTo.substring(0,7)}"/>
						</div>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div class="row" id="itemCdDiv">
						<label class="input-label-sm">창고</label>
						<div class="form-group input-sub m-0">
							<input type="hidden" class="form-control" id="locationCd" name="locationCd" value="">
							<input type="hidden" class="form-control" id="areaCd" name="areaCd" value="">
							<input type="hidden" class="form-control" id="floorCd" name="floorCd" value="">
							<input type="hidden" class="form-control" id="locationNo" name="locationNo" value="">
							<input type="text" class="form-control" id="locationData" name="locationData" value="" disabled>
							<button type="button" id="btnItemCd" class="btn btn-primary input-sub-search" onclick="locationSelect()">
								<span class="oi oi-magnifying-glass"></span>
							</button>
						</div>
						<button type="button" id="dealCorpCdDelete" class="btn closeBtn" onclick="$('#locationCd').val(''); $('#areaCd').val(''); $('#floorCd').val(''); $('#locationNo').val(''); $('#locationData').val(''); locCdVal='';">
							<i class="mdi mdi-close"></i>
						</button>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row" id="itemCdDiv">
						<label class="input-label-sm">품번</label>
						<div class="form-group input-sub m-0">
							<input type="text" class="form-control" id="itemNm" name="itemNm" disabled>
							<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" disabled>
							<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">
								<span class="oi oi-magnifying-glass"></span>
							</button>
						</div>
						<button type="button" id="itemCdDelete" class="btn closeBtn" onclick="$('#itemSeq').val(''); $('#itemNm').val(''); itemSeqVal='';">
						<i class="mdi mdi-close"></i>
					</button>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row d-none" id="workOrdNoDiv">
						<label class="input-label-sm">작업지시번호</label>
						<div class="form-group input-sub m-0">
							<input type="text" class="form-control" id="workOrdNoScan" placeholder="입력">
							<button type="button" class="btn btn-primary input-sub-search" onClick="selectWorkOrd();">
								<span class="oi oi-magnifying-glass"></span>
							</button>
						</div>&nbsp;&nbsp;
					</div>
					<div class="row" id="buttonDiv">
						<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;
						<!-- <button type="button" class="btn btn-primary" id="btnAllList">전체조회</button> -->
					</div>
					&nbsp;
				</div>
				<div class="card-header card-tab mt-2 mb-2 d-none">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item">
							<a class="nav-link active show" id="tabDateNav" data-toggle="tab" href="#tabDate">일별</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="tabItemNav" data-toggle="tab" href="#tabItem">월별</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="tabBarcNav" data-toggle="tab" href="#tabBarc">lot별</a>
						</li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<div class="card">
					<div id="myTabContent" class="tab-content">
						
						<div class="tab-pane fade active show" id="tabDate">
							<div class="table-responsive">
								<table id="preOutWhsDateTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
										  	<th>출고일자</th>
					                        <th>구분</th>
					                        <th>자재코드</th>
					                        <th>자재명</th>
					                        <th>단위</th>
					                        <th class="text-center">출고수량</th>
					                        <th>LOTNO</th>
					                        <th>출고창고</th>
					                        <th>위치</th>
					                        <th>담당자</th>
					                    </tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='5' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalOutDateQty" style="background-color: #a9c9f0; color: black;"></th>
											<th colspan='4' style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabItem">
							<div class="table-responsive">
								<table id="preOutWhsItemTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>창고</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">투입수량</th>
										</tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='4' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalOutItemQty" style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabBarc">
							<div class="table-responsive">
								<table id="preOutWhsBarcTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>창고</th>
											<th>출고일자</th>
											<th>품번</th>
											<th>품명</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">투입수량</th>
											<th class="text-center">잔량</th>
											<th>바코드No</th>
											<th>작업지시번호</th>
										</tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='4' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalInBarcQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalOutBarcQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalRealBarcQty" style="background-color: #a9c9f0; color: black;"></th>
											<th colspan='2' style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- / #main  -->
	</div>
</div>
<!-- /.page-wrapper -->
<%@include file="../layout/bottom.jsp" %>
<style>
#th{
	padding-bottom: 12px;
}
</style>
<script>
	let currentHref = "iosc0150";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","자재출고현황(레이저)"); 

	//lot별, 일별, 월별 탭 변수
	let preOutWhsDateFromCal =  "${serverDateFrom}";
	let preOutWhsDateToCal =  "${serverDateTo}";
	let preOutWhsMonFromCal =  "${serverDateFrom}".substring(0,7);
	let preOutWhsMonToCal =  "${serverDateTo}".substring(0,7);
	
	let workOrdNoVal = "";
	let tabGubun = '일별';
	let searchVal = '';
	
	//작업지시번호 모달 변수
	let selStartDateVal = preOutWhsDateFromCal;
	let selEndDateVal = preOutWhsDateToCal;
	let itemGubunVal = "";
	let workEmerYnVal = "";
	let locCdVal = "";
	let itemSeqVal = "";


	//공통코드 시작
	var locCode = new Array(); // 입고구분
	<c:forEach items="${locCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	selectBoxAppend(locCode, "locCd", "002", "2"); 

	//일별 메인 테이블
	let preOutWhsDateTable = $('#preOutWhsDateTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		searching : false,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/preOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate'  : function(){ return preOutWhsDateFromCal.replace(/-/g,'') },
				'endDate'  : function(){ return preOutWhsDateToCal.replace(/-/g,'') },
				'locationCd' : function(){ return locCdVal;},
				'itemSeq' : function(){ return itemSeqVal;},
				'searchVal' : function(){return searchVal;},
				'preOutWhsGubun' : function(){ return 'date' },
				'mainGubun'  : function(){return '001';},
			}	
		},	
		rowId : '',
		columns : [
			{//출고일자
				data : 'outWhsDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{//구분
				data : 'itemGubunNm',
				'className' : 'text-center'
			},
			{//자재코드
				data : 'itemSeq',
				'className' : 'text-center'
			},
			{//자재명
				data : 'itemNm',
				'className' : 'text-center'
			},
			{//단위
				data : 'itemUnitNm',
				'className' : 'text-center'
			},
			{//출고수량
				data : 'outQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-right'
			},
			{//BarcodeNo
				data : 'barcodeNo',
				'className' : 'text-center'
			},
			{//창고
				data : 'locationNm',
				'className' : 'text-center'
			},
			{//창고
				data : 'areaNm',
				'className' : 'text-center'
			},		
			{//출고담당자
				data : 'outWorkerNm',
				'className' : 'text-center'
			},
		],
        columnDefs: [
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	 'copy', 'excel', 'print'
	    ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalOutDateQty = 0;

			let outQtyObj = [];
			for(var i = 0; i < data.length; i++) {
				let obj = new Object();
				obj.totalOutDateQty = parseFloat(data[i].outQty);
				outQtyObj.push(obj);
			}

			totalOutDateQty = outQtyObj.map(item => item.totalOutDateQty).reduce((prev, curr) => prev + curr, 0);

			$('.totalOutDateQty').text(rmDecimal(totalOutDateQty));
			
			$('#preOutWhsDateTable').find('tfoot').remove();
		}
	});
	
	let htmlDate = '';
	htmlDate += '<label>검색 : ';
	htmlDate += '<input class="form-control form-control-sm" type="text" id="dateSearch"/>';
	htmlDate += '</lable>';

	$('#preOutWhsDateTable_filter').html(htmlDate);
	
	//일별 검색
	$('#dateSearch').keyup(function() {
		searchVal = encodeURI($('#dateSearch').val());
		
		$('#preOutWhsDateTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });
	
	//월별 메인 테이블
	let preOutWhsItemTable = $('#preOutWhsItemTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		searching : false,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/preOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate'  : function(){ return preOutWhsMonFromCal.replace(/-/g,'') },
				'endDate'  : function(){ return preOutWhsMonToCal.replace(/-/g,'') },
				'locationCd' : function(){ return locCdVal;},
				'itemSeq' : function(){ return itemSeqVal;},
				'searchVal'  : function(){return searchVal;},
				'preOutWhsGubun' : function(){ return 'item' },
				'mainGubun'  : function(){return '001';},
			}	
		},	
		rowId : '',
		columns : [
			{//창고
				data : 'locationNm',
				render: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//품명
				data : 'itemUnitNm'
			},
			{//수량
				data : 'outQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}, "className": "text-right"
			},
		],
        columnDefs: [
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	 'copy', 'excel', 'print'
	    ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalOutItemQty = 0;

			let outQtyObj = [];
			for(var i = 0; i < data.length; i++) {
				let obj = new Object();
				obj.totalOutItemQty = parseFloat(data[i].outQty);
				outQtyObj.push(obj);
			}

			totalOutItemQty = outQtyObj.map(item => item.totalOutItemQty).reduce((prev, curr) => prev + curr, 0);

			$('.totalOutItemQty').text(rmDecimal(totalOutItemQty));
			
			$('#preOutWhsItemTable').find('tfoot').remove();
		}
	});
	
	let htmlItem = '';
	htmlItem += '<label>검색 : ';
	htmlItem += '<input class="form-control form-control-sm" type="text" id="itemSearch"/>';
	htmlItem += '</lable>';

	$('#preOutWhsItemTable_filter').html(htmlItem);
	
	//월별 검색
	$('#itemSearch').keyup(function() {
		searchVal = encodeURI($('#itemSearch').val());
		
		$('#preOutWhsItemTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });
	
	//lot별 메인 테이블	
	let preOutWhsBarcTable = $('#preOutWhsBarcTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		searching : false,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/preOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate'  : function(){ return preOutWhsDateFromCal.replace(/-/g,'') },
				'endDate'  : function(){ return preOutWhsDateToCal.replace(/-/g,'') },
				'workOrdNo'  : function(){ return workOrdNoVal },
				'locationCd' : function(){ return locCdVal;},
				'itemSeq' : function(){ return itemSeqVal;},
				'searchVal'  : function(){return searchVal;},
				'preOutWhsGubun' : function(){ return 'barc' },
				'mainGubun'  : function(){return '001';},
			}	
		},	
		rowId : '',
		columns : [
			{//창고
				data : 'locationNm',
				render: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			}, 
			{//출고일자
				data : 'outWhsDate',
				render: function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				}
			}, 
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//수량
				data : 'inQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}, "className": "text-right"
			},
			{//수량
				data : 'outQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}, "className": "text-right"
			},
			{//수량
				data : 'realQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}, "className": "text-right"
			},
			{//바코드No
				data : 'barcodeNo'
			},
			{//작업지시번호
				data : 'workOrdNo'
			},
			
		],
        columnDefs: [
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	 'copy', 'excel', 'print'
	    ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalOutDateQty = 0;

			let inQtyObj = [];
			let outQtyObj = [];
			let RealQtyObj = [];
			
			for(var i = 0; i < data.length; i++) {
				let obj1 = new Object();
				obj1.totalInDateQty = parseFloat(data[i].inQty);
				inQtyObj.push(obj1);

				let obj2 = new Object();
				obj2.totalOutDateQty = parseFloat(data[i].outQty);
				outQtyObj.push(obj2);
				
				let obj3 = new Object();
				obj3.totalRealDateQty = parseFloat(data[i].realQty);
				RealQtyObj.push(obj3);
			}

			totalInDateQty = inQtyObj.map(item => item.totalInDateQty).reduce((prev, curr) => prev + curr, 0);
			totalOutDateQty = outQtyObj.map(item => item.totalOutDateQty).reduce((prev, curr) => prev + curr, 0);
			totalRealDateQty = RealQtyObj.map(item => item.totalRealDateQty).reduce((prev, curr) => prev + curr, 0);

			console.log(totalInDateQty);
			$('.totalInBarcQty').text(rmDecimal(totalInDateQty));
			$('.totalOutBarcQty').text(rmDecimal(totalOutDateQty));
			$('.totalRealBarcQty').text(rmDecimal(totalRealDateQty));

			$('#preOutWhsBarcTable').find('tfoot').remove();
		}
	});
	
	let htmlBarc = '';
	htmlBarc += '<label>검색 : ';
	htmlBarc += '<input class="form-control form-control-sm" type="text" id="barcSearch"/>';
	htmlBarc += '</lable>';

	$('#preOutWhsBarcTable_filter').html(htmlBarc);
	
	//lot별 검색
	$('#barcSearch').keyup(function() {
		searchVal = encodeURI($('#barcSearch').val());
		
		$('#preOutWhsBarcTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });


	//품번 스캔 시
	$('#itemCdScan').keypress(function (e) {
		if (e.which == 13) {
			if ($('#itemCdScan').val() == "" || $('#itemCdScan').val() == null) {
				itemSeqVal = "";
			} else {
				itemSeqVal = $('#itemCdScan').val();
			}

			if (tabGubun == 'lot별') {
				$('#preOutWhsBarcTable').DataTable().ajax.reload(function() {});
			} else if (tabGubun == '일별') {
				$('#preOutWhsDateTable').DataTable().ajax.reload(function() {});
			} else if (tabGubun == '월별') {
				$('#preOutWhsItemTable').DataTable().ajax.reload(function() {});
			} else {
				console.log('예상치 못한 결과가 발생했습니다.');
			}
			
			toastr.success("품번을 스캔헀습니다.");
		}
	});
	
	//작업지시번호 스캔 시
	$('#workOrdNoScan').keypress(function (e) {
		if (e.which == 13) {
			if ($('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null) {
				workOrdNoVal = "";
			} else {
				workOrdNoVal = $('#workOrdNoScan').val();
			}

			if (tabGubun == 'lot별') {
				$('#preOutWhsBarcTable').DataTable().ajax.reload(function() {});
			} else if (tabGubun == '일별') {
				$('#preOutWhsDateTable').DataTable().ajax.reload(function() {});
			} else if (tabGubun == '월별') {
				$('#preOutWhsItemTable').DataTable().ajax.reload(function() {});
			} else {
				console.log('예상치 못한 결과가 발생했습니다.');
			}
			
			
			toastr.success("작업지시번호를 스캔헀습니다.");
		}
	});
	
	//조회 버튼 클릭
	$('#btnRetv').on('click', function() {
		if (tabGubun != '월별') {
			if ($('#preOutWhsDateFrom').val() == '') {
				toastr.warning("출고일자를 입력해주세요.");
				$('#preOutWhsDateFrom').focus();
				return false;
			} else if ($('#preOutWhsDateTo').val() == '') {
				toastr.warning("출고일자를 입력해주세요.");
				$('#preOutWhsDateTo').focus();
				return false;
			}
		}
		
		preOutWhsDateFromCal =  $('#preOutWhsDateFrom').val();
		preOutWhsDateToCal =  $('#preOutWhsDateTo').val();
		preOutWhsMonFromCal =  $('#preOutWhsMonFrom').val();
		preOutWhsMonToCal =  $('#preOutWhsMonTo').val();
		locCdVal = $('#locationCd').val();
		itemSeqVal = $('#itemSeq').val();
		workOrdNoVal = $('#workOrdNoScan').val();
		
		if (tabGubun == 'lot별') {
			$('#preOutWhsBarcTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '일별') {
			$('#preOutWhsDateTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '월별') {
			$('#preOutWhsItemTable').DataTable().ajax.reload(function() {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
		
    });

	/* //전체조회 버튼 클릭
	$('#btnAllList').on('click', function() {
		preOutWhsDateFromCal =  '';
		preOutWhsDateToCal =  '';
		workOrdNoVal = '';
		
		if (tabGubun == 'lot별') {
			$('#preOutWhsBarcTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '일별') {
			$('#preOutWhsDateTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '월별') {
			$('#preOutWhsItemTable').DataTable().ajax.reload(function() {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
		
    }); */

	//작업지시번호 목록 조회 팝업
   	let workOrderPopUpTable;
   	function selectWorkOrd() {
   		if (workOrderPopUpTable != null && workOrderPopUpTable != 'undefined') {
   			workOrderPopUpTable.destroy();
		}
   		
		workOrderPopUpTable = $('#workOrderPopUpTable').DataTable({
			dom: "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>" +
				"<'row'<'col-sm-12 p-0'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			searching : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : true,
			lengthChange : true,
			pageLength : 10,
			//ordering: false,
			ajax : {
				url : '<c:url value="po/workOrderModalDataList"/>',
				type : 'GET',
				async : false,
				data : {
		            'menuAuth' : 'posc0010',
		            'selStartDate'	:	function() { return selStartDateVal.replace(/-/g,''); },
		            'selEndDate'	:	function() { return selEndDateVal.replace(/-/g,''); },
		            'mainGubun'		:	'001',
		            'itemGubun'		:	function() { return itemGubunVal; },
		            'workEmerYn'	:	function() { return workEmerYnVal; },
		            'value'			:	'',
		            'workStatusCd'	:	'E',
				},
			},
			rowId : 'workOrdNo',
			columns : [
				{//품목구분
					data : 'itemGubunNm',
					className : 'text-center-td'
				},
				{//작지번호
					data : 'workOrdNo',
					className : 'text-center-td'
				},
				{//품번
					data : 'itemCd',
					className : 'text-center-td'
				},	
				{//품명
					data : 'itemNm',
					className : 'text-center-td'
				},
				{//지시수량
					data : 'workOrdQty',
					className : 'text-center-td'
				},	
				{//생산일자
					data : 'workStartDate',
					render : function(data,type,row,meta){
						if(data != null){
							return moment(rmDecimal(data)).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					},
					className : 'text-center-td'
				},
				{//긴급여부
					data : 'workEmerYnNm',
					render : function(data,type,row,meta){
						if (data != null) {
							if(data == "긴급"){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						} else {
							return '';
						}
					},
					className : 'text-center-td'
				},			
			],
			columnDefs: [
	        	
	        ],
		    order: [
		    ],
		    buttons: [],
		    drawCallback: function() {
			    var api = this.api();
			}
		});
		
	    //workOrderPopUpTable 테이블에 workOrderPopUpTable_length 추가
		let html2 = '';
		html2 += '<div class="row">';
		html2 += '	<label class="input-label-sm">기간</label>';
		html2 += '	<div class="form-group input-sub m-0 row">';
		html2 += '		<input type="date" class="form-control" id="selStartDate">';
		html2 += '	</div>';
		html2 += '	<label class="input-label-sm mr-2 ml-2">~</label>';
		html2 += '	<div class="form-group input-sub m-0 row">';
		html2 += '		<input type="date" class="form-control" id="selEndDate">';
		html2 += '	</div>&nbsp;&nbsp;&nbsp;';
		    
		html2 += '	<label class="input-label-sm">품목구분</label>';
		html2 += '	<div class="form-group input-sub m-0">';
		html2 += '		<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select">';
		html2 += '		<option value="">전체</option>';
		html2 += '		<option value="001">제품</option>';
		html2 += '		<option value="002">상품</option>';
		html2 += '		<option value="003">반제품</option>';
		html2 += '		</select>';
		html2 += '	</div>&nbsp;&nbsp;&nbsp;';
            
		html2 += '	<label class="input-label-sm">긴급여부</label>';
		html2 += '	<div class="form-group input-sub m-0">';
		html2 += '		<select name="workEmerYn" id="workEmerYn" title="" class="select w80 col-12 custom-select">';
		html2 += '		<option value="">전체</option>';
		html2 += '		<option value="001">긴급</option>';
		html2 += '		<option value="002">일반</option>';
		html2 += '		</select>';
		html2 += '	</div>&nbsp;&nbsp;&nbsp;';
		//html2 += '	<button type="button" class="btn btn-primary ml-2" id="btnWorkOrderPopupRev">조회</button>';
		html2 += '</div>';
		
		$('#workOrderPopUpTable_length').html(html2);
		$('#selStartDate').val(moment(selStartDateVal).format('YYYY-MM-DD'));
		$('#selEndDate').val(moment(selEndDateVal).format('YYYY-MM-DD'));

		$('#selStartDate, #selEndDate, #itemGubun, #workEmerYn').on('change', function() {
			selStartDateVal = moment($('#selStartDate').val()).format('YYYYMMDD');
			selEndDateVal = moment($('#selEndDate').val()).format('YYYYMMDD');
			itemGubunVal =  $('#itemGubun option:selected').val();
			workEmerYnVal =  $('#workEmerYn option:selected').val();
			
			$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
		});
		
		$('#workOrderPopUpModal').modal('show');
		
   	}
   	
 	//작업지시번호 모달 테이블 목록 선택시
	$(document).on('click', '#workOrderPopUpTable tbody tr', function () {
		
    	let data = workOrderPopUpTable.row(this).data();

    	workOrdNoVal = data.workOrdNo;
    	$('#workOrdNoScan').val(data.workOrdNo);
    	
    	if (tabGubun == 'lot별') {
			$('#preOutWhsBarcTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '일별') {
			$('#preOutWhsDateTable').DataTable().ajax.reload(function() {});
		} else if (tabGubun == '월별') {
			$('#preOutWhsItemTable').DataTable().ajax.reload(function() {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
    	
    	$('#workOrderPopUpModal').modal('hide');
	});


	//품번 팝업 시작
	let itemPartPopUpTable4;
	function itemCdModalShow() {
		let itemGubunList = ['003','004'];
		if(itemPartPopUpTable4 == null || itemPartPopUpTable4 == undefined)	{
			itemPartPopUpTable4 = $('#itemPartPopUpTable4').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				async : false,
				pageLength : 10,
				ajax : {
					url : '<c:url value="bm/itemPartAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){return '001';},
						'itemGubunList' : function(){return itemGubunList}
					},
				},
				rowId : '',
				columns : [ 
					{
						render : function(data,type,row,meta){
							return meta.row+1;
						}
					}, {
						data : 'itemCd'
					}, {
						data : 'itemNm'
					}, {
						data : 'itemGubunNm'
					}, {
						data : 'lhrhCdNm'
					} 
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
	
	
			$('#itemPartPopUpTable4 tbody').on('click', 'tr', function() {
				var data = itemPartPopUpTable4.row(this).data();

				$('#itemNm').val(data.itemNm);
				$('#itemSeq').val(data.itemSeq);

			 	$('#itemPartPopUpModal4').modal('hide');	
			});
		}else{
			$('#itemPartPopUpTable4').DataTable().ajax.reload(function() {});
		}
		$('#itemPartPopUpModal4').modal('show');
	} 

	// 창고 팝업 시작
	var locationPopupTable;
	function locationSelect() {
		if (locationPopupTable != null && locationPopupTable != 'undefined') {
			locationPopupTable.destroy();
		}
		
		locationPopupTable = $('#locationPopupTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/locationAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : '001'
				},
			},
			columns : [ 
				{
					data : 'mainGubunNm' 
				},
				{
					data : 'locNo' , 
						render : function(data, type, row, meta){
							if(data!=null){
								return data;
							} else{
								return '-';
							}
						}
				}, 
				{
					data : 'locNm'
				}, 
				{
					data : 'areaNm'
				}, 
				{
					data : 'floorNm'
				}, 
				{
					data : 'useYnNm'
				}, 
				{
					data : 'locDesc'
				},  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();
			$('#locationData').val(data.locNm + "/" + data.areaNm + "/" + data.floorNm);
			$('#locationCd').val(data.locCd);
			$('#areaCd').val(data.areaCd);
			$('#floorCd').val(data.floorNm);
			$('#locationNo').val(data.locNo);
			$('#locationPopupModal').modal('hide');
		});
		
		$('#locationPopupModal').modal('show');
	}
 	
	//lot별 탭 클릭
	$('#tabBarcNav').on('click', function() {
		tabGubun = 'lot별';
		$('#preOutWhsDateDiv').removeClass('d-none');
		$('#preOutWhsMonDiv').addClass('d-none');
		$('#workOrdNoDiv').removeClass('d-none');
		$('#buttonDiv').removeClass('d-none');
		searchClean();
		
		$('#preOutWhsBarcTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			preOutWhsBarcTable.draw();
			preOutWhsBarcTable.draw();
		}, 300);
    });
	
	//일별 탭 클릭
	$('#tabDateNav').on('click', function() {
		tabGubun = '일별';
		$('#preOutWhsDateDiv').removeClass('d-none');
		$('#preOutWhsMonDiv').addClass('d-none');
		$('#workOrdNoDiv').addClass('d-none');
		$('#buttonDiv').removeClass('d-none');
		searchClean();
		
		$('#preOutWhsDateTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			preOutWhsDateTable.draw();
			preOutWhsDateTable.draw();
		}, 300);
    });
	
	//월별 탭 클릭
	$('#tabItemNav').on('click', function() {
		tabGubun = '월별';
		$('#preOutWhsDateDiv').addClass('d-none');
		$('#preOutWhsMonDiv').removeClass('d-none');
		$('#workOrdNoDiv').addClass('d-none');
		$('#buttonDiv').removeClass('d-none');
		searchClean();
		
		$('#preOutWhsItemTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			preOutWhsItemTable.draw();
			preOutWhsItemTable.draw();
		}, 300);
    });
	
	//검색창 초기화
	function searchClean(){
		$('#barcSearch').val('');
		$('#dateSearch').val('');
		$('#itemSearch').val('');
	}

</script>
</body>
</html>
