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
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">목표관리</li>
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
						<table id="objectiveAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">KPI</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">계산식</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">전년실적</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">금년목표</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">가중치</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">구분</th>
									<th colspan="4" class="text-center"
										style="vertical-align: middle">1/4분기</th>
									<th colspan="4" class="text-center"
										style="vertical-align: middle">2/4분기</th>
									<th colspan="4" class="text-center"
										style="vertical-align: middle">3/4분기</th>
									<th colspan="4" class="text-center"
										style="vertical-align: middle">4/4분기</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">누계</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">점수</th>
									<th rowspan="2" class="text-center"
										style="vertical-align: middle">경향</th>
								</tr>
								<tr>
									<th class="text-center" style="vertical-align: middle">1월</th>
									<th class="text-center" style="vertical-align: middle">2월</th>
									<th class="text-center" style="vertical-align: middle">3월</th>
									<th class="text-center" style="vertical-align: middle">소계</th>
									<th class="text-center" style="vertical-align: middle">4월</th>
									<th class="text-center" style="vertical-align: middle">5월</th>
									<th class="text-center" style="vertical-align: middle">6월</th>
									<th class="text-center" style="vertical-align: middle">소계</th>
									<th class="text-center" style="vertical-align: middle">7월</th>
									<th class="text-center" style="vertical-align: middle">8월</th>
									<th class="text-center" style="vertical-align: middle">9월</th>
									<th class="text-center" style="vertical-align: middle">소계</th>
									<th class="text-center" style="vertical-align: middle">10월</th>
									<th class="text-center" style="vertical-align: middle">11월</th>
									<th class="text-center" style="vertical-align: middle">12월</th>
									<th class="text-center" style="vertical-align: middle">소계</th>
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

<!-- Modal Start-->
<div class="modal fade" id="objectivePopupModal" tabindex="-1"
	role="dialog" aria-labelledby="objectivePopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document"
		style="min-width: 1500px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="objectivePopupLabel">목표관리</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form">
					<div class="table-responsive">
						<table id="objectivePopupTable"
							class="table table-sm table-bordered">
							<thead class="thead-light">
								<tr>
									<th>KPI</th>
									<th>가중치</th>
									<th>1월</th>
									<th>2월</th>
									<th>3월</th>
									<th>4월</th>
									<th>5월</th>
									<th>6월</th>
									<th>7월</th>
									<th>8월</th>
									<th>9월</th>
									<th>10월</th>
									<th>11월</th>
									<th>12월</th>
								</tr>
							</thead>
						</table>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnSave">저장</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->

