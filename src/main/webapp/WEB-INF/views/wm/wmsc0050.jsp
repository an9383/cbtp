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
				<li class="breadcrumb-item active">작업순위조정</li>
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
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="workOrdTable" class="table table-bordered">

							<thead class="thead-light">
								<tr>
									<th class="text-center">작지번호</th>
									<th class="text-center">구분</th>
									<th class="text-center">품명(Type)</th>
									<th class="text-center">생산예정일</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">긴급여부</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="mt-2">
						<button type="button" class="btn btn-primary d-none float-right"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>

					</div>
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text" class="form-control" id="workOrdNo"
										name="workOrdNo" disabled></td>
									<th>구분</th>
									<td><input type="text" class="form-control"
										id="itemGubunNm" name="itemGubunNm" disabled> <input
										type="hidden" class="form-control" id="itemGubun"
										name="itemGubun" disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text" class="form-control"
										style="max-width: 100%" id="itemNm" name="itemNm" disabled>
										<input type="hidden" class="form-control"
										style="max-width: 100%" id="itemCd" name="itemCd"></td>
									<th>지시수량</th>
									<td><input type="text" class="form-control"
										id="workOrdQty" name="workOrdQty" disabled></td>
								</tr>
								<tr>
									<th>생산예정일</th>
									<td><div class="form-group input-sub m-0 row">
											<input class="form-control" type="text" id="outputDate"
												name="outputDate" disabled>
											<button
												onclick="fnPopUpCalendar(outputDate,outputDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												name="outputDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div></td>
									<th>긴급여부</th>
									<td><select class="custom-select" id="workEmerYn" disabled></select></td>
								</tr>
							</table>
						</div>
					</form>
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

	let currentHref = "wmsc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","작업순위조정"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";
	var workOrdNo = null;
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	//공통코드 처리 시작      
	var workEmerYnCode = new Array(); //단위
	<c:forEach items="${workEmerYnCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(workEmerYnCode, "workEmerYn", "", "2");

	// 목록
	let workOrdTable = $('#workOrdTable').DataTable(
			{
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="po/workOrderDayDataList"/>',
					type : 'GET',
					data : {
						'startDate' : function() {
							return rcvDateOutFromCal.replace(/-/g, "");
						},
						'endDate' : function() {
							return rcvDateOutToCal.replace(/-/g, "");
						}
					},
				},
				rowId : 'workOrdNo',
				columns : [
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
							data : 'outputDate',
							render : function(data, type, row, meta) {
								var result = (data == null) ? "" : moment(data)
										.format("YYYY-MM-DD");
								return result;
							}
						}, {
							data : 'workOrdQty'
						}, {
							data : 'workEmerYnNm'
						}, ],
				order : [ [ 0, 'asc' ] ],
				columnDefs : [ {
					targets : [ 4 ],
					render : $.fn.dataTable.render.number(',')
				}, {
					targets : [ 4 ],
					className : 'text-right'
				}, ],
				rowReorder : {
					dataSrc : 'outputDate',
				},
			});

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '일자 &nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" style="width:97px;" type="text" id="rcvDateOutFrom" name="rcvDateOutFrom" disabled/>';
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

	$('#workOrdTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	$('#btnOutRetv').on('click', function() {
		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
		rcvDateOutToCal = $('#rcvDateOutTo').val();

		$('#workOrdTable').DataTable().ajax.reload(function() {
		});
		$('#form').each(function() {
			this.reset();
		});

	});

	// 보기
	$('#workOrdTable tbody').on(
			'click',
			'tr',
			function() {

				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');
				} else {
					$('#workOrdTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

				workOrdNo = workOrdTable.row(this).data().workOrdNo;
				$('#workOrdNo').val(workOrdTable.row(this).data().workOrdNo);
				$('#itemGubunNm')
						.val(workOrdTable.row(this).data().itemGubunNm);
				$('#itemNm').val(workOrdTable.row(this).data().itemNm);
				$('#workOrdQty').val(workOrdTable.row(this).data().workOrdQty);
				$('#outputDate').val(
						moment(workOrdTable.row(this).data().outputDate)
								.format("YYYY-MM-DD"));
				selectBoxAppend(workEmerYnCode, "workEmerYn", workOrdTable.row(
						this).data().workEmerYn, "");

				$('#btnSave').removeClass('d-none');

			});

	// 저장 처리
	$('#btnSave').on('click', function() {

		url = '<c:url value="/po/workOrderEmerUpdate"/>';

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'menuAuth' : 'wmsc0010',
				'workOrdNo' : function() {
					return workOrdNo
				},
				'workEmerYn' : $('#workEmerYn option:selected').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#workOrdTable').DataTable().ajax.reload(function() {
					});
					$('#btnSave').addClass('d-none');
					toastr.success('수정되었습니다.');

				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
	});
</script>

</body>
</html>
