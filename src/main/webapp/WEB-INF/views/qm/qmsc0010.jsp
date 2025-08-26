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
<!-- 불량이력관리 모달 시작--> 
<div class="modal fade bd-example-modal-lg" id="badPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="margin-right: 40%;">
		<div class="modal-content" style="width: 150%;">
			<div class="modal-header">
				<h5 class="modal-title">불량이력관리 조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="badTable" class="table table-bordered" style="font-size: 15px; color: black;">
					<thead class="thead-light" style="font-size: 15px; color: black;">
						<tr>
							<th>승인여부</th>
							<th>판정</th>
							<th>구분</th>
							<th>입고일자</th>
							<th>협력사</th>
							<th>품목번호</th>
							<th>품명</th>
							<th>입고수량</th>
							<th>불량수량</th>
							<th>검사일</th>
						</tr>
					</thead>
					<tbody style="font-size: 15px; color: black;"></tbody>
				</table>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 불량이력관리 모달 종료-->

<!-- 반품이력관리 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="returnPopUpModal" tabindex="-1" role="dialog" aria-labelledby="returnPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="margin-right: 40%;">
		<div class="modal-content" style="width: 150%;">
			<div class="modal-header">
				<h5 class="modal-title">반품이력관리 조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="returnTable" class="table table-bordered" style="font-size: 15px; color: black;">
					<thead class="thead-light" style="font-size: 15px; color: black;">
						<tr>
							<th>구분</th>
							<th>품목번호</th>
							<th>품명</th>
							<th>반품수량</th>
							<th>반품등록일</th>
							<th>담당자</th>
						</tr>
					</thead>
					<tbody style="font-size: 15px; color: black;"></tbody>
				</table>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 반품이력관리 모달 종료-->

<!-- 수입검사성적서 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="filePopUpModal" tabindex="-1" role="dialog" aria-labelledby="filePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
    	<div class="modal-content" style="width: 500px; position: absolute; left: 50%; transform: translateX(-50%);">
        	<div class="modal-header">
           		<h5 class="modal-title" id="filePopUpLabel">수입검사성적서 등록</h5>
           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
             		<span aria-hidden="true">&times;</span>
           		</button>
         	</div> 
         	<div class="modal-body">
         		<table id="filePopUpTable" class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>										
					<thead class="thead-light">
						<tr>
							<th>선택</th>
							<th>수입검사성적서</th>
						</tr>
					</thead>
		 		</table>
         	</div>
         	<div class="modal-footer">
	       		<button type="button" class="btn btn-primary float-right"
					id="btnFileSave">등록</button>
				<button class="btn btn-primary d-none" id="btnFileLoading" type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
				</button>
	          	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         	</div>
    	</div>
	</div>
</div>
<!-- 수입검사성적서 모달 종료-->

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
       		<table id="" class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>										
				<thead class="thead-light">
					<tr>
						<th>BarcodeNo</th>
						<td ><input type="text" class="form-control" id="popupBarcodeNo" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
						<th >입고수량</th>
						<td><input type="text" class="form-control" id="popupPreInWhsQty" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
					</tr>
				</thead>
			</table>
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

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">수입검사관리대장(레이저)</li>
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
						<table id="purchaseOrderAdmTable" class="table table-bordered">
							<colgroup>
								<col width="8%">
								<col width="10%">
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="16%">
								<col width="5%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
<%-- 								<col width="6%"> --%>
							</colgroup> 
							<thead class="thead-light">
								<tr>
									<th>입고전표번호</th>
									<th>거래처</th>
									<th>승인여부</th>
									<th>판정</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th class="text-center">최근 입고일</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">합격수량</th>
									<th class="text-center">불합격수량</th>
									<th>검사일</th>
<!-- 									<th>부적합처리</th> -->
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
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Head">성적서</a>
						</li>
					</ul>
				</div>
				<!--====================TAB-UI=======================-->
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-success float-left mr-1" 	 id="btnApprove">승인</button>
								<button type="button" class="btn btn-success float-left mr-1" 	id="btnInspPopup">검사항목</button>
								<button type="button" class="btn btn-primary float-left d-none"  id="btnCancle">승인취소</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnAdd">등록</button>
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
												<th>LOT NO</th>
												<td>
													<input type="text" class="form-control" id="lotNo" name="lotNo" style="min-width : 100%;" disabled/>
												</td>
												<th>단위</th>
												<td><input type="text" class="form-control" id="itemUnit" name="itemUnit" style="text-align:center;" disabled /></td>
											</tr>
											<tr>
												<th>판정</th>
												<td>
													<select class="custom-select" id="qaEval" disabled>
														<option value="" selected>선택</option>
														<option value="001">합격</option>
														<option value="002">불합격</option>
													</select>
													
												</td>
												<th>발주구분</th>
												<td><input type="text" class="form-control" id="receiptGubun" name="receiptGubun" style="text-align:center;" disabled/></td>
											</tr>
											<tr>
												<th>검사일</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="inspectDate" name="inspectDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="inspectDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
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
												<th>입고수량</th>
												<td><input type="text" class="form-control" id="preInWhsQty" name="preInWhsQty" style="text-align:right;" disabled /></td>
												<th>검사수량</th>
												<td><input type="text" class="form-control" id="inspectCnt" name="inspectCnt" style="text-align:right;" disabled /></td>
											</tr>
											<tr>
												<th>합격수량</th>
												<td><input type="text" class="form-control" id="pairQty" name="pairQty" disabled style="text-align:right" /></td>
												<th>불량수량</th>
												<td><input type="text" class="form-control" id="faultyQty" name="faultyQty" disabled style="text-align:right" /></td>
											</tr>
											<tr>
												<th>성적서 접수</th>
												<td>
													<div class="container">	
														<div class="row">
															<div class="col-sm">
																<input class="custom-radio mt-1" type="radio" id="millSheetY" name="millSheet" value="001" disabled> 
																<label class="" for="millSheetY">유</label>
															</div>
															<div class="col-sm">
																<input class="custom-radio mt-1" type="radio" id="millSheetN" name="millSheet" value="002" disabled> 
																<label class="" for="millSheetN">무</label>
															</div>
														</div>
													</div>
												</td>					
												<th>비고</th>
												<td>
													<input type="text" class="form-control" id="inspectDesc" name="inspectDesc" style="min-width : 100%;" maxlength="64" placeholder="64자 내외" disabled/>
												</td>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="row pt-1 pb-1">
								<button type="button" class="btn btn-warning float-left mr-1" id="btnAllOk" disabled>선택합격</button>
								<button type="button" class="btn btn-danger float-left" id="btnJrbr" disabled>선택불량</button>
							</div>
							<form id="form3">
								<div class="table-responsive">
									<table id="itemFaultyTypeTable" class="table table-bordered">
										<colgroup>
											<col width="5%">
											<col width="21%">
											<col width="16%">
											<col width="16%">
											<col width="10%">
											<col width="16%">
											<col width="16%">
										</colgroup>					
										<thead class="thead-light">
											<tr>
												<th><input type="checkbox" id="checkAll" name="checkAll" disabled></th>
												<th>BarcodeNo</th>
												<th class="text-center">입고수량</th>
												<th class="text-center">합격수량</th>
												<th>판정</th>
												<th class="text-center">불량수량</th>
												<th class="text-center">부적합처리</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="table-responsive">
								<table class="table table-bordered">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tr>
										<th colspan="2">수입검사</th>
									</tr>
									<tr>
										<th>원재료</th>
										<th>수입검사기준서</th>
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
								</table>
							</div>
						</div>
						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-left mr-1" id="btnAttachAdd" >추가</button>
								<button type="button" class="btn btn-danger float-left mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnAttachSave">저장</button>
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
												<th>성적서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
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
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록/수정</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
								<colgroup>
									<col width="10%">
									<col width="60%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>기준</th>
										<th>확인방법</th>
										<th>판정</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!--  Modal End-->
	</div> 
