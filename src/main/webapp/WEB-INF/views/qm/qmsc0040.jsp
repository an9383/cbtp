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
				<li class="breadcrumb-item active">부적합관리(완제품검사)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<div style="height:365px">
						<table id="finishedItemTable" class="table table-bordered">
							<colgroup>
								<col width="8%">
								<col width="8%">
								<col width="10%">
								<col width="15%">
								<col width="25%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>승인여부</th>
									<th>구분</th>
									<th>완제품검사일</th>
									<th>작지번호</th>
									<th>제품명</th>
									<th>Series</th>
									<th>불량수량</th>
									<th>검사자</th>
								</tr>
							</thead>
						</table>
						</div>
						<div class="row pt-1">
						 <div class="col-6 mt-4">
					    	<table id="itemFaultyTypeTable" class="table table-bordered" style="margin:0!important">
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
									<th>불량 유형</th>
									<th>불량 수량</th>
									<th>부적합 등록일</th>
									<th>비고</th>
								</tr>
							</thead>
						  </table>
						 </div>
						 <div class="col-6">
							 <div class="card-body col-sm-12 p-1">
								 <button type="button" class="btn btn-primary float-left mr-1"
									id="btnApprove">승인</button>
								 <button class="btn btn-warning d-none" id="btnApproveConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								 </button>
							 	<button type="button" class="btn btn-primary float-right mr-1 d-none"
									id="btnDtlSave">저장</button>
								<button class="btn btn-primary d-none" id="btnDtlSaveConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
							   	</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnDtlEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnDtlEditConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnDtlAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnDtlAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
							   	</button>
							 </div>
							 <div>
							 <form id="form2">
							  <table class="table table-bordered mb-2" id="">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th colspan="4">부적합처리</th>
									</tr>
									<tr>
										<th>부적합처리</th>
										<td colspan="3">
											<div class="">
												<div class="custom-control custom-control-inline custom-radio row">
					                           	 	<input type="radio" class="custom-control-input" name="approvalYn" id="apr1" value="001" onclick="javascript:faultyPcsChange(1);"> 
					                           	 	<label class="custom-control-label" for="apr1">특채</label>
					                          	</div>	
					                         	 <div class="custom-control custom-control-inline custom-radio row">
					                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr2" value="002" onclick="javascript:faultyPcsChange(2);"> 
					                            	<label class="custom-control-label" for="apr2">선별</label>
					                          	</div>
				                          	</div>
										</td>
									</tr>
									<tr>
										<th>부적합 등록일</th>
										<td>
											<div class="form-group input-sub m-0" style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="text" id="faultyDate" name="faultyDate"
													maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(faultyDate,faultyDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="faultyDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
										<th>부적합 담당자</th>
										<td>
											<div class="input-sub m-0" style="max-width: 100%">
											<input type="hidden" class="form-control"
												style="max-width: 100%" id="faultyChargr" name="faultyChargr"
												disabled> <input type="text" class="form-control"
												style="max-width: 100%" id="faultyChargrNm" name="faultyChargrNm"
												disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" name="btnfaultyChargr"
												id="btnfaultyChargr" onClick="selectadmChargr(2);">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
										</td>
									</tr>
									<tr>
										<th>양품수량</th>
										<td><input type="text" class="form-control" id="pairCnt" name="pairCnt" style="text-align:right;" disabled></td>
										<th>불량수량</th>
										<td><input type="text" class="form-control" id="faultyCnt" name="faultyCnt" style="text-align:right;" disabled></td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3"><input type="text" class="form-control" id="faultyDesc" name="faultyDesc" style="max-width:100%" disabled></td>
									</tr>
								</thead>
						       </table>
						       <table class="table table-bordered d-none" id="itemFaultyJdgAdmTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="50%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th></th>
										<th>수량</th>
										<th>등록일</th>
									</tr>
									<tr>
										<th>수리</th>
										<td><input type="text" class="form-control" id="repairQty" name="repairQty" style="text-align:right;" onchange="javascript:pairCntChange();"></td>
										<td>
											<input type="date" class="form-control" id="repairDate" name="repairDate" style="max-width:100%">
											<!-- <div class="form-group input-sub m-0" style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="text" id="returnDate" name="returnDate"
													maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(returnDate,returnDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="returnDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div> -->
										</td>
									</tr>
									<tr>
										<th>폐기</th>
										<td><input type="text" class="form-control" id="disuseQty" name="disuseQty" style="text-align:right;" onchange="javascript:pairCntChange();"></td>
										<td>
											<input type="date" class="form-control" id="disuseDate" name="disuseDate" style="max-width:100%">
											<!-- <div class="form-group input-sub m-0" style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="text" id="returnDate" name="returnDate"
													maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(returnDate,returnDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="returnDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div> -->
										</td>
									</tr>
									<tr>
										<th>재작업</th>
										<td><input type="text" class="form-control" id="reworkQty" name="reworkQty" style="text-align:right;" onchange="javascript:pairCntChange();"></td>
										<td>
											<input type="date" class="form-control" id="reworkDate" name="reworkDate" style="max-width:100%">
											<!-- <div class="form-group input-sub m-0" style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="text" id="disuseDate" name="disuseDate"
													maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(disuseDate,disuseDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="disuseDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button> 
											</div>-->
										</td>
									</tr>
								</thead>
						       </table>
						       </form>
							 </div>
							</div>
						</div>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-0">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<div class="card-header card-tab p-0">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item"><a class="nav-link active show"
									id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="tab2Nav" data-toggle="tab" href="#tab2">관련자료</a></li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
						
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mt-2 mb-2">
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form" enctype="multipart/form-data" method="post">
								<div class="table-responsive">
									<table id="itemFaultyDtlTable"
										class="table table-lg table-bordered mb-2">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>부서명</th>
											<td><select class="custom-select" id="admDept"
												name="admDept"></select></td>
											<th>담당자</th>
											<!-- 	<td><select class="custom-select" id="admManager" name="admManager"></select></td> -->
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control"
														style="max-width: 100%" id="admChargr" name="admChargr"
														disabled> <input type="text" class="form-control"
														style="max-width: 100%" id="admChargrNm" name="admChargrNm"
														disabled>
													<button type="button"
														class="btn btn-primary input-sub-search" name="btnAdmChargr"
														id="btnAdmChargr" onClick="selectadmChargr(1);">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>작성일자</th>
											<td>
												<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%"
														type="text" id="writeDate" name="writeDate" maxlength="10"
														disabled />
													<button
														onclick="fnPopUpCalendar(writeDate,writeDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="writeDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>결함현상</th>
											<td colspan="3"><textarea class="form-control" rows="2"
													id="faultyStatus" name="faultyStatus"
													style="max-width: 100%; resize: none;"></textarea></td>
										</tr>
										<tr>
											<th>결함원인</th>
											<td colspan="3"><textarea class="form-control" rows="2"
													id="faultyCause" name="faultyCause"
													style="max-width: 100%; resize: none;"></textarea></td>
										</tr>
										<tr>
											<th colspan="2">사진1</th>
											<th colspan="2">사진2</th>
										</tr>
										<tr>
											<td colspan="2">
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>
											<td colspan="2">
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src=""
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-group" id="imgTag1">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd1"
															name="imgAdd1"> <label id="imgName1"
															class="custom-file-label" for="imgAdd1"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(1);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td colspan="2">
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd2"
															name="imgAdd2"> <label id="imgName2"
															class="custom-file-label" for="imgAdd2"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(2);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>첨부파일1</th>
											<td colspan="3">
												<div class="row">
													<div class="custom-file d-none" id="fileSearch" style="width: 90%;">
														<input type="file" class="custom-file-input" id="fileNm1" name="fileNm1" value=""> 
															<label class="custom-file-label" id="fpValue" for="fileNm1">파일을선택해주세요</label>
													</div>
													<div class="rightsidebar-close d-none" id="btnFpFileDel"
														style="width: 10%;">
														<button type="button" class="btn"
															onClick="deleteImg(3)">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div> <!--첨부파일1-->
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag">
													<a href="/bm/downloadFile" id="fpHref"><span id="fpFn"></span></a>
												</div>
											</td>
										</tr>
										<tr>
											<th>첨부파일2</th>
											<td colspan="3">
												<div class="row">
													<div class="custom-file d-none" id="fileSearch2" style="width: 90%;">
														<input type="file" class="custom-file-input" id="fileNm2" name="fileNm2" value=""> 
															<label class="custom-file-label" id="fpValue2" for="fileNm2">파일을선택해주세요</label>
													</div>
													<div class="rightsidebar-close d-none" id="btnFpFileDel2"
														style="width: 10%;">
														<button type="button" class="btn"
															onClick="deleteImg(4)">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div> <!--첨부파일1-->
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag2">
													<a href="/bm/downloadFile" id="fpHref2"><span id="fpFn2"></span></a>
												</div>
											</td>
										</tr>
										
										
										<tr>
											<th>출하검사성적서</th>
											<td colspan="3">
												 <!--첨부파일1-->
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag3">
													<a href="#" id="fpHref3"><span id="fpFn3"></span></a>
												</div>
											</td>
										</tr>
										
										
										<tr>
											<th>조치사항</th>
											<td><input class="form-control" type="text" id="faultyAct"
												name="faultyAct"></td>
											<th>개선사항</th>
											<td><input class="form-control" type="text"
												id="faultyImprv" name="faultyImprv"></td>
											<!-- <th>귀책부서</th>
											<td><select class="custom-select" id="faultyDept"
												name="faultyDept"></select></td> -->
										</tr>
										<tr>
											<th>유효성</th>
											<td><input class="form-control" type="text"
												id="faultyEffect" name="faultyEffect"></td>
											<th></th>
											<td></td>
										</tr>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button" class="btn btn-primary d-none float-right"
									id="btnSave" disabled>저장</button>
			
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
							</div>
						</div>
						<!--====end====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnAttachDel">삭제</button>
								<button class="btn btn-primary d-none"
									id="btnAttachDelConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAttachAdd">추가</button>
								<button class="btn btn-primary d-none"
									id="btnAttachAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered"
										id="faultyAttachDataTable">
										<colgroup>
											<col width="10%">
											<col width="10%">
											<col width="10%">
											<%-- <col width="33%"> --%>
											<col width="70%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>등록일</th>
												<th>등록자</th>
												<!-- <th>내용</th> -->
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none"
									id="btnAttachSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
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

<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "qmsc0040";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "부적합관리(완제품검사)");
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';

	uiProc(true);
	uiProc2(true);
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	var userNm = "${userNm}";
	var userNumber = "${userNumber}";

	var tableIdx = null;
	var workOrdNo = null;
	var itemCd = null;
	var itemRev = null;
	var faultyQty;

	var disuseQtyVal;
	var repairQtyVal;
	var reworkQtyVal;
	var value;
	var sourceNoVal=null;
	var attachCdVal=null;

	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로

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
				$('#btnCancle').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
				$('#btnCancle').addClass('d-none');
			}
		},
	});
	
	//공통코드 처리 시작      
	var admDeptCode = new Array(); // 부서
	<c:forEach items="${admDept}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var faultyPcsCode = new Array(); // 부적합처리
	<c:forEach items="${faultyPcs}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	faultyPcsCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(admDeptCode, "admDept", "", "2");
	selectBoxAppend(faultyPcsCode, "faultyPcs", "", "2");
	selectBoxAppend(admDeptCode, "faultyDept", "", "2");

	$('#writeDate').val(serverDate);

	//관련자료 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#faultyAttachDataTable').DataTable().ajax.reload();
		$('tab')
	});
	
	
	//저장 변환 여부 모달
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);

		$('#fileSearch').addClass('d-none');
		$('#fileSearch2').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#btnFpFileDel2').addClass('d-none');
		$('#fileTag').removeClass('d-none');
		$('#fileTag2').removeClass('d-none');
	});

	//승인 변환 여부 모달
	$('#approveSaveModalY').on('click', function() {
		console.log("모달창에서 예 버튼 클릭함")
		$.ajax({
			url : '<c:url value="qm/itemCompleteFaultyJdgApproveYnUpdate" />',
			type : 'GET',
			data  : {
				'workOrdNo' : workOrdNo,
			},
			success : function(res){
				if(res.result=="ok"){
					$('#btnApprove').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',true);
					$('#finishedItemTable').DataTable().ajax.reload();
					toastr.success("승인되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		});
	});

	
	// 목록
	let finishedItemTable = $('#finishedItemTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-3'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,

		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 9,
		ajax : {
			url : '<c:url value="qm/itemCompleteAdmMasterList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, "");
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, "");
				}
			},
		},
		rowId : 'workOrdNo',
		columns : [ {
			data : 'approvalYn',
				render: function(data, type, row, meta){
					if(data == "001"){
						return '승인';
					} else if(data == "002" || data == null){
						return '미승인';
					}
				}
		},
		{
			data : 'itemGubunNm'
		}, {
			data : 'inspectDate',
			render : function(data, type, row, meta) {
				return moment(data).format("YYYY-MM-DD")
			}
		}, {
			data : 'workOrdNo'
		}, {
			data : 'itemNm'
		}, {
			data : 'itemSeries'
		}, {
			data : 'faultyQty'
		}, {
			data : 'inspectChargrNm'
		}, 
		],
		order : [ [ 2, 'desc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '완제품검사(부적합관리)'
		}, 'print' ],
		columnDefs: [
			{ targets: [6] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        	
        ],
	});


	// 보기
	$('#finishedItemTable tbody').on('click','tr', function() {

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#finishedItemTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		uiProc(true);
		uiProc2(true);
		
		$('#form').each(function() {
			this.reset();
		});
		$('#form2').each(function() {
			this.reset();
		});

		
		$('#btnSave').addClass('d-none'); // 등록버튼
		$('#btnAdd').attr('disabled', false); // 수정버튼
		$('#btnEdit').attr('disabled', false); // 수정버튼
		$('#btnDtlSave').addClass('d-none'); 
		$('#fileSearch').addClass('d-none');
		$('#fileSearch2').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#btnFpFileDel2').addClass('d-none');
		$('#fileTag').removeClass('d-none');
		$('#fileTag2').removeClass('d-none');
		
		workOrdNo = finishedItemTable.row(this).data().workOrdNo;
		itemCd = finishedItemTable.row(this).data().itemCd;
		itemRev = finishedItemTable.row(this).data().itemRev;
		faultyQty = finishedItemTable.row(this).data().faultyQty;
		sideView2 = 'edit';

		$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});
		
		sourceNoVal = '';
		$('#faultyAttachDataTable').DataTable().ajax.reload(function(){});

		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="qm/itemCompleteFaultyJdgAdmRead"/>',
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNo,
			},
			success : function(res) {
				let data = res.data;

				console.log(data);
				
				if(data.faultyPcs!=null){
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',false);
				}else{
					$('#btnDtlAdd').attr('disabled',false);
					$('#btnDtlEdit').attr('disabled',true);
				}
				
				//부적합처리가 선별일경우
				if(data.faultyPcs=="002"){
					$('#itemFaultyJdgAdmTable').removeClass('d-none');
				}else{
					$('#itemFaultyJdgAdmTable').addClass('d-none');
				}

				//부적합처리 승인여부
				if(data.approvalYn=="001"){
					$('#btnApprove').attr("disabled",true);	//승인
					$('#btnDtlEdit').attr('disabled',true);
				}else{	
					$('#btnApprove').attr("disabled",false);	//승인
				}

				$('input[name=approvalYn][value="'+data.faultyPcs+'"]').prop('checked',true);
				
				$('#pairCnt').val(data.pairCnt);
				$('#faultyCnt').val(data.faultyCnt);
				$('#faultyDate').val(moment(data.fualtyDate).format('YYYY-MM-DD'));
				$('#faultyChargrNm').val(data.faultyChargrNm);
				$('#faultyChargr').val(data.faultyChargr);
				$('#repairQty').val(data.repairQty);
				$('#repairDate').val(moment(data.repairDate).format('YYYY-MM-DD'));
				$('#reworkQty').val(data.reworkQty);
				$('#reworkDate').val(moment(data.reworkDate).format('YYYY-MM-DD'));
				$('#disuseQty').val(data.disuseQty);
				$('#disuseDate').val(moment(data.disuseDate).format('YYYY-MM-DD'));
				$('#faultyDesc').val(data.faultyDesc);
			}
		});
	});
	

	// 목록
	let itemFaultyTypeTable = $('#itemFaultyTypeTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 10,
		ajax : {
			url : '<c:url value="qm/itemCompleteAdmDetailList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNo;},
			},
		},
		rowId : 'poNo',
		columns : [ {
			render : function(data, type, row, meta) {
				return meta.row+1;
			}
		}, {
			data : 'faultyTypeNm'
		}, {
			data : 'faultyTypeQty'
		}, {
			data : 'writeDate',
			render : function(data, type, row, meta) {
				if(data!=null){
					return moment(data).format("YYYY-MM-DD");
				}else{
					return '-';
				}
				
			}
		}, {
			data : 'faultyTypeDesc'
		}],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '부적합관리(수입검사)'
		}, 'print' ],

	});

	
	// 보기
	$('#itemFaultyTypeTable tbody').on('click','tr', function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#itemFaultyTypeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		
		faultyTypeCd = itemFaultyTypeTable.row(this).data().faultyTypeCd;
		//writeDate = finishedItemTable.row(this).data().writeDate;
		
		sourceNoVal = workOrdNo+"/"+itemCd+"/"+itemRev+"/"+faultyTypeCd;
		console.log('원천번호 : ===================> '+sourceNoVal);


		$('#tab1Nav').tab('show');	
		$('#tab2Nav').removeClass('disabled');	//관련자료 탭 활성화
		
		sideView = 'edit';
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#fileSearch').addClass('d-none');
		$('#fileSearch2').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#btnFpFileDel2').addClass('d-none');
		$('#fileTag').removeClass('d-none');
		$('#fileTag2').removeClass('d-none');
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="qm/itemCompleteFaultyAdmRead"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function() {return workOrdNo;},
				'itemCd' : function() {return itemCd;},
				'itemRev' : function() {return itemRev;},
				'faultyTypeCd' : function() {return faultyTypeCd;},
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';

				$('#admChargrNm').val(data.admChargrNm);
				$('#admChargr').val(data.admChargr);
				
				if (data.writeDate == null|| data.writeDate == "") {
					$('#writeDate').val(serverDate);
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
				} else {
					$('#writeDate').val(moment(data.writeDate).format('YYYY-MM-DD'));
					$('#btnAdd').attr('disabled', true);
					$('#btnEdit').attr('disabled',false);
				}
				$('#faultyStatus').val(data.faultyStatus);
				$('#faultyCause').val(data.faultyCause);
				$('#faultyAct').val(data.faultyAct);
				//$('#faultyDept').val(data.faultyDept);
				$('#faultyNo').val(data.faultyNo);
				$('#faultyProg').val(data.faultyProg);
				$('#faultyImprv').val(data.faultyImprv);
				$('#faultyEffect').val(data.faultyEffect);
				console.log(data);
				
				if (res.faultyImage1 != null) {
					$('#imageFile1').attr("src",'data:image/jpg;base64,'+ res.faultyImage1);
					$('#imgName1').text(data.faultyImage1Nm);

				} else {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("파일을 선택해주세요");
				}

				if (res.faultyImage2 != null) {
					$('#imageFile2').attr("src",'data:image/jpg;base64,'+ res.faultyImage2);
					$('#imgName2').text(data.faultyImage2Nm);
				} else {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("파일을 선택해주세요");
				}

				$('#fpFn').text(data.faultyFile1Nm);
				$('#fpFn2').text(data.faultyFile2Nm);
				
				(data.faultyFile1Nm == null || data.faultyFile1Nm == "")?$('#fpValue').text("파일을 선택해주세요"):$('#fpValue').text(data.faultyFile1Nm);
				(data.faultyFile2Nm == null || data.faultyFile2Nm == "")?$('#fpValue2').text("파일을 선택해주세요"):$('#fpValue2').text(data.faultyFile2Nm);
				
				$('#fpHref').attr('href','qm/downloadFile3?workOrdNo='+workOrdNo+'&itemCd='+itemCd+'&itemRev='+itemRev+'&value=1');
				$('#fpHref2').attr('href','qm/downloadFile3?workOrdNo='+workOrdNo+'&itemCd='+itemCd+'&itemRev='+itemRev+'&value=2');

				
				//선택박스 처리
				selectBoxAppend(admDeptCode, "admDept",data.admDept, "2");
				selectBoxAppend(faultyPcsCode,"faultyPcs", data.faultyPcs,"2");
				selectBoxAppend(admDeptCode,"faultyDept", data.faultyDept,"2");
				
				//완제품검사 성적서 업로드 파일 불러오기
				$.ajax({
					url : '<c:url value="/qm/itemCompleteAdmRead"/>',
					type : 'GET',
					data : {
						'workOrdNo' : function() {return workOrdNo;},
						'itemCd' : function() {return itemCd;},
						'itemRev' : function() {return itemRev;},
					},
					success : function(res) {
						let data = res.data;
// 						var data = res.data;
// 						if (res.result == 'ok') {
							
							$('#fpFn3').text(data.shipReport);						
// 							(data.shipReport == null || data.shipReport == "") ? $('#fpValue').text("파일을 선택해주세요") : $('#fpValue').text(data.shipReport);
							$('#fpHref3').attr('href','qm/completeDownloadFile?workOrdNo='+data.workOrdNo+'&itemCd='+data.itemCd+'&itemRev='+data.itemRev);

// 						} else {
// 							toastr.error(res.message);
// 						}
					}
				});

			}
		});
	});

	// 등록폼
	$('#btnAdd').on('click', function() {

		if (sideView != "edit") {
			toastr.warning("부적합관리 등록할 항목을 선택해주세요.");
			return false;
		}

		/* 		$('#form input[type=text]').attr('disabled', false); 
		 $('#form input[type=file]').attr('disabled', false); 
		 $('#form select').attr('disabled', false); 
		 $('#form textarea').attr('disabled', false);  */

		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		//화면처리        
		uiProc(false);

		$('#faultyChargrNm').val(userNm);
		$('#faultyChargr').val(userNumber);
		$('#admChargrNm').val(userNm);
		$('#admChargr').val(userNumber);
		
		
		$('#writeDate').val(serverDate);
		$('#inspectChargr').val(userNumber);
		$('#inspectChargrNm').val(userNm);
		$('#btnSave').attr('disabled', false);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); // 수정버튼

		$('#fileSearch').removeClass('d-none');
		$('#fileSearch2').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#btnFpFileDel2').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fileTag2').addClass('d-none');
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("부적합관리 수정할 항목을 선택해주세요.");
			return false;
		}
		uiProc(false);
		
		$('#inspectChargr').val(userNumber);
		$('#inspectChargrNm').val(userNm);
		
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');

		$('#fileSearch').removeClass('d-none');
		$('#fileSearch2').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#btnFpFileDel2').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fileTag2').addClass('d-none');
	});

	function deleteImg(value) {
		$.ajax({
			url : '<c:url  value="qm/itemCompleteFaultyImageDelete"/>',
			type : 'GET',
			data : {
				'value' : value,
				'workOrdNo' : function() {return workOrdNo;},
				'itemCd' : function() {return itemCd;},
				'itemRev' : function() {return itemRev;},
			},
			success : function(res) {
				if (res.result == "ok") {
					toastr.success("파일이 삭제되었습니다.");
					if (value == 1) {
						$('#imgAdd1').focus();
						$('#imgName1').text("파일을 선택해주세요");
						$('#imageFile1').attr("src", " ");
						$('#imgAdd1').val("");
					} else if (value == 2) {
						$('#imgAdd2').focus();
						$('#imgName2').text("파일을 선택해주세요");
						$('#imageFile2').attr("src", " ");
						$('#imgAdd2').val("");
					} else if (value == 3) {
						$('#fpValue').text("파일을 선택해주세요");
						$('#fpHref').attr("src", " ");
						$('#fpFn').val("");
					} else if (value == 4) {
						$('#fpValue2').text("파일을 선택해주세요");
						$('#fpHref2').attr("src", " ");
						$('#fpFn2').val("");
					}
				}
			}
		});
	}

	// 저장 처리
	$('#btnSave').on('click',function() {

		//입력값 검사
		if (!$.trim($('#admDept option:selected').val())) {
			toastr.warning('부서를 입력해주세요.');
			$('#admDept').focus();
			return false;
		}
		if ($('#writeDate').val() == "") {
			toastr.warning('작성일자를 입력해주세요.');
			$('#writeDate').focus();
			return false;
		}
		if ($('#admChargrNm').val() == "") {
			toastr.warning('담당자를 입력해주세요.');
			$('#admChargrNm').focus();
			return false;
		}
		
		/* if (!$.trim($('#faultyPcs option:selected').val())) {
			toastr.warning('부적합처리를 입력해주세요.');
			$('#faultyPcs').focus();
			return false;
		} */

		var formData = new FormData(document.getElementById("form"));
		formData.append('workOrdNo', workOrdNo);
		formData.append('itemCd', itemCd);
		formData.append('itemRev', itemRev);
		formData.append('faultyTypeCd', faultyTypeCd);
		
		formData.set('admDept', $('#admDept option:selected').val());
		formData.set('faultyImprv', $('#faultyImprv').val());
		formData.set('faultyEffect', $('#faultyEffect').val());
		formData.append('admChargr', $('#admChargr').val());
		formData.append('writeDate', $('#writeDate').val().replace(/-/g, ''));

		var url = '<c:url value="/qm/itemCompleteFaultyCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/qm/itemCompleteFaultyUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#finishedItemTable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#btnSave').addClass('d-none');

					$('#fileSearch').addClass('d-none');
					$('#btnFpFileDel').addClass('d-none');
					$('#fileTag').removeClass('d-none');
					$('#fileSearch2').addClass('d-none');
					$('#btnFpFileDel2').addClass('d-none');
					$('#fileTag2').removeClass('d-none');

					$('#fpFn').text(res.faultyFile1);
					$('#fpFn2').text(res.faultyFile2);
					
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
						$('#btnAdd').attr('disabled', true);
						$('#btnEdit').attr('disabled', false);
					}

					$('#imageFile1').attr("src",'data:image/jpg;base64,'+ res.faultyImage1);
					$('#imageFile2').attr("src",'data:image/jpg;base64,'+ res.faultyImage2);

					sideView = 'edit';

					$('#itemFaultyTypeTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
	});

	function faultyPcsChange(value){
		if(value==1){
			$('#pairCnt').val(faultyQty);
			$('#faultyCnt').val(0);
			
			$('#itemFaultyJdgAdmTable').addClass('d-none');
		}else{
			$('#disuseQty').val(0);
			$('#repairQty').val(0);
			$('#reworkQty').val(0);
			
			$('#itemFaultyJdgAdmTable').removeClass('d-none');
		}
	}
	
	//등록버튼
	$('#btnDtlAdd').on('click',function(){
		if (sideView2 != 'edit') {
			toastr.warning("부적합처리 등록할 항목을 선택해주세요.");
			return false;
		}

		$('#form2').each(function() {
			this.reset();
		});

		btnView = 'add';
		uiProc2(false);
		$('#pairCnt').val(faultyQty);
		$('#faultyCnt').val(0);
		
		$('#faultyDate').val(serverDate);
		$('#disuseDate').val(serverDate);
		$('#repairDate').val(serverDate);
		$('#reworkDate').val(serverDate);
		$('#btnDtlSave').removeClass('d-none');
	});

	//수정버튼
	$('#btnDtlEdit').on('click',function(){
		if (sideView2 != 'edit') {
			toastr.warning("부적합처리 수정할 항목을 선택해주세요.");
			return false;
		}
		
		btnView = 'edit';
		uiProc2(false);
		$('#btnDtlSave').removeClass('d-none');
	});


	//승인버튼
	$('#btnApprove').on('click',function(){
		if (sideView2 != 'edit') {
			toastr.warning("부적합처리 승인할 항목을 선택해주세요.");
			return false;
		}
		
		if ($('#btnDtlAdd').is(":disabled")==false ) {
			console.log("save disabled equal undefinded")
			toastr.warning("부적합처리 등록 후 승인해주세요.");
			$('#btnDtlAdd').focus();
			return false;
			
		}else{
			
			if ($('#btnApprove').attr('class') == 'btn btn-primary float-left mr-1') {
				$('#approveSaveModal').modal('show');
				console.log("등록중입니다.");
				return false;
			}
		}
	});
	

	//저장버튼
	$('#btnDtlSave').on('click',function(){

		if(btnView=="add"){
			url = '<c:url value="qm/itemCompleteFaultyJdgAdmCreate" />';
		}else{
			url = '<c:url value="qm/itemCompleteFaultyJdgAdmUpdate" />';
		}
		 
		$.ajax({
			url : url,
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNo,
				'itemCd' : itemCd,
				'itemRev' : itemRev,
				'faultyPcs' : $('input[name=approvalYn]:checked').val(),
				'pairCnt' : $('#pairCnt').val(),
				'faultyCnt' : $('#faultyCnt').val(),
				'faultyPcs' : $('input[name=approvalYn]:checked').val(),
				'faultyDate'  :$('#faultyDate').val().replace(/-/g,''),
				'faultyChargr'  :$('#faultyChargr').val(),
				'disuseQty'  :$('#disuseQty').val(),
				'disuseDate'  :$('#disuseDate').val().replace(/-/g,''),
				'repairQty'  :$('#repairQty').val(),
				'repairDate'  :$('#repairDate').val().replace(/-/g,''),
				'reworkQty'  :$('#reworkQty').val(),
				'reworkDate'  :$('#reworkDate').val().replace(/-/g,''),
				'faultyDesc'  :$('#faultyDesc').val(),
			},
			success : function(res){

				if(res.result=="ok"){
					if(btnView=="add"){
						toastr.success("등록되었습니다.");
					}else{
						toastr.success("수정되었습니다.");
					}
					uiProc2(true);
					$('#btnDtlSave').addClass('d-none');
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',false);
				}else if(res.result=="excess"){
					toastr.warning("불량수량을 초과하였습니다.");
				}
			}
		})
		
	});

	//최종불량개수 변경될때 발생 이벤트
	function pairCntChange(){
		
		var disuseQtyVal = $('#disuseQty').val().replace(/,/g,'');	//폐기수량
		var repairQtyVal = $('#repairQty').val().replace(/,/g,'');  //수리수량
		var reworkQtyVal = $('#reworkQty').val().replace(/,/g,'');	//재작업수량
		

		if(faultyQty<(parseInt(disuseQtyVal)+parseInt(repairQtyVal)+parseInt(reworkQtyVal))){
			toastr.warning("불량수량을 초과하였습니다.");
			
			$('#disuseQty').val(0);
			$('#repairQty').val(0);
			$('#reworkQty').val(0);
			$('#faultyCnt').val(0);
		}else{
			$('#faultyCnt').val(parseInt(repairQtyVal)+parseInt(disuseQtyVal)+parseInt(reworkQtyVal));
			$('#pairCnt').val(parseInt(faultyQty)-parseInt($('#faultyCnt').val()));
		}
	}


	//관련자료 목록조회
	let faultyAttachDataTable = $('#faultyAttachDataTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="qm/faultyAttachDataRead"/>',
			type : 'GET',
			data : {
				'sourceNo' : function() {return sourceNoVal;}
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					}
				},
				{data : 'attachRegDate',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="date" class="form-control"  name="attachRegDate_'+meta.row+'" value="'+moment(data).format("YYYY-MM-DD")+'" style="text-align:center;" disabled/>'  
							
						} else{
							return '<input type="date" class="form-control" name="attachRegDate_'+meta.row+'" value="'+serverDate+'"  style="text-align:center;"/>'  

						}
					}
				},		
				{
					data : 'regNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return userNm;
						}
					},
					'className' : 'text-center'
				},   
			/* 	{
					data : 'attachContent',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input class="form-control" type="text" id="attachContent_'+meta.row+'" name="attachContent_'+meta.row+'" value="'+data+'" style="border:none;" disabled/>';
						} else {
							return '<input class="form-control" type="text" id="attachContent_'+meta.row+'" name="attachContent_'+meta.row+'" />';
						}
					}
				}, */
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {

					/*  var del;
		               
					   del = '<div class="rightsidebar-close">';
					   del += '<button type="button" class="btn" name="closeBtn" onclick=deleteWorkStandard("'+row['prcssCd']+'");>';
					   del += '<i class="mdi mdi-close"></i>';
					   del += '</button>';
					   del += '</div>'; */
					   
					   var html;
					   if(data == null){
						   html = '<div class="custom-file">'
						   html += '<input type="file" class="custom-file-input" id="fileNm_'+meta.row+'" name="fileNm_'+meta.row+'" onchange=uploadAttachData('+meta.row+'); />'    
			 			   html += '<label class="custom-file-label" for="fileNm_'+meta.row+'" name="fileLabel_'+meta.row+'">파일을 선택해주세요.</label></div>'
			 			   
					   } else{
						  html = '<a href="/qm/faultyAttachDataDownload?attachGubun=FI&attachCd='+row['attachCd']+'&sourceNo='+row['sourceNo']+'">'+data+'</a>';
					   }
						
					   return  html;
				}
		} ],
		columnDefs : [ {
			"targets" : [ 0, 1 ],
			"className" : "text-center"
		},

		],
		buttons : []
	});


	//데이터 클릭 시
	$('#faultyAttachDataTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#faultyAttachDataTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#faultyAttachDataTable').DataTable().row(this).index();
		attachCdVal = faultyAttachDataTable.row(this).data().attachCd;

		status = 'choice';
	});

	
	//추가버튼
	$('#btnAttachAdd').on('click', function() {
		/* if(status != "choice"){
			toastr.warning("관련자료 항목을 선택해주세요.");
		} */

		
		$('#faultyAttachDataTable').DataTable().row.add({}).draw(false);

		//$('#btnAttachAdd').attr('disabled', true);
		//$('#btnAttachDel').attr('disabled', true);

		//$('#btnAttachSave').removeClass('d-none');

	});


	//삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (status != "choice") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="qm/faultyAttachDataDelete" />',
			type : 'GET',
			data : {
				'attachCd' : function() {return attachCdVal;},
				'attachGubun' : "FC"
			},
			success : function(res) {
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					status = '';
				} else {
					toastr.error(res.message);
				} 

				$('#faultyAttachDataTable').DataTable().rows(tableIdx).remove().draw();
				//$('#faultyAttachDataTable').DataTable().ajax.reload();
			}
		});

	});
	


	// 관련자료 등록
	function uploadAttachData(index) {
		
		var formData = new FormData(document.getElementById("form3")); //ajax로 넘길 data

		formData.append("attachGubun", "FC");
		formData.append("sourceNo", sourceNoVal);
		
		//attachContentVal = $('input[name=attachContent_'+index+']').val();
		//formData.append("attachContent", attachContentVal==null||attachContentVal==""?"-":attachContentVal);
		
		formData.append("attachRegDate", $('input[name=attachRegDate_'+index+']').val().replace(/-/g,''));
		formData.append("index", index);
		

		$.ajax({
			url : '<c:url value="qm/faultyAttachDataCreate"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
					$('#faultyAttachDataTable').DataTable().ajax.reload(function(){});
				} 
			}
		});

	}
	


	
	//담당자조회 팝업 시작
	var value2;
	var userPopUpTable;
	function selectadmChargr(value) {
		value2 = value;
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
					data : 'chargrDutyNm'
				}, {
					data : 'workplaceNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4, 5 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});

			$('#userPopUpTable tbody').on('click', 'tr', function() {
				console.log(value2)
				var data = userPopUpTable.row(this).data();

				if(value2=="1"){
					$('#admChargr').val(data.userNumber);
					$('#admChargrNm').val(data.userNm);
				}else if(value2=="2"){
					$('#faultyChargr').val(data.userNumber);
					$('#faultyChargrNm').val(data.userNm);
				}
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}



	
	
	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="inspectDateFrom" name="inspectDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(inspectDateFrom,inspectDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inspectDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="inspectDateTo" name="inspectDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(inspectDateTo,inspectDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inspectDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#finishedItemTable_length').html(html1);
	$('#inspectDateFrom').val(serverDateFrom);
	$('#inspectDateTo').val(serverDateTo);
	
	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#inspectDateFrom').val();
		serverDateTo = $('#inspectDateTo').val();

		$('#finishedItemTable').DataTable().ajax.reload(function() {
		});

	});
	
	function uiProc(flag) {
		$("#admDept").attr("disabled", flag);
		$("#admManager").attr("disabled", flag);
		$("#btnAdmChargr").attr("disabled", flag);
		$("#writeDateCalendar").attr("disabled", flag);
		$("#faultyStatus").attr("disabled", flag);
		$('#btnAdmChargr').attr('disabled', flag);
		$("#faultyCause").attr("disabled", flag);
		$("#imgAdd1").attr("disabled", flag);
		$("#imgAdd2").attr("disabled", flag);
		$("#faultyAct").attr("disabled", flag);
		$("#faultyDept").attr("disabled", flag);
		$("#faultyNo").attr("disabled", flag);
		$("#faultyProg").attr("disabled", flag);
		$("#faultyImprv").attr("disabled", flag);
		$("#faultyEffect").attr("disabled", flag);
		$("#faultyPcs").attr("disabled", flag);
		$('button[name=closeBtn]').attr("disabled", flag);
	}


	function uiProc2(flag) {
		$("input[name=approvalYn]").attr("disabled", flag);
		$("#btnfaultyChargr").attr("disabled", flag);
		$("#faultyDateCalendar").attr("disabled", flag);
		//$("#pairCnt").attr("disabled", flag);
		//$("#faultyCnt").attr("disabled", flag);
		
		$("#disuseQty").attr("disabled", flag);
		$("#repairQty").attr("disabled", flag);
		$("#reworkQty").attr("disabled", flag);
		$("#repairDate").attr("disabled", flag);
		$("#reworkDate").attr("disabled", flag);
		$("#disuseDate").attr("disabled", flag);
		//$("#itemFaultyJdgAdmTable").removeClass("d-none")
		$("#faultyDesc").attr("disabled", flag);
	}
</script>

</body>
</html>
