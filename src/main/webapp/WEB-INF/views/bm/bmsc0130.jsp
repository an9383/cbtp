<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!-- 공정정보관리(Master) - 기본정보 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="prcssCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssCodePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="prcssCodePopUpLabel">Sub공정코드조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="prcssCodePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 35%">Sub공정코드</th>
									<th style="width : 45%">Sub공정명</th>
									<th style="width : 20%">외주여부</th>
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
	<!-- 공정정보관리(Master) - 기본정보 모달 종료-->
	<!-- 작업자 등록 모달 시작 -->
	<div class="modal fade" id="userPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="layerPopUpLabel">작업자 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table class="table table-sm table-bordered" id="userPopUpTable" style="text-align: center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>아이디</th>
								<th>성명</th>
								<th>부서</th>
								<th>직위</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btnPopUpSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 작업자 등록 모달 끝 -->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공정정보관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
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
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 40%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()"> 
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						
						<li class="nav-item">
							<a class="nav-link active" id="tab1Nav" href="#tab1" data-toggle="tab">기본정보</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link disabled" id="tab2Nav" href="#tab2" data-toggle="tab">작업자 등록</a>
						</li>
						
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						
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
										<td><input type="text" class="form-control" id="prcssCd" name="prcssCd" maxlength="6" placeholder="숫자,영어 포함 최대 6자리"></td>
										<th>*공정명</th>
										<td><input type="text" class="form-control" id="prcssNm" name="prcssNm"></td>
									</tr>
									<tr>
										<th>공정구분</th>
										<td><select class="custom-select" id="prcssGubun"></select></td>
										<th>외주여부</th>
										<td><select class="custom-select" id="osrcYn"></select></td>
									</tr>
									<tr>
										<th>UPH</th>
										<td colspan="3"><input type="text" class="form-control" id="prcssUph" name="prcssUph" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>주석(공정설명)</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="prcssDesc" name="prcssDesc" style="min-width : 100%">
										</td>
									</tr>
								</table>
							</form>
							<button type="button" class="btn btn-danger float-right mr-1 mb-2" id="btnArDel" disabled>삭제</button>
							<button type="button" class="btn btn-primary float-right mr-1 mb-2" id="btnArAdd" disabled>추가</button>
							<table class="table table-bordered" id="prcssItemTable">
								<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>순번</th>
										<th>Sub공정코드</th>
										<th>Sub공정명</th>
										<th>외주여부</th>
									</tr>
								</thead> 
							</table>
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
										<input type="text" class="form-control" style="max-width: 100%"id="changeHis" maxlength="20">
									</td>
								</tr>
							</table>
							<div class="mt-2">
								<button type="button" class="btn btn-primary float-right d-none"
									id="btnSave1">저장</button>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-danger float-right ml-1" id="btnWorkerDel">삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnWorkerAdd">등록</button>
							</div>
							<table class="table table-bordered" id="prcssWorkerAdmTable">
								<colgroup>
									<col width="5%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>No.</th>
										<th>아이디</th>
										<th>성명</th>
										<th>부서</th>
										<th>직위</th>
										<th>비고</th>
									</tr>
								</thead> 
							</table>
						</div>
						
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

	let menuAuth = 'bmsc0130';
	let currentHref = "bmsc0130";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "공정정보관리"); 
	
	uiProc(true);
	
	const serverDate = "${serverDateTo}";
	let sideView = 'add';
	let btnView = '';
	let urlData = '';
	let prcssCdVal = '';
	let prcssTypeVal = '';
	let lowerPrcssCdVal = '';
	let prcssSeqVal = '0';
	let workerSeqVal = '';
	
	//공통코드 처리 시작
	var prcssGubun = new Array();
	<c:forEach items = "${prcssGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcssGubun.push(json);
	</c:forEach>
	
	var osrcYn = new Array();
	<c:forEach items = "${osrcYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	osrcYn.push(json);
	</c:forEach>
	
	var useYn = new Array();
	<c:forEach items = "${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYn.push(json);
	</c:forEach>

	var mainGubunList = new Array();
	<c:forEach items = "${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunList.push(json);
	</c:forEach>

	//공통코드 끝 

	//선택박스 처리
	selectBoxAppend(prcssGubun, "prcssGubun", "", "");
	selectBoxAppend(mainGubunList, "mainGubun", "", "");
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
		$('#btnArAdd').attr('disabled', true);
		$('#btnArDel').attr('disabled', true);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});

	//기본정보 목록
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
				'prcssType' : function(){ return '001'; },
				'mainGubun' : function(){ return $("#mainGubun option:selected").val(); },
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
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [
			{
				extend : 'copy',
				title : '공정정보관리',
			},
			{
				extend : 'excel',
				title : '공정정보관리',
			},
			{
				extend : 'print',
				title : '공정정보관리',
			}, 
		],
	});

	//기본정보 상세정보 보기
	$('#prcssCodeAdmTable tbody').on('click','tr',function() {

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

		prcssCdVal = prcssCodeAdmTable.row(this).data().prcssCd;
		prcssTypeVal = prcssCodeAdmTable.row(this).data().prcssType;
		lowerPrcssCdVal = prcssCodeAdmTable.row(this).data().lowerPrcssCd;
		prcssSeqVal = prcssCodeAdmTable.row(this).data().prcssSeq;
		
		$('#prcssItemTable').DataTable().ajax.reload(function(){
			$('button[name=btnSubCd]').attr("disabled", true);
		});	//기본정보-Sub 새로고침
		
		$.ajax({
			url : '<c:url value="bm/prcssCodeAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'prcssCd' 	: function(){ return prcssCdVal; },
				'prcssType' : function(){ return '001'; },
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

				//화면처리
				sideView = 'edit';
				uiProc(true);
				$('#btnSave1').addClass('d-none'); // 저장버튼
				$('#btnAdd').attr('disabled', false); //생성버튼
				$('#btnEdit').attr('disabled', false); //수정버튼
				$('#btnDel').attr('disabled', false);
			}
		});

		$('#tab2Nav').removeClass('disabled')
	});
	
	var tempSeq;
	//기본정보-Sub 목록
	let prcssItemTable = $('#prcssItemTable').DataTable({
		dom : '',
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/prcssCodeSubList"/>',
			type : 'GET',
			async : false,
			data : {
				'prcssCd' : function() {return prcssCdVal;}
			},
		},
		columns : [
				{
					render: function(data, type, row, meta) {	
						tempSeq = meta.row + meta.settings._iDisplayStart + 1
						return tempSeq;
		        		},
						'className' : 'text-center'
				},
				{
					data : 'lowerPrcssCd',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<div class="input-sub m-0" style="width: 100%;">';
							html += '<input type="hidden" class="form-control" id="subCdcd" name="subCdcd">';
							html += '<input type="text" class="form-control" id="subCd'+tempSeq+'" name="subCd" value="'+data+'" disabled>';
							html += '<button type="button" id="btnSubCd'+tempSeq+'" name="btnSubCd" class="btn btn-primary input-sub-search" onClick="subCdSelectInCorpCd()">';
							html += '<span class="oi oi-magnifying-glass"></span>';
							html += '</button>';
							html += '</div>';
							return html;
						} else {
							var html = '<div class="input-sub m-0" style="width: 100%;">';
							html += '<input type="hidden" class="form-control" id="subCdcd" name="subCdcd">';
							html += '<input type="text" class="form-control" id="subCd'+tempSeq+'" name="subCd" value="" disabled>';
							html += '<button type="button" id="btnSubCd'+tempSeq+'" name="btnSubCd" class="btn btn-primary input-sub-search" onClick="subCdSelectInCorpCd()">';
							html += '<span class="oi oi-magnifying-glass"></span>';
							html += '</button>';
							html += '</div>';
							return html;
						}
					}
				},
				{
					data : 'prcssNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="subNm" value="'+data+'" disabled/>';
						} else {
							return '<input type="text" class="form-control" name="subNm" value="" disabled/>';
						}
					}
				},
				{
					data : 'osrcYnNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="osrcYnNm" value="'+data+'" disabled/>';
						} else {
							return '<input type="text" class="form-control" name="osrcYnNm" value="" disabled/>';
						}
					}
				}
			],
		order : [ [ 0, 'asc' ] ],
		columnDefs : [
		/*  { className: "text-left", targets: 2 },		 */
		],
	});

	//기본정보-Sub 팝업 시작
	var prcssCodePopUpTable;
	function subCdSelectInCorpCd() {
		if (prcssCodePopUpTable == null || prcssCodePopUpTable == 'undefined') {
			prcssCodePopUpTable = $('#prcssCodePopUpTable')
					.DataTable(
							{	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
									url : '<c:url value="/bm/prcssCodeAdmList"/>',
									type : 'GET',
									data : {
										'prcssType' : function(){return '002';}
									},
								},
								columns : [ {
									data : 'prcssCd'
								}, {
									data : 'prcssNm'
								}, {
									data : 'osrcYnNm'
								}, ],
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all",
									"className" : "text-center"
								} ],
								order : [ [ 0, 'asc' ] ],
								buttons : [],
			});

			$('#prcssCodePopUpTable tbody').on('click', 'tr', function() {

				var data = prcssCodePopUpTable.row(this).data();
				
				//중복되는 공정코드 필터링
				var tempVal;
				for(var i = 0; i < 20; i++){
					tempVal = $('input[name=subCd]').eq(i).val();
					if(tempVal != 'undefined'){
						if(tempVal == data.prcssCd){
							toastr.warning("이미 추가한 공정코드가 있습니다.");
							return false;
						}
					}else{
						break;
					}
				}
				
				$('input[name=subCd]').eq(tableIdx).val(data.prcssCd);
				lowerPrcssCdVal = data.prcssCd;
				$('input[name=subNm]').eq(tableIdx).val(data.prcssNm);
				$('input[name=osrcYnNm]').eq(tableIdx).val(data.osrcYnNm);
// 				$('input[name=itemUnit]').eq(tableIdx).val(data.itemUnit);
				$('#prcssCodePopUpModal').modal('hide');

			});
		}
		$('#prcssCodePopUpModal').modal('show');
	}
	
	//설비코드 팝업 시작
	var prcssEquipPopUpTable;
	function equipCdSelectInCorpCd() {
		if (prcssEquipPopUpTable == null || prcssEquipPopUpTable == 'undefined') {
			prcssEquipPopUpTable = $('#prcssEquipPopUpTable')
					.DataTable(
							{	dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
									data : {},
								},
								columns : [ {
									data : 'equipNo'
								}, {
									data : 'equipNm'
								}  ],
								columnDefs : [ {
									"defaultContent" : "-",
									"targets" : "_all",
									"className" : "text-center"
								} ],
								order : [ [ 0, 'asc' ] ],
								buttons : [],
			});

			$('#prcssEquipPopUpTable tbody').on('click', 'tr', function() {

				var data = prcssEquipPopUpTable.row(this).data();
				
				//중복되는 설비코드 필터링
				var tempVal;
				for(var i = 0; i < 20; i++){
					tempVal = $('input[name=equipCd]').eq(i).val();
					if(tempVal != 'undefined'){
						if(tempVal == data.equipNo){
							toastr.error("중복되는 설비코드가 있습니다.");
							return false;
						}
					}else{
						break;
					}
				}
				
				$('input[name=equipCd]').eq(tableIdx).val(data.equipNo);
				$('input[name=equipNm]').eq(tableIdx).val(data.equipNm);
				$('#prcssEquipPopUpModal').modal('hide');

			});
		}
		$('#prcssEquipPopUpModal').modal('show');
	}

		
	//기본정보-Sub 데이터 클릭 시
	$('#prcssItemTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#prcssItemTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#prcssItemTable').DataTable().row(this).index();
		tableIdx++;
		lowerPrcssCdVal = $('#subCd'+tableIdx).val();
		tableIdx--;
		
		console.log(tableIdx);
		btnView = "edit";
	});


		var html1 = '<div class="row">';
		html1 += '<label class="input-label-sm">구분</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<select class="custom-select" id="mainGubun" onChange="mainOnchange()">';
		html1 += '</select></div>&nbsp;&nbsp;&nbsp;'; 
		html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
		html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
		html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
		html1 += '<a href="/bm/equipBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
		html1 += '</div>';
		$('#prcssCodeAdmTable_length').html(html1);
		
		selectBoxAppend(mainGubunList, "mainGubun", "", "1");


		function mainOnchange(){
			mainGubunList = $("#mainGubun option:selected").val();
			$("#mainGubun").val(mainGubunList).prop("selected", true);
			
			$('#prcssCodeAdmTable').DataTable().ajax.reload();
			
		}
		
	
	// 기본정보 등록버튼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		
		$('#prcssCodeAdmTable').DataTable().$('tr.selected').removeClass('selected');
		prcssCdVal = '';
		$('#prcssItemTable').DataTable().ajax.reload();
		//초기화
		$('.form-control').val(null);
		uiProc(false);

		$('#btnSave1').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnArAdd').attr('disabled', false);
		$('#btnArDel').attr('disabled', false);

		//선택박스 처리
		selectBoxAppend(prcssGubun, "prcssGubun", "", "");
		selectBoxAppend(osrcYn, "osrcYn", "", "");