</div>
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

	let currentHref = "qmsc0010";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","수입검사관리대장(레이저)"); 
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let btnView = '';

	let printArray = new Array();
	
	var index = 0;
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";

	var inSlipNo = null;
	var inSlipSeq = null;
	var poNo = '';
	var poSeq = 0;
	var inSeq = 0;
	var inspectDate;
	var preInWhsQty;
	var inspectFileNm;
	var tableIdx = 0;
	var tempView = '';
	var attachSeq;
	var mainGubun = null;
	var itemGubun = null;
	var approvalYn = null;
	//외관,물성치 테이블 초기화를 위한 itemSeq 초기화
	var itemSeq = '';
	var barcodeNo;
	var searchOption="003";
	var approvalYnOption = "002";
	var qaEvalOption = "";
	var modalHide = true;
	var poSeq = '';
	var inSeq = '';
	var inspCdVal = null;

	let inspDesc1Html = "";
	let inspDesc2Html = "";
		
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";
	
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	console.log(userId);
	console.log(menuUrl);
	var jrCheck = true;
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;

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
				console.log('hi');
				$('#btnApprove').removeClass('d-none');
// 				$('#btnCancle').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
// 				$('#btnCancle').addClass('d-none');
			}
		},
	});
	
	//공통코드 시작
	var qaEvalCode=new Array();
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>

	var inspectLvlCode=new Array();
    <c:forEach items="${inspectLvl}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inspectLvlCode.push(json);
	</c:forEach>

	var contentsCode=new Array();
    <c:forEach items="${contents}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		contentsCode.push(json);
	</c:forEach>

	var inputMethodCode=new Array();	//검사입력방식
    <c:forEach items="${inputMethod}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inputMethodCode.push(json);
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

	//공통코드 끝
	
	uiProc(true);


	//선택박스 처리
	//selectBoxAppend(qaEvalCode, "qaEval", "", "2");
	selectBoxAppend(inspectLvlCode, "inspectLvl", "", "2");
	selectBoxAppend(contentsCode, "contents", "", "2");

	$('#saveBtnModalY').on('click', function() {
		//$('#btnSave').trigger('click');
		$('#btnAdd').attr('disabled', false);		//등록 버튼
	    $('#btnEdit').attr('disabled', false);		//수정 버튼
	    $('#btnSave').addClass('d-none');
	    
	    uiProc(true);
	});

	
	//수입검사관리대장(레이저) 목록조회
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
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
		ajax : {
			url : '<c:url value="io/itemInspectMasterAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
				'approvalYn' : function(){return approvalYnOption},
				'mainGubun' : function(){return '001'},
			},
		}, 
		rowId : 'poNo',
		columns : [ 
			{//입고전표번호
				data : 'inSlipNo' 
			}, 
			{//거래처
				data : 'dealCorpNm' 
			}, 
			{//승인여부
				data : 'approvalYn',
				render : function(data, type, row, meta){
					if(data!=null){
						if(data=="001"){
							return "승인";
						}else{
							return '<span style="color:red;">미승인</span>';
						}
					}else{
						return '<span style="color:red;">미승인</span>';
					}
					
				} 
			}, 
			{//판정
				data : 'qaEval',
				render : function(data, type, row, meta){
					if(data!=null && data!=""){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}else{
							return '<span>미판정</span>';
						}
					}else{
						return '<span>미판정</span>';
					}
				} 
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
			{//최근 입고일
				data : 'preInWhsDate',
				render : function(data, type, row, meta){
					return moment(data).format('YYYY-MM-DD');
				},
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
			}, 
			{//합격수량
				data : 'pairQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{//불합격수량
				data : 'faultyQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{//검사일
				data : 'inspectDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format("YYYY-MM-DD");
					}else{
						return '-';
					}
				}
			},
			{//부적합처리 (숨김)
				data : 'faultyPcs',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			}, 
		],
		columnDefs : [ {
			targets : [8,9,10],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		}, {//부적합처리 컬럼 숨김처리
			targets : [12], "visible": false
		}
		],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});

	var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">입고전표일자</label>';
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
	    
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
		html1 += '<select class="custom-select" id="approvalYnOption">';
		html1 += '<option value="">전체</option>';
		html1 += '<option value="001">승인</option>';
		html1 += '<option value="002" selected>미승인</option>';
		html1 += '</select>';
		
		/* html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">판정여부</label>'; 
		html1 += '<select class="custom-select" id="qaEvalOption">';
		html1 += '<option value="" selected>전체</option>';
		html1 += '<option value="001">합격</option>';
		html1 += '<option value="002">일부합격</option>';
		html1 += '<option value="002">불합격</option>';
		html1 += '</select>';  */
		
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '&nbsp;<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>'
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right d-none" id="printCnt" placeholder="매수" style="width:40px;" value="1">';
		html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info d-none" id="btnQAPrint">QA라벨발행</button>'
	    html1 += '</div>';
   
	$('#purchaseOrderAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click',function(){
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		approvalYnOption = $('#approvalYnOption option:selected').val();
		//qaEvalOption = $('#qaEvalOption option:selected').val();
		//searchOption = "003";
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
	});

	//전체 조회버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		serverDateFrom = "";
		serverDateTo = "";
		approvalYnOption = "";
		//qaEvalOption = $('#qaEval option:selected').val();
		//searchOption = "004";
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
	});


	//수입검사관리대장(레이저) 목록 선택시
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        }
        else {
        	$('#purchaseOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover

		tableIdx = $('#purchaseOrderAdmTable').DataTable().row(this).index();
		
		var data = purchaseOrderAdmTable.row(this).data();
		uiProc(true);
		
		inSlipNo = data.inSlipNo;	//입고전표번호
		poNo = data.poNo;
	    poSeq = data.poSeq;
	    itemSeq = data.itemSeq;
	    mainGubun = data.mainGubun;
	    itemGubun = data.itemGubun;
	    inspectDate = data.inspectDate;
	    preInWhsQty = data.preInWhsQty;
	    approvalYn = data.approvalYn;
	    poSeq = data.poSeq;
		inSeq = data.inSeq;
		inspCdVal = data.inspCd;
		sideView2 = "";
		
		$('#itemUnit').val(data.itemUnitNm); 
		$('#receiptGubun').val(data.receiptGubunNm);
		$('#preInWhsQty').val(data.preInWhsQty == null ? "0" : rmDecimal(data.preInWhsQty));//입고수량
		$('#inspectCnt').val(data.inspectQty == null ? "0" : rmDecimal(data.inspectQty));	//검사수량
		$('#pairQty').val(data.pairQty == null ? "0" : rmDecimal(data.pairQty));			//합격수량
		$('#faultyQty').val(data.faultyQty == null ? "0" : rmDecimal(data.faultyQty));	//불량수량
		$('#inspectChargr').val(data.inspectChargr == null ? "" : data.inspectChargr);		//검사자
		$('#inspectChargrNm').val(data.inspectChargrNm == null ? "" : data.inspectChargrNm);	//검사자명
		$('#inspectDesc').val(data.inspectDesc == null ? "" : data.inspectDesc);				//비고
		$('#qaEval').val(data.qaEval);
		$('#lotNo').val(data.lotNo);			
		data.inspectDate == null ? $('#inspectDate').val('') : $('#inspectDate').val(moment(data.inspectDate).format("YYYY-MM-DD"));


		//승인 한 경우(등록,수정 비활성화, 검사항목 수정 x)
		if (approvalYn == "001") {         //자재상태:입고 -> 승인/승인취소 모두 불가

			$('#tab2Head').removeClass('disabled');
			$('#btnApprove').attr('disabled', true);	//승인 버튼
			$('#btnAdd').attr('disabled', true);		//등록 버튼
		    $('#btnEdit').attr('disabled', true);		//수정 버튼
			$('#btnInspPopup').attr('disabled', false);	//검사항목 버튼
			$('#btnInspAdd').addClass('d-none');		//검사항목 등록버튼
			$('#btnInspSave').addClass('d-none');		//검사항목 저장버튼

		//승인 안한 경우(등록,수정 비활성화, 검사항목 수정 x)
	    } else if(approvalYn == "002" || approvalYn==null) {
	    	if(data.qaEval!=null && data.qaEval!=""){
				$('#btnApprove').attr('disabled',false);
			}else{
				$('#btnApprove').attr('disabled',true);
			}	

	    	if(inspectDate != null){
	    		$('#tab2Head').removeClass('disabled');
		    	$('#btnAdd').attr('disabled', true);
		    	$('#btnEdit').attr('disabled', false);	
			}else{
				$('#tab2Head').addClass('disabled');
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', true);
			}
			
	    	$('#btnInspPopup').attr('disabled', false);	//검사항목 버튼
			$('#btnInspAdd').removeClass('d-none');		//검사항목 등록버튼
			$('#btnInspSave').removeClass('d-none');	//검사항목 저장버튼
	    }
		
	    $('#btnSave').addClass('d-none');

	  	//사진
		imgPrint();
		
		//탭 보여주기
		$('#tab1Head').tab('show');
		
		//탭 새로고침
	    $('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});

		//검사항목 목록조회
	    $('#extAdmTable').DataTable().ajax.reload(function(){});
		
	});
	
	//수입검사관리대장(레이저) 바코드별 목록조회
	let itemFaultyTypeTable = $('#itemFaultyTypeTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
			ajax : {
			url : '<c:url value="io/preInOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'inSlipNo' :  function(){return inSlipNo;},
			},
		},
		columns : [ 
			{
				render : function(data,type,row,meta){
					return '<input type="checkbox" name="check" disabled>';
				}
			}, 
			{
				data : 'barcodeNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'preInWhsQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'pairCnt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{
				data : 'qaEval',
				render : function(data,type,row,meta){
					if(data!=null){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}else{
							return '미판정';
						}
					}else{
						return '미판정';
					}
				}
			},
			{
				data : 'faultyCnt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},			
			{
				data : 'unfitProcNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else{
						return '-';
					}
				}
			},				
		],
		columnDefs: [
			{ targets: [2,3,5] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	    ],
	});

	//수입검사관리대장(레이저) 바코드별 목록 더블클릭시
    $('#itemFaultyTypeTable tbody').on( 'dblclick', 'tr', function () {

    	if($('#qaEval option:selected').val()==""){
			toastr.warning("우선 검사항목을 등록해주세요.");
			return false;
        }
        
       	if($(this).hasClass('selected')){
	        $(this).removeClass('selected');
        }else {
        	$('#itemFaultyTypeTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

		tableIdx = $('#itemFaultyTypeTable').DataTable().row(this).index();
		 
		inSlipSeq =  itemFaultyTypeTable.row(this).data().inSlipSeq;	//입고전표시퀀스
		inSeq =  itemFaultyTypeTable.row(this).data().inSeq;
		barcodeNo =  itemFaultyTypeTable.row(this).data().barcodeNo;
		preInWhsQty =  itemFaultyTypeTable.row(this).data().preInWhsQty;
		selectFaultyType();


		$('#popupBarcodeNo').val(barcodeNo);
		$('#popupPreInWhsQty').val(rmDecimal(preInWhsQty));
		
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


	//수입검사관리대장(레이저) 바코드별 저장 처리
	$('#btnFaultyTypeSave').on('click',function() {
		var dataArray = new Array();		
		var check = true;  	
		jrCheck=true;	
		var sum = 0;
		
		
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
			if(sum>$('#popupPreInWhsQty').val()){
				toastr.warning("불량수량값을 초과했습니다.");
				check=false;
				jrCheck=false;
				return false;
			}
		});
		
		if(check){
			$('#faultyTypePopUpTable tbody tr').each(function(index, item){
				var rowData = new Object();

				rowData.inSlipNo= inSlipNo;
				rowData.inSlipSeq = inSlipSeq;
				rowData.itemSeq = itemSeq;
				rowData.pairCnt = parseFloat($('#popupPreInWhsQty').val().replace(/,/g,'')) - sum;
				rowData.faultyCnt = sum;
				rowData.qaEval = sum > 0 ? "002" : "001";	//불합격이 있을 경우 : 불합격/ 없을 경우 : 합격
				
				rowData.faultyTypeCd = $(this).find("td input[name=faultyTypeCd]").val();
				rowData.faultyTypeQty = $(this).find("td input[name=faultyTypeQty]").val()==""?'0':$(this).find("td input[name=faultyTypeQty]").val().replace(/,/g,'');
				rowData.faultyTypeDate = $(this).find("td input[name=faultyTypeDate]").val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find("td input[name=faultyTypeDesc]").val();
		        dataArray.push(rowData);
			});
		}
		if(check){
			$.ajax({
				url : '<c:url value="io/itemInspectFaultyTypeCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				async : false,
				success : function(res) {				
					if (res.result == 'ok') {
						$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
						$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});

						$('#pairQty').val(res.totalPairQty);
						$('#faultyQty').val(res.totalFaultyQty);
						
						$('#faultyTypePopUpModal').modal('hide');
					}else if(res.result == "fail"){
						toastr.error(res.message);
					}else{
						toastr.error(res.message);
					}
				}
			});
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
		uiProc2(false);

		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover

		$('#inspectChargr').val(userNumber);
		$('#inspectChargrNm').val(userNm);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnInspPopup').attr('disabled',false);
		$('#qaEval').attr('disabled',true);
		$('input[name=checkAll]').attr('disabled',false);
		$('input[name=check]').attr('disabled',false);
		btnView = 'add';
	});
	
	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);
		uiProc2(false);
		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover
		$('#btnSave').removeClass('d-none');
		$('input[name=checkAll]').attr('disabled',false);
		$('input[name=check]').attr('disabled',false);
	
		btnView = 'edit';
	});	

	//전체선택 클릭시
	$('#checkAll').on('click',function(){
		if($('#checkAll').is(":checked")){
			$('input[name=check]').prop('checked',true);
		}else{
			$('input[name=check]').prop('checked',false);
		}
	});
	
	//승인 버튼 클릭시
	$('#btnApprove').on('click',function(){
		if(sideView != "edit"){
			toastr.warning("승인할 항목을 선택해주세요.");
			check = false;
			return false;
		}

		if(inspectDate == null || inspectDate == ""){
			toastr.warning("우선 수입검사를 등록해주세요.");
			check = false;
			return false;
		}

		var check = true;
		var dataArray = new Array();	
		
		$('#itemFaultyTypeTable tbody tr').each(function(index, item){
			var rowData = new Object();

			rowData.inSlipNo = inSlipNo;
			inSlipSeq = itemFaultyTypeTable.row(this).data().inSlipSeq;
			rowData.inSlipSeq = inSlipSeq;
			rowData.poNo = poNo;
			rowData.itemGubun = itemGubun;
			var tempItemSeq = itemFaultyTypeTable.row(this).data().itemSeq;
			rowData.itemSeq = tempItemSeq;

			var faultyCnt = parseFloat(itemFaultyTypeTable.row(this).data().faultyCnt.replace(/,/g,''));	//불량수량
			var preInWhsQty = parseFloat(itemFaultyTypeTable.row(this).data().preInWhsQty.replace(/,/g,''));
			console.log(preInWhsQty);
			
			rowData.inWhsQty = preInWhsQty-faultyCnt;	//양품수량
			rowData.faultyCnt = faultyCnt;				//불량수량
			rowData.qaEval = itemFaultyTypeTable.row(this).data().qaEval;
			rowData.barcodeNo = itemFaultyTypeTable.row(this).data().barcodeNo;
			rowData.mainGubun = "001";
			
			//창고 내용 입력
			var tempLocNo;
			var tempAreaCd;
			var tempFloorNm;
			var tempLocCd;
			
			$.ajax({
				url : '<c:url value="io/preInOutWhsAdmList"/>',
				type : 'GET',
				async : false,
				data : {
					'inSlipNo' : function() {return inSlipNo;},
					'inSlipSeq' : function() {return inSlipSeq;},
				},
				success : function(res) {
					let data = res.data;
					
					tempLocNo = data[0].locationNo;
					tempAreaCd = data[0].areaCd;
					tempFloorNm = data[0].floorCd;
					tempLocCd = data[0].locationCd;
				}
			});
			
			rowData.locationNo = tempLocNo;
			rowData.locationCd = tempLocCd;
			rowData.areaCd = tempAreaCd;
			rowData.floorNm = tempFloorNm;
			
	        dataArray.push(rowData);
		});

		console.log(dataArray);
	 
		if(check){
			$.ajax({
				url : '<c:url value="qm/poStatusUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {				
					if(res.result == "ok"){
						toastr.success("승인 되었습니다.");
						$('#btnApprove').attr('disabled', true);
						$('#btnCancle').attr('disabled', false);
						$('#btnInspPopup').attr('disabled', true);
						$('#btnEdit').attr('disabled', true);
						
						$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
					}else if(res.result == "fail"){
						toastr.warning(res.message);
					}else{
						toastr.warning(res.message);
					}
				},
				complete : function(){
					$('#my-spinner').hide();
				},
			});
		}
	});

	//승인취소 버튼 클릭시
	$('#btnCancle').on('click',function(){
		if(sideView != "edit"){
			toastr.warning("승인취소할 항목을 선택해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="qm/poStatusUpdate"/>',
			type : 'GET',
			data : {
				'poNo' : function(){return poNo;},
				'poSeq' : function(){return poSeq;},
				'inSeq' : function(){return inSeq;},
				'faultyCnt' : function(){return $('#faultyCnt').val().replace(/,/g,'')},
				'value' : 2
				},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("승인취소 되었습니다.");
					$('#btnApprove').attr('disabled', false);
					$('#btnCancle').attr('disabled', true);
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
					$('#tab2Head').removeClass('disabled');
				}else if(res.result == "notApprove"){
					toastr.warning("승인되지 않은 자재입니다. 확인해주세요.");
				}else if(res.result == "notInspect"){
					toastr.warning("수입검사되지 않은 자재입니다. 확인해주세요.");
				}else if(res.result == "alreadyIn"){
					toastr.warning("이미 입고된 자재입니다. 확인해주세요.");
				}
			}
		});
	});

	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
		/* if($('#qaEval').val()==""){
			toastr.warning("판정을 선택해주세요.");
			return false;
		} */

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

		var url= "";
		if(btnView=="add"){
			url = '<c:url value="qm/itemInspectMasterCreate"/>';
		}else{
			url = '<c:url value="qm/itemInspectMasterUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'inSlipNo' : function(){return inSlipNo;},
				'itemSeq' : function(){return itemSeq;},
				'inspectCnt' : function(){return $('#inspectCnt').val().replace(/,/g,'')},
				'inspectDate' : function(){return $('#inspectDate').val().replace(/-/g,'')},
				'inspectChargr' : function(){return $('#inspectChargr').val()},
				'qaEval' : function(){return $('#qaEval').val()},
				'approvalYn' : "002",	//미승인
				'inspectDesc' : function(){return $('#inspectDesc').val()}
				},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);

					$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
			    	$('#btnQAPrint').attr('disabled', false);
			    	$('#btnSave').addClass('d-none');
					$('#btnApprove').attr('disabled', false);

					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
					$('#itemFaultyTypeTable').removeClass('tr_highlight_row');	//hover

					$('#checkAll').attr('disabled',true);
					$('input[name=check]').attr('disabled',true);
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	}) 
	

	//담당자 팝업 시작
	var userPopUpTable;
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
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#userPopUpModal').modal('show');
	}


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
					url : '<c:url value="qm/itemInspectFaultyTypeList"/>',
					type : 'GET',
					async : false,
					data : {
						'inSlipNo' : function(){return inSlipNo;},
						'inSlipSeq' : function(){return inSlipSeq;},
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
								return '<input type="date" class="form-control"  name="faultyTypeDate" value="'+moment(data).format("YYYY-MM-DD")+'" />'  
								
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

		if(modalHide){
			$('#faultyTypePopUpModal').modal('show');
		}
	}


	function uiProc(flag) {
		$('#inspectDateCalendar').attr('disabled', flag);
		$('#btnInspectChargr').attr('disabled', flag);
		$('#qaEval').attr('disabled', flag);
		$('#inspectCnt').attr('disabled', flag);
		$('#inspectDesc').attr('disabled', flag); // 비고 input
		$('#btnJrbr').attr('disabled', flag); // 전량불량 버튼
		$('#btnAllOk').attr('disabled', flag); // 전량불량 버튼
	}

	function uiProc2(flag) {
		$('input[name=faultyTypeQty]').attr('disabled', flag);
		$('button[name=faultyTypeDateFromCalendar]').attr('disabled', flag);
		$('input[name=faultyTypeDesc]').attr('disabled', flag);
	}
	

	//파일 삭제버튼
   	function inspectFileNmDel(value) {
	
		$.ajax({
			url : '<c:url  value="qm/inspectFileDelete"/>',
			type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'inSeq' : inSeq,
				'value' : value
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("파일이 삭제되었습니다.");
				}
			}
		});
		
		$('#fileNm' + value).val('');
		$('#fpValue' + value).text("파일을 선택해주세요");
	}


	//QA라벨발행 버튼 클릭시
	$(document).on('click','#btnQAPrint',function(){
		var count=0;

		$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
			if($('input[name=checkbox]').eq(index).is(':checked')) {

				count++;
			}
		});
		
		if(count == 0) {
			toastr.warning('인쇄할 제품을 체크하고 인쇄해주세요.');
			count=0;
			return false;
		}

		var cnt = $('#printCnt').val();

    	for(var i=0;i<printArray.length;i++) {
        	for(var j=0;j<cnt;j++) {
        		labelPrint(	printArray[i].qaEval,
	    				printArray[i].preInWhsDate,
	    				printArray[i].preInWhsQty,
	    				printArray[i].poNo,
	    				printArray[i].inspectDate,
	    				printArray[i].inspectChargrNm,
	    				printArray[i].partCd);
            }
        }

    	printArray =[];	//프린트 배열 초기화
    	$('input[name=checkbox]').prop('checked',false);
    	count=0;
    });
	
	
