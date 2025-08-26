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
				<li class="breadcrumb-item active">폐기등록/현황</li>
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
						<table id="faultAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>작지번호</th>
									<th>구분</th>
									<th>폐기등록일</th>
									<th>품명(Type)</th>
									<th>거래처</th>
									<th>발생위치</th>
									<th>결함유형</th>
									<th>폐기수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-3">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
					</div>
					<form id="form">
						<div class="table-responsive">
							<table class="table table-bordered" id="">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td>
										<div class="row">
											<div class="input-sub m-0">
												<input type="text" class="form-control" id="workOrdNo"
													name="workOrdNo" disabled>
												<button type="button"
													class="btn btn-primary input-sub-search"
													id="btnSelWorkOrdNo" onClick="selectFaultDtl()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
									<th>거래처</th>
									<td><input type="text" class="form-control"
										id="dealCorpNm" disabled> <input type="hidden"
										id="dealCorpCd"></td>
								</tr>
								<tr>
									<th>구분</th>
									<td><input type="text" class="form-control" id="gubun"
										name="gubun" maxlength="25" disabled></td>
									<th>품명(Type)</th>
									<td><input type="text" class="form-control" id="itemNm"
										name="itemNm" maxlength="25" disabled></td>

								</tr>
								<tr>
									<th>결함유형</th>
									<td><input type="text" class="form-control" id="faultCase"
										name="faultCase" maxlength="25" disabled></td>
									<th>발생위치</th>
									<td><input type="text" class="form-control"
										id="locationCd" name="locationCd" maxlength="25" disabled></td>

								</tr>
								<tr>
									<th>폐기등록일</th>
									<td>
										<div class="form-group input-sub m-0 row">
											<input class="form-control" type="text" id="faultDate"
												name="faultDate" disabled />
											<button
												onclick="fnPopUpCalendar(faultDate,faultDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												name="faultDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>폐기수량</th>
									<td><input type="text" class="form-control" id="faultQty"
										name="faultQty" maxlength="25" disabled></td>

								</tr>
								<tr>
									<th>등록자</th>
									<td><select class="custom-select" id="chargrCd" disabled></select></td>
									<th>비고</th>
									<td><input type="text" class="form-control" id="faultDesc"
										name="faultDesc" maxlength="20" disabled></td>

								</tr>

								<!--==========/table 내용 추가==========-->
							</table>
						</div>
					</form>
					<div>
						<button type="button" class="btn btn-primary float-right mr-2"
							id="btnSave" disabled>저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>

				</div>
			</div>
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->
<!-- 폐기등록 목록 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="faultDtlPopUpModal"
	tabindex="-1" role="dialog" aria-labelledby="faultDtlPopUpModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="faultDtlPopUpLabel">페기등록목록 조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="faultDtlTable" class="table table-bordered">
					<thead class="thead-light">
						<tr>
							<th>작지번호</th>
							<th>구분</th>
							<th>품명(Type)</th>
							<th>검사자</th>
							<th>결함유형</th>
						</tr>
					</thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary float-right mr-2"
					id="btnSelect" disabled>선택</button>
				<button type="button" class="btn btn-primary float-right mr-2"
					data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 폐기등록 목록 모달 종료-->
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

	let currentHref = "wmsc0120";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","폐기등록/현황"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	/* 	// 공통코드 처리 시작
	 var useYnCode=new Array();

	 <c:forEach items="${useYn}" var="info">
	 var json=new Object();
	 json.baseCd="${info.baseCd}";
	 json.baseNm="${info.baseNm}";
	 useYnCode.push(json);
	 </c:forEach>
	 // 공통코드 처리 끝
	
	 selectBoxAppend(useYnCode, "useYn", "", ""); */

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	// 목록
	let faultAdmTable = $('#faultAdmTable').DataTable({

		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center"
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '폐기등록현황'
		}, 'print' ]
	});

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="reworkDateFrom" name="reworkDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(reworkDateFrom,reworkDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="reworkDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="reworkDateTo" name="reworkDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(reworkDateTo,reworkDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="reworkDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#faultAdmTable_length').html(html1);
	$('#reworkDateFrom').val(serverDateFrom);
	$('#reworkDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#reworkDateFrom').val();
		serverDateTo = $('#reworkDateTo').val();

		//$('#faultAdmTable').DataTable().ajax.reload(function() {});		
		$('#form').each(function() {
			this.reset();
		});

	});

	//폐기등록 목록 모달
	var faultDtlTable;
	function selectFaultDtl() {

		faultDtlTable = $('#faultDtlTable').DataTable({
			language : lang_kor,
			destroy : true,
			paging : false,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			pageLength : 12,
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [ 'copy', {
				extend : 'excel',
				title : '폐기등록현황'
			}, 'print' ]
		});
		$('#faultDtlPopUpModal').modal('show');
	}
</script>

</body>
</html>
