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
				<li class="breadcrumb-item active">수입검사 부적합관리대장</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 65%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<div style="height:450px">
						<table id="itemFaultyAdmMasterTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="7%">
								<col width="10%">
								<col width="12%">
								<col width="12%">
								<col width="6%">
								<col width="6%">
								<col width="8%">
								
								<col width="7%">
								
								<col width="8%">
								<col width="6%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>입고전표번호</th>
									<th>승인여부</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>입고수량</th>
									<th>불량수량</th>
									<th>검사자</th>
									<th>검사일</th>
									<th>불량유형</th>
									<th>처리결과</th>
									<th>불량등록일</th>
								</tr>
							</thead>
						</table>
						</div>
						<hr>
						<div class="row pt-1">
							<div class="col-sm-7 p-1">
								<div class="card-body p-0 mb-2">
									<button type="button" class="btn btn-primary float-left mr-1"
									 	id="btnDtlAdd">등록</button>
									 <button class="btn btn-primary d-none" id="btnDtlAddConfirmLoading"
									 	type="button" disabled>
									 	<span class="spinner-border spinner-border-sm" role="status"
									 		aria-hidden="true"></span> 처리중
								   	 </button>
								   	  <button type="button" class="btn btn-primary float-left mr-1"
									 	id="btnDtlEdit">수정</button>
									 <button class="btn btn-warning d-none" id="btnDtlEditConfirmLoading"
									 	type="button" disabled>
									 	<span class="spinner-border spinner-border-sm" role="status"
									 		aria-hidden="true"></span> 처리중
									 </button>
								 	 <button type="button" class="btn btn-primary float-left mr-1 d-none"
									 	id="btnDtlSave">저장</button>
									 <button class="btn btn-primary d-none" id="btnDtlSaveConfirmLoading"
									 	type="button" disabled>
									 	<span class="spinner-border spinner-border-sm" role="status"
									 		aria-hidden="true"></span> 처리중
								   	 </button>
									 <button type="button" class="btn btn-primary float-right mr-1"
										id="btnApprove">승인</button>
									 <button class="btn btn-warning d-none" id="btnApproveConfirmLoading"
										type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									 </button>
								</div>
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
							                          	<div class="custom-control custom-control-inline custom-radio row">
							                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr3" value="003" onclick="javascript:faultyPcsChange(3);"> 
							                            	<label class="custom-control-label" for="apr3">반품</label>
							                          	</div>
							                          	<div class="custom-control custom-control-inline custom-radio row">
							                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr4" value="004" onclick="javascript:faultyPcsChange(4);"> 
							                            	<label class="custom-control-label" for="apr4">리워크</label>
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
						       </form>
						 	</div>
						 	<div class="col-sm-5 p-1">
						 		<div class="card-body p-0 mt-4"></div>
						 		<table class="table table-bordered mt-2 mb-2 d-none" id="itemFaultyJdgAdmTable">
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
											<th>반품</th>
											<td><input type="text" class="form-control" id="returnQty" name="returnQty" style="text-align:right;" onchange="javascript:pairCntChange();"></td>
											<td>
												<input type="date" class="form-control" id="returnDate" name="returnDate" style="max-width:100%">
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
									</thead>
						       </table>
						 	</div>
						</div>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 34%;">
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
										<th>불량 등록일</th>
										<th>비고</th>
									</tr>
								</thead>
						  	</table>
							<div class="card-body col-sm-12 p-1 mt-2 mb-2">
								<button type="button" class="btn btn-primary float-left mr-1"
									id="btnAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-left"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button"
									class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form" enctype="multipart/form-data" method="post">
								<div class="table-responsive">
									<table id="itemFaultyDtlTable" class="table table-lg table-bordered mb-2">
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
														type="text" id="faultyRegDate" name="faultyRegDate"
														maxlength="10" disabled />
													<button
														onclick="fnPopUpCalendar(faultyRegDate,faultyRegDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="faultyRegDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>불량현상</th>
											<td colspan="3"><textarea class="form-control" rows="2"
													id="faultyStatus" name="faultyStatus"
													style="max-width: 100%; resize: none;"></textarea></td>
										</tr>
										<tr>
											<th>불량원인</th>
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
												<div class="custom-file" style="height: 100px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>
											<td colspan="2">
												<div class="custom-file" style="height: 100px;">
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
											<th>조치사항</th>
											<td><input class="form-control" type="text" id="faultyAct"
												name="faultyAct"></td>
											<th>부적합보고서 발행번호</th>
											<td><input class="form-control" type="text" id="faultyNo"
												name="faultyNo"></td>
											<!-- <th>귀책부서</th>
											<td><input class="form-control" type="text"
												id="faultyDept" name="faultyDept"></td> -->
										</tr>
										<tr>
											<th>개선사항</th>
											<td><input class="form-control" type="text"
												id="faultyImprv" name="faultyImprv"></td>
											<th>진행사항</th>
											<td><input class="form-control" type="text"
												id="faultyProg" name="faultyProg"></td>
										</tr>
										<tr>
											<th>유효성</th>
											<td><input class="form-control" type="text"
												id="faultyEffect" name="faultyEffect"></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>부적합처리</th>
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
									</table>
								</div>
							</form>
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

	let currentHref = "qmsc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사 부적합관리대장"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let status = '';
	
	uiProc(true);
	uiProc2(true);
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	var tableIdx = null;
	let tableIdx2 = null;
	var poNo=null;
	var poSeq=null;
	var inSeq=null;
	var inSlipNo = null;
	var inSlipSeq = null;
	
	var itemSeq=null;
	var faultyCnt=null;
	var sourceNoVal=null;
	var attachCdVal=null;
	var faultyTypeCd=null;
	var approvalYnOption = "";
	
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
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
			}
		},
	});
	
	//공통코드 처리 시작      
	var admDeptCode = new Array(); // 상태여부
	<c:forEach items="${admDept}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var faultyPcsCode = new Array(); // 상태여부
	<c:forEach items="${faultyPcs}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	faultyPcsCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(admDeptCode, "admDept", "", "");
	selectBoxAppend(faultyPcsCode, "faultyPcs", "", "2");

	$('#faultyRegDate').val(serverDate);
	$('#faultyDate').val(serverDate);
	$('#returnDate').val(serverDate);
	$('#disuseDate').val(serverDate);

	
	//관련자료 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#faultyAttachDataTable').DataTable().ajax.reload();
	});
	

	//저장 변환 여부 모달
	$('#saveBtnModalY').on('click', function() {
		uiProc2(true);

		$('#form2').each(function() {
			this.reset();
		});
		$('#btnDtlSave').addClass('d-none');
		
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
			url : '<c:url value="qm/itemFaultyJdgApproveYnUpdate" />',
			type : 'GET',
			data  : {
				'inSlipNo' : inSlipNo,
				'inSlipSeq' : inSlipSeq,
				'faultyCnt' : $('#faultyCnt').val(),
			},
			success : function(res){
				if(res.result=="ok"){
					$('#btnApprove').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',true);
					$('#itemFaultyAdmMasterTable').DataTable().ajax.reload();
					toastr.success("승인되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		})
	});


	
	// 목록
	let itemFaultyAdmMasterTable = $('#itemFaultyAdmMasterTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			    + "<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 10,
		ajax : {
			url : '<c:url value="qm/itemFaultyAdmMasterList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, "");},
				'endDate' : function() { return serverDateTo.replace(/-/g, "");},
				'approvalYn' : function(){return approvalYnOption},		
			},
		},
		rowId : 'poNo',
		columns : [ 
			{
				data : 'inSlipNo'
			}, 
			{
				data : 'approvalYn',
				render:function(data,type,row,meta){
					if(data!=null){
						if(data=="001"){
							return '승인';
						}else{
							return '<span style="color:red;">미승인</span>';
						}
					}else{
						return '<span style="color:red;">미승인</span>';
					}
				}
			},
			{
				data : 'itemModelNm'
			}, {
				data : 'itemCd'//품번
			}, {
				data : 'itemNm'//품명
			}, {
				data : 'preInWhsQty'//입고수량
			}, {
				data : 'faultyCnt'//불량수량
			}, {
				data : 'inspectChargrNm'
			}, {
				data : 'inspectDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			}, 
			{
				data : 'faultyTypeNm',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			}, 
			{
				data : 'faultyPcs',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			}, 
			{
				data : 'faultyTypeDate',
				render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
				}
			}, 
		],
		order : [ [ 0, 'desc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '수입검사 부적합관리대장'
		}, 'print' 
		],
		columnDefs: [
			{ targets: [5,6] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
	});
	
	// 보기
	$('#itemFaultyAdmMasterTable tbody').on('click','tr',function() {

		if ($('#btnDtlSave').attr('class') == 'btn btn-primary float-right mr-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
		} else {
			$('#itemFaultyAdmMasterTable').DataTable().$('tr.selected').removeClass('selected');
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

		$('#tab2Nav').removeClass('disabled');	//관련자료 탭 활성화
		$('#btnSave').addClass('d-none'); 		// 등록버튼
		$('#btnAdd').attr('disabled', false); 	// 수정버튼
		$('#btnEdit').attr('disabled', false); 	// 수정버튼
		$('#btnDtlSave').addClass('d-none');	//하단 저장버튼

		$('#imageFile1').attr('src','');
		$('#imageFile2').attr('src','');
	    $('#imgName1').text('');
	    $('#imgName2').text('');
		
		$('#fileSearch').addClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fpValue').text('');
		tableIdx2 = $('#itemFaultyAdmMasterTable').DataTable().row(this).index();

		
		inSlipNo = itemFaultyAdmMasterTable.row(this).data().inSlipNo;
		inSlipSeq = itemFaultyAdmMasterTable.row(this).data().inSlipSeq;
		itemSeq = itemFaultyAdmMasterTable.row(this).data().itemSeq;
		faultyCnt = itemFaultyAdmMasterTable.row(this).data().faultyCnt;
		faultyTypeCd = itemFaultyAdmMasterTable.row(this).data().faultyTypeCd;;

		sideView2 = "edit";

		sourceNoVal = inSlipNo+"/"+inSlipSeq+"/"+faultyTypeCd;
		$('#faultyAttachDataTable').DataTable().ajax.reload(function(){});
		$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});

		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="qm/itemFaultyJdgAdmRead"/>',
			type : 'GET',
			data : {
				'inSlipNo' : inSlipNo,
				'inSlipSeq' : inSlipSeq,
			},
			success : function(res) {
				let data = res.data;

				console.log(data.faultyPcs)
				if(data.faultyPcs!=null){
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',false);
				}else{
					$('#btnDtlAdd').attr('disabled',false);
					$('#btnDtlEdit').attr('disabled',true);
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
				$('#faultyDesc').val(data.faultyDesc);
			}
		});
	});

	// 불량유형 목록조회
	let itemFaultyTypeTable = $('#itemFaultyTypeTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 10000,
		scrollY: "200px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="qm/itemFaultyAdmList"/>',
			type : 'GET',
			data : {
				'inSlipNo' : function(){return inSlipNo;},
				'inSlipSeq' : function(){return inSlipSeq;},
			},
		},
		rowId : 'inSlipNo',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				}
			}, {
				data : 'faultyTypeNm'
			}, {
				data : 'faultyTypeQty'
			}, {
				data : 'faultyTypeDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format("YYYY-MM-DD");
					}else{
						return '-';
					}
				}
			}, {
				data : 'faultyTypeDesc'
			}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '수입검사 부적합관리대장'
		}, 'print' 
		],
		columnDefs: [
			{ targets: [2] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],

	});

	// 불랴유형 목록 선택시
	$('#itemFaultyTypeTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
		} else {
			$('#itemFaultyTypeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		faultyTypeCd = itemFaultyTypeTable.row(this).data().faultyTypeCd;
		faultyRegDate = itemFaultyTypeTable.row(this).data().faultyRegDate;
		sourceNoVal = inSlipNo+"/"+inSlipSeq+"/"+faultyTypeCd;

		if (faultyRegDate != null) {
			$('#btnAdd').attr('disabled', true);
			$('#btnEdit').attr('disabled', false);
		} else {
			$('#btnAdd').attr('disabled', false);
			$('#btnEdit').attr('disabled', true);
		}

		$('#tab1Nav').tab('show');	
		$('#tab2Nav').removeClass('disabled');	//관련자료 탭 활성화
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#fileSearch').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#fileTag').removeClass('d-none');

		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="qm/itemFaultyAdmRead"/>',
			type : 'GET',
			data : {
				'inSlipNo' : inSlipNo,
				'inSlipSeq' : inSlipSeq,
				'faultyTypeCd' : faultyTypeCd
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';

				$('#admChargrNm').val(data.admChargrNm);
				$('#admChargr').val(data.admChargr);
				if (data.faultyRegDate == null|| data.faultyRegDate == "") {
					$('#faultyRegDate').val(serverDate);
				} else {
					$('#faultyRegDate').val(moment(data.faultyRegDate).format('YYYY-MM-DD'));
				}
				$('#faultyStatus').val(data.faultyStatus);
				$('#faultyCause').val(data.faultyCause);
				$('#faultyAct').val(data.faultyAct);
				$('#faultyDept').val(data.faultyDept);
				$('#faultyNo').val(data.faultyNo);
				$('#faultyProg').val(data.faultyProg);
				$('#faultyImprv').val(data.faultyImprv);
				$('#faultyEffect').val(data.faultyEffect);

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
				(data.faultyFile1Nm == null || data.faultyFile1Nm == "")?$('#fpValue').text("파일을 선택해주세요"):$('#fpValue').text(data.faultyFile1Nm);
				$('#fpHref').attr('href','qm/downloadFile2?inSlipNo='+inSlipNo+'&inSlipSeq='+inSlipSeq+'&value=1&faultyTypeCd='+faultyTypeCd);
				
				//선택박스 처리
				selectBoxAppend(admDeptCode, "admDept",data.admDept, "");
			}
		});
	});
	

	// 등록폼
	$('#btnAdd').on('click', function() {

		if (sideView != "edit") {
			toastr.warning("부적합관리 등록할 항목을 선택해주세요.");
			return false;
		}

		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		//화면처리        
		uiProc(false);

		$('#admChargrNm').val(userNm);
		$('#admChargr').val(userNumber);

		$('#faultyRegDate').val(serverDate);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); // 수정버튼

		$('#fileSearch').removeClass('d-none');
		$('#fileSearch2').removeClass('d-none');
// 		$('#fileSearch7').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#btnFpFileDel2').removeClass('d-none');
// 		$('#btnFpFileDel7').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fileTag2').addClass('d-none');
// 		$('#fileTag7').addClass('d-none');
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("부적합관리 수정할 항목을 선택해주세요.");
			return false;
		}
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
		
		$('#fileSearch').removeClass('d-none');
		$('#fileSearch2').removeClass('d-none');
