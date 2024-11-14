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
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">수분측정관리대장</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 65%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="itemMoisMeasureAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>작업지시번호</th>
									<th>설비명</th>
									<th>작업자</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>자재코드</th>
									<th>자재명</th>
									<th class="text-center">투입일자</th>	
									<th>단위</th>	
									<th class="text-center">투입수량</th>	
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width: 34%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a></li>
				
					</ul>
				</div>
				<!--====================TAB-UI=======================-->
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">								
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup">검사항목</button>	
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" 	 id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnAdd">등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemMoisMeasureDtlList" style="width:100%;">
										<thead>
											<tr>
												<th>차수</th>
												<th>측정일자</th>
												<th>측정시간</th>
												<th>측정자</th>
												<th>건조온도</th>
												<th>수분함유량</th>
												<th>판정</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-1" id="itemMoisMeasureDtlTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>차수</th>
												<td colspan="3" style="font-weight: 700;font-size: 15px;">
													<!-- <input type="text" class="form-control" id="moisSeq" name="moisSeq" style="max-width:100%" disabled /> -->
													<span id="moisSeq" style="max-width:100%;margin-left:5px"></span>
												</td>
											</tr>
											<tr>
												<th>사출기</th>
												<td colspan="3"><input type="text" class="form-control" id="equipNm" name="equipNm" style="max-width:100%" disabled />
											</tr>
											<tr>
												<th>원재료코드</th>
												<td colspan="3"><input type="text" class="form-control" id="matrlCd" name="matrlCd" style="max-width:100%"  disabled />
											</tr>
											<tr>
												<th>원재료명</th> 
												<td colspan="3"><input type="text" class="form-control" id="matrlNm" name="matrlNm" style="max-width:100%"  disabled />
											</tr>
											<tr>
												<th>원재료 재질</th>
												<td colspan="3"><input type="text" class="form-control" id="matrlGrade" name="matrlGrade" style="max-width:100%"  disabled />
											</tr>
											<tr>
												<th>측정일자</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="moisDate" name="moisDate" maxlength="10" disabled />
													<button type="button" onclick="fnPopUpCalendar(moisDate,moisDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="moisDateCalendar"  disabled>
														<span class="oi oi-calendar"></span>
													</button>
												</div>
												<th>측정시간</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input type="time" class="form-control" id="moisTime" name="moisTime" style="max-width: 100%" disabled />
												</div>
											</tr>
											<tr>
												<th>측정자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="moisChargr"name="moisChargr" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="moisChargrNm" name="moisChargrNm" disabled>
														<button type="button" class="btn btn-primary input-sub-search"name="btnMoisChargr" id="btnMoisChargr" onClick="selectMoisChargr();" disabled>
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
												</td>
												<th>건조온도(℃)</th>
												<td><select id="moisTemp" class="custom-select" style="max-width: 100%;" disabled></select></td>
											</tr>
											<tr>
												<th>판정</th>
												<td><select id="moisPass" class="custom-select" style="max-width: 100%;" disabled></select></td>
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th>특이사항</th>			
												<td colspan="3">
													<textarea id="moisDesc1" style="min-width: 100%; resize: none;height: 90px;border: 1px solid #c2c5ca;border-radius: 5px;" disabled></textarea>
												</td>							
											</tr>
											<tr>
												<th>조치사항</th>			
												<td colspan="3">
													<textarea id="moisDesc2" style="min-width: 100%; resize: none;height: 90px;border: 1px solid #c2c5ca;border-radius: 5px;" disabled></textarea>
												</td>	
											</tr>
																						
										</thead>
									</table>
								</div>
							</form>	
						</div>
						<!--========tab1 part=====-->			
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!--  Modal Start-->
	<div class="modal fade" id="inspPopupModal" tabindex="-1" role="dialog" aria-labelledby="inspSavePopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document" style="min-width:1000px;">
			<div class="modal-content" >
				<div class="modal-header">
					<h5 class="modal-title" id="inspPopuppLabel">검사항목등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="">
						<button type="button" class="btn btn-primary" id="btnSize">수분측정</button>
						<button type="button" class="btn btn-primary" id="btnWeight">중량</button>
						
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<!-- <button type="button" class="btn btn-warning float-right mr-1" id="btnInspEdit">수정</button> -->
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="sizeAdmTableDiv2">
							<table class="table table-bordered" id="sizeAdmTable2" style="width:100%;">
								<%-- <colgroup>
									<col width="10%">
									<col width="20%">
									<col width="26%">
									<col width="22%">
									<col width="22%">
								</colgroup> --%>
								<thead>
									<tr>
										<th rowspan="2">순번</th>
										<th rowspan="2">목록</th>
										<th rowspan="2">확인방법</th>
										<th colspan="2">기준</th>
										<th rowspan="2">측정결과</th>
										<!-- <th colspan="3" style="background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="background: #6bbcfb;">CVT.2</th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv">
							<table class="table table-bordered" id="sizeAdmTable" style="width:100%;">
								<%-- <colgroup>
									<col width="10%">
									<col width="15%">
									<col width="10%">
									<col width="31%">
									<col width="17%">
									<col width="17%">
								</colgroup> --%>
								<thead>
									<tr>
										<th rowspan="2">순번</th>
										<th rowspan="2">목록</th>
										<th rowspan="2">확인방법</th>
										<th colspan="2">기준</th>
										<th rowspan="2">측정결과</th>
										<!-- <th colspan="3" style="background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="background: #6bbcfb;">CVT.2</th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="weightAdmTableDiv">
							<table class="table table-bordered" id="weightAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2">순번</th>
										<th rowspan="2">목록</th>
										<th rowspan="2">확인방법</th>
										<th colspan="2">기준</th>
										<th rowspan="2">측정결과</th>
										<!-- <th colspan="3" style="background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="background: #6bbcfb;">CVT.2</th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal End-->

