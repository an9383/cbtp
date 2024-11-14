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
				<li class="breadcrumb-item active">설비일상점검상세</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-60" id="left-60" style="width: 25%;">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipCodeAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th style="min-width: 50px">설비코드</th>
									<th style="min-width: 50px">설비명</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<div class="right-list left-60" id="left-60" style="width: 34%;">
				<div class="card">
					<div class="mt-2">
						<div class="row">
							&nbsp;<label class="input-label-sm">등록년월</label>
							<div class="form-group input-sub m-0 row">
								<input class="form-control mtz-monthpicker-widgetcontainer"
									type="text" id="demo-2">
							</div>
						</div>
					</div>
					<!-- .table-responsive -->
					<br>
					<div class="table-responsive">
						<table id="calTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th style="min-width: 30px;">NO</th>
									<th>①</th>
									<th>②</th>
									<th>③</th>
									<th>④</th>
									<th>⑤</th>
									<th>⑥</th>
									<th>⑦</th>
									<th>⑧</th>
								</tr>

							</thead>
						</table>
					</div>

					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list left-60" id="left-60" style="width: 40%;">
				<div class="card" id="formBox">
					<!-- ----- 공정불량 상세정보 시작-----  -->
					<div class="card-body col-sm-12">
						<button type="button" class="btn btn-danger float-right mr-1"
							id="btnDel">삭제</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-warning float-right mr-1"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
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

					<div class="table-responsive">
						<form id="form">

							<table class="table table-bordered" id="inspctTable"
								style="text-align: center;">

								<thead class="thead-light">
									<tr>
										<th style="width: 10px;">순번</th>
										<th>점검항목</th>
										<th>점검기준</th>
										<th>결과</th>
									</tr>
								</thead>
							</table>
						</form>
					</div>
					<button type="button" class="btn btn-primary float-right mr-3"
						id="btnSave" disabled>저장</button>

					<!-- ----- 공정불량 상세정보 끝 ----- -->
				</div>
			</div>
			<!-- .right-sidebar -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<!-- 저장 여부 모달 -->