// 		$('#fileSearch7').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#btnFpFileDel2').removeClass('d-none');
// 		$('#btnFpFileDel7').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fileTag2').addClass('d-none');
// 		$('#fileTag7').addClass('d-none');
	});

	function deleteImg(value) {
		$.ajax({
			url : '<c:url  value="qm/itemFaultyImageDelete"/>',
			type : 'GET',
			data : {
				'value' : value,
				'inSlipNo' : inSlipNo,
				'inSlipSeq' : inSlipSeq,
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

				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// 저장 처리
	$('#btnSave').on('click',function() {

		//입력값 검사
		if (!$.trim($('#faultyStatus').val())) {
			toastr.warning('불량현상을 입력해주세요.');
			$('#faultyStatus').focus();
			return false;
		}

		/* if (!$.trim($('#faultyPcs').val())) {
			toastr.warning('부적합처리를 선택해주세요.');
			$('#faultyPcs').focus();
			return false;
		} */

		var formData = new FormData(document.getElementById("form"));
		formData.append('inSlipNo', inSlipNo);
		formData.append('inSlipSeq', inSlipSeq);
		formData.append('itemSeq', itemSeq);
		formData.append('admChargr', $('#admChargr').val());
		formData.append('faultyRegDate', $('#faultyRegDate').val().replace(/-/g, ''));
		formData.append('faultyTypeCd', faultyTypeCd);

		var url = '<c:url value="/qm/itemFaultyAdmCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/qm/itemFaultyAdmUpdate"/>';
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
					$('#itemFaultyTypeTable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					
					$('#fileSearch').addClass('d-none');
					$('#btnFpFileDel').addClass('d-none');
					$('#fileTag').removeClass('d-none');
					$('#fileSearch2').addClass('d-none');
					$('#btnFpFileDel2').addClass('d-none');
					$('#fileTag2').removeClass('d-none');
// 					$('#fileSearch7').addClass('d-none');
// 					$('#btnFpFileDel7').addClass('d-none');
// 					$('#fileTag7').removeClass('d-none');

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

	//부적합처리 선택시
	function faultyPcsChange(value){
		if(value==1){	//특채
			$('#pairCnt').val(faultyCnt);
			$('#faultyCnt').val(0);
			$('#faultyCnt').attr('disabled',true);
		}else{
			$('#faultyCnt').attr('disabled',false);
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

		$('#faultyChargrNm').val(userNm);
		$('#faultyChargr').val(userNumber);
		
		$('#pairCnt').val(faultyCnt);
		$('#faultyCnt').val(0);

		$('#faultyDate').val(serverDate);
		$('#returnDate').val(serverDate);
		$('#disuseDate').val(serverDate);
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
			if ($('#btnApprove').attr('class') == 'btn btn-primary float-right mr-1') {
				$('#approveSaveModal').modal('show');
				console.log("등록중입니다.");
				return false;
			}
		}
		
	});


	//저장버튼
	$('#btnDtlSave').on('click',function(){

		if($('input:radio[name=approvalYn]:checked').val()==null || $('input:radio[name=approvalYn]:checked').val()==""){
			toastr.warning("부적합처리를 선택해주세요.");
			return false;
		}

		
		if(btnView=="add"){
			url = '<c:url value="qm/itemFaultyJdgAdmCreate" />';
		}else{
			url = '<c:url value="qm/itemFaultyJdgAdmUpdate" />';
		}
		 
		$.ajax({
			url : url,
			type : 'GET',
			data : {
				'inSlipNo' : inSlipNo,
				'inSlipSeq' : inSlipSeq,
				'faultyPcs' : $('input[name=approvalYn]:checked').val(),
				'pairCnt' : $('#pairCnt').val(),
				'faultyCnt' : $('#faultyCnt').val(),
				'faultyDate'  :$('#faultyDate').val().replace(/-/g,''),
				'faultyChargr'  :$('#faultyChargr').val(),
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

					$('#itemFaultyAdmMasterTable').DataTable().ajax.reload(function(){});
					
				}else if(res.result=="excess"){
					toastr.warning("불량수량을 초과하였습니다.");
				}
				
				
				
			}
		})
		
	});

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=faultyCnt]", function(event){
		var faultyCntData = $(this).val();						//불량수량

		if(parseFloat(faultyCnt)<parseFloat(faultyCntData)){
			toastr.warning("불량수량을 초과하였습니다.");
			$(this).val("");
			$('#pairCnt').val(addCommas(faultyCnt));
			return false;
		}
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace(",", ""));
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			$('#pairCnt').val(addCommas(faultyCnt));
			event.preventDefault();
			return false;
		}else{
			$(this).val(addCommas($(this).val().replace(",", "")));
			$('#pairCnt').val(parseFloat(faultyCnt)-parseFloat($(this).val().replace(",", "")))
		}
		
	});


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
				'attachGubun' : "FI"
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

		formData.append("attachGubun", "FI");
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
	

	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<label class="input-label-sm">수입검사일자</label>'; 
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

	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
    html1 += '<select class="custom-select" id="approvalYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';

		
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right" id="printCnt" placeholder="매수" style="width:40px;" value="1">';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info" id="btnQAPrint">QA라벨발행</button>'
	html1 += '</div>';

	$('#itemFaultyAdmMasterTable_length').html(html1);
	$('#inspectDateFrom').val(serverDateFrom);
	$('#inspectDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#inspectDateFrom').val();
		serverDateTo = $('#inspectDateTo').val();
		approvalYnOption = $('#approvalYnOption option:selected').val();
		
		$('#itemFaultyAdmMasterTable').DataTable().ajax.reload(function() {});

	});
	
	//QA라벨발행 버튼 클릭시
	/* $(document).on('click','#btnQAPrint',function(){
		var count=0;

		$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
			if($('input[name=checkbox]').eq(index).is(':checked')) {

				count++;
			}
		});
		
		if(count == 0) {
			toastr.warning('구현중입니다.');
// 			toastr.warning('인쇄할 제품을 체크하고 인쇄해주세요.');
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
    }); */
    let printCnt = 0;
    //QA라벨인쇄 버튼 클릭
	$('#btnQAPrint').on('click',function(){
		printCnt = $('#printCnt').val();
		//예외처리
		if($('#printCnt').val()=="" || $('#printCnt').val()==0){
			toastr.warning("인쇄할 매수를 입력해주세요.");
			return false;
		}
		//테이블이 아무것도 선택되지 않았음을 tableIdx2가 null일 경우로 판단
		if( tableIdx2 == null ){
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		} else {
			
			var obj = new Object();

		    obj.itemCd = itemFaultyAdmMasterTable.row(tableIdx2).data().itemCd;
		    obj.itemNm = itemFaultyAdmMasterTable.row(tableIdx2).data().itemNm;
		    obj.faultyCnt = itemFaultyAdmMasterTable.row(tableIdx2).data().faultyCnt;
		    obj.faultyTypeDate = itemFaultyAdmMasterTable.row(tableIdx2).data().faultyTypeDate;
		    obj.inspectChargrNm = itemFaultyAdmMasterTable.row(tableIdx2).data().inspectChargrNm;
			if( itemFaultyAdmMasterTable.row(tableIdx2).data().faultyPcs != null){
		    	obj.faultyPcs = itemFaultyAdmMasterTable.row(tableIdx2).data().faultyPcs;
			} else{
				obj.faultyPcs = "처리중";
			}
		    obj.barcodeNo = itemFaultyAdmMasterTable.row(tableIdx2).data().barcodeNo; 

		    for( let i = 1; i <= printCnt; i++){
				labelPrint(obj,"")
			}
		}
	});
    
	function uiProc(flag) {
		$("#admDept").attr("disabled", flag);
		$("#btnAdmChargr").attr("disabled", flag);
		$("#faultyRegDateCalendar").attr("disabled", flag);
		$("#faultyStatus").attr("disabled", flag);

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
		$("#faultyCnt").attr("disabled", flag);
		//$("#itemFaultyJdgAdmTable").removeClass("d-none")
		$("#faultyDesc").attr("disabled", flag);
	}
	
