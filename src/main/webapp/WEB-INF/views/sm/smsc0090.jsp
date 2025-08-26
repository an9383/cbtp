<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>
<div class="page-wrapper" id="page-wrapper">
	<!-- 교정이력 모달 시작 -->
	<div class="modal fade bd-example-modal-lg" id="corrDataPopUpModal" tabindex="-1" role="dialog" aria-labelledby="corrDataPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content" style="width: 1500px; position: absolute; left: 50%; transform: translateX(-50%);">
	        	<div class="modal-header">
		           	<h5 class="modal-title" id="corrDataPopUpLabel">변경이력사항</h5>
		           	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            	<span aria-hidden="true">&times;</span>
		           	</button>
		        </div> 
		        <div class="modal-body">
		        	<button type="button" class="btn btn-danger float-right mb-2" id="btnDel">삭제</button>
		        	<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="btnEdit">수정</button>
		        	<div class="table-responsive">
		            	<table id="changeHisAdmTabTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
		                        	<th rowspan='2' style="width: 100px;">개정번호</th>
		                        	<th rowspan='2' style="width: 100px;">공정번호</th>
		                        	<th rowspan='2' style="width: 120px;">재 (개)정 일자</th>
		                        	<th rowspan='2' style="width: 120px;">고객 EO</th>
		                        	<th rowspan='2' style="width: 170px;">개정내용</th>
		                        	<th colspan='${changeAdmStdLength}'>변경관련표준</th>
		                        	<th rowspan='2' style="width: 150px;">비고</th>
		                        	<th rowspan='2' style="width: 150px;">관련자료</th>
								</tr>
								<tr>
		                        	<c:forEach items="${changeAdmStd}" var="info">
										<th>${info.baseNm}</th>
									</c:forEach>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="revisionNum" name="changeModalTd" maxlength="50" style="max-width : 100%;"></td>
									<td><input type="text" class="form-control" id="processNum" name="changeModalTd" maxlength="50" style="max-width : 100%;"></td>
									<td><input type="date" class="form-control" id="revisionDate" name="changeModalTd" style="max-width : 100%;"></td>
									<td><input type="text" class="form-control" id="customerEo" name="changeModalTd" maxlength="50" style="max-width : 100%;"></td>
									<td><input type="text" class="form-control" id="revisionDtl" name="changeModalTd" maxlength="50" style="max-width : 100%;"></td>
		                        	<c:forEach items="${changeAdmStd}" var="info">
										<td class="text-center"><span style="cursor: pointer;" id="${info.baseCd}" name="N" onClick="circleChange(${info.baseCd})">◎</span></td>
									</c:forEach>
									<td><input type="text" class="form-control" id="mstDesc" name="changeModalTd" maxlength="128" style="max-width : 100%;"></td>
									<td><input type="text" class="form-control" id="relatedData" name="changeModalTd" maxlength="50" style="max-width : 100%;"></td>
								</tr>
							</thead>
						</table>
					</div>
					<button type="button" class="btn btn-danger float-right mb-2" id="btnFileDel" disabled>첨부파일 삭제</button>
	        		<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="btnFileAdd" disabled>첨부파일 추가</button>
					<div class="table-responsive">
		            	<table class="table table-bordered" id="corrDataFileTable">
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
							<thead>
								<tr>
									<th>순번</th>
									<th>*첨부파일</th>
								</tr>
							</thead>
						</table>
					</div>
	         	</div>
	         	<div class="modal-footer">
		       		<button type="button" class="btn btn-primary float-right" id="btnSave">저장</button>
		           	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        	</div>
	    	</div>
		</div>
	</div>
	<!-- 교정이력 모달 종료 -->
	<!-- 삭제 모달 시작 -->
	<div class="modal modal-alert fade" id="deleteModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 40vw;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="exampleModalAlertWarningLabel" class="modal-title" style="font-size: 2vw;">
						<i class="fa fa-bullhorn text-warning mr-1"></i> 데이터 삭제
					</h5>
				</div>
				<div class="modal-body">
					<p style="font-size: 2vw;">삭제 시 첨부파일도 같이 삭제됩니다.<br>정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="btnDeleteConfirm" style="font-size: 1vw;">삭제</button>
					<button class="btn btn-danger d-none" id="btnDeleteConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
					&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 1vw;">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 모달 종료 -->
    <!--header ============================================================== -->
   	<header class="page-title-bar row">
    	<nav aria-label="breadcrumb" class="breadcrumb-padding">
           	<ol class="breadcrumb">
               	<li class="breadcrumb-item"><a href="#">품질관리</a></li>
               	<li class="breadcrumb-item active">변경이력관리(레이저)</li>
           	</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<div class="left-list left-sidebar" id="left-list" style="width: 25%;">
				<div class="card">
					<div class="table-responsive">
						<table id="itemPartAdmTable" class="table table-bordered">
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>품명</th>
									<th>품번</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div> <!-- /.left-list -->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 74%;">
				<div class="card">
					<div class="table-responsive">
						<table id="changeHisAdmTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
		                        	<th rowspan='2'>개정번호</th>
		                        	<th rowspan='2'>공정번호</th>
		                        	<th rowspan='2'>재 (개)정 일자</th>
		                        	<th rowspan='2'>고객 EO</th>
		                        	<th rowspan='2'>개정내용</th>
		                        	<th colspan='${changeAdmStdLength}'>변경관련표준</th>
		                        	<th rowspan='2'>비고</th>
		                        	<th rowspan='2'>관련자료</th>
								</tr>
								<tr>
		                        	<c:forEach items="${changeAdmStd}" var="info">
										<th>${info.baseNm}</th>
									</c:forEach>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div> <!-- /.left-list -->
		</div> <!-- /.row -->
	</div> <!-- / #main  -->
