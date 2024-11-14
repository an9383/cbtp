<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!-- 통합자료실 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="fileReferencePopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipRestartPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 1200px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipRestartPopUpLabel">금형 일상관리 절차서 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="fileReferencePopUpTable" class="table table-bordered">
	                   		<colgroup>
								<col width="1%">
								<col width="3%">
								<col width="3%">
								<col width="2%">
								<col width="10%">
								<col width="2%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th style="padding:0.35rem !important;">담당자</th>
									<th>부서명</th>
									<th style="padding:0.35rem !important;">첨부일자</th>
									<th>파일명</th>
									<th>파일종류</th>
									<th style="padding:0.35rem !important;">비고</th>
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
	<!-- 통합자료실 모달 종료-->
	<!------------모달full 사진 screen------------>
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close">       </span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!------------/사진 모달------------>
	<!-- 금형 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel3" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel3">금형코드조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	 
			      	<div class="table-responsive">  
		                <table id="equipPopUpTable3" class="table table-bordered">
		                	<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
		                    <thead class="thead-light">
		                    <tr>
			                    <th>금형코드</th>
			                    <th>금형명</th>	                            
			                    <th>자산코드</th>
			                    <th>제조사</th>
		                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
		 			</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
	</div>
	<!-- 금형 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">금형관리</a></li>
				<li class="breadcrumb-item active">금형수리교체점검이력</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipRepairHistAdmTable" class="table table-bordered">
							<colgroup>
								<col width="18%">
								<col width="23%">
								<col width="10%">
								<col width="14%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>금형코드</th>
									<th>금형명</th>
									<th>발생일자</th>
									<th>수리종료</th>
									<th>작업처</th>
									<th>수리 및 개선내용</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 43%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
							<i class="mdi mdi-close"></i>
						</a>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item">
								<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2">관련자료</a>
							</li>
						</ul>
					</div>

					<div class="card-body p-0">
						<div id="myTabContent" class="tab-content">
							<!---------tab1 part--------->
							<div class="tab-pane fade active show" id="tab1">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
									<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
								</div>
								<form id="formOne" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table table-bordered">
											<colgroup>
												<col width="20%">
												<col width="30%">
												<col width="20%">
												<col width="30%">
											</colgroup>
											<tr>
												<th>수리코드</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="repairNo" name="repairNo" disabled>
												</td>
												<th>수리자</th>
												<td><input type="text" class="form-control" id="repairMan" name="repairMan" disabled></td>
											</tr>
											<tr>
												<th>*금형코드</th>
												<td class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" id="equipCd" name="equipCd">
														<input type="text" class="form-control" style="max-width: 100%" id="equipNo" name="equipNo" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnSelEquipCd" name="btnSelEquipCd"
															onClick="selectEquipCd();">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="equipCdDelete" class="btn closeBtn" 
															onclick="$('#equipCd').val(''); $('#equipNo').val(''); $('#equipNm').val(''); $('#assetCd').val(''); $('#mfcCorpCd').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</td>
												<th>금형명</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="equipNm" name="equipNm" disabled>
												</td>
											</tr>
											<tr>
												<th>제조사</th>
												<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" disabled></td>
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th class="d-none">관리번호</th>
												<td class="d-none"><input type="text" class="form-control" id="admNo" name="admNo"></td>
												<th>고장부위</th>
												<td><input type="text" class="form-control" id="troublePart" name="troublePart" disabled></td>
												<th>발생일자</th>
												<td>
													<div class="form-group input-sub m-0 row">
														<input class="form-control" type="text" id="troubleDate" name="troubleDate" disabled/>
														<button
															onclick="fnPopUpCalendar(troubleDate,troubleDate,'yyyy-mm-dd')"
															class="btn btn-secondary input-sub-search"
															id="chooseTroubleDate" type="button">
															<span class="oi oi-calendar"></span>
														</button>
													</div>
												</td>
											</tr>
											<tr>
												<th>문제 내용</th>
												<td colspan="3"><input type="text" class="form-control"
													style="max-width: 100%" id="troubleCont" name="troubleCont"></td>
											</tr>
											<tr>
												<th>수리 및 개선내용</th>
												<td colspan="3"><input type="text" class="form-control"
													style="max-width: 100%" id="troubleCause"
													name="troubleCause"></td>
											</tr>
											<tr>
												<th>수리시작일자</th>
												<td>
													<input class="form-control" type="date" id="repairStartDate" name="repairStartDate" disabled/>
												</td>
												<th>수리시작시간</th>
												<td>
													<input class="form-control" type="time" id="repairStartTime" name="repairStartTime" disabled/>
												</td>
											</tr>
											<tr>
												<th>수리종료일자</th>
												<td>
													<input class="form-control" type="date" id="repairEndDate" name="repairEndDate" disabled/>
												</td>
												<th>수리종료시간</th>
												<td>
													<input class="form-control" type="time" id="repairEndTime" name="repairEndTime" disabled/>
												</td>
											</tr>
											<tr>
												<th>작업처</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="repairCorpNm" name="repairCorpNm"></td>
												<th>현재상태</th>
												<td><select class="custom-select" id="repairStatus" name="repairStatus"></select></td>
											</tr>
											<tr>
												<th>작업결과</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="workResult" name="workResult">
												</td>
												<th>품질초품확인</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="qualityCheck" name="qualityCheck">
												</td>
											</tr>
										</form>
											<tr>
												<th>작업결과(첨부파일)</th>
												<td>
													<a href="/bm/attachDataDownload" id="workHref"></a>
													<form id="formWorkFile" method="post" enctype="multipart/form-data">
														<div class="custom-file d-none" id="workDiv">
															<input type="file" class="custom-file-input" id="fileWorkNm" name="fileNm">
															<label class="custom-file-label" id="fileWorkLabel" for="fileWorkNm"></label>
														</div>
													</form>
												</td>
												<th>품질초품확인(첨부파일)</th>
												<td>
													<a href="/bm/attachDataDownload" id="checkHref"></a>
													<form id="formCheckFile" method="post" enctype="multipart/form-data">
														<div class="custom-file d-none" id="checkDiv">
															<input type="file" class="custom-file-input" id="fileCheckNm" name="fileNm">
															<label class="custom-file-label" id="fileCheckLabel" for="fileCheckNm"></label>
														</div>
													</form>
												</td>
											</tr>
										<form id="form" enctype="multipart/form-data">
											<tr>
												<th>비고</th>
												<td colspan="3">
													<input type="text" class="form-control" style="max-width: 100%" id="repairDesc" name="repairDesc">
												</td>
											</tr>
											<tr>
												<th>수리비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="repairCost" value="0" dir="rtl" 
													name="repairCost" onChange="totalCostCal()"></td>
												<th>부품비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="partCost" value="0" dir="rtl" 
													name="partCost" onChange="totalCostCal()"></td>
											</tr>
											<tr>
												<th>합계비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="totalCost" name="totalCost" 
													value="0" dir="rtl" disabled></td>
												<th></th>
												<td></td>
											</tr>
											<tr>
												<th colspan="2">수리이전</th>
												<th colspan="2">수리이후</th>
											</tr>
											<tr>
												<td colspan="2">
													<div class="custom-file" style="height: 150px;">
														<img alt="등록된 사진이 없습니다." id="beforeImage" name="beforeImage" style="width: 100%; height: 100%" src="">
													</div>
												</td>
												<td colspan="2">
													<div class="custom-file" style="height: 150px;">
														<img alt="등록된 사진이 없습니다." id="afterImage" name="afterImage" style="width: 100%; height: 100%" src="">
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div class="form-group">
														<div class="custom-file" style="width: 90%;">
															<input type="file" class="custom-file-input"
																id="beforeImageFile" onchange="imageThum('before');" name="beforeImageFile" disabled> 
															<label id="beforeImageFileNm" class="custom-file-label" for="beforeImageFile"></label>
														</div>
														<div class="rightsidebar-close" style="width: 10%;">
															<button type="button" class="btn mt-1" name="btnImgDel" onclick="deleteImage('before');" disabled>
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div>

												</td>
												<td colspan="2">
													<div class="form-group">
														<div class="custom-file" style="width: 90%;">
															<input type="file" class="custom-file-input" 
																id="afterImageFile" onchange="imageThum('after');" name="afterImageFile" disabled> 
															<label id="afterImageFileNm" class="custom-file-label" for="afterImageFile"></label>
														</div>
														<div class="rightsidebar-close" style="width: 10%;">
															<button type="button" class="btn mt-1" name="btnImgDel" onclick="deleteImage('after');" disabled>
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</form>
							</div>
							<!--====start====tab2 part=====-->
							<div class="tab-pane fade" id="tab2">
								<div class="card-body col-sm-12 p-1 mb-1">
									<button type="button" class="btn btn-primary float-left mr-1" id="btnAttachAdd">추가</button>
									<button type="button" class="btn btn-warning float-left mr-1" id="btnAttachDel">삭제</button>
									<button type="button" class="btn btn-primary d-none float-right" id="btnAttachSave">저장</button>
								</div>
								<form id="form2" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table table-bordered" id="equipRepairAttachTable">
											<colgroup>
												<col width="5%">
												<col width="13%">
												<col width="12%">
												<col width="20%">
												<col width="15%">
												<col width="40%">
											</colgroup>
											<thead>
												<tr>
													<th>No.</th>
													<th>일자</th>
													<th>등록자</th>
													<th>내용</th>
													<th>구분</th>
													<th>첨부파일</th>
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
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "55%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "mlsc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "금형수리교체점검이력");
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	var attachSeq;
	var equipNo;
    var change = 0;
    var afterChange = 0;
    var beforeChange = 0;
    var imgDelete = 0;
    var deleteChange = 0;
	var preInWhsDateToCal =  "${serverDateFrom}";