// 		$.ajax({
// 			url : '<c:url value="/bm/readEquipSeq"/>',
// 			type : 'GET',
// 			data : {},
// 			success : function(res) {
// 				let data = res.data;
// 				if (res.result == 'ok') {
// 					prcssCdVal = data;
// 				} else {
// 					toastr.error(res.message);
// 				}
// 			},
// 		}); 
	});

	// 기본정보 수정버튼
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#prcssCd').attr('disabled', true);
		$('#btnArAdd').attr('disabled', false); 
		$('#btnArDel').attr('disabled', false);
		
		$('#btnSave1').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});

	//기본정보-Sub 추가버튼
	$('#btnArAdd').on('click', function() {
		$('#prcssItemTable').DataTable().row.add({}).draw(false);
		
		if (prcssItemTable.data().count() > 0) {
// 			$('#btnSave1').removeClass('d-none'); // 등록버튼
		}
		btnView = '';
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
				'prcssCd' 		: function(){ return prcssCdVal; },
				'prcssType' 	: function(){ return prcssTypeVal; },
				'lowerPrcssCd' 	: function(){ return lowerPrcssCdVal; },
				'prcssSeq' 		: function(){ return prcssSeqVal; },
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#prcssCodeAdmTable').DataTable().ajax.reload(function() {});
					$('#prcssItemTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//기본정보-Sub 삭제버튼
	$('#btnArDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		//기본정보-Sub 삭제
		$.ajax({
			url : '<c:url value="bm/prcssSubDelete" />',
			type : 'POST',
			data  : {
				'prcssCd' : function(){return prcssCdVal;},
				'prcssType' : function(){return '001';},
				'lowerPrcssCd' : function(){return lowerPrcssCdVal;},
			},
			success  : function(res){
				$('#prcssItemTable').DataTable().rows(tableIdx).remove().draw();
				toastr.success("삭제되었습니다.");
			}
		})
		
		btnView = '';

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
					'prcssType' : function() {return '001';},
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
		
		var subCheck = true;
		$('#prcssItemTable tbody tr').each(function(index, item) {
			if (prcssItemTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=subCd]').val()=="") {
					subCheck = false;
					return false;
				}
			}
		});
		
		if(subCheck == false){
			toastr.warning('Sub공정코드를 입력해 주세요.');
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
				'prcssType' : '001',
				'lowerPrcssCd' : $('#prcssCd').val(),
				'prcssSeq' : '1',
				'prcssNm' : $('#prcssNm').val(),
				//'prcssInitial' : $('#prcssInitial').val(),
				'prcssGubun' : $('#prcssGubun option:selected').val(),
				'prcssUph' : $('#prcssUph').val(),
				'osrcYn' : $('#osrcYn option:selected').val(),
				//'prcssStand1' : $('#prcssStand1').val(),
				//'prcssStand2' : $('#prcssStand2').val(),
				//'prcssStand3' : $('#prcssStand3').val(),
				'prcssDesc' : $('#prcssDesc').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					
					//기본정보-Sub 추가 등록
					var check = false;
					var dataArray = new Array();

					$('#prcssItemTable tbody tr').each(function(index, item) {

						if (prcssItemTable.data().count() != 0) {
							check = true;
							
							var rowData = new Object();
							rowData.prcssCd = $('#prcssCd').val();
							rowData.prcssType = '001';
							rowData.lowerPrcssCd = $(this).find('td input[name=subCd]').val();

							dataArray.push(rowData);
							console.log(rowData);
						}
						
					});
					
					var url = '<c:url value="/bm/prcssCodeSubCreate"/>';

					if (check) {
						$.ajax({
							url : url,
							type : 'POST',
							async : false,
							dataType : 'json',
							data : JSON.stringify(dataArray),
							contentType : "application/json; charset=UTF-8",
							success : function(res) {
								let data = res.data;
								if (res.result == 'ok') {
// 									toastr.success("추가되었습니다.");
									//새로고침
									$('#prcssItemTable').DataTable().ajax.reload(function(){
										$('button[name=btnSubCd]').attr("disabled", true);
									});
									//화면설정
									uiProc(true);
									$('#btnSave1').addClass('d-none');
								} else {
									toastr.error(res.message);
								}
							},
							complete : function() {
								btnView = "";
							}
						});
					}

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
				$('#btnArAdd').attr('disabled', true);
				$('#btnArDel').attr('disabled', true);
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
		$('button[name=btnSubCd]').attr("disabled", flag);
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
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnView == "") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnView == "edit") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
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
	
	//구입가격 계산
	$('#buyAmt').on('keyup',function(){
		var buyAmtValue = uncomma($(this).val());
		$('#buyAmt').val(addCommas(buyAmtValue));
	});
	
	//입고수량 숫자 및 영문만 입력하게 처리
	$(document).on('keyup',"#prcssCd", function(event){
		var preInWhsQtyData = $(this).val();
		if (!(
				(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || //숫자
				(event.which >= 97 && event.which <= 122) || (event.which >= 65 && event.which <= 90) || //영문
					(event.which >= 37 && event.which <= 40) || //화살표
						event.which == 8 || event.which == 9 || //backspace,tab
							event.which == 13 || event.which == 16 || event.which == 46) //shift,enter,delete
			) {
			toastr.warning('숫자 및 영문만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val($(this).val());
	});
	
	//작업자 등록 테이블 조회
	let prcssWorkerAdmTable = $('#prcssWorkerAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
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
		scrollY : '55vh',
		ajax : {
			url : '<c:url value="/bm/prcssWorkerAdmList"/>',
			type : 'GET',
			data : {
				'prcssCd' 		: function(){ return prcssCdVal; },
				'prcssType' 	: function(){ return prcssTypeVal; },
				'lowerPrcssCd' 	: function(){ return lowerPrcssCdVal; },
				'prcssSeq' 		: function(){ return prcssSeqVal; },
			},
		},
		columns : [
			{//No.
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{//아이디
				data : 'userId',
				'className' : 'text-center'
			},
			{//성명
				data : 'userNm',
				'className' : 'text-center'
			},
			{//부서
				data : 'departmentNm',
				'className' : 'text-center'
			},
			{//직위
				data : 'postNm',
				'className' : 'text-center'
			},
			{//비고
				data : 'userDesc',
				'className' : 'text-center'
			},
		],
		order : [
// 			[ 0, 'asc' ],
		],
		buttons : [
			{
				extend : 'copy',
				title : '공정정보관리',
			},
			{
				extend : 'excel',
				title : '공정정보관리',
			},
			{
				extend : 'print',
				title : '공정정보관리',
			}, 
		],
	});
	
	//작업자 등록 탭 클릭 시
	$('#tab2Nav').on('click', function(){
		$('#prcssWorkerAdmTable').DataTable().ajax.reload(function(){
			setTimeout(function(){
				prcssWorkerAdmTable.draw();
				prcssWorkerAdmTable.draw();
			}, 300);
		});
	});
	
	//작업자 등록 - 등록버튼 클릭 시
	$('#btnWorkerAdd').on('click', function(){
		$('#userPopUpModal').modal('show');
		$('#userPopUpTable').DataTable().ajax.reload(function(){}); 
	});
	
	//사용자 팝업테이블 목록조회
	let userPopUpTable = $('#userPopUpTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
       	pageLength: 15,
       	select: {
            style: 'multi',
            toggleable: true,
            items: 'row'
        },
		ajax : {
			url : '<c:url value="/sm/matrlUserDataList"/>',
			type : 'GET',
			data : {
				'empCd' : '001',
			},
		},
		rowId : 'matrlUser',
		columns : [
				{//No.
					render : function(data, type, row, meta) {
						return meta.row + meta.settings._iDisplayStart + 1;
					},
					'className' : 'text-center'
				},
				{//아이디
					data : 'userId',
					'className' : 'text-center'
				},
				{//성명
					data : 'userNm',
					'className' : 'text-center'
				},
				{//부서
					data : 'departmentNm',
					'className' : 'text-center'
				},
				{//직위
					data : 'postNm',
					'className' : 'text-center'
				},
				{//비고
					data : 'userDesc',
					'className' : 'text-center'
				},
			],
		columnDefs : [
			
		],
		order : [0, 'asc'],
       buttons: [],
	});
	
	//작업자 등록 저장버튼 클릭 시
	$('#btnPopUpSave').on('click', function(){
		let selectRow = userPopUpTable.rows('.selected').data().length;
		if (selectRow <= 0) {
			toastr.warning("저장할 목록을 선택해주세요.");
			return false;
		}

		let isCheck = true;
		for ( var i = 0; i < selectRow; i++ ) {
			$.ajax({
				url : '<c:url value="bm/prcssWorkerAdmList"/>',
				type : 'GET',
				dataType : 'json',
				async : false,
				data : {
					'prcssCd' 		: function(){ return prcssCdVal; },
					'prcssType' 	: function(){ return prcssTypeVal; },
					'lowerPrcssCd' 	: function(){ return lowerPrcssCdVal; },
					'prcssSeq' 		: function(){ return prcssSeqVal; },
				},
				success: function(res) {
					let list = res.data;
					list.forEach(function(array){
						if ( array.userNumber == userPopUpTable.rows('.selected').data()[i].userNumber ) {
							toastr.warning(array.userNm + '님은 이미 등록 되었습니다.');
							isCheck = false;
							return false;
						}
					});
				},
			});
			if (!isCheck) {
				return false;
			}
		}
		
		if (isCheck) {
			let dataArray = new Array();
			for ( var i = 0; i < selectRow; i++ ) {
				let rowData = new Object();

				rowData.prcssCd = prcssCdVal;
				rowData.prcssType = prcssTypeVal;
				rowData.lowerPrcssCd = lowerPrcssCdVal;
				rowData.prcssSeq = prcssSeqVal;
				rowData.userNumber = userPopUpTable.rows('.selected').data()[i].userNumber;

				dataArray.push(rowData);
			}
				
			$.ajax({//데이터 등록
				url : '<c:url value="bm/prcssWorkerCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success: function (res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('등록되었습니다.');
					} else {
						toastr.error(res.message);
					}
	            },
	            complete : function() {
	            	$('#prcssWorkerAdmTable').DataTable().ajax.reload();
	            	$('#userPopUpModal').modal('hide');
				}
			});
		}
		
	});
	
	//작업자 등록 테이블 클릭 시
	$('#prcssWorkerAdmTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#prcssWorkerAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		workerSeqVal = prcssWorkerAdmTable.row(this).data().workerSeq;
	});
	
	//작업자 등록 삭제버튼 클릭 시
	$('#btnWorkerDel').on('click', function(){
		if (!$('#prcssWorkerAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("삭제할 목록을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/prcssWorkerDelete"/>',
			type : 'POST',
			data : {
				'prcssCd' 		: function(){ return prcssCdVal; },
				'prcssType' 	: function(){ return prcssTypeVal; },
				'lowerPrcssCd' 	: function(){ return lowerPrcssCdVal; },
				'prcssSeq' 		: function(){ return prcssSeqVal; },
				'workerSeq' 	: function(){ return workerSeqVal; },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
	                toastr.success('삭제되었습니다.');
					$('#prcssWorkerAdmTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
		});
	});

</script>
</body>
</html>