</div> <!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFF;
}
</style>
<script>
	$(document).attr("title", "변경이력관리(레이저)");
	let currentHref = "smsc0090";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');


	let preInWhsDateFromCal = "${serverDateFrom}";
	let preInWhsDateToCal = "${serverDateTo}";
	let preInWhsDateCal = "${serverDate}";	
	let matrlGubunCd = null;
	
	let startDate = moment(preInWhsDateFromCal).format('YYYY-MM-DD').replace(/-/g, "");
	let endDate = moment(preInWhsDateToCal).format('YYYY-MM-DD').replace(/-/g, "");
	let infinityCheck = false;
	
	let itemSeq = '';
	let mstIdx = '';
	let addGubun = 'add';
	let tableIdx = '';
	let onClickYn = true;
	let fileDeleteYn = false;
	let attachSeq = '';
	
	let changeAdmStdLength = "${changeAdmStdLength}";
	
	let changeAdmStdArray = new Array();
	<c:forEach items = "${changeAdmStd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	changeAdmStdArray.push(json);
	</c:forEach>
	
	let changeArr = [];
	<c:forEach items = "${changeAdmStd}" var="info">
	var json = "[" + "${info.baseCd}" + "]";
	changeArr.push(json);
	</c:forEach>
	
	//왼쪽 테이블 조회
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-4'><'col-sm-12 col-md-8'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		pageLength : 100000000,
		scrollY : '70vh',
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : function(){return '001';},
				'mainGubun' : '001'
			},
		},
		rowId : 'itemCd',
		columns : [
			{//품명
				data : 'itemNm',
				'className' : 'text-center'
			}, 
			{//품번
				data : 'itemCd',
				'className' : 'text-center'
			},
		],
		order : [],
		buttons : [],
	});
	
	//왼쪽 테이블 상세보기
	$('#itemPartAdmTable tbody').on('click','tr',function() {
		
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		itemSeq = itemPartAdmTable.row(this).data().itemSeq;
		$('#changeHisAdmTable').DataTable().ajax.reload();
		
		$('#btnAdd').attr('disabled', false);
	});
	
	//오른쪽 테이블
	let changeHisAdmTable = $('#changeHisAdmTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
	    language: lang_kor,
	    paging: true,
	    info: false,
	    searching: true,
	    ordering: true,
	    processing: false,
	    autoWidth: false,
	    lengthChange: true,
	    pageLength: 100000000,
	    scrollY : '63vh',
	    ajax : {
			url : '<c:url value="/sm/changeHisAdmList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return itemSeq;},
				'changeArr' : function(){return changeArr;},
				'startDate' : function(){return startDate;},
				'endDate' : function(){return endDate;},
			},
		},
		columns : [
  			{//개정번호
  				data: 'revisionNum',
				'className' : 'text-center'	
			},
  			{//공정번호
				data: 'processNum',
				'className' : 'text-center'	
			},
  			{//재 (개)정 일자
				data: 'revisionDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				},
				'className' : 'text-center'
			}, 
  			{//고객 EO
				data: 'customerEo',
				'className' : 'text-center'
			},
  			{//개정내용
				data: 'revisionDtl',
				'className' : 'text-center'
			},
			<c:forEach items="${changeAdmStd}" var="info" varStatus="status">//변경관리표준
				{
					data: 'vo${info.baseCd}',
					render: function(data, type, row, meta) {
						if (data == 'Y') {
							return '●';
						} else {
							return '◎';
						}
					},
					"className": "text-center" 	 	
				},
			</c:forEach>
  			{//비고
				data: 'mstDesc',
				'className' : 'text-center'
			},
  			{//관련자료
				data: 'relatedData',
				'className' : 'text-center'
			},
  		],
	    order: [ 
	    	[ 0, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs: [
// 			{ targets: [0,6], visible : false },
	    ],
	    drawCallback : function() {
// 	    	$("#changeHisAdmTable_filter").find("label").addClass("m-0");
        }
	
	});
	
	//오른쪽 테이블 html 추가
	let changeHisAdmHtml = '<div class="card-body p-0">';
	changeHisAdmHtml += '&nbsp;<label class="input-label-sm float-left">재 (개)정 일자</label><div class="form-group input-sub m-0 row float-left">';
	changeHisAdmHtml += '<input class="form-control" style="width:97px;" type="text" id="preStartWhsDate" name="preStartWhsDate" disabled/>';
	changeHisAdmHtml += '<button onclick="fnPopUpCalendar(preStartWhsDate,preStartWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preStartWhsDateCalendar" type="button">';
	changeHisAdmHtml += '<span class="oi oi-calendar"></span>';
	changeHisAdmHtml += '</button>';
	changeHisAdmHtml += '</div>';
	changeHisAdmHtml += '<label class="input-label-sm float-left">&nbsp;&nbsp;&nbsp;~</label><div class="form-group input-sub m-0 row float-left">';
	changeHisAdmHtml += '<input class="form-control" style="width:97px;" type="text" id="preLastWhsDate" name="preLastWhsDate" disabled/>';
	changeHisAdmHtml += '<button onclick="fnPopUpCalendar(preLastWhsDate,preLastWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preLastWhsDateCalendar" type="button">';
	changeHisAdmHtml += '<span class="oi oi-calendar"></span>';
	changeHisAdmHtml += '</button>';
	changeHisAdmHtml += '</div>';
	changeHisAdmHtml += '<button type="button" class="btn btn-primary float-left ml-2" id="btnRetv" onclick="retvOnClick()">조회</button>';
	changeHisAdmHtml += '<button type="button" class="btn btn-primary float-left ml-2" id="btnRetvAll" onclick="retvAllOnClick()">전체조회</button>';
	changeHisAdmHtml += '<button type="button" class="btn btn-primary float-right" id="btnAdd" onclick="changeHisAdmAdd()" disabled>추가</button>';
	changeHisAdmHtml += '</div>';
	
	$('#changeHisAdmTable_length').html(changeHisAdmHtml);
	
	$('#preStartWhsDate').val(moment(preInWhsDateFromCal).format('YYYY-MM-DD'));
	$('#preLastWhsDate').val(moment(preInWhsDateToCal).format('YYYY-MM-DD'));
	
	startDate = $('#preStartWhsDate').val().replace(/-/g, "");
	endDate = $('#preLastWhsDate').val().replace(/-/g, "");

	//조회 버튼
	function retvOnClick(){
		startDate = $('#preStartWhsDate').val().replace(/-/g, "");
		endDate = $('#preLastWhsDate').val().replace(/-/g, "");
		
		$('#changeHisAdmTable').DataTable().ajax.reload(function(){});
	}
	
	//전체조회 버튼
	function retvAllOnClick(){
		startDate = '';
		endDate = '';
		
		$('#changeHisAdmTable').DataTable().ajax.reload(function(){});
	}
	
	//추가 버튼
	function changeHisAdmAdd(){
		addGubun = 'add';
		fileDeleteYn = false;
		onClickYn = true; //onClick circleChange() 허용
		$('#btnEdit').addClass('d-none');
		$('#btnDel').addClass('d-none');
		$('#btnFileAdd').attr('disabled', false);
		$('#btnFileDel').attr('disabled', false);
		$('#btnSave').attr('disabled', false);
		$('input[name=changeModalTd]').attr('disabled', false);
		$('input[name=changeModalTd]').val('');
		$('span[name=Y]').text("◎");
		$('span[name=Y]').attr('name', 'N');
		
		$('#corrDataPopUpModal').modal('show');
		
		mstIdx = '';
		$('#corrDataFileTable').DataTable().ajax.reload();
		
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		}, 400);
		
	}
	////
	
	//오른쪽 테이블 상세보기
	$('#changeHisAdmTable tbody').on('click', 'tr', function() {
		
		mstIdx = changeHisAdmTable.row(this).data().mstIdx;
		tableIdx = $('#changeHisAdmTable').DataTable().row(this).index();
		
		$.ajax({
			url : '<c:url value="/sm/changeHisAdmRead"/>',
			type : 'GET',
			data : {
				'mstIdx' : function(){return mstIdx;},
				'changeArr' : function(){return changeArr;},
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {

					//상세보기
					$('#revisionNum').val(data.revisionNum);
					$('#processNum').val(data.processNum);
					$('#revisionDate').val(data.revisionDate != null && data.revisionDate != '' ? moment(data.revisionDate).format('YYYY-MM-DD') : '');
					$('#customerEo').val(data.customerEo);
					$('#revisionDtl').val(data.revisionDtl);
					$('#mstDesc').val(data.mstDesc);
					$('#relatedData').val(data.relatedData);
					
					changeAdmStdArray.forEach(function(info, index){
						if ($('#changeHisAdmTable tbody tr').eq(tableIdx).find('td').eq(5 + index).text() == '●') {
							$('#' + info.baseCd).text("●");
							$('#' + info.baseCd).attr('name', 'Y');
						} else {
							$('#' + info.baseCd).text("◎");
							$('#' + info.baseCd).attr('name', 'N');
						}
					});
					
					$('input[name=changeModalTd]').attr('disabled', true);
					onClickYn = false; //onClick circleChange() 막음
					$('#btnEdit').removeClass('d-none');
					$('#btnDel').removeClass('d-none');
					$('#btnFileAdd').attr('disabled', true);
					$('#btnFileDel').attr('disabled', true);
					$('#btnSave').attr('disabled', true);
					
					$('#corrDataPopUpModal').modal('show');
					
					$('#corrDataFileTable').DataTable().ajax.reload();
					
					setTimeout(function(){
						corrDataFileTable.draw();
						corrDataFileTable.draw();
					}, 400);

				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//변경관련표준 수정
	function circleChange(id){
		if (onClickYn) {
			id = ('000' + id).slice(-3);
			if ($('#' + id).attr('name') == 'N') {
				$('#' + id).text("●");
				$('#' + id).attr('name', 'Y');
			} else {
				$('#' + id).text("◎");
				$('#' + id).attr('name', 'N');
			}
		}
	}
	
	//변경이력사항 수정 버튼
	$('#btnEdit').on('click', function() {
		addGubun = 'edit';
		fileDeleteYn = false;

		$('#btnFileAdd').attr('disabled', false);
		$('#btnFileDel').attr('disabled', false);
		$('#btnSave').attr('disabled', false);
		
		onClickYn = true;
		$('input[name=changeModalTd]').attr('disabled', false);
	});
	
	//변경이력사항 삭제 버튼
	$('#btnDel').on('click', function() {
		$('#deleteModal').modal('show');
	});
	
	//변경이력사항 삭제 모달 - 삭제 버튼
	$('#btnDeleteConfirm').on('click', function() {
		
		$.ajax({
			url : '<c:url value="sm/changeHisAdmDelete"/>',
			type : 'POST',
			data : {
				'mstIdx' : function(){return mstIdx;},
				'attachGubun' : function(){return 'CA';},
				'attachCd' : function(){return mstIdx;},
			},
			success : function(res){
				if(res.result == "ok"){
					$('#deleteModal').modal('hide');
					$('#corrDataPopUpModal').modal('hide');
					$('#changeHisAdmTable').DataTable().ajax.reload(function(){});
					toastr.success("삭제되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//첨부파일 테이블
	let corrDataFileTable = $('#corrDataFileTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '40vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return mstIdx;},
				'attachGubun' : function(){return 'CA';},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					var tempNum = meta.row + meta.settings._iDisplayStart;
					if (data != null) {
						var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+mstIdx+'&attachGubun=CA">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCaNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCaNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		],
		order : [ [ 0, 'asc' ], ],
	});
	
	//첨부파일 추가 버튼
	$('#btnFileAdd').on('click', function() {
		$('#corrDataFileTable').DataTable().row.add({}).draw(false);
	});
	
	//첨부파일 테이블 행 선택
	$('#corrDataFileTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			
			fileDeleteYn = false;
		} else {
			$('#corrDataFileTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			
			tableIdx = $('#corrDataFileTable').DataTable().row(this).index();
			attachSeq = corrDataFileTable.row(tableIdx).data().attachSeq;
			fileDeleteYn = true;
		}
	});
	
	//첨부파일 삭제
	$('#btnFileDel').on('click', function() {
		
		if (fileDeleteYn) {
			if (attachSeq != undefined || attachSeq != null){
				//관련자료 삭제
				$.ajax({
					url : '<c:url value="bm/attachDataDelete" />',
					type : 'POST',
					data  : {
						'attachGubun' : function(){return 'CA';},
						'attachCd' : function(){return mstIdx;},
						'attachSeq' : function(){return attachSeq;},
					},
					success  : function(res){
						$('#corrDataFileTable').DataTable().ajax.reload();
						toastr.success("삭제되었습니다.");
					}
				})
			} else {
				$('#corrDataFileTable').DataTable().rows(tableIdx).remove().draw();
			}
		} else {
			toastr.warning('삭제할 첨부파일 항목을 선택해주세요.');
		}
		
		fileDeleteYn = false;

	});
	
	//변경이력사항 저장 버튼
	$('#btnSave').on('click', function() {
		
		if (!$.trim($('#revisionDate').val())) {
			toastr.warning('재 (개)정 일자를 입력해 주세요.');
			$('#revisionDate').focus();
			return false;
		}
		
		var fileCheck = false;
		$('#corrDataFileTable tbody tr').each(function(index, item) {//첨부파일 입력 여부 확인
			if ($(this).find("td input[name=fileNm]").val() == "") {
				toastr.warning('첨부파일을 입력해 주세요.');
				$(this).find("td input[name=fileNm]").focus();
				fileCheck = true;
				return false;
			}
		});
		if(fileCheck){
			return false;
		}
		
		//마스터 등록, 수정
		var url = '<c:url value="/sm/changeHisAdmCreate"/>';
		if (addGubun == 'edit') {
			url = '<c:url value="/sm/changeHisAdmUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'mstIdx' 		: 		mstIdx,
				'itemSeq' 		: 		itemSeq,
				'revisionNum' 	: 		$('#revisionNum').val(),
				'processNum' 	: 		$('#processNum').val(),
				'revisionDate' 	: 		$('#revisionDate').val().replace(/-/g, ''),
				'customerEo' 	: 		$('#customerEo').val(),
				'revisionDtl' 	: 		$('#revisionDtl').val(),
				'mstDesc' 		: 		$('#mstDesc').val(),
				'relatedData' 	: 		$('#relatedData').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if (addGubun == 'add'){
						mstIdx = res.mstIdx;
					}
					
				}else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
			}

		});
		
		//서브 등록, 수정
		changeAdmStdArray.forEach(function(info, index){
			var url = '<c:url value="/sm/changeHisAdmSubCreate"/>';
			if (addGubun == 'edit') {
				url = '<c:url value="/sm/changeHisAdmSubUpdate"/>';
			}
			
			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'mstIdx' 	: 		mstIdx,
					'baseCd' 	: 		info.baseCd,
					'subYn' 	: 		$('#' + info.baseCd).attr('name'),
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
	
			});
		});
		
		//첨부파일 등록
		$('#corrDataFileTable tbody tr').each(function(index, item) {
			//파일 저장 시간 가져오기
			var now = new Date();
			var year = now.getFullYear();
			var mon = now.getMonth() + 1;
			if (mon < 10) { mon = "0" + mon; }
			var fileDate = year + "" + mon;
			
			if($("#fileCaNm"+index).val() != null && $("#fileCaNm"+index).val() != 'undefined' && $("#fileCaNm"+index).val() != ''){
				
				var formData = new FormData(document.getElementById("formFile"+index));
				
				formData.append('attachGubun', 'CA');
				formData.append('attachCd', mstIdx);
				formData.append('attachSeq', '');
				formData.append('contents', '');
				formData.append('path', fileDate);
				formData.append('attachRegDate', '');
				
				$.ajax({
					url : '<c:url value="/bm/attachDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnFileAdd').attr('disabled', false);
						$('#btnFileDel').attr('disabled', false);
					}
				});
			}
			
		});
		
		$('#corrDataPopUpModal').modal('hide');
		$('#changeHisAdmTable').DataTable().ajax.reload(function(){});
		if (addGubun == 'add') {
			toastr.success('등록되었습니다.');
		} else {
			toastr.success('수정되었습니다.');
		}
		
	});
	
</script>
</body>
</html>
