<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">

	<!-- 삭제처리 -->
	<form id="checkModalForm" enctype="multipart/form-data">
	<div class="modal fade bs-example-modal-lg shadow-lg" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-keyboard="false">
	    <div class="modal-dialog modal-lg" role="document" style="overflow-y: max-height:85%;  margin-top: 3%;">
	        <div class="modal-content" style="width: 50%; margin-left: 90%; margin-top: 20%;">
	            <div class="modal-header">
	           		<h5 class="modal-title" id="">주의</h5>
	            </div>
	            <div class="modal-body">
			    	<h6>입력하던 정보가 있습니다. 계속 진행하시겠습니까?</h6> 
			    </div>
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-primary btnCheckConfirm" id="btnModelDel">예</button>
	            	<button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
	            </div>
	        </div>
	    </div>
	</div>
	</form>
	<!--//삭제처리 -->


	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">자재요청</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 50%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search openbtn" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>

					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="matrlReqTable"  class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="8%">
								<col width="20%">
								<col width="13%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>요청번호</th>
									<th>부품요청일</th>
									<th>요청자</th>
									<th>요청부서</th>
									<th>비고</th>
									<th>승인구분</th>									
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 49%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
							<i class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-warning float-right" id="btnDel">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>						
						<button type="button"  class="btn btn-primary float-left mr-1" id="btnApprove" onclick="popUpApprove('001')">승인</button>
						<button type="button"  class="btn btn-primary float-left" id="btnCancle" onclick="popUpApprove('002')">미승인</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>처리중
						</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<div class="table-responsive mb-2">
							<form id="form">					
								<table id="bizOrderMrpTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>부품요청번호</th>
											<td>
												<input class="form-control" style="max-width: 100%"	type="text" id="partReqNo" name="partReqNo" disabled/>
											</td>
											<th>부품요청일</th>
											<td>
												<div class="form-group input-sub m-0"style="max-width: 100%">
													<input class="form-control" type="date" style="max-width: 100%" id="partReqDate" name="partReqDate" maxlength="10" disabled/>
