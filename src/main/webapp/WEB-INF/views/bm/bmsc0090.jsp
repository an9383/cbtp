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
				<li class="breadcrumb-item active">불량유형관리(레이저)</li>
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
						<table id="baseInfoFtTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="18%">
								<col width="17%">
								<col width="25%">
								<col width="13%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>불량코드</th>
									<th class="text-center">불량유형구분</th>
									<th>불량유형명</th>
									<th>사용여부</th>
									<th>비고</th>
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
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary d-none float-right"
						id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
						<button type="button" class="btn btn-danger float-right mr-1"
							id="btnDel">삭제</button>
						<button class="btn btn-warning d-none" id="btnDelConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						
						<button type="button" class="btn btn-warning float-right mr-1"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">등록</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
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
									<th>*불량코드</th>
									<td><input type="text" class="form-control" id="baseInfoCd" name="baseInfoCd" placeholder="자동채번" style="text-align:center;" disabled></td>
									<th>*불량유형구분</th>
									<td><select class="custom-select" id="baseInfoGubun"
										name="baseInfoGubun"></select></td>
								</tr>
								<tr>
									<th>*불량유형명</th>
									<td><input type="text" class="form-control"
										style="max-width: 100%" id="baseInfoNm" name="baseInfoNm"></td>
									<th>*사용여부</th>
									<td><select class="custom-select" id="useYn" name="useYn"></select></td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control"
										id="baseInfoDesc" name="baseInfoDesc" style="min-width:100%"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<table class="table table-bordered mt-5 d-none" id="changeHisTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<th>변경내역</th>
						<td colspan='3'><input type="text" class="form-control" style="max-width: 100%"
							id="changeHis" maxlength="20"></td>
					</tr>
				</table>
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

	let currentHref = "bmsc0090";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","불량유형관리(레이저)"); 
	let viewIdx;
	let sideView = 'add';
	uiProc(true);
	var tableIdx=null;

	
	//공통코드 처리 시작      
	var useYnCode = new Array(); // 상태여부
	var baseInfoType = "FT";
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var baseInfoGubunCode = new Array(); // 불량유형구분
	<c:forEach items="${baseInfoGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	baseInfoGubunCode.push(json);
	</c:forEach>
	
	var etc1 = new Array(); // 우선순위
	<c:forEach items="${etc1}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	etc1.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", "", "");
	selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
	selectBoxAppend(etc1, "etc1", "", "2");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});

	$("#dealCorpNm").attr("disabled", true);

	// 목록
	let baseInfoFtTable = $('#baseInfoFtTable').DataTable({
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
			url : '<c:url value="bm/baseInfoFtList"/>',
			type : 'GET',
			data : {
				'etc1' : '001'
			},
		},
		rowId : 'baseInfoSeq',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					}
				}, {
					data : 'baseInfoCd'
				}, {
					data : 'baseInfoGubunNm',
					'className' : 'text-center'
				}, {
					data : 'baseInfoNm'
				}, {
					data : 'useYnNm'
				}, {
					data : 'baseInfoDesc'
				},  ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '불량유형관리(사출)'
		}, 'print' ],
		columnDefs : [ {
			className : "text-left",
			targets : 2

		}, ]
	});
	
	// 보기
	$('#baseInfoFtTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#baseInfoFtTable').DataTable().row(this).index();
		
		baseInfoSeq = baseInfoFtTable.row(this).data().baseInfoSeq;
		$('#formBox').removeClass('d-none');
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //수정버튼
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtRead"/>',
			type : 'GET',
			data : {
				'baseInfoType' : baseInfoType,
				'baseInfoSeq' : baseInfoSeq
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				$('#form input[name="baseInfoCd"]').val(data.baseInfoCd);
				$('#form input[name="baseInfoNm"]').val(data.baseInfoNm);
				$('#form input[name="baseInfoDesc"]').val(data.baseInfoDesc);

				//선택박스 처리
				selectBoxAppend(useYnCode, "useYn", data.useYn, "");
				selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", data.baseInfoGubun, "");
				selectBoxAppend(etc1, "etc1", data.etc1, "2");
				
				gubunVal = baseInfoFtTable.row(tableIdx).data().baseInfoGubun;
			}
		});
		
	});
	
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});
		
		//선택한 행 취소
		$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
		
		//설비코드 중복체크
		/* $('#equipCdCheck').val("false"); */
		$('#btnCheck').attr("disabled", false);
		$('#btnDel').attr("disabled", false);
		//화면처리        
		uiProc(false);
		
		//셀렉트박스 처리
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
		selectBoxAppend(etc1, "etc1", "", "2");

		//선택박스처리
		$('#useYn option[value="001"]').attr('selected', 'selected');
		$('#baseInfoGubun option[value="001"]').attr('selected', 'selected');
		$('#etc1 option[value=""]').attr('selected', 'selected');

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnDel').attr('disabled', true); //삭제버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요!");
			return false;
		}
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtDataDelete"/>',
			type : 'POST',
			data :{
				'baseInfoSeq' : function(){return baseInfoSeq;}
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		$('#form').each(function(){this.reset();});
		
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
		selectBoxAppend(etc1, "etc1", "", "2");
		
		
	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#baseInfoNm').val())) {
			toastr.warning('불량유형명을 입력해주세요.');
			$('#baseInfoNm').focus();
			return false;
		}

		var url = '<c:url value="/bm/baseInfoFtCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/bm/baseInfoFtUpdate"/>';
		} else {
			baseInfoSeq = "";
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'baseInfoSeq' : baseInfoSeq,
				'baseInfoType' : baseInfoType,
				'baseInfoCd' : $('#baseInfoCd').val(),
				'baseInfoNm' : $('#baseInfoNm').val(),
				'baseInfoDesc' : $('#baseInfoDesc').val(),
				'baseInfoGubun' : $('#baseInfoGubun option:selected').val(),
				'etc1' : '001',			//사출/봉제
				'etc3' : '',
				'useYn' : $('#useYn option:selected').val()
			},
			/* 			beforeSend : function() {
			 // $('#btnAddConfirm').addClass('d-none');
			 }, */
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#baseInfoFtTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			var url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
//						$('#btnAddConfirm').removeClass('d-none');
//						$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}else{
			$('#changeHisTable').addClass('d-none');
		}
		
	});
	
	//화면 설정
	function uiProc(flag) {
		$("#baseInfoNm").attr("disabled", flag);
		$("#baseInfoDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#baseInfoGubun").attr("disabled", flag);
		$("#etc1").attr("disabled", flag);
	}
	
</script>

</body>
</html>
