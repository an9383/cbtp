<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 품번 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemCdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemCdPopUpLabel">품번 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="itemCdPopUpTable" class="table table-bordered">
	                   		<colgroup>
								<col width="24%">
								<col width="28%">
								<col width="34%">
								<col width="14%">
							</colgroup>
	                   		<thead class="thead-light">
		                   		<tr>
									<th>공급사</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
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
	<!-- 품번 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">기간별입고현황(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="row">
					<div class="row" id="inWhsDateDiv">
						<label class="input-label-sm mr-1">입고일자</label>
						<input class="form-control" style="width:97px;" type="date" id="inWhsDateFrom" name="inWhsDateFrom" value="${serverDateFrom}"/>
						&nbsp; ~ &nbsp;
						<input class="form-control" style="width:97px;" type="date" id="inWhsDateTo" name="inWhsDateTo" value="${serverDateTo}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row d-none" id="inWhsMonthDiv">
						<label class="input-label-sm mr-1">입고일자</label>
						<input class="form-control" style="width:97px;" type="month" id="inWhsMonthFrom" name="inWhsMonthFrom" value="${serverMonth}"/>
						&nbsp; ~ &nbsp;
						<input class="form-control" style="width:97px;" type="month" id="inWhsMonthTo" name="inWhsMonthTo" value="${serverMonth}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row d-none" id="approvalYnDiv">
						<label class="input-label-sm mr-1">승인여부</label> 
						<select class="custom-select" id="approvalYnOption" style="width:65px;">
							<option value="" selected>전체</option>
							<option value="001">승인</option>
							<option value="002">미승인</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<label class="input-label-sm mr-1">공급사</label>
					<div class="form-group input-sub m-0">
						<input type="text" class="form-control" id="dealCorpCdNm" name="dealCorpCdNm" disabled>
						<input type="hidden" class="form-control" id="dealCorpCd" name="dealCorpCd" disabled>
						<button type="button" class="btn btn-primary input-sub-search" id="dealCorpCdBtn" onClick="dealCorpCdModalShow();">
							<span class="oi oi-magnifying-glass"></span>
						</button>
					</div>
					<button type="button" id="dealCorpCdDelete" class="btn closeBtn" onclick="$('#dealCorpCd').val(''); $('#dealCorpCdNm').val(''); dealCorpCdVal='';">
						<i class="mdi mdi-close"></i>
					</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="input-label-sm mr-1">품번</label>
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
					<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;
					<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>
				</div>
				<div class="card-header card-tab mt-2 mb-2">
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
								<table id="inOutWhsDateTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>발주번호</th>
											<th>입고일자</th>
											<th>공급사</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">발주수량</th>
											<th class="text-center">가입고수량</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">입고금액</th>
										</tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='6' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalDateOrdQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalDatePreInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalDateInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalDateImportCost" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalDateInWhsCost" style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabItem">
							<div class="table-responsive">
								<table id="inOutWhsItemTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>입고월</th>
											<th>공급사</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">가입고수량</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">입고금액</th>
										</tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='5' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalItemPreInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalItemInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalItemImportCost" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalItemInWhsCost" style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabBarc">
							<div class="table-responsive">
								<table id="inOutWhsBarcTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>발주번호</th>
											<th>입고일자</th>
											<th>공급사</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">발주수량</th>
											<th class="text-center">가입고수량</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">입고금액</th>
											<th>자재LOTNO</th>
										</tr>
									</thead>
									<tfoot class="thead-light">
										<tr>
											<th colspan='6' style="background-color: #a9c9f0; color: black;">전체합계</th>
											<th class="totalBarcOrdQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalBarcPreInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalBarcInWhsQty" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalBarcImportCost" style="background-color: #a9c9f0; color: black;"></th>
											<th class="totalBarcInWhsCost" style="background-color: #a9c9f0; color: black;"></th>
											<th colspan='1' style="background-color: #a9c9f0; color: black;"></th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>

	let currentHref = "iosc0050";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","기간별입고현황(레이저)");
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo =  "${serverDateTo}";
	let serverMonthFrom =  "${serverMonth}";
	let serverMonthTo =  "${serverMonth}";
	let approvalYnOption = "";
	let tabGubun = "일별";
	let searchVal = '';
	let dealCorpCdVal = '';
	let itemSeqVal = '';

	//lot별 탭 메인 테이블
	let inOutWhsBarcTable = $('#inOutWhsBarcTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return serverDateFrom.replace(/-/g,'');},
				'endDate' : function(){return serverDateTo.replace(/-/g,'');},
				'approvalYn'  : function(){return approvalYnOption;},
				'searchVal'  : function(){return searchVal;},
				'dealCorpCd'  : function(){return dealCorpCdVal;},
				'itemSeq'  : function(){return itemSeqVal;},
				'inOutWhsGubun'  : function(){return 'barc';},
				'mainGubun'  : function(){return '001';},
				
			}
		},	
		rowId : '',
		columns : [ 
			{//발주번호
				data : 'poNo'
			},
			{//입고일자
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					if (data != null && data != '') {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},			
			{//공급사
				data : 'dealCorpNm'
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단위
				data : 'itemUnit'
			},
			{//발주수량
				data : 'ordQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//가입고수량
				data : 'preInWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고수량
				data : 'inWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//단가
				data : 'importCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고금액
				data : 'inWhsCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//바코드No
				data : 'barcodeNo'
			},
		],
		buttons: [
	    	'copy', {
                extend: 'excel',
                title: '기간별입고현황(레이저) - lot별',
                className : 'btn-secondary',
                footer: true, //tfoot 포함
            	init : function ( api, node, config ) {
					$(node).addClass('btn-secondary');
					$(node).text('Excel');
				},
                customize : function (xlsx) {
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);

// 			 		col.each(function () {
// 			 	    	$(this).attr('width', 20);
// 			 	    });
			 		
			 		//셀 병합
                    let mergeCells = $('mergeCells', sheet);
                    let row = inOutWhsBarcTable.data().length + 3;
                    if(row == 3) {row = 4;} // 데이터가 하나도 없을 때
                    
                    mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
                      attr: {
                        ref: ['A'+row+':F'+row]
                      }
                    }));
                  
				}
            }, 'print'                                
	    ],
	    columnDefs : [
		    
		],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalBarcOrdQty = $('#inOutWhsBarcTable').DataTable().column(6,{ page: 'current'} ).data().sum();
			let totalBarcPreInWhsQty = $('#inOutWhsBarcTable').DataTable().column(7,{ page: 'current'} ).data().sum();
			let totalBarcInWhsQty = $('#inOutWhsBarcTable').DataTable().column(8,{ page: 'current'} ).data().sum();
			let totalBarcImportCost = $('#inOutWhsBarcTable').DataTable().column(9,{ page: 'current'} ).data().sum();
			let totalBarcInWhsCost = $('#inOutWhsBarcTable').DataTable().column(10,{ page: 'current'} ).data().sum();

			$('.totalBarcOrdQty').text(rmDecimal(totalBarcOrdQty));
			$('.totalBarcPreInWhsQty').text(rmDecimal(totalBarcPreInWhsQty));
			$('.totalBarcInWhsQty').text(rmDecimal(totalBarcInWhsQty));
