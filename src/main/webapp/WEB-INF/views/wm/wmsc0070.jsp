<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">LOT등록</li>
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
					<div class="table-responsive" style="height: 430px;">
						<table id="bizOrderTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>수주번호</th>
									<th>구분</th>
									<th>품명</th>
									<th class="text-center">주문수량</th>
									<th>납기일</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table-responsive">
						<table id="workOrderTable" class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="10%">
								<col width="5%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>수주상세번호</th>
									<th>작지번호</th>
									<th>구분</th>
									<th>품명(type)</th>
									<th>납기일</th>
									<th>생산예정일</th>
									<th>주문수량</th>
									<th>지시수량</th>
									<th>긴급여부</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>

				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix"
				id="rfSidenav" style="width: 35%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand2"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
					</div>
				</div>
				<!--/오른쪽 등록 부분 상단 버튼 영역-->
				<form id="form">
					<div class="table-responsive">
						<table class="table table-sm table-bordered mb-2"
							id="bizOrderOutDtlTable">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="text-center">수주상세번호</th>
								<td><input class="form-control" type="text"
									class="form-control" id="contDtlNo" name="contDtlNo" disabled></td>
								<th class="text-center">구분</th>
								<td><input class="form-control" type="text"
									id="contGubunNm" name="contGubunNm" disabled /> <input
									class="form-control" type="hidden" id="contGubun"
									name="contGubun" disabled /></td>
							</tr>
							<tr>
								<th class="text-center">품명</th>
								<td><input class="form-control" type="text" id="itemNm"
									class="form-control" name="itemNm" disabled> <input
									class="form-control" type="hidden" id="itemCd"
									class="form-control" name="itemCd"> <input
									class="form-control" type="hidden" id="itemRev"
									class="form-control" name="itemRev"></td>
								<th class="text-center">주문수량</th>
								<td><input type="text" class="form-control" id="dtlOrdCnt"
									name="dtlOrdCnt" style="text-align: right;" disabled></td>
							</tr>
							<tr>
								<th class="text-center">납품일</th>
								<td>
									<div class="form-group input-sub m-0 row">
										<input class="form-control" type="text" id="etcDate"
											name="etcDate" disabled />
										<button
											onclick="fnPopUpCalendar(etcDate,etcDate,'yyyy-mm-dd')"
											class="btn btn-secondary input-sub-search"
											name="shipReqDateCalendar" type="button" disabled>
											<span class="oi oi-calendar"></span>
										</button>
									</div>
								</td>
								<th></th>
								<td></td>
							</tr>

						</table>
					</div>
				</form>
				<div class="card-body col-sm-12 p-2">
					<button type="button" class="btn btn-warning float-right mr-1"
						id="rowDelete" disabled>삭제</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<button type="button" class="btn btn-primary float-right mr-1"
						id="btnEdit">수정</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<button type="button" class="btn btn-primary float-right mr-1"
						id="rowAdd" disabled>추가</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>

				</div>
				<div class="table-responsive">
					<table id="workOrderDtlTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>작지번호</th>
								<th>LOT NO</th>
								<th>생산예정일</th>
								<th>지시수량</th>
								<th>긴급여부</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
				</div>
				<!--/오른쪽 등록 부분 상단 버튼 영역-->
				<button type="button" class="btn btn-primary float-right mr d-none"
					id="btnSave">저장</button>
				<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
					type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status"
						aria-hidden="true"></span> 처리중
				</button>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "wmsc0070";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","LOT등록"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";
	var index = 0;
	var contDtlNo = null;
	var contGubun = null;
	var itemCd = null;
	var workOrdNo = null;
	var dtlOrdCnt = null;
	var lotNo = null;
	var ordDtlDesc = null;
	var workOrdNo;

	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
		console.log(activeTab);
	});

	var workEmerYnCode = new Array(); //단위
	<c:forEach items="${workEmerYnCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	//영업주문관리 목록조회(외부)
	let bizOrderTable = $('#bizOrderTable').DataTable(
			{
				language : lang_kor,
				paging : true,
				searching : false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="bs/bizOrderEtcAdmList"/>',
					type : 'GET',
					data : {
						'startDate' : function() {
							return rcvDateOutFromCal.replace(/-/g, '');
						},
						'endDate' : function() {
							return rcvDateOutToCal.replace(/-/g, '');
						}
					},
				},
				rowId : 'contNo',
				columns : [
						{
							data : 'contDtlNo'
						},
						{
							data : 'contGubunNm'
						},
						{
							data : 'itemNm'
						},
						{
							data : 'dtlOrdCnt'
						},
						{
							data : 'etcDl',
							render : function(data, type, row, meta) {
								var result = (data == null) ? "" : moment(data)
										.format("YYYY-MM-DD");
								return result;
							}
						}, ],
				columnDefs : [ {
					"targets" : [ 3 ],
					render : $.fn.dataTable.render.number(','),
					"className" : "text-right"
				}, {
					"className" : "text-center",
					"targets" : "_all"
				} ],
				order : [ [ 0, 'asc' ] ],

			});

	//영업주문관리 외부 목록 클릭시
	$('#bizOrderTable tbody').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');

				} else {
					$('#bizOrderTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}
				sideView = 'edit';
				$('#btnSave').addClass('d-none');
				$('#rowAdd').attr('disabled', true);
				$('#rowDelete').attr('disabled', true);
				contDtlNo = bizOrderTable.row(this).data().contDtlNo;
				$.ajax({
					url : '<c:url value="/bs/bizOrderDtlRead"/>',
					type : 'GET',
					data : {
						'contDtlNo' : function() {
							return contDtlNo;
						}
					},
					success : function(res) {
						let data = res.data;

						if (res.result == 'ok') {
							sideView = 'edit';

							$('#contDtlNo').val(data.contDtlNo);
							$('#contGubun').val(data.contGubun);
							$('#contGubunNm').val(data.contGubunNm);
							$('#itemNm').val(data.itemNm);
							$('#itemCd').val(data.itemCd);
							$('#itemRev').val(data.itemRev);
							$('#dtlOrdCnt').val(addCommas(data.dtlOrdCnt));
							//$('#workOrdQty').val(data.workOrdQty);
							$('#etcDate').val(
									moment(data.etcDate).format("YYYY-MM-DD"));

						} else {
							toastr.error(res.message);
						}
					}
				});

				$('#workOrderTable').DataTable().ajax.reload(function() {
				});
				$('#workOrderDtlTable').DataTable().ajax.reload(function() {
				});

				$('#btnEdit').attr('disabled', false);

			});

	//작지테이블 
	let workOrderTable = $('#workOrderTable').DataTable(
			{
				language : lang_kor,
				paging : true,
				searching : false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 5,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderDataList"/>',
					type : 'GET',
					data : {

						'contDtlNo' : function() {
							return contDtlNo;
						}
					},
				},
				rowId : 'contDtlNo',
				columns : [
						{
							data : 'contDtlNo'
						},
						{
							data : 'workOrdNo'
						},
						{
							data : 'itemGubunNm'
						},
						{
							data : 'itemNm'
						},
						{
							data : 'dlvDate',
							render : function(data, type, row, meta) {
								var result = (data == null) ? "" : moment(data)
										.format("YYYY-MM-DD");
								return result;
							}
						},
						{
							data : 'outputDate',
							render : function(data, type, row, meta) {
								var result = (data == null) ? "" : moment(data)
										.format("YYYY-MM-DD");
								return result;
							}
						}, {
							data : 'dtlOrdCnt'
						}, {
							data : 'workOrdQty'
						}, {
							data : 'workEmerYnNm'
						}, {
							data : 'ordDesc'
						}, ],
				columnDefs : [ {
					"targets" : [ 6, 7 ],
					render : $.fn.dataTable.render.number(','),
					"className" : "text-right"
				}, {
					"className" : "text-center",
					"targets" : "_all"
				}, ],
				order : [ [ 0, 'asc' ] ],

			});

	//작지상세 테이블 
	let workOrderDtlTable = $('#workOrderDtlTable')
			.DataTable(
					{
						language : lang_kor,
						paging : true,
						searching : false,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						pageLength : 5,
						//ordering: false,
						ajax : {
							url : '<c:url value="po/workOrderDataList"/>',
							type : 'GET',
							data : {

								'contDtlNo' : function() {
									return contDtlNo;
								}
							},
						},
						rowId : 'contDtlNo',
						columns : [
								{
									data : 'workOrdNo',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control" type="text" name="workOrdNo" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control" type="text" name="workOrdNo" style="max-width:100%;" disabled/>';
										}
									}
								},
								{
									data : 'ordLotNo',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control" type="text" name="ordDesc" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control" type="text" name="ordDesc" style="max-width:100%;" disabled/>';
										}
									}
								},
								{
									data : 'outputDate',
									render : function(data, type, row, meta) {
										var html = "";

										if (data != null) {
											html = '<div class="form-group input-sub m-0">';
											html += '<input class="form-control" type="text" id="outputDate'
													+ index
													+ '" value="'
													+ moment(data).format(
															"YYYY-MM-DD")
													+ '" name="outputDate" disabled>';
											html += '<button onclick="fnPopUpCalendar(outputDate'
													+ index
													+ ',outputDate'
													+ index
													+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
													+ index
													+ '" name="btnOutputDate" type="button" disabled>';
											html += '<span class="oi oi-calendar"></span></button>';
											html += '</div>';
											index++;

										} else {
											html = '<div class="form-group input-sub m-0">';
											html += '<input class="form-control" type="text" id="outputDate'+index+'" value="'+serverDate+'" name="outputDate" >';
											html += '<button onclick="fnPopUpCalendar(outputDate'
													+ index
													+ ',outputDate'
													+ index
													+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'
													+ index
													+ '" name="btnOutputDate" type="button" >';
											html += '<span class="oi oi-calendar"></span></button>';
											html += '</div>';
											index++;
										}

										return html;

									}
								},
								{
									data : 'workOrdQty',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control" type="text" name="workOrdQty" value="'
													+ addCommas(data)
													+ '"style="max-width:100%; text-align:right;" disabled/>';
										} else {
											return '<input class="form-control" type="text" name="workOrdQty" style="max-width:100%;" />';
										}
									}
								},
								{
									data : 'workEmerYn',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(workEmerYnCode,
												'workEmerYn', data, row, meta);
										return html;
									}
								},
								{
									data : 'ordDesc',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input class="form-control" type="text" name="ordDesc" value="'
													+ data
													+ '"style="max-width:100%;" disabled/>';
										} else {
											return '<input class="form-control" type="text" name="ordDesc" style="max-width:100%;" disabled/>';
										}
									}
								}, ],
						columnDefs : [ {
							"className" : "text-center",
							"targets" : "_all"
						}, ],
						order : [ [ 0, 'asc' ] ],
						drawCallback : function(settings) {
							$('#workOrderDtlTable tbody tr').find('td select')
									.attr('disabled', true);
							$('#workOrderDtlTable tbody tr').find(
									'td input[name=workOrdNo]').attr(
									'disabled', true);
						},

					});

	//작지상세테이블 선택시
	$('#workOrderDtlTable tbody').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');

				} else {
					$('#workOrderDtlTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}
				workOrdNo = workOrderDtlTable.row(this).data().workOrdNo;
				console.log(workOrdNo);
				$('#rowDelete').attr('disabled', false);
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

		$('#bizOrderTable').DataTable().ajax.reload(function() {
		});
		$('#workOrderTable').DataTable().clear().draw();
		$('#form').each(function() {
			this.reset();
		});

	});

	//수정버튼 클릭시
	$('#btnEdit').on(
			'click',
			function() {
				if (sideView != "edit") {
					toastr.warning("수정할 항목을 선택해주세요.");
					return false;
				}
				//화면처리				
				$('#rowAdd').attr('disabled', false);
				$('#rowDelete').attr('disabled', true);
				$('#workOrderDtlTable tbody tr').find('td input').attr(
						'disabled', false);
				$('#workOrderDtlTable tbody tr').find('td button').attr(
						'disabled', false);
				$('#workOrderDtlTable tbody tr').find('td select').attr(
						'disabled', false);
				$('#btnSave').removeClass('d-none');

				sideView = "edit"
			});

	// 열추가
	$('#rowAdd').on(
			'click',
			function() {

				$('#workOrderDtlTable').DataTable().row.add({
					"workEmerYn" : "002"
				}).draw(false);
				$('#workOrderDtlTable tbody tr').find('td select').attr(
						'disabled', false);
				$('#workOrderDtlTable tbody tr').find('td input[name=ordDesc]')
						.attr('disabled', false);

				$('#btnSave').removeClass('d-none');

			});

	// 열삭제
	$('#rowDelete').on(
			'click',
			function() {

				//삭제여부 판단
				$.ajax({
					url : '<c:url value="po/workOrderAdmDelete"/>',
					type : 'GET',
					data : {
						'workOrdNo' : workOrdNo
					},
					success : function(res) {
						if (res.result == "ok") {
							toastr.success("삭제되었습니다.");
							$('#workOrderDtlTable').DataTable().rows(
									'.selected').remove().draw(false);

						} else if (res.result == "exist") {
							toastr.error("이미 작업지시에 들어간 작지번호입니다.");
						} else {
							toastr.error(res.message);
						}
					}
				});

			});

	$('#btnSave')
			.on(
					'click',
					function() {
						var check = true;
						var dataArray = new Array();
						var workOrdQty = 0;
						if (workOrderDtlTable.data().count() == 0) {
							toastr.warning('라인을 추가해주세요');
							$('#rowAdd').focus();
							check = false;
							return false;
						}

						$('#workOrderDtlTable tbody tr')
								.each(
										function(index, item) {
											if ($(this).find('td input').eq(2)
													.val() == "") {
												toastr
														.warning('생산예정일을 입력해주세요.');
												check = false;
												return false;
											}
											if ($(this).find('td input').eq(3)
													.val() == "") {
												toastr.warning('지시수량을 입력해주세요.');
												check = false;
												return false;
											}

											var rowData = new Object();

											rowData.contDtlNo = $("#contDtlNo")
													.val();
											rowData.itemCd = $("#itemCd").val();
											rowData.itemGubun = $("#contGubun")
													.val();
											rowData.itemRev = $("#itemRev")
													.val();
											rowData.dlvDate = $("#etcDate")
													.val().replace(/-/g, "");
											rowData.workOrdNo = $(this).find(
													'td input[name=workOrdNo]')
													.val();
											rowData.dtlOrdCnt = $("#dtlOrdCnt")
													.val();
											rowData.dtlOrdQty = $("#dtlOrdCnt")
													.val();
											rowData.outputDate = $(this)
													.find(
															'td input[name=outputDate]')
													.val();
											rowData.workOrdQty = $(this)
													.find(
															'td input[name=workOrdQty]')
													.val();
											rowData.workEmerYn = $(this)
													.find(
															'td select[name=workEmerYn] option:selected')
													.val();
											rowData.ordDesc = $(this).find(
													'td input[name=ordDesc]')
													.val();
											workOrdQty += parseInt($(this)
													.find(
															'td input[name=workOrdQty]')
													.val());
											dataArray.push(rowData);
										});

						if (workOrdQty > parseInt($("#dtlOrdCnt").val())) {
							toastr.warning('주문수량을 초과하였습니다.');
							check = false;
							return false;
						}

						var url = '<c:url value="/po/workOrderAdmCreate"/>';

						/* if (sideView == "edit") {
							url = '<c:url value="/po/workOrderAdmUpdate"/>';
						} */
						if (check == true) {
							$
									.ajax({
										url : url,
										type : 'POST',
										datatype : 'json',
										data : JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										success : function(res) {
											let data = res.data;
											if (res.result == 'ok') {

												$('#btnSave')
														.addClass('d-none');
												$('#workOrderTable')
														.DataTable().ajax
														.reload(function() {
														});
												$('#workOrderDtlTable tbody tr')
														.find('td input').attr(
																'disabled',
																true);
												$('#workOrderDtlTable tbody tr')
														.find('td button')
														.attr('disabled', true);
												$('#workOrderDtlTable tbody tr')
														.find('td select')
														.attr('disabled', true);
												$('#rowDelete').attr(
														'disabled', true);
												$('#rowAdd').attr('disabled',
														true);
												if (sideView == 'add') {
													toastr.success("등록되었습니다.");
												} else {
													toastr.success("수정되었습니다.");
												}

											} else {
												toastr.error(res.message);
											}
										},
										complete : function() {

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
</script>

   	

</body>
</html>
