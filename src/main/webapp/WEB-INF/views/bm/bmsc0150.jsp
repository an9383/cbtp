<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>


<div class="page-wrapper" id="page-wrapper">

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">자주검사관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-30" id="left-30" style="width: 28%;">
				<div class="card">
					<div class="table-responsive">
						<table class="table table-bordered" id="jajuInspectTable">
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="50%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>사용여부</th>
									<th>구분</th>
									<th>소공정</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!--                       <button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button> -->
			</div>
			<!-- /.left-list -->


			<div class="right-list right-70" id="myrSidenav" style="width: 71%;">
				<div class="card" id="formBox">
					<div class="card-body col-sm-12 p-1" id="firstBtn"
						style="width: 60%;">
						<button type="button" class="btn btn-primary float-right"
							id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">등록</button>
					</div>
					<div class="table-responsive" style="width: 60%;">
						<form id="form">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*소공정</th>
									<td>
										<div class="input-sub m-0">
											<input type="hidden" id="prcssCd" name="prcssCd"> <input
												type="text" class="form-control" id="prcssNm" name="prcssNm"
												disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnPrcssCd"
												onClick="selectPrcssCd()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>구분</th>
									<td><input type="text" class="form-control"
										id="prcssGubunNm" name="prcssGubunNm" disabled></td>
								</tr>
								<tr>
									<th>*담당</th>
									<td>
										<div class="input-sub m-0">
											<input type="hidden" id="mainChargr" name="mainChargr">
											<input type="text" class="form-control" id="mainChargrNm"
												name="mainChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnMainChargr"
												onClick="selectMainChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>*사용유무</th>
									<td><select class="custom-select" id="useYn" name="useYn"
										style="width: 100%" disabled></select></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="card-body col-sm-12 p-1" style="width: 60%;">
						<button type="button" class="btn btn-danger float-right"
							id="dtlAllDelete" disabled>전체삭제</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-warning float-right mr-1"
							id="dtlDelete" disabled>삭제</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="dtlRowAdd" disabled>추가</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>

					</div>
					<div class="table-responsive" id="third" style="width: 60%;">
						<table id="jajuInspectDtlTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="50%">
								<col width="40%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>순번</th>
									<th>관리항목</th>
									<th>내용</th>
								</tr>
							</thead>
						</table>
					</div>
					<div style="width: 60%;">
						<button type="button" class="btn btn-primary d-none float-right"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
					</div>
				</div>
			</div>
			<!-- .right-sidebar -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	let currentHref = "bmsc0150";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","자주검사관리"); 
	
	//공통코드 처리 시작   	
	var useYnCode = new Array(); // 상태여부
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	//공통코드 처리 종료    	
	var workCd = '';
	var sideView;
	var choice;
	var value;
	selectBoxAppend(useYnCode, "useYn", "", "");
	uiProc(true);

	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
		$('#btnAdd').attr('disabled', false);
		$('#dtlEdit').attr('disabled', true);
		$('#dtlAdd').attr('disabled', true);
		$('#dtlRowAdd').attr('disabled', true);
		$('#dtlDelete').attr('disabled', true);
		$('#dtlAllDelete').attr('disabled', true);
	});

	//자주검사관관리 목록조회
	let jajuInspectTable = $('#jajuInspectTable').DataTable({
		dom : "<'row'<'col-md-12'f>>" + "<'row'<'col-sm-12'tr>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		//scrollX : true,
		pageLength : 20,
		'ajax' : {
			url : '<c:url value="/bm/jajuInspectList"/>',
			type : 'GET',
			data : {},
		},
		//rowId: 'baseGroupCd', // id값 할당
		columns : [ {
			data : 'useYnNm',
			'className' : 'text-center'
		}, {
			data : 'prcssGubunNm',
			'className' : 'text-center'
		}, {
			data : 'prcssNm'
		}, ],
		order : [ [ 1, 'asc' ], ],
	});

	// 품질정보관리 상세 초기화
	jajuInspectDtlTable = $('#jajuInspectDtlTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>",
						language : lang_kor,
						scrollY : "420px",
						paging : false,
						info : true,
						destroy : true,
						ordering : false,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						searching : false,
						ajax : {
							url : '<c:url value="/bm/jajuInspectDtlRead"/>',
							type : 'GET',
							data : {
								'workCd' : function() {
									return workCd;
								},
							},
						},
						columns : [
								{
									render : function(data, type, row, meta) {
										return meta.row
												+ meta.settings._iDisplayStart
												+ 1;
									},
									'className' : 'text-center'
								},
								{
									data : 'itemNm',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input type="text" class="form-control" name="itemNm" value="'
													+ replaceAll(data)
													+ '"  style="max-width:100%;" disabled>';
										} else {
											return '<input type="text" class="form-control" name="itemNm" value=""  style="max-width:100%;" disabled>';
										}
									}
								}, {
									render : function(data, type, row, meta) {
										return '';
									}
								} ],
						order : [ [ 0, 'asc' ] ],
					});

	$('#jajuInspectTable tbody')
			.on(
					'click',
					'tr',
					function() {
						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							return false;
						}

						if ($(this).hasClass('selected')) {
							//$(this).removeClass('selected');
						} else {
							$('#jajuInspectTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}
						uiProc(true);
						index = 0;
						choice = null;
						workCd = jajuInspectTable.row(this).data().workCd;
						$('#dtlRowAdd').attr('disabled', true);
						$('#dtlDelete').attr('disabled', true);
						$('#dtlAllDelete').attr('disabled', true);
						//선택 행 데이터 불러오기
						$.ajax({
							url : '<c:url value="/bm/jajuInspectRead"/>',
							type : 'GET',
							data : {
								'workCd' : function() {
									return workCd;
								}
							},
							success : function(res) {
								let data = res.data;
								$('#prcssCd').val(data.prcssCd);
								$('#prcssNm').val(data.prcssNm);
								$('#prcssGubunNm').val(data.prcssGubunNm);
								$('#mainChargr').val(data.mainChargr);
								$('#mainChargrNm').val(data.mainChargrNm);
								selectBoxAppend(useYnCode, "useYn", data.useYn,
										"");
							}
						});

						$('#btnSave').addClass('d-none'); // 저장버튼
						$('#btnEdit').attr('disabled', false);
						sideView = 'edit';
						$('#jajuInspectDtlTable').DataTable().ajax
								.reload(function() {
								});

					});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		//화면처리
		uiProc(false);
		selectBoxAppend(useYnCode, "useYn", "001", "");
		$('#jajuInspectDtlTable').DataTable().clear().draw();
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#dtlRowAdd').attr('disabled', false);
		$('#dtlDelete').attr('disabled', false);
		$('#dtlAllDelete').attr('disabled', false);
		choice = 'choice';
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning('자주검사흘 선택해주세요.');
			return false;
		}
		choice = 'choice';
		uiProc(false);
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#dtlRowAdd').attr('disabled', false);
		$('#dtlDelete').attr('disabled', false);
		$('#dtlAllDelete').attr('disabled', false);
	});

	$('#jajuInspectDtlTable tbody').on(
			'click',
			'tr',
			function() {
				if (choice != null) {
					if ($(this).hasClass('selected')) {
						//$(this).removeClass('selected');
						choice = 'delete';
					} else {
						$('#jajuInspectDtlTable').DataTable().$('tr.selected')
								.removeClass('selected');
						$(this).addClass('selected');
						choice = 'delete';
					}
				}
				//tableIdx = $('#completTable1').DataTable().row(this).index();	

			});

	// 열추가
	$('#dtlRowAdd').on('click', function() {
		if ($('#jajuInspectDtlTable').DataTable().rows().count() >= 5) {
			toastr.warning('관리항목은 5개까지 등록할 수 있습니다.');
			return false;
		}
		$('#jajuInspectDtlTable').DataTable().row.add({}).draw(false);
		uiProc(false);
	});

	// 열삭제
	$('#dtlDelete').on(
			'click',
			function() {
				if (choice != 'delete') {
					toastr.warning('데이터를 선택해주세요.');
				}
				$('#jajuInspectDtlTable').DataTable().rows('.selected')
						.remove().draw(false);
				choice = 'choice';
				//$('#dtlDelete').attr('disabled',true);
			});

	// 열 전체 삭제
	$('#dtlAllDelete').on('click', function() {
		$('#jajuInspectDtlTable').DataTable().clear().draw();
	});

	// 저장 처리
	$('#btnSave')
			.on(
					'click',
					function() {

						var check = true;
						var dataArray = new Array();
						var formData;
						//입력값 검사
						if (!$.trim($('#prcssCd').val())) {
							toastr.warning('소공정을 선택해주세요.');
							$('#btnPrcssCd').focus();
							check = false;
							return false;
						}

						if (!$.trim($('#mainChargr').val())) {
							toastr.warning('담당을 선택해주세요.');
							$('#btnMainChargr').focus();
							check = false;
							return false;
						}

						$('#jajuInspectDtlTable tbody tr')
								.each(
										function(index, item) {
											if ($(this).find(
													'td input[name=itemNm]')
													.val() == "") {
												toastr.warning('관리항목을 입력해주세요.');
												$(this)
														.find(
																'td input[name=itemNm]')
														.focus();
												check = false;
												return false;
											}
											var rowData = new Object();
											rowData.itemNm = replaceSlash($(
													this).find(
													'td input[name=itemNm]')
													.val());
											rowData.prcssCd = $('#prcssCd')
													.val();
											rowData.mainChargr = $(
													'#mainChargr').val();
											rowData.useYn = $(
													'#useYn option:selected')
													.val();
											rowData.workCd = workCd;
											dataArray.push(rowData);
										});

						var url = '<c:url value="/bm/jajuInspectCreate"/>';
						if (sideView == "edit") {
							url = '<c:url value="/bm/jajuInspectUpdate"/>';
						}
						if (check == true) {
							$
									.ajax({
										url : url,
										type : 'POST',
										datatype : 'json',
										data : JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										//			beforeSend : function() {
										// $('#btnAddConfirm').addClass('d-none');
										//}, 
										success : function(res) {
											let data = res.data;
											if (res.result == 'ok') {
												// 보기
												if (sideView == "edit") {
													toastr.success('수정되었습니다.');
												} else {
													toastr.success('등록되었습니다.');
												}
												$('#btnSave')
														.addClass('d-none');
												choice = null;
												uiProc(true);
												sideView = 'view';
												$('#jajuInspectDtlTable')
														.DataTable().ajax
														.reload(function() {
														});
												$('#jajuInspectTable')
														.DataTable().ajax
														.reload(function() {
														});
												$('#btnEdit').attr('disabled',
														false);
												$('#dtlRowAdd').attr(
														'disabled', true);
												$('#dtlDelete').attr(
														'disabled', true);
												$('#dtlAllDelete').attr(
														'disabled', true);
											} else if (res.result == 'exist') {
												toastr
														.warning('이미 등록된 소공정입니다.');
											} else {
												toastr.error(res.message);
											}
										},
										complete : function() {
											//$('#smallSave').addClass('d-none');
										}
									});
						}

					});

	function uiProc(flag) {
		$('input[name=itemNm]').attr('disabled', flag);
		$('input[name=itemModel]').attr('disabled', flag);
		$('#useYn').attr('disabled', flag);
		$('#btnMainChargr').attr('disabled', flag);
		$('#btnPrcssCd').attr('disabled', flag);

	}

	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectMainChargr() {
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
				$('#mainChargr').val(data.userNumber);
				$('#mainChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

	//소공정 조회 팝업 시작
	var prcssCodeAdmPopUpTable;
	function selectPrcssCd() {
		if (prcssCodeAdmPopUpTable == null
				|| prcssCodeAdmPopUpTable == undefined) {
			prcssCodeAdmPopUpTable = $('#prcssCodeAdmPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/bm/prcssCodeAdmList"/>',
					type : 'GET',
					data : {

					}
				},
				rowId : 'prcssCd',
				columns : [ {
					data : 'prcssCd'
				}, {
					data : 'prcssGubunNm',
					'className' : 'text-center'
				}, {
					data : 'prcssNm'
				}, {
					data : 'osrcYnNm',
					'className' : 'text-center'
				}, {
					data : 'prcssInitial',
					'className' : 'text-center'
				}, {
					data : 'prcssDesc'
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#prcssCodeAdmPopUpTable tbody').on('click', 'tr', function() {
				var data = prcssCodeAdmPopUpTable.row(this).data();
				$('#prcssNm').val(data.prcssNm);
				$('#prcssCd').val(data.prcssCd);
				$('#prcssGubunNm').val(data.prcssGubunNm);
				$('#prcssCodeAdmPopUpModal').modal('hide');
			});
		} else {
			$('#prcssCodeAdmPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#prcssCodeAdmPopUpModal').modal('show');
	}
</script>

</body>
</html>

