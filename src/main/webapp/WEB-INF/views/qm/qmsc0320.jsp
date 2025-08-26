<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<!-- .page-wrapper -->
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
				<li class="breadcrumb-item active">출하검사관리대장(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 64%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="completeAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>승인여부</th>
									<th>판정</th>
									<th>수주상세번호</th>
									<th>품번</th>
									<th>품명</th>
									<th>지시수량</th>
									<th>생산수량</th>
									<th>검사일</th>
									<th class="text-center">검사수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width:35%;">
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Head">출하검사성적서&검사기준서</a>
						</li>
					</ul>
				</div>
				
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<!--오른쪽 등록 부분 상단 버튼 영역-->
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-success float-left mr-1" id="btnApprove">승인</button>
								<button type="button" class="btn btn-success float-left mr-1" id="btnCancel">승인취소</button>
								<button type="button" class="btn btn-success float-left mr-1" id="btnInspPopup">검사항목</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
							</div>
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
							<!--====================TAB-UI=======================-->
							<!-- .card-header -->
		
							<div class="card-body p-0">
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade active show" id="tab1">
										<!--/오른쪽 등록 부분 상단 버튼 영역-->
										<form id="form">
											<div class="table-responsive">
												<table class="table table-lg table-bordered mb-2" id="completeDtlTable">
													<colgroup>
														<col width="20%">
														<col width="30%">
														<col width="20%">
														<col width="30%">
													</colgroup>
													<tr>
														<th>품번</th>
														<td>
															<input type="text" class="form-control" id="itemCd" name="itemCd" style="max-width: 100%;text-align:center;" disabled>
														</td>
														<th>품명</th>
														<td>
															<input type="text" class="form-control" id="itemNm" name="itemNm" style="max-width: 100%;text-align:center;" disabled>
														</td>
													</tr>
													<tr>
														<th>구분</th>
														<td>
															<input type="text" class="form-control" id="itemGubun" name="itemGubun" style="max-width: 100%; text-align:center;" disabled>
														</td>
														<th>판정</th>
														<td><select id="qaEval" class="custom-select" style="max-width: 100%;" disabled></select></td>
													</tr>
													<tr>
														<th>검사일</th>
														<td>
															<div class="form-group input-sub m-0 row"
																style="max-width: 100%">
																<input class="form-control" type="text" id="inspectDate" name="inspectDate" style="max-width: 100%;" disabled />
																<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')"
																	class="btn btn-secondary input-sub-search"
																	id="inspectDateCalendar" type="button">
																	<span class="oi oi-calendar"></span>
																</button>
															</div>
														</td>
														<th>검사자</th>
														<td>
															<div class="input-sub m-0" style="max-width: 100%">
																<input type="hidden" class="form-control" style="max-width: 100%" id="inspectChargr" name="inspectChargr" disabled> 
																<input type="text" class="form-control" style="max-width: 100%" id="inspectChargrNm" name="inspectChargrNm" disabled>
																<button type="button" class="btn btn-primary input-sub-search" name="btnAdmChargr" id="btnAdmChargr" onclick="selectadmChargr();" disabled="disabled">
																	<span class="oi oi-magnifying-glass"></span>
																</button>
															</div>
														</td>
													</tr>
													<tr>
														<th>CAVITY수<br>체크</th>
														<td><select class="custom-select" id="cavityCnt" name="cavityCnt" disabled></select></td>
														<th>검사수량</th>
														<td><input type="text" class="form-control text-right" id="inspectCnt" name="inspectCnt" style="max-width: 100%;"disabled></td>
													</tr>
													<tr>
														<th>양품수량</th>
														<td><input type="text" class="form-control text-right" id="pairQty" name="pairQty" style="max-width: 100%;" disabled></td>
														<th>불량수량</th>
														<td><input type="text" class="form-control text-right" id="faultyQty" name="faultyQty" style="max-width: 100%;" disabled></td>
													</tr>
													<tr>
														<th>비고</th>
														<td colspan="3"><input type="text" class="form-control" id="inspectDesc" name="inspectDesc" style="max-width: 100%;" disabled></select>
													</tr>
												</table>
											</div>
											<!-- --------------------------------------------- -->
										</form>
										<form id="form3">
											<div class="table-responsive">
												<table id="completeSubTable" class="table table-bordered">
													<colgroup>
														<col width="10%">
														<col width="25%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
													</colgroup>
													<thead class="thead-light">
														<tr>
															<th>No.</th>
															<th>작업지시번호</th>
															<th class="text-center">합격수량</th>
															<th class="text-center">불량수량</th>
															<th>판정</th>
														</tr>
													</thead>
												</table>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right d-none" id="btnAttachSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachAdd">추가</button>
							</div>
							<form id="form31" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemInspectAttachTable">
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>내용</th>
												<th>출하검사성적서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!-- /.card -->
						<!--====================/TAB-UI=======================-->
					</div>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<!-- 불량유형 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="faultyTypePopUpModal" tabindex="-1" role="dialog" aria-labelledby="faultyTypePopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="faultyTypePopUpLabel">불량유형등록</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
	        <table id="faultyTypePopUpTable" class="table table-bordered">
		   		<colgroup>
					<col width="10%">
					<col width="25%">
					<col width="20%">
					<col width="20%">
					<col width="25%">
				</colgroup>										
				<thead class="thead-light">
					<tr>
						<th>No.</th>
						<th>불량유형</th>
						<th>불량수량</th>
						<th>불량등록일</th>
						<th>비고</th>
					</tr>
				</thead>
		 	</table>
       	 </div>
         <div class="modal-footer">
       		<button type="button" class="btn btn-primary float-right" id="btnFaultyTypeSave">저장</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 불량유형 모달 모달 종료-->
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
<!-- 						<div class="form-group mb-2"> -->
<!-- 							<label for="cavityCnt2" style="font-weight: bold;">CAVITY :</label> -->
<!-- 							<select class="custom-select" id="cavityCnt2" name="cavityCnt2" style=" width: 7.0rem;"></select> -->
<!-- 						</div> -->
						<button type="button" class="btn btn-primary" id="btnExt">외관</button>
						<button type="button" class="btn btn-primary" id="btnSize">치수</button>
						<button type="button" class="btn btn-primary d-none" id="btnWeight">중량</button>
						
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
								<colgroup>
									<col width="3%">
									<col width="42%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
									<col width="9%">
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">순번</th>
										<th rowspan="2">기준</th>
										<th rowspan="2">확인방법</th>
										<th><select class="custom-select" id="cavityNo1" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNo2" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNo3" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNo4" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNo5" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
<!-- 										<th colspan="5" style="background: #6bbcfb;"><span class="cavity_Lb">CVT.1</span></th> -->
									</tr>
									<tr>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv2">
							<table class="table table-bordered" id="sizeAdmTable2"  style="width:100%;">
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
										<th><select class="custom-select" id="cavityNoTwo1" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoTwo2" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoTwo3" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoTwo4" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoTwo5" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
<!-- 										<th colspan="5" style="background: #6bbcfb;"><span class="cavity_Lb">CVT.1</span></th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
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
										<th><select class="custom-select" id="cavityNoOne1" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoOne2" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoOne3" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoOne4" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
										<th><select class="custom-select" id="cavityNoOne5" name="cavityNo" style="background: #6bbcfb;" disabled></select></th>
<!-- 										<th colspan="5" style="background: #6bbcfb;"><span class="cavity_Lb">CVT.1</span></th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
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
<%@include file="../layout/bottom.jsp"%>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>

	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "64%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "qmsc0320";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "출하검사관리대장(정밀가공)");
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	let menuAuth = 'qmsc0030';

	var insepctDateFromCal = "${serverDateFrom}";
	var insepctDateToCal = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	
	var index = 0;
	var workOrdNo = null;
	var itemCd = null;
	var itemRev = null;
	var ordDate = null;
	var tableIdx = null;
	var itemSeq = null;

	var doNo = null;
	var doSeq = null;
	var doStatus = null;
	var approvalYn = null;
	var ordLotNo = null;
	var qaEval = null;
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	var approvalYnOption = "";	//승연여부
	var qaEvalOption = "";		//판정
	var doStatusOption = "출하요청";
	var pairQty = null;
	var targetQty = null;
	var itemGubun = null;
	var inspCdVal = null;
	var cavityCnt = null;
	var inspCavityVal = '001';
	let contDtlNoVal='';
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
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
				$('#btnCancel').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
				$('#btnCancel').addClass('d-none');
			}
		},
	});

	uiProc(true);

	//공통코드 시작
	var qaEvalCode=new Array();
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>

	var baseInfoAdmList=new Array();
	<c:forEach items="${baseInfoAdmList}" var="info">
		var json1 = new Object();
		json1.baseCd = "${info.baseInfoCd}";
		json1.baseNm = "${info.baseInfoNm}";
		baseInfoAdmList.push(json1);
	</c:forEach>


	var judgeCode=new Array();	//판정
    <c:forEach items="${judge}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		judgeCode.push(json);
	</c:forEach>

	var silhangCode=new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		silhangCode.push(json);
	</c:forEach>
	
	var contentsCode=new Array();
    <c:forEach items="${contents}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		contentsCode.push(json);
	</c:forEach>

	var cavityCode = new Array();
	<c:forEach items="${cavity}" var="info">
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}"+"개";
		cavityCode.push(json);
	</c:forEach>
	
	//공통코드 끝
	
	
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		
		$('#btnSave').addClass('d-none');
		$('#btnTypeAdd').attr('disabled', true);
	});
	
	selectBoxAppend(qaEvalCode, "qaEval", " ", "2");
	selectBoxAppend(baseInfoAdmList, "faultyType", " ", "2");
	selectBoxAppend(cavityCode, "cavityCnt", "", "2");
	
	// 목록
	let completeAdmTable = $('#completeAdmTable').on( 'error.dt', function ( e, settings, techNote, message ) {
        if(techNote == 7) {
            toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.");
            setTimeout(function() {
            	location.href = "/qmsc0030";
            	}, 200);    
        }
     } ).DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+"<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="qm/itemCompleteAdmDataList"/>',
			type : 'GET',
			data : {
				'menuAuth' : function(){ return menuAuth; },
				'startDate' : function(){ return insepctDateFromCal.replace(/-/g,""); },
				'endDate' : function(){ return insepctDateToCal.replace(/-/g,""); },
				'approvalYn' : function(){ return approvalYnOption; },
				'qaEval' : function(){ return qaEvalOption; },
				'mainGubun' : function(){ return '002'; },
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{//승인여부
			 	data : 'approvalYn',
			 	render: function(data, type, row, meta){
					if (data != null) {
						if (data == "001") {
							return '<span style="color:blue;font-weight:bold;">승인</span>';;
						} else {
							return '<span style="color:red;font-weight:bold;">미승인</span>';
						}
					} else {
						return '<span style="color:red;font-weight:bold;">미승인</span>';
					}
				}
			}, 		
			{//판정
				data : 'qaEval',
				render: function(data, type, row, meta){
					if (data != null) {
						if (data == "001") {
							return '<span style="color:blue;">합격</span>';
						} else {
							return '<span style="color:red;">불합격</span>';
						}
					} else {
						return '<span style="color:black;">미판정</span>';
					}
				}
			},	
			{
				data : 'contDtlNo'
			},			
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{
				data : 'dtlOrdCnt',
				render: function(data, type, row, meta){
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//요청수량
				data : 'fairQty',
				render: function(data, type, row, meta){
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//검사일
				data : 'inspectDate',
				render: function(data, type, row, meta){
					if (data != null) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '-';
					}
				}
			},				
			{//검사수량
				data : 'inspectCnt',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//양품수량
				data : 'pairQty',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//불량수량
				data : 'faultyQty',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs: [
 			{ targets: [5,6,8,9] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
		buttons : [ 'copy', 
			{ extend : 'excel',
			title : '불량유형관리'}, 
			'print' ],
	});


	var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">검사일자</label>';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="insepctDateFrom" name="insepctDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(insepctDateFrom,insepctDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="insepctDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="insepctDateTo" name="insepctDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(insepctDateTo,insepctDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="insepctDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';

	html1 += '&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
	html1 += '<select class="custom-select" id="approvalYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';
	
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">판정</label>'; 
	html1 += '<select class="custom-select" id="qaEvalOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">합격</option>';
	html1 += '<option value="002">불합격</option>';
	html1 += '</select>';

	html1 += '&nbsp;&nbsp;<label class="input-label-sm">출하상태</label>'; 
	html1 += '<select class="custom-select" id="doStatusOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">출하요청</option>';
	html1 += '<option value="002">검사완료</option>';
	html1 += '<option value="003">출하완료</option>';
	html1 += '</select>';
	
	html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
	html1 += '<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>';
	html1 += '</div>';

	$('#completeAdmTable_length').html(html1);
	$('#insepctDateFrom').val(insepctDateFromCal);
	$('#insepctDateTo').val(insepctDateToCal);

	// 조회버튼
	$('#btnRetv').on('click', function() {
		insepctDateFromCal = $('#insepctDateFrom').val();
		insepctDateToCal = $('#insepctDateTo').val();
		approvalYnOption = $('#approvalYnOption option:selected').val();
		qaEvalOption = $('#qaEvalOption option:selected').val();
		doStatusOption = $('#doStatusOption option:selected').val();
		
		$('#completeAdmTable').DataTable().ajax.reload(function() {});
	});

	// 전체조회버튼
	$('#btnAllRetv').on('click', function() {
		insepctDateFromCal = "";
		insepctDateToCal = "";
		approvalYnOption = "";
		qaEvalOption = "";
		doStatusOption = "";
		$('#completeAdmTable').DataTable().ajax.reload(function() {});
	});

	$('#saveBtnModalY').on('click', function() {
		$('#btnSave').trigger('click');
	});
	
	//데이터 클릭 시
	$('#completeAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if ($(this).hasClass('selected')) {
		} else {
			$('#completeAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		$('#tab2Head').removeClass('disabled')
		
		tableIdx = $('#completeAdmTable').DataTable().row(this).index();

		var data = completeAdmTable.row(this).data();
		contDtlNoVal = completeAdmTable.row(this).data().contDtlNo;
		mainGubun = data.mainGubun;
		itemSeq = data.itemSeq;
		doNo = data.doNo;
		approvalYn = data.approvalYn;
		qaEval = data.qaEval;
		inspectDate = data.inspectDate;
		fairQty = data.fairQty;
		pairQty = data.pairQty;
		itemGubun = data.itemGubun;
		inspCdVal = data.inspCd;
		cavityCnt = data.cavityCnt;
		

		$('#itemGubun').val(data.itemGubunNm);
		$('#itemCd').val(data.itemCd);
		$('#itemNm').val(data.itemNm);
		$('#qaEval').val(data.qaEval); 
		$('#inspectDate').val(data.inspectDate==null?"":moment(data.inspectDate).format('YYYY-MM-DD'));		//검사일
		$('#inspectCnt').val(data.inspectCnt==null?"0":addCommas(data.inspectCnt));		//검사수량
		$('#inspectChargr').val(data.inspectChargr==null?"":data.inspectChargr);		//검사자
		$('#inspectChargrNm').val(data.inspectChargrNm==null?"":data.inspectChargrNm);	//검사자명
		$('#pairQty').val(data.pairQty==null?fairQty:addCommas(data.pairQty));		//합격수량
		$('#faultyQty').val(data.faultyQty==null?"0":addCommas(data.faultyQty));		//불량수량
		selectBoxAppend(cavityCode, "cavityCnt", data.cavityCnt, "2");

		//완제품거사관리 바코드별 목록조회
		$('#completeSubTable').DataTable().ajax.reload(function(){});
		$('#completeSubTable').addClass('tr_highlight_row');	//hover

		//검사항목 목록조회
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		if(mainGubun == '001'){
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		}else if(mainGubun == '002'){
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		} 
			
		uiProc(true);
		sideView = 'edit';

		$('#btnInspPopup').attr('disabled',false);	//검사항목 활성화
		$('#btnInspAdd').removeClass('d-none');		//수정버튼 숨김처리
		$('#btnInspSave').removeClass('d-none');		//저장버튼 숨김처리
		
		//출하등록 한 경우(승인,승인취소,등록,수정 비활성화, 검사항목 수정 x)
		if(doStatus == "출하완료"){
			$('#btnOutAdd').attr('disabled', true);		//출하등록 비활성화
			$('#btnApprove').attr('disabled', true);	//승인버튼 비활성화
			$('#btnCancel').attr('disabled', true);		//승인취소버튼 비활성황
			$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
			$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화
			
		}else{
			//승인한 경우(승인,등록,수정 비활성화, 검사항목 수정 x)
			if(approvalYn=="001"){
				$('#btnOutAdd').attr('disabled', false);	//출하등록 활성화
				$('#btnApprove').attr('disabled', true);	//승인버튼 비활성화
				$('#btnCancel').attr('disabled', false);	//승인취소버튼 활성화
				$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
				$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화
			//승인 안한 경우(승인취소,출하등록 비활성화, 검사항목 수정 x)
			}else if(approvalYn=="002"){

				if(qaEval!=null && qaEval!=""){
					$('#btnApprove').attr('disabled',false);//승인버튼 비활성화
					$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
				}else{
					$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
					$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
				}	
				
				$('#btnOutAdd').attr('disabled', true);	//출하등록 비활성화

				if(inspectDate != null){
			    	$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
				}else{
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
				}
			}else{

				if(qaEval!=null && qaEval!=""){
					$('#btnApprove').attr('disabled',false);//승인버튼 비활성화
					$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
				}else{
					$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
					$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
				}	
				
				$('#btnOutAdd').attr('disabled', true);	//출하등록 비활성화

				if(inspectDate != null){
			    	$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
				}else{
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
				}
			}
		}
	});
	
	
	//출하검사관리 상세조회
	let completeSubTable = $('#completeSubTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '40.1vh',
			ajax : {
			url : '<c:url value="qm/itemCompleteAdmList"/>',
			type : 'GET',
			data : {
				'contDtlNo' :  function(){return contDtlNoVal;},
			},
		},
		columns : [ 
			{
				render : function(data,type,row,meta){
					return meta.row+1;
				}
			}, 
			{data : 'workOrdNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{data : 'pairQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return addCommas(fairQty);
					}
				}
			},
			{data : 'faultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '0';
					}
				}
			},			
			{data : 'judgment',
				render : function(data,type,row,meta){
					if(data!=null && data!=""){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}
					}else{
						return '<span>미판정</span>';
					}
				}
			},
		],
		columnDefs: [
			{ targets: [2,3] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	    ],
	});


	//출하검사관리 상세조회 클릭시
    $('#completeSubTable tbody').on( 'dblclick', 'tr', function () {

    	if(btnView==""){
			return false;
        }
        
       	if($(this).hasClass('selected')){
	        $(this).removeClass('selected');
        }else {
        	$('#completeSubTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

		tableIdx = $('#completeSubTable').DataTable().row(this).index();
		 
		doSeq =  completeSubTable.row(this).data().doSeq;	//완제품검사 시퀀스
		workOrdNo =  completeSubTable.row(this).data().workOrdNo;
		fairQty =  completeSubTable.row(this).data().fairQty;
		selectFaultyType();

		if(approvalYn=="002"){
			$('#btnFaultyTypeSave').removeClass('d-none');
	   		$('input[name=faultyTypeQty]').attr('disabled',false)
	   		$('input[name=faultyTypeDate]').attr('disabled',false)
	   		$('input[name=faultyTypeDesc]').attr('disabled',false)
		}else{
			$('#btnFaultyTypeSave').addClass('d-none');
	   		$('input[name=faultyTypeQty]').attr('disabled',true)
	   		$('input[name=faultyTypeDate]').attr('disabled',true)
	   		$('input[name=faultyTypeDesc]').attr('disabled',true)
		}
		
    });

	//불량유형 팝업 시작
	var faultyTypePopUpTable;
	function selectFaultyType() {
		if (faultyTypePopUpTable == null || faultyTypePopUpTable == undefined) {
			faultyTypePopUpTable = $('#faultyTypePopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				searching : false,
				ajax : {
					url : '<c:url value="qm/itemCompleteFaultyTypeRead"/>',
					type : 'GET',
					async : false,
					data : {
						'doNo' : function(){return doNo;},
						'doSeq' : function(){return doSeq;},
					}
				},
				rowId : 'etc1',
				columns : [ 
					{
						render: function(data, type, row, meta){
							return meta.row+1;
						}
					},
					{data : 'faultyTypeNm',
						render: function(data, type, row, meta){
							var html="";
							html += '<input type="hidden" name="faultyTypeCd" value="'+row['faultyTypeCd']+'" style="text-align:center;">';
							html += '<input type="text" class="form-control" name="faultyTypeNm" value="'+data+'"  style="text-align:center; border:none;" readonly >';
							return html;
						}
					},
					{data : 'faultyTypeQty',
						render: function(data, type, row, meta) {
							if(data!=null){
								return '<input type="text" class="form-control" name="faultyTypeQty" value="'+data+'"  style="text-align:right;">';
							}else{
								return '<input type="text" class="form-control" name="faultyTypeQty" value="0" style="text-align:right;">';
							}
						}
					},
					{data : 'faultyTypeDate',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="date" class="form-control"  name="faultyTypeDate" value="'+moment(data).format("YYYY-MM-DD")+'" />';  
								
							} else{
								return '<input type="date" class="form-control" name="faultyTypeDate" value="'+serverDate+'" />'  

							}
						}
					},		   
					{data : 'faultyTypeDesc',
						render: function(data, type, row, meta) {
							if(data!=null){
								return '<input type="text" class="form-control" name="faultyTypeDesc" maxlength="64" placeholder="64자 내외" value="'+data+'">';
							}else{
								return '<input type="text" class="form-control" name="faultyTypeDesc" maxlength="64" placeholder="64자 내외" value="">';
							}
						}
					}
			],
		    order: [
		        [ 2, 'desc' ] ,[1,'asc']
		    ],
		    columnDefs: [
	        	{"className": "text-center", "targets": "_all"},
	        	
	        ],
		});
		} else {
			$('#faultyTypePopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#faultyTypePopUpModal').modal('show');
	}


	// 완제품검사관리대장 바코드별 저장 처리
	$('#btnFaultyTypeSave').on('click',function() {
		var dataArray = new Array();		
		var check=true;  		
		var sum=0;

		if ($('#inspectChargrNm').val() == "") {				 
			toastr.warning('팝업창을 닫고 검사자를 입력해주세요.');
			check=false;
			jrCheck=false;
			return false;
		}  

		if(!$.trim($('input[name=faultyTypeQty]').val())){
			toastr.warning('불량수량을 입력해주세요.');
			check=false;
			jrCheck=false;
			return false;
		}
		
		$('#faultyTypePopUpTable tbody tr').each(function(index, item){
			sum+=parseFloat($(this).find("td input[name=faultyTypeQty]").val().replace(/,/g,''));
		});

		if(check){
			$('#faultyTypePopUpTable tbody tr').each(function(index, item){
				var rowData = new Object();
				
				rowData.doNo= doNo;
				rowData.workOrdNo = workOrdNo;

				rowData.pairQty = parseFloat(fairQty.replace(/,/g,'')) - sum;
				rowData.faultyQty = sum;
				rowData.judgment = sum > 0 ? "002" : "001";	//불합격이 있을 경우 : 불합격/ 없을 경우 : 합격

				rowData.faultyTypeCd = $(this).find("td input[name=faultyTypeCd]").val();
				rowData.faultyTypeQty = $(this).find("td input[name=faultyTypeQty]").val();
				rowData.faultyTypeDate = $(this).find("td input[name=faultyTypeDate]").val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find("td input[name=faultyTypeDesc]").val();
		        dataArray.push(rowData);
			});
		}
	
		if(check){
			$.ajax({
				url : '<c:url value="io/itemCompleteFaultyTypeCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if (res.result == 'ok') {

						$('#pairQty').val(res.totalPairQty);
						$('#faultyQty').val(res.totalFaultyQty);
						
						$('#completeSubTable').DataTable().ajax.reload(function(){});
						$('#completeAdmTable').DataTable().ajax.reload(function(){});
						$('#faultyTypePopUpModal').modal('hide');
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
	
	//등록 버튼 클릭시
	$('#btnAdd').on('click', function() {  		
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("등록할 항목을 선택해 주세요.");
			return false;
		}
		uiProc(false);	
		sideView = 'add';
		btnView = 'add';

		$('#inspectCnt').val("0");
		$('#faultyQty').val("0");
		$('#inspectChargrNm').val(userNm);
		$('#inspectChargr').val(userNumber);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		
		$('#btnAdd').attr('disabled',true);
		$('#btnInspPopup').attr('disabled',false);
		$('#completeSubTable').addClass('tr_highlight_row');	//hover
	});

	//수정 버튼 클릭시
	$('#btnEdit').on('click',function(){

		if(completeAdmTable.row(tableIdx).data().completeStatusCd=="001"){
			toastr.warning("이미 승인된 항목입니다. 확인해주세요.");
			return false;
		}	 
		
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}
		
		uiProc(false);	
		sideView = 'edit';
		btnView = 'edit';
		
		$('#btnSave').removeClass('d-none');
		$('#btnTypeAdd').attr('disabled',false);
		$('#completeSubTable').addClass('tr_highlight_row');	//hover
	});


	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
		if($('#inspectDate').val()==""){
			toastr.warning("검사일자를 선택해주세요.");
			return false;
		}

		if($('#inspectChargr').val()==""){
			toastr.warning("검사자를 선택해주세요.");
			return false;
		}

		if($('#inspectCnt').val()=="0"){
			toastr.warning("검사수량을 선택해주세요.");
			return false;
		}

		if($('#cavityCnt').val()==""){
			toastr.warning("CAVITY수를 선택해주세요.");
			return false;
		}

		var url= "";
		if(btnView=="add"){
			url = '<c:url value="qm/itemCompleteMasterCreate"/>';
		}else{
			url = '<c:url value="qm/itemCompleteMasterUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'contDtlNo' : function(){return contDtlNoVal;},
				'doNo' : function(){return doNo;},
				'itemSeq' : function(){return itemSeq;},
				'inspectCnt' : function(){return $('#inspectCnt').val().replace(/,/g,'')},
				'inspectDate' : function(){return $('#inspectDate').val().replace(/-/g,'')},
				'inspectChargr' : function(){return $('#inspectChargr').val()},
				'qaEval' : function(){return $('#qaEval').val()},
				'approvalYn' : "002",	//미승인
				'cavityCnt' : function(){return $('#cavityCnt option:selected').val()},
				'inspectDesc' : function(){return $('#inspectDesc').val()}
				},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);

					$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
			    	$('#btnSave').addClass('d-none');
					$('#btnApprove').attr('disabled', false);

					$('#completeAdmTable').DataTable().ajax.reload(function(){});
					$('#completeSubTable').removeClass('tr_highlight_row');	//hover

					btnView = '';
				}else{
					toastr.error(res.message);
				}
			}
		});
		
		
	});

	

	//승인버튼 클릭시
	$('#btnApprove').on('click', function() {
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("목록을 선택해 주세요.");
			return false;
		}
		if ($('#inspectDate').val() == "") {
			toastr.warning("우선 등록 먼저 해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="/qm/itemCompleteStatusUpdate"/>',
			type : 'POST',
			data : {
				'doNo' : function() {return doNo;},
				'approvalYn' : '001',
			},
			success : function(res) {
				if (res.result == 'ok') {
					toastr.success('승인되었습니다.');	
					$('#completeAdmTable').DataTable().ajax.reload(function(){});

					$('#btnOutAdd').attr('disabled', false);	//출하등록 활성화
					$('#btnApprove').attr('disabled', true);	//승인버튼 비활성화
					$('#btnCancel').attr('disabled', false);	//승인취소버튼 활성화
					$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
					$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화

					$('#btnInspPopup').attr('disabled', false);	//검사항목 활성화
					$('#btnInspAdd').addClass('d-none');		//수정버튼 숨김처리
					$('#btnInspSave').addClass('d-none');		//저장버튼 숨김처리
					
					/* $('#btnApprove').attr('disabled',true);
					$('#btnCancel').attr('disabled',false); */
				} else if (res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//승인취소 버튼 클릭시
	$('#btnCancel').on('click', function() {
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("목록을 선택해 주세요.");
			return false;
		}

		if ($('#inspectDate').val() == "") {
			toastr.warning("우선 등록 먼저 해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="/qm/itemCompleteStatusUpdate"/>',
			type : 'POST',
			data : {
				'doNo' : function() {return doNo;},
				'doSeq' : function() {return doSeq;},
				'approvalYn' : '002',	
			},
			success : function(res) {
				if (res.result == 'ok') {
					toastr.success('승인취소되었습니다.');		
					$('#completeAdmTable').DataTable().ajax.reload(function(){});	

					if(qaEval!=null && qaEval!=""){
						$('#btnApprove').attr('disabled',false);//승인버튼 비활성화
						$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
					}else{
						$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
						$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
					}	
					
					$('#btnOutAdd').attr('disabled', true);	//출하등록 활성화
					$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
					$('#btnEdit').attr('disabled', false);		//수정버튼 비활성화

					$('#btnInspPopup').attr('disabled', false);	//검사항목 활성화
					$('#btnInspAdd').removeClass('d-none');		//수정버튼 숨김처리
					$('#btnInspSave').removeClass('d-none');		//저장버튼 숨김처리
					
					/* $('#btnApprove').attr('disabled',false);
					$('#btnCancel').attr('disabled',true); */
					
				} else if (res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	});


	//출하등록 버튼 클릭시
	$('#btnOutAdd').on('click', function() {  		
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("출하할 항목을 선택해 주세요.");
			return false;
		}

		if(completeAdmTable.row(0).data().approvalYn=="002"){
			toastr.warning("미승인된 내역입니다. 승인을 해주세요.");
			return false;
		}
		
		var dataArray = new Array();		

		$('#completeSubTable tbody tr').each(function(index, item){
			var rowData = new Object();

			rowData.doNo = doNo;
			rowData.doSeq = doSeq;
			rowData.doSeq = completeSubTable.row(this).data().doSeq;
			rowData.outputQty = completeSubTable.row(this).data().pairQty;
			rowData.barcodeNo = completeSubTable.row(this).data().lotNo;
			rowData.outputDate = serverDate.replace(/-/g,'');
			rowData.itemSeq = itemSeq;
			rowData.itemGubun = itemGubun;
			
	        dataArray.push(rowData);
		});

		console.log(dataArray);
	 
		$.ajax({
			url : '<c:url value="qm/itemOutCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			success : function(res) {				
				if (res.result == 'ok') {
					$('#completeAdmTable').DataTable().ajax.reload(function(){});
					toastr.success('출하등록 되었습니다.');

					$('#btnOutAdd').attr('disabled', true);		//출하등록 비활성화
					$('#btnApprove').attr('disabled', true);	//승인버튼 비활성화
					$('#btnCancel').attr('disabled', true);		//승인취소버튼 비활성황
					$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
					$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화

					$('#btnInspPopup').attr('disabled', false);	//검사항목 활성화
					$('#btnInspAdd').addClass('d-none');		//수정버튼 숨김처리
					$('#btnInspSave').addClass('d-none');		//저장버튼 숨김처리
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	});

	let cavityCnt2Code = new Array();
	
	//검사항목등록
	$('#btnInspPopup').on('click',function(){

		if(!$('#completeAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			return false;
		}
		
		inspTypeVal = '외관';

		cavityCnt2Code = new Array();
		for(var i=0; i<parseInt(cavityCnt); i++){
			var json = new Object();
			json.baseCd = '00'+(i+1);
			json.baseNm = 'CVT.'+(i+1);
			cavityCnt2Code.push(json);
		}
		
		$.ajax({
			url : '<c:url value="bm/inspCavityAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'inspSourceNo' : function() {return doNo;},
				'inspSourceSubNo' : function() {return '';},
				'inspType' : function() {return '001';},
			},
			success : function(res) {
				let data = res.data;
				
				if (data != null) {
					selectBoxAppend(cavityCnt2Code, "cavityNo1", data.cavityNo1, "");
					selectBoxAppend(cavityCnt2Code, "cavityNo2", data.cavityNo2, "");
					selectBoxAppend(cavityCnt2Code, "cavityNo3", data.cavityNo3, "");
					selectBoxAppend(cavityCnt2Code, "cavityNo4", data.cavityNo4, "");
					selectBoxAppend(cavityCnt2Code, "cavityNo5", data.cavityNo5, "");
				} else {
					selectBoxAppend(cavityCnt2Code, "cavityNo1", "001", "");
					selectBoxAppend(cavityCnt2Code, "cavityNo2", "001", "");
					selectBoxAppend(cavityCnt2Code, "cavityNo3", "001", "");
					selectBoxAppend(cavityCnt2Code, "cavityNo4", "001", "");
					selectBoxAppend(cavityCnt2Code, "cavityNo5", "001", "");
				}
				
			}
			
		});
		
		$('#inspPopupModal').modal('show');

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightAdmTableDiv').addClass('d-none');
		setTimeout(function(){
			extAdmTable.draw();
		},200);
		
		$('select[name=cavityNo]').attr('disabled', true);
		$('select[name=inspResult]').attr('disabled', true);
		$('select[name=inspResult1]').attr('disabled', true);
		$('select[name=inspResult2]').attr('disabled', true);
		$('select[name=inspResult3]').attr('disabled', true);
		$('select[name=inspResult4]').attr('disabled', true);
		$('select[name=inspResult5]').attr('disabled', true);
	});


	//cavity변경시
// 	$('#cavityCnt2').on('change', function(){
// 		inspCavityVal = $('#cavityCnt2 option:selected').val();
		
// 		if(inspTypeVal=="외관"){
// 			$('#extAdmTable').DataTable().ajax.reload(function(){});

// 			setTimeout(function(){
// 				extAdmTable.draw();
// 			},200);
// 		}else if(inspTypeVal="치수"){
// 			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
// 			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});

// 			setTimeout(function(){
// 				sizeAdmTable.draw();
// 				sizeAdmTable2.draw();
// 			},200);
// 		}else{
// 			$('#extAdmTable').DataTable().ajax.reload(function(){});
// 			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
// 			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});

// 			setTimeout(function(){
// 				extAdmTable.draw();
// 				sizeAdmTable.draw();
// 				sizeAdmTable2.draw();
// 			},200);
// 		}
// 		$('.cavity_Lb').text($('#cavityCnt2 option:selected').text());
// 	});
	

	var inspTypeVal="외관";
	//외관 버튼 클릭시
	$('#btnExt').on('click',function(){
		console.log('외관 버튼 클릭');

		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightAdmTableDiv').addClass('d-none');
		
		$('select[name=cavityNo]').attr('disabled', true);
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			extAdmTable.draw();
		},200);
	});

	//중량 버튼 클릭시
	$('#btnWeight').on('click',function(){
		console.log('중량 버튼 클릭');

		inspTypeVal = '중량';

		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightAdmTableDiv').removeClass('d-none');
		
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			weightAdmTable.draw();
		},200);
	});
	
	//치수 버튼 클릭시
	$('#btnSize').on('click',function(){

		console.log('치수 버튼 클릭: ' + mainGubun);

		inspTypeVal = '치수';
		
		if (mainGubun == "001") {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
			
			cavityCnt2Code = new Array();
			for(var i=0; i<parseInt(cavityCnt); i++){
				var json = new Object();
				json.baseCd = '00'+(i+1);
				json.baseNm = 'CVT.'+(i+1);
				cavityCnt2Code.push(json);
			}
			
			$.ajax({
				url : '<c:url value="bm/inspCavityAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'inspSourceNo' : function() {return doNo;},
					'inspSourceSubNo' : function() {return '';},
					'inspType' : function() {return '002';},
				},
				success : function(res) {
					let data = res.data;
					
					if (data != null) {
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo1", data.cavityNo1, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo2", data.cavityNo2, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo3", data.cavityNo3, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo4", data.cavityNo4, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo5", data.cavityNo5, "");
					} else {
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo1", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo2", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo3", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo4", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoTwo5", "001", "");
					}
					
					$('select[name=cavityNo]').attr('disabled', true);
					
				}
				
			});
			
		} else if (mainGubun == "002") {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#weightAdmTableDiv').addClass('d-none');
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
			
			cavityCnt2Code = new Array();
			for(var i=0; i<parseInt(cavityCnt); i++){
				var json = new Object();
				json.baseCd = '00'+(i+1);
				json.baseNm = 'CVT.'+(i+1);
				cavityCnt2Code.push(json);
			}
			
			$.ajax({
				url : '<c:url value="bm/inspCavityAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'inspSourceNo' : function() {return doNo;},
					'inspSourceSubNo' : function() {return '';},
					'inspType' : function() {return '002';},
				},
				success : function(res) {
					let data = res.data;
					
					if (data != null) {
						selectBoxAppend(cavityCnt2Code, "cavityNoOne1", data.cavityNo1, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne2", data.cavityNo2, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne3", data.cavityNo3, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne4", data.cavityNo4, "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne5", data.cavityNo5, "");
					} else {
						selectBoxAppend(cavityCnt2Code, "cavityNoOne1", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne2", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne3", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne4", "001", "");
						selectBoxAppend(cavityCnt2Code, "cavityNoOne5", "001", "");
					}
					
					$('select[name=cavityNo]').attr('disabled', true);
					
				}
				
			});
		}
		
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable2.draw();
		},200);
		
	});


	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){
		if (inspTypeVal == "외관") {
			
			$('select[name=cavityNo]').attr('disabled', false);

			$('select[name=inspResult]').attr('disabled', false);
			$('select[name=inspResult1]').attr('disabled', false);
			$('select[name=inspResult2]').attr('disabled', false);
			$('select[name=inspResult3]').attr('disabled', false);
			$('select[name=inspResult4]').attr('disabled', false);
			$('select[name=inspResult5]').attr('disabled', false);
			
			$('#extAdmTable select[name=inspResult1]').eq(0).focus();
			
		} else if (inspTypeVal == "치수") {
			if(mainGubun == "001"){
				$('#sizeAdmTable2').find('input[name=inspX1]').attr('disabled',false);
				$('#sizeAdmTable2').find('input[name=inspX2]').attr('disabled',false);
				$('#sizeAdmTable2').find('input[name=inspX3]').attr('disabled',false);
				$('#sizeAdmTable2').find('input[name=inspX4]').attr('disabled',false);
				$('#sizeAdmTable2').find('input[name=inspX5]').attr('disabled',false);
			}else{
				$('#sizeAdmTable').find('input[name=inspX1]').attr('disabled',false);
				$('#sizeAdmTable').find('input[name=inspX2]').attr('disabled',false);
				$('#sizeAdmTable').find('input[name=inspX3]').attr('disabled',false);
				$('#sizeAdmTable').find('input[name=inspX4]').attr('disabled',false);
				$('#sizeAdmTable').find('input[name=inspX5]').attr('disabled',false);
			}

			$('select[name=cavityNo]').attr('disabled', false);
			$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
			$('#sizeAdmTable input[name=inspX1]').eq(0).select();
			$('#sizeAdmTable2 input[name=inspX1]').eq(0).focus();
			$('#sizeAdmTable2 input[name=inspX1]').eq(0).select();
		}
	});


	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array();
		
		if(inspTypeVal == "외관"){
			$('#extAdmTable tbody tr').each(function(index, item) {

				var rowData = new Object();

				rowData.inspResultGubun = "001";
				rowData.inspSourceNo = doNo;
				rowData.inspCd = extAdmTable.row(index).data().inspCd;
				rowData.inspType = extAdmTable.row(index).data().inspType;
				rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
				rowData.inspCavity = '001';

				var resultYCnt=0;
				//최종판정
				for(var i=1; i<=5; i++){
					if($(this).find('td select[name=inspResult'+i+']').val()=="001"){
						resultYCnt++;
					}
					if($(this).find('td select[name=inspResult'+i+']').val()==""){
						resultYCnt=-1;
						break;
					}
				}
				if (resultYCnt == 5) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1) {
					rowData.inspResult = "";	//미판정
				} else {
					rowData.inspResult = "002";	//불합격
				}
				
				rowData.inspX1 = $(this).find('td select[name=inspResult1]').val();
				rowData.inspX2 = $(this).find('td select[name=inspResult2]').val();
				rowData.inspX3 = $(this).find('td select[name=inspResult3]').val();
				rowData.inspX4 = $(this).find('td select[name=inspResult4]').val();
				rowData.inspX5 = $(this).find('td select[name=inspResult5]').val();
				
				rowData.cavityNo1 = $('#cavityNo1').val();
				rowData.cavityNo2 = $('#cavityNo2').val();
				rowData.cavityNo3 = $('#cavityNo3').val();
				rowData.cavityNo4 = $('#cavityNo4').val();
				rowData.cavityNo5 = $('#cavityNo5').val();
				
				rowData.inspectGubun = "";
				dataArray.push(rowData);
				console.log(rowData)
			});
		} else {
			if (mainGubun == "001") {
				$('#sizeAdmTable2 tbody tr').each(function(index, item) {

					var rowData = new Object();
					
					rowData.inspResultGubun = "001";
					rowData.inspSourceNo = doNo;
					rowData.inspCd = sizeAdmTable2.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable2.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable2.row(index).data().inspSeq;
					rowData.inspCavity = '001';
// 					rowData.inspCavity = $('#cavityCnt2 option:selected').val(); 프로세스 변경
					
					let min = sizeAdmTable2.row(index).data().inspStandLower;
					let max = sizeAdmTable2.row(index).data().inspStandUpper;
					
					var resultYCnt = 0;
					for(var i=1; i<=5; i++){
						var inspData= $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

						if(!((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max)))){
							resultYCnt++;
						}
						if(inspData==null || inspData==""){
							resultYCnt=-1;
							break;
						}
					}
					if(resultYCnt==5){
						rowData.inspResult = "001";	//합격
					}else if(resultYCnt==-1){
						rowData.inspResult = "";	//미판정
					}else{
						rowData.inspResult = "002";	//불합격
					}
					
					rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
					rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
					rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
					rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
					
					rowData.cavityNo1 = $('#cavityNoTwo1').val();
					rowData.cavityNo2 = $('#cavityNoTwo2').val();
					rowData.cavityNo3 = $('#cavityNoTwo3').val();
					rowData.cavityNo4 = $('#cavityNoTwo4').val();
					rowData.cavityNo5 = $('#cavityNoTwo5').val();
					
					rowData.inspectGubun = "";
					dataArray.push(rowData);
					console.log(rowData)
				});
			} else {
				$('#sizeAdmTable tbody tr').each(function(index, item) {

					var rowData = new Object();
					
					rowData.inspResultGubun = "001";
					rowData.inspSourceNo = doNo;
					rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
					rowData.inspCavity = '001';
// 					rowData.inspCavity = $('#cavityCnt2 option:selected').val(); 프로세스 변경

					let min = sizeAdmTable.row(index).data().inspStandLower;
					let max = sizeAdmTable.row(index).data().inspStandUpper;
					
					var resultYCnt = 0;
					for(var i=1; i<=5; i++){
						var inspData= $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

						if(!((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max)))){
							resultYCnt++;
						}
						if(inspData==null || inspData==""){
							resultYCnt=-1;
							break;
						}
					}
					if(resultYCnt==5){
						rowData.inspResult = "001";	//합격
					}else if(resultYCnt==-1){
						rowData.inspResult = "";	//미판정
					}else{
						rowData.inspResult = "002";	//불합격
					}
					
					rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
					rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
					rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
					rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
					
					rowData.cavityNo1 = $('#cavityNoOne1').val();
					rowData.cavityNo2 = $('#cavityNoOne2').val();
					rowData.cavityNo3 = $('#cavityNoOne3').val();
					rowData.cavityNo4 = $('#cavityNoOne4').val();
					rowData.cavityNo5 = $('#cavityNoOne5').val();
					
					rowData.inspectGubun = "";
					dataArray.push(rowData);
					console.log(rowData)
				});
			}
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspComResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");

						$('select[name=cavityNo]').attr('disabled',true);
						$('select[name=inspResult]').attr('disabled',true);
						$('input[name=inspX1]').attr('disabled',true);
						$('input[name=inspX2]').attr('disabled',true);
						$('input[name=inspX3]').attr('disabled',true);
						$('input[name=inspX4]').attr('disabled',true);
						$('input[name=inspX5]').attr('disabled',true);

						$('select[name=inspResult1]').attr('disabled',true);
						$('select[name=inspResult2]').attr('disabled',true);
						$('select[name=inspResult3]').attr('disabled',true);
						$('select[name=inspResult4]').attr('disabled',true);
						$('select[name=inspResult5]').attr('disabled',true);
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
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return '';},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "001";},
				'inspCavity' : function(){return inspCavityVal;},
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
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
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
				name: 'rowspan'
			},
			{
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
			{
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
			{
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
			{
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
			{
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
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
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
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return '';},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "003";},
				'inspCavity' : function(){return inspCavityVal;},
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
						return '<input type="number" class="form-control" name="inspX1" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX1" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; name="inspX5" value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; name="inspX5" value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				console.log(min);
				for(var r=1; r<=5; r++){
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
	
	//치수 목록 - 후가공
	let sizeAdmTable2 = $('#sizeAdmTable2').DataTable({
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
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return '';},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "002";},
				'inspCavity' : function(){return inspCavityVal;},
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
			{
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
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

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				for(var r=1; r<=5; r++){
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
	
	//치수 목록 - 봉제
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
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return '';},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "002";},
				'inspCavity' : function(){return inspCavityVal;},
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
			/* {
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
			},  */
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
			{
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}row['+inspStandLower+']
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
		}, ],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				for(var r=1; r<=5; r++){
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

	//소숫점 2자리 제한
	$(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5]", function(event){
		var _pattern3 = /^\d*[.]\d{3}$/;	//누르고있는 키는 예외처리 안됨
        if (_pattern3.test( $(this).val())) {
        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
        	$(this).val("0");
 			$(this).select();
            return false;
		}
	});

	//x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){
		let inspResult = "";
		if(inspTypeVal=="치수"){
			if(mainGubun=="001"){
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
	
	function selectBoxAppend2(obj, id, sVal, flag) {
		$('select[name="' + id + '"]').empty();

		for (key in obj) {
			var option;
			if (obj[key].baseCd == sVal) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>");
			} else {
				option = $("<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>");
			}
			$('select[name="' + id + '"]').append(option);
		}

	}

	function fileDelete() {
		$.ajax({
			url : '<c:url value="/qm/itemCompleteImageDelete"/>',
			type : 'POST',
			async : false,
			data : {
				'workOrdNo' : function() {return ordLotNo;},
				'itemSeq' : function() {return itemSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					$('#fileNm').val('');
					$('#fpValue').text("파일을 선택해주세요");
				} else {
					toastr.error(res.message);
				}
			}
		});
	}
	


	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectadmChargr() {
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
						'departmentCd' : '002'			
					}
				},
				rowId : 'userNumber',
				columns : [ 
				{
					data : 'userNm'
				}, 
				{
					data : 'departmentNm'
				}, 
				{
					data : 'postNm'
				}, 
				{
					data : 'chargeDutyNm'
				},
				{
					data : 'userDesc'
				}, 
				],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4],
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


	function uiProc(flag){
		$('#inspectDateCalendar').attr('disabled',flag);
		$('#btnAdmChargr').attr('disabled',flag);		
		$('#inspectCnt').attr('disabled',flag);
		$('#qaEval').attr('disabled',flag);
		$('#judgment').attr('disabled',flag);
		$('#specialDesc').attr('disabled',flag);
		$('#fileNm').attr('disabled',flag);
		$('#faultyType').attr('disabled',flag);
		$('#cavityCnt').attr('disabled',flag);
		$('#inspectDesc').attr('disabled',flag);
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
	
	var tempView = "";
	var attachSeq = "";
	
	//관련자료 목록
	let itemInspectAttachTable = $('#itemInspectAttachTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 1000000,
		scrollY : '60vh',
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return doNo;},
				'etc1' : function(){return doSeq;},
				'attachGubun' : function(){return 'DO';},
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						tempNum = meta.row + meta.settings._iDisplayStart + 1;
						return tempNum;
					},
					'className' : 'text-center'
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						var html = "";
						html = selectBoxHtml2(contentsCode,"contents", data, row, meta, "100");
						return html;
					
						/* if (data != null) {
							var html = '<input type="hidden" class="form-control" style="text-align:center" name="attachSeq" value="'+row['attachSeq']+'" disabled />';
							html += '<input type="text" class="form-control" style="text-align:center" name="contents" value="'+data+'" disabled />';
							return html;
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="" />';
						} */
					}
				},
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+doNo+'&attachGubun=DO">'+data+'</a>';
							return html;
						} else {
							var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
							html += '<input type="file" class="custom-file-input" id="fileErNm'+tempNum+'" name="fileNm">';
							html += '<label class="custom-file-label" for="fileErNm'+tempNum+'"></label>';
							html += '</div></form>';
							return html;
						}
					}
				},
			],
		order : [ [ 0, 'asc' ], ],
		drawCallback: function(settings) {
        }, 
	});
	
	//관련자료 데이터 클릭 시
	$('#itemInspectAttachTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView = "";
		} else {
			$('#itemInspectAttachTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			tempView = "edit";
		}
		tableIdx = $('#itemInspectAttachTable').DataTable().row(this).index();
		attachSeq = itemInspectAttachTable.row(tableIdx).data().attachSeq;
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
 		$('#itemInspectAttachTable').DataTable().row.add({}).draw(false);
		$('#btnAttachSave').removeClass('d-none'); // 등록버튼
		$('#btnAttachAdd').attr('disabled', true);
 		$('#btnAttachDel').attr('disabled', true);

 		//추가한 행만 비활성화
 		$('select[name=contents]').eq(itemInspectAttachTable.data().count()-1).attr('disabled',false);

		tempView = '';
	});
	
	//관련자료 삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (tempView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(attachSeq != undefined && attachSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				async : false,
				data  : {
					'attachGubun' : function(){return 'DO';},
					'attachCd' : function(){return doNo;},
					'etc1' : function(){return doSeq;},
					'attachSeq' : function(){return attachSeq;},
				},
				success  : function(res){
					$('#itemInspectAttachTable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
					
				}
			});
		} else {
			$('#itemInspectAttachTable').DataTable().rows(tableIdx).remove().draw();
			//toastr.success("삭제되었습니다.");
		}
		
		var attachSaveCheck = true;
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {
			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				attachSaveCheck = false;
			}
		});
		if(attachSaveCheck) {
			$('#btnAttachSave').addClass('d-none');
		} else {
			$('#btnAttachSave').removeClass('d-none');
		}
		
		tempView = '';

	});
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	// 관련자료 저장
	$('#btnAttachSave').on('click',function() {
		var check = true;
		var check2 = true;
		var dataArray = new Array();
	
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {

			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				toastr.warning('파일을 선택해 주세요.');
				$(this).find("td input[name=fileNm]").focus();
				check = false;
				return false;
			}
			
			index++;
			check2 = true;
			if ($(this).find("td input[name=fileNm]").val() == undefined) {
				check2 = false;
			}
			
			if(check && check2){
				var formData = new FormData(document.getElementById("formFile"+index));

				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					
					data : {
						'attachGubun' : 'DO',
						'attachCd' : function(){return doNo;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('path', fileDate);
				formData.append('attachCd', doNo);
				formData.append('etc1', doSeq);
				formData.append('attachSeq', attachDataSeq);
				formData.append('attachGubun', 'DO');
				formData.append('idCheck', 'DO');
				formData.append('contents', $(this).find("td select[name=contents]").val());

				console.log($(this).find("td select[name=contents]").val());
				
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
							$('#btnAttachAdd').attr('disabled', false);
							$('#btnAttachDel').attr('disabled', false);
							$('#itemInspectAttachTable').DataTable().ajax.reload();
							
							tempView = "";
							$('#btnAttachSave').addClass('d-none');
							
						} else if (res.result == 'error') {
							toastr.error(res.message);
						}
					}
				});
			}
			
		});
		if(check && check2){
			toastr.success('등록되었습니다.');
		}
		
	});
	
	//셀렉트박스생성