<%@include file="../layout/bottom.jsp" %>

<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>

	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "65%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "qmsc0150";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","수분측정관리대장"); 
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let btnView = '';

	let printArray = new Array();
	
	var index = 0;
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate = "${serverDate}";
	var workOrdNoVal = '';
	var matrlDateVal = '';
	var workEndTime= '';
	var itemSeq = '';
	var matrlSeq ='';
	var moisPassVal = null;
	var moisSeqVal = '';
	var mainGubunVal=null;
	var chojungjong = '001';
	var approvalTotal = '';
	var inspCdVal = null;
	let inspDesc1Html = "";
	let inspDesc2Html = "";
	
	var modalHide = true;
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";
	
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
		
	
	//공통코드 시작
	var moisPassCode=new Array();
    <c:forEach items="${moisPass}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		moisPassCode.push(json);
	</c:forEach>

	var moisTempCode=new Array();
    <c:forEach items="${moisTemp}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		moisTempCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	selectBoxAppend(moisPassCode, "moisPass", " ", "2");
	selectBoxAppend(moisTempCode, "moisTemp", " ", "2");
	
	uiProc(true);


	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled',false);
		$('#btnEdit').attr('disabled',false);
		$('#btnSave').addClass('d-none');
	});

	//수분측정 목록조회
	let itemMoisMeasureAdmTable = $('#itemMoisMeasureAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : true,
		fixedHeader: true,
		pageLength : 20, 
		ajax : {
			url : '<c:url value="qm/itemMoisMeasureList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},		
			},
		}, 
		rowId : 'rowId',
		columns : [ 
			{ 
				data : 'workOrdNo' 
			}, 
			{ 
				data : 'equipNm' 
			}, 			
			{
				data  : 'mainWorkChargrNm'
			}, 
			{ 
				data : 'itemModelNm' 
			}, 
			{ 
				data : 'itemCd' 
			}, 
			{ 
				data : 'itemNm' 
			},
			{
				data : 'matrlCd' 
			}, 
			{ 
				data : 'matrlNm' 
			},
			{
				data : 'matrlDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			{ 
				data : 'matrlUnitNm' 
			},
			{
				data : 'matrlQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
			{ targets : [10], render : $.fn.dataTable.render.number(','), className : 'text-right'} 
		],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});

	
	var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">측정일자</label>';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="matrlDateFrom" name="matrlDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(matrlDateFrom,matrlDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="matrlDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>';
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="matrlDateTo" name="matrlDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(matrlDateTo,matrlDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="matrlDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
		html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
		html1 += '&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnAllRetv">전체조회</button>';
	    html1 += '</div>';
   
	$('#itemMoisMeasureAdmTable_length').html(html1);
	$('#matrlDateFrom').val(serverDateFrom);
	$('#matrlDateTo').val(serverDateTo); 

	//조회버튼 클릭시
	$('#btnRetv').on('click',function(){
		serverDateFrom = $('#matrlDateFrom').val();
		serverDateTo = $('#matrlDateTo').val();;
		$('#itemMoisMeasureAdmTable').DataTable().ajax.reload(function() {});
	});

	//전체조회버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		serverDateFrom = "";
		serverDateTo = "";
		$('#itemMoisMeasureAdmTable').DataTable().ajax.reload(function() {});
	});
	

	//수분측정 목록 클릭시
	$('#itemMoisMeasureAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');			
			return false;
		}
		
		if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        }else {
        	$('#itemMoisMeasureAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		let data = itemMoisMeasureAdmTable.row(this).data();
		workOrdNoVal = data.workOrdNo;
		matrlDateVal = data.matrlDate;
		matrlSeq = data.matrlSeq;
		moisSeqVal = data.moisSeq;
		inspCdVal = data.inspCd
		mainGubunVal = "001";
		
		getMoisRead();
		sideView = "edit";
		
		$('#itemMoisMeasureDtlList').DataTable().ajax.reload(function(){
			if(moisSeqVal!=null && moisSeqVal!=""){
				$('#itemMoisMeasureDtlList tbody tr').eq(moisSeqVal-1).addClass('selected');
				sideView2 = "edit";
			}
		});
		
		//검사항목 목록조회
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		if(mainGubunVal == '001'){
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		}else if(mainGubunVal == '002'){
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		} 
	});

	//오른쪽 화면 새로고침
	function getMoisRead(){
	  $.ajax({
			url : '<c:url value="qm/itemMoisMeasureRead"/>',
			type : 'GET',
			async : false,
			data : {
				'workOrdNo' : function() {return workOrdNoVal;},
				'matrlDate' : function() {return matrlDateVal;},
				'moisSeq' : function(){return moisSeqVal},		
			},
			success : function(res) {
				let data = res.data;		
				console.log(data.equipNm)
				
				$('#moisSeq').text((data.moisSeq==null?"1":data.moisSeq)+" 차");
				$('#equipNm').val(data.equipNm);
				$('#matrlCd').val(data.matrlCd);
				$('#matrlNm').val(data.matrlNm);
				$('#matrlGrade').val(data.matrlGrade);
				$('#moisDate').val(data.moisDate==null?"":moment(data.moisDate).format('YYYY-MM-DD'));
				$('#moisTime').val(data.moisTime);
				$('#moisChargr').val(data.moisChargr);
				$('#moisChargrNm').val(data.moisChargrNm);
				$('#moisPass').val(data.moisPass);
				$('#moisTemp').val(data.moisTemp);
				$('#moisDesc1').val(data.moisDesc1);
				$('#moisDesc2').val(data.moisDesc2);
				console.log(data.moisDesc2)

				//등록/수정 버튼처리
				/* if(data.moisDate==""|| data.moisDate==null){
					$('#btnAdd').attr('disabled',false);
					$('#btnEdit').attr('disabled',true);
				}else{
					$('#btnAdd').attr('disabled',true);
					$('#btnEdit').attr('disabled',false);
				} */
			}
		});
	}


	//수분측정 목록조회
	let itemMoisMeasureDtlList = $('#itemMoisMeasureDtlList').DataTable({
		dom : "",
		language : lang_kor,
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : true,
		fixedHeader: true,
		pageLength : 20, 
		ajax : {
			url : '<c:url value="qm/itemMoisMeasureDtlList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function() {return workOrdNoVal;},
				'matrlDate' : function() { return matrlDateVal;},		
			},
		}, 
		rowId : 'rowId',
		columns : [ 
			{ 
				data : 'moisSeq',
				render : function(data,type,row,meta){
					if(data!=null){
						return data+"차";
					}else{
						return '-';
					}
				}
			}, 
			{
				data : 'moisDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},		
			{ data : 'moisTime'}, 
			{ data : 'moisChargrNm' }, 
			{ data : 'moisTempNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data+" ℃";
					}else{
						return '-';
					}
				}
			}, 
			{ data : 'inspX1',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			}, 
			{ data : 'moisPassNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '미판정';
					}
				}
			}, 
		],
		columnDefs : [ 
			{ targets : "_all", className : 'text-center'} 
		],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});
	

	//수분측정 목록 클릭시
	$('#itemMoisMeasureDtlList tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');			
			return false;
		}
		
		if ( $(this).hasClass('selected') ) {
	        //$(this).removeClass('selected');
        }else {
        	$('#itemMoisMeasureDtlList').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		let data = itemMoisMeasureDtlList.row(this).data();
		moisSeqVal = data.moisSeq;
		moisPassVal = data.moisPass;
		getMoisRead();
		sideView2 = "edit";

		//검사항목 목록조회
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		if(mainGubunVal == '001'){
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		}else if(mainGubunVal == '002'){
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		} 
	});
	
	//등록버튼 클릭시
	$('#btnAdd').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}

		//화면처리
		uiProc(false);	

		$('#moisDate').val(serverDate);
		$('#moisChargrNm').val(userNm);
		$('#moisChargr').val(userNumber);
		$('#moisTime').val('');
		$('#moisPass').val('');
		$('#moisPass').attr('disabled',true);
		$('#moisTemp').val('');
		$('#moisDesc1').val('');
		$('#moisDesc2').val('');
		
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		

		if(moisSeqVal!=null && moisSeqVal!=""){
			moisSeqVal++;
		}else{
			moisSeqVal = 1;
		}
		$('#moisSeq').text(moisSeqVal+" 차");
		
		sideView ='add';	
	});
	
	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){

		if(itemMoisMeasureDtlList.data().count() == 0){
			toastr.warning("등록 후 수정해주세요.");
			return false;
		}
		
		if(sideView2 != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		if($('#inspectDate').val() == ''){
			toastr.warning("등록을 먼저 해주세요.");
			return false;
		}
		
		//화면처리
		if(moisPassVal==""){
			uiProc(false);
		}else{
			uiProc(false);
			$('#moisDateCalendar').attr('disabled',true);
			$('#moisTime').attr('disabled',true);
		}

		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#moisPass').attr('disabled',true);
		btnView = 'edit';
		sideView = 'edit';
	});		
	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
		if($('#moisDate').val()==""){
			toastr.warning("측정일자를 입력해주세요.");
			return false;
		}
		if($('#moisTime').val()==""){
			toastr.warning("측정시간을 입력해주세요.");
			return false;
		}
		if($('#moisChargr').val()==""){
			toastr.warning("측정자를 선택해주세요.");
			return false;
		}
		/* if($('#moisPass').val()==""){
			toastr.warning("판정을 선택해주세요.");
			return false;
		} */

		var url= "";
		if(sideView=="add"){
			url = '<c:url value="qm/itemMoisMeasureCreate"/>';
		}else{
			url = '<c:url value="qm/itemMoisMeasureUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'matrlDate' : function(){return matrlDateVal;},		
				'moisSeq' : function(){return moisSeqVal},		
				'moisDate' : function(){return $('#moisDate').val().replace(/-/g,'')},
				'moisTime' : function(){return $('#moisTime').val()},
				'moisChargr' : function(){return $('#moisChargr').val()},
				'moisPass' : function(){return $('#moisPass option:selected').val()},
				'moisTemp' : function(){return $('#moisTemp option:selected').val()},
				'moisDesc1' : function(){return $('#moisDesc1').val()},
				'moisDesc2' : function(){return $('#moisDesc2').val()},
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);
					$('#btnAdd').attr('disabled', false);
			    	$('#btnEdit').attr('disabled', false);				    	
			    	$('#btnSave').addClass('d-none');	

			    	//sideView2 = "";
			    	
			    	$('#itemMoisMeasureAdmTable').DataTable().ajax.reload();
			    	$('#itemMoisMeasureDtlList').DataTable().ajax.reload();
			    	
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	}) 
	

	//측정자 팝업 시작
	var userPopUpTable;
	function selectMoisChargr() {
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
						//'departmentCd' : '007'			
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
					"targets" : [ 0, 1, 2, 3, 4 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});

			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
					$('#moisChargr').val(data.userNumber);
					$('#moisChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		
		}

		
		
		$('#userPopUpModal').modal('show');
		
	}


	function uiProc(flag) {
		$('#moisDateCalendar').attr('disabled', flag);
		$('#moisTime').attr('disabled', flag);
		$('#btnMoisChargr').attr('disabled', flag);	
		$('#moisPass').attr('disabled', flag);
		$('#moisTemp').attr('disabled', flag);
		$('#moisDesc1').attr('disabled', flag);
		$('#moisDesc2').attr('disabled', flag);
	}

