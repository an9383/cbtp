<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 거래처 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="dealCorpPopUpLabel">발주처조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="dealCorpPopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">발주처</th>
									<th style="width : 15%">발주처코드</th>
									<th style="width : 25%">대표자</th>
									<th style="width : 15%">대표품목</th>
									<th style="width : 25%">사업자번호</th>
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
	<!-- 거래처 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">소요량분석(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 35%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search openbtn" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="row mb-3">
						<label class="input-label-sm">일자</label>
						<div class="form-group input-sub m-0 row">
							<input class="form-control" style="width: 97px;" type="text"id="mrpDateFrom" name="mrpDateFrom" disabled />
							<button onclick="fnPopUpCalendar(mrpDateFrom,mrpDateFrom,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="mrpDateFromCalendar" type="button">
								<span class="oi oi-calendar"></span>
							</button>
						</div>
						&nbsp;~ &nbsp;
						<div class="form-group input-sub m-0 row">
							<input class="form-control" style="width: 97px;" type="text" id="mrpDateTo" name="mrpDateTo" disabled />
							<button onclick="fnPopUpCalendar(mrpDateTo,mrpDateTo,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="mrpDateToCalendar" type="button">
								<span class="oi oi-calendar"></span>
							</button>
						</div>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label class="input-label-sm">상태조건 :</label> &nbsp;&nbsp;
						<select id="statusOption" class="custom-select" style="width:75px;">
							<option value="">전체</option>
							<option value="002" selected>미확정</option>
							<option value="001">확정</option>
						</select>
					</div>

					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="bizOrderAdmTable" class="table table-bordered">
							<colgroup>
								<col width="12%">
								<col width="13%">
								<col width="25%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>년도</th>
									<th>월</th>
									<th>소요량번호</th>
									<th>담당자</th>
									<th>비고</th>
									<th>상태</th>									
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
				style="width: 64%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 pb-2">
						<button type="button" class="btn btn-primary float-left" id="btnMonSalesPlan">월생산계획 조회</button>
						<button type="button" class="btn btn-warning float-left ml-1" id="btnConsumptEdit" disabled>수정</button>
						<button type="button" class="btn btn-danger float-left ml-1" id="btnConsumptDel" disabled>삭제</button>
						<button type="button" class="btn btn-primary float-left ml-1 d-none" id="btnSave">저장</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body p-0">
						
						
					</div>
					<hr>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="table-responsive">
								<table id="bizOrderConsumptTable" class="table table-bordered">
									<colgroup>
										<col width="5%">
										<col width="13%">
										<col width="16%">
										<col width="18%">
										<col width="12%">
										<col width="12%">
										<col width="12%">
										<col width="12%">
									</colgroup>
									<thead>
										<tr>	
											<th>
												<input type="checkbox" id="btnAllCheck">
											</th>
											<th>공급사</th>								
											<th>품번</th>
											<th>품명</th>
											<th>월계획수량</th>
											<th>현재고수량</th>
											<th>예상수량</th>
											<th>확정수량</th>				
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
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
					<h6>소요량분석(정밀가공) 새로고침/수정 방식을 선택해주세요. </h6>
				</div>
				<div class="modal-footer">
			      	<button type="button" class="btn btn-warning " id="btnConsumptReset" data-dismiss="modal">새로고침</button>
			      	<button type="button" class="btn btn-warning " id="btnConsumptEdit_none" data-dismiss="modal">수정</button>
			      	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	<!-- Modal Start-->
	<div class="modal fade bd-example-modal-lg" id="mrpAddModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby=""mrpAddModal="" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
			        <h5 class="modal-title" id="confirmSaveModalLabel">소요량번호 등록</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
		      	</div>
				<div class="modal-body">
					<!-- .table-responsive -->
					<div class="table-responsive">		
						<form id="form">					
						<table id="bizOrderMrpTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>소요량번호</th>
									<td>
										<input class="form-control" style="max-width: 100%; text-align:center;"	type="text" id="mrpNo" name="mrpNo" maxlength="10" placeholder="자동생성" disabled />
									</td>
									<th>담당자</th>
									<td>
										<div class="input-sub m-0" style="max-width: 100%">
											<input type="hidden" class="form-control"style="max-width: 100%" id="mrpChargr"name="mrpChargr" disabled> 
											<input type="text"class="form-control" style="max-width: 100%"id="mrpChargrNm" name="mrpChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search"name="btnMrpChargr" id="btnMrpChargr" onClick="selectMrpChargr();">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>년/월</th>
									<td>
										<div class="row">
											<select name="mrpYear" id="mrpYear" title="년도" class="col-4 custom-select mr-2 ml-3"></select>
											<label class="input-label-sm">년</label>
  											<select name="mrpMon" id="mrpMon" title="월" class="col-4 custom-select mr-2"></select>
  											<label class="input-label-sm">월</label>
										</div>
									</td>
									
									<th>소요량 등록일</th>
									<td>
										<input type="date" class="form-control" id="mrpDate" name="mrpDate" style="min-width: 100%;">
									</td>
								</tr>
								<!-- <tr>
									<th>구분</th>
									<td>
										<div class="row">
		                                 	<div class="custom-control custom-radio row">
		                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" disabled> 
		                                    	<label class="custom-control-label input-label-sm" for="mg1">사출</label>
		                                 	</div>
		                                 	<div class="custom-control custom-radio row">
		                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" disabled> 
		                                    	<label class="custom-control-label input-label-sm" for="mg2">후가공</label>
		                                	</div>
		                            	</div>
									</td>
								</tr> -->
								<tr>
									<th>비고</th>
									<td colspan="3">
										<input type="text" class="form-control"style="max-width: 100%" maxlength="110" id="mrpDesc"name="mrpDesc">
									</td>
								</tr>
							</thead>
						</table>
						</form>
						
					</div> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary float-right" id="btnSaveMrp">저장</button>
			      	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	<!-- Modal Start-->
	<div class="modal fade bd-example-modal-xl" id="monSalesPlanModal"tabindex="-1" role="dialog" aria-labelledby="monSalesPlanLabel"aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmSaveModalLabel">월 생산계획 조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-primary d-none" id="btnItemAdd">품목추가</button>
					<div class="table-responsive">
						<table id="monSalesPlanTable" class="table table-bordered" style="width:100%">
							<colgroup>
								<col width="5%">
 								<%-- <col width="10%">  --%>
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<%-- <col width="17%"> --%>
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">
										<input type="checkbox" id="checkAll" name="checkAll">
									</th>
									<th class="text-center">업체코드</th>
									<th class="text-center">품목구분</th>
									<th class="text-center">고객사</th>
									<th class="text-center">품번</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">월계획수량</th>
									<th class="text-center">현재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<hr class="m-2 d-none">
					<button type="button" class="btn btn-danger d-none" id="btnItemRemove">품목삭제</button>
					<div class="table-responsive d-none">
						<table id="monSalesPlanTempTable" class="table table-bordered" style="width:100%">
							<colgroup>
								<col width="3%">
								<col width="10%">
								<col width="15%">
								<col width="12%">
								<col width="15%">
								<col width="20%">
								<col width="12%">
								<col width="13%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">
										<input type="checkbox" id="checkAll2" name="checkAll2">
									</th>
									<th class="text-center">업체코드</th>
									<th class="text-center">업체명</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">현재고</th>
									<th class="text-center">월계획수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnConsumptAnalz">소요량분석(정밀가공)</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "35%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "iosc0400";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "소요량분석(정밀가공)");


	//열고 닫힘 버튼 클릭시 소요량번호 열row 변경
	$('.openbtn, .closebtn').on('click',function(){
		console.log('dd');
		$('#bizOrderAdmTable').DataTable().ajax.reload(function(){});
	});

	uiProc(true);
	let sideView = 'add';
	var serverDateFromCal="${serverDateFrom}";
	var serverDateToCal="${serverDateTo}";
	var serverDateTo="${serverDateTo}";

	var userNumber="${userNumber}";
	var userNm="${userNm}";
	
	var tableIdx=null;
	var itemCd;
	var mrpNo=null;
	var mrpSeq=null;
	var mrpYear=null;
	var mrpMon=null; 
	var mrpDate=null; 
	var confirmYn=null;
	var mrpChargr=null; 
	var mrpChargrNm=null;
	var mrpDesc=null;
	var ordCorpCdVal=null;
	var confirmIndex=null;
	var itemSeqArray= new Array();		//품번 배열
	var status = "";				//소요량분석(후가공) 목록조회시 조건
	var statusOptionVal = '002'; 		//소요량분석(후가공) 상태값
	var itemSeqVal=null;
	var dealGubun = "";
	var reloadCheck = "noReload";
	var tempPurPredQty = 0;

	//년/월 날짜
  	var dt = new Date();
    var year = "";
    var com_year = dt.getFullYear();
    var mon = dt.getMonth()+1;

    var prodYear = com_year;
    var prodMon = mon;

  	//공통코드 처리 시작
	let prodGubunArray = new Array();
	<c:forEach items="${prodGubunList}" var="info">
	var baseNm = "${info.baseNm}";
	if ( baseNm.includes('외주') ) {
		prodGubunArray.push("${info.baseCd}");
	}
	</c:forEach>
	//공통코드 처리 끝
	

	 var html1 = '<div class="input-sub m-0">';
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="hidden" class="form-control" id="itemCd" name="itemCd" disabled> '; 
	    html1 += '&nbsp;<input type="text"class="form-control" id="itemRev" name="itemRev" disabled>';
	    html1 += '<button type="button"class="btn btn-primary input-sub-search"name="btnItemCd" id="btnItemCd" onClick="selectItemCd();" disabled>';
	    html1 += '<span class="oi oi-magnifying-glass"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    
		$('#bizOrderAdmPopupTable_length').html(html1);
		
	//저장여부 모달
	$('#saveBtnModalY').on('click', function() {
		$('#btnSave').addClass('d-none');
		$('#btnOrdCorpCd').attr('disabled', true);
		$('#btnOrdCorpChange').attr('disabled', true);
		$('#saveStock').attr('disabled', true);
		$('#saveStockChange').attr('disabled', true);
		$('#btnAllCheck').prop('checked',false);
		bizOrderConsumptTable.clear().draw();
		
		$('#btnConsumptEdit').attr('disabled', true);
		$('#btnConsumptDel').attr('disabled', true);
	});

	//확정여부 모달
	$('#confirmSaveModalY').on('click', function() {
		$('#btnAllCheck').prop('checked',false);
		confirmIndex = $('#bizOrderAdmTable tbody .selected').index();
		statUpdate(confirmIndex,'001');
	});

	$('#confirmSaveModalN').on('click', function() {
		$('#btnAllCheck').prop('checked',false);
		$('#tab1Nav').trigger('click');
	});

	//소요량분석(후가공) 상세 목록조회
	let bizOrderAdmTable = $('#bizOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-11 col-md-6 mr-4'l><'col-sm-11 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		fixedHeader: true,
		scrollY: "600px",
		scrollCollapse: true,
		pageLength : 10000,
		ajax : {
			url : '<c:url value="bs/bizOrderMrpList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFromCal.replace(/-/g, '');	},
				'endDate' : function() {return serverDateToCal.replace(/-/g,'');},
				'confirmYn' : function() {return statusOptionVal;},
				'mainGubun' : function() {return '002';},
			}
		},
		rowId : 'mrpNo',
		columns : [
			{
				data : 'mrpYear',
				render : function(data, type, row, meta) {
					return data+"년";
				}
			},
			{
				data : 'mrpMon',
				render : function(data, type, row, meta) {
					return data+"월";
				}
			},
			{
				data : 'mrpNo'
			},
			{
				data : 'mrpChargrNm'
			},
			{
				data : 'mrpDesc'
			},
			{
				data : 'confirmYn',
				render : function(data, type, row, meta) {
					var result = data;
					if(data == '002'){
						result = '<button type="button" name="confirmYn_'+meta.row+'" onclick="statUpdate('+meta.row+',\'001\')" class="btn btn-danger">미확정</button>';
					} else if(data == '003'){
						result = '<button type="button" name="confirmYn" class="btn btn-success" disabled>발주완료</button>';
					} else{
						result = '<button type="button" name="confirmYn" onclick="statUpdate('+meta.row+',\'002\')" class="btn btn-success">확정취소</button>';
					}
					
					return result;
				}
			},		
		],
		order: [
	        //[ 0, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

    var html1 = '<div class="row">';
    html1 += '&nbsp;<button type="button" class="btn btn-primary" id="btnAdd">추가</button>';
    html1 += '&nbsp;<button type="button" class="btn btn-warning" id="btnEdit">수정</button>';
    html1 += '&nbsp;<button type="button" class="btn btn-danger" id="btnDel">삭제</button>';
    html1 += '</div>';

	$('#bizOrderAdmTable_length').html(html1);
	
	$('#mrpDateFrom').val(serverDateFromCal);
	$('#mrpDateTo').val(serverDateToCal);
	
	$('#btnRetv').on('click', function() {
		serverDateFromCal =  $('#mrpDateFrom').val();
    	serverDateToCal =  $('#mrpDateTo').val();
		$('#bizOrderAdmTable').DataTable().ajax.reload( function () {});
    });	

	
	$('#statusOption').on('change', function() {
		serverDateFromCal =  $('#mrpDateFrom').val();
    	serverDateToCal =  $('#mrpDateTo').val();
    	statusOptionVal =  $('#statusOption option:selected').val();
		$('#bizOrderAdmTable').DataTable().ajax.reload( function () {});
    });	
	
	//소요코드 클릭시 
	$('#bizOrderAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-left ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#bizOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#bizOrderAdmTable').DataTable().row(this).index();
		
		mrpNo = bizOrderAdmTable.row(this).data().mrpNo;
		mrpSeq = bizOrderAdmTable.row(this).data().mrpSeq;
		mrpYear = bizOrderAdmTable.row(this).data().mrpYear;
		mrpMon = bizOrderAdmTable.row(this).data().mrpMon;
		mrpDate = bizOrderAdmTable.row(this).data().mrpDate;
		confirmYn = bizOrderAdmTable.row(this).data().confirmYn;	
		mrpChargr = bizOrderAdmTable.row(this).data().mrpChargr;
		mrpChargrNm = bizOrderAdmTable.row(this).data().mrpChargrNm	;
		mrpDesc = bizOrderAdmTable.row(this).data().mrpDesc;
		status = 'read';		//소요량클릭시 소요량분석(후가공) 목록조회 조건
		sideView = "edit";
		
		
		$.ajax({
			url : 'bs/bizOrderConsumptList',
			type : 'GET',
			async : false,
			data : {	
				'mrpNo' : function(){return mrpNo;},
				'mrpSeq' : function(){return mrpSeq;},
				'salesYear' : function(){return mrpYear;},
				'salesMon' : function(){return mrpMon;},
				'itemSeqArray' : function(){return itemSeqArray;},
				'reloadCheck' : function(){return reloadCheck;},
			},
			success : function(res) {
				let editCheck = res.editCheck;
				
				if(editCheck){
					$('#btnConsumptEdit').attr('disabled', false);
				} else {
					$('#btnConsumptEdit').attr('disabled', true);
				}
			}
			
		});

		$('#btnAllCheck').attr('disabled',true);

		if(confirmYn == "001"){
			$('#btnMonSalesPlan').attr('disabled', true);
		}else{
			$('#btnMonSalesPlan').attr('disabled', false);
		}

		itemSeqArray = [];	//자재목록 초기좌
		
		//수주상세번호 목록조회
		$('#bizOrderConsumptTable').DataTable().ajax.reload(function(){});  
		
		$('#btnSave').addClass('d-none');
	});


	//소요량 코드 등록버튼 click
	$('#btnAdd').on('click', function(){
		$('#form').each(function(){
        	this.reset();
    	});

		$('#mrpAddModal').modal('show');
		sideView = "add";
		$('#mrpYear').val(prodYear).attr('selected',true);
		$('#mrpMon').val(prodMon<10?"0"+prodMon:prodMon).attr('selected',true);
		$('#mrpYear').attr('disabled',false);
		$('#mrpMon').attr('disabled',false);
		$('#mrpChargr').val(userNumber);
		$('#mrpChargrNm').val(userNm);
    	$('#mrpDate').val(serverDateTo);
	});

	//소요량 코드 수정버튼 click
	$('#btnEdit').on('click', function(){
		if(!$('#bizOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("수정할 목록을 선택해 주세요");
			return false;
		}

		$('#mrpNo').val(mrpNo);	
		$('#mrpYear').val(mrpYear).attr('selected',true);
		$('#mrpMon').val(mrpMon).attr('selected',true);
		$('#mrpDate').val(moment(mrpDate).format("YYYY-MM-DD"));	
		$('#mrpChargr').val(mrpChargr);	
		$('#mrpChargrNm').val(mrpChargrNm);	
		$('#mrpDesc').val(mrpDesc);	

		$('#mrpYear').attr('disabled',true);
		$('#mrpMon').attr('disabled',true);
		
		$('#mrpAddModal').modal('show');
		sideView = "edit";
	});

	//소요량 코드 삭제버튼 click
	$('#btnDel').on('click', function(){

		if(!$('#bizOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("삭제할 목록을 선택해 주세요");
			return false;
		}

		if(confirmYn == "001"){
			toastr.warning("확정된 소요량번호는 삭제할 수 없습니다.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bs/bizOrderMrpDelete"/>',
			type : 'POST',
			data : {
				'mrpNo' 	: 	function(){return mrpNo;},		
				'mrpSeq'  	: 	function(){return mrpSeq;},		
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
	                toastr.success('삭제되었습니다.');
					$('#bizOrderAdmTable').DataTable().ajax.reload();
					$('#bizOrderConsumptTable').DataTable().ajax.reload();
					bizOrderConsumptTable.clear().draw();
				} else {
					toastr.error(res.message);
				}
			},
		});
	});
	
	//월생산계획 삭제
	$('#btnConsumptDel').on('click', function() {
		var itemDelCheck = true;
		var mrpNo = null;
		var mrpSeq;
		var itemSeq;
		$('#bizOrderConsumptTable tbody tr').each(function(index, item){
			if ($(this).find('td input[name=check3]').is(":checked") == true) {
				itemDelCheck = false;
				mrpNo = bizOrderConsumptTable.row(this).data().mrpNo;
				mrpSeq = bizOrderConsumptTable.row(this).data().mrpSeq;
				itemSeq = bizOrderConsumptTable.row(this).data().itemSeq;
				var tableIdx = $('#bizOrderConsumptTable').DataTable().row(this).index();
				
				if(mrpNo != null && mrpNo != undefined){
					$.ajax({
						url : '<c:url value="bs/bizOrderConsumptDelete"/>',
						type : 'POST',
						async : false,
						data :{
							'mrpNo' 	: 	function(){return mrpNo;},		
							'mrpSeq'  	: 	function(){return mrpSeq;},	
							'itemSeq'  	: 	function(){return itemSeq;},	
							'deleteCheck'  	: 	function(){return 'deleteCheck';},	
						},
						success : function(res) {
							let data = res.result;
							if (res.result == 'ok') {
							}else {
								toastr.error(res.message);
							}
						}
					});
				}
				$('#bizOrderConsumptTable').DataTable().rows(tableIdx).remove().draw();
			}
			
		});
		
		if (itemDelCheck) {
			toastr.warning("삭제할 품목을 선택해 주세요.");
			return false;
		}
		
		if(mrpNo != null && mrpNo != undefined){
			toastr.success('삭제되었습니다.');
		}
		
		$('#btnAllCheck').prop('checked', false);
		
	});
	

	//삭제모달 예 클릭 시
	$('#btnDeleteConfirmY').on('click', function(){
		
	});

	//소요량 코드 저장버튼 click
	$('#btnSaveMrp').on('click',function() {
		var url;
		if (sideView == "add") {
			url = '<c:url value="/bs/bizOrderMrpCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bs/bizOrderMrpUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'mrpNo' 		: 	$('#mrpNo').val(),
				'mrpSeq'  		: 	function(){return mrpSeq;},			
				'mainGubun'  	: 	'002',
				'mrpYear'  		: 	$('#mrpYear option:selected').val(),
				'mrpMon'  		: 	$('#mrpMon option:selected').val(),
				'mrpDate'  		: 	$('#mrpDate').val().replace(/-/g,""),
				'mrpChargr'  	: 	$('#mrpChargr').val(),
				'mrpDesc' 	    : 	$('#mrpDesc').val(),			
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if( sideView == "edit" ) {
	                	toastr.success('수정되었습니다.');
                    }else{
                        toastr.success('등록되었습니다.');
                    } 
					$('#mrpAddModal').modal('hide');
					$('#bizOrderAdmTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
			}
		});

	});

	//소요량 코드 확정버튼 click
	function statUpdate(row,data) {	
		if(row!=null){
			mrpNo = bizOrderAdmTable.row(row).data().mrpNo;
			mrpSeq = bizOrderAdmTable.row(row).data().mrpSeq;

			$.ajax({
				url : '<c:url value="/bs/bizOrderMrpConfirm"/>',
				type : 'POST',
				data : {
					'mrpNo' 		: 	function(){return mrpNo;},
					'mrpSeq'  		: 	function(){return mrpSeq;},			
					'confirmYn'  	: 	function(){return data;},							
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success(res.message);
		                //statusOptionVal = data;
		                //$('#statusOption').val(data);		
						$('#bizOrderAdmTable').DataTable().ajax.reload();
						$('#bizOrderConsumptTable').DataTable().clear().draw();	//오른쪽 테이블 초기화
					}else if(res.result == 'fail'){
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	}

	//var monSalesPlanTable;
	//월 판매계획 조회 버튼 클릭
	$('#btnMonSalesPlan').on('click',function(){
		if(!$('#bizOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("소요량번호를 선택해 주세요.");
			return false;
		}

		monSalesPlanPopupView();
	});

	//소요량분석(후가공) 경고창 수정버튼 click
	$('#btnConsumptEdit').on('click',function(){
		
		//화면 처리
		$('#btnConsumptDel').attr('disabled', false);
		$('#saveStock').attr('disabled', false);
		$('#saveStockChange').attr('disabled', false);
		$('#btnOrdCorpCd').attr('disabled', false);
		$('#btnOrdCorpChange').attr('disabled', false);
		$('#btnSave').removeClass('d-none');
		
		$('input[name=ordPredQty]').attr('disabled',false);			//발주예정수량
		$('input[name=stockUseYn]').attr('disabled',false);			//재고사용
		
		$('input[name=check3]').attr('disabled',false);			
		$('#btnAllCheck').attr('disabled',false);
	});

	
	//소요량분석(후가공) 경고창 새로고침 click
	$('#btnConsumptReset').on('click',function(){
		if(mrpYear == ""){
			mrpYear = $('#bizOrderAdmTable').DataTable().$('tr.selected').attr('id').substring(1,5);
		}
		if(mrpMon == ""){
			mrpMon = $('#bizOrderAdmTable').DataTable().$('tr.selected').attr('id').substring(5,7);
		}

		status="list";
		
		//화면 처리
		$('#saveStock').attr('disabled', false);
		$('#saveStockChange').attr('disabled', false);
		$('#btnOrdCorpCd').attr('disabled', false);
		$('#btnOrdCorpChange').attr('disabled', false);
		$('#btnSave').removeClass('d-none');
		
		$('input[name=ordPredQty]').attr('disabled',false);			//발주예정수량
		$('input[name=stockUseYn]').attr('disabled',false);			//재고사용
		$('#btnAllCheck').attr('disabled',false);
		

		//$('#bizOrderConsumptTable').DataTable().clear().draw();

		monSalesPlanPopupView();
		
	});
	

	function monSalesPlanPopupView(){
		//전체선택 해제
		$('#checkAll').prop('checked', false);	
		$('#checkAll2').prop('checked', false);	
		$('input[name=check]').prop("checked", false); 
		$('input[name=check2]').prop("checked", false); 
		$('#btnAllCheck').prop("checked", false); 
		
		$('#monSalesPlanModal').modal('show');

		$('#monSalesPlanTable').DataTable().ajax.reload(function(){});
		$('#monSalesPlanTempTable').DataTable().ajax.reload(function(){});
		setTimeout(function() {
				monSalesPlanTable.draw();
				monSalesPlanTempTable.draw();
        }, 150);
		
	}


	//월생산계획 조회
	let monSalesPlanTable = $('#monSalesPlanTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000,
	    scrollY: "400px",
		ajax : {
			url : 'bs/bsMonProdPlanAdmList',
			type : 'GET',
			data : {
				'mainGubun' : function(){return '002';},
				'salesYear' : function(){return mrpYear;},
				'salesMon' : function(){return mrpMon;},
				'confirmYn' : '001',
				'urlData' : '',
			}
		},
		rowId : 'contNo',
		columns : [ 
			{
				render: function(data, type, row, meta) {	
					return '<input type="checkbox" name="check" />';
				}	
			},
			{
				data : 'itemCus'
			}, 
			{
				data : 'itemGubunNm'
			},
			{
				data : 'itemCusNm'
			}, 
			{
				data : 'itemCd',
				render : function(data,type,row,meta){
					var html = '<input type="text" name="itemCd" value="'+data+'" style="background: white;border: none; text-align:center;" disabled/>';
					html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'"/>';
					return html;
				}
			}, 
			{
				data : 'itemCd'
			}, 
			{
				data : 'itemNm'
			}, 
			{
				data : 'salesPlanQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},'className' : 'text-right'
			},  
			{
				data : 'tmQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},'className' : 'text-right'
			},  
		],
		columnDefs : [ 
			{"targets" : '_all' , "className" : "text-center"},
			{ "visible": false, "targets": [1,5] }
		],
		order : [ [ 0, 'asc' ] ],
		
	});

	
	let monSalesPlanTempTable = $('#monSalesPlanTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000,
		scrollY : "240px",
		ajax : {
			url : 'bs/monSalesPlanAdmList',
			type : 'GET',
			data : {
				'salesYear' : '',
				'salesMon' : '',
				'confirmYn' : '',
				'urlData' : '',
			}
		},
		rowId : 'contNo',
		columns : [ 
			{
				render: function(data, type, row, meta) {	
					return '<input type="checkbox" name="check2" />';
				}	
			},
			{
				data : 'itemCus'
			}, {
				data : 'itemCusNm'
			}, {
				data : 'itemModel'
			}, {
				data : 'itemCd',
				render : function(data,type,row,meta){
					var html = '<input type="text" name="itemCd" value="'+data+'" style="background: white;border: none; text-align:center;" disabled/>';
					html += '<input type="hidden" name="itemSeq" value="'+itemSeqVal+'"/>';
					return html;
				}
			}, {
				data : 'itemNm'
			}, {
				data : 'salesPlanQty'
				,'className' : 'text-right'
			}, {
				data : 'salesPlanQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},'className' : 'text-right'
			},  
		],
		drawcallback : [{
			//monSalesPlanTempTable.columns.adjust().draw();
		}],
		columnDefs : [ {
			"targets" : '_all' , "className" : "text-center"
		} ],
		order : [ [ 0, 'asc' ] ],
		
	});


	//전체선택 버튼 클릭
	$('#checkAll').on('click',function(){
		if($('input[name=checkAll]').is(":checked")){
			$('input[name=check]').prop('checked',true);
		}else{
			$('input[name=check]').prop('checked',false);
		}
	});


	//전체선택 버튼 클릭
	$('#checkAll2').on('click',function(){
		if($('input[name=checkAll2]').is(":checked")){
			$('input[name=check2]').prop('checked',true);
		}else{
			$('input[name=check2]').prop('checked',false);
		}
	});

	//품목추가 버튼 클릭
	$('#btnItemAdd').on('click',function(){
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		};
		
		var check = true;
		
		$('#monSalesPlanTable tbody tr').each(function(index, item) {		
			var data = monSalesPlanTable.row(this).data();
			if ($(this).find('td input[name=check]').is(":checked")) {
				
				var seq1 = $(this).find('input[name=itemSeq]').val();
				var overItemCd =  $(this).find('input[name=itemCd]').val();

				if (monSalesPlanTempTable.data().count() > 0) {
					$('#monSalesPlanTempTable tbody tr').each(function(index2, item2) {
						var seq2 = $(this).find('input[name=itemSeq]').val();
						
						if(seq1 == seq2){
							toastr.warning("이미 등록된 품번("+overItemCd+")입니다.");
							check = false;
							return false;
						}else{
							check = true;
						}
					});
				} 
				
				if(check){
					itemSeqVal = data.itemSeq;
					$('#monSalesPlanTempTable').DataTable().row.add(
					{
						"itemCus" : data.itemCus,
						"itemCusNm" : data.itemCusNm,
						"itemModel" : data.itemModel,
						"itemCd" : data.itemCd,
						"itemNm" : data.itemNm,
						"salesPlanQty" : data.salesPlanQty,
						"salesPlanQty" : data.salesPlanQty,
					}).draw(true);	
				}
				
			}
		});
	});

	
	//품목삭제 버튼 클릭
	$('#btnItemRemove').on('click',function(){
		if($('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#monSalesPlanTempTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check2]').is(":checked") == true) {
				arr.push(index);
			}
		});
		$('#monSalesPlanTempTable').DataTable().rows(arr).remove().draw();	
		$('input[name=check2]').prop("checked",false); 
		$('#checkAll2').prop("checked",false); 

		arr = [];

	});
	
	//소요량분석(후가공) 버튼 클릭
	$('#btnConsumptAnalz').on('click',function(){

		/* if($('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("소요량분석할 항목을 선택해주세요.");
			return false;
		}; */
		
		reloadCheck = 'reload';
		status = 'list';
		$('#btnConsumptEdit').attr('disabled', true);
		$('#btnConsumptDel').attr('disabled', false);
		$('#saveStock').attr('disabled', false);
		$('#saveStockChange').attr('disabled', false);
		$('#btnOrdCorpCd').attr('disabled', false);
		$('#btnOrdCorpChange').attr('disabled', false);
		$('#btnAllCheck').attr('disabled', false);
		$('#btnSave').removeClass('d-none');
		
		var i=0;
		itemSeqArray=[];
		$('#monSalesPlanTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check]').is(":checked") == true) {
				itemSeqArray[i] = $(this).find('input[name=itemSeq]').val();
				i++;
			}
		});

		$('#bizOrderConsumptTable').DataTable().ajax.reload(function(){});
		$('#monSalesPlanModal').modal('hide');
	});
	
	//소요량분석(후가공) 목록조회
	let bizOrderConsumptTable = $('#bizOrderConsumptTable').DataTable({
		dom :  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-10'i><'col-sm-12 col-md-2'B>>",
		language : lang_kor,
		lengthChange : true,
		destroy : true,
		searching : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : "63vh",
		ajax : {
			url : 'bs/bizOrderConsumptList',
			type : 'GET',
			data : {
				'mrpNo' : function(){return mrpNo;},
				'mrpSeq' : function(){return mrpSeq;},
				'salesYear' : function(){return mrpYear;},
				'salesMon' : function(){return mrpMon;},
				'itemSeqArray' : function(){return itemSeqArray;},
				'reloadCheck' : function(){return reloadCheck;},
				'itemGubun' : '004'
			}				
		},
		rowId : 'itemSeq',
		columns : [
				{
					render : function(data, type, row,meta) {
						if(status=="read"){
							return '<input type="checkbox" name="check3" disabled/>';
						}else{
							return '<input type="checkbox" name="check3"/>';
						}
					}
				}, 
				{
					data : 'itemCusNm'
				},
				{
					data : 'itemCd'				
				}, 
				{
					data : 'itemNm'				
				}, 
				{
					data : 'monPlanQty'//월계획수량 * 소요량이 아닌 그냥 월계획수량		
				}, 
				{
					data : 'tmQty',
					render : function(data,type,row,meta){
						if(data!=null){
							return rmDecimal(Math.floor(data));
						}else{
							return '0';
						}
					},'className' : 'text-right'
				},
				{
					render : function(data, type, row,meta) {
						if((Math.ceil(row['reqQty']) - Math.floor(row['tmQty'])) < 0){
							tempPurPredQty = 0;
							return 0;
						}
						tempPurPredQty = Math.ceil(row['reqQty']) - Math.floor(row['tmQty']);
						return rmDecimal(tempPurPredQty);
					}
				}, 
				{
					data  : 'ordPredQty',
					render : function(data, type, row,meta) {
						if(status=="read"){
							if(data!=null){
								var html = '<input type="text" class="form-control number-float0" name="ordPredQty" id="ordPredQty"  value="'+rmDecimal(data)+'"  style="text-align:right; color:blue; font-weight:bold " disabled/>';
								html += '<input type="hidden" class="form-control" name="ordPredQtyOri" value="'+tempPurPredQty+'" style="text-align:center;" disabled>';
								return html;
							}else{
								var html = '<input type="text" class="form-control number-float0" name="ordPredQty" id="ordPredQty"  value="0"  style="text-align:right; color:blue; font-weight:bold " disabled/>';
								html += '<input type="hidden" class="form-control" name="ordPredQtyOri" value="'+0+'" style="text-align:center;" disabled>';
								return html;
							}
						}else{
							var html = '<input type="text" class="form-control number-float0" name="ordPredQty" id="ordPredQty"  value="'+rmDecimal(tempPurPredQty)+'"  style="text-align:right; color:blue; font-weight:bold "/>';
							html += '<input type="hidden" class="form-control" name="ordPredQtyOri" value="'+tempPurPredQty+'" style="text-align:center;" disabled>';
							return html;
						}
					}
				},
				],
		order : [ 0, 'asc'],
		columnDefs : [
			{targets : [4,5,6,7], render : $.fn.dataTable.render.number(','), className : 'text-right'},
			{targets : '_all' , className : 'text-center'},
		],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback : function() {
			reloadCheck = 'noReload';
			
			//반제품 중 생산수량이 외주인 것은 행 색깔을 주황색으로 변경
			let api = this.api();
		    for ( var i = 0; i < api.data().count(); i++ ) {
		    	prodGubunArray.forEach(function(value){
		    		if(api.row(i).data().prodGubun == value){
				    	$('#'+api.row(i).data().itemSeq).addClass('bg-orange');
					}
		    	})
			}
		}
	});

	var html2 = '<div class="row" id="ordCorpDiv">';
	html2 += '<label class="input-label-sm d-none">공급사</label>';
	html2 += '<div class="input-sub m-0 d-none">';
	html2 += '<input type="hidden" class="form-control" id="ordCorpCd" name="ordCorpCd" disabled> ';
	html2 += '<input type="text"class="form-control" id="ordCorpNm" name="ordCorpNm" disabled>';
	html2 += '<button type="button"class="btn btn-primary input-sub-search"name="btnOrdCorpCd" id="btnOrdCorpCd" onClick="selectDealCorp();" disabled>';
	html2 += '<span class="oi oi-magnifying-glass"></span>';
	html2 += '</button>';
	html2 += '</div>';
	html2 += '<button type="button" class="btn btn-primary float-right ml-1 d-none"';
	html2 += 'id="btnOrdCorpChange" disabled>일괄적용</button>';
	
	html2 += '<label class="input-label-sm">안전재고</label>';
	html2 += '<div class="input-sub m-0" style="width:100px">';
	html2 += '<input type="text" class="form-control" id="saveStock" name="saveStock" style="text-align : right;" disabled>';
	html2 += '</div>';
	html2 += '<label class="input-label-sm">%</label>';
	html2 += '<button type="button" class="btn btn-primary float-right ml-1"';
	html2 += 'id="saveStockChange" disabled>안전재고 적용</button>';
	
	html2 += '<button class="btn btn-primary d-none" id="btnOrdCorpChangeConfirmLoading"';
	html2 += 'type="button" disabled>';
	html2 += '<span class="spinner-border spinner-border-sm" role="status"';
	html2 += 'aria-hidden="true"></span> 처리중';
	html2 += '</button>';
	html2 += '</div>';

	$('#bizOrderConsumptTable_length').html(html2);


	//기본탭 전체선택클릭
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check3]').prop("checked",true);
		}else{
			$('input:checkbox[name=check3]').prop("checked",false);
		}
	});
	

	
	// 발주처 등록 버튼
	$('#btnOrdCorpChange').on('click',function() {

		var check = true;
		var dataArray = new Array();
		
 		if (!$.trim($('#ordCorpNm').val())) {
 	 		$("#btnOrdCorpCd").focus();
			toastr.warning('발주처를 선택해주세요.');
			check==false;
			return false;
		}
		
		if ($('input[name=check3]').is(":checked")!=true) {
			toastr.warning('항목을 선택해주세요.');
			check==false;
			return false;
		}

		//************************
	 	var checkbox = $("input:checkbox[name=check3]:checked");
	 	checkbox.each(function(i) {
		 	var tr = checkbox.parent().parent().eq(i);
		 	var td = tr.children();

		 	$('input[name=ordCorpNm]').eq(tr.index()+1).val($('#ordCorpNm').val());
		 	$('input[name=ordCorpCd]').eq(tr.index()+1).val($('#ordCorpCd').val());

	 	})

	 	$('input:checkbox[name=check2]').prop("checked",false);
	 	$('#ordCorpNm').val("");
	 	$('#ordCorpCd').val("");
		
	});
	
	// 확정수량 변경
	$('#saveStockChange').on('click',function() {

		var check = true;
		var dataArray = new Array();
		
 		if (!$.trim($('#saveStock').val())) {
			toastr.warning('안전재고를 입력해주세요.');
			check == false;
			return false;
		}
		
		if ($('input[name=check3]').is(":checked")!=true) {
			toastr.warning('항목을 선택해주세요.');
			check==false;
			return false;
		}

		$('#bizOrderConsumptTable tbody tr').each(function(index, item){
			if ($(this).find('td input[name=check3]').is(":checked") == true) {
				
				var tempSaveStock =  $(this).find('td input[name=ordPredQtyOri]').val();
				if($(this).find('td input[name=ordPredQtyOri]').val() <= 0){
					tempSaveStock =  $(this).find('td input[name=ordPredQty]').val().replace(/,/g,'');
				}
			 	var tempPercent = $('#saveStock').val();
			 	var tempValue = tempSaveStock * (1 + tempPercent / 100);
			 	
			 	$(this).find('td input[name=ordPredQty]').val(rmDecimal(Math.floor(tempValue)));
				
			}
			
		});
		
		//************************
// 	 	var checkbox = $("input:checkbox[name=check3]:checked");
// 	 	checkbox.each(function(i) {
// 		 	var tr = checkbox.parent().parent().eq(i);
// 		 	var td = tr.children();

// 		 	var tempSaveStock = $('input[name=ordPredQty]').eq(tr.index()+1).val();
// 		 	var tempPercent = $('#saveStock').val();
// 		 	var tempvalue = tempSaveStock * (1 + tempPercent / 100);
		 	
// 		 	$('input[name=ordPredQty]').eq(tr.index()+1).val(tempvalue);

// 	 	})

	 	$('input:checkbox[name=check2]').prop("checked",false);
		
	});

	
	//소요량분석(후가공) 등록
	$('#btnSave').on('click',function() {
		var check = true;
		var dataArray = new Array();

		if(!$.trim($('#bizOrderConsumptTable_filter').find('input').val()) == false){
 			toastr.warning("검색란을 비워 모든 항목이 나오도록 해주세요.");
 			check = false;
			return false;
		}
		
		if(bizOrderConsumptTable.data().count() <= 0){
			toastr.warning("월생산계획 조회를 해주세요.");
 			check = false;
			return false;
		}

		$('#bizOrderConsumptTable tbody tr').each(function(index, item) {

			if($(this).find('td input[name=ordPredQty]').val() != ''){

				var rowData = new Object();
				rowData.mrpNo =  mrpNo;
				rowData.mrpSeq = mrpSeq;	
				rowData.itemSeq =  bizOrderConsumptTable.row(index).data().itemSeq;
				rowData.reqQty = bizOrderConsumptTable.row(index).data().reqQty;		
				rowData.tmQty = bizOrderConsumptTable.row(index).data().tmQty;
				rowData.unuseQty = bizOrderConsumptTable.row(index).data().unuseQty;
				rowData.availStock = bizOrderConsumptTable.row(index).data().availStock;
				rowData.purPredQty = bizOrderConsumptTable.row(index).data().purPredQty;
				rowData.originOrdQty = bizOrderConsumptTable.row(index).data().originOrdQty;
				rowData.ordPredQty = $(this).find('td input[name=ordPredQty]').val().replace(/,/g, '');
				rowData.monPlanQty = bizOrderConsumptTable.row(index).data().monPlanQty;
				stockUseYnVal = $(this).find('td input[name=stockUseYn]').is(":checked");
				rowData.stockUseYn =stockUseYnVal==true?"001":"002";
				ordCorpCdVal = $(this).find('td input[name=ordCorpCd]').val();
				rowData.ordCorpCd = ordCorpCdVal==null?"":ordCorpCdVal;

				dataArray.push(rowData);
				console.log(dataArray)
			} else {
				var rowData = new Object();
				rowData.mrpNo =  mrpNo;
				rowData.mrpSeq = mrpSeq;	
				rowData.itemSeq = "";
				dataArray.push(rowData);
				console.log(dataArray)
			}
		});

		if (check) {
			$.ajax({
				url : '<c:url value="bs/bizOrderConsumptCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					sideView = "edit";
					console.log(res.result);
					if (res.result == "ok") {
						toastr.success('등록되었습니다.');
						status = "read";

						itemSeqArray=[];
						mrpYear='';
						mrpMon='';

						$('#bizOrderConsumptTable').DataTable().ajax.reload(function(){});
						$('#bizOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');

						$('#btnSave').addClass('d-none');
						
						$('button[name=btnMrpChargr]').attr('disabled',true);
						$('#btnConsumptEdit').attr('disabled', true);
						$('#btnConsumptDel').attr('disabled', true);
						$('#saveStock').attr('disabled', true);
						$('#saveStockChange').attr('disabled', true);
						$('#btnOrdCorpCd').attr('disabled', true);
						$('#btnOrdCorpChange').attr('disabled', true);
						
						$('#btnAllCheck').attr("disabled", true);
						$('input:checkbox[name=check2]').attr("disabled", true);
						$('#btnAllCheck').prop('checked', false);
						$('#saveStock').val('');

						//$('#confirmSaveModal').modal('show');
						
					} else if (res.result == "exist") {
						toastr.error('이미 등록된 부품코드(' + res.data+ ')입니다. 확인해주세요.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
				}
			});
		}

	});

	
	
	//거래처명 팝업
	var dealCorpPopUpTable;
	var dealArr = ['002','003'];
	function selectDealCorp() {
		if (dealCorpPopUpTable == null || dealCorpPopUpTable == undefined) {
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				serverSide : false,
				scrollX : false,
				lengthChange : true,
				pageLength : 15,
				ajax : {
					url : '<c:url value="bm/dealCorpDataList"/>',
					type : 'GET',
					data : {
						'dealArr' :  function(){return dealArr;},
						'dealGubun' : function(){return dealGubun;}
					},
				},
				rowId : 'dealCorpCd',
				columns : [ {
					data : 'dealCorpNm'
				}, {
					data : 'dealCorpCd'
				}, {
					data : 'presidentNm'
				}, {
					data : 'repreItem'
				}, {
					data : 'corpNo'
				} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});

			var html1 = '<div class="row">';
			html1 += '<label class="input-label-sm">거래구분</label>'; 
			html1 += '<select class="custom-select" id="dealGubun">';
			html1 += '<option value="" selected>전체</option>';
			html1 += '<option value="002">공급사</option>';
			html1 += '<option value="003">외주사</option>';
			html1 += '</select>';
			html1 += '</div>';
			
			$('#dealCorpPopUpTable_length').html(html1);

			//거래구분 변경시
			$('#dealGubun').on('change', function() {
				dealGubun = $("#dealGubun").val();	//발주구분
				$('#dealCorpPopUpTable').DataTable().ajax.reload( function () {});
		    });	
		    
			$('#dealCorpPopUpTable tbody').on('click', 'tr', function() {
				var data = dealCorpPopUpTable.row(this).data();
				$('#ordCorpCd').val(data.dealCorpCd);
				$('#ordCorpNm').val(data.dealCorpNm);
				
				$('#dealCorpPopUpModal').modal('hide');
			});
		} else {
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal').modal('show');
	}

 
	//담당자 팝업
	var userPopUpTable;
	function selectMrpChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 15,
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
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : '_all',
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#mrpChargr').val(data.userNumber);
				$('#mrpChargrNm').val(data.userNm);

				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	} 
	


	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=ordPredQty]", function(event){
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
		$(this).val(rmDecimal(uncomma($(this).val())));
	});
	

   	
	function uiProc(flag) {
		$("#finspectYn").attr("disabled", flag);
		$("#confirmYn").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#receiptGubun").attr("disabled", flag);
		$("#poDesc").attr("disabled", flag);
		$('#btnDealCorp').attr('disabled', flag);
		$('#btnPoRegChargr').attr('disabled', flag);
		$('#poDateCalendar').attr('disabled', flag);
	}

</script>
<script>
      $(document).ready(function(){
          setDateBox();
      }); 
    
    // select box 연도 , 월 표시
    function setDateBox(){
        // 발행 뿌려주기
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-5); y <= (com_year+5); y++){
            $("#mrpYear").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '</option>');
        }

        
        // 월 뿌려주기(1월부터 12월)
        var month;
        for(var i = 1; i <= 12; i++){
        	$("#mrpMon").append('<option value="'+(i<10?'0'+i:i)+'" '+(i==mon?'selected':'')+'>'+i+'</option>'); 
        }
    }
</script>
</body>
</html>