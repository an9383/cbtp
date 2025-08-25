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
				<li class="breadcrumb-item active">수주진행현황</li>
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
					<div class="table-responsive">
						<table id="bizOrderTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>수주번호</th>
									<th>수주상세번호</th>
									<th>작지번호</th>
									<th>구분</th>
									<th>품명(Type)</th>
									<th>주문수량</th>
									<th>생산수량</th>
									<th>생산비율</th>
									<th>발주현황</th>
									<th>자재입고</th>
									<th>자재출고</th>
									<th>진행공정</th>
									<th>공정진행율</th>
									<th>출하검사</th>
									<th>제품출고</th>
									<th>제품출고율</th>
									<th>납기일</th>
									<th>출고처</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr>
									<th colspan="6">TOTAL</th>
									<th id="totalSum1"></th>
									<th id="totalSum2"></th>
									<th colspan="11"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--수주진행현황 hunterPopup 시작-->
<div id="popoverContent" class='d-none'>
	<table class="table table-bordered d-none mh-100" id="purchaseOrderTable" style="width:1000px; min-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">발주번호</th>
				<th class="text-center-th">CODE</th>
				<th class="text-center-th">REV</th>
				<th class="text-center-th">ITEM</th>
				<th class="text-center-th">SPEC</th>
				<th class="text-center-th">단위</th>
				<th class="text-center-th">발주수량</th>
				<th class="text-center-th">미입고수량</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">거래처명</th>
			</tr>
		</thead>
	</table>
	
	<table class="table table-bordered d-none mh-100" id="inWhsAdmTable" style="width:1000px; min-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">CODE</th>
				<th class="text-center-th">REV</th>
				<th class="text-center-th">ITEM</th>
				<th class="text-center-th">SPEC</th>
				<th class="text-center-th">단위</th>
				<th class="text-center-th">가입고일</th>
				<th class="text-center-th">수입검사일</th>
				<th class="text-center-th">입고일</th>
				<th class="text-center-th">가입고량</th>
				<th class="text-center-th">입고량</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">BarcodeNo</th>
				<th class="text-center-th">창고위치</th>
				</tr>
		</thead>
	</table>
	<table class="table table-bordered d-none mh-100" id="outWhsAdmTable" style="width:1000px; min-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">CODE</th>
				<th class="text-center-th">REV</th>
				<th class="text-center-th">ITEM</th>
				<th class="text-center-th">SPEC</th>
				<th class="text-center-th">단위</th>
				<th class="text-center-th">출고일</th>
				<th class="text-center-th">출고량</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">BarcodeNo</th>
				<th class="text-center-th">담당자</th>
			</tr>
		</thead>
	</table>
	<table class="table table-bordered d-none mh-100" id="workOrdPrcssTable" style="width:1000px; min-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">소공정명</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">투입수량</th>
				<th class="text-center-th">생산수량</th>
				<th class="text-center-th">불량수량</th>
				<th class="text-center-th">생산완료일</th>
			</tr>
		</thead>
	</table>
	<table class="table table-bordered d-none mh-100" id="itemWhsAdmTable" style="width:1000px; min-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">품명(TYPE)</th>
				<th class="text-center-th">REV</th>
				<th class="text-center-th">출고요청일</th>
				<th class="text-center-th">출고지시량</th>
				<th class="text-center-th">출하량</th>
				<th class="text-center-th">미출하량</th>
				<th class="text-center-th">납기일</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">출고처</th>
			</tr>
		</thead>
	</table>
</div>
<!--수주진행현황 hunterPopup 끝-->

