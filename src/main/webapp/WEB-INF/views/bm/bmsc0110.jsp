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
				<li class="breadcrumb-item active">창고정보관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					
					</div>
					<div class="row">
<!-- 						<button type="button" class="btn btn-primary d-none" id="printBarcode">바코드출력</button> -->
						<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">
						<label for="locationAdmUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>
						<input type="file" id="locationAdmUpload" name="excelfile" style="display: none" />
						<a href="/bm/locationBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>
					</div>
					
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="locationAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>
										<input type="checkbox" class="checkbox" id="checkAll" style="width:20px; height:20px;">
									</th>
									<th>구분</th>
									<th>창고</th>
									<th>구역</th>
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
				style="width: 44%;">
				<div class="card mb-2" id="formBox">
					<div id="myTabContent" class="tab-content">
						<div class="card-body col-sm-12 p-1 mb-2">
							<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
							<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
							<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
						</div>
						<hr>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table class="table table-bordered">
			                    	<colgroup>
			                           <col width="20%"> 
			                           <col width="30%">
			                           <col width="20%">
			                           <col width="30%">
			                        </colgroup>
			                        <tr>   
			                           <th>구분</th>
			                           <td>
			                              	<select style="min-width : 100%" class="custom-select" id="mainGubun" name="mainGubun" disabled></select>
			                        	</td>
			                        	<th>창고</th>
										<td>
											<select style="min-width : 100%" class="custom-select" id="locCd" name="locCd" disabled></select>
										</td>
			                    	</tr>
			                    </table>
								<button type="button" class="btn btn-danger float-right mr-1 mb-2" id="btnArDel" disabled>위치삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1 mb-2" id="btnArAdd" disabled>위치추가</button>
								<table class="table table-bordered" id="locationDtlTable">
									<colgroup>
										<col width="15%">
										<col width="25%">
										<col width="25%">
										<col width="10%">
										<col width="25%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th class="text-center">구역</th>
											<th>위치</th>
											<th>위치코드</th>
											<th>사용여부</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
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
								<td colspan='3'><input type="text" class="form-control" style="max-width: 100%"
									id="changeHis" maxlength="20"></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
			<!-- 모달 영역 -->
			<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
				role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="inLabel">창고정보관리 엑셀조회</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" >
							<hr class="text-secondary">
							<div class="table-responsive">
							<table id="inTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>창고코드</th>
										<th>구분</th>
										<th>구역</th>
										<th>위치</th>
										<th>사용여부</th>
										<th>비고</th>
									</tr>
								</thead>
							</table>
							</div>
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
			<!-- 모달 영역 -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
