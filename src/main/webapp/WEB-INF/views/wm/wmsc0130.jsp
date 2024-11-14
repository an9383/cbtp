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
				<li class="breadcrumb-item active">외주관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 54%;">
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">출고</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">입고</a></li>
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
									<col width="13%">
									<col width="19%">
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="13%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>출고요청일</th>
										<th>외주발주번호</th>
										<th>품명(Type)</th>
										<th>구분</th>
										<th>발주수량</th>
										<th>출고수량</th>
										<th>미출고수량</th>
										<th>출고처</th>
										<th>비고</th>
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
									<col width="13%">
									<col width="19%">
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="13%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>납기일</th>
										<th>외주발주번호</th>
										<th>품명(Type)</th>
										<th>구분</th>
										<th>발주수량</th>
										<th>입고수량</th>
										<th>미입고수량</th>
										<th>입고처</th>
										<th>비고</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 45%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<button type="button" class="btn btn-primary float-left mr-1"
						id="btnEdit">등록</button>
					<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<!--   <button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
                        <button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중</button>
 -->
				</div>
				<!--/오른쪽 등록 부분 상단 버튼 영역-->
				<div id="form1">
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="formOut">
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>출고요청일</th>
									<td><input class="form-control" type="text" id="reqDate"
										name="reqDate" style="min-width: 100%;" disabled /></td>
									<th>출고처</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="outsrcCorpCd"
													style="min-width: 100%;" disabled> <input
													type="text" class="form-control" id="outsrcCorpNm"
													style="min-width: 100%;" disabled>
												<button type="button"
													class="btn btn-primary input-sub-search"
													id="btnOutsrcCorpCd" onClick="selectOutsrcCorpCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>외주발주번호</th>
									<td><input type="text" class="form-control"
										name="outsrcNo" style="min-width: 100%;" disabled></td>
									<th>담당자</th>
									<td>
										<div class="input-sub m-0" style="min-width: 100%">
											<input type="hidden" class="form-control" id="outsrcChargr"
												name="outsrcChargr" style="min-width: 100%" disabled>
											<input type="text" class="form-control" id="outsrcChargrNm"
												name="outsrcChargrNm" style="min-width: 100%" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												id="btnOutsrcChargr" onClick="selectOutsrcChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="card-body col-sm-12 p-1">
							<button type="button" class="btn btn-warning float-right mr-1"
								id="btnOutDel">삭제</button>
							<button class="btn btn-primary d-none"
								id="btnOutDelConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnOutAdd">추가</button>
							<button class="btn btn-primary d-none"
								id="btnOutAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
						<div class="table-responsive">
							<table id="outDtlTable" class="table table-bordered">
							<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="15%">
									<col width="10%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>출고일</th>
										<th>품명(Type)</th>
										<th>구분</th>
										<th>발주수량</th>
										<th>출고수량</th>
										<th>비고</th>
									</tr>
								</thead>
							</table>
						</div>
						<button type="button"
							class="btn btn-primary d-none float-right mr-1" id="btnOutSave">저장</button>
						<button class="btn btn-primary d-none"
							id="btnOutSaveConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</form>
				</div>
				<div id="form2" class="d-none">
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="formIn">
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>납기일</th>
									<td><input class="form-control" type="text" id="dlvDate"
										name="dlvDate" style="min-width: 100%;" disabled /></td>
									<th>입고처</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="insrcCorpCd"
													style="min-width: 100%;" disabled> <input
													type="text" class="form-control" id="insrcCorpNm"
													style="min-width: 100%;" disabled>
												<button type="button"
													class="btn btn-primary input-sub-search"
													id="btnInsrcCorpCd" onClick="selectOutsrcCorpCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>외주발주번호</th>
									<td><input type="text" class="form-control"
										name="outsrcNo" style="min-width: 100%;" disabled></td>
									<th>담당자</th>
									<td>
										<div class="input-sub m-0" style="min-width: 100%">
											<input type="hidden" class="form-control" id="insrcChargr"
												name="insrcChargr" style="min-width: 100%" disabled>
											<input type="text" class="form-control" id="insrcChargrNm"
												name="insrcChargrNm" style="min-width: 100%" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnInsrcChargr"
												onClick="selectOutsrcChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
