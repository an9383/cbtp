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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">외주발주미입고현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="outsourcingAdmTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="7%">
								<col width="7%">
								<col width="11%">
								<col width="10%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
							</colgroup>
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
<style>
#th{
	padding-bottom: 12px;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "iosc0090";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","외주발주미입고현황"); 
	
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
			url : '<c:url value="io/outsourcingStatusList"/>',
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
		columns : [ {
			data : 'outsrcNo'
		}, {
			data : 'dlvDate',
			render : function(data, type, row, meta) {
				return moment(data).format('YYYY-MM-DD');
			}
		}, {
			data : 'workOrdNo'
		}, {
			render : function(data, type, row, meta) {
				return '사출외주';
			}
		}, {
			data : 'itemGubunNm'
		}, {
			data : 'itemNm'
		}, {
			data : 'outCorpNm'
		}, {
			data : 'outsrcQty'
		}, {
			data : 'outQty'
		}, {
			data : 'outRemainQty'
		}, {
			data : 'inQty'
		}, {
			data : 'inRemainQty'
		}, ],
		columnDefs : [ {
			targets : [ 7, 8, 9, 10, 11 ],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],

	});

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
