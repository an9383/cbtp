<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!-- 사진 모달 시작-->
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!-- 사진 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">공정검사관리대장(후가공)</li>
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
						<table id="itemPrcssCompleteAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>작업지시번호</th>
									<th>설비명</th>
									<th>공정명</th>
									<th>품번</th>
									<th>품명</th>
									<th>검사일자</th>
									<th class="text-center">검사수량</th>	
									<th class="text-center">초물</th>	
									<th class="text-center">중물</th>	
									<th class="text-center">종물</th>				
									<th class="text-center">승인구분</th>								
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
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup1">초물</button>	
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup2">중물</button>
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup3">종물</button>					
								<button type="button" class="btn btn-primary float-right d-none" 	  id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 	  id="btnAdd">등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-1"
										id="itemInspectAdmTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>설비명</th>
												<td><input type="text" class="form-control" id="equipNm" name="equipNm"  disabled />
												<input type="hidden" id="workEndTime" name="workEndTime"  disabled /></td>
												<th>검사일자</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="inspectDate" name="inspectDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="inspectDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</tr>
											<tr>
												<th>작업자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="workChargrSugi"name="workChargrSugi" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="workChargrSugiNm" name="workChargrSugiNm" disabled>
													</div>
												</td>
												<th>검사자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="inspectChargr"name="inspectChargr" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="inspectChargrNm" name="inspectChargrNm" disabled>
														<button type="button" class="btn btn-primary input-sub-search"name="btnInspectChargr" id="btnInspectChargr" onClick="selectInspectChargr();">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
												</td>
											</tr>
											<tr>
												<th>품번</th>
												<td><input type="text" class="form-control" id="itemCd" name="itemCd" disabled /></td>
												<th>품명</th>
												<td>
													<input class="form-control" style="max-width: 100%" type="text" id="itemNm" name="itemNm" maxlength="10" disabled />
												</td>											
											</tr>
											<tr>
												<th>초.중.종<br>시료수 체크</th>
												<td>
													<select class="custom-select" id="cavityCnt" style="min-width : 100%;" disabled>
														<option value="001">1개</option>
														<option value="002">2개</option>
														<option value="003">3개</option>
														<option value="004">4개</option>
														<option value="005">5개</option>
														<option value="006">6개</option>
														<option value="007">7개</option>
														<option value="008">8개</option>
														<option value="009">9개</option>
														<option value="010">10개</option>
													</select>
												</td>
												<th></th>
												<td></td>
												<th class="d-none">LOT NO</th>
												<td class="d-none"><input type="text" class="form-control" id="lotNoSugi" name="lotNoSugi"  disabled /></td>
											</tr>
																						
										</thead>
									</table>
								</div>
							</form>	
							<form id="form3">
								<div class="table-responsive">
									<table id="itemMatrlTable" class="table table-bordered">
										<colgroup>										
										</colgroup>					
										<thead class="thead-light">
											<tr>
												<th>원재료 재료명</th>
												<th>원재료 GRADE</th>										
												<th>원재료 LOT NO</th>
												
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<form id="form8" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">제품사진</th>
										</tr>
										<tr>
											<th>사진1</th>
											<th>사진2</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src="" onClick="imgShow(imgSrc1)"
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src="" onClick="imgShow(imgSrc2)"
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<th>사진3</th>
											<th>사진4</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile3" src="" onClick="imgShow(imgSrc3)"
														name="imageFile3" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4" src="" onClick="imgShow(imgSrc4)"
														name="imageFile4" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
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
						<button type="button" class="btn btn-primary" id="btnExt">외관</button>
						<button type="button" class="btn btn-primary" id="btnSize">치수</button>
						
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:370px;">기준</th>
										<th rowspan="2" style="min-width:60px;">확인방법</th>
										<th colspan="10" id="extBlueTh" style="min-width: 900px; background-color: #6bbcfb;">초.중.종 시료수</th>
									</tr>
									<tr>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
										<th>X6</th>
										<th>X7</th>
										<th>X8</th>
										<th>X9</th>
										<th>X10</th>
									</tr>
								</thead>
							</table>
						</div>
						
						<div class="table-responsive d-none" id="sizeAdmTableDiv">
							<table class="table table-bordered" id="sizeAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:100px;">목록</th>
										<th rowspan="2" style="min-width:50px;">확인방법</th>
										<th colspan="2" style="min-width:200px;">기준</th>
										<th colspan="10" id="sizeBlueTh" style="min-width: 900px; background-color: #6bbcfb;">초.중.종 시료수</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
										<th>X6</th>
										<th>X7</th>
										<th>X8</th>
										<th>X9</th>
										<th>X10</th>
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

	let currentHref = "qmsc0240";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공정검사관리대장(후가공)"); 
	
	uiProc(true);
	let serverDateFrom =  "${serverDateFrom}";
	let serverDateTo =  "${serverDateTo}";
	let serverDate = "${serverDate}";
	let userNm =  "${userNm}";
	let userNumber = "${userNumber}";
	
	let sideView = 'add';
	let btnView = '';
	let workOrdNo = '';
	let workEndTime = '';
	let itemSeq = '';
	let mainGubun = null;
	let approvalTotal = '';
	let mdInspectYn = null;
	let workProgNoVal = "";
	
	//공통코드 시작
	let qaEvalCode = new Array();
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>	

	let inputMethodCode = new Array();	//검사입력방식
    <c:forEach items="${inputMethod}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inputMethodCode.push(json);
	</c:forEach>

	let judgeCode = new Array();	//판정
    <c:forEach items="${judge}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		judgeCode.push(json);
	</c:forEach>

	let silhangCode = new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		silhangCode.push(json);
	</c:forEach>
	//공통코드 끝

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnSave').addClass('d-none');

		$('#btnInspPopup1').attr('disabled', true);
    	$('#btnInspPopup2').attr('disabled', true);
    	$('#btnInspPopup3').attr('disabled', true);

    	$('#cavityCnt').attr('disabled', true);
    	
		$('#itemMatrlTable').DataTable().clear().draw();
	});

	//메인 테이블
	let itemPrcssCompleteAdmTable = $('#itemPrcssCompleteAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12 col-md-12'f>>"
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
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="qm/itemPrcssCompleteAdmDataListByBongjae"/>',
			type : 'GET',
			data : {
				'startDate' 	: function(){ return serverDateFrom.replace(/-/g, ''); },
				'endDate' 		: function(){ return serverDateTo.replace(/-/g, ''); },
				'approvalTotal' : function(){ return approvalTotal; },
				'mainGubun' 	: function(){ return '002'; },
			},
		}, 
		rowId : 'rowId',
		columns : [
			{//작업지시번호
				data : 'workOrdNo' 
			}, 
			{//설비명
				data : 'equipNm' 
			},
			{//공정명
				data : 'prcssNm' 
			}, 			
			{//품번
				data : 'itemCd' 
			}, 
			{//품명
				data : 'itemNm' 
			},
			{//검사일자
				data : 'inspectDate' ,						
				render : function(data, type, row, meta){
					if(data != null){
						let result = data == null ? data : moment(data).format('YYYY-MM-DD')
						return result;
					} else {
						return '-';
					}
				}			
			},
			{//검사수량
				data : 'fairQty2' ,
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-right'
			}, 	
			{//초물
				data : 'approvalCho'
			},
			{//중물
				data : 'approvalJung',
				render : function(data, type, row, meta){
					if(row['mdInspectYn'] == "002"){
						return '<span style="color:gray;">검사안함</span>';
					} else {
						return data;
					}
				}		
			},
			{//종물
				data : 'approvalJong'
			},
			{//승인구분
				data : 'approvalTotal',
				render : function(data, type, row, meta){
					if(data=="승인"){
						return '<span>'+data+'</span>';
					}else{
						return '<span style="color:red;">'+data+'</span>';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});

	let html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">검사일자</label>';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preInWhsDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>';
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preInWhsDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인구분</label>';
		html1 += '&nbsp;<select class="custom-select" id="approvalTotal"><option value="" selected>전체</option><option value="001">승인</option><option value="002">미승인</option></select>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnAllRetv">전체조회</button>';
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right d-none" id="printCnt" placeholder="매수" style="width:40px;" value="1">';
		html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info d-none" id="btnQAPrint">QA라벨발행</button>'
	    html1 += '</div>';
   
	$('#itemPrcssCompleteAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click', function(){

		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').addClass('d-none');

		$('#itemMatrlTable').DataTable().clear().draw();

		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		approvalTotal = $('#approvalTotal option:selected').val();

		
		$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload(function() {});
	});


	//전체조회버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').addClass('d-none');

		$('#itemMatrlTable').DataTable().clear().draw();

		serverDateFrom = "";
		serverDateTo = "";
		approvalTotal = "";
		
		$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload(function() {});
	});


	//메인목록 클릭시
	$('#itemPrcssCompleteAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');			
			return false;
		}
		if ( $(this).hasClass('selected') ) {
//  	        $(this).removeClass('selected');
        } else {
        	$('#itemPrcssCompleteAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		$('#itemMatrlTable').removeClass('tr_highlight_row');	//hover
		
		let data = itemPrcssCompleteAdmTable.row(this).data();
		workOrdNo = data.workOrdNo;
		workEndTime = data.workEndTime;
		itemSeq = data.itemSeq;
		mainGubun = data.mainGubun;

		workProgNoVal = data.workProgNo
		mdInspectYn = data.mdInspectYn;

		//중물검사 
    	if ( mdInspectYn == "002" ) {
    		$('#btnInspPopup2').attr('disabled', true);
        } else {
        	$('#btnInspPopup2').attr('disabled', false);
        }
        
		$('#equipNm').val(data.equipNm); 
		$('#workEndTime').val(data.workEndTime); 
		$('#itemNm').val(data.itemNm); 
		$('#itemCd').val(data.itemCd); 
		$('#workChargrSugiNm').val(data.workChargrNm); 
		
	    $('#btnSave').addClass('d-none');	 				
	    $('#itemMatrlTable').DataTable().ajax.reload(function(){});
		$('#btnAdd').attr('disabled',false);
		$('#btnEdit').attr('disabled',false);

	    $.ajax({
			url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'workOrdNo' 	: function(){ return workOrdNo; },
				'workEndTime' 	: function(){ return workProgNoVal; },
			},
			success : function(res) {
				let data2 = res.data;
				console.log(data2);
				$('#lotNoSugi').val(data2==null?"":data2.lotNoSugi); 
				$('#inspectChargr').val(data2==null?"":data2.inspectChargr);
				$('#inspectChargrNm').val(data2==null?"":data2.inspectChargrNm);
				$('#inspectDate').val(data2==null?"":moment(data2.inspectDate).format("YYYY-MM-DD"));
				$('#cavityCnt').val(data2==null?"001":data2.cavityCnt);
			}
		});
	    
	    if ( $('#inspectDate').val() == '' ) {
	    	$('#btnEdit').attr('disabled', true);
		} else {
			$('#btnAdd').attr('disabled', true);	    	
		}

	    imgPrint();
		
	});
	
	//수입검사관리대장 바코드별 목록조회
	let itemMatrlTable = $('#itemMatrlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		ajax : {
			url : '<c:url value="qm/itemPrcssCompleteAdmMatrlDataList"/>',
			type : 'GET',
			data : {
				'workOrdNo' 	:  function(){ return workOrdNo; },
				'workProgNo' 	:  function(){ return workProgNoVal; },
			},
		},
		columns : [
			{data : 'itemNm'}, 
			{data : 'itemGrade'},
			{data : 'barcodeNo'},
			
		],
		columnDefs: [			
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	    ],
	});
	
	//등록버튼 클릭시
	$('#btnAdd').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);	

		$('#itemMatrlTable').addClass('tr_highlight_row');	//hover
		
		$('#inspectChargrNm').val(userNm);
		$('#inspectChargr').val(userNumber);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		
		$('#cavityCnt').attr('disabled', false);
	
		sideView ='add';	
		
	});
	
	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		if($('#inspectDate').val() == ''){
			toastr.warning("등록을 먼저 해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);

		$('#itemMatrlTable').addClass('tr_highlight_row');	//hover		
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		
		btnView = 'edit';
		sideView = 'edit';
	});		
	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
		if($('#inspectDate').val()==""){
			toastr.warning("검사일자을 입력해주세요.");
			return false;
		}
		if($('#inspectChargrNm').val()==""){
			toastr.warning("검사자을 입력해주세요.");
			return false;
		}

		let url = "";
		if (sideView == "add") {
			url = '<c:url value="qm/itemPrcssCompleteAdmCreate"/>';
		} else {
			url = '<c:url value="qm/itemPrcssCompleteAdmUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNo;},
				'workEndTime' : function(){return workProgNoVal;},
				'inspectDate' : function(){return $('#inspectDate').val().replace(/-/g,'')},
				'inspectChargr' : function(){return $('#inspectChargr').val()},
				'lotNoSugi' : function(){return $('#lotNoSugi').val()},
				'cavityCnt' : function(){return $('#cavityCnt').val()},
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);
					$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);				    	
			    	$('#btnSave').addClass('d-none');			   	
					$('#itemMatrlTable').removeClass('tr_highlight_row');	//hover
			    	
					$('#cavityCnt').attr('disabled', true);
					
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	}) 
	
	//담당자 팝업 시작
	let userPopUpTable;
	function selectInspectChargr() {
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
				
					$('#inspectChargr').val(data.userNumber);
					$('#inspectChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		
		}
		$('#userPopUpModal').modal('show');
	}
	
	function uiProc(flag) {
		$('#inspectDateCalendar').attr('disabled', flag);
		$('#btnInspectChargr').attr('disabled', flag);
		$('#lotNoSugi').attr('disabled', flag);
	}
	
	//이미지 보여주기 관련 컬럼
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeq;},
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;

				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src", "data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);

					imgSrc1 = data.imageFile1;
				} else {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
					
					imgSrc1 = '';
				}
				
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src", "data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
					
					imgSrc2 = data.imageFile2;
				} else {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
					
					imgSrc2 = '';
				}
				
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src", "data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
					
					imgSrc3 = data.imageFile3;
				} else {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
					
					imgSrc3 = '';
				}
				
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src", "data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
					
					imgSrc4 = data.imageFile4;
				} else {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
					
					imgSrc4 = '';
				}

			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}
	
	//이미지 보여주기
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
	//초중종 관련 컬럼
	let chojungjong = '001';
	let inspTypeVal = "외관";
	
	//검사항목등록 초물 버튼 클릭 시
	$('#btnInspPopup1').on('click', function(){
		let check = true;
		if ( !$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected') ) {
			toastr.warning("검사항목을 등록할 목록을 선택해주세요.");
			check = false;
			return false;
		}
		
		if (check) {
			let readData = null;
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' 	: function(){ return workOrdNo; },
					'workEndTime' 	: function(){ return workProgNoVal; },
				},
				success : function(res) {
					readData = res.data;
				}
			});
				
			if ( readData == null ) {
				toastr.warning("초물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}
			
			inspTypeVal = "외관";
			chojungjong = '001';
	
			$('#inspPopupModal').modal('show');
			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){});
			
			extTbColumnVisible($('#cavityCnt').val()*1);
			
		}
		
	});

	//검사항목등록 - 중물
	$('#btnInspPopup2').on('click',function(){		
		let check = true;
		if ( !$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected') ) {
			toastr.warning("검사항목을 등록할 목록을 선택해주세요.");
			check = false;
			return false;
		}
		
		if (check) {
			let readData = null;
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' 	: function(){ return workOrdNo; },
					'workEndTime' 	: function(){ return workProgNoVal; },
				},
				success : function(res) {
					readData = res.data;	
				}				
			});

			if ( readData == null ) {
				toastr.warning("중물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}

			inspTypeVal = "외관";
			chojungjong = '002';
			
			$('#inspPopupModal').modal('show');

			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){});
			
			extTbColumnVisible($('#cavityCnt').val()*1);
			
		}

	});

	//검사항목등록 - 종물
	$('#btnInspPopup3').on('click',function(){
		let check = true;
		if ( !$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected') ) {
			toastr.warning("검사항목을 등록할 목록을 선택해주세요.");
			check = false;
			return false;
		}
		
		if (check) {
			let readData = null;
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' 	: function(){ return workOrdNo; },
					'workEndTime' 	: function(){ return workProgNoVal; },
				},
				success : function(res) {
					readData = res.data;		
				}				
			});
				
			if ( readData == null ) {
				toastr.warning("종물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}
			
			inspTypeVal = "외관";
			chojungjong = '003';
			
			$('#inspPopupModal').modal('show');
	
			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){});
			
			extTbColumnVisible($('#cavityCnt').val()*1);
			
		}
		
	});
	
	//외관 버튼 클릭시
	$('#btnExt').on('click', function(){
		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#cavityCnt').val()*1);
		
	});
	
	//치수 버튼 클릭시
	$('#btnSize').on('click', function(){
		inspTypeVal = '치수';

		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		
		sizeTbColumnVisible($('#cavityCnt').val()*1);
		
	});
	
	//외관 테이블 컬럼 화면 변경
	function extTbColumnVisible(sampleCntVal){
		extAdmTable.column(4).visible(true);
	 	extAdmTable.column(5).visible(true);
	 	extAdmTable.column(6).visible(true);
	 	extAdmTable.column(7).visible(true);
	 	extAdmTable.column(8).visible(true);
	 	extAdmTable.column(9).visible(true);
	 	extAdmTable.column(10).visible(true);
	 	extAdmTable.column(11).visible(true);
	 	extAdmTable.column(12).visible(true);
	 	
		switch ( sampleCntVal ) {
		 	case 1:
		 		extAdmTable.column(4).visible(false);
		 	case 2:
			 	extAdmTable.column(5).visible(false);
		 	case 3:
			 	extAdmTable.column(6).visible(false);
		 	case 4:
			 	extAdmTable.column(7).visible(false);
		 	case 5:
			 	extAdmTable.column(8).visible(false);
		 	case 6:
			 	extAdmTable.column(9).visible(false);
		 	case 7:
			 	extAdmTable.column(10).visible(false);
		 	case 8:
			 	extAdmTable.column(11).visible(false);
		 	case 9:
			 	extAdmTable.column(12).visible(false);
	 	}
		let minWidth = (sampleCntVal * 90) + "px";
		$('#extBlueTh').css("min-width", minWidth);
		
		setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		}, 300);
	}
	
	//치수 테이블 컬럼 화면 변경
	function sizeTbColumnVisible(sampleCntVal){
	 	sizeAdmTable.column(6).visible(true);
	 	sizeAdmTable.column(7).visible(true);
	 	sizeAdmTable.column(8).visible(true);
	 	sizeAdmTable.column(9).visible(true);
	 	sizeAdmTable.column(10).visible(true);
	 	sizeAdmTable.column(11).visible(true);
	 	sizeAdmTable.column(12).visible(true);
	 	sizeAdmTable.column(13).visible(true);
	 	sizeAdmTable.column(14).visible(true);
	 	
		switch ( sampleCntVal ) {
		 	case 1:
			 	sizeAdmTable.column(6).visible(false);
		 	case 2:
			 	sizeAdmTable.column(7).visible(false);
		 	case 3:
			 	sizeAdmTable.column(8).visible(false);
		 	case 4:
			 	sizeAdmTable.column(9).visible(false);
		 	case 5:
			 	sizeAdmTable.column(10).visible(false);
		 	case 6:
			 	sizeAdmTable.column(11).visible(false);
		 	case 7:
			 	sizeAdmTable.column(12).visible(false);
		 	case 8:
			 	sizeAdmTable.column(13).visible(false);
		 	case 9:
			 	sizeAdmTable.column(14).visible(false);
	 	}
		let minWidth = (sampleCntVal * 90) + "px";
		$('#sizeBlueTh').css("min-width", minWidth);
		
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable.draw();
		}, 300);
	}
	
	//검사항목등록 등록버튼 클릭시
	$('#btnInspAdd').on('click', function() {
		
		$('select[name=inspResult]').attr('disabled', false);

		$('input[name=inspX1]').attr('disabled', false);
		$('input[name=inspX2]').attr('disabled', false);
		$('input[name=inspX3]').attr('disabled', false);
		$('input[name=inspX4]').attr('disabled', false);
		$('input[name=inspX5]').attr('disabled', false);
		$('input[name=inspX6]').attr('disabled', false);
		$('input[name=inspX7]').attr('disabled', false);
		$('input[name=inspX8]').attr('disabled', false);
		$('input[name=inspX9]').attr('disabled', false);
		$('input[name=inspX10]').attr('disabled', false);
		
		$('select[name=inspResult1]').attr('disabled', false);
		$('select[name=inspResult2]').attr('disabled', false);
		$('select[name=inspResult3]').attr('disabled', false);
		$('select[name=inspResult4]').attr('disabled', false);
		$('select[name=inspResult5]').attr('disabled', false);
		$('select[name=inspResult6]').attr('disabled', false);
		$('select[name=inspResult7]').attr('disabled', false);
		$('select[name=inspResult8]').attr('disabled', false);
		$('select[name=inspResult9]').attr('disabled', false);
		$('select[name=inspResult10]').attr('disabled', false);

		//focus&select
		$('#extAdmTable select[name=inspResult1').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).select();
		
	});
	
	//저장버튼 클릭시
	$('#btnInspSave').on('click', function(){
		let check = true;
		let dataArray = new Array();
		
		if ( inspTypeVal == "외관" ) {
			$('#extAdmTable tbody tr').each(function(index, item) {
				let rowData = new Object();

				rowData.inspResultGubun = "002";
				rowData.inspSourceNo = workOrdNo;
				rowData.inspSourceSubNo = workProgNoVal;
				rowData.inspCd = extAdmTable.row(index).data().inspCd;
				rowData.inspType = extAdmTable.row(index).data().inspType;
				rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
				rowData.inspectGubun = chojungjong;
				rowData.inspPass = $(this).find('td select[name=inspResult]').val();
				
				//inspResult 값 설정
				let resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val()*1;
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					if ( $(this).find('td select[name=inspResult'+i+']').val() == "001" ) {
						resultYCnt++;
					}
					if ( $(this).find('td select[name=inspResult'+i+']').val() == "" ) {
						resultYCnt = -1;
						break;
					}
				}
				if(resultYCnt == cavityCntVal){
					rowData.inspResult = "001";	//합격
				}else if(resultYCnt == -1){
					rowData.inspResult = "";	//미판정
				}else{
					rowData.inspResult = "002";	//불합격
				}

				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch (cavityCntVal) {
					case 10:
						rowData.inspX10 = $(this).find('td select[name=inspResult10]').val();
					case 9:
						rowData.inspX9 = $(this).find('td select[name=inspResult9]').val();
					case 8:
						rowData.inspX8 = $(this).find('td select[name=inspResult8]').val();
					case 7:
						rowData.inspX7 = $(this).find('td select[name=inspResult7]').val();
					case 6:
						rowData.inspX6 = $(this).find('td select[name=inspResult6]').val();
					case 5:
						rowData.inspX5 = $(this).find('td select[name=inspResult5]').val();
					case 4:
						rowData.inspX4 = $(this).find('td select[name=inspResult4]').val();
					case 3:
						rowData.inspX3 = $(this).find('td select[name=inspResult3]').val();
					case 2:
						rowData.inspX2 = $(this).find('td select[name=inspResult2]').val();
					case 1:
						rowData.inspX1 = $(this).find('td select[name=inspResult1]').val();
				}
				dataArray.push(rowData);
				
			});
		} else if (inspTypeVal == "치수") {
			$('#sizeAdmTable tbody tr').each(function(index, item) {
				let rowData = new Object();
				
				let pass = true;
				let passCheck = true;
				rowData.inspResultGubun = "002";
				rowData.inspSourceNo = workOrdNo;
				rowData.inspSourceSubNo = workProgNoVal;
				rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
				rowData.inspType = sizeAdmTable.row(index).data().inspType;
				rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
				rowData.inspectGubun = chojungjong;

				let min = sizeAdmTable.row(index).data().inspStandLower;
				let max = sizeAdmTable.row(index).data().inspStandUpper;
				let resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val()*1;
				
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					let inspData = $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

					if ( !((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max))) ) {
						resultYCnt++;
					}
					if ( inspData == null || inspData == "" ) {
						resultYCnt = -1;
						break;
					}
				}
				if (resultYCnt == cavityCntVal) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1) {
					rowData.inspResult = "";	//미판정
				} else {
					rowData.inspResult = "002";	//불합격
				}
				
				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch (cavityCntVal) {
					case 10:
						rowData.inspX10 = $(this).find('td input[name=inspX10]').val();
					case 9:
						rowData.inspX9 = $(this).find('td input[name=inspX9]').val();
					case 8:
						rowData.inspX8 = $(this).find('td input[name=inspX8]').val();
					case 7:
						rowData.inspX7 = $(this).find('td input[name=inspX7]').val();
					case 6:
						rowData.inspX6 = $(this).find('td input[name=inspX6]').val();
					case 5:
						rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
					case 4:
						rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
					case 3:
						rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					case 2:
						rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
					case 1:
						rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
				}
				
				if($(this).find('td input[name=inspX1]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX1]').val())) || (parseFloat($(this).find('td input[name=inspX1]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}
				}
				if($(this).find('td input[name=inspX2]').val() != ""){
					passCheck = false;
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX2]').val())) || (parseFloat($(this).find('td input[name=inspX2]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX3]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX3]').val())) || (parseFloat($(this).find('td input[name=inspX3]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX4]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX4]').val())) || (parseFloat($(this).find('td input[name=inspX4]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX5]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX5]').val())) || (parseFloat($(this).find('td input[name=inspX5]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX6]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX6]').val())) || (parseFloat($(this).find('td input[name=inspX6]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX7]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX7]').val())) || (parseFloat($(this).find('td input[name=inspX7]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX8]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX8]').val())) || (parseFloat($(this).find('td input[name=inspX8]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX9]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX9]').val())) || (parseFloat($(this).find('td input[name=inspX9]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX10]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX10]').val())) || (parseFloat($(this).find('td input[name=inspX10]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}

				if(passCheck){
					rowData.inspPass ='';
				} else{
					if(pass){
						rowData.inspPass ='001';
					} else{
						rowData.inspPass ='002';
					}
					
				}	
				dataArray.push(rowData);
				
			});
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnInspAdd onclick");
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspPrcResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");

						$('select[name=inspResult]').attr('disabled', true);
						$('input[name=inspX1]').attr('disabled', true);
						$('input[name=inspX2]').attr('disabled', true);
						$('input[name=inspX3]').attr('disabled', true);
						$('input[name=inspX4]').attr('disabled', true);
						$('input[name=inspX5]').attr('disabled', true);
						$('input[name=inspX6]').attr('disabled', true);
						$('input[name=inspX7]').attr('disabled', true);
						$('input[name=inspX8]').attr('disabled', true);
						$('input[name=inspX9]').attr('disabled', true);
						$('input[name=inspX10]').attr('disabled', true);
						
						$('select[name=inspResult1]').attr('disabled', true);
						$('select[name=inspResult2]').attr('disabled', true);
						$('select[name=inspResult3]').attr('disabled', true);
						$('select[name=inspResult4]').attr('disabled', true);
						$('select[name=inspResult5]').attr('disabled', true);
						$('select[name=inspResult6]').attr('disabled', true);
						$('select[name=inspResult7]').attr('disabled', true);
						$('select[name=inspResult8]').attr('disabled', true);
						$('select[name=inspResult9]').attr('disabled', true);
						$('select[name=inspResult10]').attr('disabled', true);

						$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload();
						
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});
	
	//외관 목록
	let extAdmTable = $('#extAdmTable').DataTable({
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
		pageLength : -1,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 3
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' 	: function(){ return "002"; },
				'inspSourceNo' 		: function(){ return workOrdNo; },
				'inspSourceSubNo' 	: function(){ return workProgNoVal; },				
				'inspGubun' 		: function(){ return "002"; },
				'inspType' 			: function(){ return "001"; },
				'itemSeq' 			: function(){ return itemSeq; },
				'inspectGubun'		: function(){ return chojungjong; },
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{//기준
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
			{//X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="002"){
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}
				},
				'className' : 'text-center'
			},
			{//X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="003"){
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}
				},
				'className' : 'text-center'
			},
			{//X4
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="004"){
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}
				},
				'className' : 'text-center'
			},
			{//X5
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="005"){
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}
				},
				'className' : 'text-center'
			},
			{//X6
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}
				},
				'className' : 'text-center'
			},
			{//X7
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}
				},
				'className' : 'text-center'
			},
			{//X8
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}
				},
				'className' : 'text-center'
			},
			{//X9
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}
				},
				'className' : 'text-center'
			},
			{//X10
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ 
		]
	});
	
	//치수 목록 - 후가공
	let sizeAdmTable = $('#sizeAdmTable').DataTable({
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
		pageLength : -1,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 5
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' 	: function(){ return "002"; },
				'inspSourceNo' 		: function(){ return workOrdNo; },
				'inspSourceSubNo' 	: function(){ return workProgNoVal; },				
				'inspGubun' 		: function(){ return "002"; },
				'inspType' 			: function(){ return "002"; },
				'itemSeq' 			: function(){ return itemSeq; },
				'inspectGubun'		: function(){ return chojungjong; },
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
        		},
				'className' : 'text-center'
			},
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//기준 - 하한
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
			{//기준 - 상한
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
			{//X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X4
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X5
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X6
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X7
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X8
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X9
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X10
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
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
// 			className : "text-left",
// 			targets : 2
			}, 
		],
		drawCallback : function() {
			var api = this.api();

			for ( var i=0; i < api.data().count(); i++ ) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				let cavityCntVal = $('#cavityCnt').val()*1;
				
				for (var r = 1; r <= cavityCntVal; r++) {
					let rString = "inspX"+r;
					let inspResult = "";
					
					switch(r){
						case 1:
							inspResult = api.row(i).data().inspX1;
							break;
						case 2:
							inspResult = api.row(i).data().inspX2;
							break;
						case 3:
							inspResult = api.row(i).data().inspX3;
							break;
						case 4:
							inspResult = api.row(i).data().inspX4;
							break;
						case 5:
							inspResult = api.row(i).data().inspX5;
							break;
						case 6:
							inspResult = api.row(i).data().inspX6;
							break;
						case 7:
							inspResult = api.row(i).data().inspX7;
							break;
						case 8:
							inspResult = api.row(i).data().inspX8;
							break;
						case 9:
							inspResult = api.row(i).data().inspX9;
							break;
						case 10:
							inspResult = api.row(i).data().inspX10;
							break;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#92d050');
					}else{
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#f6f7f9');
					}
				}
			} 
		}
	});
	
	//소숫점 2자리 제한
	$(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5],input[name=inspX6]", function(event){
		var _pattern3 = /^\d*[.]\d{3}$/;	//누르고있는 키는 예외처리 안됨
        if (_pattern3.test( $(this).val())) {
        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
        	$(this).val("0");
 			$(this).select();
            return false;
		}
	});
	
	//치수 x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){

		let inspResult = $('input[name='+result+']').eq(row).val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('input[name='+result+']').eq(row).css('background','#ff0000');
		}else{
			$('input[name='+result+']').eq(row).css('background','#92d050');
		}
	}
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" id="e-'+id+'-'+meta.row+'" onkeydown="moveFocus(\'e\','+idx+','+meta.row+')" data-col="' + meta.col + '" disabled>';
		
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

			if ( type == "s" ) { //치수-후가공
				rowCount = sizeAdmTable.data().count()-1;	//행수
			} else if ( type == "e" ) { //외관
				rowCount = extAdmTable.data().count()-1;	//행수
			}

			console.log(rowCount >= row+1);
			console.log('#'+type+'-inspResult'+(value+1)+'-'+(row+1));
			
			if(type=="e"){
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').select();
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

