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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">개발관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">

			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 49%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="prcssBomAdmTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>BOM코드</th>
									<th>구분</th>
									<th>생산공정명</th>
									<th>생산공정상세</th>
									<th>사용여부</th>
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
				style="width: 50%;">
				<div class="card" id="formBox">

					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item"><a class="nav-link active show"
									id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="tab2Nav" data-toggle="tab" href="#tab2">공정상세</a></li>
							</ul>
						</div>
					</div>

					<div class="card-body p-0">
						<div id="myTabContent" class="tab-content">
							<!--========tab1 part=====-->
							<div class="tab-pane fade active show" id="tab1">
								<div class="card-body col-sm-12 p-1 mb-2">
									<button type="button" class="btn btn-primary float-right"
										id="btnEdit">수정</button>
									<button class="btn btn-warning d-none"
										id="btnEditConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-primary float-right mr-1"
										id="btnAdd">등록</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
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
												<th>*BOM코드</th>
												<td><input type="text" class="form-control" id="bomCd"
													name="bomCd" style="max-width: 100%" disabled></td>
												<th>*구분</th>
												<td><select class="custom-select" id="bomGubun"
													style="max-width: 100%"></select></td>
											</tr>
											<tr>
												<th>*생산공정명</th>
												<td><input type="text" class="form-control" id="bomNm"
													name="bomNm" maxlength="25" style="max-width: 100%"></td>
												<th>생산공정상세</th>
												<td><input type="text" class="form-control"
													id="bomDtlNm" name="bomDtlNm" maxlength="25"
													style="max-width: 100%"></td>

											</tr>
											<tr>
												<th>체크1</th>
												<td><input type="text" class="form-control" id="etc1"
													name="etc1" maxlength="32" style="max-width: 100%"></td>
												<th>체크2</th>
												<td><input type="text" class="form-control" id="etc2"
													name="etc2" maxlength="32" style="max-width: 100%"></td>
											</tr>
											<tr>
												<th>비고</th>
												<td><input type="text" class="form-control"
													id="bomDesc" name="bomDesc" maxlength="56"
													style="max-width: 100%"></td>
												<th>*사용여부</th>
												<td><select class="custom-select" id="useYn"
													style="max-width: 100%"></select></td>
											</tr>
										</table>
									</div>
								</form>
								<div class="table-responsive">
									<!--오른쪽 등록 부분 하단 버튼 영역-->
									<div class="card-body col-sm-12">
										<button type="button" class="btn btn-warning float-right mr-1"
											id="rowDelete">삭제</button>
										<button type="button"
											class="btn btn-primary float-right mr-1 " id=rowAdd>추가</button>
									</div>

									<table class="table table-bordered" id="prcssCodeDtlTable">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>순번</th>
												<th>중공정명</th>
												<th>이니셜</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="mt-2">
									<button type="button"
										class="btn btn-primary d-none float-right" id="btnSave">저장</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
								</div>
							</div>
							<div class="tab-pane fade" id="tab2">
								<form id="form2" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table table-bordered" id="prcssCodeAdmTable">
											<colgroup>
												<col width="9%">
												<col width="13%">
												<col width="10%">
												<col width="15%">
												<col width="13%">
												<col width="10%">
												<col width="10%">
												<col width="10%">
												<col width="10%">
											</colgroup>
											<thead>
												<tr>
													<th>구분</th>
													<th>중공정명</th>
													<th>소공정코드</th>
													<th>소공정명</th>
													<th>외주공정여부</th>
													<th>이니셜</th>
													<th>체크1</th>
													<th>체크2</th>
													<th>비고</th>
												</tr>
											</thead>
										</table>
									</div>
								</form>
							</div>
						</div>
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
				width : "49%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "bmsc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","개발관리"); 
	
	let sideView = 'add';
	var bomCd;
	var tableIdx = 0;
	let btnView = '';

	//구분공통코드
	var bomGubunCode = new Array();
	<c:forEach items="${bomGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	bomGubunCode.push(json);
	</c:forEach>

	//사용여부공통코드
	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		uiProc2(true);

		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	uiProc(true);

	//기본정보 목록
	let prcssBomAdmTable = $('#prcssBomAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/prcssBomAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId : 'partCd',
		columns : [ {
			data : 'bomCd',
			'className' : 'text-center'
		}, {
			data : 'bomGubunNm',
			'className' : 'text-center'
		}, {
			data : 'bomNm',
			'className' : 'text-center'
		}, {
			data : 'bomDtlNm',
			'className' : 'text-center'
		}, {
			data : 'useYnNm',
			'className' : 'text-center'
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '개발관리'
		}, 'print' ],
	});

	
	// 보기
	$('#prcssBomAdmTable tbody').on('click','tr',function() {
		$('#tab1Nav').tab('show');

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#prcssBomAdmTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}

		bomCd = prcssBomAdmTable.row(this).data().bomCd;

		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false);
		$('#tab2Nav').removeClass('disabled');

		$.ajax({
			url : '<c:url value="/bm/prcssBomAdmRead"/>',
			type : 'GET',
			data : {
				'bomCd' : bomCd
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
					sideView = 'edit';
					uiProc(true);
					$('#bomCd').val(data.bomCd);
					$('#bomNm').val(data.bomNm);
					$('#bomDtlNm').val(data.bomDtlNm);
					$('#etc1').val(data.etc1);
					$('#etc2').val(data.etc2);
					$('#bomDesc').val(data.bomDesc);

					selectBoxAppend(useYnCode, "useYn",
							data.useYn, "2");
					selectBoxAppend(bomGubunCode, "bomGubun",
							data.bomGubun, "2");
				} else {
					toastr.error(res.message);
				}
			}
		});

		$('#prcssCodeDtlTable').DataTable().ajax.reload(function() {});

	});

	// 상세목록
	let prcssCodeDtlTable = $('#prcssCodeDtlTable')
			.DataTable(
					{
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
							url : '<c:url value="bm/prcssBomDtlList"/>',
							type : 'GET',
							data : {
								'bomCd' : function() {
									return bomCd;
								},
							},
						},
						rowId : 'prcssSeq',
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
									data : 'prcssNm',
									render : function(data, type, row, meta) {
										var value = "";
										if (data != null) {
											value = '<input type="text" class="form-control" style="max-width:100%;" name="prcssNm" value="'
													+ data + '" disabled>';

										} else {
											value = '<input type="text" class="form-control" name="prcssNm" value="" disabled>';
										}

										var html = '<div class="input-sub m-0">';
										html += value;
										html += '<input type="hidden" name="prcssCd" value="'+row['prcssCd']+'">';
										html += '<button type="button" class="btn btn-primary input-sub-search" name="btnPrcssCdCorp" onClick="selectPrcssCd();">';
										html += '<span class="oi oi-magnifying-glass"></span>';
										html += '</button>';
										html += '</div>';
										return html;
									},
								},
								{
									data : 'prcssInitial',
									render : function(data, type, row, meta) {
										if (data != null) {
											var value = '<input type="text" class="form-control" style="max-width:100%;" name="prcssInitial" value="'
													+ data + '" disabled>';

										} else {
											value = '<input type="text" class="form-control" name="prcssInitial" value="" disabled>';
										}

										return value;
									}
								},
								{
									data : 'prcssDesc',
									render : function(data, type, row, meta) {
										if (data != null) {
											var value = '<input type="text" class="form-control" style="max-width:100%;" name="prcssDesc" value="'
													+ data + '" disabled>';

										} else {
											value = '<input type="text" class="form-control" name="prcssDesc" value="" disabled>';
										}

										return value;
									}
								}, ],
						order : [ [ 0, 'asc' ] ],
						drawCallback : function(settings) {
							uiProc2(true);
						},

					});

	$('#prcssCodeDtlTable tbody').on(
			'click',
			'tr',
			function() {

				tableIdx = $('#prcssCodeDtlTable').DataTable().row(this)
						.index();

				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');
					if (sideView == "edit") {
						//$('#rowAdd').attr('disabled',true);
					}

				} else {
					$('#prcssCodeDtlTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
					if (sideView == "edit") {
						//$('#rowAdd').attr('disabled',true);
					}
				}

				//$('#rowDelete').attr('disabled',false);

				if (sideView != "edit") {
					tableIdx = $('#prcssCodeDtlTable').DataTable().row(this)
							.index();
				}
				console.log(tableIdx);
				btnView = 'edit';
			});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		$('#prcssCodeDtlTable').DataTable().clear().draw();

		uiProc(false);

		//코드값 가져오기
		$.ajax({
			url : '<c:url value="bm/prcssBomCd"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				bomCd = res.bomCd;
				$('#bomCd').val(bomCd);
			}
		});

		//선택박스 처리
		selectBoxAppend(bomGubunCode, "bomGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");

		$('#tab2Nav').addClass('disabled');
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); // 수정버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		//선택박스 처리
		selectBoxAppend(bomGubunCode, "bomGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");

		uiProc(false);
		uiProc2(false);
		$('#tab2Nav').addClass('disabled');
		$('#btnSave').removeClass('d-none'); // 등록버튼

	});

	// 열추가
	$('#rowAdd').on('click', function() {

		if ($("#bomNm").val() == "") {
			toastr.warning('생산공정명을 입력해주세요');
			$('#bomNm').focus();
			check = false;
			return false;
		}

		$('#prcssCodeDtlTable').DataTable().row.add({}).draw(false);

		uiProc(false);
		uiProc2(false);
		$('#rowAdd').attr('disabled', false);

	});

	// 열삭제
	$('#rowDelete').on('click', function() {

		if (btnView != "edit") {
			toastr.warning('삭제할 항목을 선택해주세요');
			return false;
		}

		$('#prcssCodeDtlTable').DataTable().rows('.selected').remove().draw();

		uiProc2(false);
		btnView = "";
	});

	// 저장 처리
	$('#btnSave').on(
			'click',
			function() {
				var dataArray = new Array();
				var check = true;

				if ($('#bomGubun option:selected').val() == "") {
					toastr.warning('사용여부를 선택해주세요.');
					$('#bomGubun').focus();
					return false;
				}

				if (!$.trim($('#bomNm').val())) {
					toastr.warning('생산공정명을 입력해주세요.');
					$('#bomNm').focus();
					return false;
				}

				$('#prcssCodeDtlTable tbody tr').each(
						function(index, item) {

							if (prcssCodeDtlTable.data().count() != 0) {
								if ($(this).find('td input[name=prcssNm]')
										.val() == "") {
									toastr.warning('중공정명을 선택해주세요');
									$('button[name=btnPrcssCdCorp]').focus();
									check = false;
									return false;
								}

							} else {
								toastr.warning('중공정명을 추가해주세요.');
								$('#rowAdd').focus();
								check = false;
								return false;
							}

							var rowData = new Object();
							rowData.bomCd = $('#bomCd').val();
							rowData.bomGubun = $('#bomGubun option:selected')
									.val();
							rowData.bomNm = $("#bomNm").val();
							rowData.bomDtlNm = $('#bomDtlNm').val();
							rowData.etc1 = $('#etc1').val();
							rowData.etc2 = $('#etc2').val();
							rowData.bomDesc = $('#bomDesc').val();
							rowData.useYn = $('#useYn option:selected').val();

							rowData.prcssCd = $(this).find(
									'td input[name=prcssCd]').val();
							dataArray.push(rowData);
						});

				var url = '<c:url value="bm/prcssBomCreate"/>';

				if (sideView == "edit") {
					url = '<c:url value="bm/prcssBomUpdate"/>';
				}

				if (check == true) {
					$.ajax({
						url : url,
						type : 'POST',
						datatype : 'json',
						data : JSON.stringify(dataArray),
						contentType : "application/json; charset=UTF-8",
						beforeSend : function() {
							// $('#btnAddConfirm').addClass('d-none');
						},
						success : function(res) {
							if (res.result == 'ok') {
								uiProc(true);
								uiProc2(true);

								$('#tab2Nav').removeClass('disabled');

								$('#btnSave').addClass('d-none');
								$('#btnEdit').attr('disabled', false);
								$('#rowAdd').attr('disabled', true);
								$('#rowDelete').attr('disabled', true);

								$('#prcssBomAdmTable').DataTable().ajax
										.reload(function() {
										});
								$('#prcssBomDtlTable').DataTable().ajax
										.reload(function() {
										});
								$('#prcssCodeDtlTable').DataTable().ajax
										.reload(function() {
										});
								$('#prcssCodeDtlTable').DataTable().$(
										'tr.selected').removeClass('selected');

								if (sideView == "edit") {
									toastr.success('수정되었습니다.');
								} else {
									toastr.success('등록되었습니다.');
								}

								sideView = 'add';

							} else if (res.result == 'overlapPrcssCd') {
								toastr.error("동일한 중공정명이 등록되어 있습니다. 확인해주세요.");
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

	//공정명 팝업 시작
	var prcssPopUpTable2;
	function selectPrcssCd() {
		if (prcssPopUpTable2 == null || prcssPopUpTable2 == undefined) {
			prcssPopUpTable2 = $('#prcssPopUpTable2')
					.DataTable(
							{
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
								pageLength : 20,
								ajax : {
									url : '<c:url value="bm/prcssCodeMidList"/>',
									type : 'GET',
									data : {},
								},
								rowId : 'prcssCd',
								columns : [ {
									data : 'prcssCd'
								}, {
									data : 'prcssGubunNm'
								}, {
									data : 'prcssNm'
								}, {
									data : 'prcssInitial'
								}, {
									data : 'prcssDesc'
								} ],
								columnDefs : [ {
									"targets" : "_all",
									"className" : "text-center"
								} ],
								order : [ [ 0, 'asc' ] ],
								buttons : [],
							});

			$('#prcssPopUpTable2 tbody')
					.on(
							'click',
							'tr',
							function() {
								var data = prcssPopUpTable2.row(this).data();
								$('input[name=prcssNm]').eq(tableIdx).val(
										data.prcssNm);
								$('input[name=prcssCd]').eq(tableIdx).val(
										data.prcssCd);
								$('input[name=prcssInitial]').eq(tableIdx).val(
										data.prcssInitial);
								$('input[name=prcssDesc]').eq(tableIdx).val(
										data.prcssDesc);

								$('#prcssPopUpModal2').modal('hide');

							});
		} else {
			$('#prcssPopUpTable2').DataTable().ajax.reload(function() {
			});
		}
		$('#prcssPopUpModal2').modal('show');
	}

	//설비명 팝업 시작
	var equipPopUpTable;
	function selectEquipCd() {
		if (equipPopUpTable == null || equipPopUpTable == undefined) {
			equipPopUpTable = $('#equipPopUpTable')
					.DataTable(
							{
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
								pageLength : 20,
								ajax : {
									url : '<c:url value="bm/equipCodeAdmList"/>',
									type : 'GET',
									data : {},
								},
								rowId : 'equipCd',
								columns : [ {
									data : 'equipCd'
								}, {
									data : 'equipNm'
								}, {
									data : 'equipGroupNm'
								}, {
									data : 'admCd'
								}, {
									data : 'admDeptNm'
								}, {
									data : 'mainChargr'
								} ],
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all",
									"className" : "text-center"
								} ],
								order : [ [ 0, 'asc' ] ],
								buttons : [],
							});

			$('#equipPopUpTable tbody').on('click', 'tr', function() {
				var data = equipPopUpTable.row(this).data();
				$('input[name=equipNm]').eq(tableIdx).val(data.equipNm);
				$('input[name=equipCd]').eq(tableIdx).val(data.equipCd);

				$('#equipPopUpModal').modal('hide');

			});
		} else {
			$('#equipPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#equipPopUpModal').modal('show');
	}

	//외주처 팝업 시작
	var dealCorpPopUpTable;
	function selectOsrcCorpCd() {
		if (dealCorpPopUpTable == null || dealCorpPopUpTable == undefined) {
			dealCorpPopUpTable = $('#dealCorpPopUpTable')
					.DataTable(
							{
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
								pageLength : 20,
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
				$('input[name=osrcCorpNm]').eq(tableIdx).val(data.dealCorpNm);

				$('#dealCorpPopUpModal').modal('hide');

			});
		} else {
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#dealCorpPopUpModal').modal('show');
	}

	//공정상세 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#prcssCodeAdmTable').DataTable().ajax.reload(function() {
		});
	})

	//공정상세 보기
	let prcssCodeAdmTable = $('#prcssCodeAdmTable').DataTable({
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/prcssCodeAdmAllList"/>',
			type : 'GET',
			data : {
				bomCd : function() {
					return bomCd;
				}
			},
		},
		rowId : 'prcssCd',
		columns : [ {
			data : 'bomGubun',
			'className' : 'text-center',
			name : 'rowspan'
		}, {
			data : 'prcssMidNm',
			'className' : 'text-center',
			name : 'rowspan'
		}, {
			data : 'lowerPrcssCd',
			'className' : 'text-center'
		}, {
			data : 'prcssNm',
			'className' : 'text-center'
		}, {
			data : 'osrcYnNm',
			'className' : 'text-center'
		}, {
			data : 'prcssInitial',
			'className' : 'text-center'
		}, {
			data : 'etc1',
			'className' : 'text-center'
		}, {
			data : 'etc2',
			'className' : 'text-center'
		}, {
			data : 'prcssDesc',
			'className' : 'text-center'
		} ],
		rowsGroup : [ 'rowspan:name', [ 0, 1 ] ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '거래처정보관리'
		}, 'print' ],
	});

	function uiProc(flag) {
		$("#bomGubun").attr("disabled", flag);
		$("#bomNm").attr("disabled", flag);
		$("#bomDtlNm").attr("disabled", flag);
		$("#etc1").attr("disabled", flag);
		$("#etc2").attr("disabled", flag);
		$("#bomDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);

		$('#rowAdd').attr('disabled', flag);
		$('#rowDelete').attr('disabled', flag);
		$('#rowAllDelete').attr('disabled', flag);

	}

	function uiProc2(flag) {
		$('button[name=btnPrcssCdCorp]').attr('disabled', flag);
		$('button[name=btnEquipCdCorp]').attr('disabled', flag);
	}
</script>

</body>
</html>