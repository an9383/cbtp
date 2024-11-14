<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">외주발주마감</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<!-- .table-responsive -->
				<div class="table-responsive">
					<table id="outsourcingAdmTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>외주발주번호</th>
								<th>납기일</th>
								<th>작지번호</th>
								<th>공정</th>
								<th>구분</th>
								<th>품명(Type)</th>
								<th>출고처</th>
								<th class="text-center">발주수량</th>
								<th class="text-center">출고수량</th>
								<th class="text-center">미출고수량</th>
								<th class="text-center">입고수량</th>
								<th class="text-center">미입고수량</th>
								<th>발주마감</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "iosc0080";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","외주발주마감"); 
	let viewIdx;
	let sideView = 'add';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";

	let outsourcingAdmTable = $('#outsourcingAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="io/outsourcingAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, '');
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, '');
				}
			},
		},
		rowId : 'outsrcNo',
		columns : [
				{
					data : 'outsrcNo'
				},
				{
					data : 'dlvDate',
					render : function(data, type, row, meta) {
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{
					data : 'workOrdNo'
				},
				{
					render : function(data, type, row, meta) {
						return '사출외주';
					}
				},
				{
					data : 'itemGubunNm'
				},
				{
					data : 'itemNm'
				},
				{
					data : 'outCorpNm'
				},
				{
					data : 'outsrcQty'
				},
				{
					data : 'outQty'
				},
				{
					data : 'outRemainQty'
				},
				{
					data : 'inQty'
				},
				{
					data : 'inRemainQty'
				},
				{
					data : 'outsrcStatusNm',
					render : function(data, type, row, meta) {
						if (row['outsrcStatus'] == '006') {
							return '<button type="button" class="btn btn-primary" id="btnDead-'
									+ meta.row
									+ '" name="btnDead" onclick="btnDead('
									+ meta.row
									+ ');">마감</button>';
						} else {
							if (row['outsrcStatus'] == '004') {
								return '<button type="button" class="btn btn-primary" disabled >완료</button>';
							} else {
								return '<button type="button" class="btn btn-warning" id="btnDeadCancel-'
								+ meta.row
								+ '" name="btnDeadCancel" onclick="btnDead('
								+ meta.row
								+ ');">마감취소</button>';	
							}
						}
					}
				}, ],
		columnDefs : [ {
			targets : [ 7, 8, 9, 10, 11 ],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],

	});



	//마감버튼 클릭시 
	function btnDead(index) {
		$.ajax({
			url : '<c:url value="io/updateOutsrcStatus" />',
			type : 'GET',
			data : {
				'outsrcNo' : outsourcingAdmTable.row(index).data().outsrcNo,
				'outsrcStatus' : outsourcingAdmTable.row(index).data().outsrcStatus,
			},
			success : function() {
				$('#outsourcingAdmTable').DataTable().ajax.reload();
				console.log(outsrcYn);
			}
		});
	}


	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="outsrcDateFrom" name="outsrcDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(outsrcDateFrom,outsrcDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outsrcDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="outsrcDateTo" name="outsrcDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(outsrcDateTo,outsrcDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outsrcDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#outsourcingAdmTable_length').html(html1);
	$('#outsrcDateFrom').val(serverDateFrom);
	$('#outsrcDateTo').val(serverDateTo);

	// 조회버튼
	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#outsrcDateFrom').val();
		serverDateTo = $('#outsrcDateTo').val();
		$('#outsourcingAdmTable').DataTable().ajax.reload(function() {
		});
	});
</script>

</body>
</html>