// 			$('.totalBarcImportCost').text(rmDecimal(totalBarcImportCost));
			$('.totalBarcInWhsCost').text(rmDecimal(totalBarcInWhsCost));
			
			$('#inOutWhsBarcTable').find('tfoot').remove();
			
		}
	});
	
	let htmlBarc = '';
	htmlBarc += '<label>검색 : ';
	htmlBarc += '<input class="form-control form-control-sm" type="text" id="barcSearch"/>';
	htmlBarc += '</lable>';

	$('#inOutWhsBarcTable_filter').html(htmlBarc);
	
	//lot별 검색
	$('#barcSearch').keyup(function() {
		searchVal = encodeURI($('#barcSearch').val());
		
		$('#inOutWhsBarcTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });
	
	//일별 탭 메인 테이블
	let inOutWhsDateTable = $('#inOutWhsDateTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return serverDateFrom.replace(/-/g,'');},
				'endDate' : function(){return serverDateTo.replace(/-/g,'');},
				'searchVal' : function(){return searchVal;},
				'dealCorpCd'  : function(){return dealCorpCdVal;},
				'itemSeq'  : function(){return itemSeqVal;},
				'inOutWhsGubun'  : function(){return 'date';},
				'mainGubun'  : function(){return '001';},
			}
		},
		rowId : '',
		columns : [ 
			{//발주번호
				data : 'poNo'
			},
			{//입고일자
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					if (data != null && data != '') {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},			
			{//공급사
				data : 'dealCorpNm'
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단위
				data : 'itemUnit'
			},
			{//발주수량
				data : 'ordQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//가입고수량
				data : 'preInWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고수량
				data : 'inWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//단가
				data : 'importCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고금액
				data : 'inWhsCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
		],
		buttons: [
	    	'copy', {
                extend: 'excel',
                title: '기간별입고현황(레이저) - 일별',
                className : 'btn-secondary',
                footer: true, //tfoot 포함
            	init : function ( api, node, config ) {
					$(node).addClass('btn-secondary');
					$(node).text('Excel');
				},
                customize : function (xlsx) {
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);

// 			 		col.each(function () {
// 			 	    	$(this).attr('width', 20);
// 			 	    });
			 		
			 		//셀 병합
                    let mergeCells = $('mergeCells', sheet);
                    let row = inOutWhsDateTable.data().length + 3;
                    if(row == 3) {row = 4;} // 데이터가 하나도 없을 때
                    
                    mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
                      attr: {
                        ref: ['A'+row+':F'+row]
                      }
                    }));
                  
				}
            }, 'print'                                
	    ],
	    columnDefs : [
		    
		],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let totalDateOrdQty = $('#inOutWhsDateTable').DataTable().column(6,{ page: 'current'} ).data().sum();
			let totalDatePreInWhsQty = $('#inOutWhsDateTable').DataTable().column(7,{ page: 'current'} ).data().sum();
			let totalDateInWhsQty = $('#inOutWhsDateTable').DataTable().column(8,{ page: 'current'} ).data().sum();
			let totalDateImportCost = $('#inOutWhsDateTable').DataTable().column(9,{ page: 'current'} ).data().sum();
			let totalDateInWhsCost = $('#inOutWhsDateTable').DataTable().column(10,{ page: 'current'} ).data().sum();

			$('.totalDateOrdQty').text(rmDecimal(totalDateOrdQty));
			$('.totalDatePreInWhsQty').text(rmDecimal(totalDatePreInWhsQty));
			$('.totalDateInWhsQty').text(rmDecimal(totalDateInWhsQty));
