<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>
<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
<!-- 프린트 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="printPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="margin-right: 40%;">
			<div class="modal-content" style="width: 150%;">
				<div class="modal-header">
					<h5 class="modal-title" id="printPopUpLabel">발주서 다운로드</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden = "true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<div class="table-responsive" style="height: 1500px;">
						<div id="printlModel">
							<table class="table table-bordered tabled-sm mb-5" style="margin-bottom: 0px;" id="titleTable">
								<colgroup>
									<col width="9%">
									<col width="19%">
									<col width="44%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
								</colgroup>
								<thead>
									<tr>
										<th>수신처</th>
										<td class="text-center">수신처입니다.</td>
										<td class="text-center" rowspan="5">~월 발주서</td>
										<th class="text-center">담당자</td>
										<th class="text-center" colspan="2">검토</td>
										<th class="text-center">승인</td>
									</tr>
									<tr>
										<th>발주처</th>
										<td class="text-center">발주처입니다.</td>
										<td rowspan="3"></td>
										<td rowspan="3"></td>
										<td rowspan="3"></td>
										<td rowspan="3"></td>
									</tr>
									<tr>
										<th>발주구분</th>
										<td class="text-center">발주구분입니다.</td>
									</tr>
									<tr>
										<th>발주일자</th>
										<td class="text-center">발주일자입니다.</td>
									</tr>
									<tr>
										<th>FAX</th>
										<td class="text-center">FAX입니다.</td>
										<td class="text-center">/</td>
										<td class="text-center">/</td>
										<td class="text-center">/</td>
										<td class="text-center">/</td>
									</tr>
								</thead>
							</table>
							
							<div id="printDiv1" class="mb-4" style="height: 800px;">
							
							</div>
							
							<table class="table table-bordered tabled-sm" style="margin-bottom: 0px;" id="endTable">
								<colgroup>
									<col width="40%">
									<col width="20%">
									<col width="40%">
								</colgroup>
								<thead>
									<tr>
										<td>1. 납품은 당사에서 지정한 납기일을 준수하여야 합니다.</td>
										<td rowspan="4" class="text-center"><img src="/resources/assets/images/logo/logo_Img_cbtp.png" style="width:130px; height:100px;"></td>
										<td>(363-883) 충북 청주시 청원구 오창읍 연구단지로 76</td>
									</tr>
									<tr>
										<td>2. 반드시 담당자 입회 하에 지정된 장소에 적재하여야 합니다. </td>
										<td>TEL 043-270-2832 </td>
									</tr>
									<tr>
										<td>3. 명세서 동봉하여 주시기 바랍니다.</td>
										<td>FAX 043-270-2339</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 프린트 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">발주현황(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 40%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="purchaseOrderList" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="23%">
								<col width="20%">
								<col width="22%">
								<col width="14%">
								<col width="14%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>발주번호</th>
									<th>납기일자</th>
									<th>공급사</th>
									<th>비고</th>
									<th>출력여부</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width: 59%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<!--하단 등록 부분 상단 버튼 영역-->
						<div class="card-body col-sm-12 p-2">
							<button type="button" class="btn btn-primary float-left mr-1" id="btnPrint" disabled>발주서 다운로드</button>
							<button type="button" class="btn btn-primary float-left mr-1" id="btnCancel" disabled>출력취소</button>
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table class="table table-sm table-bordered br-2" id="">
									<colgroup>
										<col width="10%">
										<col width="15%">
										<col width="10%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>발주번호</th>
											<td>
												<input type="text" class="form-control" id="poNo" name="poNo" style="max-width:100%; text-align:center;" disabled>
											</td>
											<th>발주자</th>
											<td>
												<input type="text" class="form-control" id="mainChargr" name="mainChargr"  style="max-width:100%;text-align:center;" disabled>
											</td>
										</tr>
										<tr>
											<th>수신처</th>
											<td>
												<input type="text" class="form-control" id="dealCorpNm" name="dealCorpNm" style="max-width:100%;text-align:center;" disabled>
											</td>
											<th>발주처</th>
											<td>
												<input type="text" class="form-control" id="poCompany" name="poCompany" value="충북테크노파크" style="max-width:100%;text-align:center;" disabled>
											</td>
										</tr>
										<tr>
											<th>발주일자</th>
											<td>
												<input type="text" class="form-control" id="poDate" name="poDate" style="max-width:100%;text-align:center;" disabled>
											</td>
											<th>발주구분</th>
											<td>
												<input type="text" class="form-control" id="receiptGubun" name="receiptGubun" style="max-width:100%;text-align:center;" disabled>
											</td>
											
										</tr>
										<tr>
											<th>FAX</th>
											<td>
												<input type="text" class="form-control" id="faxNo" name="faxNo" style="max-width:100%;text-align:center;" disabled>
											</td>
											<th>비고</th>
											<td>
												<input type="text" class="form-control" id="poDesc" name="poDesc" style="max-width: 100%" disabled>
											</td>
										</tr>
									</thead>
								</table>
								<!-- 납기일자 수정 기능 구현중 -->
								<div class="card-body col-sm-12 p-0">
									<button type="button" class="btn btn-warning float-left mr-1" id="btnEdit" disabled>수정</button>
									<button type="button" class="btn btn-danger float-left mr-1" id="btnDel" disabled>삭제</button>
									<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnSave">저장</button>
								</div>
								<table class="table table-sm table-bordered br-2" id="purchaseOrderVdTable">
									<colgroup>
										<col width="13%">
										<col width="18%">
										<col width="6%">
										<col width="9%">
										<col width="9%">
										<col width="9%">
										<col width="9%">
										<col width="9%">
										<col width="9%">
										<col width="9%">
									</colgroup>
									<thead>
										<tr>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th>포장수량 단위</th>
											<th>발주수량</th>
											<th>입고수량</th>
											<th>입고일자</th>
											<th>미입고수량</th>
											<th>납기일자</th>
											<th>변경납기일자</th>
										</tr>
									</thead>
								</table>
								<div class="d-none">
									<table class="table table-sm table-bordered br-2" id="purchaseOrderVdCloneTable">
										<colgroup>
											<col width="5%">
											<col width="29%">
											<col width="19%">
											<col width="15%">
											<col width="15%">
											<col width="17%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>품명</th>
												<th>단위</th>
												<th>포장수량 단위</th>
												<th>주 발주수량 확인</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>