// 	var preInWhsDateToCal2 = "${serverDateTo2}";
	var repairGubun = 'EQ';
	var userNm = "${userNm}";
	var tempNum = '';

	var str = "${serverDateTo}".substring(0,7).replace(/-/g,"");

	uiProc(true);
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	//공통코드 처리 시작      
	var repairStatusCode = new Array(); 
	<c:forEach items="${repairStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	repairStatusCode.push(json);
	</c:forEach>
	
	var resultQualityCode = new Array(); 
	<c:forEach items="${resultQuality}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	resultQualityCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(repairStatusCode, "repairStatus", "", "2");

	//일시 처리
	$('#troubleDate').val(preInWhsDateToCal);
// 	$('#repairStartDate').val(preInWhsDateToCal);
// 	$('#repairEndDate').val(preInWhsDateToCal);

	$('#saveBtnModalY').on('click', function() {
// 		$('#formOne').each(function() {
// 	         this.reset();
// 	         $('input[type=hidden]').val('');
// 	    });
// 		$('#form').each(function() {
// 	         this.reset();
// 	         $('input[type=hidden]').val('');
// 	    });
		
		$('#fileWorkNm').val("");
		$('#fileWorkLabel').val("");
		$('#fileWorkLabel').text("");
		$('#fileWorkLabel').attr("src", "");
		$('#fileCheckNm').val("");
		$('#fileCheckLabel').val("");
		$('#fileCheckLabel').text("");
		$('#fileCheckLabel').attr("src", "");
		
// 		sideView = 'add';
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#workHref').removeClass('d-none');
		$('#checkHref').removeClass('d-none');
		$('#workDiv').addClass('d-none');
		$('#checkDiv').addClass('d-none');
	});
	
	// 목록
	let equipRepairHistAdmTable = $('#equipRepairHistAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/em/equipRepairHistAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return '002'},
			},
		},
		columns : [
			{
				data : 'equipNo',
				'className' : 'text-center'
			},
			{
				data : 'equipNm',
				'className' : 'text-center'
			},
			{
				data : 'troubleDate',
				render : function(data, type, row){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				}
			},
			{
				data : 'repairEndDate',
				render : function(data, type, row){
					if(data != null && data != ''){
						return moment(data.substr(0,8)).format('YYYY-MM-DD') + " " + data.substr(8,2) + ":" + data.substr(10,2);
					}else{
						return '';
					}
				}
			},
			{
				data : 'repairCorpNm',
				render : function(data, type, row){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'troubleCause',
				render : function(data, type, row){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
				'className' : 'text-center'
			},
		],
		pageLength : 20,
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목'
		}, 'print' ],
	});

	
	// 보기
	$('#equipRepairHistAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		} 

		$('#tab1Nav').tab('show');
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#equipRepairHistAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		repairNo = equipRepairHistAdmTable.row(this).data().repairNo;
		
		$('#attach').removeClass('disabled');
		$('#formBox').removeClass('d-none');
		$('#btnImage').addClass('d-none');
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnAdd').removeClass('d-none'); // 추가버튼
		$('#btnEdit').removeClass('d-none'); // 삭제버튼
		
		$('#workHref').removeClass('d-none');
		$('#checkHref').removeClass('d-none');
		$('#workDiv').addClass('d-none');
		$('#checkDiv').addClass('d-none');
		
		uiProc(true);
		$("#tab2Nav").removeClass('disabled');
		
		$('#equipRepairAttachTable').DataTable().ajax.reload();
		
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmRead"/>',
			type : 'GET',
			data : {
				'repairNo' : repairNo 
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				console.log(data.equipNm)
				if(res.result == "ok"){
					$('#repairNo').val(data.repairNo);
					$('#repairMan').val(data.repairMan);
					$('#equipCd').val(data.equipCd);
					$('#equipNo').val(data.equipNo);
					$('#equipNm').val(data.equipNm);
					$('#assetCd').val(data.assetCd);
					$('#mfcCorpCd').val(data.mfcCorpCd);
					$('#admNo').val(data.admNo);
					$('#troubleDate').val(moment(data.troubleDate).format('YYYY-MM-DD'));
					$('#troublePart').val(data.troublePart);
					$('#troubleCont').val(data.troubleCont);
					$('#troubleCause').val(data.troubleCause);
					$('#workResult').val(data.workResult);
					$('#qualityCheck').val(data.qualityCheck);
					$('#repairDesc').val(data.repairDesc);
					$('#repairStartDate').val(moment(data.repairStartDate.substr(0,8)).format('YYYY-MM-DD'));
					$('#repairEndDate').val(moment(data.repairEndDate.substr(0,8)).format('YYYY-MM-DD'));
					$('#repairStartTime').val(data.repairStartDate.substr(8,2) + ":" + data.repairStartDate.substr(10,2));
					$('#repairEndTime').val(data.repairEndDate.substr(8,2) + ":" + data.repairEndDate.substr(10,2));
					$('#repairCorpNm').val(data.repairCorpNm);
					$('#repairCost').val(data.repairCost != null ? addCommas(data.repairCost) : '0');
					$('#partCost').val(data.partCost != null ? addCommas(data.partCost) : '0');
					$('#totalCost').val(data.totalCost != null ? addCommas(data.totalCost) : '0');
					
					//다운로드 주소 조회
					if(data.attachFnOne != null){
						$('#workHref').attr('href','/bm/attachDataDownload?attachFn='+data.attachFnOne+'&attachSeq='+data.attachSeqOne+'&attachCd='+repairNo+'&attachGubun=ER');
						$('#workHref').text(data.attachFnOne);
					} else {
						$('#workHref').attr('href','');
						$('#workHref').text('');
					}
					if(data.attachFnTwo != null){
						$('#checkHref').attr('href','/bm/attachDataDownload?attachFn='+data.attachFnTwo+'&attachSeq='+data.attachSeqTwo+'&attachCd='+repairNo+'&attachGubun=ER');
						$('#checkHref').text(data.attachFnTwo);						
					} else {
						$('#checkHref').attr('href','');
						$('#checkHref').text('');
					}
					
					//셀렉트박스 불러오기
					selectBoxAppend(repairStatusCode, "repairStatus", data.repairStatus, "2");
					
					//이미지 불러오기
					$('#beforeImage').attr("src","");
					$('#afterImage').attr("src","");
					imgShow();
				}
			}
		});
		
	});
	
	var  html = '<div class="row">';
	html += '<button type="button" class="btn btn-primary" id="fileReferenceBtn" onclick="fileReferenceClick();">금형 일상관리 절차서</button>';
	html += '</div>';

	$('#equipRepairHistAdmTable_length').html(html);

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#formOne').each(function() {
	         this.reset();
	         $('input[type=hidden]').val('');
	    });
		$('#form').each(function() {
			this.reset();
			$("input[type=hidden]").val('');
		});
		
		$('#fileWorkNm').val("");
		$('#fileWorkLabel').val("");
		$('#fileWorkLabel').text("");
		$('#fileWorkLabel').attr("src", "");
		$('#fileCheckNm').val("");
		$('#fileCheckLabel').val("");
		$('#fileCheckLabel').text("");
		$('#fileCheckLabel').attr("src", "");
		
		$('#equipRepairHistAdmTable').DataTable().$('tr.selected').removeClass('selected');
		$('#btnImage').removeClass('d-none');
		
		$('#workHref').addClass('d-none');
		$('#checkHref').addClass('d-none');
		$('#workDiv').removeClass('d-none');
		$('#checkDiv').removeClass('d-none');

		//시퀀스값 가져오기
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmSeq"/>',
			type : 'POST',
			data : {},
			success : function(res){
				if(res.result == "ok"){
					$('#repairNo').val(res.data);					
				}
			}
		});

		//선택박스 처리
		selectBoxAppend(repairStatusCode, "repairStatus", "", "2");
		
		//일시 처리
		$('#troubleDate').val(preInWhsDateToCal);