<!-- 								<tr>
									<th>성적서업로드</th>
									<td colspan="3">
										<div class="row">
											<div class="custom-file d-none" id="fileSearch"
												style="width: 90%;">
												<input type="file" class="custom-file-input" id="fileNm"
													name="fileNm" value=""> <label
													class="custom-file-label" id="fpValue" for="fileNm">파일을
													선택해주세요</label>
											</div>
											
											<div class="form-group m-0 mr-2 row p-0 " id="fileTag" style="width: 80%;">
											<a href="/io/downloadFile" id="fpHref"><span id="fpFn"></span></a>
											</div>
											
											<div class="rightsidebar-close d-none" id="btnFpFileDel"
												style="width: 10%;">
												<button type="button" class="btn"
													onClick="inspectFileNmDel()">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div> 첨부파일1
									</td>
								</tr>
 -->							</table>
						</div>
						<div class="card-body col-sm-12 p-2">
							<button type="button" class="btn btn-warning float-right mr-1"
								id="btnInDel">삭제</button>
							<button class="btn btn-primary d-none"
								id="btnInDelConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnInAdd">추가</button>
							<button class="btn btn-primary d-none"
								id="btnInAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
						<div class="table-responsive">
							<table id="inDtlTable" class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="15%">
									<col width="10%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>입고일</th>
										<th>품명(Type)</th>
										<th>구분</th>
										<th>발주수량</th>
										<th>입고수량</th>
										<th>비고</th>
									</tr>
								</thead>
							</table>
						</div>
						<button type="button"
							class="btn btn-primary d-none float-right mr-1" id="btnInSave">저장</button>
						<button class="btn btn-primary d-none"
							id="btnInSaveConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "54%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "wmsc0130";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","외주관리"); 
	
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
	uiProc(true);
	uiProc2(true);

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

		uiProc(true);
		uiProc2(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	//출고 탭 클릭시
	$('#tab1Nav').on('click', function() {
		uiProc(true);
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
		uiProc2(true);
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

	//외주관리 출고목록조회
	let outsourcingDtlTable = $('#outsourcingDtlTable').DataTable({
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
			url : '<c:url value="io/outsourcingDtlList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, '');
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, '');
				},
				'value' : 'out'
			},
		},
		rowId : 'outsrcNo',
		columns : [ {
			data : 'reqDate',
			render : function(data, type, row, meta) {
				return moment(data).format('YYYY-MM-DD');
			}
		}, {
			data : 'outsrcNo'
		}, {
			data : 'itemNm'
		}, {
			data : 'itemGubunNm'
		}, {
			data : 'outsrcQty'
		}, {
			data : 'outQty'
		}, {
			data : 'outRemainQty'
		}, {
			data : 'outCorpNm',
			render : function(data, type, row, meta) {
				if (row['outsrcCorpNm'] != null) {
					return row['outsrcCorpNm'];
				} else {
					return data;
				}
			}
		}, {
			data : 'outDesc'
		}, ],
		columnDefs : [ {
			targets : [ 4, 5, 6 ],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		}, {
			"className" : "text-center",
			"targets" : "_all"
		}, ],
		order : [ [ 0, 'asc' ] ],

	});

	//외주관리 입고목록조회
	let insourcingDtlTable = $('#insourcingDtlTable').DataTable({
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
			url : '<c:url value="io/insourcingDtlList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, '');
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, '');
				},
				'value' : 'in'
			},
		},
		rowId : 'contNo',
		columns : [ {
			data : 'dlvDate',
			render : function(data, type, row, meta) {
				return moment(data).format('YYYY-MM-DD');
			}
		}, {
			data : 'outsrcNo'
		}, {
			data : 'itemNm'
		}, {
			data : 'itemGubunNm'
		}, {
			data : 'outsrcQty'
		}, {
			data : 'inQty'
		}, {
			data : 'inRemainQty'
		}, {
			data : 'insrcCorpNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return data;
				} else {
					return '-';
				}
			}
		}, {
			data : 'outDesc'
		}, ],
		columnDefs : [ {
			targets : [ 4, 5, 6 ],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		}, {
			"className" : "text-center",
			"targets" : "_all"
		}, ],
		order : [ [ 0, 'asc' ] ],

	});

	//외주출고 목록 클릭시
	$('#outsourcingDtlTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');

		} else {
			$('#outsourcingDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		$('#btnOutSave').addClass('d-none');
		$('#btnOutAdd').attr('disabled', true);
		$('#btnOutDel').attr('disabled', true);

		sideView = 'edit';

		itemNm = outsourcingDtlTable.row(this).data().itemNm;
		itemGubun = outsourcingDtlTable.row(this).data().itemGubunNm;
		outsrcQty = outsourcingDtlTable.row(this).data().outsrcQty;
		outsrcNo = outsourcingDtlTable.row(this).data().outsrcNo;

		$('#reqDate').val(moment(outsourcingDtlTable.row(this).data().reqDate).format('YYYY-MM-DD'));
		$('input[name=outsrcNo]').val(outsrcNo);

		outCorpCd = outsourcingDtlTable.row(this).data().outCorpCd;
		outCorpNm = outsourcingDtlTable.row(this).data().outCorpNm;
		outsrcCorpCd = outsourcingDtlTable.row(this).data().outsrcCorpCd;
		outsrcCorpNm = outsourcingDtlTable.row(this).data().outsrcCorpNm;

		$('#outsrcCorpCd').val(outsrcCorpCd != null ? outsrcCorpCd: outCorpCd);
		$('#outsrcCorpNm').val(outsrcCorpCd != null ? outsrcCorpNm: outCorpNm);

		outChargr = outsourcingDtlTable.row(this).data().outChargr;
		outChargrNm = outsourcingDtlTable.row(this).data().outChargrNm;
		outsrcChargr = outsourcingDtlTable.row(this).data().outsrcChargr;
		outsrcChargrNm = outsourcingDtlTable.row(this).data().outsrcChargrNm;

		$('#outsrcChargr').val(outsrcChargr != null ? outsrcChargr: outChargr);
		$('#outsrcChargrNm').val(outsrcChargr != null ? outsrcChargrNm: outChargrNm);

		$('#outDtlTable').DataTable().ajax.reload(function() {});
	});

	//외주입고 목록 클릭시
	$('#insourcingDtlTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');

		} else {
			$('#insourcingDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		$('#btnInSave').addClass('d-none');
		$('#btnInAdd').attr('disabled', true);
		$('#btnInDel').attr('disabled', true);
		$('#fileSearch').addClass('d-none');
		$('#fileTag').removeClass('d-none');

		sideView = 'edit';

		itemNm = insourcingDtlTable.row(this).data().itemNm;
		itemGubun = insourcingDtlTable.row(this).data().itemGubunNm;
		outsrcQty = insourcingDtlTable.row(this).data().outsrcQty;
		outsrcNo = insourcingDtlTable.row(this).data().outsrcNo;

		$('#dlvDate').val(moment(insourcingDtlTable.row(this).data().dlvDate).format('YYYY-MM-DD'));
		$('input[name=outsrcNo]').val(outsrcNo);
		$('#insrcCorpCd').val(insourcingDtlTable.row(this).data().insrcCorpCd);
		$('#insrcCorpNm').val(insourcingDtlTable.row(this).data().insrcCorpNm);

		outChargr = insourcingDtlTable.row(this).data().outChargr;
		outChargrNm = insourcingDtlTable.row(this).data().outChargrNm;
		insrcChargr = insourcingDtlTable.row(this).data().insrcChargr;
		insrcChargrNm = insourcingDtlTable.row(this).data().insrcChargrNm;

		$('#insrcChargr').val(insrcChargr != null ? insrcChargr : outChargr);
		$('#insrcChargrNm').val(insrcChargr != null ? insrcChargrNm: outChargrNm);

		$('#fpFn').text(insourcingDtlTable.row(this).data().reportFn);

		var reportFnValue = insourcingDtlTable.row(this).data().reportFn;
		(reportFnValue == null || reportFnValue == "") ? $('#fpValue').text("파일을 선택해주세요"): $('#fpValue').text(insourcingDtlTable.row(this).data().reportFn);

		$('#fpHref').attr('href','io/downloadFile?outsrcNo=' + outsrcNo);

		$('#inDtlTable').DataTable().ajax.reload(function() {});

	});

	//출고 상세목록
	let outDtlTable = $('#outDtlTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/outsourcingDtlRead"/>',
			type : 'GET',
			data : {
				'outsrcNo' : function() {
					return outsrcNo;
				},
			},
		},
		columns : [
				{
			data : 'outsrcDtlDate',
			render : function(data, type, row, meta) {
				if (data != null) {
					var html;
					html = '<div class="form-group input-sub m-0 row">';
					html += '<input class="form-control"  type="text" id="outsrcDtlDate'
							+ index
							+ '" name="outsrcDtlDate" value="'
							+ moment(data).format(
									"YYYY-MM-DD")
							+ '" disabled/>'
					html += '<button onclick="fnPopUpCalendar(outsrcDtlDate'
							+ index
							+ ',outsrcDtlDate'
							+ index
							+ ',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="outsrcDtlDateFromCalendar" type="button" disabled>';
					html += '<span class="oi oi-calendar"></span></buton></div>';

					index++;

					return html;
				} else {
					var html;
					html = '<div class="form-group input-sub m-0 row">';
					html += '<input class="form-control"  type="text" id="outsrcDtlDate'+index+'" name="outsrcDtlDate" value="'+serverDateTo+'" disabled/>'
					html += '<button onclick="fnPopUpCalendar(outsrcDtlDate'
							+ index
							+ ',outsrcDtlDate'
							+ index
							+ ',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="outsrcDtlDateFromCalendar" type="button">';
					html += '<span class="oi oi-calendar"></span></buton></div>';

					index++;

					return html;
				}
			}
		},
		{
			data : 'itemNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="text-align:center;" disabled>';
				} else {
					return '<input type="text" class="form-control" name="itemNm" value="'+itemNm+'" style="text-align:center;" disabled>';
				}

			},
		},
		{
			data : 'itemGubunNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" name="itemGubunNm" value="'+data+'" style="text-align:center;" disabled>';
				} else {
					return '<input type="text" class="form-control" name="itemGubunNm" value="'+itemGubun+'" style="text-align:center;" disabled>';
				}

			}
		},
		{
			data : 'outsrcQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" name="outsrcQty" value="'+addCommas(data)+'" style="text-align:right;" disabled>';
				} else {
					return '<input type="text" class="form-control" name="outsrcQty" value="'+addCommas(outsrcQty)+'" style="text-align:right;" disabled>';
				}
			}
		},
		{
			data : 'outsrcDtlQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control autoCal" name="outsrcDtlQty" value="'+addCommas(data)+'" disabled style="text-align:right;" >';
				} else {
					return '<input type="text" class="form-control autoCal" name="outsrcDtlQty" value="" style="text-align:right;" >';
				}
			}
		},
		{
			data : 'outsrcDesc',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" style="max-width:100%;" name="outsrcDesc" value="'
							+ data + '" disabled>';
				} else {
					return '<input type="text" class="form-control" name="outsrcDesc" value="">';
				}
			}
		}, ],
		order : [ [ 0, 'asc' ]
		],
	});

	//입고 상세조회
	let inDtlTable = $('#inDtlTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/insourcingDtlRead"/>',
			type : 'GET',
			data : {
				'outsrcNo' : function() {
					return outsrcNo;
				},
			},
		},
		columns : [
		{
			data : 'insrcDtlDate',
			render : function(data, type, row, meta) {
				if (data != null) {

					html = '<div class="form-group input-sub m-0 row">';
					html += '<input class="form-control"  type="text" id="insrcDtlDate'
							+ index
							+ '" name="insrcDtlDate" value="'
							+ moment(data).format(
									"YYYY-MM-DD")
							+ '" disabled/>'
					html += '<button onclick="fnPopUpCalendar(insrcDtlDate'
							+ index
							+ ',insrcDtlDate'
							+ index
							+ ',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="insrcDtlDateFromCalendar" type="button" disabled>';
					html += '<span class="oi oi-calendar"></span></buton></div>';

					index++;

					return html;
				} else {
					html = '<div class="form-group input-sub m-0 row">';
					html += '<input class="form-control"  type="text" id="insrcDtlDate'+index+'" name="insrcDtlDate" value="'+serverDateTo+'" disabled/>'
					html += '<button onclick="fnPopUpCalendar(insrcDtlDate'
							+ index
							+ ',insrcDtlDate'
							+ index
							+ ',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="insrcDtlDateFromCalendar" type="button">';
					html += '<span class="oi oi-calendar"></span></buton></div>';

					index++;

					return html;
				}
			}
		},
		{
			data : 'itemNm',
			render : function(data, type, row, meta) {
				var value = "";
				if (data != null) {
					return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="'
							+ data + '" disabled>';
				} else {
					return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="'
							+ itemNm + '" disabled>';
				}
			},
		},
		{
			data : 'itemGubunNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="'
							+ data + '" disabled>';
				} else {
					return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="'
							+ itemGubun + '" disabled>';
				}
			}
		},
		{
			data : 'outsrcQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" name="outsrcQty" value="'+addCommas(data)+'" style="text-align:right;" disabled>';
				} else {
					return '<input type="text" class="form-control" name="outsrcQty" value="'+addCommas(outsrcQty)+'" style="text-align:right;" disabled>';
				}
			}
		},
		{
			data : 'insrcDtlQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control autoCal"  name="insrcDtlQty" value="'+addCommas(data)+'" style="text-align:right;" disabled>';
				} else {
					return '<input type="text" class="form-control autoCal" name="insrcDtlQty" value="" style="text-align:right;">';
				}
			}
		},
		{
			data : 'insrcDesc',
			render : function(data, type, row, meta) {
				if (data != null) {
					return '<input type="text" class="form-control" name="insrcDesc" value="'+data+'" disabled>';
				} else {
					return '<input type="text" class="form-control" name="insrcDesc" value="">';
				}
			}
		}, ],
		order : [ [ 0, 'asc' ]

		],
	});

	//외주입고 목록 클릭시
	$('#outDtlTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');

		} else {
			$('#outDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#outDtlTable').DataTable().row(this).index();

		btnView = 'edit';

	});

	//외주입고 목록 클릭시
	$('#inDtlTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');

		} else {
			$('#inDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#inDtlTable').DataTable().row(this).index();

		btnView = 'edit';

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

		$('#outsourcingDtlTable').DataTable().ajax.reload(function() {});
		$('#formOut').each(function() {
			this.reset();
		});

	});

	$('#btnInRetv').on('click', function() {
		serverDateFrom = $('#rcvDateInFrom').val();
		serverDateTo = $('#rcvDateInTo').val();

		$('#insourcingDtlTable').DataTable().ajax.reload(function() {});
		$('#formIn').each(function() {
			this.reset();
		});
	});

	//등록버튼
	$('#btnAdd').on('click', function() {

		
		sideView = 'add';

		$('#btnSave').removeClass('d-none', false);
		
		$('#formOut').each(function() {
			this.reset();
		});
		$('#formIn').each(function() {
			this.reset();
		});
		uiProc(false);
		uiProc2(false);

		$("input[name=rcvDate]").val(serverDateTo);
		$("input[name=shipReqDate]").val(serverDateTo);

		$("input[name=rcvDateIn]").val(serverDateTo);
		$("input[name=shipReqDateIn]").val(serverDateTo);

		$('#btnEdit').attr('disabled', true);

	});

	//수정버튼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		uiProc(false);
		uiProc2(false);

		$('#btnOutAdd').attr('disabled', false);
		$('#btnOutDel').attr('disabled', false);
		$('#btnInAdd').attr('disabled', false);
		$('#btnInDel').attr('disabled', false);
		$('#fileSearch').removeClass('d-none');

		$('#btnOutSave').removeClass('d-none');
		$('#btnInSave').removeClass('d-none');

		$('#fileSearch').removeClass('d-none');
		$('#fileTag').addClass('d-none');

		sideView = 'edit';
	});

	// 외주출고 추가버튼 클릭
	$('#btnOutAdd').on('click', function() {
		$('#outDtlTable').DataTable().row.add({}).draw(false);
	});

	//외주출고 삭제버튼 클릭
	$('#btnOutDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#outDtlTable').DataTable().rows(tableIdx).remove().draw();
	});

	// 외주입고 추가버튼 클릭
	$('#btnInAdd').on('click', function() {

		$('#inDtlTable').DataTable().row.add({}).draw(false);
	});

	//외주입고 삭제버튼 클릭
	$('#btnInDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#inDtlTable').DataTable().rows(tableIdx).remove().draw();
	});

	//외주 출고 등록
	$('#btnOutSave').on('click',function() {
		var dataArray = new Array();
		var check = true;

		//입력값 검사
		if (outDtlTable.data().count() == 0) {
			toastr.warning('외주출고를 추가해주세요.');
			$('#btnOutAdd').focus();
			check = false;
			return false;
		}

		$('#outDtlTable tbody tr').each(function(index, item) {
			
			if ($(this).find('input[name=outsrcDtlQty]').val() == "" ||
					$(this).find('input[name=outsrcDtlQty]').val() == "0") {
				toastr.warning('출고수량을 입력해주세요.');
				$('input[name=outsrcDtlQty]').focus();
				check = false;
				return false;
			}

			var rowData = new Object();

			rowData.outsrcSeq = outDtlTable.row(index).data().outsrcSeq == null ? '': outDtlTable.row(index).data().outsrcSeq;

			rowData.outsrcNo = outsrcNo;
			rowData.outsrcCorpCd = $('#outsrcCorpCd').val();
			rowData.outsrcChargr = $('#outsrcChargr').val();
			rowData.outsrcDtlQty = $(this).find("td input[name=outsrcDtlQty]").val().replace(/,/g, '');
			rowData.outsrcDtlDate = $(this).find("td input[name=outsrcDtlDate]").val().replace(/-/g, '');
			rowData.outsrcDesc = $(this).find("td input[name=outsrcDesc]").val();

			dataArray.push(rowData);
		});

		if (check == true) {
			$.ajax({
				url : '<c:url value="/io/outsourcingDtlCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {

						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else {
							toastr.success('등록되었습니다.');
						}

						uiProc(true);
						$('#btnOutAdd').attr('disabled', true);
						$('#btnOutDel').attr('disabled', true);
						$('#btnOutSave').addClass('d-none');

						sideView = 'add';
						// 보기
						$('#outsourcingDtlTable').DataTable().ajax.reload(function() {});
						$('#outDtlTable').DataTable().ajax.reload(function() {});

					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}
	});

	//외주 입고 등록
	$('#btnInSave').on('click',function() {
		var dataArray = new Array();
		var check = true;

		//입력값 검사
		if (inDtlTable.data().count() == 0) {
			toastr.warning('외주입고를 추가해주세요.');
			$('#btnInAdd').focus();
			check = false;
			return false;
		}

		$('#inDtlTable tbody tr').each(function(index, item) {

			if ($(this).find('input[name=insrcDtlQty]').val() == ""||
					$(this).find('input[name=insrcDtlQty]').val() == "0") {
				toastr.warning('입고수량을 입력해주세요.');
				$('input[name=insrcDtlQty]').focus();
				check = false;
				return false;
			}

			var rowData = new Object();

			rowData.insrcSeq = inDtlTable.row(index).data().insrcSeq == null ? '': inDtlTable.row(index).data().insrcSeq;

			rowData.outsrcNo = outsrcNo;
			rowData.insrcCorpCd = $('#insrcCorpCd').val();
			rowData.insrcChargr = $('#insrcChargr').val();
			rowData.insrcDtlQty = $(this).find("td input[name=insrcDtlQty]").val().replace(/,/g, '');
			rowData.insrcDtlDate = $(this).find("td input[name=insrcDtlDate]").val().replace(/-/g, '');
			rowData.insrcDesc = $(this).find("td input[name=insrcDesc]").val();

			dataArray.push(rowData);
			console.log(rowData);
		});

		if (check == true) {
			$.ajax({
				url : '<c:url value="/io/insourcingDtlCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {

						$('#btnSave').addClass('d-none');

						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else {
							toastr.success('등록되었습니다.');
						}
						uiProc(true);
						$('#btnInAdd').attr('disabled',true);
						$('#btnInDel').attr('disabled',true);
						$('#btnInSave').addClass('d-none');
						
						
						$('#insourcingDtlTable').DataTable().ajax.reload(function() {});
						$('#inDtlTable').DataTable().ajax.reload(function() {});
						sideView = 'add';
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}
	});

	//성적서 등록
	function uploadFile() {
		var formData = new FormData(document.getElementById("formIn"));
		formData.append('outsrcNo', outsrcNo);

		$.ajax({
			url : '<c:url value="io/uploadFile" />',
			type : 'POST',
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				if (res.result == 'ok') {
					$('#fileSearch').addClass('d-none');
					$('#fileTag').removeClass('d-none');
					$('#fpFn').text(res.data);

					// 보기
					$('#insourcingDtlTable').DataTable().ajax.reload(function() {});
					$('#inDtlTable').DataTable().ajax.reload(function() {});
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
	}

	//출고입고 수량 금액 자동 계산
	$(document).on('keyup','.autoCal',function(event) {
		var sumQty = 0;
		let num = 0;

		var data = $(this).val();
		
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}else{
			$(this).val(addCommas($(this).val().replace(",", "")));
			
			if (activeTab == "출고") {
				$('#outDtlTable tbody tr').each(function(index, item) {
					num = $('input[name=outsrcDtlQty]').eq(index).val().replace(/,/g,'');
					sumQty += parseInt(num==""?0:num);
				});

				if(parseInt(outsrcQty) - parseInt(sumQty)<0){
					$(this).val("0");
					$(this).select();
					toastr.warning("출고수량을 초과했습니다. 다시 입력해주세요.");
				}

			} else if (activeTab == "입고") {
				$('#inDtlTable tbody tr').each(function(index, item) {
					num = $('input[name=insrcDtlQty]').eq(index).val().replace(/,/g,'');
					sumQty += parseInt(num==""?0:num);
				});

				if(parseInt(outsrcQty) - parseInt(sumQty)<0){
					$(this).val("0");
					$(this).select();
					toastr.warning("입고수량을 초과했습니다. 다시 입력해주세요.");
				}
			}
		}
	});

	//담당자 팝업 시작
	var userPopUpTable;
	function selectOutsrcChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 15,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {

					}
				},
				rowId : 'userNumber',
				columns : [ {
					data : 'userNm'
				}, {
					data : 'departmentNm'
				}, {
					data : 'postNm'
				}, {
					data : 'chargrDutyNm'
				}, {
					data : 'workplaceNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4, 5 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#outsrcChargr').val(data.userNumber);
				$('#outsrcChargrNm').val(data.userNm);

				$('#insrcChargr').val(data.userNumber);
				$('#insrcChargrNm').val(data.userNm);

				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

	//출고처 팝업 시작
	var dealCorpPopUpTable;
	function selectOutsrcCorpCd() {
		if (dealCorpPopUpTable == null || dealCorpPopUpTable == undefined) {
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 15,
				ajax : {
					url : '<c:url value="bm/dealCorpDataList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'dealCorpCd',
				columns : [ {
					data : 'dealCorpCd'
				}, {
					data : 'dealCorpNm'
				}, {
					data : 'initial'
				}, {
					data : 'presidentNm'
				}, {
					data : 'country'
				}, {
					data : 'corpNo'
				} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});

			$('#dealCorpPopUpTable tbody').on('click', 'tr', function() {
				var data = dealCorpPopUpTable.row(this).data();
				$('#outsrcCorpCd').val(data.dealCorpCd);
				$('#outsrcCorpNm').val(data.dealCorpNm);
				$('#insrcCorpCd').val(data.dealCorpCd);
				$('#insrcCorpNm').val(data.dealCorpNm);

				$('#dealCorpPopUpModal').modal('hide');

			});
		} else {
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#dealCorpPopUpModal').modal('show');
	}

	function uiProc(flag) {
		$('#btnOutsrcCorpCd').attr('disabled', flag);
		$('#btnOutsrcChargr').attr('disabled', flag);
	}

	function uiProc2(flag) {
		$('#btnInsrcCorpCd').attr('disabled', flag);
		$('#btnInsrcChargr').attr('disabled', flag);
	}
</script>

   	

</body>
</html>