<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수주진행현황");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;
	var contDtlNo=null;
	var workOrdNo=null;
	var barcodeNo=null;
	var itemCd=null;
	var itemRev=null;
	
	//영업주문관리 목록조회(외부)
	let bizOrderTable = $('#bizOrderTable').DataTable({
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 25,
		ordering: false,
		ajax : {
			url : '<c:url value="po/monitoringBizOrdDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return rcvDateOutFromCal.replace(/-/g, "");
				},
				'endDate' : function() {
					return rcvDateOutToCal.replace(/-/g, "");
				}
			},
		},
		rowId : 'workOrdNo',
		columns : [ {
				render : function(data, type, row, meta){
					return meta.row+1;
				}
		},
		{
			data : 'contNo'
		}, {
			data : 'contDtlNo'
		}, {
			data : 'workOrdNo'
		}, {
			data : 'itemGubunNm'
		}, {
			data : 'itemNm'
		}, {
			data : 'dtlOrdCnt'
		}, {
			data : 'workOrdQty'
		}, {
			data : 'prdcRate',
			render : function(data, type, row, meta){
				if(data!=null){
					return data+'%';
				}else{
					return '-';
				}
			}
		}, {
			data : 'poStatus',
			className : 'poStatusPopup text-center',
			render : function(data, type, row, meta){
				if(data!=null){
					return data;
				}else{
					return '-';
				}
			}
		}, {
			data : 'inStatus',
			className : 'inStatusPopup text-center',
			render : function(data, type, row, meta){
				if(data!=null){
					return data;
				}else{
					return '-';
				}
			}
		}, {
			data : 'preOutStatus',
			className : 'preOutStatusPopup text-center',
			render : function(data, type, row, meta){
				if(data!=null){
					return data;
				}else{
					return '-';
				}
			}
		}, {
			data : 'minorPrcssCd',
			className : 'workOrdPrcssPopup text-center',
			render : function(data, type, row, meta){
				if(data!=null){
					return data;
				}else{
					return '-';
				}
			}
		}, {
			data : 'progress',
			render : function(data, type, row, meta){
				if(data!=null){
					return data+'%';
				}else{
					return '-';
				}
			}
		},  {
			data : 'itemInspectStatus',
			className : 'itemInspectStatusPopup text-center',
		}, {
			data : 'outStatus',
			className : 'outStatusPopup text-center',
		}, {
			data : 'outRate',
			render : function(data, type, row, meta){
				if(data!=null){
					return data+'%';
				}else{
					return '-';
				}
			}
		}, {
			data : 'doDtlDate',
			render : function(data, type, row, meta){
				if(data!=null){
					return moment(data).format('YYYY-MM-DD');
				}else{
					return '-';
				}
				
			}
		}, {
			data : 'dealCorpNm',
			render : function(data, type, row, meta){
				if(data!=null){
					return data;
				}else{
					return '-';
				}
			}
		},
		],
		columnDefs : [ 
			{targets : [ 6,7],render : $.fn.dataTable.render.number(','),className : 'text-right'},  
			{"className" : "text-center","targets" : "_all"}, 
		],
		order : [ [ 1, 'desc' ] ],
		drawCallback: function() {
			
		    var api = this.api();
		    for(var i=0;i<api.data().count();i++) {
			    if(api.row(i).data().rcvDate == serverDateTo.replace(/-/g,'')) {
			    	$('#'+api.row(i).data().workOrdNo).addClass('bg-warning');
				} else {
					$('#'+api.row(i).data().workOrdNo).removeClass('bg-warning');
				}
			}
				
			
			$(".poStatusPopup").hunterPopup({
	    		title:'발주 조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});

			$(".inStatusPopup").hunterPopup({
	    		title:'자재입고 조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});

			$(".preOutStatusPopup").hunterPopup({
	    		title:'자재출고 조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});

			$(".workOrdPrcssPopup").hunterPopup({
	    		title:'진행공정 조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});

			$(".outStatusPopup ").hunterPopup({
	    		title:'제품출고 조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});
	    	
			//발주현황 td클릭시
			$('.poStatusPopup').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#purchaseOrderTable_wrapper').removeClass('d-none');
				$('#purchaseOrderTable').removeClass('d-none');
            	$('#inWhsAdmTable_wrapper').addClass('d-none');
            	$('#inWhsAdmTable').addClass('d-none');
            	$('#outWhsAdmTable_wrapper').addClass('d-none');
            	$('#outWhsAdmTable').addClass('d-none');
            	$('#workOrdPrcssTable_wrapper').addClass('d-none');
            	$('#workOrdPrcssTable').addClass('d-none');
            	$('#itemWhsAdmTable_wrapper').addClass('d-none');
            	$('#itemWhsAdmTable').addClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;

				console.log(index)
            		
            	contDtlNo = bizOrderTable.row(index).data().contDtlNo;
				itemCd = bizOrderTable.row(index).data().itemCd;
				itemRev = bizOrderTable.row(index).data().itemRev;
            	$('#purchaseOrderTable').DataTable().ajax.reload(function(){
            		for(var i=0; i<=$('#purchaseOrderTable tbody tr').length; i++){
                	    if($('#purchaseOrderTable tbody tr').eq(i).find('td').eq(1).text()!='-' && $('#purchaseOrderTable tbody tr td').text()!="데이터가 없습니다."){
                	       $('#purchaseOrderTable tbody tr').eq(i).attr('style','background: oldlace;'); 
                	    }
                	}
                });
			});

			//자재입고상태 td클릭시
			$('.inStatusPopup').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#purchaseOrderTable_wrapper').addClass('d-none');
            	$('#purchaseOrderTable').addClass('d-none');
            	$('#inWhsAdmTable_wrapper').removeClass('d-none');
            	$('#inWhsAdmTable').removeClass('d-none');
            	$('#outWhsAdmTable_wrapper').addClass('d-none');
            	$('#outWhsAdmTable').addClass('d-none');
            	$('#workOrdPrcssTable_wrapper').addClass('d-none');
            	$('#workOrdPrcssTable').addClass('d-none');
            	$('#itemWhsAdmTable_wrapper').addClass('d-none');
            	$('#itemWhsAdmTable').addClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;
            	contDtlNo = bizOrderTable.row(index).data().contDtlNo;
            	
            	$('#inWhsAdmTable').DataTable().ajax.reload( function () {});
			});

			//자재출고상태 td클릭시
			$('.preOutStatusPopup').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#purchaseOrderTable_wrapper').addClass('d-none');
            	$('#purchaseOrderTable').addClass('d-none');
            	$('#inWhsAdmTable_wrapper').addClass('d-none');
            	$('#inWhsAdmTable').addClass('d-none');
            	$('#outWhsAdmTable_wrapper').removeClass('d-none');
            	$('#outWhsAdmTable').removeClass('d-none');
            	$('#workOrdPrcssTable_wrapper').addClass('d-none');
            	$('#workOrdPrcssTable').addClass('d-none');
            	$('#itemWhsAdmTable_wrapper').addClass('d-none');
            	$('#itemWhsAdmTable').addClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;
            	workOrdNo = bizOrderTable.row(index).data().workOrdNo;
            	
            	$('#outWhsAdmTable').DataTable().ajax.reload( function () {});
			});

			//진행공정 td클릭시
			$('.workOrdPrcssPopup').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#purchaseOrderTable_wrapper').addClass('d-none');
            	$('#purchaseOrderTable').addClass('d-none');
            	$('#inWhsAdmTable_wrapper').addClass('d-none');
            	$('#inWhsAdmTable').addClass('d-none');
            	$('#outWhsAdmTable_wrapper').addClass('d-none');
            	$('#outWhsAdmTable').addClass('d-none');
            	$('#workOrdPrcssTable_wrapper').removeClass('d-none');
            	$('#workOrdPrcssTable').removeClass('d-none');
            	$('#itemWhsAdmTable_wrapper').addClass('d-none');
            	$('#itemWhsAdmTable').addClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;
            	workOrdNo = bizOrderTable.row(index).data().workOrdNo;
            	
            	$('#workOrdPrcssTable').DataTable().ajax.reload( function () {});
			});

			//제품출고 td클릭시
			$('.outStatusPopup ').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#purchaseOrderTable_wrapper').addClass('d-none');
            	$('#purchaseOrderTable').addClass('d-none');
            	$('#inWhsAdmTable_wrapper').addClass('d-none');
            	$('#inWhsAdmTable').addClass('d-none');
            	$('#outWhsAdmTable_wrapper').addClass('d-none');
            	$('#outWhsAdmTable').addClass('d-none');
            	$('#workOrdPrcssTable_wrapper').addClass('d-none');
            	$('#workOrdPrcssTable').addClass('d-none');
            	$('#itemWhsAdmTable_wrapper').removeClass('d-none');
            	$('#itemWhsAdmTable').removeClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;
            	barcodeNo = bizOrderTable.row(index).data().barcodeNo;
            	
            	$('#itemWhsAdmTable').DataTable().ajax.reload( function () {});
			});
			
			$('#totalSum1').text(addCommas($('#bizOrderTable').DataTable().column(6).data().sum().toString()));
			$('#totalSum2').text(addCommas($('#bizOrderTable').DataTable().column(7).data().sum().toString()));
		}
	});

	//발주현황 목록
  	let purchaseOrderTable = $('#purchaseOrderTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="io/poMonitoringList"/>',
			type : 'GET',
			data : {
				'contDtlNo' : function(){return contDtlNo;},
				'itemCd' 	: function(){return itemCd;},
				'itemRev' 	: function(){return itemRev;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'poNo'
		},{
			data : 'partCd'
		},{
			data : 'partRev'
		},{
			data : 'partNm'
		},{
			data : 'partSpec'
		},{
			data : 'partUnitNm'
		},{
			data : 'partQty'
		},{
			data : 'diffQty',
			render : function(data ,type ,row, meta){
				if(data!=null){
					return data;
				}else{
					return '0';
				}
			}
		},{
			data : 'poStatus'
		},{
			data : 'ordCorpNm'
		}
		],
		columnDefs : [ 
			{"targets" : [7,8], render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{"defaultContent": "-", "targets" : "_all", className : 'text-center'},
		],
		order : [ [ 1, 'desc' ] ],
		buttons : [],
    });

  	//자재입고 목록
  	let inWhsAdmTable = $('#inWhsAdmTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="io/inMonitoringList"/>',
			type : 'GET',
			data : {
				'contDtlNo' : function(){return contDtlNo;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'partCd'
		},{
			data : 'partRev'
		},{
			data : 'partNm'
		},{
			data : 'partSpec'
		},{
			data : 'partUnit'
		},{
			data : 'preInWhsDate',
			render : function(data, type, row , meta){
				if(data!=null){
					return moment(data).format('YYYY-MM-DD');
				}else{
					return '-';
				}
			}
		},{
			data : 'inspectDate',
			render : function(data, type, row , meta){
				if(data!=null){
					return moment(data).format('YYYY-MM-DD');
				}else{
					return '-';
				}
			}
		},{
			data : 'inWhsDate',
			render : function(data, type, row , meta){
				if(data!=null){
					return moment(data).format('YYYY-MM-DD');
				}else{
					return '-';
				}
			}
		},{
			data : 'preInWhsQty'
		},{
			data : 'inWhsQty'
		},{
			data : 'statusCd',
			render : function(data, type, row, meta){
				if(data=="S"){
					return '가입고';
				}else if(data=='I'){
					return '수입검사';
				}else if(data=='A'){
					return '수입검사';
				}else if(data=='L'){
					return '입고';
				}
			}
		},{
			data : 'barcodeNo'
		},{
			data : 'locationNm'
		},
		],
		columnDefs : [ 
			{"targets" : [9,10],render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{"defaultContent": "-", "targets": "_all",	"className": "text-center"},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
    	});

	//자재출고 목록
  	let outWhsAdmTable = $('#outWhsAdmTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="io/outMonitoringList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNo;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'partCd'
		},{
			data : 'partRev'
		},{
			data : 'partNm'
		},{
			data : 'partSpec'
		},{
			data : 'partUnit'
		},{
			data : 'preOutWhsDate',
			render : function(data, type, row , meta){
				return moment(data).format('YYYY-MM-DD');
			}
		},{
			data : 'preOutQty'
		},{
			data : 'statusCd',
			render : function(data, type, row, meta){
				if(data=="O"){
					return '출고';
				}else if(data=='P'){
					return '투입';
				}
			}	
		},{
			data : 'barcodeNo'
		},{
			data : 'preWorkCharger'
		}
		],
		columnDefs : [ 
			{"targets" : [7],render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{"defaultContent": "-", "targets": "_all",	"className": "text-center"},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
    	});


 	//진행공정 목록
  	let workOrdPrcssTable = $('#workOrdPrcssTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="po/workOrdPrcssMonitoringList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNo;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'minorPrcssNm'
		},{
			data : 'workStatus',
			render : function(data, type, row, meta){
				if(data=="PD"){
					return '<span style="color:#CCCCCC">대기</span>';
				}else if(data=='WI'){
					return '<span style="color:blue">진행</span>';
				}else if(data=='WC'){
					return '<span style="color:green">종료</span>';
				}else if(data=='DT'){
					return '<span style="color:red">비가동</span>';
				}
			}
		},{
			data : 'targetQty'
		},{
			data : 'outputQty'
		},{
			data : 'faultyQty'
		},{
			data : 'ordDate',
			render : function(data, type, row , meta){
				return moment(data).format('YYYY-MM-DD');
			}
		},
		],
		columnDefs : [
			{"targets" : [3,4,5],render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{"defaultContent": "-", "targets": "_all",	"className": "text-center"}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
    	});

 	
 	//제품출고 목록
  	let itemWhsAdmTable = $('#itemWhsAdmTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="bs/itemWhsAdmMonitoringList"/>',
			type : 'GET',
			data : {
				'barcodeNo' : function(){return barcodeNo;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'itemNm'
		},{
			data : 'itemRev'
		},{
			data : 'doDate',
			render : function(data, type, row , meta){
				return moment(data).format('YYYY-MM-DD');
			}
				
		},{
			data : 'targetQty'
		},{
			data : 'outputDtlQty'
		},{
			data : 'remainQty'
		},{
			data : 'dlvDate',
			render : function(data, type, row , meta){
				return moment(data).format('YYYY-MM-DD');
			}
		},{
			render : function(data, type, row, meta){
				if(row['remainQty']==0){
					return '출하완료';
				}else{
					return '출하진행';
				}
			}
		},{
			data : 'doCorpNm'
		},
		],
		columnDefs : [ 
			{"targets" : [4,5,6],render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{"defaultContent": "-", "targets": "_all",	"className": "text-center"},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
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

		$('#bizOrderTable').DataTable().ajax.reload(function() {});

	});
</script>
</body>
</html>
