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
	<!-- 공정정보관리 - 설비정보 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="prcssEquipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssEquipPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="prcssEquipPopUpLabel">설비코드조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="prcssEquipPopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 30%">설비코드</th>
									<th style="width : 70%">설비명</th>
		                   		</tr>
	                   		</thead>
						</table>
					<hr class="text-secondary"> 
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 공정정보관리 - 설비정보 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공정정보관리(Sub)</li>
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
						<table id="prcssCodeAdmTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="24%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>공정코드</th>
									<th>공정명</th>
									<th>관리기준1(공실)</th>
									<th>관리기준2(설비)</th>
									<th>관리기준3(품질)</th>
									<th>주석(공정설명)</th>
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
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand"
						class="closebtn float-right" onclick="closerNav()"> <i
						class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="tab1Nav">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Nav">설비정보</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-danger float-right ml-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnAdd">등록</button>
							</div>
							<form id="form1" enctype="multipart/form-data">
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>*공정코드</th>
										<td><input type="text" class="form-control" id="prcssCd" name="prcssCd"></td>
										<th>*공정명</th>
										<td><input type="text" class="form-control" id="prcssNm" name="prcssNm"></td>
									</tr>
									<tr>
										<th>이니셜</th>
										<td><input type="text" class="form-control" id="prcssInitial" name="prcssInitial"></td>
										<th>공정구분</th>
										<td><select class="custom-select" id="prcssGubun"></select></td>
									</tr>
									<tr>
										<th>UPH</th>
										<td><input type="text" class="form-control" id="prcssUph" name="prcssUph"></td>
										<th>외주여부</th>
										<td><select class="custom-select" id="osrcYn"></select></td>
									</tr>
									<tr>
										<th>관리기준1(공실)</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="prcssStand1" name="prcssStand1" style="min-width : 100%">
										</td>
									</tr>
									<tr>
										<th>관리기준2(설비)</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="prcssStand2" name="prcssStand2" style="min-width : 100%">
										</td>
									</tr>
									<tr>
										<th>관리기준3(품질)</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="prcssStand3" name="prcssStand3" style="min-width : 100%">
										</td>
									</tr>
									<tr>
										<th>주석(공정설명)</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="prcssDesc" name="prcssDesc" style="min-width : 100%">
										</td>
									</tr>
								</table>
							</form>
							<table class="table table-bordered mt-5 d-none" id="changeHisTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>변경내역</th>
									<td colspan='3'>
										<input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20">
									</td>
								</tr>
							</table>
							<div class="mt-2">
								<button type="button" class="btn btn-primary float-right d-none"
									id="btnSave1">저장</button>
							</div>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnSave2">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnCodeDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnCodeEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnCodeAdd">추가</button>
							</div>
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="equipAdmInfo">
										<colgroup>
											<col width="7%">
											<col width="20%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr>
												<th>No</th>
												<th>*설비코드</th>
												<th>설비명</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->

					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
			<!--===========================================-->
			<!-- /.card -->
			<!--===========================================-->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">공정정보관리 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>자산코드</th>
								<th>자산구분</th>
								<th>매입가</th>
								<th>설비코드</th>
								<th>설비명</th>
								<th>공정명</th>
								<th>규격</th>
								<th>제작일자</th>
								<th>제조사</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작일자</th>
								<th>제조사</th>
								<th>소모품</th>
								<th>규격</th>
								<th>구입처</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

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

	let menuAuth = 'bmsc0040';
	let currentHref = "bmsc0040";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공정정보관리(Sub)"); 
	
	uiProc(true);
	const serverDate = "${serverDateTo}";
	let sideView = 'add';
	let btnView = '';
	let btnView2 = '';
	let prcssCd = null;
	let equipCd = null;
	let urlData = null;
	let itemSeq = null;
	
	//서버 시간 입력
	$('#mfcDate').val(serverDate);
	$('#ancDate').val(serverDate);
	
	//공통코드 처리 시작
	let prcssGubun = new Array();
	<c:forEach items = "${prcssGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcssGubun.push(json);
	</c:forEach>
	
	let osrcYn = new Array();
	<c:forEach items = "${osrcYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	osrcYn.push(json);
	</c:forEach>
	
	let useYn = new Array();
	<c:forEach items = "${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYn.push(json);
	</c:forEach>
	////공통코드 처리 끝

	//선택박스 처리
	selectBoxAppend(prcssGubun, "prcssGubun", "", "");
	selectBoxAppend(osrcYn, "osrcYn", "", "");

	//진행 확인 버튼 
	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnSave1').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});
	
	//메인 테이블
	let prcssCodeAdmTable = $('#prcssCodeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/prcssCodeAdmList"/>',
			type : 'GET',
			data : {
				'prcssType' : function(){ return '002'; },
				'mainGubun' : function(){ return $("#mainGubunBox").val(); },
			},
		},
		rowId : 'prcssCd',
		columns : [
			{//구분
				data : 'prcssGubunNm',
				'className' : 'text-center'
			},
			{//공정코드
				data : 'prcssCd',
				'className' : 'text-center'
			},
			{//공정명
				data : 'prcssNm',
				'className' : 'text-center'
			},
			{//관리기준1(공실)
				data : 'prcssStand1',
				'className' : 'text-center'
			},
			{//관리기준2(설비)
				data : 'prcssStand2',
				'className' : 'text-center'
			},
			{//관리기준3(품질)
				data : 'prcssStand3',
				'className' : 'text-center'
			},
			{//주석(공정설명)
				data : 'prcssDesc',
				'className' : 'text-center'
			} 
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '공정정보관리(Sub)',
		}, {
			extend : 'excel',
			title : '공정정보관리(Sub)',
		}, {
			extend : 'print',
			title : '공정정보관리(Sub)',
		}, ],
	});
	
	let html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="mainGubunBox" onChange="mainOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;'; 
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/equipBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html1 += '</div>';
	$('#prcssCodeAdmTable_length').html(html1);
	
	selectBoxAppend(prcssGubun, "mainGubunBox", "", "1");
	
	function mainOnchange(){
		$('#prcssCodeAdmTable').DataTable().ajax.reload();
	}

	//기본정보 상세정보 보기
	$('#prcssCodeAdmTable tbody').on('click', 'tr', function() {
		$('#tab1Nav').tab('show');
		if ($('#btnSave1').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#prcssCodeAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		prcssCd = prcssCodeAdmTable.row(this).data().prcssCd;
		
		$('#equipAdmInfo').DataTable().ajax.reload();	//설비정보 새로고침

		$.ajax({
			url : '<c:url value="bm/prcssCodeAdmRead"/>',
			type : 'GET',
			data : {
				'prcssCd' 	: function(){ return prcssCd; },
				'prcssType'	: function(){ return '002'; },
			},
			success : function(res) {
				let data = res.data;
				
				$('#prcssCd').val(data.prcssCd);
				$('#prcssNm').val(data.prcssNm);
				$('#prcssInitial').val(data.prcssInitial);
				$('#prcssUph').val(data.prcssUph);
				$('#prcssStand1').val(data.prcssStand1);
				$('#prcssStand2').val(data.prcssStand2);
				$('#prcssStand3').val(data.prcssStand3);
				$('#prcssDesc').val(data.prcssDesc);
				
				//선택박스 처리
				selectBoxAppend(prcssGubun, "prcssGubun", data.prcssGubun, "");
				selectBoxAppend(osrcYn, "osrcYn", data.osrcYn, "");

				sideView = 'edit';
				uiProc(true);
				$('#btnSave1').addClass('d-none'); // 저장버튼
				$('#btnAdd').attr('disabled', false); //생성버튼
				$('#btnEdit').attr('disabled', false); //수정버튼
				$('#btnDel').attr('disabled', false);
				$('#tab2Nav').removeClass('disabled');
			}
		});
		
	});
	
	// 기본정보 등록버튼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#prcssCodeAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		//초기화
		$('.form-control').val(null);
		uiProc(false);

		$('#btnSave1').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);

		$('#tab2Nav').addClass('disabled');

		//선택박스 처리
		selectBoxAppend(prcssGubun, "prcssGubun", "", "");
		selectBoxAppend(osrcYn, "osrcYn", "", "");

		$.ajax({
			url : '<c:url value="/bm/readEquipSeq"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					prcssCd = data;
				} else {
					toastr.error(res.message);
				}
			},
		}); 
	});

	// 기본정보 수정버튼
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);
		$('#prcssCd').attr('disabled', true);

		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#mfcDate').attr('disabled', true);
		$('#ancDate').attr('disabled', true);
		$('#tab2Nav').addClass('disabled');
		
		$('#btnSave1').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});
	
	//기본정보 삭제버튼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form1').each(function(){this.reset();});
		
		$.ajax({
			url : '<c:url value="bm/prcssAdmDelete"/>',
			type : 'POST',
			data :{
				'prcssCd' : function(){return prcssCd;},
				'prcssType' : function(){return '002';},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#prcssCodeAdmTable').DataTable().ajax.reload(function() {});
					
					$('#tab2Nav').addClass('disabled');
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//기본정보 저장
	$('#btnSave1').on('click', function() {
		
		if (!$.trim($('#prcssCd').val())) {
			toastr.warning('공정코드를 입력해 주세요.');
			$('#prcssCd').focus();
			return false;
		}
		
		var prcssCdCheck = false;
		
		if(sideView == 'add'){
			$.ajax({
				url : '<c:url value="bm/prcssCodeAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'prcssCd' : function() {return $('#prcssCd').val();},
					'prcssType' : function() {return '002';},
				},
				success : function(res) {
					let data = res.data;
					
					if(data != null){
						prcssCdCheck = true;
					}
				}
				
			});
		}
		
		if (prcssCdCheck) {
			toastr.warning('중복된 공정코드 입니다.');
			$('#prcssCd').val('');
			$('#prcssCd').focus();
			return false;
		}
		
		if (!$.trim($('#prcssNm').val())) {
			toastr.warning('공정명을 입력해 주세요.');
			$('#prcssNm').focus();
			return false;
		}
		
		if (sideView == "add") {
			url = '<c:url value="/bm/prcssCodeAdmCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bm/prcssCodeAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'prcssCd' : $('#prcssCd').val(),
				'prcssType' : '002',
				'lowerPrcssCd' : $('#prcssCd').val(),
				'prcssSeq' : '1',
				'prcssNm' : $('#prcssNm').val(),
				'prcssInitial' : $('#prcssInitial').val(),
				'prcssGubun' : $('#prcssGubun option:selected').val(),
				'prcssUph' : $('#prcssUph').val(),
				'osrcYn' : $('#osrcYn option:selected').val(),
				'prcssStand1' : $('#prcssStand1').val(),
				'prcssStand2' : $('#prcssStand2').val(),
				'prcssStand3' : $('#prcssStand3').val(),
				'prcssDesc' : $('#prcssDesc').val(),
// 				'ancDate' : $('#ancDate').val().replace(/-/g,''),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}

					$('#tab2Nav').removeClass('disabled');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				uiProc(true);
				$('#prcssCodeAdmTable').DataTable().ajax.reload();
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnDel').attr('disabled', false);
				$('#btnSave1').addClass('d-none');

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

	//설비정보 테이블
	let equipAdmInfo = $('#equipAdmInfo').DataTable({	
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '57vh',
		ajax : {
			url : '<c:url value="/bm/prcssEquipAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'prcssCd' : function(){ return prcssCd; },
			},
		},
		columns : [
			{//No
				render: function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1 ;
        		},
				'className' : 'text-center'
			},
			{//설비코드
				data : 'equipCd',
				render : function(data, type, row, meta) {
					if (data != null) {
						let html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" id="equipCd1" name="equipCd1">';
						html += '<input type="text" class="form-control" name="equipCd" value="'+data+'" disabled>';
						html += '<button type="button" name="btnAccCd" class="btn btn-primary input-sub-search" onClick="equipCdSelectInCorpCd()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					} else {
						let html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" id="equipCd1" name="equipCd1">';
						html += '<input type="text" class="form-control" name="equipCd" value="" disabled>';
						html += '<button type="button" name="btnAccCd" class="btn btn-primary input-sub-search" onClick="equipCdSelectInCorpCd()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				}
			},
			{//설비명
				data : 'equipNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="equipNm" value="'+data+'" disabled/>';
					} else {
						return '<input type="text" class="form-control" name="equipNm" value="" disabled/>';
					}
				}
			},
			{//비고
				data : 'prcssDesc',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="prcssEqDesc" value="'+data+'" disabled />';
					} else {
						return '<input type="text" class="form-control"  name="prcssEqDesc" value="" />';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '공정정보관리(Sub)',
		}, {
			extend : 'excel',
			title : '공정정보관리(Sub)',
		}, {
			extend : 'print',
			title : '공정정보관리(Sub)',
		}, ],
		drawCallback: function(settings) {
        }, 
	});
	
	//설비코드 팝업 시작
	let mainGubunVal = '001';
	let prcssEquipPopUpTable;
	function equipCdSelectInCorpCd() {
		if (prcssEquipPopUpTable == null || prcssEquipPopUpTable == 'undefined') {
			prcssEquipPopUpTable = $('#prcssEquipPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){ return mainGubunVal; },
					},
				},
				columns : [
					{
						data : 'equipNo',
						"className" : "text-center"
					},
					{
						data : 'equipNm',
						"className" : "text-center"
					}  
				],
				columnDefs : [],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
			
			let html2 = '';
			html2 += '<div class="row">&nbsp;&nbsp;';
			html2 += '<label class="input-label-sm">구분</label>';
			html2 += '<div class="form-group input-sub m-0">';
			html2 += '<select id="prcssGubunBox" class="select w80 col-12 custom-select">';
			html2 += '</select>';
			html2 += '</div>&nbsp;&nbsp;&nbsp;';
			html2 += '</div>';

			$('#prcssEquipPopUpTable_length').html(html2);
			selectBoxAppend(prcssGubun, "prcssGubunBox", "001", "");

			$('#prcssEquipPopUpTable tbody').on('click', 'tr', function() {
				let data = prcssEquipPopUpTable.row(this).data();
				//중복되는 설비코드 필터링
				let tempVal;
				for (var i = 0; i < equipAdmInfo.data().length; i++) {
					tempVal = $('input[name=equipCd]').eq(i).val();
					if ( tempVal != 'undefined' ) {
						if ( tempVal == data.equipNo ) {
							toastr.warning("중복된 설비코드가 있습니다.");
							return false;
						}
					} else {
						break;
					}
				}
				
				$('input[name=equipCd]').eq(tableIdx).val(data.equipNo);
				$('input[name=equipNm]').eq(tableIdx).val(data.equipNm);
				$('#prcssEquipPopUpModal').modal('hide');

			});
		} else {
			$('#prcssEquipPopUpTable').DataTable().ajax.reload();
		}
		$('#prcssEquipPopUpModal').modal('show');
	}
	
   	//설비코도조회 조건 변경 시
	$(document).on('change', '#prcssGubunBox', function () {
		mainGubunVal = $('#prcssGubunBox').val();
		
		$('#prcssEquipPopUpTable').DataTable().ajax.reload();
	});

	//설비정보 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#btnSave1').addClass('d-none');
		$('#btnSave2').addClass('d-none');
		
		$('#equipAdmInfo').DataTable().ajax.reload();
		uiProc2(true);
		
		setTimeout(function(){
			equipAdmInfo.draw();
			equipAdmInfo.draw();
		}, 300);
	});
	
	//설비정보 데이터 클릭 시
	$('#equipAdmInfo tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView2 = "";
			return false;
		} else {
			$('#equipAdmInfo').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#equipAdmInfo').DataTable().row(this).index();
		equipCd = equipAdmInfo.row(tableIdx).data().equipCd;
		
		console.log(tableIdx);
		btnView2 = "edit";
	});
	
	//설비정보 추가버튼
	$('#btnCodeAdd').on('click', function() {
		$('#equipAdmInfo').DataTable().row.add({}).draw(false);
		
		if (equipAdmInfo.data().count() > 0) {
			$('#btnSave2').removeClass('d-none'); // 등록버튼
		}
		btnView2 = '';
	});
	
	// 설비정보 수정버튼
	$('#btnCodeEdit').on('click', function() {
		if(btnView2 != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		console.log(tableIdx);
		$('input[name=prcssEqDesc]').eq(tableIdx).attr('disabled', false);
		$('button[name=btnAccCd]').eq(tableIdx).attr('disabled', false);
		btnView2 ='';
		$('#btnSave2').removeClass('d-none');
	});
	
	//설비정보 삭제버튼
	$('#btnCodeDel').on('click', function() {
		if (btnView2 != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		//설비정보 삭제
		$.ajax({
			url : '<c:url value="bm/prcssEquipDelete" />',
			type : 'POST',
			data  : {
				'prcssCd' : prcssCd,
				'equipCd' : equipCd,
			},
			success  : function(res){
				$('#equipAdmInfo').DataTable().rows(tableIdx).remove().draw();
				toastr.success("삭제되었습니다.");
			}
		})
		
		btnView2 = '';

	});

	//설비정보 저장
	$('#btnSave2').on('click',function() {
		let check = true;
		let dataArray = new Array();

		if (equipAdmInfo.data().count() > 0) {
			$('#equipAdmInfo tbody tr').each(function(index, item) {
				//입력값 검사
				if ($(this).find('td input[name=equipCd]').val() == "") {
					toastr.warning('설비코드를 입력해 주세요.');
					$(this).find('td input[name=equipCd]').focus();
					check = false;
					return false;
				}
				
				let rowData = new Object();
				rowData.prcssCd = prcssCd;
				rowData.equipCd = $(this).find('td input[name=equipCd]').val();
				rowData.prcssDesc = $(this).find('td input[name=prcssEqDesc]').val();
				rowData.useYn = '001';

				dataArray.push(rowData);
				console.log(rowData)
			});
		} else {
			toastr.warning('설비정보를 추가해 주세요.');
			$('#btnCodeAdd').focus();
			check = false;
			return false;
		}

		if (check) {
			$.ajax({
				url : '<c:url value="/bm/prcssCodeEqCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView2 == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						
						//새로고침
						$('#equipAdmInfo').DataTable().ajax.reload();
						//화면설정
						uiProc2(true);
						$('#btnSave2').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView2 = "";
				}
			});
		}
		
	});
	
	//기본정보 화면설정
	function uiProc(flag) {
		$("#prcssCd").attr("disabled", flag);
		$("#prcssNm").attr("disabled", flag);
		$("#prcssInitial").attr("disabled", flag);
		$("#prcssGubun").attr("disabled", flag);
		$("#prcssUph").attr("disabled", flag);
		$("#osrcYn").attr("disabled", flag);
		$("#prcssStand1").attr("disabled", flag);
		$("#prcssStand2").attr("disabled", flag);
		$("#prcssStand3").attr("disabled", flag);
		$("#prcssDesc").attr("disabled", flag);
	}

	//설비정보 화면설정
	function uiProc2(flag) {
		$('input[name=equipCd]').attr("disabled", flag);
		$('input[name=equipNm]').attr("disabled", flag);
		$('input[name=prcssEqDesc]').attr("disabled", flag);
		$('button[name=btnAccCd]').attr("disabled", flag);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : true,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/equipExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'assetCd'},
			{data : 'assetGubun'},
			{data : 'buyAmt'},
			{data : 'equipNo'},
			{data : 'equipNm'},
			{data : 'prcNm'},
			{data : 'equipType'},
			{data : 'mfcDate'},
			{data : 'mfcCorpCd'},
			{data : 'equipCond'},
			{data : 'upperAmt'},
			{data : 'lowerAmt'},
			{data : 'ancEquipNm'},
			{data : 'ancDate'},
			{data : 'ancCorpCd'}, 
			{data : 'expNm'}, 
			{data : 'ancEquipType'}, 
			{data : 'buyCorpNm'}, 
		],
		columnDefs: [
			{ targets: [12] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"targets": "_all" , "className": "text-center"},
        	
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);

		var str = $('#btnExcelUpload').val();

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/equipExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});
	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.assetCd= inTable.row(index).data().assetCd;
			rowData.assetGubun= inTable.row(index).data().assetGubun;
			rowData.buyAmt= inTable.row(index).data().buyAmt;
			
			rowData.equipNo= inTable.row(index).data().equipNo;
			rowData.equipNm= inTable.row(index).data().equipNm;
			rowData.prcNm= inTable.row(index).data().prcNm;
			rowData.equipType= inTable.row(index).data().equipType;
			rowData.mfcDate= inTable.row(index).data().mfcDate;
			rowData.mfcCorpCd= inTable.row(index).data().mfcCorpCd;
			
			rowData.equipCond= inTable.row(index).data().equipCond;
			rowData.upperAmt= inTable.row(index).data().upperAmt;
			rowData.lowerAmt= inTable.row(index).data().lowerAmt;
			
			rowData.ancEquipNm= inTable.row(index).data().ancEquipNm;
			rowData.ancDate= inTable.row(index).data().ancDate;
			rowData.ancCorpCd= inTable.row(index).data().ancCorpCd;
			rowData.expNm= inTable.row(index).data().expNm;
			rowData.ancEquipType= inTable.row(index).data().ancEquipType;
			rowData.buyCorpNm= inTable.row(index).data().buyCorpNm;
			
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/equipExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#prcssCodeAdmTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	//////////////////////////////////////////////////////////////////////////////////////////////

</script>
</body>
</html>