<!-- 													<button	onclick="fnPopUpCalendar(mrpDate,mrpDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" -->
<!-- 													id="mrpDateCalendar" type="button"> -->
<!-- 														<span class="oi oi-calendar"></span> -->
<!-- 													</button> -->
												</div>
											</td>
										</tr>
										<tr>
											<th>*요청자</th>
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control" style="max-width: 100%" id="partReqChargr" name="partReqChargr" disabled> 
													<input type="text"class="form-control" style="max-width: 100%" id="partReqChargrNm" name="partReqChargrNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search"
														name="btnPartReqChargr" id="btnPartReqChargr"
														onClick="selectPartReqChargr('001');" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
											<th>*요청부서</th>
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control"style="max-width: 100%" id="partReqDept" name="partReqDept" disabled>
													<input type="text" class="form-control"style="max-width: 100%" id="partReqDeptNm" name="partReqDeptNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search"
														name="btnPartReqChargr" id="btnPartReqChargr2"
														onClick="selectPartReqChargr('002');" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3">
												<input class="form-control" style="max-width: 100%" type="text" id="partReqDesc" name="partReqDesc" maxlength="10" disabled/>
											</td>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						<div>
							<button type="button" class="btn btn-danger float-right mr-1" id="btnLineAllDel" disabled>전체 삭제</button>
							<button type="button" class="btn btn-warning float-right mr-1 mb-2" id="btnLineDel" disabled>삭제</button>
							<button type="button" class="btn btn-primary float-right mr-1" id="btnLineAdd" disabled>추가</button>
							<button class="btn btn-warning d-none" id="btnSaveConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>처리중
							</button>
						</div>
						<div class="table-responsive">
							<table id="matrlReqDtlTable" class="table table-bordered">
								<colgroup>
									<col width="5%">
									<col width="17%">
									<col width="6%">
									<col width="20%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="22%">
								</colgroup>
								<thead>
									<tr>	
										<th>No.</th>
										<th>CODE</th>
										<th>REV</th>
										<th>SPPEC</th>
										<th>요청수량</th>
										<th>출고예정일</th>
										<th>긴급여부</th>
										<th>사유</th>
									</tr>
								</thead>
							</table>
						</div>
						<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnSave">저장</button>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- Modal Start-->
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "50%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
// 			setTimeout(function(){
// 				$('table[name=matrlReqTable] thead tr th').click();
// 					console.log('hihihi')
// 			},400);
		}
		state = !state;
	});

	let currentHref = "iosc0220";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","자재요청"); 
	let viewIdx;
	let sideView = '';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var partCd='';
	var partReqNo='0';

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";
	var approveVal = '002'; 			// 승인여부
	
	//승인여부
	$.ajax({
		url : '<c:url value="sm/approvalAuthAdmList"/>',
		type: 'GET',
		dataType: 'json',
		async: false,
		data: {
			'userId' 	: function() { return userId;},
			'apprDesc'	: function() { return menuUrl;}
		},
		success: function(res) {
			let data = res.data;
			
			console.log(data.length);
			console.log(data);
			if (data.length != 0) {
				$('#btnApprove').removeClass('d-none');
				$('#btnCancle').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
				$('#btnCancle').addClass('d-none');
			}
		},
	});
	
	$('#saveBtnModalY').on('click', function(){
		uiProc(false);
		uiProc2(true);
		uiProc3(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnSave').addClass('d-none');
		matrlReqDtlTable.clear().draw();
		$('#matrlReqTable').DataTable().$('tr.selected').removeClass('selected');
		sideView ='';
	});

	//자재요청 목록조회
	let matrlReqTable = $('#matrlReqTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		/*scrollY: true,
		pageLength : 200000,*/
		//scrollY: '67vh',
		pageLength : 20000,
		ajax : {
			url : '<c:url value="io/matrlReqList"/>',
			type : 'GET',
			data : {
				'startDate'		: function(){return serverDateFrom.replace(/-/g,'');},
				'endDate'  		: function(){return serverDateTo.replace(/-/g,'')+1;},
				'partReqGubun'	: '002',
				'approvalCd'	: function(){return approveVal;}
			},
		},
		columns : [
			{ data : 'partReqNo'		},	//요청번호
			{ data : 'partReqDate',		
				render : function(data, type, row, meta){
					return moment(data).format('YYYY-MM-DD');
				}
			},	//부품요청일
			{ data : 'partReqChargrNm'	},	//요청자
			{ data : 'partReqDeptNm'	},	//요청부서
			{ data : 'partReqDesc'		},	//비고
			{ data : 'approvalCd',
				render : function(data, type, row, meta){
					if(data=="001"){
						return '승인';
					}else{
						return '미승인';
					}
				}
			},
		],
		order : [ [ 0, 'desc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});
	
// 	var tableIdx2='';
	var approvalCd='';
	
	//자재요청 목록조회 테이블 클릭 시
	$('#matrlReqTable tbody').on('click', 'tr', function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right mr-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if (!$(this).hasClass('selected')) {
			$('#matrlReqTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		partReqNo = matrlReqTable.row(this).data().partReqNo;
		partCd = matrlReqTable.row(this).data().partCd;
		approvalCd = matrlReqTable.row(this).data().approvalCd;

// 		tableIdx2 = $('#matrlReqTable').DataTable().row(this).index();
		
		if(approvalCd == '001'){
			$('#btnApprove').attr('disabled', true);
			$('#btnDel').attr('disabled', true);
			$('#btnEdit').attr('disabled', true);
		}else{
			$('#btnApprove').attr('disabled', false);
			$('#btnDel').attr('disabled', false);
			$('#btnEdit').attr('disabled', false);
		}
		sideView ='';
		
		$('#partReqNo').val(matrlReqTable.row(this).data().partReqNo);
		$('#partReqDate').val(moment(matrlReqTable.row(this).data().partReqDate).format('YYYY-MM-DD'));
		$('#partReqChargr').val(matrlReqTable.row(this).data().partReqChargr);
		$('#partReqChargrNm').val(matrlReqTable.row(this).data().partReqChargrNm);
		$('#partReqDept').val(matrlReqTable.row(this).data().partReqDept);
		$('#partReqDeptNm').val(matrlReqTable.row(this).data().partReqDeptNm);
		$('#partReqDesc').val(matrlReqTable.row(this).data().partReqDesc);
		
		$('#matrlReqDtlTable').DataTable().ajax.reload(function(){});
	});
	
	//등록버튼 클릭 시
	$('#btnAdd').on('click', function(){ 
		sideView ='add';
		uiProc(true);
		uiProc2(false);
		uiProc3(false);
		matrlReqDtlTable.clear().draw();
		$('#form').each(function() {
			this.reset();
		});
		$('#partReqChargr').val(userNumber);
		$('#partReqChargrNm').val(userNm);
		$('#partReqDate').val(moment().format('YYYY-MM-DD'));
		$('#btnSave').removeClass('d-none');
		$('#partReqNo').attr('placeholder', '처리중...');
		$('#matrlReqTable').DataTable().$('tr.selected').removeClass('selected');
	});

	//수정버튼 클릭 시
	$('#btnEdit').on('click', function(){
		if($('#matrlReqTable tbody tr').hasClass('selected')=='') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		if(approvalCd=='001') {
			toastr.warning("승인된 항목은 수정, 삭제할 수 없습니다.");
			return false;
		}
		sideView ='edit';
		uiProc(true);
		uiProc2(false);
		uiProc3(false);
		$('input[name=reqQty]').attr('disabled',false);
		$('input[name=outReqDate]').attr('disabled',false);
		$('select[name=emerYn]').attr('disabled',false);
		$('input[name=reqReason]').attr('disabled',false);
		$('button[name=btnPartCd]').attr('disabled',false);
		$('#btnSave').removeClass('d-none');
	});

	//삭제버튼 클릭 시
	$('#btnDel').on('click', function(){
		if($('#matrlReqTable tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		if(approvalCd=='001') {
			toastr.warning("승인된 항목은 수정, 삭제할 수 없습니다.");
			return false;
		}
		$('#deleteModal2').modal('show');
	});

	//모달 예 클릭 시
	$('#btnDeleteConfirmY').on('click', function(){
		console.log('Y클릭 됐어');

		$.ajax({
			url : '<c:url value="io/partReqAdmDelete"/>',
			type : 'POST',
			data : {
				 'partReqNo' : function(){return partReqNo;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#matrlReqTable').DataTable().ajax.reload(function(){});
					matrlReqDtlTable.clear().draw();
					$('#form').each(function() {
						this.reset();
					});
					partReqNo='';
					partReqSeq='';
					sideView ='';
				} else {
					toastr.error(res.message);
				}
			}
		});
	});
	
	//자재요청 상세보기테이블 조회
	let matrlReqDtlTable = $('#matrlReqDtlTable').DataTable({
		dom : "<'row'<'col-sm-12'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="io/partReqList"/>',
			type : 'GET',
			data : {
				'reqGubun'	: '002',
				'partReqNo'	: function(){return partReqNo}
			},
		},
		rowId : 'idx',
		columns : [
			{ name : 'num',
				render : function(data, type, row, meta) {
					return '<label class="temp"disabled >'+(meta.row+1)+'</label></td>';
				}
			},
			{ data: 'partCd',
				render : function(data, type, row, meta) {
					var html1='<div class="input-sub m-0" style="max-width: 100%">';
					html1+='<td><input type="text"class="form-control" name="partCd" value="'+data+'" disabled>';
					if(data!=''){
						html1+='<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onclick="selectPartCd();" disabled>';
					}else{
						html1+='<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onclick="selectPartCd();">';
					}
					html1+='<span class="oi oi-magnifying-glass"></span>';
					html1+='</button>';
					html1+='</div></td>';
					return html1;
				}
			},
			{ data: 'partRev',
				render : function(data, type, row, meta) {
					return '<td><input type="text" class="form-control text-center" name="partRev" value="'+data+'" disabled></td>';
				}
			},
			{ data: 'partSpec',
				render : function(data, type, row, meta) {
					return '<td><input type="text" class="form-control text-center" name="partSpec" value="'+data+'" disabled></td>';
				}
			},
			{ data: 'reqQty',
				render : function(data, type, row, meta) {
					if(data!=''){
						return '<td><input type="text" class="form-control text-right number-float0" name="reqQty" value="'+addCommas(data)+'" disabled></td>';
					}else {
						return '<td><input type="text" class="form-control text-right number-float0" name="reqQty" value=""></td>';
					}
				}
			},
			{ data: 'outReqDate',
				render : function(data, type, row, meta) {
					var html1='';
					if(data!=''){
						html1='<td><input type="hidden" class="form-control text-center" name="partReqSeq" value="'+row['partReqSeq']+'" disabled></td>';
						html1+='<td><input type="date" class="form-control text-center" name="outReqDate" value="'+moment(data).format('YYYY-MM-DD')+'" disabled></td>';
						return html1;
					}else {
						html1='<td><input type="hidden" class="form-control text-center" name="partReqSeq" value="" disabled></td>';
						html1+='<td><input type="date" class="form-control text-center" name="outReqDate" value="'+moment().format('YYYY-MM-DD')+'"></td>';
						return html1;
					}
				}
			},
			{ data : 'emerYn',
				render : function(data, type, row, meta) {
					var html = '';
					if(data!=''){
						html += '<select class="custom-select" name="emerYn" disabled>';
						
						if (data == "001"){
							html += '<option value="001" selected>긴급</option>';
							html += '<option value="002" >일반</option>';
						} else if (data == "002"){
							html += '<option value="001">긴급</option>';
							html += '<option value="002" selected>일반</option>';
						}
						html += '</select>';
						return html;
					}else{
						html += '<select class="custom-select" name="emerYn">';
						html += '<option value="001">긴급</option>';
						html += '<option value="002" selected>일반</option>';
						html += '</select>';
						return html;
					}
				}
			},
			{ data: 'reqReason',
				render : function(data, type, row, meta) {
					if(data!=''){
						return '<td><input type="text" class="form-control text-center" name="reqReason" value="'+data+'" disabled></td>';
					}else {
						return '<td><input type="text" class="form-control" name="reqReason" value=""></td>';
					}
				}
			},
		],
		columnDefs : [
			 {  targets : [0], className: 'text-center-td' }
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
	
	var tableIdx='';
	var partReqSeq='';
	//자재요청 상세보기테이블 클릭 시
	$('#matrlReqDtlTable tbody').on('click', 'tr', function() {
		console.log('자재상세 테이블이 클릭 됐어');
		
		if (!$(this).hasClass('selected')) {
			$('#matrlReqDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#matrlReqDtlTable').DataTable().row(this).index();
		partReqSeq = matrlReqDtlTable.row(this).data().partReqSeq;
	});
	
	var temp = 0;
	//추가버튼 클릭 시
	$('#btnLineAdd').on('click', function(){
		matrlReqDtlTable.row.add({
			"num"			:	temp+1,
			"partCd"		:	"",
			"partRev"		:	"",
			"partSpec"		:	"",
			"reqQty"		:	"",
			"outReqDate"	:	"",
			"emerYn"		:	"",
			"reqReason"		:	""
		}).draw();

		var i = 1;
		//순번 삭제
		$('#matrlReqDtlTable > tbody > tr > td').each(function(index, td) {
			if ((index % 8) == 0) {
				$(this).text(i);
				i++;
			}
        });
	});
	
	
	//행삭제 버튼 클릭 시
	$('#btnLineDel').on('click',function() {
		if ($('#matrlReqDtlTable  tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 목록을 선택해 주세요");
			return false;
		}
		
		matrlReqDtlTable.row('.selected').remove().draw();
		var i = 1;
		$('#matrlReqDtlTable > tbody > tr > td').each(function(index, td) {
			if ((index % 8) == 0) {
				$(this).text(i);
				i++;
			}
        });
        temp = i;
        
		$.ajax({
			url : '<c:url value="io/partReqDelete"/>',
			type : 'POST',
			data : {
				 'partReqNo' : function(){return partReqNo;},
				 'partReqSeq' : function(){return partReqSeq;}
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					matrlReqDtlTable.row('.selected').remove().draw();
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//전체삭제 버튼 클릭 시
	$('#btnLineAllDel').on('click', function(){
		if($('#matrlReqDtlTable tbody tr').text() =='데이터가 없습니다.'){
			toastr.warning("삭제할 항목이 없습니다.");
		}else{
			$('#checkModal').modal('show');
		}
	});

	//DTL삭제 모달 예 클릭 시
	$('#btnModelDel').on('click', function(){
		if(sideView == 'add'){
			matrlReqDtlTable.clear().draw();
			$('#checkModal').modal('hide');
		}
		if(sideView == 'edit'){
			//삭제
			$.ajax({
				url : '<c:url value="io/partReqDelete"/>',
				type : 'POST',
				data : {
					 'partReqNo' : function(){return partReqNo;},
				},
				success : function(res) {
					let data = res.result;
					if (res.result == 'ok') {
						toastr.success('전체 삭제되었습니다.');
						matrlReqDtlTable.clear().draw();
						$('#checkModal').modal('hide');
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});

	//요청수량 숫자만 입력하게 처리
	$(document).on('keyup',"input[name=reqQty]", function(event){
		var preInWhsQtyData = $(this).val();
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas(uncomma($(this).val())));
	}); 
	
	//저장버튼 클릭 시
	$('#btnSave').on('click', function(){
		console.log('저장 버튼이 클릭 됐어');
		
		if(!$.trim($('#partReqChargrNm').val())){
			toastr.warning('요청자를 선택해주세요.');
			$('#btnPartReqChargr').focus();
			return false;
		}
		if(!$.trim($('#partReqDeptNm').val())){
			toastr.warning('부서를 선택해주세요.');
			$('#btnPartReqChargr2').focus();
			return false;
		}

		
		/*if($('#matrlReqDtlTable tbody tr').text() =='데이터가 없습니다.'){
			toastr.warning('테이블을 추가하고 등록해주세요.');
			$('#btnLineAdd').focus();
			$('#btnLineAdd').click();
			return false;
		}*/

		//조건 
		for(var i=0; i<$('#matrlReqDtlTable tbody tr').length; i++){
			if(!$.trim($('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(1).find('input[name=partCd]').val())){
				toastr.warning('CODE값을 선택해주세요.');
				$('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(1).find('button[name=btnPartCd]').focus();
				return false;
			}
			if(!$.trim($('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=reqQty]').val())){
				toastr.warning('요청수량을 입력해주세요.');
				$('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=reqQty]').focus();
				return false;
			}
			if(!$.trim($('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=outReqDate]').val())){
				toastr.warning('출고예정일을 선택해주세요.');
				$('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=outReqDate]').focus();
				return false;
			}
			if(!$.trim($('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(6).find('select[name=emerYn]').val())){
				toastr.warning('긴급여부를 선택해주세요.');
				$('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(6).find('select[name=emerYn]').focus();
				return false;
			}
			if(!$.trim($('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(7).find('input[name=reqReason]').val())){
				toastr.warning('사유를 입력해주세요.');
				$('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(7).find('input[name=reqReason]').focus();
				return false;
			}
		}
		
		var array = new Array();
		//저장처리
		for(var i=0; i<$('#matrlReqDtlTable tbody tr').length; i++){
			$('#my-spinner').show();
			var obj = new Object();
			if(sideView == 'edit'){
				obj.partReqNo = $('#partReqNo').val();
				obj.partReqSeq = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=partReqSeq]').val();
				obj.partReqDate = $('#partReqDate').val().replace(/-/g,'');
			}
			obj.partReqChargr = $('#partReqChargr').val();
			obj.partReqDept = $('#partReqDept').val();
			obj.partReqDesc = $('#partReqDesc').val();
			obj.partCd = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(1).find('input[name=partCd]').val();
			obj.partRev = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(2).find('input[name=partRev]').val();
			obj.reqQty = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=reqQty]').val().replace(/,/g,'');;
			obj.outReqDate = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=outReqDate]').val().replace(/-/g,'');
			obj.emerYn = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(6).find('select[name=emerYn]').val();
			obj.reqReason = $('#matrlReqDtlTable tbody tr').eq(i).find('td').eq(7).find('input[name=reqReason]').val();
			
			array.push(obj);
		}
		console.log(array);
		
		var data = JSON.stringify(array);
		
		if(sideView == 'add'){
			var url = '<c:url value="io/matrlReqCreate"/>';
		}else if(sideView == 'edit'){
			var url = '<c:url value="io/matrlReqUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'arrayData' : 	function(){return data;}
			},
			success: function (res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(sideView == 'add'){
						toastr.success('등록되었습니다.');
					}else{
						toastr.success('수정되었습니다.');
					}
				} else {
					toastr.error(res.message);
				}
            },
            complete : function() {
            	$('#btnSave').addClass('d-none');
            	matrlReqDtlTable.clear().draw();
            	uiProc(false);
        		uiProc2(true);
        		uiProc3(true);
        		$('#form').each(function() {
        			this.reset();
        		});
        		$('#matrlReqTable').DataTable().ajax.reload(function(){});
        		sideView =''; 
        		$('#my-spinner').hide();
			}
		});
	});

	//승인, 미승인 버튼 클릭 시
	function popUpApprove(value){
		console.log('승인 버튼 클릭 됨'+value);
		var text;
		value == "001" ? text='승인' : text='미승인';
		
		if($('#matrlReqTable tbody tr').hasClass('selected')=='') {
			toastr.warning(text+" 할 항목을 선택해주세요.");
			return false;
		}
		if(value == "002"){
			for(var i=0; i<$('#matrlReqDtlTable tbody ').length; i++){
				if(matrlReqDtlTable.data()[i].reqStatus == "002"){
					toastr.warning("이미 출고된 항목입니다.");
					return false;
				}
			}
		}
		
		$.ajax({
			url : '<c:url value="io/matrlReqApproval"/>',
			type : 'POST',
			data : {
				 'partReqNo' : function(){return partReqNo;},
				 'approvalCd' : value
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success(text+' 되었습니다.');
					if(value == '001'){
						$('#btnDel').attr('disabled', true);
						$('#btnEdit').attr('disabled', true);
					}else{
						$('#btnDel').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
					}
					approvalCd = value;
					$('#matrlReqTable').DataTable().ajax.reload(function(){
// 						$('#matrlReqTable tbody tr').eq(tableIdx2).addClass('selected');
					});
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	
	//팝업버튼 클릭 시
	function selectPartReqChargr(value){
		console.log('요청자 팝업 시작'+value);
		$('#userPopUpLabel').text("요청자 조회")
		userPopUpTable = $('#userPopUpTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy : true,
			pageLength : 15,
			ajax : {
				url : '/sm/matrlUserDataList',
				type : 'GET',
				data : {}
			},
			rowId : 'userNumber',
			columns : [ 
				{ data : 'userNm'		},
				{ data : 'departmentNm'	},
				{ data : 'postNm'		},
				{ data : 'chargrDutyNm'	},
				{ data : 'workplaceNm'	},
				{ data : 'userDesc'		},
			],
			columnDefs : [ {
				"targets" : [ 0, 1, 2, 3, 4, 5 ],
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});
		$('#userPopUpTable tbody').on('click', 'tr', function() {
			var data = userPopUpTable.row(this).data();
			if(value=='001'){
				$('#partReqChargr').val(data.userNumber);
				$('#partReqChargrNm').val(data.userNm);
			}else{
				$('#partReqDept').val(data.departmentCd);
				$('#partReqDeptNm').val(data.departmentNm);
			}
			$('#userPopUpModal').modal('hide');
		});
		$('#userPopUpModal').modal('show');
	}

	function selectPartCd(){
		itemPartPopUpTable = $('#itemPartPopUpTable').DataTable({
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
			serverSide : true,
			destroy : true,
			pageLength : 15,
			ajax : {
				url : '<c:url value="bm/itemPartAdmList"/>',
				type : 'GET',
				data : {},
			},
			rowId : 'partCd',
			columns : [
					{ render : function(data, type, row, meta) {
						return meta.row+ meta.settings._iDisplayStart+ 1;
						}
					},
					{ data : 'partCd'		},
					{ data : 'partNm'		}, 
					{ data : 'partGubunNm'	},
					{ data : 'partTypeNm'	}, 
					{ data : 'partRev'		},
					{ data : 'partSpec'		}
			],
			columnDefs : [ 
				{ "defaultContent" : "-","targets" : "_all","className" : "text-center"}
			],
			order : [ [ 1, 'asc' ] ],
		});

		$('#itemPartPopUpTable tbody').on('click', 'tr', function() {
			var data = itemPartPopUpTable.row(this).data();
			console.log(data);
			console.log('tableIdx : '+tableIdx)
			$('input[name=partCd]').eq(tableIdx).val(data.partCd);
			$('input[name=partRev]').eq(tableIdx).val(data.partRev);
			$('input[name=partSpec]').eq(tableIdx).val(data.partSpec);
			$('#itemPartPopUpModal').modal('hide');
		});
		$('#itemPartPopUpModal').modal('show');
	}
	
	//상위 버튼
	function uiProc(flag) {
		$('#btnAdd').attr('disabled', flag);
		$('#btnEdit').attr('disabled', flag);
		$('#btnDel').attr('disabled', flag);
		$('#btnApprove').attr('disabled', flag);
		$('#btnCancle').attr('disabled', flag);
	}
	//하위 버튼
	function uiProc2(flag) {
		$('#btnLineAdd').attr('disabled', flag);
		$('#btnLineAllDel').attr('disabled', flag);
		$('#btnLineDel').attr('disabled', flag);
	}
	//Box영역
	function uiProc3(flag) {
// 		$('#partReqDate').attr('disabled', flag);
// 		$('#partReqChargrNm').attr('disabled', flag);
		$('#btnPartReqChargr').attr('disabled', flag);
		$('#btnPartReqChargr2').attr('disabled', flag);
// 		$('#partReqDeptNm').attr('disabled', flag);
		$('#partReqDesc').attr('disabled', flag);
	}
	
	
	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
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
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
	html1 += '&nbsp;&nbsp;&nbsp;<select id="approveOption" class="custom-select custom-select-sm"  style="max-width:px;">';
	html1 += '<option value="001" >승인</option>';
	html1 += '<option value="002" selected>미승인</option>';
	html1 += '</select>';
	html1 += '</div>';

	$('#matrlReqTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		$('#matrlReqTable').DataTable().ajax.reload(function(){});
	});
	
	$('#approveOption').on('change', function() {
		approveVal = $('#approveOption option:selected').val();
		$('#matrlReqTable').DataTable().ajax.reload(function() {});
	});
    
	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		$('#matrlReqTable').DataTable().ajax.reload(function (){});
    });
	
</script>

</body>
</html>