$("#left-width-btn2").click(function() {
	{
		$("#left-list").animate({
			width : "49%"
		}, 200);
		$("#arrow-left").animate({
			display : "none"
		}, 200);
		setTimeout(function() {	
			$("#btnRetv").click();
		},400);
	}
// 	state = !state;
});

$("#left-expand").click(function() {
	setTimeout(function() {	
		$("#btnRetv").click();
	},400);
})

	let currentHref = "iosc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","발주현황(레이저)"); 
	let viewIdx;
	let sideView = '';
	
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	
	var siddeView = '';
	var cuSum = 0;
	var cuSum2 = 0;
	var index;
	var tableIdx='';
	
	var i = 0;
	let itemPrintArray = new Array();
	
	// 값 저장 처리
	var poNo = 'poNo';
	var documentSubmitted = '';
	var paymentWay = '';
	var deliveryPlace = '';
	var poRegChargrNm = '';
	var telNo = '';
	var dealCorpNm = '';
	let dlvDate = '';
	
	var runDate = '';
	var cooperationDepartment = '';
	var reception = '';
	var reference = '';
	var designation = '';
	var purchaseHistory = '';
	var title = '';
	var itemCd = '';
	var faxNo = '';
	var officeCharger = '';

	let partPrintArray = new Array();
	let printArray = new Array();
	var array = new Array();
    
    $("#editWindowTable input[type=checkbox]").attr('disabled', true);
    $("#editWindowTable input[type=radio]").attr('disabled', true);

	//발주서 출력 목록 조회
	let purchaseOrderList = $('#purchaseOrderList').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollY: '70vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="io/purchaseOrderPrintList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() {return serverDateTo.replace(/-/g, '');},
				'gubun' : '001'
			},
		},
		rowId : 'poNo',
		columns : [
			{//No.
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				},
				'className' : 'text-center'
			},
			{//발주번호
				data : 'poNo'			
			},
			{//납기일자
				data : 'dlvDate',
				render : function(data, type, row, meta) {
					if (data != null && data != ''){
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				}
			},
			{//공급사
				data : 'dealCorpNm'	
			},
			{//비고
				data : 'poDesc'		
			},
			{//출력여부
				name: '출력여부',
            	render: function(data, type, row) {
            		var rtn4='';
	            	if(row['printWhether'] == '' || row['printWhether'] == null){
	            		rtn=('<span class="text-black" style="background-color: rgb(255, 204, 204);">미출력</span>');
	            	}else if(row['printWhether'] == 'N'){
	            		rtn=('<span class="text-black" style="background-color: rgb(255, 204, 204);">미출력</span>');
	            	}else if(row['printWhether'] == 'Y'){
	            		rtn=('출력');
	            	}
            		return rtn;
            	}
            },
		],
		columnDefs : [ {
// 			targets : [ 10, 11, 12, 13, 14 ],
// 			render : $.fn.dataTable.render.number(','),
// 			className : 'text-right'
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback: function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {
				printArray.push(api.row(i).data());
			}
		}
	});

	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">발주일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>'
	html1 += '<button type="button" class="btn btn-primary" id="btnAllList">전체조회</button>'
	html1 += '</div>';

	$('#purchaseOrderList_length').html(html1);
	$('#preInWhsDateFrom').val(moment(serverDateFrom).format('YYYY-MM-DD'));
	$('#preInWhsDateTo').val(moment(serverDateTo).format('YYYY-MM-DD'));

	//조회버튼 클릭
	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		$('#purchaseOrderList').DataTable().ajax.reload(function() {});
	});

	//전체조회버튼 클릭
	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		$('#purchaseOrderList').DataTable().ajax.reload(function() {});
    });

	
	//발주현황 목록 클릭 시
	$('#purchaseOrderList tbody').on('click','tr',function() {
		sideView = "";
		
		if ($(this).hasClass('selected')) {
		} else {
			$('#purchaseOrderList').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#purchaseOrderList').DataTable().row(this).index();

		poNo = purchaseOrderList.row(this).data().poNo;
		poDate = purchaseOrderList.row(this).data().poDate;
		poDesc = purchaseOrderList.row(this).data().poDesc;
		mainChargrNm = purchaseOrderList.row(this).data().mainChargrNm;				//담당자
		dealCorpNm = purchaseOrderList.row(this).data().dealCorpNm;					//거래처
		receiptGubun = purchaseOrderList.row(this).data().receiptGubun;				//발주구분
		faxNo = purchaseOrderList.row(this).data().faxNo;							//팩스 번호
		dlvDate = purchaseOrderList.row(this).data().dlvDate;

		$('#poNo').val(poNo);										//발주번호
		$('#dealCorpNm').val(dealCorpNm);							//수신처
		$('#mainChargr').val(mainChargrNm);							//발주자
		$('#poDate').val(moment(poDate).format('YYYY-MM-DD'));		//발주일
		$('#receiptGubun').val(receiptGubun);						//발주구분
		$('#faxNo').val(faxNo);										//FAX
		$('#poDesc').val(poDesc);									//비고
		
		$('#btnSave').addClass('d-none'); // 저장버튼
		
		$('#purchaseOrderVdTable').DataTable().ajax.reload();
		$('#purchaseOrderVdCloneTable').DataTable().ajax.reload();//발주서 ReadTable
		
		$('#btnPrint').attr('disabled', false);
		$('#btnCancel').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
	});


	//변경납기일 click
    function dlvChange(poNo, poSeq, index){
		
        $.ajax({
			url : '<c:url value="io/purchaseOrderDtlUpdate" />',
		 	type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'dlvChangeDate' : $('#dlvChangeDate_'+index).val().replace(/-/g,'')
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("변경납기일 수정되었습니다.");
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
				}else{
					toastr.error(res.message);
				}
			}
        });
    };

	
	//발주서 다운로드 ReadTable
	let purchaseOrderVdCloneTable = $('#purchaseOrderVdCloneTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 2000,
		ajax : {
			url : '<c:url value="io/purchaseOrderStatusList"/>',
			type : 'GET',
			data : {
				'poNo' : function(){return poNo;},
				'gubun' : '001',
			},
		},
		rowId : 'poNo',
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}
			},
			{ 
				data : 'itemNm' 
			}, 
			{ 
				data : 'itemUnitNm' 
			}, 
			{ 
				data : 'boxCount',
				render : function(data, type, row, meta){
					return rmDecimal(data);
				},
				className : 'text-right'
			}, 
			{
				data : 'ordQty',
				render : function(data, type, row, meta){
					return rmDecimal(data);
					/* if(row['inWhsDate']==null){
						return '<input type="text" class="form-control" id="ordQty_'+meta.row+'" name="ordQty" value="'+rmDecimal(data)+'" onchange="ordQtyChange(\''+row['poNo']+'\',\''+row['poSeq']+'\','+meta.row+')" style="text-align:right" />';
					}else{
						return data;
					} */
				},
				className : 'text-right'
			},
			{ 
				render : function(data, type, row, meta){
					return '<span name="tempDesc"></span>';
				}
			}, 
		],
		columnDefs : [ 
			{"targets": "_all",	"className": "text-center"}, // 빈칸은 "-"로 표시
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
// 		drawCallback : function() {
// 			for(var i = 0; i < $('#purchaseOrderVdCloneTable tbody tr').length; i++){
// 				$("#purchaseOrderVdCloneTable tbody tr").eq(i).find('td').eq(8).css("background", "#FCE4D6");
// 			}
// 		}
	});
	
  /*   function ordQtyChange(poNo, poSeq, index){
        $.ajax({
			url : '<c:url value="io/purchaseOrderDtlUpdate" />',
		 	type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'ordQty' : $('#ordQty_'+index).val().replace(/,/g,'')
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("발주수량이 수정되었습니다.");
					$('#purchaseOrderVdTable').DataTable().ajax.reload(null, false);
				}else{
					toastr.error(res.message);
				}
			}
        });
    }; */

	
	
	//출력취소버튼 클릭 시
	$('#btnCancel').on('click', function(){
		
		$.ajax({
			url : '<c:url value="io/purchaseOrderPrintWhetherUpdate" />',
		 	type : 'POST',
		 	async : false,
			data : {
				'poNo' : function(){return poNo;},
				'dlvDate' : function(){return dlvDate;},
				'printWhether' : 'N',
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("출력이 취소되었습니다.");
					$('#purchaseOrderList').DataTable().ajax.reload(null, false);
				}else{
					toastr.error(res.message);
				}
			}
        });
		
		//출력취소 v1
// 		if($('input:checkbox[name=partCheckbox]:checked').is(':checked') == false){
// 			toastr.warning("발주서 출력할 항목을 선택해주세요.");
// 			return false;		
// 		}		

// 		for(var i=0; i<$('input:checkbox[name=partCheckbox]:checked').length; i++) {
// 			if(array[i].printWhether == null){
// 				console.log(array[i].printWhether)
// 				toastr.warning("발주서 출력할 항목의 값을 입력해주세요.");
// 	 			return false;
// 			}
// 		}

// 		var data = JSON.stringify(array);
		 
// 		$.ajax({
// 			url : url3,
// 			type : 'POST',
// 			data : {
// 				'arrayData' : 	function(){return data;}
// 			},
// 			success: function (res) {
// 				let data = res.data;

// 				if (res.result == 'ok') {
					
// 					toastr.success('취소 되었습니다.');
// 					$('#purchaseOrderList').DataTable().ajax.reload(function() {$('#purchaseOrderList tbody tr').eq(tableIdx).addClass('selected');});

// 					array = new Array();
// 					$("#AAA").empty();
// 				} else {
// 					toastr.error(res.message);
// 				}
//             },
// 		});
	});


  	//발주서 다운로드 버튼 click
	$('#btnPrint').on('click',function() {
		tableAppend();
		$('#printPopUpModal').modal('show');
		$('#printlModel').print();
		
		$.ajax({
			url : '<c:url value="io/purchaseOrderPrintWhetherUpdate" />',
		 	type : 'POST',
		 	async : false,
			data : {
				'poNo' : function(){return poNo;},
				'dlvDate' : function(){return dlvDate;},
				'printWhether' : 'Y',
			},
			success : function(res){
				if(res.result == "ok"){
					$('#purchaseOrderList').DataTable().ajax.reload(null, false);
				}else{
					toastr.error(res.message);
				}
			}
        });
	});

	function tableAppend(){
		//1.인원현황
		$("#printDiv1").empty();
		$("#purchaseOrderVdCloneTable").clone().appendTo($("#printDiv1")).after($("#printDiv1").find('table').attr('id', 'printTable1'));

		tableCss();		
		
		$('#titleTable thead tr').eq(0).find('td').eq(0).text($('#dealCorpNm').val());
		$('#titleTable thead tr').eq(1).find('td').eq(0).text($('#poCompany').val());
		$('#titleTable thead tr').eq(2).find('td').eq(0).text($('#receiptGubun').val());
		$('#titleTable thead tr').eq(3).find('td').eq(0).text($('#poDate').val());
		$('#titleTable thead tr').eq(4).find('td').eq(0).text($('#faxNo').val());
		var tempPoDate = $('#poDate').val().substr(5,2);
		if(tempPoDate < 10){
			tempPoDate = tempPoDate.substr(1,2);
		}
		$('#titleTable thead tr').eq(0).find('td').eq(1).text(tempPoDate + "월 발주서");
		$('span[name=tempDesc]').text($('#poDesc').val());
	}

	//print_css
	function tableCss(){

// 		InputDayLabel(prodDate);
		
		//공통 css 적용
		$("#printlModel").find('table thead tr').css('border','1px solid black !important;');
		$("#printlModel").find('table thead tr').find('th').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');
		$("#printlModel").find('table thead tr').find('td').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');

		$("#printlModel").find('table tbody tr').find('th').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');
		$("#printlModel").find('table tbody tr').find('td').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');

		$("#printlModel").find('table tfoot tr').find('th').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');
		$("#printlModel").find('table tfoot tr').find('td').attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important;');

		
		//전체 css 적용
		$("#printlModel").find('table thead tr').find('th').css('font-size','15px');
		$("#printlModel").find('table thead tr').find('td').css('font-size','15px');

		$("#printlModel").find('table tbody tr').find('th').css('font-size','15px');
		$("#printlModel").find('table tbody tr').find('td').css('font-size','15px');

		$("#printlModel").find('table tfoot tr').find('th').css('font-size','15px');
		$("#printlModel").find('table tfoot tr').find('td').css('font-size','15px');
		

		//2.생산가동률
// 		$('#printTable2 thead tr').eq(9).attr('style',"border-top: 4px double #000;");
// 		for(var i=0; i<$('#printTable2 thead tr').length; i++){
// 			$('#printTable2 thead tr').eq(i).find('td').eq(3).attr('style', 'padding: 0.1rem;border: 1px solid black !important;color: black !important;font-weight: 300 !important;text-align: center !important;font-size: 10px !important;');
// 		    if(i>8){
// 		    	$('#printTable2 thead tr').eq(i).find('td').eq(1).attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 400 !important; text-align: center !important; font-size: 15px;');
// 		    	$('#printTable2 thead tr').eq(i).find('td').eq(2).attr('style', 'padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 400 !important; text-align: center !important; font-size: 15px;');
// 			}
// 		}

		//상단부분
		$('#titleTable thead tr').find('td').attr('style', 'border: 1px solid black !important; font-size: 12px;');
		$('#titleTable thead tr').eq(0).find('td').eq(1).attr('style', 'font-size: 50px; border-top-width: 1px; border-top-color: white; border-bottom-width: 1px; border-bottom-color: white; border-right-width: 1px; border-right-color: black; border-left-width: 1px; border-left-color: black;');
// 		$('#titleTable thead tr').eq(0).find('td').eq(1).text('');
// 		$('#titleTable thead tr').eq(0).find('td').eq(1).attr('style', 'border: 1px solid black !important;width: 24% !important; text-align: center !important;')
		
// 		$('#titleTable thead tr').eq(0).find('td').eq(1).attr('style', 'word-spacing: 6px; padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 500 !important; text-align: center !important; width: 50%; height: 50%; font-size: 50px;');
// 		$('#titleTable thead tr').eq(2).find('td').eq(0).attr('style', 'height: 40px; font-size:18px; padding: 0.1rem; border: 1px solid black !important; color: black !important; font-weight: 300 !important; text-align: center !important;');

// 		$('#titleTable thead tr').eq(0).find('td').eq(2).attr('style', 'border: 1px solid black !important;width: 24% !important;')
		
		//하단부분
		$('#endTable thead tr').find('td').attr('style','font-size: 15px; border: 1px solid white');
	
	}
	
	let purchaseOrderVdTable = $('#purchaseOrderVdTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-9'i><'col-sm-12 col-md-3'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : '50vh',
		ajax : {
			url : '<c:url value="io/purchaseOrderStatusList"/>',
			type : 'GET',
			async : false,
			data : {
				'poNo' : function(){return poNo;},
				'dlvDate' : function(){return dlvDate;},
				'gubun' : '001',
			},
		},
		rowId : 'poNo',
		columns : [
			{
				data : 'itemCd' 
			}, 
			{ 
				data : 'itemNm' 
			}, 
			{ 
				data : 'itemUnitNm' 
			}, 
			{ 
				data : 'boxCount',
				render : function(data, type, row, meta){
					return rmDecimal(data);
				},
				className : 'text-right'
			}, 
			{
				data : 'ordQty',
				render : function(data, type, row, meta){
					return rmDecimal(data);
					/* if(row['inWhsDate']==null){
						return '<input type="text" class="form-control" id="ordQty_'+meta.row+'" name="ordQty" value="'+rmDecimal(data)+'" onchange="ordQtyChange(\''+row['poNo']+'\',\''+row['poSeq']+'\','+meta.row+')" style="text-align:right" />';
					}else{
						return data;
					} */
				},
				className : 'text-right'
			},
			{
				data : 'inWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			}, 
			{   
				data : 'inWhsDate',
				render : function(data, type, row, meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
					
				},
				className : 'text-center'
			},
			{ 
				data : 'diffCnt',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{
				data : 'dlvDate',
				render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
				}
			},
			{
				data : 'dlvChangeDate',
				render : function(data, type, row, meta) {
					var html = '';
					html += '<input type="date" class="form-control" name="dlvChangeDate" style="min-width:100%;" value="'+moment(data).format("YYYY-MM-DD")+'" disabled>';
					html += '<input type="hidden" class="form-control" name="poSeq" style="min-width:100%;" value="'+row['poSeq']+'" disabled>';
					return html;
				}
			},
		],
		columnDefs : [ {
			"targets": "_all",	"className": "text-center" // 빈칸은 "-"로 표시
		}],
		order : [ [ 0, 'asc' ] ],
		buttons : 
			[ 'copy', {
				extend : 'excel'
				,filename : '발주현황(레이저)'
				,title : '발주현황(레이저)'
				,customize : function(xlsx){
					var sheet = xlsx.xl.worksheets['sheet1.xml'];
					var col = $('col', sheet);

			 		col.each(function () {
			 	    	$(this).attr('width', 20);
			 	    });
				}

		    }, 'print' ],
	});
	
	let poSeq = '';
	let tableIdx2 = '';
	
	//발주현황 상세 테이블 클릭
	$('#purchaseOrderVdTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			sideView = "";
			return false;
		} else {
			$('#purchaseOrderVdTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		poSeq = purchaseOrderVdTable.row(this).data().poSeq;
		console.log("poSeq = " + poSeq);
		tableIdx2 = $('#purchaseOrderVdTable').DataTable().row(this).index();
	
		sideView = "edit";
	});
	
	
	//발주현황 납기일자 수정
	$('#btnEdit').on('click', function() {
		if (sideView != "edit") {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		$('#purchaseOrderVdTable td').find('input[name=dlvChangeDate]').eq(tableIdx2).attr('disabled', false);
 		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');

	});
	
	//발주현황 납기일자 저장
	$('#btnSave').on('click',function() {
		var check = true;

		//입력값 검사 - 납기일자는 필수값이나 변경납기일자는 필수값이 아님
// 		$('#purchaseOrderVdTable tbody tr').each(function(index, item) {

// 			if (purchaseOrderVdTable.data().count() != 0) {
// 				//입력값 검사
// 				if ($(this).find('td input[name=dlvChangeDate]').val()=="") {
// 					toastr.warning('변경납기일자를 입력해 주세요.');
// 					$(this).find('td input[name=dlvChangeDate]').focus();
// 					check = false;
// 					return false;
// 				}
			
// 			}else{
// 				check = false;
// 				return false;
// 			}
			
// 		});
		
		var url = '<c:url value="/io/purchaseOrderDtlUpdate"/>';
		
		//수정 할 것만 update
		if(check){
			$('#purchaseOrderVdTable tbody tr').each(function(index, item) {
				if(!$(this).find('td input[name=dlvChangeDate]').is(":disabled")){
					var tempDlvDate = $(this).find('td input[name=dlvChangeDate]').val().replace(/-/g, '');
					var tempPoSeq = $(this).find('td input[name=poSeq]').val();
					console.log("dlvChangeDate => " + tempDlvDate + ", poSeq => " + tempPoSeq);
					$.ajax({
						url : url,
						type : 'GET',
						async : false,
						data : {
							'poNo' : function() {return poNo;},
							'poSeq' : function() {return tempPoSeq;},
							'dlvChangeDate' : function() {return tempDlvDate;},
						},
						success : function(res) {
							let data = res.data;
							if (res.result == 'ok') {
								
							} else {
								toastr.error(res.message);
							}
						}
					});
				}	
				
			});
			
			toastr.success("수정되었습니다.");
			tableIdx2 = "";
			sideView = "";
			//새로고침
			$('#purchaseOrderVdTable').DataTable().ajax.reload();
			//화면설정
			$('#btnSave').addClass('d-none');
			$('#btnDel').attr('disabled', false);
		}
		
	});
	
	//발주현황 삭제
	$('#btnDel').on('click', function() {
		if (sideView != "edit") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		
		//발주가 입고등록 되었는지 체크
		var inOutWhsDataCheck = '';
		$.ajax({
			url : '<c:url value="io/inOutWhsDataCheck" />',
			type : 'GET',
			async : false,
			data : {
				'poNo' : function() {return poNo;},
				'poSeq' : function() {return poSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					inOutWhsDataCheck = res.data;
				} else {
					toastr.error(res.message);
				}
				
			}
		});
		if (inOutWhsDataCheck != "0") {
			toastr.warning("이미 입고등록되어 삭제할 수 없습니다.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="io/purchaseOrderDtlDelete" />',
			type : 'POST',
			async : false,
			data : {
				'poNo' : function() {return poNo;},
				'poSeq' : function() {return poSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					sideView = '';
				} else {
					toastr.error(res.message);
				}
				
			}
		});
		
		$('#purchaseOrderVdTable').DataTable().ajax.reload();
		
		//오른쪽 테이블 데이터가 없으면 왼쪽 테이블 데이터 삭제
		if(purchaseOrderVdTable.data().length == 0){
			$.ajax({
				url : '<c:url value="io/purchaseOrderDelete" />',
				type : 'POST',
				async : false,
				data : {
					'poNo' : function() {return poNo;},
				},
				success : function(res) {
					if (res.result == 'ok') {
						
					} else {
						toastr.error(res.message);
					}
	 				$('#purchaseOrderList').DataTable().ajax.reload(null, false);
					$('#purchaseOrderVdTable').DataTable().ajax.reload();
					$('#btnPrint').attr('disabled', true);
					$('#btnCancel').attr('disabled', true);
					$('#btnEdit').attr('disabled', true);
					$('#btnDel').attr('disabled', true);
				}
			});
		}

	});
	
</script>

</body>
</html>