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
				<li class="breadcrumb-item active">LOT 추적(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div id="section" style="height: calc(100vh - 1rem - 115px); background-color:#ffffff; margin: 5px; padding: 5px;
									display: grid;
									grid-template-areas:	'top'
															'middle';
									grid-template-rows: 33px 1fr;
									grid-template-columns: 1fr;
									width: 100%;">
				<div id="top" style="grid-area: top;">
					<div class="row" style="padding: 0px 10px;">
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">수주상세번호 : </div>
						<div class="my-1 mr-2 d-flex align-items-center">
							<input class="form-control" type="text" id="contDtlNo">
						</div>
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">작업지시번호 : </div>
						<div class="my-1 mr-2 d-flex align-items-center">
							<input class="form-control" type="text" id="workOrdNo">
						</div>
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">자재 LOT NO : </div>
						<div class="my-1 mr-2 d-flex align-items-center">
							<input class="form-control" type="text" id="matrlLotNo">
						</div>
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">통합검색 : </div>
						<div class="my-1 mr-4 d-flex align-items-center">
							<input class="form-control" type="text" id="textSearch">
						</div>
						<div class="my-1 d-flex align-items-center">
							<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
						</div>
					</div>
				</div>
				<div id="middle" style="grid-area: middle; margin: 0px; overflow: auto;">
					<table class="table table-bordered m-0" id="lotTrackingTable">
						<thead class="thead-light">
							<tr>
								<th class="text-center align-middle">수주상세번호</th>
								<th class="text-center align-middle">작업지시번호</th>
								<th class="text-center align-middle">생산LOTNO</th>
								<th class="text-center align-middle">작업일자</th>
								<th class="text-center align-middle">작업자</th>
								<th class="text-center align-middle">가공상태</th>
								<th class="text-center align-middle">가공시작시간</th>
								<th class="text-center align-middle">가공종료시간</th>
								<th class="text-center align-middle">측정상태</th>
								<th class="text-center align-middle">측정시작시간</th>
								<th class="text-center align-middle">측정종료시간</th>
								<th class="text-center align-middle">측정판정</th>
								<th class="text-center align-middle">자재LOTNO</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "wmsc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","LOT 추적(레이저)");







	

	//조회 버튼 click
	$('#btnSearch').on('click',function() {
		$('#lotTrackingTable').DataTable().ajax.reload( function () {});
	});

	// LOT추적
	let lotTrackingTable = $('#lotTrackingTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 200000,
		scrollY: '70vh',
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="wm/lotTrackingListLaser"/>',
			type : 'POST',
			data : {
				'contDtlNo'		: function() { return $('#contDtlNo').val(); },
				'workOrdNo'		: function() { return $('#workOrdNo').val(); },
				'barcodeNo'	: function() { return $('#matrlLotNo').val(); },
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{ data : 'contDtlNo', className : 'text-center align-middle' },
			{ data : 'workOrdNo', className : 'text-center align-middle' },
			{ data : 'lotNo', className : 'text-center align-middle' },
			{ data : 'workOrdDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return moment(data, 'YYYYMMDD').format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{ data : 'workChargrNm', className : 'text-center align-middle' },
			{ data : 'workStatus', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						let workStatus = data.split(',');
						if(_.filter(workStatus, function(v) { return v == 'E'; }).length != 0) {
							return '<span style="color: #00ff00;">완료</span>';
						} else if(_.filter(workStatus, function(v) { return v == 'S'; }).length != 0) {
							return '<span style="color: #0000ff;">가공중</span>';
						} else {
							return '-';
						}
					} else {
						return '-';
					}
				}
			},
			{ data : 'workStartDate', className : 'text-center align-middle' },
			{ data : 'workEndDate', className : 'text-center align-middle' },
			{ data : 'checkStatus', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						let checkStatus = data.split(',');
						if(_.filter(checkStatus, function(v) { return v == 'E'; }).length != 0) {
							return '<span style="color: #00ff00;">완료</span>';
						} else if(_.filter(checkStatus, function(v) { return v == 'S'; }).length != 0) {
							return '<span style="color: #0000ff;">측정중</span>';
						} else {
							return '-';
						}
					} else {
						return '-';
					}
				}
			},
			{ data : 'checkStartDate', className : 'text-center align-middle' },
			{ data : 'checkEndDate', className : 'text-center align-middle' },
			{ className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '-';
				}
			},
			{ data : 'barcodeNo', className : 'text-center align-middle' },
		],
		columnDefs : [],
	    order: [],
	    buttons: ['excel'],
	    drawCallback: function() {
		    $('#lotTrackingTable_filter').addClass('d-none');
		    $('#lotTrackingTable_wrapper').find('.dataTables_scrollBody').css('height','calc(100vh - 1rem - 250px)');
		}
	});

	// 통합검색
	$('#textSearch').on('keyup',function() {
		$('#lotTrackingTable_filter').find('input').val($(this).val());
		$('#lotTrackingTable_filter').find('input').trigger('keyup');
	});
</script>

</body>
</html>