<style>
#th{
	padding-bottom: 12px;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","목표관리"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = null;

	var kpiCode = new Array(); // kpi
	<c:forEach items="${kpiCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	kpiCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료  

	selectBoxAppend(kpiCode, "useYnOut", "", ""); //사용여부

	//목표관리 목록조회
	let objectiveAdmTable = $('#objectiveAdmTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : false,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : true,
						pageLength : 20,
						ajax : {
							url : '<c:url value="bs/objectiveAdmDataList"/>',
							type : 'GET',
							data : {
								'startDate' : function() {
									return serverDateFrom.substring(0, 4);
								},
							}
						},
						rowId : '',
						columns : [
								{
									data : 'kpiNm',
									name : 'rowspan'
								},
								{
									data : 'calc',
									name : 'rowspan'
								},
								{
									data : 'lastYearGoal',
									name : 'rowspan'
								},
								{
									data : 'newYearGoal',
									name : 'rowspan'
								},
								{
									data : 'weight',
									name : 'rowspan'
								},
								{
									data : 'objGubunNm',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = '달성률';
										}
										return result;
									}
								},
								{
									data : 'jan',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'feb',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'mar',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'sogye1',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'apr',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'may',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'jun',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'sogye2',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'jul',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'aug',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'sep',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'sogye3',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'oct',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'nov',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'dec',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'sogye4',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								},
								{
									data : 'total',
									render : function(data, type, row, meta) {
										var result = data;
										if (row['objGubun'] == "003") {
											result = data;
											result = parseFloat(result)
													.toFixed(2)
													+ '%'
										} else {
											result = parseInt(data);
										}
										return result;
									}
								}, {
									render : function(data, type, row, meta) {
										return '';
									}
								}, {
									render : function(data, type, row, meta) {
										return '';
									}
								},

						],
						columnDefs : [

								{
									targets : [ 6, 7, 8, 9, 10, 11, 12, 13, 14,
											15, 16, 17, 18, 19, 20, 21, 22, 23 ],
									render : $.fn.dataTable.render.number(',')
								},
								{
									targets : [ 6, 7, 8, 9, 10, 11, 12, 13, 14,
											15, 16, 17, 18, 19, 20, 21, 22, 23 ],
									className : 'text-right'
								},

						],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', 'excel', 'print' ],
						rowsGroup : [ 'rowspan:name', [ 0 ] ],
					});

	//입력모달조회
	let objectivePopupTable = $('#objectivePopupTable')
			.DataTable(
					{
						language : lang_kor,
						paging : true,
						info : false,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : true,
						pageLength : 20,
						ajax : {
							url : '<c:url value="bs/objectiveAdmReadDataList"/>',
							type : 'GET',
							data : {
								'startDate' : function() {
									return serverDate;
								},
							}
						},
						rowId : '',
						columns : [
								{
									data : 'kpi',
									render : function(data, type, row, meta) {
										return selectBoxHtml2(kpiCode, 'kpi',
												data, row, meta);
									}
								},
								{
									data : 'weight',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="weight" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="weight" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'jan',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="jan" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="jan" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'feb',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="feb" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="feb" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'mar',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="mar" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="mar" value="" style="max-width:100%;"/>';
										}
									}
								},

								{
									data : 'apr',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="apr" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="apr" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'may',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="may" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="may" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'jun',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="jun" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="jun" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'jul',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="jul" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="jul" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'aug',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="aug" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="aug" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'sep',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="sep" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="sep" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'oct',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="oct" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="oct" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'nov',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="nov" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="nov" value="" style="max-width:100%;"/>';
										}
									}
								},
								{
									data : 'dec',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control text-right" type="text" name="dec" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control text-right" type="text" name="dec" value="" style="max-width:100%;"/>';
										}
									}
								}

						],
						order : [ [ 0, 'asc' ] ],
						drawCallback : function(settings) {
							$('#objectivePopupTable select').attr('disabled',
									true);

						},

					});

	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	var html2 = '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary float-right mr-2" id="btnObject">목표관리</button>';

	var html3 = '<div class="row">';
	html3 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html3 += '<select name="YEAR2" id="YEAR2" title="년도" class="select w80 col-12 custom-select"></select>';
	html3 += '</div>';
	html3 += '</div>';

	var html4 = '';
	html4 += '<button type="button" class="btn btn-warning float-right mr-2" id="btnRowDelete">삭제</button>';
	html4 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnEdit">수정</button>';
	html4 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnRowAdd">추가</button>';

	$('#objectiveAdmTable_length').html(html1);
	$('#objectiveAdmTable_filter').html(html2);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#YEAR option:selected').val();
		$('#objectiveAdmTable').DataTable().ajax.reload(function() {
		});
	});

	$('#objectivePopupTable_length').html(html3);
	$('#objectivePopupTable_filter').html(html4);

	$('#YEAR2').on('change', function() {
		serverDate = $('#YEAR2 option:selected').val();
		$('#objectivePopupTable').DataTable().ajax.reload(function() {
		});
	});

	$('#btnObject').on('click', function() {
		$('#objectivePopupTable').DataTable().ajax.reload(function() {
		});
		$('#objectivePopupModal').modal('show');
	});

	$('#objectivePopupTable').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');
				} else {
					$('#objectivePopupTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

			});

	$('#btnEdit').on('click', function() {
		$('#objectivePopupTable input[type=text]').attr('disabled', false);
		$('#objectivePopupTable select').attr('disabled', false);

	});

	$('#btnRowAdd').on('click', function() {
		if ($('#objectivePopupTable').DataTable().data().count() > 4) {
			toastr.warning("5개이상 추가하실수 없습니다.");
			return false;
		}
		$('#objectivePopupTable').DataTable().row.add({}).draw(false);
		$('#objectivePopupTable select').attr('disabled', false);
	});

	$('#btnRowDelete').on(
			'click',
			function() {
				$('#objectivePopupTable').DataTable().rows('.selected')
						.remove().draw(false);
			});

	$('#btnSave')
			.on(
					'click',
					function() {

						var dataArray = new Array();
						var duplicateCheckArray = new Array();
						var check = true;

						if ($('#objectivePopupTable').DataTable().data()
								.count() == 0) {
							toastr.warning('목록을 추가해 주세요.');
							check = false;
							return false;
						}

						$('#objectivePopupTable tbody tr')
								.each(
										function() {

											if ($(this)
													.find(
															'td select[name=kpi] option:selected')
													.val() == "") {
												toastr.warning('kpi를 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=weight]')
													.val() == "") {
												toastr.warning('가중치를 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=jan] ')
													.val() == "") {
												toastr.warning('1월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=feb] ')
													.val() == "") {
												toastr.warning('2월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=mar] ')
													.val() == "") {
												toastr.warning('3월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=apr] ')
													.val() == "") {
												toastr.warning('4월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=may] ')
													.val() == "") {
												toastr.warning('5월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=jun] ')
													.val() == "") {
												toastr.warning('6월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=jul] ')
													.val() == "") {
												toastr.warning('7월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=aug] ')
													.val() == "") {
												toastr.warning('8월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=sep] ')
													.val() == "") {
												toastr.warning('9월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=oct] ')
													.val() == "") {
												toastr.warning('10월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=nov] ')
													.val() == "") {
												toastr.warning('11월을 입력해주세요');
												check = false;
												return false;
											}
											if ($(this).find(
													'td input[name=dec] ')
													.val() == "") {
												toastr.warning('12월을 입력해주세요');
												check = false;
												return false;
											}

											var rowData = new Object();

											rowData.kpi = $(this)
													.find(
															'td select[name=kpi] option:selected')
													.val();
											rowData.weight = $(this).find(
													'td input[name=weight]')
													.val();
											rowData.jan = $(this).find(
													'td input[name=jan]').val();
											rowData.feb = $(this).find(
													'td input[name=feb]').val();
											rowData.mar = $(this).find(
													'td input[name=mar]').val();
											rowData.apr = $(this).find(
													'td input[name=apr]').val();
											rowData.may = $(this).find(
													'td input[name=may]').val();
											rowData.jun = $(this).find(
													'td input[name=jun]').val();
											rowData.jul = $(this).find(
													'td input[name=jul]').val();
											rowData.aug = $(this).find(
													'td input[name=aug]').val();
											rowData.sep = $(this).find(
													'td input[name=sep]').val();
											rowData.oct = $(this).find(
													'td input[name=oct]').val();
											rowData.nov = $(this).find(
													'td input[name=nov]').val();
											rowData.dec = $(this).find(
													'td input[name=dec]').val();
											rowData.objGubun = '001';
											rowData.objYear = $(
													'#YEAR2 option:selected')
													.val();

											dataArray.push(rowData);
											duplicateCheckArray
													.push($(this)
															.find(
																	'td select[name=kpi] option:selected')
															.val());

										});

						if (duplicateCheck(duplicateCheckArray) == false) {
							toastr.warning('중복된 kpi는 입력할 수 없습니다.');
							check = false;
							return false;
						}

						if (check == true) {
							if (dataArray.length == 0) {
								toastr.warning('목록에 정확한 값을 선택하거나 입력해 주세요.');
								check = false;
								return false;
							}
						}
						var url = '<c:url value="bs/objectiveAdmCreate"/>';

						if (check) {
							$
									.ajax({
										url : url,
										type : 'POST',
										datatype : 'json',
										data : JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										success : function(res) {
											if (res.result == 'ok') {

												toastr.success('저장되었습니다.');

											} else if (res.result == 'fail') {
												toastr.error("저장에 실패했습니다.");
											} else {
												toastr.error(res.message);
											}
										},
										complete : function() {
											$(
													'#objectivePopupTable input[type=text]')
													.attr('disabled', true);
											$('#objectivePopupTable select')
													.attr('disabled', true);
											$('#objectivePopupTable')
													.DataTable().ajax
													.reload(function() {
													});
											$('#objectiveAdmTable').DataTable().ajax
													.reload(function() {
													});
											$('#btnAddConfirm').removeClass(
													'd-none');
											$('#btnAddConfirmLoading')
													.addClass('d-none');
										}
									});

						}
					});

	function selectBoxHtml2(obj, id, sVal, row, meta) {
		//$('#'+ id).empty();
		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '"><option value="">선택</option>';
		//var shtml = '<select class="mySelect" data-col="' + meta.col + '" ><option value="">선택</option>';

		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm
						+ "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	function duplicateCheck(data) {
		const dataSet = new Set();
		var result = true;

		$.each(data, function(index, item) {
			dataSet.add(item);
		});

		if (dataSet.size != data.length) {
			result = false;
		}

		return result;
	}
</script>
<script>
      $(document).ready(function(){
          setDateBox();
      }); 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+5); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        $("#YEAR2").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+5); y++){
            $("#YEAR2").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }
    }
</script>

</body>
</html>
