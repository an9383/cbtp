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
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">재고이동관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="inventoryTable">

							<thead class="thead-light" style="font-size: 11px;">
								<tr>
									<th class="text-center-th">구분</th>
									<th class="text-center-th">CODE</th>
									<th class="text-center-th">REV</th>
									<th class="text-center-th">ITEM</th>
									<th class="text-center-th">SPEC</th>
									<th class="text-center-th">단위</th>
									<th class="text-center-th">현재고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card" id="formBox">

					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
					</div>


					<div class="table-responsive">
						<table class="table table-lg table-bordered mb-2" id="dtlTable">
							<thead class="thead-light" style="font-size: 11px;">
								<tr>
									<th class="text-center-th">LOT NO</th>
									<th class="text-center-th">Barcode NO</th>
									<th class="text-center-th">현재고</th>
									<th class="text-center-th">창고</th>
									<th class="text-center-th">구역</th>
									<th class="text-center-th">위치</th>

								</tr>
							</thead>
						</table>
					</div>

				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "tmsc0030";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "재고이동관리");
	
	var preInWhsDateFromCal = "${serverDateFrom}";
	var preInWhsDateToCal = "${serverDateTo}";
	var preInWhsDateCal = "${serverDateTo}";
	var matrlGubunCd = null;

	//작업내역 테이블
	let inventoryTable = $('#inventoryTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : false,
						searching : true,
						ordering : false,
						processing : false,
						autoWidth : false,
						lengthChange : true,
						pageLength : 20,
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', 'excel', 'print' ],

					});

	$('#inventoryTable tbody').empty();

	$('#inventoryTable tbody').append(
			'<tr>' + '<td>소형</td>' + '<td>1000010600</td>' + '<td>100</td>'
					+ '<td>CORE 40-1</td>' + '<td>□40, 0.35t</td>'
					+ '<td>EA</td>' + '<td>10</td>' + '</tr>' + '<tr>'
					+ '<td>소형</td>' + '<td>3001158000</td>' + '<td>100</td>'
					+ '<td>LEAD RUBBER</td>'
					+ '<td>소형 저전압용 (3600070000 동일품)</td>' + '<td>EA</td>'
					+ '<td>5</td>' + '</tr>' + '<tr>' + '<td>소형</td>'
					+ '<td>1000010704</td>' + '<td>100</td>' + '<td>절연필름</td>'
					+ '<td>□40-100W (47.8mmx6.0mm)</td>' + '<td>EA</td>'
					+ '<td>20</td>' + '</tr>' + '<tr>' + '<td>소형</td>'
					+ '<td>1000011700</td>' + '<td>100</td>' + '<td>PCB</td>'
					+ '<td>□40</td>' + '<td>EA</td>' + '<td>20</td>' + '</tr>'
					+ '<tr>' + '<td>소형</td>' + '<td>1000011300</td>'
					+ '<td>100</td>' + '<td>CORE 40-2</td>'
					+ '<td>□40, 0.35t</td>' + '<td>EA</td>' + '<td>10</td>'
					+ '</tr>');

	$('#inventoryTable tbody')
			.on(
					'click',
					'tr',
					function() {
						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							console.log("등록중입니다.");
							return false;
						}
						if ($(this).hasClass('selected')) {
							$(this).removeClass('selected');
						} else {
							$('#inventoryTable').DataTable().$('.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}

						$('#dtlTable tbody').empty();

						$('#dtlTable tbody').append(
								'<tr>' + '<td>20210202-001</td>'
										+ '<td>20210202-001</td>'
										+ '<td>10</td>' + '<td>원자재 소형</td>'
										+ '<td>A</td>' + '<td>가-3</td>'
										+ '</tr>' + '<tr>'
										+ '<td>20210127-008</td>'
										+ '<td>20210127-008</td>'
										+ '<td>20</td>' + '<td>원자재 소형</td>'
										+ '<td>B</td>' + '<td>나-3</td>'
										+ '</tr>' + '<tr>'
										+ '<td>20210202-002</td>'
										+ '<td>20210202-002</td>'
										+ '<td>15</td>' + '<td>원자재 소형</td>'
										+ '<td>A</td>' + '<td>가-3</td>'
										+ '</tr>');
					});

	var html1 = '<div class="row">&nbsp;<label class="input-label-sm">구분</label><div class="form-group input-sub m-0 row">';
	html1 += '</div>';
	html1 += '<div class="form-group input-sub m-0 row">';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;';
	html1 += '<select id="matrlGubunCd" class="custom-select"></select>';
	html1 += '&nbsp;&nbsp;&nbsp;';
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button></div>';

	$('#inventoryTable_length').html(html1);
	//선택박스 처리
	selectBoxAppend(gubunCode, "matrlGubunCd", "", "2");
	$('#preStartWhsDate').val(moment().subtract(7, 'd').format('YYYY-MM-DD'));
	$('#preEndWhsDate').val(moment().format('YYYY-MM-DD'));

	$('#btnRetv').on('click', function() {
		preInWhsDateFromCal = $('#preStartWhsDate').val().replace(/-/g, "");
		preInWhsDateToCal = $('#preEndWhsDate').val().replace(/-/g, "");

		$('#inventoryTable').DataTable().ajax.reload(function() {
		});

	});
</script>
</body>
</html>
