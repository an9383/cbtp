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
				<li class="breadcrumb-item active">작업시간관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-9">
							<div class="form-group float-right">
								<label class="col-form-label pt-0 pb-0" style="font-size: 15px;">상태
									:&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: #CCCCCC; font-size: 15px;">대기</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: #CCCCCC; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: black; font-size: 15px;">미결</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: black; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: blue; font-size: 15px;">진행</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: blue; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: red; font-size: 15px;">완료</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: red; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: brown; font-size: 15px;">비가동</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: brown; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
						</div>
					</div>
					<br>
					<ul class="nav nav-tabs card-header-tabs m-0">
						<c:forEach items="${bomList}" var="info" varStatus="status">
							<c:if test="${status.index eq 0}">
								<li class="nav-item"><a class="nav-link active show"
									id="tab<c:out value="${status.index}" />Nav" data-toggle="tab"
									href="#tab1"><c:out value="${info.bomNm}" /></a></li>
							</c:if>
							<c:if test="${status.index != 0}">
								<li class="nav-item"><a class="nav-link"
									id="tab<c:out value="${status.index}" />Nav" data-toggle="tab"
									href="#tab<c:out value="${status.count}" />"><c:out
											value="${info.bomNm}" /></a></li>
							</c:if>
						</c:forEach>
					</ul>
					<!-- /.nav-tabs -->
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="table-responsive">
								<table class="table table-bordered" id="workHistSmallListTable">
									<thead class="thead-light" style="font-size: 11px;">
										<tr>
											<th class="text-center">순번</th>
											<th class="text-center">작지번호</th>
											<th class="text-center">거래처명</th>
											<th class="text-center">품명(type)</th>
											<c:forEach items="${bomList_B00001}" var="info"
												varStatus="status">
												<th class="text-center"><c:out value="${info.prcssNm}" /></th>
											</c:forEach>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="table-responsive">
								<table class="table table-bordered" id="workHistMiddleListTable">
									<thead class="thead-light" style="font-size: 11px;">
										<tr>
											<th class="text-center">순번</th>
											<th class="text-center">작지번호</th>
											<th class="text-center">거래처명</th>
											<th class="text-center">품명(type)</th>
											<c:forEach items="${bomList_B00002}" var="info2"
												varStatus="status">
												<th class="text-center"><c:out value="${info2.prcssNm}" /></th>
											</c:forEach>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab3"></div>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<div id="popoverContent">
	<table class="table table-bordered d-none mh-100" id="minorPrcssTable"
		style="width: 500px; min-height: 100%">
		<colgroup>
			<col width="30%">
			<col width="10%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">소공정</th>
				<th class="text-center-th">상태</th>
				<th class="text-center-th">투입수량</th>
				<th class="text-center-th">생산수량</th>
				<th class="text-center-th">불량수량</th>
			</tr>
		</thead>
	</table>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>

	menutAuth = "wmsc0020";
	let currentHref = "wmsc0020";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	let startDateVal = moment().subtract(7, 'd').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');

	$(document).attr("title","작업시간관리");

	let workOrdNoVal = '';
	let middlePrcssCdVal = '';

	//소공정별 목록조회
	let minorPrcssTable = $('#minorPrcssTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language: lang_kor,
		paging: false,
		info: false,
		searching: false,
		ordering: false,
		processing: false,
		autoWidth: false,
		lengthChange: false,
		pageLength: 10,
		select: {
		    style: 'single',
		    toggleable: false,
		    items: 'row'
		},
		ajax: {
		    url: '<c:url value="/mm/workOrdStatusDtlList"/>',
		    type: 'POST',
		    data: {
		    	'workOrdNo'			:	function() { return workOrdNoVal; },
		    	'middlePrcssCd'		:	function() { return middlePrcssCdVal; },
		    }
		},
		columns: [
			{ data: 'minorPrcssNm' },
			{ data: 'workStatus',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="m-0" style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="m-0" style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="m-0" style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="m-0" style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="m-0" style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data: 'targetQty' },
			{ data: 'outputQty' },
			{ data: 'faultyQty' }
		],
		columnDefs: [
			{ targets: [0,1], className: 'text-center-td' },
			{ targets: [2,3,4], className: 'text-right-td', render: $.fn.dataTable.render.number( ',' ) }
		],
		order: [
		],
		buttons: [
		],
	});



	

	// 소형일반 목록조회
	let workHistSmallListTable = $('#workHistSmallListTable').DataTable({
		language : lang_kor,		
		paging : true,
		searching : true,
		info : false,
		ordering : true,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		select: {
            style: 'single',
            toggleable: false,
            items: 'cell',
            selector: 'td:nth-child(5), td:nth-child(6), td:nth-child(7), td:nth-child(8), td:nth-child(9), td:nth-child(10), td:nth-child(11), td:nth-child(12), td:nth-child(13), td:nth-child(14), td:nth-child(15), td:nth-child(16), td:nth-child(17)'
        },
		ajax : {
			url : '<c:url value="/mm/workOrdStatusList"/>',
			type : 'POST',
			data : {
					'bomCd'		:	'B00001'
			}
		},	
		rowId : 'workOrdNo',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{data : 'workOrdNo'},
			{
				render : function(data, type, row, meta) {
					return '-';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '-';
				}
			},
			{ data : 'm00001',
				render : function(data, type, row, meta) {
					if(data==null || data=='') {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00001"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00001"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00001"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00001"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00001"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00002',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00002"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00002"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00002"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00002"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00002"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00003',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00003"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00003"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00003"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00003"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00003"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00004',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00004"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00004"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00004"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00004"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00004"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00005',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00005"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00005"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00005"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00005"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00005"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00006',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00006"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00006"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00006"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00006"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00006"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00007',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00007"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00007"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00007"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00007"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00007"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00008',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00008"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00008"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00008"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00008"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00008"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00009',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00009"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00009"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00009"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00009"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00009"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00010',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00010"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00010"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00010"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00010"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00010"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00011',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00011"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00011"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00011"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00011"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00011"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00012',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00012"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00012"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00012"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00012"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00012"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00013',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00013" style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00013" style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00013" style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00013" style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00013" style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
		],
		columnDefs: [
			{ targets: [4,5,6,7,8,9,10,11,12,13,14,15,16], className: 'p-0' }
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    drawCallback: function() {
	    	$(".minorPrcssPopover").hunterPopup({
	    		title:'소공정별 목록조회',
	    		content: $('#popoverContent'),
	    		placement:'left',
	    		width: '100%'
	    	});

	    	$('.minorPrcssPopover').on('click',function() {
		    	$('#minorPrcssTable').removeClass('d-none');
	    		workHistSmallListTable.cell($(this).parent()).select();
	    		
	    		var row = workHistSmallListTable.cell($(this).parent()).index().row;
	    		var col = workHistSmallListTable.cell($(this).parent()).index().column;

		    	workOrdNoVal = workHistSmallListTable.row(row).data().workOrdNo;
		    	middlePrcssCdVal = $(this).attr('id');

		    	$('#minorPrcssTable').DataTable().ajax.reload( function () {});

		    	if(col > 11) {
			    	$('.Hunter-pop-up').css('left',parseInt($('.Hunter-pop-up').css('left'))-400);
			    	$('body').append('<style>.Hunter-pop-up:after{left:400px;}</style>');
			    	$('body').append('<style>.Hunter-pop-up:before{left:400px;}</style>');
			    } else {
			    	$('body').append('<style>.Hunter-pop-up:after{left:20px;}</style>');
			    	$('body').append('<style>.Hunter-pop-up:before{left:20px;}</style>');
				}


				console.log($(this).offset());
				console.log($(this).outerHeight());
		    })
		}
	});


	// 마우스 스크롤 event
	$("#left-list").on('scroll',function(e){ 
		//popup창 이동
		$('#Hunter-pop-up').css('top',$('#workHistSmallListTable tbody .selected').offset().top+$('#workHistSmallListTable tbody .selected').outerHeight()+15);
	});




	// 소형일반 목록조회
	let workHistMiddleListTable = $('#workHistMiddleListTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : true,
		info : false,
		ordering : true,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : 100,
		select: {
            style: 'single',
            toggleable: false,
            items: 'cell',
            selector: 'td:nth-child(5), td:nth-child(6), td:nth-child(7), td:nth-child(8), td:nth-child(9), td:nth-child(10), td:nth-child(11), td:nth-child(12), td:nth-child(13), td:nth-child(14), td:nth-child(15), td:nth-child(16), td:nth-child(17), td:nth-child(18)'
        },
		ajax : {
			url : '<c:url value="/mm/workOrdStatusList"/>',
			type : 'POST',
			data : {
					'bomCd'		:	'B00002'
			}
		},	
		rowId : 'workOrdNo',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{data : 'workOrdNo'},
			{
				render : function(data, type, row, meta) {
					return '-';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '-';
				}
			},
			{ data : 'm00014',
				render : function(data, type, row, meta) {
					if(data==null || data=='') {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00014"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00014"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00014"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00014"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00014"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00015',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00015"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00015"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00015"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00015"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00015"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00016',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00016"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00016"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00016"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00016"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00016"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00017',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00017"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00017"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00017"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00017"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00017"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00018',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00018"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00018"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00018"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00018"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00018"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00019',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00019"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00019"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00019"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00019"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00019"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00020',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00020"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00020"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00020"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00020"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00020"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00021',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00021"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00021"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00021"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00021"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00021"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00022',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00022"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00022"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00022"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00022"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00022"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00023',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00023"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00023"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00023"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00023"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00023"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00024',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00024"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00024"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00024"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00024"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00024"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00025',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00025"  style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00025"  style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00025"  style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00025"  style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00025"  style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00026',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00026" style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00026" style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00026" style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00026" style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00026" style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
			{ data : 'm00027',
				render : function(data, type, row, meta) {
					if(data==null) {
						return '';
					} else if(data == 'PD') {
						return '<p class="mb-0 minorPrcssPopover" id="M00027" style="color:black; font-size:15px;">●</p>';
					} else if(data == 'WI') {
						return '<p class="mb-0 minorPrcssPopover" id="M00027" style="color:blue; font-size:15px;">●</p>';
					} else if(data == 'WC') {
						return '<p class="mb-0 minorPrcssPopover" id="M00027" style="color:red; font-size:15px;">●</p>';
					} else if(data == 'EX') {
						return '<p class="mb-0 minorPrcssPopover" id="M00027" style="color:#CCCCCC; font-size:15px;">●</p>';
					} else {
						return '<p class="mb-0 minorPrcssPopover" id="M00027" style="color:brown; font-size:15px;">●</p>';
					}
				}
			},
		],
		columnDefs: [
			{ targets: [4,5,6,7,8,9,10,11,12,13,14,15,16,17], className: 'p-0' }
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    drawCallback: function() {
	    	$(".minorPrcssPopover").hunterPopup({
	    		title:'소공정별 목록조회',
	    		content: $('#popoverContent'),
	    		placement:'left',
	    		width: '100%'
	    	});

	    	$('.minorPrcssPopover').on('click',function() {
		    	$('#minorPrcssTable').removeClass('d-none');
	    		workHistSmallListTable.cell($(this).parent()).select();
	    		
	    		var row = workHistSmallListTable.cell($(this).parent()).index().row;
	    		var col = workHistSmallListTable.cell($(this).parent()).index().column;

		    	workOrdNoVal = workHistSmallListTable.row(row).data().workOrdNo;
		    	middlePrcssCdVal = $(this).attr('id');

		    	$('#minorPrcssTable').DataTable().ajax.reload( function () {});

		    	if(col > 11) {
			    	$('.Hunter-pop-up').css('left',parseInt($('.Hunter-pop-up').css('left'))-400);
			    	$('body').append('<style>.Hunter-pop-up:after{left:400px;}</style>');
			    	$('body').append('<style>.Hunter-pop-up:before{left:400px;}</style>');
			    } else {
			    	$('body').append('<style>.Hunter-pop-up:after{left:20px;}</style>');
			    	$('body').append('<style>.Hunter-pop-up:before{left:20px;}</style>');
				}


				console.log($(this).offset());
				console.log($(this).outerHeight());
		    })
		}
	});
</script>
</body>
</html>