// 			$('.totalDateImportCost').text(rmDecimal(totalDateImportCost));
			$('.totalDateInWhsCost').text(rmDecimal(totalDateInWhsCost));
			
			$('#inOutWhsDateTable').find('tfoot').remove();
		}
	});
	
	let htmlDate = '';
	htmlDate += '<label>검색 : ';
	htmlDate += '<input class="form-control form-control-sm" type="text" id="dateSearch"/>';
	htmlDate += '</lable>';

	$('#inOutWhsDateTable_filter').html(htmlDate);
	
	//일별 검색
	$('#dateSearch').keyup(function() {
		searchVal = encodeURI($('#dateSearch').val());
		
		$('#inOutWhsDateTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });
	
	//월별 탭 메인 테이블
	let inOutWhsItemTable = $('#inOutWhsItemTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "55vh",
		serverSide : true,
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return serverMonthFrom.replace(/-/g,'');},
				'endDate' : function(){return serverMonthTo.replace(/-/g,'');},
				'searchVal'  : function(){return searchVal;},
				'dealCorpCd'  : function(){return dealCorpCdVal;},
				'itemSeq'  : function(){return itemSeqVal;},
				'inOutWhsGubun'  : function(){return 'item';},
				'mainGubun'  : function(){return '001';},
			}
		},	
		rowId : '',
		columns : [ 
			{//입고월
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					if (data != null && data != '') {
						return data.substr(0, 4) + '-' + data.substr(4, 2);
					} else {
						return '';
					}
				}
			},		
			{//공급사
				data : 'dealCorpNm'
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단위
				data : 'itemUnit'
			},
			{//가입고수량
				data : 'preInWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고수량
				data : 'inWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//단가
				data : 'importCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고금액
				data : 'inWhsCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
		],
		buttons: [
	    	'copy', {
                extend: 'excel',
                title: '기간별입고현황(레이저) - 월별',
                className : 'btn-secondary',
                footer: true, //tfoot 포함
            	init : function ( api, node, config ) {
					$(node).addClass('btn-secondary');
					$(node).text('Excel');
				},
                customize : function (xlsx) {
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);

// 			 		col.each(function () {
// 			 	    	$(this).attr('width', 20);
// 			 	    });
			 		
			 		//셀 병합
                    let mergeCells = $('mergeCells', sheet);
                    let row = inOutWhsItemTable.data().length + 3;
                    if(row == 3) {row = 4;} // 데이터가 하나도 없을 때
                    
                    mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
                      attr: {
                        ref: ['A'+row+':F'+row]
                      }
                    }));
                  
				}
            }, 'print'                                
	    ],
	    columnDefs : [
		    
		],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalItemPreInWhsQty = $('#inOutWhsItemTable').DataTable().column(5,{ page: 'current'} ).data().sum();
			let totalItemInWhsQty = $('#inOutWhsItemTable').DataTable().column(6,{ page: 'current'} ).data().sum();
			let totalItemImportCost = $('#inOutWhsItemTable').DataTable().column(7,{ page: 'current'} ).data().sum();
			let totalItemInWhsCost = $('#inOutWhsItemTable').DataTable().column(8,{ page: 'current'} ).data().sum();

			$('.totalItemPreInWhsQty').text(rmDecimal(totalItemPreInWhsQty));
			$('.totalItemInWhsQty').text(rmDecimal(totalItemInWhsQty));