</div>
<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "50%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "bmsc0110";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","창고정보관리"); 
	
	let sideView = 'add';
	let sideView2 = 'add';
	uiProc(true);

	var locNo=null;
	var index = 0;
	var tableIdx;
	var urlData=null;
	var tableAdmIdx = '';
	var mainGubunVal = '-';
	var locCdVal = ''; 
	var areaCdVal = '';


	var mainGubunData = '';
	var locCdData = '';
	var areaCdData = '';

	let printArray = new Array();

	//공통코드 처리 시작      
	var useYnCode = new Array(); // 사용여부
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	var locCdCode = new Array(); // 창고코드
	<c:forEach items="${locCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locCdCode.push(json);
	</c:forEach>

	var areaCode = new Array(); // 구역코드
	<c:forEach items="${area}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	areaCode.push(json);
	</c:forEach>
	
	var mainGubun = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubun.push(json);
	</c:forEach>
	//공통코드 처리 종료

	//선택박스 처리
	selectBoxAppend(locCdCode, "locCd", "", "2");
	selectBoxAppend(mainGubun, "mainGubun", "", "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnArAdd').attr('disabled', true);
		$('#btnArDel').attr('disabled', true);
		
		$('#locationDtlTable').DataTable().clear().draw();
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});


	// 목록
	let locationAdmTable = $('#locationAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		lengthChange : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		pageLength : 100000,
		scrollY: '65vh',
		ajax : {
			url : '<c:url value="bm/locationAdmList2"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return mainGubunVal;},
				'locCd' : function(){return locCdVal;},
				'areaCd' : function(){return areaCdVal;},
			},
		},
		rowId: 'locNo',
		columns : [ 
			{
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="checkbox" id="checkLal-'+meta.row+'" name="printList" value="" style="width:20px;height:20px;">';
				},
				'className' : 'text-center p-0'
			}, 
			{
				data : 'mainGubunNm' 
			}, 
			{
				data : 'locNm'
			}, 
			{
				data : 'areaNm'
			}, 
		],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '창고정보관리'
		}, 'print' ],
		columnDefs : [

		]
	});

	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<input type="number" class="form-control text-right" id="partPrintCnt" placeholder="매수" style="width:40px;" value="1">';
	html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-warning mr-2" id="printBarcode">라벨인쇄</button>';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="mainGubun2">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">창고</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="locCd2">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">구역</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select mr-1" id="areaCd2"style="width:70px;">';
	html1 += '</select></div>';
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;';
	html1 += '</div>';

	$('#locationAdmTable_length').html(html1);
	
	selectBoxAppend(mainGubun, "mainGubun2", "", "1");
	selectBoxAppend(locCdCode, "locCd2", "", "1");
	selectBoxAppend(areaCode, "areaCd2", "", "1");
	
	
	$('#btnRetv').on('click', function() {
		$("#mainGubun").val(mainGubunVal).prop("selected", true);
		$("#locCd").val(locCdVal).prop("checked", true);
		$("#areaCd").val(areaCdVal).prop("checked", true);
		
		mainGubunVal = $("#mainGubun2 option:selected").val();
		locCdVal = $("#locCd2 option:selected").val();
		areaCdVal = $("#areaCd2 option:selected").val();
		
		$('#locationAdmTable').DataTable().ajax.reload( function () {});
    });
	
	//전체조회 버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		mainGubunVal = "";
		locCdVal = "";
		areaCdVal = "";
		
		$('#locationAdmTable').DataTable().ajax.reload( function () {});  
	});
	
	//전체선택 체크
	$('#checkAll').change(function() {
		if($(this).is(':checked')) {
			$("input[name=printList]").prop("checked",true);
			printArray = [];
			$('input[name=printList]').each(function() {
				var obj = new Object();
		    	obj.locNo = $(this).parents().parents().attr('id');
		    	obj.floorNm = locationAdmTable.row($(this).parents().parents()).data().areaNm + '-' + locationAdmTable.row($(this).parents().parents()).data().floorNm;
	    		printArray.push(obj);
			});
		} else {
			$("input[name=printList]").prop("checked",false);
			printArray = [];
		}
	})
	
	//인쇄창고 체크
	$(document).on('change','input:checkbox[name=printList]',function() {
    	if($(this).is(':checked')) {
	    	var obj = new Object();
	    	obj.locNo = $(this).parents().parents().attr('id');
	    	obj.floorNm = locationAdmTable.row($(this).parents().parents()).data().areaNm + '-' + locationAdmTable.row($(this).parents().parents()).data().floorNm;
    		printArray.push(obj);
	    } else {
		    var locNo = $(this).parents().parents().attr('id');
		    if(printArray.findIndex(i => i.locNo == locNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.locNo == locNo),1);
			}
		}
   	});

	//메인 상세 보기
	$('#locationAdmTable tbody').on('click','tr',function() {
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right'|| $('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#locationAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		sideView2 = "";
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //삭제버튼

		tableAdmIdx = $('#locationAdmTable').DataTable().$('tr.selected').index();
		mainGubunData = locationAdmTable.row(tableAdmIdx).data().mainGubun;
		locCdData = locationAdmTable.row(tableAdmIdx).data().locCd;
		areaCdData = locationAdmTable.row(tableAdmIdx).data().areaCd;

		selectBoxAppend(locCdCode, "locCd", locCdData, "2");
		var tempMainGubun = locationAdmTable.row(this).data().mainGubun;
		selectBoxAppend(mainGubun, "mainGubun", tempMainGubun, "2");
		
		$('#locationDtlTable').DataTable().ajax.reload(function() {});
		
	});
	
	// 목록
	let locationDtlTable = $('#locationDtlTable').DataTable({
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
			url : '<c:url value="bm/locationAdmRead"/>',
			type : 'GET',
			data : {
				'mainGubun' : function() {return mainGubunData},
				'locCd' : function() {return locCdData},
				'areaCd' : function() {return areaCdData}
			},
		},
		columns : [
				{ data : 'areaCd',
					render : function(data, type, row, meta) {
						var html = "";
						html = selectBoxHtml2(areaCode,"areaCd", data, row, meta);
						return html;
					}
				},
				{
					data : 'floorNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style= "max-width:100%; text-align:center;" name="floorNm" id="floorNm'
									+ index
									+ '" value="'
									+ data + '"  disabled>';
						} else {
							return '<input type="text" class="form-control" style= "max-width:100%; text-align:center;" name="floorNm" id="floorNm'
									+ index + '" value="">';
						}

					}
				},
				{
					data : 'locNo',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style= "max-width:100%; text-align:center;" name="locNo" value="'+ data + '"  disabled>';
						} else {
							return '<input type="text" class="form-control" style= "max-width:100%; text-align:center;" name="locNo" value="" placeholder="자동생성"  disabled>';
						}
					}
				},
				{
					data : 'useYn',
					render : function(data, type, row, meta) {
						return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
					}
				},
				{
					data : 'locDesc',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<input type="text" class="form-control" style= "max-width:100%;" name="locDesc" id="locDesc'
									+ index
									+ '" value="'
									+ data + '"  disabled>';
						} else {
							var html = '<input type="text" class="form-control" style= "max-width:100%;" name="locDesc" id="locDesc'
									+ index + '" value="">';
						}
						index++;
						return html;
					}
				} ],
		order : [ [ 0, 'asc' ] ],
		columnDefs : [
		/*  { className: "text-left", targets: 2 },		 */
		],
	});
	

	//서브 상세 보기
	$('#locationDtlTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#locationDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#locationDtlTable').DataTable().row(this).index();
		sideView2 = "edit";
		$('#formBox').removeClass('d-none');
		$('#btnSave').attr('disabled', false); //수정버튼
	});

	
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#locationAdmTable').DataTable().$('tr.selected').removeClass('selected');
		$('#form').each(function() {
			this.reset();
		});

		$('#locationDtlTable').DataTable().clear().draw();
		//화면처리        
		uiProc(false);
		
		$('#btnCheck').attr("disabled", false);
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnArAdd').attr('disabled', false); 
		$('#btnArDel').attr('disabled', false); 
		$('#btnSave').removeClass('d-none');
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요!");
			return false;
		}
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		uiProc2(false);
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnArAdd').attr('disabled', true); 
		$('#btnArDel').attr('disabled', false); 
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});

	
	//추가폼
	$('#btnArAdd').on('click', function() {
		sideView2 = 'add';
		if (locationDtlTable.data().count() == 0) {
			$('#locationDtlTable tbody').empty();
		}
		$('#locationDtlTable').DataTable().row.add({}).draw(true);
		
		$('#btnSave').removeClass('d-none'); //저장

	});

	//수정폼
	$('#btnArEdit').on('click', function() {

		if (sideView2 != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('input[name=areaNm]').eq(tableIdx).attr('disabled', false);
		$('input[name=etc2]').eq(tableIdx).attr('disabled', false);
		$('input[name=baseInfoDesc]').eq(tableIdx).attr('disabled', false);
		$('select[name=area]').eq(tableIdx).attr('disabled', false);
		$('#btnSave').removeClass('d-none');
		sideView2 = '';
	});

	//삭제폼
	$('#btnArDel').on('click',function() {
		if (sideView2 != 'edit') {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		//DB삭제
		if(locationDtlTable.row(tableIdx).data().locNo!=""){
			$.ajax({
				url : '<c:url value="bm/locationAdmDelete"/>',
				type : 'POST',
				data :{
					'locNo' : function() {return locationDtlTable.row(tableIdx).data().locNo;}
				},
				success : function(res) {
					let data = res.result;
					if (res.result == 'ok') {
						toastr.success('삭제되었습니다.');
						$('#locationDtlTable').DataTable().rows(tableIdx).remove().draw(false);
					}else {
						toastr.error(res.message);
					}
				}
			});			
		}else{
			toastr.success('삭제되었습니다.');
			$('#locationDtlTable').DataTable().rows(tableIdx).remove().draw(false);
		}

		sideView2 = '';
	});


	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/locationExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				}
			},
			{data : 'locCd'},
			{data : 'areaCd'},
			{data : 'floorNm'},
			{data : 'useYn',
				render : function(data, type, row, meta){
					if(data!=null){
						console.log(data);
						return data;
					}else{
						console.log("001")
						return "001";
					}
				}
			}, 
			{data : 'locDesc'}
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
	});

	// 저장버튼 
	$('#btnSave').on('click',function() {
		var check = true;
		var dataArray = new Array();

		//입렵값 검사
		if ($('#mainGubun option:selected').val() == '' || $('#mainGubun option:selected').val() == undefined) {
			toastr.warning('구분을 선택해주세요.');
			$('#mainGubun').focus();
			return false;
		}
		
		if (!$.trim($('#locCd').val())) {
			toastr.warning('창고구분을 선택해주세요.');
			$('#locCd').focus();
			return false;
		}

		if(locationDtlTable.data().count() == 0) {
			toastr.warning('구역을 추가해주세요.');
			$('#btnArAdd').focus();
			return false;
		}
		
		$('#locationDtlTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=floorNm]').val() == "") {
				toastr.warning('저장위치를 입력해주세요.');
				$(this).find('td input[name=floorNm]').focus();
				check = false;
				return false;
			}
			
			var rowData = new Object();
			rowData.locCd = $('#locCd').val(); //창고코드
			rowData.mainGubun =  $('#mainGubun option:selected').val(); 
			rowData.locNo = $(this).find('td input[name=locNo]').val(); 
			rowData.areaCd =  $(this).find('td select[name=areaCd] option:selected').val(); 
			rowData.floorNm = $(this).find('td input[name=floorNm]').val();  
			rowData.locDesc = $(this).find('td input[name=locDesc]').val();
			rowData.useYn = $(this).find('td select[name=useYn] option:selected').val(); 

			dataArray.push(rowData);
		});
		
		

		if(sideView != "edit"){
			var url = '<c:url value="/bm/locationAdmCreate"/>'
		}else{
			url = '<c:url value="/bm/locationAdmUpdate"/>'
		}

		if (check) {
			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						sideView2 = "";
						uiProc(true);
						$('#btnArAdd').attr('disabled', true);
						$('#btnArDel').attr('disabled', true);
						$('#btnAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
						$('#btnDel').attr('disabled', false);
						$('#btnSave').addClass('d-none');
						
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
						
						selectBoxAppend(locCdCode, "locCd","", "2");
						selectBoxAppend(mainGubun, "mainGubun","", "2");
						
						if (sideView == 'add') {
							toastr.success('등록되었습니다.');
						} else {
							toastr.success('수정되었습니다.');
						}
						
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					sideView2 = "";
					$('#locationDtlTable').DataTable().clear().draw();
					$('#locationAdmTable').DataTable().ajax.reload();
				}
			});
		}
		
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
		}
		
	});




	//파일 선택
	$('#locationAdmUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);
	
		var str = $('#locationAdmUpload').val();
		index = 0;
	
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/locationAdmUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#locationAdmUpload').val("");
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});

		} else {
			toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});



	
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (sideView2 == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (sideView2 == "add" || sideView2 == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	function uiProc(flag) {
		$("#locCd").attr("disabled", flag);
		$("#mainGubun").attr("disabled", flag);
	}

	function uiProc2(flag) {
		$("select[name=areaCd]").attr("disabled", flag);
		$("input[name=floorNm]").attr("disabled", flag);
		$("input[name=locDesc]").attr("disabled", flag);
		$("select[name=useYn]").attr("disabled", flag);
	}

	let printCnt = 0;
	//바코드 출력 버튼 click
	$('#printBarcode').on('click',function() {
		printCnt = $('#partPrintCnt').val();
		if($('#partPrintCnt').val()=="" || $('#partPrintCnt').val()==0){
			toastr.warning("인쇄할 매수를 입력해주세요.");
			return false;
		}

		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		}

		$('input[name=printList]:checked').each(function() {
			
			var obj = new Object();
		    let idx  = $(this).attr("id").split('-');

		    obj.locNo = locationAdmTable.row(idx[1]).data().locNo; //창고코드
		    obj.locNm = locationAdmTable.row(idx[1]).data().locNm; //창고
		    obj.areaNm = locationAdmTable.row(idx[1]).data().areaNm; //구역
		    obj.floorNm = locationAdmTable.row(idx[1]).data().floorNm; //위치
		    for( let i = 1; i <= printCnt; i++){
				labelPrint(obj,"")
			}
		});
		/* if(printArray.length == 0) {
			toastr.warning('인쇄할 자재를 체크하고 인쇄해주세요.');
			return false;
		}

		var locNoArray = new Array();
		var floorNmArray = new Array();

		for(var i=0;i<printArray.length;i++) {
			if(printArray.length == i+1 || i%3 == 2) {
				locNoArray.push(printArray[i].locNo);
				floorNmArray.push(printArray[i].floorNm);
				labelPrint(locNoArray,floorNmArray);
				locNoArray = [];
				floorNmArray = [];
			} else {
				locNoArray.push(printArray[i].locNo);
				floorNmArray.push(printArray[i].floorNm);
			}
		} */
	});
	
</script>
<script>

//Do printing...
/* function labelPrint(locNo, floorNm) {

	var cmds =  "";
		cmds += "2";
		cmds += "34#$";
		cmds += "^XA";
		cmds += "^PRD";
		cmds += "^SEE:UHANGUL.DAT^FS";
		cmds += "^CW1,E:KFONT3.FNT^CI26^FS";
	for(var i=0;i<locNo.length;i++) {
		if(i==0) {
			cmds += "^FO177,35^A1N,30,30^FD"+floorNm[i]+"^FS";
			cmds += "^FO177,65^BQN,2,5^FD123"+locNo[i]+"^FS";
		} else if(i==1) {
			cmds += "^FO360,35^A1N,30,30^FD"+floorNm[i]+"^FS";
			cmds += "^FO360,65^BQN,2,5^FD123"+locNo[i]+"^FS";
		} else {
			cmds += "^FO545,35^A1N,30,30^FD"+floorNm[i]+"^FS";
			cmds += "^FO545,65^BQN,2,5^FD123"+locNo[i]+"^FS";
		}
	}
		cmds += "^XZ";
				
		sendMessage(cmds);
		console.log('라벨인쇄');
} */
	//도시바 프린터
	function labelPrint(data, action) {
		console.log("data:"+data.itemCd);
	   let cmds = {};
	   
	   let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	
	      //행
	      //cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      //cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	
	      //열
	      cmd += "{LC;0250,0035,0250,0320,0,5|}";
	      cmd += "{LC;0490,0185,0490,0320,0,5|}";
	      cmd += "{LC;0740,0185,0740,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0085,0125,0050,0050,01,0,00,B=창고|}";
	      cmd += "{PV23;0270,0125,0050,0050,01,0,00,B="+data.locNm+"|}";

	      cmd += "{PV23;0085,0265,0050,0050,01,0,00,B=구역|}";
	      cmd += "{PV23;0270,0265,0050,0050,01,0,00,B="+data.areaNm+"|}";
	      cmd += "{PV23;0565,0265,0050,0050,01,0,00,B=위치|}";
	      cmd += "{PV23;0760,0265,0050,0050,01,0,00,B="+data.floorNm+"|}";
	      
	     /*  cmd += "{PV23;0050,0230,0040,0040,01,0,00,B=위치|}";
	      cmd += "{PV23;0270,0230,0040,0040,01,0,00,B="+parseFloat(data.inWhsQty)+"|}";
	      cmd += "{PV23;0530,0230,0040,0040,01,0,00,B=추가될항목1|}";
	      cmd += "{PV23;0760,0230,0040,0040,01,0,00,B="+"|}";  //+moment(data.inWhsDate).format('YYYY-MM-DD')

		  cmd += "{PV23;0050,0300,0040,0040,01,0,00,B=추가될항목2|}";
	      cmd += "{PV23;0270,0300,0040,0040,01,0,00,B="+"|}"; //+data.location
	      cmd += "{PV23;0530,0300,0040,0040,01,0,00,B=추가될항목3|}";
	      cmd += "{PV23;0760,0300,0040,0040,01,0,00,B="+"|}";//+data.area+"/"+data.floor */

	      cmd += "{XB03;0250,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.locNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
</script>

<script>
		
	let webSocket = new WebSocket("ws://localhost:9998");
	
	// 웹소켓 연결
	function wsConnect() {
	   webSocket = new WebSocket("ws://localhost:9998");
	}
	
	// 웹소켓 상태확인
	function getWsStatus() {
	   return webSocket.readyState;
	}
	
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
	   toastr.success('인쇄 서버에 연결되었습니다.')
	   $('#wsStateView').text('연결됨');
	   $('#wsStateView').css('color','#19FF00');
	   wsState = true;
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
	   toastr.error('인쇄 서버가 종료되었습니다.')
	   $('#wsStateView').text('연결끊김');
	   $('#wsStateView').css('color','#FF0004');
	   wsState = false;
	};
	// 소켓 통신 중에 에러가 발생되면 호출되는 함수
	webSocket.onerror = function(message){
	   toastr.warning('현재 인쇄프로그램이 종료되어있습니다. 인쇄프로그램을 시작해주세요.')
	};
	// 소켓 서버로 부터 메시지가 오면 호출되는 함수.
	webSocket.onmessage = function(message){
	   // 출력 area에 메시지를 표시한다.
	   console.log(message);
	};
	// 서버로 메시지를 전송하는 함수
	function sendMessage(cmd){
	   if(webSocket.readyState == 1) {
	      webSocket.send(cmd);
	   } else {
	      toastr.error('인쇄 서버와의 연결을 확인해주세요.');
	   }
	}

	//모델창 적용버튼 클릭 시
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check2 = true;
		
		$('#inTable tbody tr').each(function(index, item){
			var rowData = new Object();
			//rowData.locNo =  locNo; //창고바코드번호
			rowData.locNo= inTable.row(index).data().locNo==null?"": inTable.row(index).data().locNo;
			rowData.locCd= inTable.row(index).data().locCd==null?"": inTable.row(index).data().locCd;
			rowData.areaCd= inTable.row(index).data().areaCd==null?"": inTable.row(index).data().areaCd;
			rowData.floorNm= inTable.row(index).data().floorNm==null?"": inTable.row(index).data().floorNm;
			rowData.locDesc= inTable.row(index).data().locDesc==null?"": inTable.row(index).data().locDesc;
			rowData.useYn= inTable.row(index).data().useYn==null?"": inTable.row(index).data().useYn;
			console.log(rowData);
	        dataArray.push(rowData);
		});
		
		if(check2 == true){
			$.ajax({
				url : '<c:url value="bm/locationExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {	
					console.log("res.data"+res.data);
					console.log("ok인가요?"+res.result);			
					if (res.result == 'ok') {
						$('#locationAdmTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						console.log("success나와주랑");
						toastr.success('저장되었습니다.');
					}else {
						toastr.error(res.message);
					}
	
					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	
</script>
   	

</body>
</html>