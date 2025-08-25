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
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">불량집계현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 100%;">
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">수입검사</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">완제품검사</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<br>
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div id="table1">
						<div class="table-responsive">
							<table id="outsourcingDtlTable" class="table table-bordered">
								<colgroup>
									<col width="10%">
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>구분</th>
										<th>불량등록일</th>
										<th>발주번호</th>
										<th>ITEM</th>
										<th>발생위치</th>
										<th>검사자</th>
										<th>불량유형</th>
										<th class="text-center">가입고수량</th>
										<th class="text-center">검사수량</th>
										<th class="text-center">합격수량</th>
										<th class="text-center">불량수량</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div id="table2" class="d-none">
						<div class="table-responsive">
							<table id="insourcingDtlTable" class="table table-bordered">
								<colgroup>
									<col width="10%">
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>작지번호</th>
										<th>구분</th>
										<th>불량등록일</th>
										<th>제품명</th>
										<th>발생위치</th>
										<th>검사자</th>
										<th>결합유형</th>
										<th class="text-center">검사수량</th>
										<th class="text-center">합격수량</th>
										<th class="text-center">불량수량</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "qmsc0070";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "불량집계현황");

	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";

	var outsrcNo = null;
	var itemNm = null;
	var itemGubun = null;
	var outQty = null;
	var reqDate = null;
	var outCorpNm = null;
	var outCorpCd = null;
	var outChargr = null;
	var outChargrNm = null;
	var outsrcCorpNm = null;
	var outsrcCorpCd = null;
	var outsrcChargr = null;
	var outsrcChargrNm = null;

	var index = 0;
	var tableIdx = 0;
	var activeTab = '출고';

	$('#btnOutAdd').attr('disabled', true);
	$('#btnOutDel').attr('disabled', true);
	$('#btnInAdd').attr('disabled', true);
	$('#btnInDel').attr('disabled', true);

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
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

		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	//출고 탭 클릭시
	$('#tab1Nav').on('click', function() {
		$('#formOut').each(function() {
			this.reset();
		});
		sideView = 'add';
		$('#btnOutSave').addClass('d-none');
		$('#btnOutAdd').attr('disabled', true);
		$('#btnOutDel').attr('disabled', true);

		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');
		$('#form1').removeClass('d-none');
		$('#form2').addClass('d-none');

		$('#outsourcingDtlTable').DataTable().ajax.reload(function() {
		});
		$('#outDtlTable').DataTable().clear().draw();

	});

	//입고 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#formIn').each(function() {
			this.reset();
		});
		sideView = 'add';
		$('#btnInSave').addClass('d-none');
		$('#btnInAdd').attr('disabled', true);
		$('#btnInDel').attr('disabled', true);

		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');
		$('#form1').addClass('d-none');
		$('#form2').removeClass('d-none');

		$('#fileSearch').addClass('d-none');
		$('#fileTag').removeClass('d-none');

		$('#fpFn').text("");

		$('#insourcingDtlTable').DataTable().ajax.reload(function() {
		});
		$('#inDtlTable').DataTable().clear().draw();
	});

	//수입검사
	let outsourcingDtlTable = $('#outsourcingDtlTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : true,
						pageLength : 20,
						ajax : {
							url : '<c:url value="qm/itemFaultyAdmList"/>',
							type : 'GET',
							data : {
								'startDate' : function() {
									return serverDateFrom.replace(/-/g, "");
								},
								'endDate' : function() {
									return serverDateTo.replace(/-/g, "");
								}
							},
						},
						rowId : 'poNo',
						columns : [ {
							data : 'partGubun'
						}, {
							data : 'inspectDate',
							render : function(data, type, row, meta) {
								return moment(data).format("YYYY-MM-DD")
							}
						}, {
							data : 'poNo'
						}, {
							data : 'partNm'
						}, {
							render : function(data, type, row, meta) {
								return '수입검사';
							}
						}, {
							data : 'inspectChargrNm'
						}, {
							data : 'inspectDesc'
						}, {
							data : 'preInWhsQty'
						}, {
							data : 'inspectCnt'
						}, {
							data : 'pairCnt'
						}, {
							data : 'faultyCnt'
						}, ],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '불량유형관리'
						}, 'print' ],
						columnDefs : [ {
							targets : [ 8, 9, 10 ],
							render : $.fn.dataTable.render.number(','),
							className : 'text-right'
						}, {
							"className" : "text-center",
							"targets" : "_all"
						}, ],

					});

	// 완제품검사
	let insourcingDtlTable = $('#insourcingDtlTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-3'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,

						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : true,
						pageLength : 20,
						ajax : {
							url : '<c:url value="qm/itemCompleteFaultyAdmList"/>',
							type : 'GET',
							data : {
								'startDate' : function() {
									return serverDateFrom.replace(/-/g, "");
								},
								'endDate' : function() {
									return serverDateTo.replace(/-/g, "");
								}
							},
						},
						rowId : 'workOrdNo',
						columns : [ {
							data : 'workOrdNo'
						}, {
							data : 'itemGubunNm'
						}, {
							data : 'inspectDate',
							render : function(data, type, row, meta) {
								return moment(data).format("YYYY-MM-DD")
							}
						}, {
							data : 'itemNm'
						}, {
							data : 'baseInfoGubunNm'
						}, {
							data : 'inspectChargrNm'
						}, {
							data : 'faultyTypeNm'
						}, {
							data : 'inspectQty'
						}, {
							data : 'pairQty'
						}, {
							data : 'faultyQty'
						}, ],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '완제품검사(부적합관리)'
						}, 'print' ],
						columnDefs : [ {
							targets : [8, 9],
							render : $.fn.dataTable.render.number(','),
							className : 'text-right'
						}, {
							"className" : "text-center",
							"targets" : "_all"
						}, ],

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

	$('#outsourcingDtlTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	//영업주문관리(내부 일자)
	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInFrom" name="rcvDateInFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateInFrom,rcvDateInFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInTo" name="rcvDateInTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateInTo,rcvDateInTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnInRetv">조회</button>'
	html1 += '</div>';

	$('#insourcingDtlTable_length').html(html1);
	$('#rcvDateInFrom').val(serverDateFrom);
	$('#rcvDateInTo').val(serverDateTo);

	$('#btnOutRetv').on('click', function() {
		serverDateFrom = $('#rcvDateOutFrom').val();
		serverDateTo = $('#rcvDateOutTo').val();

		$('#outsourcingDtlTable').DataTable().ajax.reload(function() {
		});
		$('#formOut').each(function() {
			this.reset();
		});

	});

	$('#btnInRetv').on('click', function() {
		serverDateFrom = $('#rcvDateInFrom').val();
		serverDateTo = $('#rcvDateInTo').val();

		$('#insourcingDtlTable').DataTable().ajax.reload(function() {
		});
		$('#formIn').each(function() {
			this.reset();
		});
	});
</script>

   	

</body>
</html>
