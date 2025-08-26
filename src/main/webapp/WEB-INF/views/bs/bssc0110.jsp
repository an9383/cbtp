<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">


	<div class="modal fade bd-example-modal-lg" id="layerPopUpModal"
		tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" style="min-width: 1600px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="dealCorpPopUpLabel">성취도 관리</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<hr class="text-secondary">
					<form id="form">
						<table id="layerPopUpTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th rowspan="2" colspan="2" style="min-width: 130px;"
										class="text-center">구분</th>
									<th colspan="10" style="min-width: 70px;" class="text-center">소형
										SERVO MOTOR 조립</th>
									<th colspan="11" style="min-width: 70px;" class="text-center">중형
										SERVO MOTOR 조립</th>
								</tr>
								<tr>
									<th style="min-width: 50px" class="text-center">전체용접</th>
									<th style="min-width: 50px" class="text-center">개별용접</th>
									<th style="min-width: 50px" class="text-center">권선</th>
									<th style="min-width: 50px" class="text-center">피팅가공</th>
									<th style="min-width: 50px" class="text-center">LEAD결선</th>

									<th style="min-width: 50px" class="text-center">자석부착</th>
									<th style="min-width: 50px" class="text-center">착자</th>
									<th style="min-width: 50px" class="text-center">베어링 압입</th>
									<th style="min-width: 50px" class="text-center">조립</th>
									<th style="min-width: 50px" class="text-center">시험</th>

									<th style="min-width: 50px" class="text-center">권선</th>
									<th style="min-width: 50px" class="text-center">전체용접</th>
									<th style="min-width: 50px" class="text-center">S/T결선</th>
									<th style="min-width: 50px" class="text-center">FRAME삽입</th>
									<th style="min-width: 50px" class="text-center">피팅가공</th>

									<th style="min-width: 50px" class="text-center">콘넥터결선</th>
									<th style="min-width: 50px" class="text-center">R/T압입</th>
									<th style="min-width: 50px" class="text-center">자석 부착</th>
									<th style="min-width: 50px" class="text-center">발란성</th>
									<th style="min-width: 50px" class="text-center">조립</th>

									<th style="min-width: 55px" class="text-center">시험</th>
								</tr>

							</thead>

						</table>
					</form>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="layerPopUpSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">성취도관리</li>
			</ol>
		</nav>
	</header>

	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list Top-sidebar" id="left-30" style="width: 100%;">
				<div class="card">
					<div class="table-responsive">

						<!-- 	<div class="mt-2">
                           <div class="row">&nbsp;<label class="input-label-sm">등록년월</label>
                                 <div class="form-group input-sub m-0 row">
	                                 <input class="form-control mtz-monthpicker-widgetcontainer" type="month" id="achieveMonth">
                              	</div>
                           </div>
                        </div> -->
						<table id="achieveAdmTable" class="table table-bordered"
							style="text-align: center">
							<thead class="thead-light">
								<tr>
									<th rowspan="2" colspan="2" style="min-width: 150px;"
										class="text-center">구분</th>
									<th colspan="10" style="min-width: 70px;" class="text-center">소형
										SERVO MOTOR 조립</th>
									<th colspan="11" style="min-width: 70px;" class="text-center">중형
										SERVO MOTOR 조립</th>
								</tr>
								<tr>
									<th style="min-width: 55px" class="text-center">개별용접</th>
									<th style="min-width: 55px" class="text-center">전체용접</th>
									<th style="min-width: 55px" class="text-center">권선</th>
									<th style="min-width: 55px" class="text-center">피팅가공</th>
									<th style="min-width: 55px" class="text-center">LEAD결선</th>

									<th style="min-width: 55px" class="text-center">자석부착</th>
									<th style="min-width: 55px" class="text-center">착자</th>
									<th style="min-width: 55px" class="text-center">베어링압입</th>
									<th style="min-width: 55px" class="text-center">조립</th>
									<th style="min-width: 55px" class="text-center">시험</th>

									<th style="min-width: 55px" class="text-center">권선</th>
									<th style="min-width: 55px" class="text-center">전체 용접</th>
									<th style="min-width: 55px" class="text-center">S/T결선</th>
									<th style="min-width: 55px" class="text-center">FRAME삽입</th>
									<th style="min-width: 55px" class="text-center">피팅 가공</th>

									<th style="min-width: 55px" class="text-center">콘넥터결선</th>
									<th style="min-width: 55px" class="text-center">R/T압입</th>
									<th style="min-width: 55px" class="text-center">자석부착</th>
									<th style="min-width: 55px" class="text-center">발란성</th>
									<th style="min-width: 55px" class="text-center">조립</th>

									<th style="min-width: 55px" class="text-center">시험</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.page-section -->
			<!-- 사이드 페이지 -->
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>
	menuAuth = 'bssc0110';
	let currentHref = 'bssc0110';
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "성취도관리");
	var puFlag = null;
	var sideView = 'add';

	var serverDate = "${serverDate}";
	var serverMonth = serverDate.substring(0, 7);

	$('#achieveMonth').val(serverMonth);
	$('#achieveMonth2').val(serverMonth);
	//$(AchieveAdmMonth).val(serverDate)

	var lineGubun = null;
	var userNumber = null;
	var achieveMonth = null;

	//공통코드 처리 시작
	var achieveGradeCode = new Array();
	<c:forEach items="${achieveGrade}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	achieveGradeCode.push(json);
	</c:forEach>

	var achieveLineCode = new Array();
	<c:forEach items="${achieveLine}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	achieveLineCode.push(json);
	</c:forEach>
	//공통코드 처리 끝

	// 성취도 목록
	let achieveAdmTable = $('#achieveAdmTable').on('error.dt',
			function(e, settings, techNote, message) {
				if (techNote == 7) {
					toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.");
					setTimeout(function() {
						location.href = "/bssc0110";
					}, 1000);
				}
			}).DataTable({
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 24,
		ajax : {
			url : '<c:url value="/bs/AchieveAdmList"/>',
			type : 'GET',
			data : {
				'menuAuth' : menuAuth,
				'achieveMonth' : function() {
					return serverMonth.replace(/-/g, "");
				}

			}
		},
		columns : [ {
			data : 'lineGubunNm',
			name : 'rowspan',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['lineGubun'];
				}
				return result;
			}
		}, {
			data : 'userNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['userNumber'];
				}
				return result;
			}
		}, {
			data : 'smallEachWeldingNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallEachWelding'];
				}
				return result;
			}
		}, {
			data : 'smallAllWeldingNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallAllWelding'];
				}
				return result;
			}
		}, {
			data : 'smallWindingNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallWinding'];
				}
				return result;
			}
		}, {
			data : 'smallFittingPressNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallFittingPress'];
				}
				return result;
			}
		}, {
			data : 'smallLeadConnNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallLeadConn'];
				}
				return result;
			}
		}, {
			data : 'smallMagnetAttachNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallMagnetAttach'];
				}
				return result;
			}
		}, {
			data : 'smailChakuaNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smailChakua'];
				}
				return result;
			}
		}, {
			data : 'smallBearingPressinNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallBearingPressin'];
				}
				return result;
			}
		}, {
			data : 'smallAssemblyNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallAssembly'];
				}
				return result;
			}
		}, {
			data : 'smallTestNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['smallTest'];
				}
				return result;
			}
		}, {
			data : 'midWindingNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midWinding'];
				}
				return result;
			}
		}, {
			data : 'midAllWeldingNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midAllWelding'];
				}
				return result;
			}
		}, {
			data : 'midStConnNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midStConn'];
				}
				return result;
			}
		}, {
			data : 'midInsertFrameNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midInsertFrame'];
				}
				return result;
			}
		}, {
			data : 'midFittingPressNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midFittingPress'];
				}
				return result;
			}
		}, {
			data : 'midConectrConnNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midConectrConn'];
				}
				return result;
			}
		}, {
			data : 'midRtPressinNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midRtPressin'];
				}
				return result;
			}
		}, {
			data : 'midMagnetAttachNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midMagnetAttach'];
				}
				return result;
			}
		}, {
			data : 'midBalansungNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midBalansung'];
				}
				return result;
			}
		}, {
			data : 'midAssemblyNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midMagnetAttach'];
				}
				return result;
			}
		}, {
			data : 'midTestNm',
			render : function(data, type, row, meta) {
				var result = data;
				if (data == "" || data == null) {
					result = row['midTest'];
				}
				return result;
			}
		}

		],
		rowsGroup : [ 'rowspan:name', [ 0 ] ],
		buttons : [

		],
		order : [ [ 0, 'asc' ] ],
	});

	// 성취도 목록
	let layerPopUpTable = $('#layerPopUpTable')
			.on('error.dt', function(e, settings, techNote, message) {
				if (techNote == 7) {
					toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.");
					setTimeout(function() {
						location.href = "/bssc0110";
					}, 1000);
				}
			})
			.DataTable(
					{
						language : lang_kor,
						paging : false,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						pageLength : 24,
						ajax : {
							url : '<c:url value="/bs/AchieveAdmRead"/>',
							type : 'GET',
							data : {
								'menuAuth' : menuAuth,
								'lineGubun' : function() {
									return lineGubun;
								},
								'userNumber' : function() {
									return userNumber;
								},
								'achieveMonth' : function() {
									return achieveMonth;
								},
							}
						},
						columns : [
								{
									data : 'lineGubun',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveLineCode,
												'lineGubun', data, row, meta);
										return html;
									}
								},
								{
									data : 'userNm',
									render : function(data, type, row, meta) {
										var value = "";
										if (data != null) {
											value = '<input type="text" class="form-control" style="border:none; width:80px;" name="userNm" value="'+data+'" disabled>';
										} else {
											value = '<input type="text" class="form-control" name="userNm" value=""  style="border:none; width:80px; " disabled>';
										}
										var html = '<div class="input-sub m-0">';
										html += value;
										html += '<input type="hidden" name="userNumber" value="'+row['userNumber']+'">';
										html += '<button type="button" class="btn btn-primary input-sub-search" name="btnSelBuyCorp" onClick="selectRcvChargr();" >';
										html += '<span class="oi oi-magnifying-glass"></span>';
										html += '</button>';
										html += '</div>';
										return html;
									}
								},
								{
									data : 'smallEachWelding',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallEachWelding', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smallAllWelding',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallAllWelding', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smallWinding',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallWinding', data, row, meta);
										return html;
									}
								},
								{
									data : 'smallFittingPress',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallFittingPress', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smallLeadConn',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallLeadConn', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smallMagnetAttach',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallMagnetAttach', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smailChakua',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smailChakua', data, row, meta);
										return html;
									}
								},
								{
									data : 'smallBearingPressin',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallBearingPressin', data,
												row, meta);
										return html;
									}
								},
								{
									data : 'smallAssembly',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallAssembly', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'smallTest',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'smallTest', data, row, meta);
										return html;
									}
								},
								{
									data : 'midWinding',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midWinding', data, row, meta);
										return html;
									}
								},
								{
									data : 'midAllWelding',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midAllWelding', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'midStConn',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midStConn', data, row, meta);
										return html;
									}
								},
								{
									data : 'midInsertFrame',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midInsertFrame', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'midFittingPress',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midFittingPress', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'midConectrConn',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midConectrConn', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'midRtPressin',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midRtPressin', data, row, meta);
										return html;
									}
								},
								{
									data : 'midMagnetAttach',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midMagnetAttach', data, row,
												meta);
										return html;
									}
								},
								{
									data : 'midBalansung',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midBalansung', data, row, meta);
										return html;
									}
								},
								{
									data : 'midAssembly',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midAssembly', data, row, meta);
										return html;
									}
								},
								{
									data : 'midTest',
									render : function(data, type, row, meta) {
										var html;
										html = selectBoxHtml2(achieveGradeCode,
												'midTest', data, row, meta);
										return html;
									}
								}

						],
						order : [ [ 0, 'asc' ] ],
						buttons : [

						],
					});

	var htmlMenu = ' <label>검색 : <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="systemCommonGroupCd" style="width:110px"> </label><button class="btn btn-primary float-right mr-2" type="button" id="achieveAdmDel">삭제</button>&nbsp;<button class="btn btn-primary float-right mr-2" type="button" id="achieveAdmEdit">수정</button></button><button class="btn btn-primary float-right mr-2" type="button" id="achieveAdmAdd">등록';
	var html1 = '<div class="row">&nbsp;<label class="input-label-sm">등록년월</label>';
	html1 += '<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-2">';
	html1 += '</div>';
	html1 += '</div>';

	$('#achieveAdmTable_length').html(html1);
	$('#demo-2').val(serverMonth);
	$('#achieveAdmTable_filter').html(htmlMenu);

	// 마우스 클릭시 이벤트
	$('#achieveAdmTable tbody').on(
			'click',
			'tr',
			function() {
				//선택박스 처리
				lineGubun = achieveAdmTable.row(this).data().lineGubun;
				userNumber = achieveAdmTable.row(this).data().userNumber;
				achieveMonth = achieveAdmTable.row(this).data().achieveMonth
						.replace(/-/g, "");
				sideView = 'edit';

				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#achieveAdmTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

			});

	$('#demo-2').on('change', function() {
		serverMonth = $('#demo-2').val();
		$('#achieveAdmTable').DataTable().ajax.reload(function() {
		});
	});

	//성취도목록 등록버튼
	$('#achieveAdmAdd').click(function() {
		sideView = 'add';
		puFlag = "achieveAdmAdd";
		$('#layerPopUpTable').DataTable().ajax.reload(function() {
			selectBoxSet();
			$('input[name=userNm]').val("");
			$('input[name=userNumber]').val("");
		});
		$('select[name=lineGubun]').attr('disabled', false);
		$('button[name=btnSelBuyCorp]').attr('disabled', false);
		$('#layerPopUpModal').modal('show');
	});

	//성취도목록 수정버튼
	$('#achieveAdmEdit').click(function() {
		if (!$('#achieveAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		sideView = 'edit';

		$('#layerPopUpTable').DataTable().ajax.reload(function() {
			$('select[name=lineGubun]').attr('disabled', true);
			$('button[name=btnSelBuyCorp]').attr('disabled', true);

		});
		$('#layerPopUpModal').modal('show');
	});

	//성취도목록 삭제버튼
	$('#achieveAdmDel').click(function() {

		var data = achieveAdmTable.row('.selected').data();
		if (!$('#achieveAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("삭제할 항목을 선택해 주세요.");
		} else {

			$.ajax({
				url : '<c:url value="/bs/AchieveAdmDelete"/>',
				type : 'POST',
				data : {
					'lineGubun' : function() {
						return lineGubun;
					},
					'achieveMonth' : function() {
						return achieveMonth;
					},
					'userNumber' : function() {
						return userNumber;
					}
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("삭제되었습니다.");
						$('#achieveAdmTable').DataTable().ajax.reload(); //등록 후 테이블 리로드
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
				}
			});
		}
		//    		$('#achieveAdmTable tbody').on('click', 'tr', function () {
		//    			$('#lineGubun').val(achieveAdmTable.row(this).data().lineGubun);
		//    	   	});

	});

	//저장버튼 클릭시
	$('#layerPopUpSave').click(function() {

		if (sideView == "add" || puFlag == "achieveAdmEdit") {
			achieveAdmProc(puFlag);
		}
		$('#layerPopUpModal').modal('hide');
	});

	// 선택박스 설정
	function selectBoxSet() {
		$('select[name=lineGubun]').val("001");

		$('select[name=smallEachWelding]').val("001");
		$('select[name=smallAllWelding]').val("001");
		$('select[name=smallWinding]').val("001");
		$('select[name=smallFittingPress]').val("001");
		$('select[name=smallLeadConn]').val("001");
		$('select[name=smallMagnetAttach]').val("001");
		$('select[name=smailChakua]').val("001");
		$('select[name=smallBearingPressin]').val("001");
		$('select[name=smallAssembly]').val("001");
		$('select[name=smallTest]').val("001");

		$('select[name=midWinding]').val("001");
		$('select[name=midAllWelding]').val("001");
		$('select[name=midStConn]').val("001");
		$('select[name=midInsertFrame]').val("001");
		$('select[name=midFittingPress]').val("001");
		$('select[name=midConectrConn]').val("001");
		$('select[name=midRtPressin]').val("001");
		$('select[name=midMagnetAttach]').val("001");
		$('select[name=midBalansung]').val("001");
		$('select[name=midAssembly]').val("001");
		$('select[name=midTest]').val("001");
	}

	//성취도 목록 등록
	function achieveAdmProc(puFlag) {
		// 	    if ( !$.trim($('#puachieveAdmId').val()) ) {
		// 	        toastr.warning('메뉴ID를 입력해 주세요.');
		// 	        $('#puachieveAdmId').focus();
		// 	        return false;
		// 	    }

		// 	    if ( !$.trim($('#puachieveAdmNm').val()) ) {
		// 	        toastr.warning('메뉴명을 입력해 주세요.');
		// 	        $('#puachieveAdmNm').focus();
		// 	        return false;
		// 	    }	

		var achieveAdmURL = "";
		var achieveAdmMsg = "";

		if (sideView == "add") {
			achieveAdmURL = '<c:url value="/bs/AchieveAdmCreate"/>';
			achieveAdmMsg = '등록 되었습니다.';
		} else {
			achieveAdmURL = '<c:url value="/bs/AchieveAdmUpdate"/>';
			achieveAdmMsg = '수정 되었습니다.';
		}

		$
				.ajax({
					url : achieveAdmURL,
					type : 'POST',
					data : {
						'lineGubun' : $(
								'select[name=lineGubun] option:selected').val(),
						'userNumber' : $('input[name=userNumber]').val(),
						'achieveMonth' : $('#demo-2').val().replace(/-/g, ""),
						'smallEachWelding' : $(
								'select[name=smallEachWelding] option:selected')
								.val(),
						'smallAllWelding' : $(
								'select[name=smallAllWelding] option:selected')
								.val(),
						'smallWinding' : $(
								'select[name=smallWinding] option:selected')
								.val(),
						'smallFittingPress' : $(
								'select[name=smallFittingPress] option:selected')
								.val(),
						'smallLeadConn' : $(
								'select[name=smallLeadConn] option:selected')
								.val(),
						'smallMagnetAttach' : $(
								'select[name=smallMagnetAttach] option:selected')
								.val(),
						'smailChakua' : $(
								'select[name=smailChakua] option:selected')
								.val(),
						'smallBearingPressin' : $(
								'select[name=smallBearingPressin] option:selected')
								.val(),
						'smallAssembly' : $(
								'select[name=smallAssembly] option:selected')
								.val(),
						'smallTest' : $(
								'select[name=smallTest] option:selected').val(),
						'midWinding' : $(
								'select[name=midWinding] option:selected')
								.val(),
						'midAllWelding' : $(
								'select[name=midAllWelding] option:selected')
								.val(),
						'midStConn' : $(
								'select[name=midStConn] option:selected').val(),
						'midInsertFrame' : $(
								'select[name=midInsertFrame] option:selected')
								.val(),
						'midFittingPress' : $(
								'select[name=midFittingPress] option:selected')
								.val(),
						'midConectrConn' : $(
								'select[name=midConectrConn] option:selected')
								.val(),
						'midRtPressin' : $(
								'select[name=midRtPressin] option:selected')
								.val(),
						'midMagnetAttach' : $(
								'select[name=midMagnetAttach] option:selected')
								.val(),
						'midBalansung' : $(
								'select[name=midBalansung] option:selected')
								.val(),
						'midAssembly' : $(
								'select[name=midAssembly] option:selected')
								.val(),
						'midTest' : $('select[name=midTest] option:selected')
								.val()
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success(achieveAdmMsg);
							$('#achieveAdmTable').DataTable().ajax.reload(); //등록 후 테이블 리로드	            	
							$('#layerPopUpModal').modal('hide');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
					}
				});
	}

	//직원목록 모달창
	var userPopUpTable;
	function selectRcvChargr() {
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
				userNumber = data.userNumber;
				$('input[name=userNm]').val(data.userNm);
				$('input[name=userNumber]').val(data.userNumber);

				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

	$('#demo-2').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : 2020,
		startYear : 1900,
		finalYear : 2212
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

	function selectBoxHtml3(obj, id, sVal, row, meta) {

		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select" name="'+ id +'" ><option value="">선택</option>';
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

	function selectBoxAppend2(obj, id, sVal, flag) {

		$('select[name=' + id + ']').empty();
		if (flag == '1') {
			$('select[name=' + id + ']').append(
					$("<option value=''>" + "전체" + "</option>"));
		} else if (flag == '2') {
			$('select[name=' + id + ']').append(
					$("<option value=''>" + "선택" + "</option>"));
		}

		for (key in obj) {
			var option;
			if (obj[key].baseCd == sVal) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>");
			} else {
				option = $("<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>");
			}
			$('#' + id).append(option);
		}

	}
</script>

</body>
</html>
 