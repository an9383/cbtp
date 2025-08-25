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
				<li class="breadcrumb-item"><a href="#">설비관리</a></li>
				<li class="breadcrumb-item active">설비일상점검</li>
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
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive" style="margin-bottom: 18%;">
						<table id="equipInspectTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>관리번호</th>
									<th>설비명</th>
									<th>점검주기</th>
									<th>특이사항</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav"
				style="width: 40%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand2"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<button type="button" class="btn btn-primary float-right mr-0"
						id="btnEdit">수정</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<button type="button" class="btn btn-primary float-right mr-1"
						id="btnAdd">등록</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>

				</div>
				<div class="card-body p-0">
					<form id="form">
						<div class="table-responsive">
							<table class="table table-sm table-bordered mb-1"
								id="equipInspectAdmTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>

									<th>설비명</th>
									<td>
										<div class="input-sub m-0">
											<input type="text" class="form-control" id="equipNm"
												name="equipNm" disabled> <input type="hidden"
												class="form-control" id="equipCd" name="equipCd" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnSelEquipCd"
												onClick="selectEquipCd()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>구분</th>
									<td><input type="text" class="form-control"
										id="equipGubun" name="equipGubun" disabled></td>
								</tr>
								<tr>
									<th>관리번호</th>
									<td><input type="text" class="form-control" id="admNo"
										name="admNo" disabled></td>
									<th>점검주기</th>
									<td><select class="custom-select" id="inspcetCycle"></select></td>

								</tr>
								<tr>
									<th>담당자</th>
									<td>
										<div class="input-sub m-0">
											<input type="text" class="form-control" id="inspcetChargrNm"
												name="inspcetChargrNm" disabled> <input
												type="hidden" class="form-control" id="inspcetChargr"
												name="inspcetChargr" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												id="btnSelinspcetChargr" onClick="selectInspectChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>부서명</th>
									<td>
										<div class="input-sub m-0">
											<input type="text" class="form-control" id="inspcetDeptNm"
												name="inspcetDeptNm" disabled> <input type="hidden"
												class="form-control" id="inspcetDept" name="inspcetDept"
												disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												id="btnSelInspcetDept" onClick="selectInspcetDept()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td colspan="3"><input type="text" class="form-control"
										id="inspcetDesc" name="inspcetDesc" maxlength="56"
										style="max-width: 100%" disabled></td>
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
							id="rowAdd" disabled>추가</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>

					</div>


					<form id="form2">
						<div class="table-responsive">
							<table class="table table-sm table-bordered"
								id="equipInspectDtlTable">
								<colgroup>
									<col width="33%">
									<col width="33%">
									<col width="33%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>순번</th>
										<th>점검항목</th>
										<th>점검기준</th>
									</tr>
								</thead>
							</table>
						</div>
					</form>
					<button type="button" class="btn btn-primary float-right d-none"
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
</div>
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

	let currentHref = "emsc0060";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비일상점검");
	
	let viewIdx;
	let sideView = 'add';

	var index = 0;
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var equipCd = null;
	var equipCdS = null;
	var equipGubunS = null;

	//공통코드 시작
	var cycleCode = new Array();
	<c:forEach items="${cycle}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	cycleCode.push(json);
	</c:forEach>

	var equipGubunCode = new Array();
	<c:forEach items="${equipGubunList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>

	var equipNmCode = new Array();
	<c:forEach items="${equipCodeList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipNmCode.push(json);
	</c:forEach>

	//공통코드 끝

	uiProc(true);

	//선택박스 처리
	selectBoxAppend(cycleCode, "inspcetCycle", "", "2");

	//생산지시현황 목록조회
	let equipInspectTable = $('#equipInspectTable').DataTable({
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,

		ajax : {
			url : '<c:url value="em/equipInspectBaseAdmList"/>',
			type : 'GET',
			data : {
				//'startDate' : function(){return serverDateFrom.replace(/-/g,"");},	
				'equipGubun' : function() {
					return equipGubunS;
				},
				'equipCd' : function() {
					return equipCdS;
				}
			},
		},
		rowId : '',
		columns : [ {
			data : 'equipGubunNm'
		}, {
			data : 'admNo'
		}, {
			data : 'equipNm'
		}, {
			data : 'inspcetCycleNm'
		}, {
			data : 'inspcetDesc'
		},

		],
		columnDefs : [ {
			"className" : "text-center",
			"targets" : "_all"
		},

		],
	/* order: [
	    [ 0, 'asc' ]
	], */

	});

	//생산지시현황 목록조회
	let equipInspectDtlTable = $('#equipInspectDtlTable')
			.DataTable(
					{
						language : lang_kor,
						paging : false,
						searching : false,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : false,

						ajax : {
							url : '<c:url value="em/equipInspectBaseAdmReadDtl"/>',
							type : 'GET',
							data : {
								'equipCd' : function() {
									return equipCd;
								}
							},
						},
						rowId : '',
						columns : [
								{
									data : 'equipGubunNm',
									render : function(data, type, row, meta) {
										return meta.row
												+ meta.settings._iDisplayStart
												+ 1;
									}
								},
								{
									data : 'inspcetItem',
									render : function(data, type, row, meta) {
										var result = (data == null) ? "" : data;
										return '<input type="text" class="form-control" value="'
												+ result
												+ '" name="inspcetItem" maxlength="56" style="max-width:100%" disabled>';
									}
								},
								{
									data : 'inspcetBase',
									render : function(data, type, row, meta) {
										var result = (data == null) ? "" : data;
										return '<input type="text" class="form-control" value="'
												+ result
												+ '" name="inspcetBase" maxlength="56" style="max-width:100%" disabled>';
									}
								}

						],
						columnDefs : [ {
							"className" : "text-center",
							"targets" : "_all"
						},

						],
					/* order: [
					    [ 0, 'asc' ]
					], */

					});

	$('#equipInspectTable tbody').on(
			'click',
			'tr',
			function() {
				sideView = "edit";

				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#equipInspectTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

				uiProc(true);
				equipCd = equipInspectTable.row(this).data().equipCd;
				$('#btnSave').addClass('d-none');

				$.ajax({
					url : '<c:url value = "em/equipInspectBaseAdmReadAdm"/>',
					type : 'GET',
					data : {
						'equipCd' : function() {
							return equipCd;
						},
					},
					success : function(res) {
						let data = res.data;

						$('#equipCd').val(data.equipCd);
						$('#equipNm').val(data.equipNm);
						//$('#equipGubun').val(data.equipGubun);
						$('#equipGubun').val(data.equipGubunNm);
						$('#admNo').val(data.admNo);
						$('#inspcetDept').val(data.inspcetDept);
						$('#inspcetDeptNm').val(data.inspcetDeptNm);
						$('#inspcetChargr').val(data.inspcetChargr);
						$('#inspcetChargrNm').val(data.inspcetChargrNm);
						$('#inspcetDesc').val(data.inspcetDesc);
						selectBoxAppend(cycleCode, "inspcetCycle",
								data.inspcetCycle, "2");

						$('#equipInspectDtlTable').DataTable().ajax
								.reload(function() {
								});
						uiProc(true);
					}
				})

			});

	$('#equipInspectDtlTable tbody').on(
			'click',
			'tr',
			function() {

				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#equipInspectDtlTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

				if (!$('#inspcetDesc').attr('disabled') == true) {
					$('#rowDelete').attr('disabled', false);
				}

			});

	//등록버튼 클릭시
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});
		$('#equipInspectDtlTable').DataTable().clear().draw();
		//화면처리
		uiProc(false);
		$('#rowAdd').attr('disabled', false);

	});

	//수정버튼 클릭시
	$('#btnEdit').on('click', function() {

		if (sideView != "edit") {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		//화면처리
		uiProc(false);
		$('#rowAdd').attr('disabled', false);
		$('#btnSelEquipCd').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#equipInspectDtlTable input[type=text]').attr('disabled', false);
		sideView = "edit"
	});

	// 열추가
	$('#rowAdd').on('click', function() {
		if ($("#equipNm").val() == "") {
			toastr.warning('설비명을 입력해주세요.');
			return false;
		}
		if ($("#inspcetCycle option:selected").val() == "") {
			toastr.warning('점검주기를 선택해주세요.');
			return false;
		}

		$('#equipInspectDtlTable').DataTable().row.add({}).draw(false);
		uiProc(false);
		$("#btnSelEquipCd").attr("disabled", true);
		$('#btnSave').removeClass('d-none');

	});

	// 열삭제
	$('#rowDelete')
			.on(
					'click',
					function() {
						$('#equipInspectDtlTable').DataTable()
								.rows('.selected').remove().draw(false);
						$('#rowDelete').attr('disabled', true);

						if ($('#equipInspectDtlTable').DataTable().rows()
								.count() == 0) {
							$('#btnSave').addClass('d-none');
							$('input[name=inspcetItem]').attr('disabled', true);
							$('input[name=inspcetBase]').attr('disabled', true);
						}

					});

	//저장버튼 클릭시
	$('#btnSave').on(
			'click',
			function() {
				var check = true;
				var dataArray = new Array();
				if ($("#equipNm").val() == "") {
					toastr.warning('설비명을 입력해주세요.');
					check = false;
					return false;
				}
				if ($("#inspcetCycle option:selected").val() == "") {
					toastr.warning('점검주기를 선택해주세요.');
					check = false;
					return false;
				}
				if ($("#inspcetDeptNm").val() == "") {
					toastr.warning('부서를 선택해주세요.');
					check = false;
					return false;
				}
				if ($("#inspcetChargrNm").val() == "") {
					toastr.warning('담당을 선택해주세요.');
					check = false;
					return false;
				}
				if (equipInspectDtlTable.data().count() == 0) {
					toastr.warning('라인을 추가해주세요');
					$('#rowAdd').focus();
					check = false;
					return false;
				}

				$('#equipInspectDtlTable tbody tr').each(
						function(index, item) {
							if ($(this).find('td input').eq(0).val() == "") {
								toastr.warning('점검항목을 입력해주세요.');
								check = false;
								return false;
							}
							if ($(this).find('td input').eq(1).val() == "") {
								toastr.warning('점검기준를 입력해주세요.');
								check = false;
								return false;
							}

							var rowData = new Object();
							rowData.equipCd = $("#equipCd").val();
							rowData.inspcetCycle = $(
									"#inspcetCycle option:selected").val();
							rowData.inspcetDept = $("#inspcetDept").val();
							rowData.inspcetChargr = $("#inspcetChargr").val();
							rowData.inspcetDesc = $("#inspcetDesc").val();
							rowData.inspctRegDate = serverDateFrom.replace(
									/-/g, "");
							rowData.inspcetItem = $(this).find(
									'td input[name=inspcetBase]').val();
							rowData.inspcetBase = $(this).find(
									'td input[name=inspcetBase]').val();

							dataArray.push(rowData);

						});

				if (check == true) {
					if (dataArray.length == 0) {
						toastr.warning('목록에 정확한 값을 선택하거나 입력해 주세요.');
						return false;
					}
				}
				var url = "";
				if (sideView == 'add') {
					url = '<c:url value="em/equipInspectBaseAdmCreateAdm" />';
				} else {
					url = '<c:url value="em/equipInspectBaseAdmUpdateAdm" />';
				}
				if (check == true) {
					$.ajax({
						url : url,
						type : 'POST',
						datatype : 'json',
						data : JSON.stringify(dataArray),
						contentType : "application/json; charset=UTF-8",
						success : function(res) {
							let data = res.data;
							if (res.result == 'ok') {
								uiProc(true);
								$('#btnSave').addClass('d-none');
								$('#itemInspectTable').DataTable().ajax
										.reload(function() {
										});

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

	var html1 = '<div class="row">';
	/*    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	   html1 += '일자&nbsp;&nbsp;<input class="form-control" style="width:97px;" type="text" id="inDateFrom" name="inDateFrom" disabled/>';
	   html1 += '<button onclick="fnPopUpCalendar(inDateFrom,inDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inDateFromCalendar" type="button">';
	   html1 += '<span class="oi oi-calendar"></span>';
	   html1 += '</button>'; 
	   html1 += '</div>';    */
	html1 += '&nbsp;&nbsp;구분&nbsp;&nbsp;<select class="custom-select" id="gubunS"></select>&nbsp;&nbsp';
	html1 += '설비명&nbsp;&nbsp;<select class="custom-select" id="equipNmS" style="width:100px;"></select>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#equipInspectTable_length').html(html1);
	$('#inDateFrom').val(serverDateFrom);
	selectBoxAppend(equipGubunCode, "gubunS", "", "2");
	selectBoxAppend(equipNmCode, "equipNmS", "", "2");
	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#inDateFrom').val();
		equipGubunS = $('#gubunS option:selected').val();
		equipCdS = $('#equipNmS option:selected').val();
		$('#equipInspectTable').DataTable().ajax.reload(function() {
		});

	});

	//담당자 팝업 시작
	var userPopUpTable;
	function selectInspectChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 20,
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
				$('#inspcetChargr').val(data.userNumber);
				$('#inspcetChargrNm').val(data.userNm);

				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

	var departPopUpTable;
	function selectInspcetDept() {

		if (departPopUpTable == null || departPopUpTable == undefined) {
			departPopUpTable = $('#departPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				destroy : true,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				//ordering: false,
				ajax : {
					url : '<c:url value="/bm/commonCodeList"/>',
					type : 'GET',
					data : {
						'menuAuth' : 'emsc0060',
						'baseGroupCd' : '003'
					}
				},
				rowId : '',
				columns : [

				{
					data : 'baseCd'
				}, {
					data : 'baseNm'
				}, {
					data : 'baseDesc'
				} ],
				columnDefs : [ {
					"className" : "text-center",
					"targets" : "_all"
				}, ],
				order : [ [ 0, 'asc' ] ],

			});
			$('#departPopUpTable tbody').on('click', 'tr', function() {
				var data = departPopUpTable.row(this).data();

				$('#inspcetDept').val(data.baseCd);
				$('#inspcetDeptNm').val(data.baseNm);

				$('#departPopUpModal').modal('hide');
			});

		} else {
			$('#departPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#departPopUpModal').modal('show');
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
									data : {
									},
								},
								rowId : 'equipCd',
								columns : [ {
									data : 'equipCd'
								}, {
									data : 'equipNm'
								}, {
									data : 'equipGroupNm'
								}, {
									data : 'admNo'
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
				$('#equipNm').val(data.equipNm);
				$('#equipCd').val(data.equipCd);
				$('#equipGubun').val(data.equipGubunNm);
				$('#admNo').val(data.admNo);

				$('#equipPopUpModal').modal('hide');

			});
		} else {
			$('#equipPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#equipPopUpModal').modal('show');
	}

	function uiProc(flag) {
		$('#inspcetCycle').attr('disabled', flag);
		$('#inspcetDept').attr('disabled', flag);
		$('#inspcetChargr').attr('disabled', flag);
		$('#inspcetDesc').attr('disabled', flag);

		$('#btnSelEquipCd').attr('disabled', flag);
		$('#btnSelinspcetChargr').attr('disabled', flag);
		$('#btnSelInspcetDept').attr('disabled', flag);

		$('input[name=inspcetItem]').attr('disabled', flag);
		$('input[name=inspcetBase]').attr('disabled', flag);

		$('#rowAdd').attr('disabled', flag);
		$('#rowDelete').attr('disabled', flag);
	}

	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 삭제
	function uncomma(x) {
		x = String(x);
		return x.replace(/[^\d]+/g, '');
	}
</script>

   	

</body>
</html>