<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog"
	aria-labelledby="saveBtnModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h6>정말 저장 하시겠습니까?</h6>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="saveBtnModalY"
					data-dismiss="modal">예</button>
				<button type="button" class="btn btn-danger" id="saveBtnModalN"
					data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>
	let menuAuth = 'emsc0030';
	let currentHref = 'emsc0030';
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비일상점검상세");

	var today = "${serverDate}";
	var lastDay = "${lastDay}";
	var equipCd = null;
	var day = 0;
	var equipGroup = "";
	let sideView = 'add';
	var editAdd = 'add';
	var inspctRegDate = "${serverDate}".replace(/-/g, '');
	var inspctMonth = "";
	var demoDate = null;

	//공통코드 처리 시작
	var inspctResultCode = new Array(); // 정기검사결과 그룹
	<c:forEach items="${inspctResult}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspctResultCode.push(json);
	</c:forEach>
	/*     
	 var equipGroupCode = new Array(); // 설비분류
	 <c:forEach items="${equipGroup}" var="info">
	 var json=new Object();
	 json.baseCd="${info.baseCd}";
	 json.baseNm="${info.baseNm}";
	 equipGroupCode.push(json);
	 </c:forEach> */
	//공통코드 처리 종료  
	$("#demo-2").val(today.substring(0, 7));
	inspctMonth = $('#demo-2').val().replace(/-/g, '');
	selectBoxReset();
	uiProc(true);

	// 목록
	let equipCodeAdmTable = $('#equipCodeAdmTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-0'l><'col-sm-12 col-md-5'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
						language : lang_kor,
						paging : true,
						info : false,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						searching : true,
						pageLength : 20,
						ajax : {
							url : '<c:url value="bm/equipCodeAdmList"/>',
							type : 'GET',
							data : {
								'menuAuth' : menuAuth,
							//'equipGroup' : function() { return equipGroup; }
							},
						},
						rowId : 'equipCd',
						columns : [ {
							data : 'equipCd'
						}, {
							data : 'equipNm'
						}, ],
						order : [ [ 1, 'asc' ], ],
					//drawCallback: function( settings ) {
					//	$('#equipCodeAdmTable tbody tr td').css('height','40px');
					//}
					});

	let calTable = $('#calTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollX : true,
		searching : false,
		ajax : {
			url : '<c:url value="em/equipPrdcInspctDataList"/>',
			type : 'GET',
			data : {
				'menuAuth' : menuAuth,
				'equipCd' : function() {
					return equipCd;
				},
				'inspectMonth' : function() {
					return inspctMonth;
				}
			},
		},
		columns : [ {
			data : 'inspectDay',
			render : function(data, type, row, meta) {
				return data + '일';
			}
		}, {
			data : 'inspectResult1',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult2',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult3',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult4',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult5',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult6',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult7',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		}, {
			data : 'inspectResult8',
			render : function(data, type, row, meta) {
				var result = "";
				if (data != null) {
					switch (data) {
					case '001':
						result = "V";
						break;
					case '002':
						result = "X";
						break;
					case '003':
						result = "O";
						break;
					}
				}
				return result;

			}
		} ],
		order : [ [ 0, 'asc' ], ],
		columnDefs : [ {
			targets : "_all",
			className : 'text-center'
		} ]
	});

	//var html1 =  ' <div class="row">&nbsp;<label class="input-label-sm">설비그룹</label><select class="custom-select" id="equipGroupCd" ></select></div>'; 	
	// $('#equipCodeAdmTable_length').html(html1);
	//selectBoxAppend(equipGroupCode, "equipGroupCd", "", "1");

	/*     $("#equipGroupCd").change(function() {
	 equipGroup =  $('#equipGroupCd option:selected').val();
	 $('#equipCodeAdmTable').DataTable().ajax.reload( function () {});		
	 equipCd = null;	 	
	 $('#calTable').DataTable().ajax.reload();
	
	 }); */

	// 목록
	let inspctTable = $('#inspctTable')
			.DataTable(
					{
						dom : "<'row'<''l>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
						language : lang_kor,
						paging : false,
						info : false,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : true,
						searching : false,
						pageLength : 20,
						ajax : {
							url : '<c:url value="em/equipPrdcInspctDataListDtl"/>',
							type : 'GET',
							data : {
								'menuAuth' : menuAuth,
								'equipCd' : function() {
									return equipCd;
								},
								'inspectRegDate' : function() {
									return demoDate;
								},
								'inspectDay' : function() {
									return parseInt(day);
								},
							},
						},
						rowId : 'equipCd',
						columns : [
								{
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

										if (result == "") {
											return '<input type="text" class="form-control" value="" name="inspcetItem" maxlength="56" style="max-width:100%">';
										} else {
											return '<input type="text" class="form-control" value="'
												+ result
												+ '" name="inspcetItem" maxlength="56" style="max-width:100%" disabled>';
										}
									}
								},
								{
									data : 'inspcetBase',
									render : function(data, type, row, meta) {
										var result = (data == null) ? "" : data;
										
										if (result == "") {
											return '<input type="text" class="form-control" value="" name="inspcetBase" maxlength="56" style="max-width:100%">';
										} else {
											return '<input type="text" class="form-control" value="'
												+ result
												+ '" name="inspcetBase" maxlength="56" style="max-width:100%" disabled>';
										}
									}
								},
								{
									data : 'inspectResult',
									render : function(data, type, row, meta) {
										var html;
										var result = (data == null) ? "001": data;
										html = selectBoxHtml2(inspctResultCode,
												'inspectResult', result, row,
												meta, data);
										return html;
									}
								}, ],
						order : [ [ 1, 'asc' ], ],
						drawCallback : function(settings) {
// 							$('#inspctTable select').attr('disabled', true);
						}
					});

	$("#demo-2").change(function() {
		if (equipCd == null) {
			toastr.warning('설비명을 선택해주세요.');
			$("#demo-2").val(today.substring(0, 7));
			return false;
		}
		inspctMonth = $('#demo-2').val().replace(/-/g, '');
		$('#btnSave').attr('disabled', true);
		$('#calTable').DataTable().ajax.reload(function() {
		});

	});

	$('#btnAdd').on('click', function() {
		if (inspctTable.rows().count() >= 8) {
			toastr.warning("최대 8개까지만 가능합니다.");
			return false;
		}
		if ($('#calTable tbody tr').hasClass('selected') == false) {
			toastr.warning("일자를 선택해 주세요.");
			return false;
		}
		$('#btnSave').attr('disabled', false);
		editAdd = 'add';
		uiProc(false);

		$('#inspctTable').DataTable().row.add({}).draw(false);
	});

	$('#btnEdit').on('click', function() {
		if ($('#calTable tbody tr').hasClass('selected') == false) {
			toastr.warning("일자를 선택해 주세요.");
			return false;
		}
		$('#btnSave').attr('disabled', false);
		editAdd = 'edit';
		uiProc(false);

		$('input[name=inspcetItem]').attr('disabled', false);
		$('input[name=inspcetBase]').attr('disabled', false);
		$('#inspctTable select').attr('disabled', false);
	});

	$('#btnDel').on('click', function() {
		$('#inspctTable').DataTable().row($('#inspctTable .selected')).remove().draw();

		$('#btnSave').attr('disabled', false);
	});

	$('#inspctTable tbody').on('click','tr',function() {
		if ($(this).hasClass('tableSelected')) {

		} else {
			$('#inspctTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	
	$('#equipCodeAdmTable tbody').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
				} else {
					$('#equipCodeAdmTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
					equipCd = equipCodeAdmTable.row(this).data().equipCd;
					inspctMonth = $('#demo-2').val().replace(/-/g, '');
					$('#btnSave').attr('disabled', true);
					$('#btnAdd').attr('disabled', true);
					$('#btnEdit').attr('disabled', true);
					$('#btnDel').attr('disabled', true);

					$('#calTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					selectBoxReset();
					sideView = 'add';
				}
			});

	$('#calTable tbody')
			.on(
					'click',
					'tr',
					function() {
						if (equipCd == null) {
							toastr.warning('설비명을 선택해주세요.');
							return false;
						} else {
							if ($(this).hasClass('tableSelected')) {

							} else {
								$('#calTable').DataTable().$('tr.selected')
										.removeClass('selected');
								$(this).addClass('selected');
								$('#btnSave').attr('disabled', true);
								uiProc(true);
								day = $('#calTable').DataTable().row(this)
										.index() + 1;
								demoDate = $('#demo-2').val().replace(/-/g, '');

								$('#inspctTable').DataTable().ajax
										.reload(function() {
										});

								if ($('#calTable').DataTable().row(this).data().inspectBase1 == null) {
									$('#btnEdit').attr('disabled', true);
									$('#btnDel').attr('disabled', true);
									$('#btnAdd').attr('disabled', false);
								} else {
									$('#btnEdit').attr('disabled', false);
									$('#btnAdd').attr('disabled', false);
									$('#btnDel').attr('disabled', false);
								}

								/*
								$.ajax({
									url: '<c:url value="em/equipPrdcInspctAdmDataList"/>',
								       type: 'GET',
								       data: {
								       	'menuAuth'	 : menuAuth,
								       	'equipCd'			:	function() { return equipCd; },
								       	'inspctRegDate'		:	$('#demo-2').val().replace(/-/g, ''),
								       	'inspctDay'			:   function() { return parseInt(day); },			   	        	
								       },
								       success: function (res) {
								       	var data = res.data;		   	        	
								       	sideView = 'edit';
								       	if(data != null){		   	     
								       		$('#btnEdit').attr('disabled',false);
								       		$('#btnAdd').attr('disabled',true);
								       		$("#inspctItem1Dtl1").val(data.inspctItem1Dtl1);
								       		$("#inspctItem1Dtl2").val(data.inspctItem1Dtl2);
								       		$("#inspctItem2Dtl1").val(data.inspctItem2Dtl1);
								       		$("#inspctItem2Dtl2").val(data.inspctItem2Dtl2);
								       		$("#inspctItem3Dtl1").val(data.inspctItem3Dtl1);
								       		$("#inspctItem3Dtl2").val(data.inspctItem3Dtl2);
								       		$("#inspctItem4Dtl1").val(data.inspctItem4Dtl1);
								       		$("#inspctItem4Dtl2").val(data.inspctItem4Dtl2);
								       		$("#inspctItem5Dtl1").val(data.inspctItem5Dtl1);
								       		$("#inspctItem5Dtl2").val(data.inspctItem5Dtl2);
								       		$("#inspctItem5Dtl3").val(data.inspctItem5Dtl3);
								       		$("#inspctItem6Dtl1").val(data.inspctItem6Dtl1);
								       		$("#inspctItem7Dtl1").val(data.inspctItem7Dtl1);
								       		$("#inspctItem7Dtl2").val(data.inspctItem7Dtl2);
								       		$("#inspctItem8Dtl1").val(data.inspctItem8Dtl1);
								       		$("#inspctItem8Dtl2").val(data.inspctItem8Dtl2);
								       		$("#inspctItem8Dtl3").val(data.inspctItem8Dtl3);
								       		$("#inspctItem8Dtl4").val(data.inspctItem8Dtl4);		   	        		
								       	}else{
								       		$('#btnEdit').attr('disabled',true);
								       		$('#btnAdd').attr('disabled',false);		   	        		
								       		selectBoxReset();
								       	}
								       }
								});*/
							}
						}
					});

	$('#btnSave').on(
			'click',
			function() {

				var url;
				if (editAdd == 'add') {
					url = '<c:url value="em/equipPrdcInspctAdmCreate"/>';
				} else {
					url = '<c:url value="em/equipPrdcInspctAdmUpdate"/>';
				}

				$
						.ajax({
							url : url,
							type : 'POST',
							data : {
								'menuAuth' : menuAuth,
								'equipCd' : function() {
									return equipCd;
								},
								'inspectRegDate' : $('#demo-2').val().replace(
										/-/g, ''),
								'inspectDay' : function() {
									return parseInt(day);
								},
								'inspectMonth' : $('#demo-2').val().replace(
										/-/g, ''),
								'inspectItem1' : $("#inspctTable tbody tr").eq(
										0).find('td input').eq(0).val(),
								'inspectBase1' : $("#inspctTable tbody tr").eq(
										0).find('td input').eq(1).val(),
								'inspectResult1' : $("#inspctTable tbody tr")
										.eq(0).find('td select').val(),
								'inspectItem2' : $("#inspctTable tbody tr").eq(
										1).find('td input').eq(0).val(),
								'inspectBase2' : $("#inspctTable tbody tr").eq(
										1).find('td input').eq(1).val(),
								'inspectResult2' : $("#inspctTable tbody tr")
										.eq(1).find('td select').val(),
								'inspectItem3' : $("#inspctTable tbody tr").eq(
										2).find('td input').eq(0).val(),
								'inspectBase3' : $("#inspctTable tbody tr").eq(
										2).find('td input').eq(1).val(),
								'inspectResult3' : $("#inspctTable tbody tr")
										.eq(2).find('td select').val(),
								'inspectItem4' : $("#inspctTable tbody tr").eq(
										3).find('td input').eq(0).val(),
								'inspectBase4' : $("#inspctTable tbody tr").eq(
										3).find('td input').eq(1).val(),
								'inspectResult4' : $("#inspctTable tbody tr")
										.eq(3).find('td select').val(),
								'inspectItem5' : $("#inspctTable tbody tr").eq(
										4).find('td input').eq(0).val(),
								'inspectBase5' : $("#inspctTable tbody tr").eq(
										4).find('td input').eq(1).val(),
								'inspectResult5' : $("#inspctTable tbody tr")
										.eq(4).find('td select').val(),
								'inspectItem6' : $("#inspctTable tbody tr").eq(
										5).find('td input').eq(0).val(),
								'inspectBase6' : $("#inspctTable tbody tr").eq(
										5).find('td input').eq(1).val(),
								'inspectResult6' : $("#inspctTable tbody tr")
										.eq(5).find('td select').val(),
								'inspectItem7' : $("#inspctTable tbody tr").eq(
										6).find('td input').eq(0).val(),
								'inspectBase7' : $("#inspctTable tbody tr").eq(
										6).find('td input').eq(1).val(),
								'inspectResult7' : $("#inspctTable tbody tr")
										.eq(6).find('td select').val(),
								'inspectItem8' : $("#inspctTable tbody tr").eq(
										7).find('td input').eq(0).val(),
								'inspectBase8' : $("#inspctTable tbody tr").eq(
										7).find('td input').eq(1).val(),
								'inspectResult8' : $("#inspctTable tbody tr")
										.eq(7).find('td select').val(),

							},
							success : function(res) {
								var data = res.data;
								if (res.result == "ok") {
									toastr.success("저장되었습니다.");

									$('#calTable').DataTable().ajax
											.reload(function() {
											});
									uiProc(true);
									$('#btnSave').attr('disabled', true);
									$('#btnAdd').attr('disabled', true);
									$('#btnEdit').attr('disabled', true);
									$('#btnDel').attr('disabled', true);
									
									$('#inspctTable select').attr('disabled',
											true);
								} else {
									toastr.warning("저장에 실패했습니다.");
									uiProc(true);
									$('#btnSave').attr('disabled', true);
									$('#btnAdd').attr('disabled', true);
									$('#btnEdit').attr('disabled', true);
									$('#btnDel').attr('disabled', true);
								}
							}
						});
			});

	$('#demo-2').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : 2021,
		startYear : 1900,
		finalYear : 2212
	});

	function uiProc(flag) {
		$('#inspctItem1Dtl1').attr('disabled', flag);
		$('#inspctItem1Dtl2').attr('disabled', flag);
		$('#inspctItem2Dtl1').attr('disabled', flag);
		$('#inspctItem2Dtl2').attr('disabled', flag);
		$('#inspctItem3Dtl1').attr('disabled', flag);
		$('#inspctItem3Dtl2').attr('disabled', flag);
		$('#inspctItem4Dtl1').attr('disabled', flag);
		$('#inspctItem4Dtl2').attr('disabled', flag);
		$('#inspctItem5Dtl1').attr('disabled', flag);
		$('#inspctItem5Dtl2').attr('disabled', flag);
		$('#inspctItem5Dtl3').attr('disabled', flag);
		$('#inspctItem6Dtl1').attr('disabled', flag);
		$('#inspctItem7Dtl1').attr('disabled', flag);
		$('#inspctItem7Dtl2').attr('disabled', flag);
		$('#inspctItem8Dtl1').attr('disabled', flag);
		$('#inspctItem8Dtl2').attr('disabled', flag);
		$('#inspctItem8Dtl3').attr('disabled', flag);
		$('#inspctItem8Dtl4').attr('disabled', flag);
	}

	function selectBoxReset() {
		selectBoxAppend(inspctResultCode, "inspctItem1Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem1Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem2Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem2Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem3Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem3Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem4Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem4Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem5Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem5Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem5Dtl3", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem6Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem7Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem7Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem8Dtl1", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem8Dtl2", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem8Dtl3", "001", "");
		selectBoxAppend(inspctResultCode, "inspctItem8Dtl4", "001", "");
	}

	//콤마 제거
	function commaDelete(data) {
		var result = data;
		if (data != null) {
			//console.log(data.slice(0, -1));
			for (var i = 1; i < data.length + 1; i++) {
				if (data.substring(data.length - i, data.length - i + 1) == ',') {
					result = data.slice(0, -i);
				} else {
					break;
				}
			}
		}
		return result;
	}

	function selectBoxHtml2(obj, id, sVal, row, meta, data) {
		//$('#'+ id).empty();
		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" ';

		if (data != null) {
			shtml += 'disabled="disabled"'
		}

		shtml += '><option value="">선택</option>';
		
		//var shtml = '<select class="mySelect" data-col="' + meta.col + '" ><option value="">선택</option>';

		var option = "";
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

		let ehtml = '</select>';
		
		return shtml + option + ehtml;
	}
</script>
</body>
</html>
