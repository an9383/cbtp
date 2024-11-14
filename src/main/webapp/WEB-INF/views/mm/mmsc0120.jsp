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
				<li class="breadcrumb-item active">생산입출고현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">수입검사</a></li>
						<li class="nav-item"><a class="nav-link" 
							id="tab2Nav" data-toggle="tab" href="#tab2">자재입고</a></li>
						<li class="nav-item"><a class="nav-link"
							id="tab3Nav" data-toggle="tab" href="#tab3">생산투입</a></li>
						<li class="nav-item"><a class="nav-link" 
							id="tab4Nav" data-toggle="tab" href="#tab4">완제품검사</a></li>
						<li class="nav-item"><a class="nav-link"
							id="tab5Nav" data-toggle="tab" href="#tab5">제품입고</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<br>
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="table-responsive">
								<table id="approveProcIITable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>바코드번호</th>
											<th>가입고일자</th>
											<th>구분</th>
											<th>CODE</th>
											<th>REV</th>
											<th>ITEM</th>
											<th>SPEC</th>
											<th>단위</th>
											<th>가입고수량</th>
											<th>승인유/무</th>
											<th>승인일</th>
											<th>승인인</th>
											<th>승인수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab2">
							<div class="table-responsive">
								<table id="approveProcMITable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>바코드번호</th>
											<th>수입검사일</th>
											<th>구분</th>
											<th>CODE</th>
											<th>REV</th>
											<th>ITEM</th>
											<th>SPEC</th>
											<th>단위</th>
											<th>가입고수량</th>
											<th>합격수량</th>
											<th>불량수량</th>
											<th>차이수량</th>
											<th>승인유/무</th>
											<th>승인일</th>
											<th>승인인</th>
											<th>승인수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="table-responsive">
								<table id="approveProcPITable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>바코드번호</th>
											<th>작지번호</th>
											<th>출고일</th>
											<th>구분</th>
											<th>모델명</th>
											<th>REV</th>
											<th>고객사</th>
											<th>접수일</th>
											<th>납기일</th>
											<th>지시수량</th>
											<th>승인유/무</th>
											<th>승인일</th>
											<th>승인인</th>
											<th>승인수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="table-responsive">
								<table id="approveProcCITable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>바코드번호</th>
											<th>작지번호</th>
											<th>생산종료일</th>
											<th>구분</th>
											<th>모델명</th>
											<th>REV</th>
											<th>Serial No</th>
											<th>생산수량</th>
											<th>승인유/무</th>
											<th>승인일</th>
											<th>승인인</th>
											<th>승인수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<div class="table-responsive">
								<table id="approveProcPATable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											
											<th>바코드번호</th>
											<th>작지번호</th>
											<th>완제품검사일</th>
											<th>구분</th>
											<th>모델명</th>
											<th>REV</th>
											<th>Serial No</th>
											<th>합격수량</th>
											<th>불량수량</th>
											<th>차이수량</th>
											<th>승인유/무</th>
											<th>승인일</th>
											<th>승인인</th>
											<th>승인수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0120";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산입출고현황"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var activeTab = "수입검사";
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});

	$('#saveBtnModalY').on('click', function() {
		$('#formIn').each(function() {
			this.reset();
		});

		$('#formOut').each(function() {
			this.reset();
		});
		
		uiProc(true);
		uiProc2(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	//수입검사 승인처리 목록조회
	let approveProcIITable = $('#approveProcIITable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="tm/approveProcAdmList1"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
			},
		},
		rowId : 'contNo',
		columns : [ 
				{data : 'barcodeNo'},
				{data : 'preInWhsDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				}, 
				{data : 'partGubunNm'},
				{data : 'partCd'},
				{data : 'partRev'},
				{data : 'partNm'},				
				{data : 'partSpec'},	
				{data : 'partUnitNm'},
				{data : 'preInWhsQty'},
				{
					render: function(data, type, row, meta) {
						if(row['apDate']!=null){
							return '유';
						}else{
							return '무';
						}
					}
				},				
				{data : 'apDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},			
				{data : 'apChargrNm'},			
				{data : 'apQty'},				
		],
		columnDefs: [
			{
				targets : [8,12],
				render : $.fn.dataTable.render.number(','),
				className : 'text-right'
			},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 10, 'desc' ]
	    ],
	    
	    
	});


	//자재입고 승인처리 목록조회
	let approveProcMITable = $('#approveProcMITable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="tm/approveProcAdmList2"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
			},
		},
		rowId : 'contNo',
		columns : [ 
				{data : 'barcodeNo'},
				{data : 'inspectDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{data : 'partGubunNm'},
				{data : 'partCd'},
				{data : 'partRev'},
				{data : 'partNm'},				
				{data : 'partSpec'},	
				{data : 'partUnitNm'},
				{data : 'preInWhsQty'},
				{data : 'pairQty'},			
				{data : 'faultyQty'},			
				{
					render: function(data, type, row, meta) {
						return row['pairQty'] - row['faultyQty']
					}
				},			
				{
					render: function(data, type, row, meta) {
						if(row['apDate']!=null){
							return '유';
						}else{
							return '무';
						}
					}
				},			
				{data : 'apDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},			
				{data : 'apChargrNm'},			
				{data : 'apQty'},				
		],
		columnDefs: [
			{
				targets : [8,9,10,11,15],
				render : $.fn.dataTable.render.number(','),
				className : 'text-right'
			},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 13, 'desc' ]
	    ],
	    
	    
	});


	//생산투입 승인처리 목록조회
	let approveProcPITable = $('#approveProcPITable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="tm/approveProcAdmList3"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
			},
		},
		rowId : 'contNo',
		columns : [ 
				{data : 'barcodeNo'},
				{data : 'workOrdNo'},
				{data : 'preOutWhsDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				}, 
				{data : 'itemGubunNm'},
				{data : 'itemNm'},
				{data : 'itemRev'},
				{data : 'ordCorpNm'},				
				{data : 'rcvDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},	
				{data : 'dlvDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},
				{data : 'workOrdQty'},
				{
					render: function(data, type, row, meta) {
						if(row['apDate']!=null){
							return '유';
						}else{
							return '무';
						}
					}
				},				
				{data : 'apDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},			
				{data : 'apChargrNm'},			
				{data : 'apQty'},				
		],
		columnDefs: [
			{
				targets : [9,13],
				render : $.fn.dataTable.render.number(','),
				className : 'text-right'
			},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
		    
	        [ 11, 'desc' ]
	    ],
	    
	    
	});


	//완제품검사 승인처리 목록조회
	let approveProcCITable = $('#approveProcCITable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="tm/approveProcAdmList4"/>',
			type : 'GET',
			data : {

				'startDate' : function() { return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
			},
		},
		rowId : 'contNo',
		columns : [ 
				{data : 'barcodeNo'},
				{data : 'workOrdNo'},
				{data : 'ordDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				}, 
				{data : 'itemGubunNm'},
				{data : 'itemNm'},
				{data : 'itemRev'},
				{data : 'serialNo'},	
				{data : 'outputQty'},
				{
					render: function(data, type, row, meta) {
						if(row['apDate']!=null){
							return '유';
						}else{
							return '무';
						}
					}
				},				
				{data : 'apDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},			
				{data : 'apChargrNm'},			
				{data : 'apQty'},				
		],
		columnDefs: [
			{
				targets : [7,11],
				render : $.fn.dataTable.render.number(','),
				className : 'text-right'
			},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 9, 'desc' ]
	    ],
	    
	    
	});
	

	let approveProcPATable = $('#approveProcPATable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="tm/approveProcAdmList5"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
			},
		},
		rowId : 'contNo',
		columns : [ 
				{data : 'barcodeNo'},	
				{data : 'workOrdNo'},
				{data : 'inspectDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				}, 
				{data : 'itemGubunNm'},
				{data : 'itemNm'},
				{data : 'itemRev'},
				{data : 'serialNo'},	
				{data : 'pairQty'},
				{data : 'faultyQty'},
				{data : 'diffQty'},	
				{
					render: function(data, type, row, meta) {
						if(row['apDate']!=null){
							return '유';
						}else{
							return '무';
						}
					}
				},				
				{data : 'apDate',
					render: function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else{
							return '-';
						}
					}
				},			
				{data : 'apChargrNm'},			
				{data : 'apQty'},				
		],
		columnDefs: [
			{
				targets : [7,8,9,13],
				render : $.fn.dataTable.render.number(','),
				className : 'text-right'
			},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 11, 'desc' ]
	    ],
	    
	    
	});


	//기간조회 1
	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="apDateFrom" name="apDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(apDateFrom,apDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="apDateTo" name="apDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(apDateTo,apDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp; <button type="button" class="btn btn-primary" name="btnRetv">조회</button>'
	html1 += '</div>';

	var html2 = '<div class="row">';
	html2 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html2 += '<input class="form-control" style="width:97px;" type="text" id="apDateFrom2" name="apDateFrom" disabled/>';
	html2 += '<button onclick="fnPopUpCalendar(apDateFrom2,apDateFrom2,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateFrom2Calendar" type="button">';
	html2 += '<span class="oi oi-calendar"></span>';
	html2 += '</button>';
	html2 += '</div>';
	html2 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html2 += '<input class="form-control" style="width:97px;" type="text" id="apDateTo2" name="apDateTo" disabled/>';
	html2 += '<button onclick="fnPopUpCalendar(apDateTo2,apDateTo2,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateTo2Calendar" type="button">';
	html2 += '<span class="oi oi-calendar"></span>';
	html2 += '</button>';
	html2 += '</div>';
	html2 += '&nbsp; <button type="button" class="btn btn-primary" name="btnRetv">조회</button>'
	html2 += '</div>';


	var html3 = '<div class="row">';
	html3 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html3 += '<input class="form-control" style="width:97px;" type="text" id="apDateFrom3" name="apDateFrom" disabled/>';
	html3 += '<button onclick="fnPopUpCalendar(apDateFrom3,apDateFrom3,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateFrom3Calendar" type="button">';
	html3 += '<span class="oi oi-calendar"></span>';
	html3 += '</button>';
	html3 += '</div>';
	html3 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html3 += '<input class="form-control" style="width:97px;" type="text" id="apDateTo3" name="apDateTo" disabled/>';
	html3 += '<button onclick="fnPopUpCalendar(apDateTo3,apDateTo3,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateTo3ToCalendar" type="button">';
	html3 += '<span class="oi oi-calendar"></span>';
	html3 += '</button>';
	html3 += '</div>';
	html3 += '&nbsp; <button type="button" class="btn btn-primary" name="btnRetv">조회</button>'
	html3 += '</div>';

	var html4 = '<div class="row">';
	html4 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html4 += '<input class="form-control" style="width:97px;" type="text" id="apDateFrom4" name="apDateFrom" disabled/>';
	html4 += '<button onclick="fnPopUpCalendar(apDateFrom4,apDateFrom4,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateFrom4Calendar" type="button">';
	html4 += '<span class="oi oi-calendar"></span>';
	html4 += '</button>';
	html4 += '</div>';
	html4 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html4 += '<input class="form-control" style="width:97px;" type="text" id="apDateTo4" name="apDateTo" disabled/>';
	html4 += '<button onclick="fnPopUpCalendar(apDateTo4,apDateTo4,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateTo4Calendar" type="button">';
	html4 += '<span class="oi oi-calendar"></span>';
	html4 += '</button>';
	html4 += '</div>';
	html4 += '&nbsp; <button type="button" class="btn btn-primary" name="btnRetv">조회</button>'
	html4 += '</div>';

	var html5 = '<div class="row">';
	html5 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html5 += '<input class="form-control" style="width:97px;" type="text" id="apDateFrom5" name="apDateFrom" disabled/>';
	html5 += '<button onclick="fnPopUpCalendar(apDateFrom5,apDateFrom5,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateFrom5Calendar" type="button">';
	html5 += '<span class="oi oi-calendar"></span>';
	html5 += '</button>';
	html5 += '</div>';
	html5 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html5 += '<input class="form-control" style="width:97px;" type="text" id="apDateTo5" name="apDateTo" disabled/>';
	html5 += '<button onclick="fnPopUpCalendar(apDateTo5,apDateTo5,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="apDateTo5Calendar" type="button">';
	html5 += '<span class="oi oi-calendar"></span>';
	html5 += '</button>';
	html5 += '</div>';
	html5 += '&nbsp; <button type="button" class="btn btn-primary" name="btnRetv">조회</button>'
	html5 += '</div>';

	$('#approveProcIITable_length').html(html1);
	$('#approveProcMITable_length').html(html2);
	$('#approveProcPITable_length').html(html3);
	$('#approveProcCITable_length').html(html4);
	$('#approveProcPATable_length').html(html5);

	$('input[name=apDateFrom]').val(moment(serverDateFrom).format('YYYY-MM-DD'));
	$('input[name=apDateTo]').val(moment(serverDateTo).format('YYYY-MM-DD'));

	



	//$('#approveProcMITable_length').html(html1);
	//$('#approveProcPITable_length').html(html1);
	//$('#approveProcCITable_length').html(html1);
	//$('#approveProcPATable_length').html(html1);

	$('input[name=btnRetv]').on('click', function() {
		serverDateFrom = $('input[name=apDateFrom]').val();
		serverDateTo = $('input[name=apDateTo]').val();
		$('#approveProcIITable').DataTable().ajax.reload(function() {});
		$('#approveProcMITable').DataTable().ajax.reload(function() {});
		$('#approveProcPITable').DataTable().ajax.reload(function() {});
		$('#approveProcCITable').DataTable().ajax.reload(function() {});
		$('#approveProcPATable').DataTable().ajax.reload(function() {});
	});
	
	function uiProc(flag) {
		//$("#formOut input[name=contNo]").attr("disabled", flag);
		$("#formOut input[name=poNo]").attr("disabled", flag);
		$("#formOut input[name=ordCnt]").attr("disabled", flag);
		$("button[name=rcvDateCalendar]").attr("disabled", flag);
		$("button[name=shipReqDateCalendar]").attr("disabled", flag);

		$("button[name=btnRcvChargr]").attr("disabled", flag);
		$("button[name=btnOrdCorpCd]").attr("disabled", flag);
		

		$("#inexGubunOut").attr('disabled',flag);
		$("#contGubunOut").attr('disabled',flag);
		
		$("#confirmYnOut").attr('disabled',flag);
		$("#useYnOut").attr('disabled',flag);
	}

	
	
</script>

   	

</body>
</html>
