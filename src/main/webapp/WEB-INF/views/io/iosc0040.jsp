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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">입고등록(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 52%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="purchaseOrderTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="13%">
								<col width="13%">
								<col width="20%">
								<col width="5%">
								<col width="7%">
								<col width="8%">
								<col width="7%">
								<col width="10%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>발주번호</th>
									<th>공급처</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th class="text-center">발주수량</th>
									<th class="text-center">가입고수량</th>
									<th class="text-center">입고수량</th>
									<th>입고일자</th>
									<th>입고상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>

			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar"
				id="myrSidenav" style="width: 47%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<div class="card-body col-sm-12 p-1 mb-2">
							<input type="number" class="form-control text-right float-left mr-1" id="partPrintCnt" placeholder="매수" style="width:40px;" value="1" disabled>
							<button type="button" class="btn btn-warning float-left mr-1" id="printLargeBarcode" disabled>라벨인쇄</button><!--onclick="printPartBarcode(1);"   -->
							<button type="button" class="btn btn-primary d-none float-right"
								id="btnSave">저장</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnAdd">등록/수정</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div> 
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2"id="">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>발주수량</th>
										<td><input type="text" class="form-control" id="ordQty" style="text-align:right; min-width: 100%;" disabled></td>
										<th>미입고수량</th>
										<td><input type="text" class="form-control" id="diffQty" style="text-align:right; min-width: 100%;" disabled></td>
									</tr>
									<tr>
										<th>포장수량</th>
										<td><input type="text" class="form-control" id="boxCount" style="text-align:right; min-width: 100%;" disabled></td>
										<th>포장단위</th>
										<td><input type="text" class="form-control" id="itemUnit" style="text-align:center; min-width: 100%;" disabled></td>
									</tr>
									<tr>
										<th>LotNo</th>
										<td>
											<input type="text" class="form-control mr-2" id="lotNo" placeholder="30자리 내외" style="border: solid 2px #346cb0;text-align:right; min-width: 100%;" maxlength="30" disabled>
										</td>
										<th>입고수량</th>
										<td>
											<input type="text" class="form-control mr-3" id="packQty" style="border: solid 2px #346cb0;text-align:right; min-width: 100%;" disabled>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<button type="button" class="btn btn-primary" id="btnLotCreate" style="min-width: 100%;" disabled>바코드 생성</button>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<!--하단 등록 부분 상단 버튼 영역-->
						<div class="card-body col-sm-12 p-1">
		                    <div class="input-sub float-left mr-1">
		                  		<div class="form-group input-sub m-0 row">
		                  			<label class="input-label-sm">입고일자</label>
		                   			<input class="form-control" type="text" style="width:97px;" id="batchPreInWhsDate" name="batchPreInWhsDate" disabled/>
		                   			<button onclick="fnPopUpCalendar(batchPreInWhsDate,batchPreInWhsDate,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="batchPreInWhsDateCalendar" type="button">
		                    			<span class="oi oi-calendar"></span>
		                   			</button>
		                  		</div>
		                  	</div>
		                  	<button type="button" class="btn btn-primary float-left mr-1" id="btnBatchApply" disabled>일괄적용</button>
							<button type="button" class="btn btn-warning float-left mr-1"
								id="btnDtlEdit" disabled>수정</button>
							<button class="btn btn-primary d-none" id="btnDtlEditConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-danger float-left"
								id="btnDtlDel" disabled>삭제</button>
							<button class="btn btn-primary d-none" id="btnDtlDelConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table class="table table-lg table-bordered mb-2" id="inOutWhsAdmTable">
									<colgroup>
										<col width="4%">
										<col width="14%">
										<col width="14%">
										<col width="9%">
										<col width="17%">
										<col width="9%">
										<col width="8%">
										<col width="8%">
										<col width="17%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>
												<input type="checkbox" class="" id="checkAll" name="checkAll" >
											</th>
											<th class="text-center">입고전표번호</th>
											<th class="text-center">입고일자</th>
											<th class="text-center">입고수량</th>
											<th>BarcodeNo</th>
											<th>LotNo</th>
											<th>합/불 판정</th>
											<th>승인여부</th>
											<th>창고</th>
										</tr>
									</thead>
								</table>
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
<!-- Modal Start-->
<div class="modal modal-alert fade" id="resetModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="resetModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
		        <h5 class="modal-title" id="confirmSaveModalLabel">알림</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
	      	</div>
			<div class="modal-body">
				<h6>LOT생성 새로생성/추가 방식을 선택해주세요.</h6>
			</div>
			<div class="modal-footer">
		      	<button type="button" class="btn btn-warning " id="btnLotReset" data-dismiss="modal">새로생성</button>
		      	<button type="button" class="btn btn-warning " id="btnLotAdd" data-dismiss="modal">추가</button>
		      	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		    </div>
		</div>
	</div>
</div>
<!-- Modal END-->
<!-- 창고조회 모달 시작 -->
<div class="modal fade" id="locationPopupModal" tabindex="-1" role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
		      	<hr class="text-secondary">	         
	                <table id="locationPopupTable" class="table table-bordered">
	                	<colgroup>
							<col width="12%">
							<col width="20%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="20%">
						</colgroup>	
	                    <thead class="thead-light">
		                    <tr>
		                    	<th>구분</th>
		                    	<th>창고코드</th>
		                    	<th>창고구분</th>
		                    	<th>구역</th>
		                    	<th>위치</th>
		                    	<th>사용여부</th>
		                    	<th>비고</th>
		                    </tr>
	                    </thead>
					</table>
	 			<hr class="text-secondary"> 
		    </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 창고조회 모달 끝 -->
