<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog" aria-labelledby="saveBtnModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<h6>발주등록을 새로 하시겠습니까?</h6> 
	      		</div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-primary" id="saveBtnModalY" data-dismiss="modal">예</button>
	      			<button type="button" class="btn btn-danger" id="saveBtnModalN" data-dismiss="modal">아니요</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 거래처 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="dealCorpPopUpLabel">공급사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="dealCorpPopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공급사</th>
									<th style="width : 15%">공급사코드</th>
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
				<li class="breadcrumb-item active">개별발주(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
              <!-- 상단 sorting part -->
              <div class="card top_sortbox p-2">
                <div class="row">
                <div class="col-5 row p-0">
                <!-- 구분 -->
                 <!--  <label class="input-label-md">구분</label>
                  <div class=" mr-3">
                   <div class="form-group-150">
                     <select id="mainGubun" class="custom-select custom-select-md"></select>
                   </div>
                  </div> -->
                <!-- 품목구분 -->
                  <label class="input-label-md">품목구분</label>
                  <div class="">
                   <div class="form-group-150">
                     <select id="itemGubun" class="custom-select custom-select-md"></select>
                   </div>
                  </div>
              </div>
           </div>
        </div>
              <!-- / end 상단 sorting part -->
		<div class="row table-wrap-hid">
			<!------------------------ .left-list ----------------------->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 53%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table class="table table-bordered" id="itemInfoAdmTable">
							<colgroup>
								<col width="3%">
								<col width="12%">
								<col width="20%">
								<col width="15%">
								<col width="28%">
								<col width="7%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light" >
								<tr>
									<th>
										<input type="checkbox" id="btnAllCheck" >
									</th>
									<th>구분</th>
									<th>공급사</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th class="text-center">포장수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!----------------------- .right-sidebar 등록,수정 ----------------------->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 46%;">
				<div class="card">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave">발주등록</button>
						<button class="btn btn-primary d-none" id="btnSaveConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
						</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<form id="form">
							<div class="table-responsive">
								<table class="table table-sm table-bordered mb-2"
									id="purchaseOrderAdmTable">
									<colgroup>
										<col width="20%">
										<col width="27%">
										<col width="25%">
										<col width="28%">
									</colgroup>
									<tr>
										<th>발주번호</th>
										<td>
											<div class="row">
												<input class="form-control" type="text" id="poNo" name="poNo" style="max-width: 100%" disabled>
												<button type="button" class="btn btn-secondary d-none" id="btnPoNoReset">새로고침</button>
											</div>
										</td>
										<th>공급사</th>
										<td>
											<div class="input-sub m-0" style="max-width: 100%">
												<input type="text" class="form-control" style="max-width: 100%" id="dealCorpNm" name="dealCorpNm" disabled> 
												<input type="hidden" id="dealCorpCd" name="dealCorpCd">
												<button type="button"
													class="btn btn-primary input-sub-search"
													name="btnDealCorp" id="btnDealCorp"
													onClick="selectDealCorp();">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>발주자</th>
										<td>
											<div class="input-sub m-0" style="max-width: 100%">
												<input type="hidden" class="form-control"style="max-width: 100%" id="mainChargr"name="mainChargr" disabled> 
												<input type="text"class="form-control" style="max-width: 100%"id="mainChargrNm" name="mainChargrNm" disabled>
												<button type="button" class="btn btn-primary input-sub-search"name="btnMainChargr" id="btnMainChargr" onClick="selectMainChargr();">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
										<th>발주일자</th>
										<td>
											<div class="form-group input-sub m-0"
												style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="text" id="poDate" name="poDate" maxlength="10"
													disabled />
												<button
													onclick="fnPopUpCalendar(poDate,poDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="poDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
										
									</tr>
										<tr>
										<th>발주구분</th>
										<td><select class="custom-select" type="text" id="receiptGubun" style="max-width: 100%" disabled></select></td>
										<th>비고</th>
										<td><input class="form-control" type="text" id="poDesc" style="max-width: 100%" disabled/></td>
									</tr>
								</table>
							</div>
						</form>
						<div class="card-body col-sm-12 p-1 mb-2">
							<button type="button" class="btn btn-success float-left mr-1" id="btnCancle" disabled>
								<span class="oi oi-arrow-left">&nbsp;&nbsp;발주취소</span>
							</button>
							<button class="btn btn-warning d-none"
								id="btnEditConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
							<!-- <button type="button" class="btn btn-primary float-right mr-1"
								id="btnDtlEdit" disabled>수정</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button> -->
						</div>
						<form id="form2" enctype="multipart/form-data">
							<div class="table-responsive">
								<table class="table table-bordered" id="purchaseOrderDtlTable">
									<colgroup>
										<col width="4%">
										<col width="20%">
										<col width="25%">
										<col width="18%">
										<col width="18%">
										<col width="15%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" class="" id="btnAllCheck2"></th>
											<th>품번</th>
											<th>품명</th>
											<th>포장수량</th>
											<th>발주수량</th>
											<th>납기일자</th>
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
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "53%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "iosc0420";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","개별발주(정밀가공)"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';

	var tableIdx=null;
	var poNo = null;
	var poSeq = null;
	
	let itemGubunList = ['004'];
	var mainGubun = "";
	var itemCdVal = null;
	var itemCus = '';

	var mainChargr =  "${userNumber}";
	var mainChargrNm =  "${userNm}";	
	var dlvDateCal =  "${serverDateTo}";
	var dealGubun = "";
	
	//공통코드 처리 시작	
	let itemGubunCode = new Array(); //구분
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunCode.push(json);
	</c:forEach>
	
	let mainGubunCode = new Array(); //구분
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunCode.push(json);
	</c:forEach>
	
	let receiptGubunCode = new Array(); // 입고구분
	<c:forEach items="${receiptGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	receiptGubunCode.push(json);
	</c:forEach>
	//공통코드 끝
	

	//선택박스 처리
	selectBoxAppend(itemGubunCode, "itemGubun", "004", "1");
	selectBoxAppend(mainGubunCode, "mainGubun", "", "1"); 
	selectBoxAppend(receiptGubunCode, "receiptGubun", "002", ""); 
	

	uiProc(true);
	
    $('#saveBtnModalY').on('click',function() {
    	itemCus = '';
    	$('#itemCus').val('');
    	
    	uiProc(true);
		$('#form').each(function(){
        	this.reset();
        	$('input[type="hidden"]').val('');
    	});
		$('#itemInfoAdmTable').DataTable().ajax.reload(function(){});
		$('#purchaseOrderDtlTable').DataTable().clear().draw();
		
		$('#btnSave').addClass('d-none');
		$('#btnCancle').attr('disabled',true);
		$('#btnAllCheck').prop("checked",false);
		$('input[name=check]').prop("checked",false);
    });

 	// 목록
	let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		lengthChange : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		serverSide : false,
		fixedHeader: true,
		pageLength : -1, 
		scrollY: "610px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubunList' : function(){return itemGubunList;},
				'mainGubun' : function(){return '002';},
				'itemCus' : function(){return itemCus;},
			},
		},
		rowId : 'itemCd',
		columns : [
				{  
					render : function(data, type, row, meta) {
						return '<input type="checkbox" name="check">';
					}
				},
				{
					data : 'itemGubunNm',
					'className' : 'text-center'
				}, 
				{
					data : 'itemCusNm',
					'className' : 'text-center'
				}, 
				{
					data : 'itemCd',
					'className' : 'text-center'
				}, 
				{
					data : 'itemNm',
					'className' : 'text-center'
				}, 
				{
					data : 'itemUnitNm'
				}, 
				{
					data : 'boxCount',
					render : function(data, type, row, meta) {
						return rmDecimal(data);
					},
					'className' : 'text-right'
				}
				],
		order : [ [ 1, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '품목정보관리(부품)'
		}, 'print' ]
	});

	var html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">공급사</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="hidden" class="form-control" id="itemRealCus" name="itemRealCus">';
	html1 += '<input type="text" class="form-control" id="itemCus" name="itemCus" disabled>';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" id="itemCusBtn" onClick="itemCusSelectInCorpCd();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	
	html1 += '&nbsp;<button type="button" class="btn btn-primary" id="itemCusDel" onclick="itemCusDelClick();">초기화</button>';
	
	html1 += '</div>';
	html1 += '</div>';
	
	$('#itemInfoAdmTable_length').html(html1);
	
	var html2 = '<button type="button" class="btn btn-md btn-success float-right mr-3" id="btnMove">발주추가&nbsp;&nbsp;<span class="oi oi-arrow-right"></span></button>';
	$('#itemInfoAdmTable_filter').append(html2);

	function itemCusDelClick(){
		$('#itemRealCus').val('');
		$('#itemCus').val('');
		
		itemCus = '';
		$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
	}
	
	//공급사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function itemCusSelectInCorpCd() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		var dealArr = ['002','003'];
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4')
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
							async : false,
							pageLength : 10,
							ajax : {
								url : '<c:url value="/bm/dealCorpDataList"/>',
								type : 'GET',
								data : {
									'dealArr' :  function(){return dealArr;},
								},
							},
							rowId : 'dealCorpSeq',
							columns : [ 
							{
								data : 'dealCorpNm'
							}, 
							{
								data : 'dealCorpCd'
							}, 
							{
								data : 'presidentNm'
							}, 
							{
								data : 'repreItem'
							}, 
							{
								data : 'corpNo'
							} 
							],
							columnDefs : [ {
								"defaultContent" : "-",
								"targets" : "_all",
								"className" : "text-center"
							} ],
							order : [ [ 0, 'asc' ] ],
							buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			$('#itemRealCus').val(data.dealCorpCd);
			$('#itemCus').val(data.dealCorpNm);
			$('#dealCorpPopUpModal4').modal('hide');
			
			itemCus = data.dealCorpCd;
			$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	//개별발주 클릭시 
	$('#itemInfoAdmTable tbody').on('click','tr',function() {
		
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=check]').prop('checked',false);
		} else {
			//$('#itemInfoAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			$(this).find('input[name=check]').prop('checked',true);
		}
	});
	

	// 발주조건 변경
	$('#itemGubun').on('change', function() {
		if($('#itemGubun :selected').val() == ''){//품목구분이 '전체'일 때
			itemGubunList = ['003', '004'];
		} else {
			itemGubunList =  [$('#itemGubun :selected').val()];
		}
		$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
    });	
	
	// 발주조건 변경
	$('#mainGubun').on('change', function() {
		mainGubun =  $('#mainGubun :selected').val();
		$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
    });	



	//모든 체크박스 선택
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
		}
	});
	

	// 발주추가버튼 클릭
	$('#btnMove').on('click', function() {
		/* if (!$('#itemRealCus').val()) {
			toastr.warning('발주할 공급사를 선택해 주세요.');
			$('#itemCusBtn').focus();
			return false;
		} */
		
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("발주등록할 항목을 선택해주세요.");
			return false;
		}

		//화면처리
		uiProc(false);
 		
		if(purchaseOrderDtlTable.data().count() == 0){
			$('#form').each(function(){
	        	this.reset();
	    	});

			$.ajax({
				url : '<c:url value="io/getPoNo"/>',
				type : 'GET', 
				data : {
					'poNoGubun'  : 'P'
					},
				success : function(res){
					$('#poNo').val(res.data);
				}
			})

			$('#poDate').val(dlvDateCal);
			$('#mainChargr').val(mainChargr);
			$('#mainChargrNm').val(mainChargrNm);
			$('#btnSave').removeClass('d-none');	
			$('#btnCancle').attr('disabled',false);
			$('#purchaseOrderDtl').DataTable().clear().draw();
		}

		var tempDealCorpCd;
		var tempDealCorpNm;

 		$('#itemInfoAdmTable tbody tr').each(function(index, item) {	
			var data = itemInfoAdmTable.row(this).data();
			if ($(this).find('td input[name=check]').is(":checked") == true) {
				itemSeqVal = data.itemSeq;
				tempDealCorpCd = data.itemCus;
				tempDealCorpNm = data.itemCusNm;
				$('#purchaseOrderDtlTable').DataTable().row.add(
				{
					"itemCd" : data.itemCd,
					"itemNm" : data.itemNm,
					"boxCount" : data.boxCount,
					"dlvDate" : data.dlvDate,
				}).draw(true);				
			}
 		});  

 		$('#dealCorpCd').val(tempDealCorpCd);
		$('#dealCorpNm').val(tempDealCorpNm);
 		$('#btnAllCheck').prop("checked",false);
 		//$('input[name=check]').prop("checked",false); 
	}); 
    
	    
	//발주 목록조회
	let purchaseOrderDtlTable = $('#purchaseOrderDtlTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		fixedHeader: true,
		scrollY: "480px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="io/purchaseOrderRead"/>',
			type : 'GET',
			data : {
				'itemCd' : function(){return itemCdVal;},
			}
		},
		columns : [
			{//체크박스
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check2" />';
				}
			},
			{//품번
				data : 'itemCd',
				render : function(data,type, row, meta){
					
					if(data!=null){
						html = '<input type="text" class="form-control p-0" style="max-width:100%; text-align:center; border:none;" name="itemCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+itemSeqVal+'" disabled>';
						return html;

					} else{
						return '<input type="text" class="form-control" name="itemCd" value="" disabled>';
					}		
				}
			},
			{//품명
				data : 'itemNm',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="text-align:center; border:none;" disabled>';		
						
					} else{
						return '<input type="text" class="form-control" name="itemNm" value="" style="text-align:center;" disabled>';
					}	
				}
			},
			{//포장수량
				data : 'boxCount',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" name="boxCount" value="'+addCommas(data)+'" style="text-align:right;" disabled>';		
						
					} else{
						return '<input type="text" class="form-control number-float0" name="boxCount" value="0" style="text-align:right;" disabled>';
					}	
				}
			},
			{//발주수량
				data : 'ordQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" name="ordQty" value="'+addCommas(data)+'" style="text-align:right;" >';		
						
					} else{
						return '<input type="text" class="form-control number-float0" name="ordQty" value="0" style="text-align:right;">';
					}	
				}
			},
			{//납기일자
				data : 'dlvDate',
				render : function(data, type, row, meta){
					return value =  '<input class="form-control" type="date" style="text-align:center"  value="'+dlvDateCal+'" name="dlvDate">';
				}
			},
		],
		columnDefs: [
			//{ "targets": [9,10] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        ],
	    order: [
	       [ 0, 'asc' ] 
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

	
	
	//모든 체크박스 선택
	$('#btnAllCheck2').on('click',function(){
		if($('#btnAllCheck2').prop("checked")){
			$('input:checkbox[name=check2]').prop("checked",true);
		}else{
			$('input:checkbox[name=check2]').prop("checked",false);
		}
	})


	// 발주취소버튼 클릭
	$('#btnCancle').on('click', function() {
		var array=[];
		var i=0;
		$('#purchaseOrderDtlTable tbody tr').each(function(index,item){
 			if($(this).find('td input[name=check2]').is(':checked')){
 				array[i]=index;
 				i++;
 	 		}
		});

		$('#purchaseOrderDtlTable').DataTable().rows(array).remove().draw();
		$('#btnAllCheck2').prop('checked',false);
	});

	
	// 새로고침버튼 클릭
	$('#btnPoNoReset').on('click', function() {

		//발주번호 생성
		$.ajax({
			url : '<c:url value="io/getPoNo"/>',
			type : 'GET', 
			data : {
				'poNoGubun'  : 'P'
				},
			success : function(res){
				$('#poNo').val(res.data);
			}
		});
	});

	//발주 저장처리
	$('#btnSave').on('click',function(){
		
		var dataArray = new Array();
		var check = true;
		
		if (!$.trim($('#dealCorpNm').val())) {
			$('#btnDealCorp').focus();
			toastr.warning('공급사를 선택해 주세요.');
			check=false;
			return false;
		}

		if (!$.trim($('#mainChargrNm').val())) {
			$('#btnMainChargr').focus();
			toastr.warning('발주자를 선택해 주세요.');
			check=false;
			return false;
		}
		
		$('#purchaseOrderDtlTable tbody tr').each(function(index,item){
			
			if ($(this).find('td input[name=ordQty]').val()=='0' || $(this).find('td input[name=ordQty]').val()=='') {
				toastr.warning('확정수량을 입력헤 주세요.');
				$(this).find('td input[name=ordQty]').focus();
				$(this).find('td input[name=ordQty]').select();
				check=false;
				return false;
			} 

			if($(this).find('td input[name=ordCnt]').val()!=0){
					
				var rowData = new Object();

				//발주 기본정보
				rowData.poNo = $('#poNo').val();
				rowData.dealCorpCd = $('#dealCorpCd').val();
				rowData.mainChargr = $('#mainChargr').val();
				rowData.poDate = $('#poDate').val().replace(/-/g,'');
				rowData.receiptGubun = $('#receiptGubun option:selected').val();
				rowData.poDesc = $('#poDesc').val();

				//발주 상세내역
				rowData.mrpNo = '';
				rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
			    rowData.ordQty = $(this).find('td input[name=ordQty]').val().replace(/,/g,'');
			    //rowData.ordUnitCost = $(this).find('td input[name=ordUnitCost]').val().replace(/,/g,"");
			    rowData.dlvDate = $(this).find('td input[name=dlvDate]').val().replace(/-/g,"");
		        dataArray.push(rowData);
		        console.log(rowData);
			}
		});

		if(check){
			$.ajax({
				url :'<c:url value="io/purchaseOrderAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
				    	itemCus = '';
				    	$('#itemCus').val('');
						uiProc(true);
						$('#form').each(function(){
				        	this.reset();
				        	$('input[type="hidden"]').val('');
				    	});
						$('#itemInfoAdmTable').DataTable().ajax.reload(function(){});
						$('#purchaseOrderDtlTable').DataTable().clear().draw();
						
						$('#btnSave').addClass('d-none');
						$('#btnCancle').attr('disabled', true);
						$('#btnAllCheck').prop("checked", false);
						$('input[name=check]').prop("checked", false);

						//새로고침 버튼숨김
						$('#poNo').css('max-width','100%');
						$('#poNo').removeClass('mr-2');
						$('#btnPoNoReset').addClass('d-none');
						
						toastr.success('등록되었습니다.');
					} else if(res.result == "fail"){

						//새로고침 버튼처리
						$('#poNo').css('max-width','60%');
						$('#poNo').addClass('mr-2');
						$('#btnPoNoReset').removeClass('d-none');
						
						toastr.error(res.message);
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

	//거래처 팝업 시작
   	var dealCorpPopUpTable;
   	var dealArr = ['002','003'];
   	function selectDealCorp()
   	{	   	
		if(dealCorpPopUpTable == null || dealCorpPopUpTable == undefined)	{
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange: true,
				serverSide : false,
		        pageLength: 15,
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
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
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
		    

		    $('#dealCorpPopUpTable tbody').on('click', 'tr', function () {
		    	var data = dealCorpPopUpTable.row( this ).data();
			    $('#dealCorpCd').val(data.dealCorpCd);
			    $('#dealCorpNm').val(data.dealCorpNm);
			    $('#telNo').val(data.telNo);
			    $('#mainChargr').val(data.bizCharger);
			    
				$('#dealCorpPopUpModal').modal('hide');		
		    });
		}else{
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal').modal('show');		
   	} 


 	//담당자 팝업 시작
	var userPopUpTable;
	function selectMainChargr() {
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
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#mainChargr').val(data.userNumber);
				$('#mainChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}

	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml;
		if(sideView == "edit"){
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		}else {
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


	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=ordQty],input[name=ordUnitCost]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace(",", ""));
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas($(this).val().replace(",", "")));
	});

	
	
	function uiProc(flag) {
		$("#poDesc").attr("disabled", flag);
		$('#btnDealCorp').attr('disabled',flag);
		$('#btnMainChargr').attr('disabled',flag);
		$('#receiptGubun').attr('disabled',flag);
		$('#poDateCalendar').attr('disabled',flag);
	}



</script>   	
</body>
</html>