// 			$('.totalItemImportCost').text(rmDecimal(totalItemImportCost));
			$('.totalItemInWhsCost').text(rmDecimal(totalItemInWhsCost));
			
			$('#inOutWhsItemTable').find('tfoot').remove();
		}
	});
	
	let htmlItem = '';
	htmlItem += '<label>검색 : ';
	htmlItem += '<input class="form-control form-control-sm" type="text" id="itemSearch"/>';
	htmlItem += '</lable>';

	$('#inOutWhsItemTable_filter').html(htmlItem);
	
	//월별 검색
	$('#itemSearch').keyup(function() {
		searchVal = encodeURI($('#itemSearch').val());
		
		$('#inOutWhsItemTable').DataTable().ajax.reload(function(){ searchVal = ''; });
    });
	
	//조회 버튼 클릭
	$('#btnRetv').on('click', function() {
		if (tabGubun != '월별') {
			if ($('#inWhsDateFrom').val() == '') {
				toastr.warning("입고일자를 입력해주세요.");
				$('#inWhsDateFrom').focus();
				return false;
			} else if ($('#inWhsDateTo').val() == '') {
				toastr.warning("입고일자를 입력해주세요.");
				$('#inWhsDateTo').focus();
				return false;
			}
		}
		
		approvalYnOption = $('#approvalYnOption').val();
		dealCorpCdVal = $('#dealCorpCd').val();
		itemSeqVal = $('#itemSeq').val();
		
		if (tabGubun == 'lot별') {
			serverDateFrom =  $('#inWhsDateFrom').val();
			serverDateTo =  $('#inWhsDateTo').val();
			$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '일별') {
			serverDateFrom =  $('#inWhsDateFrom').val();
			serverDateTo =  $('#inWhsDateTo').val();
			$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '월별') {
			serverMonthFrom =  $('#inWhsMonthFrom').val();
			serverMonthTo =  $('#inWhsMonthTo').val();
			$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
		
    });

	//전체조회 버튼 클릭
	$('#btnAllList').on('click', function() {
		serverDateFrom = '';
		serverDateTo =  '';
		serverMonthFrom = '';
		serverMonthTo =  '';
		approvalYnOption = '';
		dealCorpCdVal = '';
		itemSeqVal = '';
		
		if (tabGubun == 'lot별') {
			$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '일별') {
			$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '월별') {
			$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
		
    });
	
	//일별 탭 클릭
	$('#tabDateNav').on('click', function() {
		tabGubun = '일별';
		$('#inWhsMonthDiv').addClass('d-none');
		$('#inWhsDateDiv').removeClass('d-none');
		$('#approvalYnDiv').addClass('d-none');
		searchClean();
		
		$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsDateTable.draw();
			inOutWhsDateTable.draw();
		}, 300);
    });
	
	//월별 탭 클릭
	$('#tabItemNav').on('click', function() {
		tabGubun = '월별';
		$('#inWhsMonthDiv').removeClass('d-none');
		$('#inWhsDateDiv').addClass('d-none');
		$('#approvalYnDiv').addClass('d-none');
		searchClean();
		
		$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsItemTable.draw();
			inOutWhsItemTable.draw();
		}, 300);
    });
	
	//lot별 탭 클릭
	$('#tabBarcNav').on('click', function() {
		tabGubun = 'lot별';
		$('#inWhsMonthDiv').addClass('d-none');
		$('#inWhsDateDiv').removeClass('d-none');
		$('#approvalYnDiv').removeClass('d-none');
		searchClean();
		
		$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsBarcTable.draw();
			inOutWhsBarcTable.draw();
		}, 300);
    });
	
	//검색 텍스트 초기화
	function searchClean(){
		$('#barcSearch').val('');
		$('#dateSearch').val('');
		$('#itemSearch').val('');
	}

	//공급사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function dealCorpCdModalShow() {
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({	
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
			pageLength : 20,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealArr' :  function(){return ['002'];},
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ {
				data : 'dealCorpNm'
			}, {
				data : 'dealCorpCd'
			}, {
				data : 'presidentNm'
			}, {
				data : 'repreItem'
			}, {
				data : 'corpNo'
			} ],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			
			$('#dealCorpCd').val(data.dealCorpCd);
			$('#dealCorpCdNm').val(data.dealCorpNm);
			
			$('#dealCorpPopUpModal4').modal('hide');
		});
		
		$('#dealCorpPopUpModal4').modal('show');
	}
	
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
	
	//셀 병합
	function _createNode( doc, nodeName, opts ) {
        let tempNode = doc.createElement( nodeName );

        if ( opts ) {
            if ( opts.attr ) {
                $(tempNode).attr( opts.attr );
            }

            if ( opts.children ) {
                $.each( opts.children, function ( key, value ) {
                    tempNode.appendChild( value );
                } );
            }

            if ( opts.text !== null && opts.text !== undefined ) {
                tempNode.appendChild( doc.createTextNode( opts.text ) );
            }
        }

        return tempNode;
    }
	
</script>

</body>
</html>