<%@include file="../layout/bottom.jsp" %>
<script>
	
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "52%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		 state = !state; 
	});

	let currentHref = "iosc0040";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","입고등록(레이저)"); 
	
	let viewIdx;
	let sideView = 'add';
	
	var tableIdx=null;
	var tableIdx2=null;
	var poNo;
	var poSeq;	
	var inSeq;
	var inSlipNo;
	var inSlip
	var itemSeq;
	var itemCd;
	var ordQty=0;
	var index=0;
	var sum=0;

	var cmd = new Array();
	var i = 0;

	let printArray = new Array();
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var startDate = "${serverDateFrom}";
	var endDate = "${serverDateTo}";
	var batchPreInWhsDateVal = "${serverDateTo}";
	var lotNoVal = "";
	let statusCdVal='';
	
	$('input[name=preInWhsDate]').val(serverDateTo);
	$('#batchPreInWhsDate').val(serverDateTo);
	
	//공통코드 처리 시작		
 	var inspectYnCode = new Array(); // 상태유무
	<c:forEach items="${inspectYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspectYnCode.push(json);
	</c:forEach> 

	var payYnCode = new Array(); // 상태유무
	<c:forEach items="${payYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	payYnCode.push(json);
	</c:forEach> 

 	var poStatusCode = new Array(); // 상태유무
	<c:forEach items="${poStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	poStatusCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝		

	uiProc(true);

	$('#saveBtnModalY').on('click', function(){
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		
		$('#lotNo').attr('disabled',true);
		$('#packQty').attr('disabled',true);
		$('#packQty').val('');
		$('#btnLotCreate').attr('disabled',true);
		$('#btnDtlEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', true);
		$('#btnBatchApply').attr('disabled', true);
		$('#inOutWhsAdmTable').DataTable().ajax.reload();
    });
	
	 // 목록
    let purchaseOrderTable = $('#purchaseOrderTable').DataTable({
    	dom:  "<'row'<'col-sm-12 col-md-8' l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'p>>",
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        lengthChange : true,
        pageLength : 20,
        ajax: {						
            url: '<c:url value="io/purchaseOrderStatusList"/>',
            type: 'GET',
            data: {
	          	'startDate': function() { return startDate.replace(/-/g,'');},
	            'endDate': function() { return endDate.replace(/-/g,''); },
		        'statusCd' : function() {return statusCdVal},
		        'value'  : '가입고',
	            'searchOption' : "002",
		        'gubun' : '001',
		        'mainGubun' : '001'
            },          
        },
        rowId: 'poNo',
        columns : [ 
			{//발주번호
				data :'poNo'
			},
			{//공급처
				data : 'dealCorpNm'
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단위
				data : 'itemUnitNm'
			}, 
			{//발주수량
				data : 'ordQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{//입고수량
				data : 'preInWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{//입고수량
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
			{//입고일자
				data : 'inWhsDate',
				render: function(data, type, row, meta) {
					if (data != null) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				}
			},
			{//입고상태
				data : 'statusCd'
			}
		],
		createdRow : function( row, data, dataIndex ) {
		    if ( data['statusCd'] == "발주" ) {
		    	$(row).find('td').eq(9).css('color','orange').css('font-weight','bold');
		    }else if ( data['statusCd'] == "가입고" ) {
		    	$(row).find('td').eq(9).css('color','red').css('font-weight','bold');
		    }else if ( data['statusCd'] == "입고중" ) {
		   	 	$(row).find('td').eq(9).css('color','blue').css('font-weight','bold');
		    }else if ( data['statusCd'] == "입고완료" ) {
		    	$(row).find('td').eq(9).css('color','green').css('font-weight','bold');
		    }
		},
		columnDefs: [
		],   
        order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
    });

	 

	var sysdate = "${serverTime}";
    
    var html1 = '<div class="row">';
    html1 += '<label class="input-label-sm">입고일자</label><div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';   
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">입고상태</label>'; 
	html1 += '<select class="custom-select" id="poStatusOption"></select>';
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  class="btn btn-primary mr-1" id="btnRetv">조회</button>'
    html1 += '<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
	
	$('#purchaseOrderTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	selectBoxAppend(poStatusCode, "poStatusOption", '', "1"); 

	//조회버튼 클릭시
	$('#btnRetv').on('click', function() {
    	startDate =  $('#preInWhsDateFrom').val();
    	endDate =  $('#preInWhsDateTo').val();
    	statusCdVal = $('#poStatusOption option:selected').val();
		$('#purchaseOrderTable').DataTable().ajax.reload( function () {});
    });	

	//전체조회버튼 클릭시
	$('#btnAllList').on('click', function() {
		startDate =  "";
    	endDate =  "";
    	statusCdVal = "";
		$('#purchaseOrderTable').DataTable().ajax.reload( function () {});
    });	
    
	
	//창고 정보 가져오기
	var locationNo;
	var locationCd;
	var locationNm;
	var areaCd;
	var areaNm;
	var floorCd;
	
	// 세부 목록 보기
	$('#purchaseOrderTable tbody').on('click','tr',function() {
		if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#purchaseOrderTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = purchaseOrderTable.row(this).index();
		
		poNo = purchaseOrderTable.row(this).data().poNo;
		poSeq = purchaseOrderTable.row(this).data().poSeq;
		ordQty = purchaseOrderTable.row(this).data().ordQty;
		ordQty = purchaseOrderTable.row(this).data().ordQty;
		itemSeq = purchaseOrderTable.row(this).data().itemSeq;			
		itemCd = purchaseOrderTable.row(this).data().itemCd;			

		locationNo = purchaseOrderTable.row(this).data().locNo;			
		locationCd = purchaseOrderTable.row(this).data().locCd;			
		locationNm = purchaseOrderTable.row(this).data().locationNm;
		areaCd = purchaseOrderTable.row(this).data().areaCd;			
		areaNm = purchaseOrderTable.row(this).data().areaCdNm;			
		floorCd = purchaseOrderTable.row(this).data().floorNm;			

		
		$('#itemCd').val(purchaseOrderTable.row(this).data().itemCd);
		$('#itemNm').val(purchaseOrderTable.row(this).data().itemNm);
		$('#itemModel').val(purchaseOrderTable.row(this).data().itemModel);
		$('#itemUnit').val(purchaseOrderTable.row(this).data().itemUnitNm);
		$('#boxCount').val(rmDecimal(purchaseOrderTable.row(this).data().boxCount));
		$('#ordQty').val(rmDecimal(purchaseOrderTable.row(this).data().ordQty));
		$('#diffQty').val(rmDecimal(purchaseOrderTable.row(this).data().diffCnt));
		

		sideView = "edit";
		$('#btnSave').addClass('d-none');
		
		$('#lotNo').attr('disabled',true);
		$('#lotNo').val('');
		$('#packQty').attr('disabled',true);
		$('#packQty').val('');
		
		$('#btnLotCreate').attr('disabled',true);
		$('#btnDtlEdit').attr('disabled',true);
		$('#btnDtlDel').attr('disabled',true);
		$('#btnBatchApply').attr('disabled',true);
		
		$('#checkAll').prop('checked',false);
		$('#batchPreInWhsDate').val(serverDateTo);

		if(purchaseOrderTable.row(this).data().poEndDate=="002"){
			$('#btnAdd').attr('disabled',true);
			//$('#btnEdit').attr('disabled',true);
			$('#btnDel').attr('disabled',true);
		}else{
			$('#btnAdd').attr('disabled',false);
			//$('#btnEdit').attr('disabled',false);
			$('#btnDel').attr('disabled',false);
		}

		//라벨인쇄 활성화/비활성화
		$('#inOutWhsAdmTable').DataTable().ajax.reload( function () {
			if(inOutWhsAdmTable.data().count()>0){
				$('#partPrintCnt').attr('disabled',false);
				$('#printLargeBarcode').attr('disabled',false);
			}else{
				$('#partPrintCnt').attr('disabled',true);
				$('#printLargeBarcode').attr('disabled',true);
			}
		});


		printArray = [];
	});


	//전체선택클릭
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop("checked")){
			$('input:checkbox[name=printList]').prop("checked",true);
		}else{
			$('input:checkbox[name=printList]').prop("checked",false);
		}
	});
	

	//등록 버튼 클릭
	$('#btnAdd').on('click',function(){

		if(sideView!="edit"){
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}

		$('#lotNo').attr('disabled',false);
		$('#packQty').attr('disabled',false);
		$('#btnLotCreate').attr('disabled',false);
		$('#btnDtlEdit').attr('disabled',false);
		$('#btnDtlDel').attr('disabled',false);
		$('#btnBatchApply').attr('disabled',false);
		//$('#btnEdit').attr('disabled',true);
	
	});

	//lot생성 버튼 클릭
	$('#btnLotCreate').on('click',function(){

		if($('#lotNo').val()==""){
			toastr.warning("LotNo를 입력해주세요.");
			return false;
		}

		if($('#packQty').val()==""){
			toastr.warning("입고수량을 입력해주세요.");
			return false;
		}

		if($('#boxCount').val()=="0" || $('#boxCount').val()==""){
			toastr.warning("포장수량을 확인해주세요.");
			return false;
		}

		$('#resetModal').modal('show');
		
	});
	

	//LOT생성 새로고침 버튼 클릭시
	$('#btnLotReset').on('click',function(){
		
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){
			packQtyVal = $('#packQty').val().replace(/,/g,'');		//입고수량
			boxCountVal = $('#boxCount').val().replace(/,/g,'');	//포장수량
			lotNoVal = $('#lotNo').val(); 							//lotNo
			
			quotVal = parseInt(packQtyVal/boxCountVal);	//몫
			remainVal = packQtyVal%boxCountVal;			//나머지
			
			console.log("몫:"+quotVal+"/ 나머지:"+remainVal);

			for(var i=0; i<quotVal; i++){
				
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : boxCountVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					//창고 정보 삽입
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);	

				console.log(i);
			}

			//나머지가 0이 아닐경우
			if(remainVal!=0){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : remainVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					//창고 정보 삽입
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);	
					
			}
		});

		$('#btnSave').removeClass('d-none');
	});

	

	//LOT생성 추가 버튼 클릭시
	$('#btnLotAdd').on('click',function(){

		var packQtySum=0;
		//document.getElementById('inOutWhsAdmTable').rows.length-2!=0
		
		if(inOutWhsAdmTable.data().count()!=0){
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				packQtySum += parseFloat($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
			});
		}

		console.log("packQtySum:"+packQtySum)
		
		if(packQtySum+parseFloat($('#packQty').val()) <= ordQty){   // 50<30
			
			packQtyVal = $('#packQty').val().replace(/,/g,'');		//입고수량
			boxCountVal = $('#boxCount').val().replace(/,/g,'');		//포장수량
			lotNoVal = $('#lotNo').val(); 							//lotNo
			
			quotVal = parseInt(packQtyVal/boxCountVal);	//몫
			remainVal = packQtyVal%boxCountVal;			//나머지
			
			console.log("몫:"+quotVal+"/ 나머지:"+remainVal);

			for(var i=0; i<quotVal; i++){
				
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : boxCountVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					//창고 정보 삽입
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);	
			}

			//나머지가 0이 아닐경우
			if(remainVal!=0){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : remainVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					//창고 정보 삽입
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);	
					
			}

			$('#btnSave').removeClass('d-none');
		}else{
			toastr.warning("발주수량값을 초과하였습니다. 확인해주세요");
		}

	});
	

	

	// 세부목록
	let inOutWhsAdmTable = $('#inOutWhsAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching: false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: "460px",
		ajax : {
			url : '<c:url value="io/preInOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'poNo' :  function(){return poNo;},
				'poSeq' :  function(){return poSeq;},
				'itemSeq' :  function(){return itemSeq;},
			},
		},
		columns : [
			{//체크박스
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="printList" value="">';
				},
				'className' : 'text-center'
			},
			{//입고전표번호
				data : 'inSlipNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="inSlipNo" value="'+data+'" style="text-align:center;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="inSlipNo" value="" placeholder="처리중" style="text-align:center;" disabled>';	
					}	
				},
			},
			{//입고일자
				data : 'preInWhsDate',
				render: function(data, type, row, meta) {	
					if(data!=null){
						
						html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control"  type="text" id="preInWhsDate'+index+'" name="preInWhsDate" value="'+moment(data).format("YYYY-MM-DD")+'" disabled/>'  
	    				html += '<button onclick="fnPopUpCalendar(preInWhsDate'+index+',preInWhsDate'+index+',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="preInWhsDateFromCalendar" type="button" disabled>';	
						html += '<span class="oi oi-calendar"></span></buton></div>';

						index++;
						
						return html;
					} else{
						html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control"  type="text" id="preInWhsDate'+index+'" name="preInWhsDate" value="'+serverDateTo+'" disabled/>' 
	    				html += '<button onclick="fnPopUpCalendar(preInWhsDate'+index+',preInWhsDate'+index+',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="preInWhsDateFromCalendar" type="button">';	
						html += '<span class="oi oi-calendar"></span></buton></div>';

						index++;
						
						return html;
					}
				}		   
			},
			{//입고수량
				data : 'preInWhsQty',
				render: function(data, type, row, meta) {	
					if(data!=null){
						if(row['pairCnt']!=null){
							return '<input type="text" class="form-control number-float0" name="preInWhsQty" value="'+rmDecimal(row['pairCnt'])+'" style="text-align:right;" disabled>' ;	
						}else{
							return '<input type="text" class="form-control number-float0" name="preInWhsQty" value="'+rmDecimal(data)+'" style="text-align:right;" disabled>' ;	
						}
	    			} else{
						return '<input type="text" class="form-control number-float0" name="preInWhsQty" value="0" style="text-align:right;">';	
					}		    			
	    		}
			},
			{//BarcodeNo
				data : 'barcodeNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="text-align:center;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="barcodeNo" value="" placeholder="처리중" style="text-align:center;" disabled>';	
					}	
				},
			},
			{//LotNo
				data : 'lotNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
						if(row['barcodeNo']==null){
							return '<input type="text" class="form-control" name="lotNo" value="'+data+'" style="text-align:center;" placeholder="30자리 내외">' ;	
						}else{
							return '<input type="text" class="form-control" name="lotNo" value="'+data+'" style="text-align:center;" placeholder="30자리 내외" disabled>' ;	
						}
					} else{
						return '<input type="text" class="form-control" name="lotNo" value="" style="text-align:center;" placeholder="30자리 내외" disabled>';	
					}	
				},
			},
			{//합/불 판정
				data : 'qaEval',
				render: function(data, type, row, meta){
					if(data!=null){
						if(data == "001"){
							return '<input type="text" class="form-control" name="qaEval" value="합격" style="text-align: center;color: blue;" disabled/>';
						}else if(data == "002"){
							return '<input type="text" class="form-control" name="qaEval" value="불합격" style="text-align: center;color: red;" disabled/>';
						}else if(data == ""){
							return '<input type="text" class="form-control" name="qaEval" placeholder="미판정" style="text-align: center;" disabled/>';
						}
					}else{
						return '<input type="text" class="form-control" name="qaEval" placeholder="미판정" style="text-align: center;" disabled/>';
					}
				},
				'className' : 'text-center'
			},
			{//승인여부
				data : 'approvalCd',
				render: function(data, type, row, meta){
					if(row['statusCd']=="S"){
						return '<input type="text" class="form-control" name="qaEval" placeholder="승인중" style="text-align: center;" disabled/>';
					}else{
						if(data == "001"){
							return '<input type="text" class="form-control" name="qaEval" value="승인" style="text-align: center;color: blue;" disabled/>';
						}else{
							return '<input type="text" class="form-control" name="qaEval" value="미승인" style="text-align: center; color:red;" disabled/>';
						}
					}
				},
				'className' : 'text-center'
			},
			{//창고
				data : 'locationNo',
				render: function(data, type, row, meta) {
					if(data != null){
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="locationCd" value="'+row['locationCd']+'">';
						html += '<input type="hidden" class="form-control" name="areaCd" value="'+row['areaCd']+'">';
						html += '<input type="hidden" class="form-control" name="floorCd" value="'+row['floorCd']+'">';
						html += '<input type="hidden" class="form-control" name="locationNo" value="'+row['locationNo']+'">';
						html += '<input type="text" class="form-control" name="locationData" value="'+row['locationNm']+"/"+row['areaNm']+"/"+row['floorCd']+'" disabled>';
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationDataClick()" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;	
					} else {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="locationCd" value="">';
						html += '<input type="hidden" class="form-control" name="areaCd" value="">';
						html += '<input type="hidden" class="form-control" name="floorCd" value="">';
						html += '<input type="hidden" class="form-control" name="locationNo" value="">';
						html += '<input type="text" class="form-control" name="locationData" value="" disabled>';
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationDataClick()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;	
					}	
				},
			},
			/* {data : 'locationNm',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="locationNm" value="'+data+'" style="text-align:center;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="locationNm" value="" placeholder="처리중" style="text-align:center;" disabled>';	
					}	
				},
			},{data : 'areaNm',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="areaNm" value="'+data+' / '+row['floorCd']+'" style="text-align:center;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="areaNm" value="" placeholder="처리중" style="text-align:center;" disabled>';	
					}	
				},
			}, *//* {data : 'inWhsDesc',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="inWhsDesc" value="'+data+'" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="inWhsDesc" value="">';	
					}		    			
	    		}
			} */
		],  
		columnDefs: [
			//{ targets: [2,3] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' }
		],
        order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	}); 

	
	//인쇄항목 선택
	$(document).on('change','input:checkbox[name=printList]',function() {
		if($(this).is(':checked')) {
	    	var obj = new Object();
	    	obj.code = purchaseOrderTable.row('.selected').data().partCd;
	    	obj.rev = purchaseOrderTable.row('.selected').data().partRev;
	    	obj.item = purchaseOrderTable.row('.selected').data().partNm;
	    	obj.spec = purchaseOrderTable.row('.selected').data().partSpec;
	    	obj.date = inOutWhsAdmTable.row($(this).parents().parents()).data().preInWhsDate;
	    	obj.cnt = inOutWhsAdmTable.row($(this).parents().parents()).data().preInWhsQty;
	    	obj.barcodeNo = inOutWhsAdmTable.row($(this).parents().parents()).data().barcodeNo;
    		printArray.push(obj);
	    } else {
		    var barcodeNo = inOutWhsAdmTable.row($(this).parents().parents()).data().barcodeNo;
		    if(printArray.findIndex(i => i.barcodeNo == barcodeNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.barcodeNo == barcodeNo),1);
			}
		    
		}
	});



	//일자 일괄적용 버튼 클릭
	$('#btnBatchApply').on('click',function(){
		console.log("일자 일괄적용 버튼 클릭!");

		//예외처리
		if($('#batchPreInWhsDate').val()==""){
			toastr.warning("입고일자를 선택해주세요.");
			return false;
		}else{
			batchPreInWhsDateVal = $('#batchPreInWhsDate').val();
		}

		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("일괄적용할 발주항목을 체크해주세요.");
			return false;
		}

		$('#inOutWhsAdmTable tbody tr').each(function(index,item){
			if($(this).find('td input[name=printList]').is(":checked")){
				inSlipNo = inOutWhsAdmTable.row(index).data().inSlipNo;
				inSlipSeq = inOutWhsAdmTable.row(index).data().inSlipSeq;
				if(inSeq!=''){
					$.ajax({
						url : '<c:url value="io/statusCdCheck"/>',
						type : 'GET',
						data : {
							'inSlipNo' : function(){return inSlipNo},
							'inSlipSeq' : function(){return inSlipSeq},
						},
						success : function(res){
							if(res.result == "ok"){
								$('input[name=preInWhsDate]').eq(index).val(batchPreInWhsDateVal);
							}else if(res.result == "fail"){
								  toastr.warning(res.message);
							}else{
							    toastr.error(res.message);
							}
						}			
					});
				}else{
					$('input[name=preInWhsDate]').eq(index).val(batchPreInWhsDateVal);
				}
			}
		});
		$('#btnSave').removeClass('d-none');
	});

	
	//수정 버튼 클릭
	$('#btnDtlEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 발주항목을 선택해주세요.");
			return false;
		}
		
		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("수정할 발주항목을 체크해주세요.");
			return false;
		}

				
		$('#inOutWhsAdmTable tbody tr').each(function(index,item){
			if($(this).find('td input[name=printList]').is(":checked")){

				inSlipNo = inOutWhsAdmTable.row(index).data().inSlipNo;		//입고전표번호
				inSlipSeq = inOutWhsAdmTable.row(index).data().inSlipSeq;	//입고전표시퀀스
				
				if(inSlipNo!='' && inSlipNo!=null){
					$.ajax({
						url : '<c:url value="io/statusCdCheck"/>',
						type : 'GET',
						data : {
							'inSlipNo' : function(){return inSlipNo},
							'inSlipSeq' : function(){return inSlipSeq},
						},
						success : function(res){
							if(res.result == "ok"){
								if(res.data=="L"){
									toastr.warning("이미 승인되어 수정 할 수 없습니다.");
								}else if(res.data=="S"){
									$('button[name=preInWhsDateFromCalendar]').eq(index).attr('disabled',false);
									$('input[name=preInWhsQty]').eq(index).attr('disabled',false);
									$('input[name=lotNo]').eq(index).attr('disabled',false);
									$('button[name=btnLocationData]').eq(index).attr('disabled',false);
								}else if(res.data=="I"){
									$('button[name=btnLocationData]').eq(index).attr('disabled',false);
								}
							}else{
							    toastr.error(res.message);
							}
						}			
					});
				}else{
					toastr.warning('입고등록되지 않은 바코드번호입니다.');
				}
			}
		});

		$('#btnSave').removeClass('d-none');
	});
	
	
	//삭제 버튼 클릭
	$('#btnDtlDel').on('click', function() {
		var delRow = [];
		var delcount=0;
		var check=true;
		
		if (sideView != 'edit') {
			toastr.warning("삭제할 발주항목을 선택해주세요.");
			check=false;
			return false;
		}
		
		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("삭제할 발주항목을 체크해주세요.");
			check=false;
			return false;
		}

		
		$('#inOutWhsAdmTable tbody tr').each(function(index,item){
			if($(this).find('td input[name=printList]').is(":checked")){
				inSlipNo = inOutWhsAdmTable.row(index).data().inSlipNo;		//입고전표번호
				inSlipSeq = inOutWhsAdmTable.row(index).data().inSlipSeq;	//입고전표시퀀스
				
				if(inSlipNo!='' && inSlipNo!=null){

					sum+=parseInt($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));

					$.ajax({
						url : '<c:url value="io/preInOutWhsAdmDelete"/>',
						type : 'GET',
						data : {
							'inSlipNo' : function(){return inSlipNo},
							'inSlipSeq' : function(){return inSlipSeq},
						},
						async:false,
						success : function(res){
							if(res.result == "ok"){
								toastr.success("삭제되었습니다.");
								delRow[delcount] = index;
								delcount++;
							}else if(res.result == "fail"){
								  toastr.warning(res.message);
							}else{
							    toastr.error(res.message);
							}
						}			
					});
				}else{
					delRow[delcount] = index;
					delcount++;
				}
			}
		});

		$('#purchaseOrderTable').DataTable().ajax.reload(function(){});
		if(delRow.length>0){
			$('#checkAll').prop('checked',false);
			$('#inOutWhsAdmTable').DataTable().rows(delRow).remove().draw();
		}

		console.log("sum:"+sum);
		//$('#preInWhsQty').val($('#preInWhsQty').val()+sum);
		$('#diffQty').val(parseFloat($('#diffQty').val().replace(/,/g,''))+sum);
		sum=0;
	});


	// 저장 처리
	$('#btnSave').on('click',function() {

		var dataArray = new Array();		
		var check=true;  		

		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			sum+=parseInt($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
		});
		
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){

			if(inOutWhsAdmTable.data().count()!=0){
				
				if ($(this).find('td input[name=locationNo]').val()=="") {
					toastr.warning('창고를 입력해 주세요.');
					$(this).find('td button[name=btnLocationData]').focus();
					check = false;
					return false;
				}

				var rowData = new Object();
				
				rowData.inSlipNo = inOutWhsAdmTable.row(index).data().inSlipNo==null||inOutWhsAdmTable.row(index).data().inSlipNo=="undefined"?"":inOutWhsAdmTable.row(index).data().inSlipNo; ;
				rowData.inSlipSeq = inOutWhsAdmTable.row(index).data().inSlipSeq==null||inOutWhsAdmTable.row(index).data().inSlipSeq=="undefined"?"":inOutWhsAdmTable.row(index).data().inSlipSeq; ;
				rowData.poNo= poNo;
				rowData.poSeq = poSeq;
				rowData.inSeq = inOutWhsAdmTable.row(index).data().inSeq==null||inOutWhsAdmTable.row(index).data().inSeq=="undefined"?"":inOutWhsAdmTable.row(index).data().inSeq; 
				rowData.itemSeq= itemSeq;
				rowData.itemCd= itemCd;
				rowData.ordQty = ordQty;
				rowData.preInWhsDate = $(this).find("td input[name=preInWhsDate]").val().replace(/-/g,'');
				rowData.sum = sum;
				rowData.preInWhsQty = $(this).find("td input[name=preInWhsQty]").val().replace(/,/g,'');
				rowData.lotNo = $(this).find("td input[name=lotNo]").val();

				//창고 정보
				rowData.locationCd = $(this).find("td input[name=locationCd]").val();
				rowData.areaCd = $(this).find("td input[name=areaCd]").val();
				rowData.floorCd = $(this).find("td input[name=floorCd]").val();
				rowData.locationNo = $(this).find("td input[name=locationNo]").val();
				
		        dataArray.push(rowData);
		        console.log(rowData);
			}else{
				toastr.warning('입고수량을 입력해주세요');	
				$(this).find("td #packQty").focus();
				check=false;
				return false;
			}
		});
		
		if(check){
			$.ajax({
				url : '<c:url value="io/preInOutWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {		
					sum=0;		
					if (res.result == 'ok') {
						
						// 보기					
						$('#purchaseOrderTable').DataTable().ajax.reload(function() {});
						$('#inOutWhsAdmTable').DataTable().ajax.reload(function() {});
						$('#packQty').attr('disabled',true);
						$('#btnLotCreate').attr('disabled',true);

						$('#btnAdd').attr('disabled',false);
						//$('#btnEdit').attr('disabled',false);

						$('#btnDtlEdit').attr('disabled',true);
						$('#btnDtlDel').attr('disabled',true);
						$('#checkAll').prop('checked',false);
						$('#btnBatchApply').attr('disabled',true);
						toastr.success('저장되었습니다.');
						
						sideView = 'add';
						$('#btnSave').addClass('d-none');
					}else if(res.result == "fail"){
						toastr.warning(res.message);
					}
					else{
						toastr.error(res.message);
					}

					$('#my-spinner').hide();
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	

	function uiProc(flag) {
		$('input[name=lotNo]').attr('disabled',flag);
		$('input[name=srLot]').attr('disabled',flag);
		$('input[name=custItemCd]').attr('disabled',flag);
		$('input[name=custItemNm]').attr('disabled',flag);
		$('input[name=preInWhsQty]').attr('disabled',flag);
		$('input[name=inWhsDesc]').attr('disabled',flag);
		$("select[name=preInStatus]").attr("disabled", flag);
		$("button[name=inWhsDateFromCalendar]").attr("disabled",flag);
	}



	//입고수량 숫자만 입력하게 처리
	$(document).on('keyup',"#packQty", function(event){
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
	

	var temp = 0; 	// 출력 함수를 실행한 횟수
	var count = 0; 	// 3개씩 출력해야 되는 횟수
	var last = 0;	// 마지막 한번 출력할때의 라벨 갯수
	

	
	// 자재 바코드 인쇄
	/* function printPartBarcode(gubun){
		if(printArray.length == 0) {
			toastr.warning('인쇄할 자재를 체크하고 인쇄해주세요.');
			return false;
		}

		var item = '';
		var spec = '';
		var date = '';
		var cnt = '';

		var codeArray = new Array();
		var revArray = new Array();
		var barcodeNoArray = new Array();
		var printList = new Array();
		
		for(var i=0;i<printArray.length;i++) {
			for(var j=0;j<parseInt($('#partPrintCnt').val());j++) {
				printList.push(printArray[i]);
			}
		}
		
		if(gubun == 1) { // 기본인쇄
			var type = 'single';
			for(var i=0;i<printList.length;i++) {
				labelPrint(type,
						printList[i].code,
						printList[i].rev,
						printList[i].item,
						printList[i].spec,
						printList[i].date,
						printList[i].cnt,
						printList[i].barcodeNo);
			}
		} else if(gubun == 2) { // 개별인쇄
			var type = 'multi';
			for(var i=0;i<printList.length;i++) {
				if(printList.length == i+1 || i%3 == 2) {
					codeArray.push(printList[i].code);
					revArray.push(printList[i].rev);
					barcodeNoArray.push(printList[i].barcodeNo);
					labelPrint(type, codeArray, revArray, item, spec, date, cnt, barcodeNoArray);
					codeArray = [];
					revArray = [];
					barcodeNoArray = [];
				} else {
					codeArray.push(printList[i].code);
					revArray.push(printList[i].rev);
					barcodeNoArray.push(printList[i].barcodeNo);
				}
			}
		}
	} */
	// 바코드 인쇄 
	let printCnt = 0;
	//라벨인쇄 버튼 클릭
	$('#printLargeBarcode').on('click',function(){
		printCnt = $('#partPrintCnt').val();
		//예외처리
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

		    obj.itemCd = purchaseOrderTable.row(tableIdx).data().itemCd; //품번
		    obj.itemNm = purchaseOrderTable.row(tableIdx).data().itemNm; //품명
		    obj.dealCorpNm = purchaseOrderTable.row(tableIdx).data().dealCorpNm; //공급처
		    obj.itemUnitNm = purchaseOrderTable.row(tableIdx).data().itemUnitNm; //단위
		    obj.floorNm = purchaseOrderTable.row(tableIdx).data().floorNm; //창고
		    obj.areaCdNm = purchaseOrderTable.row(tableIdx).data().areaCdNm; //창고
		    obj.preInWhsDate = inOutWhsAdmTable.row(idx[1]).data().preInWhsDate; //입고일자
		    obj.preInWhsQty = parseFloat(inOutWhsAdmTable.row(idx[1]).data().preInWhsQty); //입고수량
		    obj.barcodeNo = inOutWhsAdmTable.row(idx[1]).data().barcodeNo; //바코드번호
		    obj.lotNo = inOutWhsAdmTable.row(idx[1]).data().lotNo; //lot번호
			if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "001"){
		    	obj.qaEval = "합 격"; //합불 판정
			} else if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "002" ) {
				obj.qaEval = "불합격"; //합불 판정
			} else if ( inOutWhsAdmTable.row(idx[1]).data().qaEval == null ){
				obj.qaEval = "미판정"; //합불 판정
			}
	    	for( let i = 1; i <= printCnt; i++){
		    	if(inOutWhsAdmTable.row(idx[1]).data().approvalCd == '001' && obj.qaEval != '미판정') {
					labelPrint(obj,"")
		    	}
			}

	    	$.ajax({
				url : '<c:url value="/io/preInOutWhsAdmLabelPrint"/>',
				type : 'GET',
				data : {
					'inSlipNo' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipNo; },
					'inSlipSeq' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipSeq; }
				},
				success : function(res) {
				}
			});

		    
		});
	});
	
	// 창고 팝업 시작
	var locationPopupTable;
	function locationDataClick() {
		if (locationPopupTable != null && locationPopupTable != 'undefined') {
			locationPopupTable.destroy();
		}
		
		locationPopupTable = $('#locationPopupTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
			async : false,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/locationAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : '001'
				},
			},
			columns : [ 
				{
					data : 'mainGubunNm' 
				},
				{
					data : 'locNo' , 
						render : function(data, type, row, meta){
							if(data!=null){
								return data;
							} else{
								return '-';
							}
						}
				}, 
				{
					data : 'locNm'
				}, 
				{
					data : 'areaNm'
				}, 
				{
					data : 'floorNm'
				}, 
				{
					data : 'useYnNm'
				}, 
				{
					data : 'locDesc'
				},  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();
			$('input[name=locationData]').eq(tableIdx2).val(data.locNm + "/" + data.areaNm + "/" + data.floorNm);
			$('input[name=locationCd]').eq(tableIdx2).val(data.locCd);
			$('input[name=areaCd]').eq(tableIdx2).val(data.areaCd);
			$('input[name=floorCd]').eq(tableIdx2).val(data.floorNm);
			$('input[name=locationNo]').eq(tableIdx2).val(data.locNo);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	$('#inOutWhsAdmTable tbody').on('click', 'tr', function(){
		tableIdx2 = $('#inOutWhsAdmTable').DataTable().row(this).index();
	});

</script>
<script>

//Do printing...
/* function labelPrint(type, code, rev, item, spec, date, cnt, barcodeNo) {

	if(type == 'single') { // 기본인쇄
		var cmds =  "1";
	 		cmds += "34#$";
	 		cmds += "^XA";
	 		cmds += "^PRD";
	 		cmds += "^SEE:UHANGUL.DAT^FS";
	 		cmds += "^CW1,E:KFONT3.FNT^CI26^FS";		
	 		cmds += "^FO70,10^GB200,73,3^FS";
	 	    cmds += "^FO100,35^A1N,30,30^FDCODE NO^FS";		    
	 		cmds += "^FO70,80^GB200,73,3^FS";
	 	    cmds += "^FO110,105^A1N,30,30^FDI T E M^FS";		    
	 		cmds += "^FO70,150^GB200,73,3^FS";
	 	    cmds += "^FO110,175^A1N,30,30^FDS P E C^FS";		    
	 		cmds += "^FO70,220^GB200,73,3^FS";
	 	    cmds += "^FO85,245^A1N,25,25^FD입고일자/수량^FS";		    
	 		cmds += "^FO70,290^GB700,73,3^FS";
	 	if(barcodeNo.length > 13) {
	 		cmds += "^FO150,297^BY2,3^BCN,40,Y,N,Y^FD" + barcodeNo + "^FS";
		} else {
			cmds += "^FO250,297^BY2,3^BCN,40,Y,N,Y^FD" + barcodeNo + "^FS";
		}
	 		cmds += "^FO267,10^GB503,73,3^FS";
	 	    cmds += "^FO282,35^A1N,30,30^FD" + code + "^FS";			
	 		cmds += "^FO267,80^GB503,73,3^FS";
	 	    cmds += "^FO282,105^A1N,30,30^FD" + item + "^FS";			
	 		cmds += "^FO267,150^GB503,73,3^FS";
	 	    cmds += "^FO282,175^A1N,30,30^FD" + spec + "^FS";		
	 		cmds += "^FO267,220^GB503,73,3^FS";
	 	    cmds += "^FO282,245^A1N,30,30^FD" + moment(date).format('YYYY.MM.DD') + "    /    " + cnt + "^FS";		
	 		cmds += "^XZ";
 		sendMessage(cmds);
	} else if(type == 'multi') { // 개별인쇄
		
		var cmds =  "";
			cmds += "2";
			cmds += "34#$";
			cmds += "^XA";
			cmds += "^PRD";
			cmds += "^SEE:UHANGUL.DAT^FS";
			cmds += "^CW1,E:KFONT3.FNT^CI26^FS";
		for(var i=0;i<code.length;i++) {
			if(i==0) {
				cmds += "^FO152,12^GB153,192,2^FS";
				cmds += "^FO152,12^GB153,25,2^FS";
				cmds += "^FO152,57^GB153,25,2^FS";
				cmds += "^FO152,57^GB70,25,2^FS";
				cmds += "^FO198,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO165,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO167,60^A1N,20,20^FDREV^FS";
				cmds += "^FO225,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO180,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			} else if(i==1) {
				cmds += "^FO335,12^GB153,192,2^FS";
				cmds += "^FO335,12^GB153,25,2^FS";
				cmds += "^FO335,57^GB153,25,2^FS";
				cmds += "^FO335,57^GB70,25,2^FS";
				cmds += "^FO381,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO348,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO350,60^A1N,20,20^FDREV^FS";
				cmds += "^FO408,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO363,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			} else {
				cmds += "^FO520,12^GB153,192,2^FS";
				cmds += "^FO520,12^GB153,25,2^FS";
				cmds += "^FO520,57^GB153,25,2^FS";
				cmds += "^FO520,57^GB70,25,2^FS";
				cmds += "^FO566,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO533,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO535,60^A1N,20,20^FDREV^FS";
				cmds += "^FO593,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO548,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			}
		}
			cmds += "^XZ";
			
			sendMessage(cmds);
			console.log('라벨인쇄');
	}
}
 */
	 function labelPrint(data, action) {
		   console.log("data:"+data.itemCd);
		   let cmds = {};
		   
		   let cmd = "";
		      cmd += "{D0520,0980,0500|}";
		      cmd += "{AY;+04,0|}";
		      cmd += "{AX;-020,+000,+00|}";
		      cmd += "{C|}";
		
		      //행
		      cmd += "{LC;0010,0035,0980,0110,1,5|}";
		      cmd += "{LC;0010,0035,0980,0180,1,5|}";
		      cmd += "{LC;0010,0035,0980,0250,1,5|}";
		      cmd += "{LC;0010,0035,0980,0320,1,5|}";
		      cmd += "{LC;0010,0035,0980,0485,1,5|}";
		
		      //열
		      cmd += "{LC;0155,0035,0155,0320,0,5|}";
		      cmd += "{LC;0335,0180,0335,0320,0,5|}";
		      cmd += "{LC;0490,0180,0490,0320,0,5|}";
		      cmd += "{LC;0640,0180,0640,0320,0,5|}";
		      cmd += "{LC;0795,0180,0795,0320,0,5|}";
		      
		      //데이터
		      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
		      cmd += "{PV23;0170,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
		      cmd += "{PV23;0045,0160,0040,0040,01,0,00,B=품명|}";
		      cmd += "{PV23;0170,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
		      cmd += "{PV23;0030,0230,0040,0040,01,0,00,B=입고일|}";
		      cmd += "{PV23;0170,0230,0035,0035,01,0,00,B="+moment(data.preInWhsDate).format('YYYY.MM.DD')+"|}"; 
		      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=입고수량|}";
		      cmd += "{PV23;0170,0300,0035,0035,01,0,00,B="+data.preInWhsQty+" "+data.itemUnitNm+"|}";
		      cmd += "{PV23;0345,0230,0040,0040,01,0,00,B=합부판정|}";
		      cmd += "{PV23;0517,0230,0040,0040,01,0,00,B="+data.qaEval+"|}";
		      cmd += "{PV23;0345,0300,0040,0040,01,0,00,B=업체로트|}";
		      if (data.lotNo != null) {
		      cmd += "{PV23;0505,0300,0035,0035,01,0,00,B="+data.lotNo+"|}";
		      }
		      cmd += "{PV23;0681,0230,0040,0040,01,0,00,B=창고|}";
		      if (data.areaCdNm != null) {
		      	cmd += "{PV23;0810,0230,0035,0035,01,0,00,B="+data.areaCdNm + '/' + data.floorNm+"|}";
		      }
		      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=업체명|}";
		      cmd += "{PV23;0810,0300,0035,0035,01,0,00,B="+data.dealCorpNm+"|}";
		      cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
		      cmd += "{RB03;"+data.barcodeNo+"|}";
		      cmd += "{XS;I,0001,0002C4001|}";
		
		   cmds.cmd = cmd; // 인쇄 명령어
		   cmds.action = action; // 동작
		
		   sendMessage(JSON.stringify(cmds)); // 전송
		}
 
</script>

<script>
	
	//웹 서버를 접속한다.
	var webSocket = new WebSocket("ws://localhost:9998");
	// 웹 서버와의 통신을 주고 받은 결과를 출력할 오브젝트를 가져옵니다.
	var messageTextArea = document.getElementById("installedPrinterName");
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
		toastr.success('인쇄 서버에 연결되었습니다.')
		$('#wsStateView').text('연결됨');
		$('#wsStateView').css('color','#19FF00');
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
		toastr.error('인쇄 서버가 종료되었습니다.')
		$('#wsStateView').text('연결끊김');
		$('#wsStateView').css('color','#FF0004');
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
			//webSocket = new WebSocket("ws://localhost:9998");
		}
	}

</script>
   	

</body>
</html>