// 	function selectBoxHtml2(obj, id, sVal, row, meta) {

// 		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		
// 		var option = "<option value=''>선택</option>";
// 		for (key in obj) {
// 			var tmp; 
// 			if (obj[key].baseCd == sVal) {
// 				tmp = "<option value="+ obj[key].baseCd+ " selected>"
// 						+ obj[key].baseNm + "</option>";
// 			} else {
// 				tmp = "<option value="+obj[key].baseCd+">"
// 						+ obj[key].baseNm + "</option>";
// 			}
// 			option += tmp;
// 		}
// 		var ehtml = '</select>';
// 		return shtml + option + ehtml;
// 	}
	
	//출하검사성적서&검사기준서 탭 클릭시
	$('#tab2Head').on('click', function() {
		$('#itemInspectAttachTable').DataTable().ajax.reload();
		var attachSaveCheck = true;
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {
			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				attachSaveCheck = false;
			}
		});
		if(attachSaveCheck) {
			$('#btnAttachSave').addClass('d-none');
		} else {
			$('#btnAttachSave').removeClass('d-none');
		}
		
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		
	});
	
	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){
			console.log("커서이동입니다.");
			console.log("value:" + value);	//inspX1
			console.log("row:" + row);		//0

			if(type=="w"){//중량
				rowCount = weightTable.data().count()-1;	//행수
			}else if(type=="s"){//치수-봉제
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="s2"){//치수-후가공
				rowCount = sizeAdmTable2.data().count()-1;	//행수
			}else if(type=="e"){//외관
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
	
	//이미지 모달 활성화
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
</script>

</body>
</html>
