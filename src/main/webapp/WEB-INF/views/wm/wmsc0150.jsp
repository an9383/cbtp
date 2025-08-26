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
				<li class="breadcrumb-item active">생산일보</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="table-responsive">
						<table id="prcssCodeAdmTable" class="table table-bordered">
							<colgroup>
								<col width="12%">
								<col width="6%">
								<col width="7%">
								<col width="12%">
								<col width="14%">
								<col width="8%">
								<col width="12%">
								<col width="6%">
								<col width="8%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>

									<th>작지번호</th>
									<th>구분</th>
									<th>중공정</th>
									<th>소공정</th>
									<th>품명</th>
									<th>LOT_NO</th>
									<th>설비명</th>
									<th>작업자</th>
									<th>작지일</th>
									<th>투입수량</th>
									<th>생산수량</th>
									<th>상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	// let currentPage = 'dealCorp';

	let currentHref = "wmsc0150";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","생산일보"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";

	var startDate = serverDateFrom;
	var endDate = serverDateTo;

	// 목록
	let prcssCodeAdmTable = $('#prcssCodeAdmTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
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
							url : '<c:url value="/wm/workOrderPrcssAllList"/>',
							type : 'GET',
							data : {
								'startDate' : function() {
									return startDate.replace(/-/g, '');
								},
								'endDate' : function() {
									return endDate.replace(/-/g, '');
								}
							},
						},
						rowId : 'workOrdNo',
						columns : [ {
							data : 'workOrdNo'
						}, {
							data : 'itemGubunNm',
							'className' : 'text-center'
						}, {
							data : 'middlePrcssNm',
							'className' : 'text-center'
						}, {
							data : 'minorPrcssNm',
							'className' : 'text-center'
						}, {
							data : 'itemNm',
							'className' : 'text-center'
						}, {
							data : 'lotNo',
							render : function(data, type, row, meta) {
								if (data != null) {
									return data;
								} else {
									return '';
								}

							},
							'className' : 'text-center'
						}, {
							data : 'equipNm',
							'className' : 'text-center'
						}, {
							data : 'workChargrNm',
							'className' : 'text-center'
						}, {
							data : 'ordDate',
							render : function(data, type, row, meta) {
								return moment(data).format('YYYY-MM-DD');
							},
							'className' : 'text-center'
						}, {
							data : 'targetQty',
							render : function(data, type, row, meta) {
								return addCommas(data);
							},

							'className' : 'text-right'
						}, {
							data : 'outputQty',
							render : function(data, type, row, meta) {
								return addCommas(data);
							},

							'className' : 'text-right'
						}, {
							data : 'workStatusNm',
							'className' : 'text-center'
						}, ],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '생산일보'
						}, 'print' ],
					});

	//자재(일자)
	var sysdate = "${serverTime}";

	var html = '<div class="row">';
	html += '&nbsp;<div class="form-group input-sub m-0 row">';
	html += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutFrom" name="rcvDateOutFrom" disabled/>';
	html += '<button onclick="fnPopUpCalendar(rcvDateOutFrom,rcvDateOutFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutFromCalendar" type="button">';
	html += '<span class="oi oi-calendar"></span>';
	html += '</button>';
	html += '</div>';
	html += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutTo" name="rcvDateOutTo" disabled/>';
	html += '<button onclick="fnPopUpCalendar(rcvDateOutTo,rcvDateOutTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutToCalendar" type="button">';
	html += '<span class="oi oi-calendar"></span>';
	html += '</button>';
	html += '</div>';
	html += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnOutRetv">조회</button>'
	html += '</div>';

	$('#prcssCodeAdmTable_length').html(html);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	//자재 조회 버튼 클릭시
	$('#btnOutRetv').on('click', function() {
		startDate = $('#rcvDateOutFrom').val();
		endDate = $('#rcvDateOutTo').val();

		$('#prcssCodeAdmTable').DataTable().ajax.reload(function() {
		});
	});
</script>

</body>
</html>