// 		$('#repairStartDate').val(preInWhsDateToCal);
// 		$('#repairEndDate').val(preInWhsDateToCal);
		$('#beforeImageFile').attr('disabled',false);
		$('#afterImageFile').attr('disabled',false);
		$('#afterImage').attr("src", "");
		$('#beforeImage').attr("src", "");
		$('#beforeImageFileNm').text("");
		$('#afterImageFileNm').text("");
		$('#beforeImageFile').val("");
		$('#afterImageFile').val("");
		$('button[name=btnImgDel]').attr('disabled',false);
		
		//화면처리        
		uiProc(false);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
	});


	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요.");
			return false;
		}
		uiProc(false);
		
		$('#fileWorkNm').val("");
		$('#fileWorkLabel').val("");
		$('#fileWorkLabel').text("");
		$('#fileWorkLabel').attr("src", "");
		$('#fileCheckNm').val("");
		$('#fileCheckLabel').val("");
		$('#fileCheckLabel').text("");
		$('#fileCheckLabel').attr("src", "");
		
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#beforeImageFile').attr('disabled',false);
		$('#afterImageFile').attr('disabled',false);
		$('#repairNo').attr('disabled', true);
		$('#btnImage').removeClass('d-none');
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('button[name=btnImgDel]').attr('disabled',false);
		totalCostCal();
		
		$('#workHref').addClass('d-none');
		$('#checkHref').addClass('d-none');
		$('#workDiv').removeClass('d-none');
		$('#checkDiv').removeClass('d-none');
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#formOne').each(function() {
	         this.reset();
	         $('input[type=hidden]').val('');
	    });
		$('#form').each(function(){
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		$('#fileWorkNm').val("");
		$('#fileWorkLabel').val("");
		$('#fileWorkLabel').text("");
		$('#fileWorkLabel').attr("src", "");
		$('#fileCheckNm').val("");
		$('#fileCheckLabel').val("");
		$('#fileCheckLabel').text("");
		$('#fileCheckLabel').attr("src", "");
		
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmDelete"/>',
			type : 'POST',
			data :{
				'repairNo' : function(){return repairNo;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#equipRepairHistAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});

	
	// 저장 처리
	$('#btnSave').on('click', function() {
		
		//입력값 검사
		if (!$.trim($('#equipCd').val())) {
			toastr.warning('금형코드를 입력해 주세요.');
			$('#btnSelEquipCd').focus();
			return false;
		}
		
		if ($('#repairCost').val().replace(/,/g, '').length > 10) {
			toastr.warning('수리비용이 너무 큽니다. (백억 이상)');
			$('#repairCost').val(0);
			totalCostCal();
			$('#repairCost').focus();
			return false;
		}
		
		if ($('#partCost').val().replace(/,/g, '').length > 10) {
			toastr.warning('부품비용이 너무 큽니다. (백억 이상)');
			$('#partCost').val(0);
			totalCostCal();
			$('#partCost').focus();
			return false;
		}
		
		if ($.trim($('#repairEndDate').val()) && !$.trim($('#repairEndTime').val())) {
			toastr.warning('수리종료시간을 입력해 주세요.');
			$('#repairEndTime').focus();
			return false;
		}
		
		if (!$.trim($('#repairEndDate').val()) && $.trim($('#repairEndTime').val())) {
			toastr.warning('수리종료일자를 입력해 주세요.');
			$('#repairEndDate').focus();
			return false;
		}
		
		var url = '<c:url value="/em/equipRepairHistAdmCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/em/equipRepairHistAdmUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'repairNo'            	: 	$('#repairNo').val(),
				'repairMan'           	: 	$('#repairMan').val(),
				'equipCd'            	: 	$('#equipCd').val(),
				'admNo'            		: 	$('#admNo').val(),
				'troubleDate'           : 	$('#troubleDate').val().replace(/-/g,''),
				'troublePart'           : 	$('#troublePart').val(),
				'troubleCont'           : 	$('#troubleCont').val(),
				'troubleCause'          : 	$('#troubleCause').val(),
				'repairStartDate'       : 	$('#repairStartDate').val().replace(/-/g,'') + $('#repairStartTime').val().replace(/:/g, ''),
				'repairEndDate'         : 	$('#repairEndDate').val().replace(/-/g,'') + $('#repairEndTime').val().replace(/:/g, ''),
				'repairCorpNm'          : 	$('#repairCorpNm').val(),
				'repairStatus'          : 	$('#repairStatus').val(),
				'workResult'          	: 	$('#workResult').val(),
				'qualityCheck'          : 	$('#qualityCheck').val(),
				'repairDesc'          	: 	$('#repairDesc').val(),
				'repairCost'            : 	$('#repairCost').val().replace(/,/g, ''),
				'partCost'            	: 	$('#partCost').val().replace(/,/g, ''),
				'totalCost'            	: 	$('#totalCost').val().replace(/,/g, ''),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					//이미지 업로드
					imgUpload();
					
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
				} else {
					toastr.error(res.message);
				}
				$('#equipRepairHistAdmTable').DataTable().ajax.reload(function() {});
			},
			complete : function() {
				$('#equipRepairHistAdmTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('button[name=btnImgDel]').attr('disabled',true);

				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnDel').attr('disabled', false);
			}
		});
		
		//작업결과(첨부파일)
		if($("#fileWorkNm").val() == undefined || $("#fileWorkNm").val() == ""){
			
		} else {
			//시작
			var formData = new FormData(document.getElementById("formWorkFile"));
			
			$.ajax({
				url : '<c:url value="/bm/attachDataSeq"/>',
				type : 'GET',
				async : false,
				data : {
					'attachGubun' : 'ER',
					'attachCd' : function(){return repairNo;}
				},
				success : function(res) {
					attachSeq = res.seq;
				}
			});

			formData.append('path', fileDate);
			formData.append('attachCd', repairNo);
			formData.append('attachSeq', attachSeq);
			formData.append('contents', $("#workResult").val());
			formData.append('etc1', '001');
			formData.append('attachGubun', 'ER');
			formData.append('idCheck', 'ER');
			
			
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
					} else if (res.result == 'error') {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
			});
		}
		
		//품질초품확인(첨부파일)
		if($("#fileCheckNm").val() == undefined || $("#fileCheckNm").val() == ""){
			
		} else {
			//시작
			var formData2 = new FormData(document.getElementById("formCheckFile"));
			
			$.ajax({
				url : '<c:url value="/bm/attachDataSeq"/>',
				type : 'GET',
				async : false,
				data : {
					'attachGubun' : 'ER',
					'attachCd' : function(){return repairNo;}
				},
				success : function(res) {
					attachSeq = res.seq;
				}
			});

			formData2.append('path', fileDate);
			formData2.append('attachCd', repairNo);
			formData2.append('attachSeq', attachSeq);
			formData2.append('contents', $("#qualityCheck").val());
			formData2.append('etc1', '002');
			formData2.append('attachGubun', 'ER');
			formData2.append('idCheck', 'ER');
			
			$.ajax({
				url : '<c:url value="/bm/attachDataCreate"/>',
				type : 'POST',
				data : formData2,
			    processData: false,
		        contentType: false,
		        async : false,
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
					} else if (res.result == 'error') {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
			});
		}

		uiProc(true);
		$('#tab2Nav').addClass('disabled');
		
		//저장 시 오른쪽 테이블 초기화
// 		$('#fileWorkNm').val("");
// 		$('#fileWorkLabel').val("");
// 		$('#fileWorkLabel').text("");
// 		$('#fileWorkLabel').attr("src", "");
// 		$('#fileCheckNm').val("");
// 		$('#fileCheckLabel').val("");
// 		$('#fileCheckLabel').text("");
// 		$('#fileCheckLabel').attr("src", "");
		
// 		$('#formOne').each(function() {
// 	         this.reset();
// 	         $('input[type=hidden]').val('');
// 	    });
// 		$('#form').each(function() {
// 	         this.reset();
// 	         $('input[type=hidden]').val('');
// 	    });
// 		sideView = 'add';
		
// 		$('#beforeImage').attr("src", " ");
// 		$('#beforeImageFileNm').text("");
		
// 		$('#afterImage').attr("src", " ");
// 		$('#afterImageFileNm').text("");
		
		
	});
	
	//이미지 조회
	function imgShow() {
		$.ajax({
			url : '<c:url value="/em/equipRepairHistAdmImgRead"/>',
			data : {
				'repairNo'	:	function() {return repairNo;}
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				
				if (data.beforeImageFile != null) {
					$('#beforeImage').attr("src", "data:image/jpg;base64," + data.beforeImageFile);
					$('#beforeImageFileNm').text(data.beforeImageFileNm);
				} else {
					$('#beforeImage').attr("src", " ");
					$('#beforeImageFileNm').text("");
				}
				
				if (data.afterImageFile != null) {
					$('#afterImage').attr("src", "data:image/jpg;base64," + data.afterImageFile);
					$('#afterImageFileNm').text(data.afterImageFileNm);
				} else {
					$('#afterImage').attr("src", " ");
					$('#afterImageFileNm').text("");
				}
			},
			error : function(xhr, textStatus, error) {
			}
		});
	}
	
	//이미지 썸네일 보여주기
	function imageThum(value) {
		if(value == "before") {
			var reader = new FileReader(); 
			reader.onload = function(event) {
				$('#beforeImage').attr("src", event.target.result);
				console.log("set before on");
			}; 
			reader.readAsDataURL(event.target.files[0]);
			beforeChange = 1;
		}
		else if(value == "after") {
			var reader = new FileReader(); 
			reader.onload = function(event) {
				$('#afterImage').attr("src", event.target.result);
				console.log("set after on");
			}; 
			reader.readAsDataURL(event.target.files[0]);
			afterChange = 2;
		}
	}
	
	//이미지 저장
	function imgUpload() {
		if(afterChange != 0 || beforeChange != 0) {
			var formData = new FormData(document.getElementById("form"));
			formData.append("repairNo", $('#repairNo').val());
			formData.append("status", sideView);
			formData.append("change", afterChange + beforeChange);
			for (var pair of formData.entries()) {
				console.log(pair[0]+ ', ' + pair[1]); 
			}
			$.ajax({
				url : '<c:url value="/em/equipRepairHistAdmImgUpload"/>',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(res) {
					beforeChange = 0;
					afterChange = 0;
					if (res.result == "ok") { //응답결과
					} else {
					}
				},
				error : function(xhr, textStatus, error) {
					console.log("textStatus: " + xhr.status + ", error: " + error);
				}
			});
		}
	}
	
	//이미지 삭제 (View)
	function deleteImage(value) {
		if(value =="before") {
			$('#beforeImageFile').val(null);
			$('#beforeImage').attr("src", null);
			$('#beforeImageFileNm').text(null);
			beforeChange = 1;
		}
		else {
			$('#afterImageFile').val(null);
			$('#afterImage').attr("src", null);
			$('#afterImageFileNm').text(null)
			afterChange = 2;
		}
	}
	
	//금형명 팝업 시작
   	var equipPopUpTable3;
   	function selectEquipCd() {
		if(equipPopUpTable3 == null || equipPopUpTable3 == undefined)	{
			equipPopUpTable3 = $('#equipPopUpTable3').DataTable({
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
					url : '<c:url value="bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){return '002'},
					},
				},
				rowId : 'equipCd',
				columns : [
				{
					data : 'equipNo',
					'className' : 'text-center'
				}, 
				{
					data : 'equipNm',
					'className' : 'text-center'
				}, 
				{
					data : 'assetCd',
					'className' : 'text-center'
				}, 
				{
					data : 'mfcCorpCd',
					'className' : 'text-center'
				}
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

		    $('#equipPopUpTable3 tbody').on('click', 'tr', function () {
		    	var data = equipPopUpTable3.row( this ).data();
		    	$('#equipCd').val(data.equipCd);
		    	$('#equipNo').val(data.equipNo);
				$('#equipNm').val(data.equipNm);
				$('#assetCd').val(data.assetCd);
				$('#mfcCorpCd').val(data.mfcCorpCd);

                $('#equipPopUpModal3').modal('hide');

				});
		}else{
			$('#equipPopUpTable3').DataTable().ajax.reload(function() {});
		}
		$('#equipPopUpModal3').modal('show');
   	} 

 	
	function uiProc(flag) {
		$("#repairMan").attr("disabled", flag);
		$("#troubleCd").attr("disabled", flag);
		$("#troublePart").attr("disabled", flag);
		$("#troubleCont").attr("disabled", flag);
		$("#troubleCause").attr("disabled", flag);
		$("#repairCorpNm").attr("disabled", flag);
		$("#repairStatus").attr("disabled", flag);
		$("#imgAdd1").attr("disabled", flag);
		$("#imgAdd2").attr("disabled", flag);
		$("#equipCdDelete").attr("disabled", flag);
		$("#repairStartDate").attr("disabled", flag);
		$("#repairEndDate").attr("disabled", flag);
		$("#repairStartTime").attr("disabled", flag);
		$("#repairEndTime").attr("disabled", flag);
		$("#fileWorkNm").attr("disabled", flag);
		$("#fileCheckNm").attr("disabled", flag);
		
		$("#btnSelEquipNm").attr("disabled", flag);
		$("#chooseTroubleDate").attr("disabled", flag);
		$("#chooseRepairStartDate").attr("disabled", flag);
		$("#chooseRepairEndDate").attr("disabled", flag);

		$('#beforeImageFile').attr('disabled',flag);
		$('#afterImageFile').attr('disabled',flag);
		$('#admNo').attr('disabled',flag);
		$('#repairCost').attr('disabled',flag);
		$('#partCost').attr('disabled',flag);
		$('#btnSelEquipCd').attr('disabled',flag);
		$('#workResult').attr('disabled',flag);
		$('#qualityCheck').attr('disabled',flag);
		$('#repairDesc').attr('disabled',flag);
		$('input[name=beforeImageFile]').attr('disabled',flag);
		$('button[name=btnImgDel]').attr('disabled',flag);
	}

	//기본정보 탭
	$('#tab1Nav').on('click',function(){
		uiProc(true);
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#btnSave').addClass('d-none');
	});
	
	//숫자 콤마생성
	$(document).on('keyup', "#repairCost, #partCost, #totalCost",  function(evt) { //입력시 콤마 추가
		var costSum = 0;
		if ($(this).val() == "") {
			$(this).val("0");
			$(this).select();
		}
		//입력 정규식 0~9 .
		reg = /[^0-9.]/gi;
		let poQty = $(this).val().replace(/,/g, '');
		if (reg.test(poQty)) {
			poQty = poQty.replace(reg, '');
			$(this).val(addCommas(poQty));
			return false;
		}
		$(this).val(addCommas(poQty));

	});
	
	function totalCostCal() {
		var totalCostVal = 0;
		totalCostVal = Number($('#repairCost').val().replace(/,/g, '')) + Number($('#partCost').val().replace(/,/g, ''));
		$('#totalCost').val(addCommas(totalCostVal));
	}
	
	//관련자료 탭 클릭시
	$('#tab2Nav').on('click', function() {
		btnView = '';
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		
		$('#equipRepairAttachTable').DataTable().ajax.reload();
	});
	
	//관련자료 목록
	let equipRepairAttachTable = $('#equipRepairAttachTable').DataTable({
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
			data : {
				'attachCd' : function(){return repairNo;},
				'attachGubun' : function(){return 'ER';},
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
					data : 'regDate',
					render : function(data, type, row, meta) {
						if (data != null) {
							data = moment(data).format('YYYY-MM-DD')
							return '<input type="text" class="form-control" style="text-align:center" name="regDate" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="regDate" value="'+preInWhsDateToCal+'" disabled/>';
						}
					}
				},
				{
					data : 'regNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center" name="regNm" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="regNm" value="'+userNm+'" disabled/>';
						}
					}
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="" />';
						}
					}
				},
				{
					data : 'etc1',
					render : function(data, type, row, meta) {
						var html = "";
						html = selectBoxAppend2(resultQualityCode, "resultQuality", data, row, meta);
						return html;
					}
				},
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+repairNo+'&attachGubun=ER">'+data+'</a>';
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
	$('#equipRepairAttachTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
		} else {
			$('#equipRepairAttachTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#equipRepairAttachTable').DataTable().row(this).index();
		attachSeq = equipRepairAttachTable.row(tableIdx).data().attachSeq;
		btnView = "edit";
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
		btnView = 'add';
		
		$('#equipRepairAttachTable').DataTable().row.add({}).draw(false);
		
		if (equipRepairAttachTable.data().count() > 0) {
			$('#btnAttachSave').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnAttachAdd').attr('disabled', true);
		$('#btnAttachDel').attr('disabled', true);
		
	});
	
	//관련자료 삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(attachSeq != undefined && attachSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'ER';},
					'attachCd' : function(){return repairNo;},
					'attachSeq' : function(){return attachSeq;},
				},
				success  : function(res){
					$('#equipRepairAttachTable').DataTable().ajax.reload();
					
					toastr.success("삭제되었습니다.");
					
				}
			});
		} else {
			$('#equipRepairAttachTable').DataTable().rows(tableIdx).remove().draw();
			toastr.success("삭제되었습니다.");
		}
		
		btnView = '';

	});
	
	// 관련자료 저장
	$('#btnAttachSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipRepairAttachTable tbody tr').each(function(index, item) {
			index++;
			
			if ($(this).find("td input[name=fileNm]").val() == "") {
				toastr.warning('파일을 선택해 주세요.');
				$(this).find("td input[name=fileNm]").focus();
				check = false;
				return false;
			}
			
			if($(this).find("td input[name=fileNm]").val() == undefined){
				
			} else {
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'ER',
						'attachCd' : function(){return repairNo;}
					},
					success : function(res) {
						attachSeq = res.seq;
					}
				});

				formData.append('path', fileDate);
				formData.append('attachCd', repairNo);
				formData.append('attachSeq', attachSeq);
				formData.append('contents', $(this).find("td input[name=contents]").val());
				formData.append('etc1', $(this).find("td select[name=resultQuality]").val());
				formData.append('attachGubun', 'ER');
				formData.append('idCheck', 'ER');
				
				
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
							toastr.success('등록되었습니다.');
						} else if (res.result == 'error') {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#equipRepairAttachTable').DataTable().ajax.reload();
						$('#btnAttachSave').addClass('d-none');
						$('#btnAttachAdd').attr('disabled', false);
						$('#btnAttachDel').attr('disabled', false);
						btnView = "";
					}
				});
			}
			
		});
		
	});
	
	//셀렉트박스생성
	function selectBoxAppend2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnView == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnView == "add" || btnView == "edit") {
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
	
	//통합자료실 모달
	var fileReferencePopUpTable;
	function fileReferenceClick() {
		if (fileReferencePopUpTable == null || fileReferencePopUpTable == 'undefined') {
			fileReferencePopUpTable = $('#fileReferencePopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				paging : true,
				searching: true,
				pageLength : 100000000, 
				scrollY: "50vh",
				ajax : {
					url : '<c:url value="fr/fileReferenceList"/>',
					type : 'POST',
					data : {
						'gubun'	:	function(){return '001';},
						'fileGubun'	:	function(){return '003';},
					},
				},
				select: false,
				rowId: 'idx',
				columns : [
					{
						className : 'text-center',
						render : function(data, type, row, meta) {
							return meta.row+1;
						}
					},
					{
						data : 'fileManagerNm', 
						render : function(data, type, row, meta) {
							if(data != null){
								return data;
							} else {
								return '';
							}
						},
						className : 'text-center p-0'
					},
					{
						data : 'fileManagerDepartmentNm', 
						className : 'text-center' 
					},
					{
						data : 'fileInputDate', className : 'text-center p-0',
						render : function(data, type, row, meta) {
							if(data != null && data != ''){
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
							
						}
					},
					{ 
						data : 'fileName', 
						render : function(data, type, row, meta) {
							var length = data.split('.').length;
							let idx = row['idx'];
							if($.inArray(data.split('.')[length-1], ["tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"]) == -1){
								return '<a href="fr/fileReferenceRead?idx='+idx+'">'+data+'</a>';
							} else {
								return '<button type="button" class="btn btn-info" id="" onclick="imageModalClick('+idx+');">'+data+'</button>';
							}
							
						},
						className : 'text-center'
					},
					{ 
						data : 'fileName', className : 'text-center',
						render : function(data, type, row, meta) {
							var length = data.split('.').length;
							return data.split('.')[length-1];
						}
					},
					{ 
						data : 'fileDesc', className : 'text-center p-0',
						render : function(data, type, row, meta) {
							if(data != null){
								return data;
							} else {
								return '';
							}
							
						}
					},
				],
				columnDefs : [],
				buttons : [],
				order : [],
			});
		}
		$('#fileReferencePopUpModal').modal('show');
		setTimeout(function(){
			fileReferencePopUpTable.draw();
		},170);
	}
	
	function imageModalClick(idx) {
		$.ajax({
			url: '<c:url value="fr/fileReferenceJustRead"/>',
            type: 'GET',
            async: false,
            data : {
				'idx'	:	function(){return idx;},
			},
			success : function(res) {
				let data = res.data;
				$('#imageModal').modal('show');
				$('#fileReferenceImg').attr("src","data:image/jpg;base64," + data.fileBlob);
			}
		});
	}
			
</script>

</body>
</html>