</script>

<script>
//Do printing...
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
	      cmd += "{LC;0250,0035,0250,0320,0,5|}";
	      cmd += "{LC;0490,0180,0490,0320,0,5|}";
	      cmd += "{LC;0740,0180,0740,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0050,0090,0040,0040,01,0,00,B=품번|}";
	      cmd += "{PV23;0270,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
	      cmd += "{PV23;0050,0160,0040,0040,01,0,00,B=품명|}";
	      cmd += "{PV23;0270,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
	      cmd += "{PV23;0050,0230,0040,0040,01,0,00,B=불량수량|}";
	      cmd += "{PV23;0270,0230,0040,0040,01,0,00,B="+parseFloat(data.faultyCnt)+"|}";
	      cmd += "{PV23;0530,0230,0040,0040,01,0,00,B=불량등록일|}";
	      cmd += "{PV23;0760,0230,0040,0040,01,0,00,B="+moment(data.faultyTypeDate).format('YYYY-MM-DD')+"|}";
	      cmd += "{PV23;0050,0300,0040,0040,01,0,00,B=검사자|}";
	      cmd += "{PV23;0270,0300,0040,0040,01,0,00,B="+data.inspectChargrNm+"|}";
	      cmd += "{PV23;0530,0300,0040,0040,01,0,00,B=처리결과|}";
	      cmd += "{PV23;0760,0300,0040,0040,01,0,00,B="+data.faultyPcs+"|}";
	      cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.barcodeNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
	

	let webSocket = new WebSocket("ws://localhost:9998");
	
	// 웹소켓 연결
	function wsConnect() {
	   webSocket = new WebSocket("ws://localhost:9998");
	}
	
	// 웹소켓 상태확인
	function getWsStatus() {
	   return webSocket.readyState;
	}
	
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
	   toastr.success('인쇄 서버에 연결되었습니다.')
	   $('#wsStateView').text('연결됨');
	   $('#wsStateView').css('color','#19FF00');
	   wsState = true;
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
	   toastr.error('인쇄 서버가 종료되었습니다.')
	   $('#wsStateView').text('연결끊김');
	   $('#wsStateView').css('color','#FF0004');
	   wsState = false;
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
	   }
	}

</script>
</body>
</html>