</script>
<script>

//Do printing...
function labelPrint(qaEval,
					preInWhsDate,
					preInWhsQty,
					poNo,
					inspectDate,
					inspectChargrNm,
					partCd) {

		var cmds="";
		
		var cmds =  "1";
	 		cmds += "34#$";
	 		cmds += "^XA";
	 		cmds += "^PRD";
	 		cmds += "^SEE:UHANGUL.DAT^FS";
	 		cmds += "^CW1,E:KFONT3.FNT^CI26^FS";
	 		cmds += "^FO60,10^GB210,352,2^FS";
	 		cmds += "^FO268,10^GB170,352,2^FS";
	 		cmds += "^FO268,10^GB500,72,2^FS";
	 		cmds += "^FO268,80^GB500,72,2^FS";
	 		cmds += "^FO268,150^GB500,72,2^FS";
	 		cmds += "^FO268,220^GB500,72,2^FS";
	 		cmds += "^FO268,290^GB500,72,2^FS";
	 		if(qaEval == '합격') {
	 			cmds += "^FO95,140^A1N,65,65^FD"+qaEval+"^FS";
		 	} else if(qaEval == '불합격') {
		 		cmds += "^FO70,40^A1N,70,70^FDNOK^FS";
		 		cmds += "^FO70,140^A1N,65,65^FD"+qaEval+"^FS";
			}
	 		cmds += "^FO90,270^A1N,30,30^FD  "+inspectChargrNm+"^FS";
	 		cmds += "^FO90,320^A1N,30,30^FD품질보증팀^FS";
	 	    cmds += "^FO280,30^A1N,33,33^FD입고일자^FS";
	 	   	cmds += "^FO450,30^A1N,33,33^FD"+preInWhsDate+"^FS";
	 	    cmds += "^FO280,100^A1N,33,33^FD입고수량^FS";
	 	   	cmds += "^FO450,100^A1N,33,33^FD"+preInWhsQty+"^FS";
	 	    cmds += "^FO280,170^A1N,33,33^FDPO.NO^FS";
	 	   	cmds += "^FO450,170^A1N,33,33^FD"+poNo+"^FS";
	 	    cmds += "^FO280,240^A1N,33,33^FD검사일자^FS";
	 	   	cmds += "^FO450,240^A1N,33,33^FD"+inspectDate+"^FS";
	 	    cmds += "^FO280,310^A1N,33,33^FDCODE^FS";
	 	   	cmds += "^FO450,310^A1N,33,33^FD"+partCd+"^FS";

	 	    
	 		//cmds += "^FO70,80^GB200,73,3^FS";
	 	    //cmds += "^FO110,105^A1N,30,30^FDI T E M^FS";		    
	 		//cmds += "^FO70,150^GB200,73,3^FS";
	 	    //cmds += "^FO110,175^A1N,30,30^FDS P E C^FS";		    
	 		//cmds += "^FO70,220^GB200,73,3^FS";
	 	    //cmds += "^FO85,245^A1N,25,25^FD입고일자/수량^FS";		    
	 		//cmds += "^FO70,290^GB700,73,3^FS";	
	 		cmds += "^XZ";
			sendMessage(cmds);
}

	//불량이력관리팝업
	var partCd= '';
	var partRev= '';
	var inspectDate= '';
	
	function selectBad(idx) {
		itemSeq = itemInspectTable.row(idx).data().itemSeq;
		inspectDate = itemInspectTable.row(idx).data().inspectDate;
		
		//목록
		let badTable = $('#badTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
			language : lang_kor,		
			paging : true,
			searching : true,
			info : true,
			destroy: true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 15,
			//ordering: false,
			ajax : {
				url : '<c:url value="qm/itemInspectAdmPopUpList"/>',
				type : 'GET',
				data : {
					'itemSeq'	: function(){return itemSeq;},
					'inspectDate' : function(){return inspectDate;}
					
				},
			},
			rowId : 'soNb',
			columns : [
				{data : 'statusCd',
					render: function(data, type, row, meta){
						if(data == "A" || data == "L"){
							return '승인';
						}else{
							return '미승인';
						}
					}
				},
				{data : 'qaEval',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return data;
						}
					}
				},
				{data : 'itemGubun',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return data;
						}
					}
				},	
				{data : 'preInWhsDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{data : 'dealCorpNm' ,
					render : function(data, type, row, meta){
						if(data!=null){
							return data;
						}else{
							return row['spplyCorpNm'];
						}
					}
				}, 
				{data : 'itemCd'},
				{data : 'itemNm'},
				{data : 'preInWhsQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'faultyCnt',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'inspectDate',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return moment(data).format("YYYY-MM-DD");
						}
					}
				},
			],
			drawCallback: function(settings) {
	        }, 
	        columnDefs : [ {
				"defaultContent": "-", "targets": "_all",	"className": "text-center"
			}],
		    order : [
				[9, 'desc']
			]
		});
		$('#badPopUpModal').modal('show');
	}

	
	//반품이력관리
	function selectReturn(idx) {
		itemSeq = itemInspectTable.row(idx).data().itemSeq;
		inspectDate = itemInspectTable.row(idx).data().inspectDate;

		//반품 목록
		let returnTable = $('#returnTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
			language : lang_kor,		
			paging : true,
			searching : true,
			info : true,
			destroy: true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 15,
			//ordering: false,
			ajax : {
				url : '<c:url value="qm/itemInspectReturnPopUpList"/>',
				type : 'GET',
				data : {
					'itemSeq'		: function(){return itemSeq;},
					'inspectDate' 	: function(){return inspectDate;}
				},
			},
			rowId : 'soNb',
			columns : [
				{ data : 'itemGubun' 		},
				{ data : 'itemCd'  			},
				{ data : 'itemNm'  			},
				{data : 'returnQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'returnDate',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return moment(data).format("YYYY-MM-DD");
						}
					}
				},
				
				{ data : 'faultyChargrNm' 	},
			],
			drawCallback: function(settings) {
	        }, 
	        columnDefs : [ {
				"defaultContent": "-", "targets": "_all",	"className": "text-center"
			}],
		    order : [
				[5, 'desc']
			]
		});
		$('#returnPopUpModal').modal('show');
	}

	//성적서 탭 클릭시
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
	
	//이미지 등록
	function imageUpload(number) {
		var value = null;

		value = number;

		var fileListView = "";

		var formData = new FormData(document.getElementById("form21")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		
		formData.append("inSlipNo", inSlipNo);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.

		$.ajax({
			url : '<c:url value="/qm/itemInspectImageUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgName' + value).text("");
				}
// 				imgPrint();
			}
		});

	}
	
	//이미지 삭제
	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/qm/itemInspectImageDelete"/>',
			type : 'POST',
			data : {
				'poNo' : function(){return poNo;},
				'poSeq' : function(){return poSeq;},
				'inSeq' : function(){return inSeq;},
				'value' : function(){return value;},
			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
// 					imgPrint();
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
		$('#imgAdd' + value).val("");
		$('#imgName' + number).val("");
		$('#imgName' + number).text("");
		$('#imgName' + number).attr("src", "");
	}
	

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
		pageLength : 10,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return inSlipNo;},
				'attachGubun' : function(){return 'II';},
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
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+inSlipNo+'&attachGubun=II">'+data+'</a>';
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
		}
		tableIdx = $('#itemInspectAttachTable').DataTable().row(this).index();
		attachSeq = itemInspectAttachTable.row(tableIdx).data().attachSeq;
		tempView = "edit";
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
 		sideView2 = 'add';

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
					'attachGubun' : function(){return 'II';},
					'attachCd' : function(){return inSlipNo;},
					'etc1' : function(){return inSlipSeq;},
					'etc2' : function(){return inSeq;},
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
	
	// 관련자료 저장
	$('#btnAttachSave').on('click', function() {
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
						'attachGubun' : 'II',
						'attachCd' : function(){return inSlipNo;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('path', fileDate);
				formData.append('attachCd', inSlipNo);
				formData.append('attachSeq', attachDataSeq);
				formData.append('attachGubun', 'II');
				formData.append('idCheck', 'II');
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
							sideView2 = "";
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
	
	

	// 선택 event
  	$(document).on('change','input:checkbox[name=checkbox]',function() {

		if($(this).is(':checked')) {
			var data = itemInspectTable.row($(this).parents().parents()).data();
	    	var obj = new Object();
	    	obj.qaEval = data.qaEval;
	    	obj.preInWhsDate = moment(data.preInWhsDate).format('YYYY.MM.DD');
	    	obj.preInWhsQty = rmDecimal(data);
	    	obj.poNo = data.poNo;
	    	obj.inspectDate = moment(data.inspectDate).format('YYYY.MM.DD');
	    	obj.inspectChargrNm = data.inspectChargrNm == null ? "-" : data.inspectChargrNm;
	    	obj.partCd = data.partCd;
	    	obj.barcodeNo = data.barcodeNo;
    		printArray.push(obj);
    		
	    } else if($(this).is(':checked')==false) {
		    
		    var data = itemInspectTable.row($(this).parents().parents()).data();
		    var barcodeNo = data.barcodeNo;

		    if(printArray.findIndex(i => i.barcodeNo == barcodeNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.barcodeNo == barcodeNo),1);
			}
		}
	}); 


 	//검사항목등록
	$('#btnInspPopup').on('click',function(){
		if(!$('#purchaseOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			return false;
		}
		inspTypeVal = '외관';
		$('#inspPopupModal').modal('show');
		$('#extAdmTableDiv').removeClass('d-none');

		setTimeout(function(){
			extAdmTable.draw();
		},200)
	});


	var inspTypeVal="외관";
	//외관 버튼 클릭시
	$('#btnExt').on('click',function(){
		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			extAdmTable.draw();
		},200);
	});
	
	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){
		$('select[name=inspResult]').attr('disabled',false);
		$('#extAdmTable select[name=inspResult').eq(0).focus();
	});


	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array(); 

		$('#extAdmTable tbody tr').each(function(index, item) {

			var rowData = new Object();

			rowData.inspResultGubun = "003";
			rowData.inspSourceNo = inSlipNo;
			rowData.inspSourceSubNo = "";
			rowData.inspCd = extAdmTable.row(index).data().inspCd;
			rowData.inspType = extAdmTable.row(index).data().inspType;
			rowData.inspSeq = extAdmTable.row(index).data().inspSeq;

			rowData.inspResult = $(this).find('td select[name=inspResult]').val();	////최종판정 합격:001/불합격:002
			
			rowData.inspX1 = $(this).find('td select[name=inspResult]').val();
			rowData.inspX2 = "";
			rowData.inspX3 = "";
			rowData.inspX4 = "";
			rowData.inspX5 = "";
			rowData.inspX6 = "";
			rowData.inspectGubun = "";
			dataArray.push(rowData);
			console.log(rowData)
		});
				

		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/inspResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");

						$('select[name=inspResult]').attr('disabled',true);
						$('input[name=inspX1]').attr('disabled',true);


						let inspTypeArr = ['001','002'];

						$.ajax({
							url : '<c:url value="bm/getInspResult" />',
							type : 'GET',
							data : {
								'inspCd' 		  : function(){return inspCdVal},
								'inspResultGubun' : "003",
								'inspSourceNo' : function(){return inSlipNo},
								'inspTypeArr' : function(){return inspTypeArr},
							}, 
							success : function(res){
								var inspectResult = res.data;		//검사항목 결과
								if(inspectResult == "Y"){
									$('#qaEval').val('001').attr('checked',true);
									$('#btnApprove').attr('disabled',false);
								}else if(inspectResult == "N"){
									$('#qaEval').val('002').attr('checked',true);
									$('#btnApprove').attr('disabled',false);
								}else if(inspectResult == "U"){
									$('#qaEval').val('').attr('checked',true);
								}

								$.ajax({
									url : '<c:url value="qm/itemInspectMasterUpdate"/>',
									type : 'POST',
									data : {
										'inSlipNo' : function(){return inSlipNo;},
										'qaEval' : function(){return $('#qaEval').val()},
									},
									success : function(res){
										if(res.result == "ok"){
									    	$('#purchaseOrderAdmTable').DataTable().ajax.reload();
									    
										}else{
											toastr.error(res.message);
										}
									}
								});

								if(inspectResult!="U"){
									var dataArray = new Array();		
									$('#itemFaultyTypeTable tbody tr').each(function(index, item){
										var rowData = new Object();
										rowData.inSlipNo = inSlipNo;
										rowData.inSlipSeq = itemFaultyTypeTable.row(this).data().inSlipSeq;
										rowData.itemSeq = itemFaultyTypeTable.row(this).data().itemSeq;

										if(inspectResult=="Y"){
											rowData.pairCnt = itemFaultyTypeTable.row(this).data().preInWhsQty.replace(/,/g,'');
											rowData.faultyCnt = "0";
											rowData.qaEval = "001";	//합격
										}else if(inspectResult=="N"){
											rowData.pairCnt = "0";
											rowData.faultyCnt = "0";
											rowData.qaEval = "";	//미판정
										}
								        dataArray.push(rowData);
									});

									$.ajax({
										url : '<c:url value="qm/itemInspectAllCreate"/>',
										type : 'POST',
										datatype: 'json',
										data: JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										success : function(res) {				
											if (res.result == 'ok') {
												$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});
											}else{
												toastr.error(res.message);
											}

											$('#my-spinner').hide();
										}
									});

									console.log(dataArray);
									
								}else{
									$.ajax({
										url : '<c:url value="qm/itemInspectAdmDelete"/>',
										type : 'POST',
										data: {
											'inSlipNo' : function(){return inSlipNo;},
										},
										success : function(res) {				
											if (res.result == 'ok') {
												$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});
											}else{
												toastr.error(res.message);
											}

											$('#my-spinner').hide();
										}
									});
								}
							}
						});
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
				'inspResultGubun' : function(){return "003"},
				'inspSourceNo' : function(){return inSlipNo;},
				'inspGubun' : function(){return "003"},
				'inspType' : function(){return "001";},
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
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" disabled/>';
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
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ]
	});
	
	
	//선택합격 처리
	$('#btnAllOk').on('click',function(){
		modalHide = false;
		jrCheck = false;
		
		if(!$('input[name=check]').is(":checked")){
			toastr.warning("선택합격 처리할 LOTNO를 선택해주세요.");
			return false;
		}

		$('#my-spinner').show();
		
		setTimeout(function(){
			$('#itemFaultyTypeTable tbody tr').each(function(index, item) {
				if($(this).find('input[name=check]').is(":checked")){
					console.log('dd?')
					tableIdx = $('#itemFaultyTypeTable').DataTable().row(this).index();
					inSlipSeq =  itemFaultyTypeTable.row(this).data().inSlipSeq;
					lotNo =  itemFaultyTypeTable.row(this).data().lotNo;
					preInQty =  itemFaultyTypeTable.row(this).data().preInWhsQty;
					selectFaultyType();
					$('#popupLotNo').val(lotNo);
					$('#popuppreInWhsQty').val(rmDecimal(preInQty));
					$('input[name=faultyTypeQty]').val('0');
					$('input[name=faultyTypeDesc]').eq(0).val('');
					$('#btnFaultyTypeSave').trigger('click');
				}
			});
			
			if(jrCheck){
				$('#my-spinner').hide();
				toastr.success('선택한 LOTNO는 합격처리 되었습니다.');
				modalHide = true;
			}
		},200);
	});

	//선택불량 처리
	$('#btnJrbr').on('click', function() {
		modalHide = false;
		jrCheck = false;

		if(!$('input[name=check]').is(":checked")){
			toastr.warning("선택불량 처리할 LOTNO를 선택해주세요.");
			return false;
		}

		$('#my-spinner').show();
		setTimeout(function(){
			$('#itemFaultyTypeTable tbody tr').each(function(index, item) {
				if($(this).find('input[name=check]').is(":checked")){
					tableIdx = $('#itemFaultyTypeTable').DataTable().row(this).index();
					inSlipSeq =  itemFaultyTypeTable.row(this).data().inSlipSeq;
					lotNo =  itemFaultyTypeTable.row(this).data().lotNo;
					preInQty =  itemFaultyTypeTable.row(this).data().preInWhsQty;
					selectFaultyType();
					$('#popupLotNo').val(lotNo);
					$('#popuppreInWhsQty').val(rmDecimal(preInQty));
					$('input[name=faultyTypeQty]').val('0');
					$('input[name=faultyTypeQty]').eq(0).val(preInQty);
					$('input[name=faultyTypeDesc]').eq(0).val('전량불량');
					$('#btnFaultyTypeSave').trigger('click');
				}
			});
			
			if(jrCheck){
				$('#my-spinner').hide();
				toastr.success('선택한 LOTNO는 불량처리 되었습니다.');
				modalHide = true;
			}
		},200);
	});
	

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
	
	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){

			rowCount = extAdmTable.data().count()-1;	//행수
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
		}
	}
	
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
</script>

</body>
</html>