</script>
<script>

	var inspTypeVal="수분측정";
	
	//검사항목등록 버튼 클릭시
	$('#btnInspPopup').on('click',function(){
	
		if(!$('#itemMoisMeasureDtlList tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			return false;
		}
		
		inspTypeVal = '수분측정';
		$('#inspPopupModal').modal('show');

		//수분기준 조회
		$.ajax({
			url : '<c:url value="/bm/inspAdmRead"/>',
			type : 'GET',
			data : {
				'inspCd' : function(){return inspCdVal}
			},
			success : function(res){
				let data = res.data;
				inspDesc1Html = data.inspDesc1==null?"":data.inspDesc1;
				inspDesc2Html = data.inspDesc2==null?"":data.inspDesc2;
				
				var html = '<p class="m-0" style="text-align: right; color: #0073ff;">'+inspDesc1Html+'</p>';
				html += '<p class="m-0" style="text-align: right;">'+inspDesc2Html+'</p>';
				
				$('#sizeAdmTable_length').html(html);
				$('#sizeAdmTable2_length').html(html);
			}
		});

		if(mainGubunVal == '001'){
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			setTimeout(function(){
				sizeAdmTable2.draw();
			},200)
		}else if(mainGubunVal == '002'){
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			setTimeout(function(){
				sizeAdmTable.draw();
			},200)
		}
	});
	
	//중량 버튼 클릭시
	$('#btnWeight').on('click',function(){
		console.log('중량 버튼 클릭');
	
		inspTypeVal = '중량';
	
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightAdmTableDiv').removeClass('d-none');
		
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			weightAdmTable.draw();
		},200);
	});
	
	//수분측정 버튼 클릭시
	$('#btnSize').on('click',function(){
	
		console.log('수분측정 버튼 클릭');
	
		inspTypeVal = '수분측정';
		if(mainGubunVal == '001'){
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
			setTimeout(function(){
				sizeAdmTable2.draw();
			},200)
		}else if(mainGubunVal == '002'){
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
			setTimeout(function(){
				sizeAdmTable.draw();
			},200)
		}
	});
	
	
	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){
		if(inspTypeVal=="수분측정"){
			
			if(mainGubunVal=="001"){
				$('#sizeAdmTable2').find('input[name=inspX1]').attr('disabled',false);
			}else{
				$('#sizeAdmTable').find('input[name=inspX1]').attr('disabled',false);
			}
			
			$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
			$('#sizeAdmTable input[name=inspX1]').eq(0).select();
			$('#sizeAdmTable2 input[name=inspX1]').eq(0).focus();
			$('#sizeAdmTable2 input[name=inspX1]').eq(0).select();
			
		}else if(inspTypeVal=="중량"){

			let inspTypeArr = ['005'];
			
			$.ajax({
				url : '<c:url value="bm/getInspResult" />',
				type : 'GET',
				data : {
					'inspCd' 		  : function(){return inspCdVal},
					'inspResultGubun' : "005",
					'inspSourceNo' : function(){return workOrdNoVal},
					'inspSourceSubNo' : function(){return matrlDateVal+"-"+moisSeqVal},
					'inspTypeArr' : function(){return inspTypeArr},
					'inspType' : function(){return "005"}
				}, 
				success : function(res){
					if(res.data != "U"){
						$('#weightAdmTable').find('input[name=inspX1]').attr('disabled',false);
						$('#weightAdmTable input[name=inspX1]').eq(0).focus();
						$('#weightAdmTable input[name=inspX1]').eq(0).select();
					}else{
						toastr.warning("수분측정을 우선 검사해주세요.");
					}
				}
			});
		}
		
	});
	
	
	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array();


		
		if(inspTypeVal=="중량"){
			$('#weightAdmTable tbody tr').each(function(index, item) {
	
				var rowData = new Object();
	
				rowData.inspResultGubun = "005";
				rowData.inspSourceNo = workOrdNoVal;
				rowData.inspSourceSubNo = matrlDateVal+"-"+moisSeqVal;
				rowData.inspCd = weightAdmTable.row(index).data().inspCd;
				rowData.inspType = weightAdmTable.row(index).data().inspType;
				rowData.inspSeq = weightAdmTable.row(index).data().inspSeq;

				//최종판정
				let min = weightAdmTable.row(index).data().inspStandLower;
				let max = weightAdmTable.row(index).data().inspStandUpper;
				let inspData= $(this).find('td input[name=inspX1]').val().replace(/,/g,'');

				if(inspData!=null && inspData!=""){
					if((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max))){
						rowData.inspResult = "002";	//합격:001/불합격:002
					}else{
						rowData.inspResult = "001";	//합격:001/불합격:002
					}
				}else{
					rowData.inspResult = "";
				}
				
				
				rowData.inspX1 = $(this).find('td input[name=inspX1]').val().replace(/,/g,'');
				rowData.inspX2 = "";
				rowData.inspX3 = "";
				rowData.inspX4 = "";
				rowData.inspX5 = "";
				rowData.inspX6 = "";
				rowData.inspectGubun = "";
				dataArray.push(rowData);
				console.log(rowData)
			});
		}else{

			if(mainGubunVal=="001"){
				$('#sizeAdmTable2 tbody tr').each(function(index, item) {

					if($(this).find('td input[name=inspX1]').val()==""){
						toastr.warning("수분 측정결과를 우선 등록해주세요.");
						check = false;
						return false;
					}
	
					var rowData = new Object();
					
					rowData.inspResultGubun = "005";
					rowData.inspSourceNo = workOrdNoVal;
					rowData.inspSourceSubNo = matrlDateVal+"-"+moisSeqVal;
					rowData.inspCd = sizeAdmTable2.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable2.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable2.row(index).data().inspSeq;

					//최종판정
					let min = sizeAdmTable2.row(index).data().inspStandLower;
					let max = sizeAdmTable2.row(index).data().inspStandUpper;
					let inspData= $(this).find('td input[name=inspX1]').val().replace(/,/g,'');
					
					if(inspData!=null && inspData!=""){
						if((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max))){
							rowData.inspResult = "002";	//합격:001/불합격:002
						}else{
							rowData.inspResult = "001";	//합격:001/불합격:002
						}
					}else{
						rowData.inspResult = "";
					}
					
					rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
					rowData.inspX2 = "";
					rowData.inspX3 = "";
					rowData.inspX4 = "";
					rowData.inspX5 = "";
					rowData.inspX6 = "";
					rowData.inspectGubun = "";
					dataArray.push(rowData);
					console.log(rowData)
				});
			}else{
				$('#sizeAdmTable tbody tr').each(function(index, item) {
	
					var rowData = new Object();
					
					rowData.inspResultGubun = "005";
					rowData.inspSourceNo = workOrdNoVal;
					rowData.inspSourceSubNo = matrlDateVal+"-"+moisSeqVal;
					rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;

					//최종판정
					let min = sizeAdmTable.row(index).data().inspStandLower;
					let max = sizeAdmTable.row(index).data().inspStandUpper;
					let inspData= $(this).find('td input[name=inspX1]').val().replace(/,/g,'');
					
					if(inspData!=null && inspData!=""){
						if((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max))){
							rowData.inspResult = "002";	//합격:001/불합격:002
						}else{
							rowData.inspResult = "001";	//합격:001/불합격:002
						}
					}else{
						rowData.inspResult = "";
					}
					
					rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
					rowData.inspX2 = "";
					rowData.inspX3 = "";
					rowData.inspX4 = "";
					rowData.inspX5 = "";
					rowData.inspX6 = "";
					rowData.inspectGubun = "";
					dataArray.push(rowData);
					console.log(rowData)
				});
			}
		}
				
	
		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/inspResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");
	
						$('select[name=inspResult]').attr('disabled',true);
						$('input[name=inspX1]').attr('disabled',true);

						let inspTypeArr = ['003','005'];

						$.ajax({
							url : '<c:url value="bm/getInspResult" />',
							type : 'GET',
							data : {
								'inspCd' 		  : function(){return inspCdVal},
								'inspResultGubun' : "005",
								'inspSourceNo' : function(){return workOrdNoVal},
								'inspSourceSubNo' : function(){return matrlDateVal+"-"+moisSeqVal},
								'inspTypeArr' : function(){return inspTypeArr},
							}, 
							success : function(res){
								if(res.data == "Y"){
									$('#moisPass').val('001').attr('checked',true);
								}else if(res.data == "N"){
									$('#moisPass').val('002').attr('checked',true);
								}else if(res.data == "U"){
									$('#moisPass').val('').attr('checked',true);
								}

								$.ajax({
									url : '<c:url value="qm/itemMoisMeasureUpdate"/>',
									type : 'POST',
									async : false,
									data : {
										'workOrdNo' : function(){return workOrdNoVal;},
										'matrlDate' : function(){return matrlDateVal;},		
										'moisSeq' : function(){return moisSeqVal},		
										'moisPass' : function(){return $('#moisPass option:selected').val()},
									},
									success : function(res){
										if(res.result == "ok"){
									    	$('#itemMoisMeasureDtlList').DataTable().ajax.reload();
										}else{
											toastr.error(res.message);
										}
									}
								});
							}
						});
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});
	
	
	//중량 목록
	let weightAdmTable = $('#weightAdmTable').DataTable({
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
		scrollY: '35vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "005"},
				'inspSourceNo' : function(){return workOrdNoVal;},
				'inspSourceSubNo' : function(){return matrlDateVal+"-"+moisSeqVal;},
				'inspGubun' : function(){return "005"},
				'inspType' : function(){return "003";},
				'itemSeq' : function(){return matrlSeq;},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
	//			className : "text-left",
	//			targets : 2
		}, ],
		drawCallback : function() {
			var api = this.api();
	
			for(var i=0;i<api.data().count();i++) {
	
				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;
	
				console.log(min);
				for(var r=1; r<=6; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					if(r==1){
						inspResult = api.row(i).data().inspX1;
					}else if(r==2){
						inspResult = api.row(i).data().inspX2;
					}else if(r==3){
						inspResult = api.row(i).data().inspX3;
					}else if(r==4){
						inspResult = api.row(i).data().inspX4;
					}else if(r==5){
						inspResult = api.row(i).data().inspX5;
					}else if(r==6){
						inspResult = api.row(i).data().inspX6;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#weightAdmTable').find('input[name='+rString+']').eq(i).css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#weightAdmTable').find('input[name='+rString+']').eq(i).css('background','#92d050');
					}else{
						$('#weightAdmTable').find('input[name='+rString+']').eq(i).css('background','#f6f7f9');
					}
				}
			} 
		}
	});
	
	//수분측정 목록 - 사출
	let sizeAdmTable2 = $('#sizeAdmTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-9'><'col-sm-12 col-md-3'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '35vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "005"},
				'inspSourceNo' : function(){return workOrdNoVal;},
				'inspSourceSubNo' : function(){return matrlDateVal+"-"+moisSeqVal;},
				'inspGubun' : function(){return "005"},
				'inspType' : function(){return "005";},
				'itemSeq' : function(){return matrlSeq;},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			}, 
			{
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : [ {
	//			className : "text-left",
	//			targets : 2
			}, 
		],
		drawCallback : function() {
			var api = this.api();
	
			for(var i=0;i<api.data().count();i++) {
	
				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;
	
				for(var r=1; r<=6; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					if(r==1){
						inspResult = api.row(i).data().inspX1;
					}else if(r==2){
						inspResult = api.row(i).data().inspX2;
					}else if(r==3){
						inspResult = api.row(i).data().inspX3;
					}else if(r==4){
						inspResult = api.row(i).data().inspX4;
					}else if(r==5){
						inspResult = api.row(i).data().inspX5;
					}else if(r==6){
						inspResult = api.row(i).data().inspX6;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#sizeAdmTable2').find('input[name='+rString+']').eq(i).css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#sizeAdmTable2').find('input[name='+rString+']').eq(i).css('background','#92d050');
					}else{
						$('#sizeAdmTable2').find('input[name='+rString+']').eq(i).css('background','#f6f7f9');
					}
				}
			} 
		}
	});
	
	//수분측정 목록 - 봉제
	let sizeAdmTable = $('#sizeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-9'><'col-sm-12 col-md-3'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "005"},
				'inspSourceNo' : function(){return workOrdNoVal;},
				'inspSourceSubNo' : function(){return matrlDateVal+"-"+moisSeqVal;},
				'inspGubun' : function(){return "005"},
				'inspType' : function(){return "005";},
				'itemSeq' : function(){return itemSeq;},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{
				data : 'inspSpc',
				render : function(data, type, row, meta) {
					if (data == null) {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="min-width : 100%" />';
					} else if (data == '001') {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" checked disabled/>';
					} else {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" disabled/>';
					}
				}
			}, 
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {

					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},  
			{
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"disabled />';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : [ {
	//			className : "text-left",
	//			targets : 2
		}, ],
		drawCallback : function() {
			var api = this.api();
	
			for(var i=0;i<api.data().count();i++) {
	
				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;
	
				for(var r=1; r<=6; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					if(r==1){
						inspResult = api.row(i).data().inspX1;
					}else if(r==2){
						inspResult = api.row(i).data().inspX2;
					}else if(r==3){
						inspResult = api.row(i).data().inspX3;
					}else if(r==4){
						inspResult = api.row(i).data().inspX4;
					}else if(r==5){
						inspResult = api.row(i).data().inspX5;
					}else if(r==6){
						inspResult = api.row(i).data().inspX6;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#sizeAdmTable').find('input[name='+rString+']').eq(i).css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#sizeAdmTable').find('input[name='+rString+']').eq(i).css('background','#92d050');
					}else{
						$('#sizeAdmTable').find('input[name='+rString+']').eq(i).css('background','#f6f7f9');
					}
				}
			} 
		}
	});

	var html = '<p class="m-0" style="text-align: right; color: #0073ff;">${moisSpecHtml1}</p>';
	html += '<p class="m-0" style="text-align: right;">${moisSpecHtml2}</p>';
	$('#sizeAdmTable_length').html(html);
	$('#sizeAdmTable2_length').html(html);
	
	
	//x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){
		let inspResult = "";
		if(inspTypeVal=="수분측정"){
			if(mainGubunVal="001"){
				inspResult = $('#sizeAdmTable2').find('input[name='+result+']').eq(row).val();
				console.log('inspResult:'+inspResult);
				
				if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
					$('#sizeAdmTable2').find('input[name='+result+']').eq(row).css('background','#ff0000');
				}else{
					$('#sizeAdmTable2').find('input[name='+result+']').eq(row).css('background','#92d050');
				}
				
			}else{
				inspResult = $('#sizeAdmTable').find('input[name='+result+']').eq(row).val();
				console.log('inspResult:'+inspResult);

				if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
					$('#sizeAdmTable').find('input[name='+result+']').eq(row).css('background','#ff0000');
				}else{
					$('#sizeAdmTable').find('input[name='+result+']').eq(row).css('background','#92d050');
				}
			}
			
		}else{
			inspResult = $('#weightAdmTable').find('input[name='+result+']').eq(row).val();
			console.log('inspResult:'+inspResult);

			if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
				$('#weightAdmTable').find('input[name='+result+']').eq(row).css('background','#ff0000');
			}else{
				$('#weightAdmTable').find('input[name='+result+']').eq(row).css('background','#92d050');
			}
		}

		
	} 


	//소숫점 2/3자리 제한
	$(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5],input[name=inspX6]", function(event){

		if(inspTypeVal=="중량"){
			var _pattern3 = /^\d*[.]\d{4}$/;	//셋째자리
			if (_pattern3.test( $(this).val())) {
	        	toastr.warning("소수점 셋째 자리까지 입력 가능합니다.");
	        	$(this).val(parseFloat($(this).val()).toFixed(3));
	            return false;
			}
		}else{
			var _pattern3 = /^\d*[.]\d{3}$/;	//둘째자리
			if (_pattern3.test( $(this).val())) {
	        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
	        	$(this).val(parseFloat($(this).val()).toFixed(2));
	            return false;
			}
		}
	});
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		
		var option = "<option value=''>선택</option>";
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

	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){
			console.log("커서이동입니다.");
			console.log("value:" + value);	//inspX1
			console.log("row:" + row);		//0

			if(type=="w"){//중량
				rowCount = weightAdmTable.data().count()-1;	//행수
			}else if(type=="s"){//치수-봉제
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="s2"){//치수-사출
				rowCount = sizeAdmTable2.data().count()-1;	//행수
			}else if(type=="e"){//외관
				rowCount = extAdmTable.data().count()-1;	//행수
			}

			console.log(rowCount >= row+1);
			console.log('#'+type+'-inspResult'+(value+1)+'-'+(row+1));
			
			if(type=="e"){
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+'-'+(row+1)+'').focus();
						$('#'+type+'-inspResult'+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value+1)+'-0').focus();
						$('#'+type+'-inspResult'+(value+1)+'-0').select();
					},10);
				}
			} else {
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value+1)+'-0').focus();
						$('#'+type+'-inspX'+(value+1)+'-0').select();
					},10);
				}
			}
			
			
		}
	}
	
</script>

</body>
</html>

