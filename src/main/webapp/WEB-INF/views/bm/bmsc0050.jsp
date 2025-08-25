<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">BOM관리(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 50%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="itemInfoAdmTable" class="table table-bordered">
							<colgroup>
								<col width="3%">
								<col width="6%">
								<col width="20%">
								<col width="24%">
								<col width="5%">
								<col width="14%">
								<col width="14%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>LVL</th>
									<th>구분</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th>고객사</th>
									<th>ECO</th>
									<th>상태</th>
									<th>BOM유무</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 49%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()"> 
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<!-- <li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab2" id="equipTab">공정매칭</a></li> -->
							<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tab1" id="tab1Nav">기본정보</a></li>
							<li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab3" id="tab2Nav">BOM등록</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab4" id="tab3Nav">관련자료</a></li>
					</ul>
				</div>
				<!--====================TAB-UI=======================-->
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-2">
								<button type="button" class="btn btn-primary float-left d-none" id="btnCopy">복사</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave1">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">등록</button>
							</div>
							<form id="form1" enctype="multipart/form-data">
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>품번</th>
										<td>
											<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" style="min-width:100%" disabled>
											<input type="text" class="form-control" id="itemCd" name="itemCd" style="min-width:100%" disabled>
										</td>
										<th>품명</th>
										<td><input type="text" class="form-control" id="itemNm" name="itemNm" style="min-width:100%" disabled></td>
									</tr>
									<tr>
										<th>MAKER</th> 
										<td><input type="text" class="form-control" id="itemMaker" name="itemMaker" style="min-width:100%" disabled></td>
										<th>고객사</th>
										<td><input type="text" class="form-control" id="itemCus" name="itemCus" style="min-width:100%" disabled></td>
									</tr>
									<tr>
										<th>개발코드</th>
										<td>
											<input type="text" class="form-control" id="bomCd" name="bomCd" style="min-width:100%" maxlength="6" placeholder="한글,숫자,영문 6자리 내외" disabled>
										</td>
										<th>ECO</th>
										<td><input type="text" class="form-control" id="ecoCd" name="ecoCd" style="min-width:100%" disabled></td>
									</tr>
									<tr>
										<th>개발단가</th>
										<td><input type="text" class="form-control" style="text-align:right; min-width:100%;" id="devCost" name="devCost" value="0" disabled></td>
										<th>확정단가</th>
										<td><input type="text" class="form-control" style="text-align:right; min-width:100%;" id="confirCost" name="confirCost" value="0" disabled></td>
									</tr>
									<tr>
										<th>개발단계</th>
										<td><select class="custom-select" id="devStep" style="min-width:100%;"></select></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>시작일자</th>
										<td>
											<div class="form-group input-sub m-0" style="min-width:100%;">
												<input class="form-control" type="text" id="startDate" name="startDate" maxlength="10"  disabled />
												<button onclick="fnPopUpCalendar(startDate, startDate, 'yyyy-mm-dd')" class="btn btn-secondary input-sub-search"
													id="startDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
										<th>양산일자</th>
										<td>
											<div class="form-group input-sub m-0" style="min-width:100%;">
												<input class="form-control" type="text" id="complDate" name="complDate" maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(complDate, complDate, 'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="complDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="itemDesc" name="itemDesc" style="min-width : 100%">
										</td>
									</tr>
								</table>
								<table class="table table-bordered mt-1 d-none" id="changeHisTable">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>변경내역</th>
										<td colspan='3'><input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20"></td>
									</tr>
								</table>
							</form>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1" onclick="prcssAddOcl()" id="btnPrcssAdd">공정등록</button>
								<button type="button" class="btn btn-danger float-left ml-1" id="btnPrcssDel">삭제</button>
<!-- 								<button type="button" class="btn btn-primary float-right ml-1" id="btnPrcssSave">저장</button> -->
							</div>
							<table class="table table-bordered mt-2">
								<colgroup>
									<col width="20%"> 
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>품번</th>
									<td><input type="text" class="form-control" id="itemCd2" name="itemCd2" disabled></td>
									<th>품명</th>
									<td><input type="text" class="form-control" id="itemNm2" name="itemNm2" disabled></td>
								</tr>
							</table>
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="prcssCodeTable">
										<colgroup>
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>Master 공정코드</th>
												<th>Master 공정명</th>
												<th>Sub 공정코드</th>
												<th>Sub 공정명</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!--========tab3part=====-->
						<div class="tab-pane fade" id="tab3">
							<div style="display: flex;">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-left" id="btnDownAdd" style="border-radius: 0;" disabled>하위추가</button>
									<button type="button" class="btn btn-danger float-left" id="btnDownDel" style="border-radius: 0;" disabled>삭제</button>
								</div>
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnRouteSave">저장</button>
									<!-- <button type="button" class="btn btn-danger float-right ml-1" id="btnDownDel">삭제</button> -->
									<button type="button" class="btn btn-warning float-right ml-1" id="btnRouteEdit">수정</button>
									<!-- <button type="button" class="btn btn-primary float-right ml-1" id="btnDownAdd">하위추가</button> -->
									<button type="button" class="btn btn-primary float-right ml-1" id="btnRouteAdd">등록</button>
								</div>							
							</div>							
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemMotorEbomTable">
										<colgroup>
											<col width="9%">
											<col width="8%">
											<col width="22%">
											<col width="27%">
											<col width="6%">
											<col width="10%">
											<col width="14%">
										</colgroup>
										<thead>
											<tr>
												<th>LVL</th>
												<th>구분</th>
												<th>품번</th>
												<th>품명</th>
												<th>단위</th>
												<th>소요량</th>
												<th>사용공정</th>
											</tr>
										</thead>
									</table>
									<table class="table table-bordered d-none" id="itemMotorEbomTempTable">
										<colgroup>
											<col width="5%">
											<col width="8%">
											<col width="20%">
											<col width="28%">
											<col width="12%">
											<col width="7%">
											<col width="10%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<th>LVL</th>
												<th>구분</th>
												<th>품번</th>
												<th>품명</th>
												<th>차종</th>
												<th>단위</th>
												<th>소요량</th>
												<th>공정</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%"> 
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>품번</th>
									<td><input type="text" class="form-control" id="itemCd4" name="itemCd4" style="min-width: 100%;" disabled></td>
									<th>품명</th>
									<td><input type="text" class="form-control" id="itemNm4" name="itemNm4" style="min-width: 100%;" disabled></td>
								</tr>
							</table>
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnSave4">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnEtcDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1 d-none" id="btnEtcEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnEtcAdd">추가</button>
							</div>
							<form id="form4" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="equipFtInfo">
										<colgroup>
											<col width="10%">
											<col width="50%">
										</colgroup>
										<thead>
											<tr>
												<th>저장일자</th>
												<th>*도면자료</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right d-none ml-1" 
									id="btnSave5">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1"
									id="btnBomDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1 d-none"
								id="btnBomEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnBomAdd">추가</button>
							</div>
							<form id="form5" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="equipBomtable">
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="12%">
											<col width="10%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<th>개발단계</th>
												<th>*첨부자료</th>
												<th>승인일자</th>
												<th>승인여부</th>
												<th>승인</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab4 part=====-->

					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
			<!--===========================================-->
			<!-- /.card -->
			<!--===========================================-->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">공정정보관리 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>자산코드</th>
								<th>자산구분</th>
								<th>매입가</th>
								<th>설비코드</th>
								<th>설비명</th>
								<th>공정명</th>
								<th>규격</th>
								<th>제작일자</th>
								<th>제조사</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작일자</th>
								<th>제조사</th>
								<th>소모품</th>
								<th>규격</th>
								<th>구입처</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 제품 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="itemCdPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content" style="height: 850px;">
				<div class="modal-header">
					<h5 class="modal-title" id="itemCdPopUpLabel2">품목코드조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<div class="row">
						<button type="button" class="btn btn-primary" id="btnItemAdd">품목추가</button>
						&nbsp;&nbsp;&nbsp;
						<label class="input-label-sm"> 품목구분 </label>
						<select class="custom-select" id="itemGubun2" style="max-width: 80px;">
							<option value="003">반제품</option>
							<option value="004">자재</option>
							<option value="005">부자재</option>
						</select>
					</div>
					<div class="table-responsive">
					<table id="itemCdPopUpTable2" class="table table-bordered" style="width:100%">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="35%">
							<col width="25%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th><input type="checkbox" id="btnAllCheck"></th>
								<th>구분</th>
								<th>품번</th>
								<th class="text-center">품명</th>
								<th>단위</th>
								<th>공정</th>
							</tr>
						</thead>
					</table>
					</div>
					<hr class="text-secondary m-1">
					<button type="button" class="btn btn-danger" id="btnItemDel">품목삭제</button>
					<div class="table-responsive" style="max-height:240px">
					<table id="itemCdPopUpTempTable" class="table table-bordered" style="width:100%">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="35%">
							<col width="25%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th><input type="checkbox" id="btnAllCheck"></th>
								<th>구분</th>
								<th>품번</th>
								<th class="text-center">품명</th>
								<th>단위</th>
								<th>공정</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetItem">가져오기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품 모달 종료-->
	<!-- 경고창 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="deleteModalLabel">확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<h6>삭제를 하시게되면, 다른 제품/반제품에도 영향을 미칩니다.</h6> 
	      	<h6>정말 삭제하시겠습니까?</h6>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="deleteModalY" data-dismiss="modal">예</button>
	      	<button type="button" class="btn btn-danger" id="deleteModalN" data-dismiss="modal">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "50%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
		state = !state;
	});

	let menuAuth = 'bmsc0050';
	let currentHref = "bmsc0050";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","BOM관리(레이저)"); 
	
	//화면 설정
	uiProc(true);
	
	//변수 설정
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	
	var bomCd = null;
	var equipCd = null;
	var index = 0;
	var urlData = null;
	var buyAmtVal;
	var prcssCdVal = null;
	var corrRegDate = null;
	var baseInfoSeq = null;
	var isIdCheck = 1;
	var attachDataSeq = '';
	var tempNum;
	var prcssCd;
	var masterPrcssCd;
	var itemSeq;
	var upperItemSeq;
	var baseItemSeq;
	var fixItemSeq;		//왼쪽화면에서 선택한 itemSeq값

	var tempItemSeq;
	var tempUpperItemSeq;
	var checkBoxArray = ['1'];
	var checkBoxArray2 = ['1'];
	var checkBoxCheck = false;
	var attachGubun;
	var attachCd;
	var attachSeq;

	var mainGubunList = "001"
	var itemGubunList = "001";
	var itemGubunList2 = "003";
	var stateCdList = "";
	var tableIdx = null;
	var tableIdx2 = null;
	var itemLvl = null;
	var newItemLvl = null;
	var btnType = '';
	var bomYn=null;


	var itemSeqVal = null;
	var itemGubunVal = null;
	var itemCdVal  = null;
	var itemNmVal = null;
	var	itemMakerVal = null;
	var itemCusVal	= null;
	var itemUnitVal = null;
	var itemWorkplaceVal = null;
	
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	var serverDate = "${serverDateTo}";
	
	//공통코드
	var itemGubunCode = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunCode.push(json);
	</c:forEach>

	var stateCdCode = new Array();
	<c:forEach items="${stateCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	stateCdCode.push(json);
	</c:forEach>

	//BOM 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#btnSave1').addClass('d-none');
		$('#btnSave4').addClass('d-none');
		$('#btnSave5').addClass('d-none');
	});

	//관련자료 탭 클릭시
	$('#tab3Nav').on('click', function() {
		$('#btnSave1').addClass('d-none');
		$('#btnSave4').addClass('d-none');
		$('#btnSave5').addClass('d-none');
		
		$('#btnEtcAdd').attr('disabled', false);
		$('#btnEtcDel').attr('disabled', false);
		$('#btnBomAdd').attr('disabled', false);
		$('#btnBomDel').attr('disabled', false);
		
		$('#equipFtInfo').DataTable().ajax.reload();
		$('#equipBomtable').DataTable().ajax.reload();
		uiProc4(true);
	});

	
	var devStep = new Array();
	<c:forEach items = "${devStep}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	devStep.push(json);
	</c:forEach>

	//선택박스 처리
	selectBoxAppend(devStep, "devStep", "", 2);
	
	//진행 확인 버튼 
	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnSave1').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDownDel').attr('disabled', false);

		//개발관리
		$('#btnRouteSave').addClass('d-none');
		$('#btnRouteAdd').attr('disabled', false);
		$('#btnRouteEdit').attr('disabled', false);
		
		//변경이력
 		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});

	
	//기본정보 목록
	let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+"<'row'<'col-sm-12 col-md-5 mt-3 text-left'B><'col-sm-12 col-md-2 mt-2 text-center'p><'col-sm-12 col-md-5 text-right'i>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : function(){return itemGubunList;},
				'mainGubun' : function(){return '001'},
				'stateCd' : function(){return stateCdList;},
			},
		},
		rowId : 'bomCd',
		columns : [ 
			{
				render : function(data,type,row,meta){
					return '0';
				}
			}, 
			{
				data : 'itemGubunNm',
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
				data : 'itemUnitNm',
				'className' : 'text-center'
			}, 
			{
				data : 'itemCusNm',
				'className' : 'text-center'
// 				data : 'bomCd',
// 				'className' : 'text-center'
			}, 
			{
				data : 'ecoCd',
				'className' : 'text-center'
// 				data : 'devCost',
// 				render : function(data, type, row){
// 					return data != null ? addCommas(data) : '';
// 				}
			}, 
			{
				data : 'stateCdNm',
				'className' : 'text-center'
			}, 
			{
				data : 'bomYn',
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '개발관리',
		}, {
			extend : 'excel',
			title : '개발관리',
		}, {
			extend : 'print',
			title : '개발관리',
		}, ],
	});

	//itemInfoAdmTable 테이블의 itemInfoAdmTable_length 추가
	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm"> 품목구분 </label>';
	html1 += '<select class="custom-select" id="itemGubun">';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">상태</label>';
	html1 += '<select class="custom-select" id="stateCdOption" onChange="stateOnchange()">';
	html1 += '</select>';
	html1 += '</div>';

	$('#itemInfoAdmTable_length').html(html1);
	
	selectBoxAppend(itemGubunCode, "itemGubun", "", "");
	selectBoxAppend(stateCdCode, "stateCdOption", "", "1");
	
	//품목구분 변경시
	$('#itemGubun').on('change',function(){
		itemGubunList = $('#itemGubun option:selected').val();
		$('#itemInfoAdmTable').DataTable().ajax.reload();
	});

	//품목구분 변경시
	$('#stateCdOption').on('change',function(){
		stateCdList = $('#stateCdOption option:selected').val();
		$('#itemInfoAdmTable').DataTable().ajax.reload();
	});

	// 기본정보 수정버튼
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("등록할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);

		$('#btnArAdd').attr('disabled', false);
		$('#btnArDel').attr('disabled', false);
		
		$('#mfcDate').attr('disabled', true);
		$('#ancDate').attr('disabled', true);
		$('#equipTab').addClass('disabled');
		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		
		$('#btnSave1').removeClass('d-none');
		
		//변경이력
 		$('#changeHisTable').removeClass('d-none');
	});

	//기본정보 저장
	$('#btnSave1').on('click', function() {
		
		if (!$.trim($('#itemSeq').val())) {
			toastr.warning('품번을 입력해 주세요.');
			$('#btnItemCd').focus();
			return false;
		}
		
		if ($('#devCost').val().substr(0,$('#devCost').val().indexOf(".")).length > 10) {
			toastr.error('개발단가가 너무 큽니다. (백억 이상)');
			$('#devCost').val(0);
			$('#devCost').focus();
			return false;
		}
		
		if ($('#confirCost').val().substr(0,$('#confirCost').val().indexOf(".")).length > 10) {
			toastr.error('확정단가가 너무 큽니다. (백억 이상)');
			$('#confirCost').val(0);
			$('#confirCost').focus();
			return false;
		}
		
		if (sideView == "add") {
// 			url = '<c:url value="/bm/prcssBomCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bm/itemPartAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'bomCheck' : 'true',
				'itemSeq' : itemSeq,
				'bomCd' : $('#bomCd').val(),
				'ecoCd' : $('#ecoCd').val(),
				'devCost' : $('#devCost').val().replace(/,/g,''),
				'confirCost' : $('#confirCost').val().replace(/,/g,''),
				'devStep' : $('#devStep').val(),
				'startDate' : $('#startDate').val().replace(/-/g,''),
				'complDate' : $('#complDate').val().replace(/-/g,''),
				'itemDesc' : $('#itemDesc').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					$('#itemInfoAdmTable').DataTable().ajax.reload();
					$('#devCost').val(ouputNumberAutoComma($('#devCost').val()));
					$('#confirCost').val(ouputNumberAutoComma($('#confirCost').val()));
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				uiProc(true);
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnSave1').addClass('d-none');
			}
		});
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			var url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
			});
		}else{
			$('#changeHisTable').addClass('d-none');
		}
		
		sideView = 'add';
		
	});


	//개발관리 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var itemInfoAdmHtml = '';

		$.ajax({
			url: '<c:url value="/bm/itemMotorEbomList"/>',
            type: 'GET',
            data: {
            	'itemSeq'	:	itemSeq,
            	'itemLvl'	: 	"0"
            },
            async: false,
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	itemInfoAdmHtml	 = '<table class="table table-bordered" style="background:#f9d13042;">';
                	itemInfoAdmHtml	+= '	<thead class="thead-light">';
                	itemInfoAdmHtml	+= '		<tr>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">LVL</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">구분</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">품번</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">품명</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">단위</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">소요량</th>';
        			itemInfoAdmHtml	+= '			<th style="background:#f8c73bd1;">사용공정</th>';
        			itemInfoAdmHtml	+= '		</tr>';
        			itemInfoAdmHtml	+= '	</thead>';
        			itemInfoAdmHtml	+= '	<tbody>';
                    for(var i=0;i<data.length;i++) {
                    	itemInfoAdmHtml	+= '		<tr>';
                    	itemInfoAdmHtml	+= '			<td class="text-left-td" style="font-weight: 900;">'+('&nbsp;').repeat(parseInt(data[i].itemLvl)*2)+data[i].itemLvl+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-center-td">'+data[i].itemGubun+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-center-td">'+data[i].itemCd+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-center-td">'+data[i].itemNm+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-center-td">'+data[i].itemUnit+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-right-td">'+ouputNumberAutoComma(data[i].itemConsumpt)+'</td>';
            			itemInfoAdmHtml	+= '			<td class="text-center-td">'+data[i].prcssCd+'</td>';
            			itemInfoAdmHtml	+= '		</tr>';
                    }
                    itemInfoAdmHtml	+= '	</tbody>';
                    itemInfoAdmHtml	+= '</table>';
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return itemInfoAdmHtml;
	}
	//개발관리 상세내역 끝
	
	//기본정보 상세정보 보기
	$('#itemInfoAdmTable tbody').on('click','tr',function() {

		$('#tab1Nav').tab('show');
		if ($('#btnSave1').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($('#btnRouteSave').attr('class') == 'btn btn-primary float-right ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
 			return false;
		} else {
			$('#itemInfoAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		fixItemSeq = itemInfoAdmTable.row(this).data().itemSeq;
		itemSeq = itemInfoAdmTable.row(this).data().itemSeq;
		bomYn = itemInfoAdmTable.row(this).data().bomYn;
		upperItemSeq = 0;
		tableIdx2=null;
		
		$('#equipFtInfo').DataTable().ajax.reload();	//관련자료-도면 새로고침
		$('#equipBomtable').DataTable().ajax.reload();	//관련자료-첨부 새로고침
		
		//저장 버튼 disabled
		$('#btnSave4').addClass('d-none');
		$('#btnSave5').addClass('d-none');
		$('#btnDownAdd').attr('disabled',true);
		$('#btnChange').attr('disabled',true);

		$('#btnRouteAdd').attr('disabled',false);
		$('#btnRouteEdit').attr('disabled',false);

		
		$.ajax({
			url : '<c:url value="bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return itemSeq;},
			},
			success : function(res) {
				let data = res.data;
				
				if (res.result == 'ok') {
					$('#itemSeq').val(data.itemSeq);
					$('#itemCd').val(data.itemCd);
					$('#itemNm').val(data.itemNm);
					$('#itemCus').val(data.itemCusNm);
					$('#itemMaker').val(data.itemMaker);
					
					$('#bomCd').val(data.bomCd);
					$('#ecoCd').val(data.ecoCd);
					$('#devCost').val(data.devCost != null ? ouputNumberAutoComma(data.devCost) : '0');
					$('#confirCost').val(data.confirCost != null ? ouputNumberAutoComma(data.confirCost) : '0');
					$('#startDate').val(data.startDate != null && data.startDate != 'Invalid date' && data.startDate != '' ? moment(data.startDate).format('YYYY-MM-DD') : '');
					$('#complDate').val(data.complDate != null && data.complDate != 'Invalid date' && data.complDate != '' ? moment(data.complDate).format('YYYY-MM-DD') : '');
					$('#itemDesc').val(data.itemDesc);
					
					//관련자료 상세보기
					$('#itemCd2').val(data.itemCd);
					$('#itemNm2').val(data.itemNm);
					$('#itemCd3').val(data.itemCd);
					$('#itemNm3').val(data.itemNm);
					$('#itemCd4').val(data.itemCd);
					$('#itemNm4').val(data.itemNm);


					if (bomYn=="Y") {
						$('#itemMotorEbomTable').DataTable().ajax.reload(function(){
							$('input[name=itemConsumpt]').attr('disabled',true);
						});

						$('#btnRouteAdd').attr('disabled',true);
						$('#btnRouteEdit').attr('disabled',false);
						
					} else {
						//BOM 테이블 행 추가
						$('#itemMotorEbomTable').DataTable().clear().draw();

						$('#itemMotorEbomTable').DataTable().row.add({
							'itemSeq' 	: data.itemSeq,
							'upperItemSeq' : '0',
							'itemLvl' 	: '0',
							'itemGubun' : data.itemGubunNm,
							'itemCd' 	: data.itemCd,
							'itemNm' 	: data.itemNm,
							'itemUnit'	: data.itemUnitNm,
							'itemConsumpt' 	: '0',
							'prcssCd' 	: data.itemWorkplace,
						}).draw(false); 
					

						$('input[name=itemConsumpt]').attr('disabled',true);
						$('#btnRouteAdd').attr('disabled',false);
						$('#btnRouteEdit').attr('disabled',true);
					}

					
					//선택박스 처리
					selectBoxAppend(devStep, "devStep", data.devStep, "2");
	
					//화면처리
					sideView = 'edit';
					uiProc(true);
					$('#btnSave1').addClass('d-none'); // 저장버튼
					$('#btnAdd').attr('disabled', false); //생성버튼
					$('#btnEdit').attr('disabled', false); //수정버튼
					$('#equipTab').removeClass('disabled');
					$('#tab2Nav').removeClass('disabled');
					$('#tab3Nav').removeClass('disabled');
				} else {
					toastr.error(res.message);
				}
			}
		});

		var tr = $(this).closest('tr');
        var row = itemInfoAdmTable.row( tr );
        var idx = $.inArray( tr.attr('id'), detailRows );

        if ( row.child.isShown() ) {
            tr.removeClass( 'details' );
            row.child.hide();
 
            // Remove from the 'open' array
            detailRows.splice( idx, 1 );
        }
        else {
            tr.addClass( 'details' );
            row.child( format( row.data() ) ).show();
 
            // Add to the 'open' array
            if ( idx === -1 ) {
                detailRows.push( tr.attr('id') );
            }
        }
	});

	itemInfoAdmTable.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } );
	

	//BOM 목록
	let itemMotorEbomTable = $('#itemMotorEbomTable').DataTable({	
		dom : "",
		destroy : true,
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 100000000,
		scrollY: "500px",
		scrollCollapse: true, 
		ajax : {
			url : '<c:url value="/bm/itemMotorEbomList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function() {return itemSeq;},
			},
		},
		columns : [
			{
				data : 'itemLvl',
				render : function(data,type,row,meta){
					var html="";
					let hyphenCount = 0;
					if(data!=null){
						hyphenCount = parseInt(data)*2;
						html += '<input type="text" class="form-control route-border2" name="itemLvl" value="'+(' ').repeat(hyphenCount)+data+'" style="font-weight: 900;" disabled>';
					}else{
						hyphenCount = parseInt(itemLvL)*2;
						html += '<input type="text" class="form-control route-border2" name="itemLvl" value="'+(' ').repeat(hyphenCount)+itemLvL+'" style="font-weight: 900;" disabled>';
					}
					return html;
				}
			},
			{
				data : 'itemGubun',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemGubun" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemGubun" value="'+itemGubun+'" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemCd',
				render : function(data,type,row,meta){
					var html='';
					if(data!=null){
						html += '<input type="text" class="form-control route-border" name="itemCd" value="'+data+'" disabled>';
						if(btnView!="edit"){
							html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">';
							html += '<input type="hidden" name="upperItemSeq" value="'+row['upperItemSeq']+'">';
						}else{
							html += '<input type="hidden" name="itemSeq" value="'+itemSeq+'">';
							html += '<input type="hidden" name="upperItemSeq" value="'+upperItemSeq+'">';
						}
					}else{
						html += '<input type="text" class="form-control route-border" name="itemCd" value="'+itemCd+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+itemSeq+'">';
						html += '<input type="hidden" name="upperItemSeq" value="'+upperItemSeq+'">';
					}

					return html;
				},
				'className' : 'text-center'
			},
			{
				data : 'itemNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemNm" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemNm" value="'+itemNm+'" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemUnit',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemUnit" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemUnit" value="" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemConsumpt',
				render : function(data,type,row,meta){
					if(data!=null){
						/* if (btnView!="edit") {
							return '<input type="text" class="form-control text-right" name="itemConsumpt" value="'+addCommas(data)+'" disabled>';
						} else {
							return '<input type="text" class="form-control text-right" name="itemConsumpt" value="'+addCommas(data)+'">';
						} */
						if(row['itemLvl']=="0"){
							return '<input type="text" class="form-control text-right" name="itemConsumpt" value="1" style="background:white; border:none;" disabled>';
						}else{
							return '<input type="text" class="form-control text-right" name="itemConsumpt" value="'+ouputNumberAutoComma(data)+'">';
						}
					}else{
						return '<input type="text" class="form-control text-right" name="itemConsumpt" value="">';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'prcssCd',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="prcssCd" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="prcssCd" value="">';
					}
				},
				'className' : 'text-center'
			} 
		],
		drawCallback: function(settings) {
			//uiProc3(true);
			$('.route-border').css({"text-align":"center","background":"white","border":"none"});
			$('.route-border2').css({"text-align":"left","background":"white","border":"none"});
        }, 
	});

	//BOM temp 목록
	let itemMotorEbomTempTable = $('#itemMotorEbomTempTable').DataTable({	
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/prcssCodeEbomList"/>',
			type : 'GET',
			data : {
				'bomCd' : function() {return bomCd;}
			},
		},
		columns : [
			{
				data : 'itemLvl',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemLvl" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemLvl" value="'+itemLvL+'" disabled>';
					}
				}
			},
			{
				data : 'itemGubun',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemGubun" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemGubun" value="'+itemGubun+'" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemCd',
				render : function(data,type,row,meta){
					var html='';
					if(data!=null){
						html += '<input type="text" class="form-control route-border" name="itemCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+tempItemSeq+'">';
						html += '<input type="hidden" name="upperItemSeq" value="'+tempUpperItemSeq+'">';
					}else{
						html += '<input type="text" class="form-control route-border" name="itemCd" value="'+itemCd+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+tempItemSeq+'">';
						html += '<input type="hidden" name="upperItemSeq" value="'+tempUpperItemSeq+'">';
					}

					return html;
				},
				'className' : 'text-center'
			},
			{
				data : 'itemNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemNm" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemNm" value="'+itemNm+'" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemUnit',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="itemUnit" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemUnit" value="'+itemUnit+'" disabled>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'itemConsumpt',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control text-right" name="itemConsumpt" value="'+addCommas(data)+'">';
					}else{
						return '<input type="text" class="form-control text-right" name="itemConsumpt" value="">';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'prcssCd',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control route-border" name="prcssCd" value="'+data+'" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="prcssCd" value="">';
					}
				},
				'className' : 'text-center'
			} 
		],
		drawCallback: function(settings) {
			//uiProc3(true);
			$('.route-border').css({"text-align":"center","background":"white","border":"none"});
        }, 
	});

	//BOM 데이터 클릭 시
	$('#itemMotorEbomTable tbody').on('click','tr',
	function() {
		if ($(this).hasClass('selected')) {
 			//$(this).removeClass('selected');
		} else {
			$('#itemMotorEbomTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx2 = $('#itemMotorEbomTable').DataTable().row(this).index();
		itemSeq = $('#itemMotorEbomTable tbody tr').eq(tableIdx2).find('td input[name=itemSeq]').val();
		upperItemSeq = $('#itemMotorEbomTable tbody tr').eq(tableIdx2).find('td input[name=upperItemSeq]').val();
		itemGubun = $('#itemMotorEbomTable tbody tr').eq(tableIdx2).find('td input[name=itemGubun]').val();
		itemLvl = $('#itemMotorEbomTable tbody tr').eq(tableIdx2).find('td input[name=itemLvl]').val();
	});

	
	// BOM 등록버튼
	$('#btnRouteAdd').on('click', function() {
		$('#btnRouteEdit').attr('disabled',true);   //수정 버튼 비활성화
		$('#btnRouteSave').removeClass('d-none');	//저장 버튼 활성화
		$('#btnDownAdd').attr('disabled', false);	//하위추가 버튼 활성화
		$('#btnChange').attr('disabled', false);	//변경버튼 활성화
		$('#btnDownDel').attr('disabled', false);		//삭제버튼 활성화

		btnView = 'edit';
		$('input[name=itemConsumpt]').attr('disabled',false);
		$('input[name=itemConsumpt]').eq(0).attr('disabled',true);
	});

	// BOM 수정버튼
	$('#btnRouteEdit').on('click', function() {
		$('#btnRouteAdd').attr('disabled',true);   //수정 버튼 비활성화
		$('#btnRouteSave').removeClass('d-none');	//저장 버튼 활성화
		$('#btnDownAdd').attr('disabled', false);	//하위추가 버튼 활성화
		$('#btnChange').attr('disabled', false);	//변경버튼 활성화
		$('#btnDownDel').attr('disabled', false);		//삭제버튼 활성화

		btnView = 'edit';
		
		$('input[name=itemConsumpt]').attr('disabled',false);
		$('input[name=itemConsumpt]').eq(0).attr('disabled',true);
	});
	

	//하위추가 버튼 클릭 시
	$('#btnDownAdd').on('click',function(){
		if(tableIdx2==null){
			toastr.warning("하위추가할 항목을 선택해주세요.");
			return false;
		}

		if(itemGubun=='자재' || itemGubun=='부자재'){
			toastr.warning("자재 또는 부자재에는 하위추가할 수 없습니다.");
			return false;
		}
		
		btnType='down';
		baseItemSeq = itemSeq;
		upperItemSeq = itemSeq;
		
		$('#itemCdPopUpModal2').modal('show');

		$('#itemCdPopUpTable2').DataTable().ajax.reload(function(){
			setTimeout(function() {
				itemCdPopUpTable2.draw();
				itemCdPopUpTable2.draw();
	        }, 300);
		});
		$('#itemCdPopUpTempTable').DataTable().ajax.reload(function(){
			setTimeout(function() {
				itemCdPopUpTempTable.draw();
				itemCdPopUpTempTable.draw();
	        }, 300);
		});
		
	});

	var rowArr = [];
	//삭제 버튼 클릭 시
	$('#btnDownDel').on('click',function(){
		var check=true;
		
		if(tableIdx2==null){
			toastr.warning("삭제할 항목을 선택해주세요.");
			check=false;
			return false;
		}

		if(itemLvl=="0"){
			toastr.warning("Lvl이 0인 품목은 삭제할 수 없습니다. 확인해주세요.");
			check=false;
			return false;
		}
		
		if(check){
			console.log("itemLvl:"+itemLvl)
			console.log("tableIdx2:"+tableIdx2)
			console.log("itemLvl:"+itemLvl)
			console.log("upperItemSeq:"+upperItemSeq)
			$.ajax({
				url : '<c:url value="bm/itemMotorEbomDelete"/>',
				type : 'GET',
				data : {
					'itemLvl' : function(){return itemLvl;},
					'itemSeq' : function(){return itemSeq;},
					'upperItemSeq' : function(){return upperItemSeq;},
				},
				success : function(res) {
					console.log(res.result);
					if(res.result=="ok"){
						console.log('시작');
						
						rowArr.push(tableIdx2);
						for(var i=tableIdx2+1; i<itemMotorEbomTable.data().count(); i++){
							console.log("for문 1번째 : i:"+i)
							if(itemLvl < $('#itemMotorEbomTable tbody tr').eq(i).find('input[name=itemLvl]').val()){
								console.log("i:"+i);
								rowArr.push(i);
								
							}else{
								break;
							}
						}
						
						$('#itemMotorEbomTable').DataTable().rows(rowArr).remove().draw();
						console.log(rowArr);
						rowArr=[];
					}else if(res.result=="over"){

						$('#deleteModal').modal('show');
					}else {
						toastr.error(res.message);
					}
				}
			}); 
		}
	});

	//경고창 팝업시 '예' 버튼 클릭시
	$('#deleteModalY').on('click',function(){
		console.log("itemLvl:"+itemLvl)
		console.log("tableIdx2:"+tableIdx2)
		console.log("itemLvl:"+itemLvl)
		console.log("upperItemSeq:"+upperItemSeq)
		$.ajax({
			url : '<c:url value="bm/itemMotorEbomDelete2"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return itemSeq;},
				'upperItemSeq' : function(){return upperItemSeq;},
			},
			success : function(res) {
				console.log(res.result);
				if(res.result=="ok"){
					console.log('시작');
					
					rowArr.push(tableIdx2);
					for(var i=tableIdx2+1; i<itemMotorEbomTable.data().count(); i++){
						console.log("for문 1번째 : i:"+i)
						if(itemLvl < $('#itemMotorEbomTable tbody tr').eq(i).find('input[name=itemLvl]').val()){
							console.log("i:"+i);
							rowArr.push(i);
							
						}else{
							break;
						}
					}
					
					$('#itemMotorEbomTable').DataTable().rows(rowArr).remove().draw();
					console.log(rowArr);
					rowArr=[];
				}else {
					toastr.error(res.message);
				}
			}
		}); 
	});


	//저장버튼 클릭 시 
	$('#btnRouteSave').on('click',function(){
		var dataArray = new Array();		
		var check=true;  		

		if ($('#mainGubun option:selected').val()=="001") {	
			if(itemMotorEbomTable.data().count()>2){
				toastr.warning('사출 제품인 경우 하위자재는 1개만 등록 하실 수 있습니다.');	
				check=false;
				return false;
			}	
		}  
		
		$('#itemMotorEbomTable tbody tr').each(function(index, item){
			if ($(this).find("td input[name=itemConsumpt]").val() == "") {		
				toastr.warning('소요량을 입력해주세요');	
				$(this).find("td input[name=itemConsumpt]").focus();
				check=false;
				return false;
			} 

			/* if ($(this).find("td input[name=prcssCd]").val() == "") {		
				toastr.warning('공정을 등록해주세요');	
				$(this).find("td button[name=prcssCd]").focus();
				check=false;
				return false;
			}   */
		});
		
		$('#itemMotorEbomTable tbody tr').each(function(index, item){
			var rowData = new Object();

			rowData.itemSeq = $(this).find("td input[name=itemSeq]").val();
			rowData.upperItemSeq = $(this).find("td input[name=upperItemSeq]").val();
			rowData.itemConsumpt = $(this).find("td input[name=itemConsumpt]").val().replace(/,/g,'');
			rowData.prcssCd = ""
			rowData.itemGubun = $(this).find("td input[name=itemGubun]").val();
			
	        dataArray.push(rowData);
	        console.log(dataArray)
		});

		if(check == true){
			$.ajax({
				url : '<c:url value="bm/itemMotorEbomCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend:function(){
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {

						$('#btnRouteAdd').attr('disabled',false);
						$('#btnRouteEdit').attr('disabled',false);
						$('#btnDownAdd').attr('disabled',true);
						$('#btnChange').attr('disabled',true);
						$('#btnDownDel').attr('disabled',true);
						$('#btnRouteSave').addClass('d-none');

						itemSeq = fixItemSeq;
						
						$('#itemMotorEbomTable').DataTable().ajax.reload(function(){
							$('input[name=itemConsumpt]').attr('disabled',true);
						});

						$('#itemInfoAdmTable').DataTable().ajax.reload(function() {});
						btnView='';
						
						toastr.success('저장되었습니다.');
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
		
	});
	
	
	//관련자료-도면자료 목록
	let equipFtInfo = $('#equipFtInfo').DataTable({
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
				'attachCd' : function(){return itemSeq;},
				'attachGubun' : function(){return 'DR';},
			},
		},
		columns : [
					{
						data : 'attachRegDate',
						render : function(data, type, row, meta) {
							tempNum = meta.row + meta.settings._iDisplayStart + 1;
							if (data != null) {
								var dateData = moment(data).format('YYYY-MM-DD');
								var html = '<div class="form-group input-sub m-0 row">'
								html += '<input class="form-control" type="text" value="'+dateData+'" id="attachDrDate'+tempNum+'" name="attachDrDate" disabled/>';
								html += '<button onclick="fnPopUpCalendar(attachDrDate'+tempNum+',attachDrDate'+tempNum+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"';
								html += 'id="attachDrDateCalendar'+tempNum+'" type="button" disabled>';
								html += '<span class="oi oi-calendar"></span>';
								html += '</button>';
								html += '</div>';
								return html;
							} else {
								var html = '<div class="form-group input-sub m-0 row">'
									html += '<input class="form-control" type="text" value="'+serverDate+'" id="attachDrDate'+tempNum+'" name="attachDrDate" disabled/>';
									html += '<button onclick="fnPopUpCalendar(attachDrDate'+tempNum+',attachDrDate'+tempNum+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"';
									html += 'id="attachDrDateCalendar'+tempNum+'" type="button">';
									html += '<span class="oi oi-calendar"></span>';
									html += '</button>';
									html += '</div>';
								return html;
							}
						}
					},
					{
						data : 'attachFn',
						render : function(data, type, row, meta) {
							if (data != null) {
								var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+itemSeq+'&attachGubun=DR">'+data+'</a>';
								return html;
							} else {
								var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
								html += '<input type="file" class="custom-file-input" id="fileDrNm'+tempNum+'" name="fileNm">';
								html += '<label class="custom-file-label" for="fileDrNm'+tempNum+'"></label>';
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

	var tempView1 = 'add';
	var tempView2 = 'add';
	//관련자료-도면 데이터 클릭 시
	$('#equipFtInfo tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView1 = "add";
		} else {
			$('#equipFtInfo').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#equipFtInfo').DataTable().row(this).index();
		baseInfoSeq = equipFtInfo.row(tableIdx).data().attachSeq;
		tempView1 = "edit";
	});
	
	//관련자료-첨부자료 목록
	let equipBomtable = $('#equipBomtable').DataTable({
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
				'attachCd' : function(){return itemSeq;},
				'attachGubun' : function(){return 'BO';},
			},
		},
		columns : [
					{
						data : 'etc1Nm',
						render : function(data, type, row, meta) {
							tempNum = meta.row + meta.settings._iDisplayStart + 1;
							if (data != null) {
								return '<input type="text" class="form-control" name="etc1Nm" style="text-align:center" value="'+data+'" disabled />';
							} else {
								return '<select class="custom-select" id="etc1'+tempNum+'" name="etc1" ></select>';
							}
						}
					},
					{
						data : 'attachFn',
						render : function(data, type, row, meta) {
							if (data != null) {
								var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+itemSeq+'&attachGubun=BO">'+data+'</a>';
								return html;
							} else {
								var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
								html += '<input type="file" class="custom-file-input" id="fileBoNm'+tempNum+'" name="fileNm">';
								html += '<label class="custom-file-label" for="fileBoNm'+tempNum+'"></label>';
								html += '</div></form>';
								return html;
							}
						}
					},
					{
						data : 'attachRegDate',
						render : function(data, type, row, meta) {
							if (data != null) {
								var html = '<div class="form-group input-sub m-0 row">'
								html += '<input class="form-control" type="text" value="'+data+'" id="attachBoDate'+tempNum+'" name="attachBoDate" disabled/>';
								html += '<button onclick="fnPopUpCalendar(attachBoDate'+tempNum+',attachBoDate'+tempNum+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"';
								html += 'id="attachBoDateCalendar'+tempNum+'" name="attachBoDateCalendar" type="button">';
								html += '<span class="oi oi-calendar"></span>';
								html += '</button>';
								html += '</div>';
								return html;
							} else {
								var html = '<div class="form-group input-sub m-0 row">'
									html += '<input class="form-control" type="text" value="'+serverDate+'" id="attachBoDate'+tempNum+'" name="attachBoDate" disabled/>';
									html += '<button onclick="fnPopUpCalendar(attachBoDate'+tempNum+',attachBoDate'+tempNum+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"';
									html += 'id="attachBoDateCalendar'+tempNum+'" name="attachBoDateCalendar" type="button">';
									html += '<span class="oi oi-calendar"></span>';
									html += '</button>';
									html += '</div>';
								return html;
							}
						}
					},
					{
						data : 'etc2',
						render : function(data, type, row, meta) {
							if (data != null) {
								return '<input type="text" class="form-control" style="text-align:center" name="etc2" value="'+data+'" disabled />';
							} else {
								return '<input type="text" class="form-control" style="text-align:center" name="etc2" value="미승인" disabled/>';
							}
						}
					},
					{
						data : 'etc2',
						render : function(data, type, row, meta) {
							if (data == '미승인') {
								return '<button type="button" class="btn btn-success" style="min-width:100%" name="btnApp" onclick="approveClick('+tempNum+')">승인</button>';
							} else {
								return '<button type="button" class="btn btn-success" style="min-width:100%" name="btnApp" disabled>승인</button>';
							}
						}
					},
				],
		order : [ [ 0, 'asc' ], ],
		drawCallback: function(settings) {
			for(var i = 1; i<=tempNum; i++){
				selectBoxAppend(devStep, "etc1"+i, "", "2");
// 				var tempNameData = $("#etc1"+i).attr('name');
// 				selectBoxAppend(devStep, "etc1"+i, tempNameData, "2");
// 				$("#etc1"+i).attr('name', 'etc1');
			}
        }, 
	});


	//관련자료-첨부 데이터 클릭 시
	$('#equipBomtable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView2 = "add";
		} else {
			$('#equipBomtable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#equipBomtable').DataTable().row(this).index();
		baseInfoSeq = equipBomtable.row(tableIdx).data().attachSeq;
		tempView2 = "edit";
	});
	
	
	function approveClick(approveNum){
		approveNum--;
		attachGubun = equipBomtable.row(approveNum).data().attachGubun;
		attachCd = equipBomtable.row(approveNum).data().attachCd;
		attachSeq = equipBomtable.row(approveNum).data().attachSeq;
		
		$.ajax({
			url : '<c:url value="/bm/attachApproveUpdate"/>',
			type : 'POST',
			async : false,
			data : {
				'attachGubun' : attachGubun,
				'attachCd' : attachCd,
				'attachSeq' : attachSeq,
				'etc2' : '승인',
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('승인되었습니다.');
					$('#equipBomtable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
			}
		});
	}

	

	//관련자료-도면 추가버튼
	$('#btnEtcAdd').on('click', function() {
		sideView = 'add';
		$('#equipFtInfo').DataTable().row.add({}).draw(false);
		
		if (equipFtInfo.data().count() > 0) {
			$('#btnSave4').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnEtcAdd').attr('disabled', true);
		$('#btnEtcDel').attr('disabled', true);
		//btnView = '';
	});
	
	//관련자료-첨부 추가버튼
	$('#btnBomAdd').on('click', function() {
		sideView = 'add';
		$('#equipBomtable').DataTable().row.add({}).draw(false);
		
		if (equipBomtable.data().count() > 0) {
			$('#btnSave5').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnBomAdd').attr('disabled', true);
		$('#btnBomDel').attr('disabled', true);
		//btnView = '';
	});
	

	// 관련자료 수정버튼
	$('#btnEtcEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		console.log(tableIdx);
		$('input[name=baseInfoFtCd]').eq(tableIdx).attr('disabled',false);
		$('input[name=baseInfoFtNm]').eq(tableIdx).attr('disabled',false);
		$('input[name=baseInfoFtDesc]').eq(tableIdx).attr('disabled',false);
		//btnView = '';
		$('#btnSave4').removeClass('d-none');
	});

	
	
	//관련자료-도면 삭제버튼
	$('#btnEtcDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 도면자료 항목을 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'DR';},
					'attachCd' : function(){return itemSeq;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#equipFtInfo').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#equipFtInfo').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});
	
	//관련자료-첨부 삭제버튼
	$('#btnBomDel').on('click', function() {
		if (tempView2 != 'edit') {
			toastr.warning('삭제할 첨부자료 항목을 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'BO';},
					'attachCd' : function(){return itemSeq;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#equipBomtable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#equipBomtable').DataTable().rows(tableIdx).remove().draw();
		}
		
		tempView2 = 'add';

	});

	

	// 관련자료-도면 저장
	$('#btnSave4').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipFtInfo tbody tr').each(function(index, item) {
			index++;
			if($("#fileDrNm"+index).val() != null && $("#fileDrNm"+index).val() != 'undefined' && $("#fileDrNm"+index).val() != ''){
				//값 있나없나 검사
				if (equipFtInfo.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						check = false;
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'DR',
						'attachCd' : function(){return itemSeq;}
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				formData.append('attachSeq', attachDataSeq);
				attachRegDateValue = $('#attachDrDate' + index).val();
				formData.append('attachRegDate', attachRegDateValue);
	
				formData.append('attachCd', itemSeq);
				formData.append('path', fileDate);
				formData.append('contents', '');
				formData.append('attachGubun', 'DR');
				formData.append('idCheck', 'DR');
				
				index--;
				
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
							// 보기
							toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#equipFtInfo').DataTable().ajax.reload();
						uiProc4(true);
						$('#btnSave4').addClass('d-none');
						$('#btnEtcAdd').attr('disabled', false);
						$('#btnEtcDel').attr('disabled', false);
						btnView = "";
					}
				});
			}
			
		});
		
	});
	
	// 관련자료-첨부 저장
	$('#btnSave5').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipBomtable tbody tr').each(function(index, item) {
			index++;


			if (!$.trim($('select[name=etc1]').val())) {
				toastr.warning('개발단계를 선택해주세요.');
				$(this).find("td input[name=etc1]").focus();
				check = false;
				return false;
			}
			
			if($("#fileBoNm"+index).val() != null && $("#fileBoNm"+index).val() != 'undefined' && $("#fileBoNm"+index).val() != ''){
				//값 있나없나 검사
				console.log($("#fileBoNm"+index).val());
				if (equipBomtable.data().count() != 0) {
				
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						check = false;
						return false;
						
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'BO',
						'attachCd' : function(){return itemSeq;}
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
	
				attachRegDateValue = $('#attachBoDate' + index).val();
				formData.append('path', fileDate);
				formData.append('attachCd', itemSeq);
				formData.append('attachSeq', attachDataSeq);
				formData.append('attachRegDate', attachRegDateValue);
				formData.append('contents', '');
				formData.append('etc1', $(this).find("td select[name=etc1]").val());
				formData.append('etc2', '미승인');
				formData.append('attachGubun', 'BO');
				formData.append('idCheck', 'BO');
				
				index--;
				
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
							// 보기
							toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#equipBomtable').DataTable().ajax.reload();
						uiProc5(true);
						$('#btnSave5').addClass('d-none');
						$('#btnBomAdd').attr('disabled', false);
						$('#btnBomDel').attr('disabled', false);
						btnView = "";
					}
				});
			}
			
		});
		
	});
	
	
	//기본정보 화면설정
	function uiProc(flag) {
		$("#bomCd").attr("disabled", flag);
		$("#ecoCd").attr("disabled", flag);
		$("#btnItemCd").attr("disabled", flag);
		$("#devCost").attr("disabled", flag);
		$("#confirCost").attr("disabled", flag);
		$("#devStep").attr("disabled", flag);
		$("#startDateCalendar").attr("disabled", flag);
		$("#complDateCalendar").attr("disabled", flag);
		$("#itemDesc").attr("disabled", flag);
	}


	//관련자료-도면 화면설정
	function uiProc4(flag) {
		$('input[name=baseInfoFtCd]').attr("disabled", flag);
		$('input[name=baseInfoFtNm]').attr("disabled", flag);
		$('input[name=baseInfoFtDesc]').attr("disabled", flag);
	}
	
	//관련자료-첨부 화면설정
	function uiProc5(flag) {
		$('input[name=etc1]').attr("disabled", flag);
		$('button[name=attachBoDateCalendar]').attr("disabled", flag);
		$('button[name=btnApp]').attr("disabled", flag);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//품목 기본 테이블
	let itemCdPopUpTable2 = $('#itemCdPopUpTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		lengthChange : false,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : "350px",
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : function(){return itemGubunList2;},
				'mainGubun' : function(){return '001';},
			}
		},
		columns : [ 
			{
				render : function(data, type, row, meta){
					return '<input type="checkbox" class="" name="check" >';
				}
			}, 
			{ data : 'itemGubunNm',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemGubun" value="'+data+'" style="min-width: 100%;" disabled>';
				}
			}, 
			{ data : 'itemCd',
				render : function(data, type, row, meta){
					var html="";
					html += '<input type="text" class="form-control route-border" name="itemCd" value="'+data+'" style="min-width: 100%;" disabled>';
					html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'" style="min-width: 100%;">';
					return html;
				}
			}, 
			{ data : 'itemNm',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemNm" value="'+data+'" style="min-width: 100%;" disabled>';
			    }
			},
			{ data : 'itemUnitNm',
				render : function(data, type, row, meta){
					if(data!=null){
				    	return '<input type="text" class="form-control route-border" name="itemUnit" value="'+data+'" style="min-width: 100%;" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemUnit" value="-" style="min-width: 100%;" disabled>';
					}
				}
			}, 
			{ data : 'itemWorkplace',
				render : function(data, type, row, meta){
					if(data!=null){
				    	return '<input type="text" class="form-control route-border" name="itemWorkplace" value="'+data+'" style="min-width: 100%;" disabled>';
					}else{
						return '<input type="text" class="form-control route-border" name="itemWorkplace" value="-" style="min-width: 100%;" disabled>';
					}
				}
			}, 
			{ data : 'itemGubunNm'}, 
			{ data : 'itemCd'}, 
			{ data : 'itemNm'},
			{ data : 'itemModelNm'}, 
			{ data : 'itemUnitNm'}, 
			{ data : 'itemWorkplace'}, 
		],
		columnDefs : [ 
			{"targets" : '_all',"className" : "text-center"},
			{"targets": [6,7,8,9,10,11], "visible": false}
		],
		drawCallback: function(settings) {
			$('.route-border').css({"text-align":"center","background":"white","border":"none"});
        }, 
		order : [ [ 0, 'asc' ] ],
	});


	//품목행 더블클릭시 
	$('#itemCdPopUpTable2 tbody').on('dblclick','tr',function(){
		console.log('dblclick start');
		var check=true;

		//중복체크
		var seq1 =  $(this).find('input[name=itemSeq]').val();
		var overItemCd =  $(this).find('input[name=itemCd]').val();
		
		if (itemCdPopUpTempTable.data().count()>0) {
			$('#itemCdPopUpTempTable tbody tr').each(function(index2, item2) {
				var seq2 = $(this).find('input[name=itemSeq]').val();
				
				if(seq1==seq2){
					toastr.warning("이미 등록된 품목번호("+overItemCd+")입니다.");
					check=false;
					return false;
				}else{
					check=true;
				}
			});
		}  
		
		//픔목 하단 테이블 행 추가
		if(check){
			itemSeqVal = $(this).find('input[name=itemSeq]').val();
			itemGubunVal = $(this).find('input[name=itemGubun]').val();
			itemCdVal  = $(this).find('input[name=itemCd]').val();
			itemNmVal = $(this).find('input[name=itemNm]').val();
			itemUnitVal = $(this).find('input[name=itemUnit]').val();
			itemWorkplaceVal = $(this).find('input[name=itemWorkplace]').val();
			
			$('#itemCdPopUpTempTable').DataTable().row.add({}).draw(false);
		}
	});

	
	//품목코드 temp 테이블
	var itemCdPopUpTempTable = $('#itemCdPopUpTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		lengthChange : false,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 100000,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmTempList"/>',
			type : 'GET',
			data : {
			}
		},
		columns : [ 
			{
				render : function(data, type, row, meta){
					return '<input type="checkbox" class="" name="check2">';
				}
			}, 
			{ data : 'itemGubun',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemGubun" value="'+itemGubunVal+'" style="min-width: 100%;" disabled>';
				}
			}, 
			{ data : 'itemCd',
				render : function(data, type, row, meta){
					var html="";
					html += '<input type="text" class="form-control route-border" name="itemCd" value="'+itemCdVal+'" style="min-width: 100%;" disabled>';
					html += '<input type="hidden" name="itemSeq" value="'+itemSeqVal+'" style="min-width: 100%;">';
					return html;
				}
			}, 
			{ data : 'itemNm',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemNm" value="'+itemNmVal+'" style="min-width: 100%;" disabled>';
			    }
			},
			{ data : 'itemUnit',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemUnit" value="'+itemUnitVal+'" style="min-width: 100%;" disabled >';
				}
			}, 
			{ data : 'itemWorkplace',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control route-border" name="itemWorkplace" value="'+itemWorkplaceVal+'" style="min-width: 100%;" disabled>';
				}
			}, 
		],
		columnDefs : [ 
			{"targets" : '_all',"className" : "text-center"},
		],
		drawCallback: function(settings) {
			$('.route-border').css({"text-align":"center","background":"white","border":"none"});
        }, 
		order : [ [ 0, 'asc' ] ],
	});

	//품목 상단 전체선택 
	$('#btnAllCheck').on('click',function(){
		if ($('#btnAllCheck').is(":checked")) {
			$('input[name=check]').prop('checked',true);
		} else {
			$('input[name=check]').prop('checked',false);
		}
	});

	//품목 하단 전체선택 
	$('#btnAllCheck2').on('click',function(){
		if ($('#btnAllCheck2').is(":checked")) {
			$('input[name=check2]').prop('checked',true);
		} else {
			$('input[name=check2]').prop('checked',false);
		}
	});

	

	//품목추가 버튼 클릭 시 
	$('#btnItemAdd').on('click',function(){
		var check=true;
		
		$('#itemCdPopUpTable2 tbody tr').each(function(index, item) {
			if($(this).find('input[name=check]').is(":checked")){

				//중복체크
				var seq1 =  $(this).find('input[name=itemSeq]').val();
				var overItemCd =  $(this).find('input[name=itemCd]').val();
				
				if (itemCdPopUpTempTable.data().count()>0) {
					$('#itemCdPopUpTempTable tbody tr').each(function(index2, item2) {
						var seq2 = $(this).find('input[name=itemSeq]').val();
						
						if(seq1==seq2){
							toastr.warning("이미 등록된 품목번호("+overItemCd+")입니다.");
							check=false;
							return false;
						}else{
							check=true;
						}
					});
				}  
				
				//픔목 하단 테이블 행 추가
				if(check){
					itemSeqVal = $(this).find('input[name=itemSeq]').val();
					itemGubunVal = $(this).find('input[name=itemGubun]').val();
					itemCdVal  = $(this).find('input[name=itemCd]').val();
					itemNmVal = $(this).find('input[name=itemNm]').val();
					itemUnitVal = $(this).find('input[name=itemUnit]').val();
					itemWorkplaceVal = $(this).find('input[name=itemWorkplace]').val();
					
					$('#itemCdPopUpTempTable').DataTable().row.add({}).draw(false);
				}
			}
		});

		$('#btnAllCheck').prop('checked',false);	//전체선택 해제
	});

	//품목삭제 버튼 클릭 시 
	$('#btnItemDel').on('click',function(){
		var arr = [];
		$('#itemCdPopUpTempTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check2]').is(":checked") == true) {
				arr.push(index);
			}
		});

		$('#itemCdPopUpTempTable').DataTable().rows(arr).remove().draw();	
		$('#btnAllCheck2').prop('checked',false);	//전체선택 해제
	});

	//품목구분 변경시
	$('#itemGubun2').on('change',function(){
		itemGubunList2 = $('#itemGubun2 option:selected').val();
		
		$('#itemCdPopUpTable2').DataTable().ajax.reload();
	});
	

	//가져오기 버튼 클릭 시
	$('#btnGetItem').on('click',function(){
		var check=true;
		var rowCount = itemCdPopUpTempTable.data().count();
		if (rowCount==0){
			toastr.warning("품목을 추가해주세요.");
			return false;
		}

		//중복체크
		if (rowCount>0) {
			$('#itemCdPopUpTempTable tbody tr').each(function(index, item) {
				var seq1 = $(this).find('input[name=itemSeq]').val();
				var overItemCd = $(this).find('input[name=itemCd]').val();
				
				
				$('#itemMotorEbomTable tbody tr').each(function(index2, item2) {
					var seq2 = $(this).find('input[name=itemSeq]').val();
					console.log('seq1:'+seq1);
					console.log('seq2:'+seq2);
					
					if(seq1==seq2){
						$('input[name=check2]').eq(index).prop('checked',true);
						toastr.warning("이미 등록된 품목번호("+overItemCd+")입니다.");
						check=false;
						return false;
					}
				});
			});
		} 
		
		if(check){

			var startIdx = tableIdx2+1;
			var endIdx = itemMotorEbomTable.data().count();
			var idxArr = [];

			//temp테이블에 행 추가
			for(var i=startIdx; i<endIdx; i++){
				console.log("startIdx:"+startIdx);
				console.log("endIdx:"+endIdx);
				console.log("index"+i);

				tempItemSeq = $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemSeq]').val(),
				tempUpperItemSeq = $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=upperItemSeq]').val(),
				
				//BOM 테이블 행 추가
				$('#itemMotorEbomTempTable').DataTable().row.add({
					'itemLvl' 	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemLvl]').val(),
					'itemGubun' : $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemGubun]').val(),
					'itemCd' 	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemCd]').val(),
					'itemNm' 	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemNm]').val(),
					'itemUnit'	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemUnit]').val(),
					'itemConsumpt'	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=itemConsumpt]').val(),
					'prcssCd'	: $('#itemMotorEbomTable tbody tr').eq(i).find('td input[name=prcssCd]').val(),
				}).draw(false);

				idxArr.push(i);
			}

			$('#itemMotorEbomTable').DataTable().rows(idxArr).remove().draw();
			
			newItemLvl = btnType=="same"?parseInt(itemLvl):parseInt(itemLvl)+1;
			$('#itemCdPopUpTempTable tbody tr').each(function(index, item) {

				upperItemSeq = baseItemSeq;
				itemSeq = $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemSeq]').val();

				//BOM 테이블 행 추가
				$('#itemMotorEbomTable').DataTable().row.add({
					'itemLvl' 	: newItemLvl,
					'itemGubun' : $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemGubun]').val(),
					'itemCd' 	: $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemCd]').val(),
					'itemNm' 	: $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemNm]').val(),
					'itemUnit'	: $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemUnit]').val(),
					'prcssCd'	: $('#itemCdPopUpTempTable tbody tr').eq(index).find('td input[name=itemWorkplace]').val(),
				}).draw(false);


				console.log(itemSeq)
				
				//반제품중 ebom에 등록되었다면, 해당 목록도 같이 삽입한다.
				$.ajax({
					url: '<c:url value="/bm/itemMotorEbomList"/>',
		            type: 'GET',
		            data: {
		            	'upperItemSeq'	:	itemSeq,
		            },
		            async: false,
		            success: function (res) {
		                var data = res.data;
		                if(res.result == 'ok') {
			                
		                	for(var i=0;i<data.length;i++) {

		                		itemSeq = data[i].itemSeq;
		                		upperItemSeq = data[i].upperItemSeq;

		                		console.log("i:"+i)
		                		console.log("newItemLvl:"+newItemLvl)
			                	console.log("itemSeq:"+itemSeq)
			                	console.log("upperItemSeq:"+upperItemSeq)
			                	
			                	$('#itemMotorEbomTable').DataTable().row.add({
			    					'itemLvl' 	: parseInt(data[i].itemLvl)+newItemLvl+1,
			    					'itemGubun' : data[i].itemGubun,
			    					'itemCd' 	: data[i].itemCd,
			    					'itemNm' 	: data[i].itemNm,
			    					'itemUnit'	: data[i].itemUnit,
			    					'itemConsumpt'	: data[i].itemConsumpt,
			    					'prcssCd'	: data[i].prcssCd,
			    				}).draw();
		                	}
			                
			            } else {
			            	toastr.error(res.message);
			            }
			        }
				});
					
			});

			
			var endIdx2 = itemMotorEbomTempTable.data().count();
			
			//temp테이블 -> 기존테이블 행 추가
			for(var i=0; i<endIdx2; i++){

				itemSeq = $('#itemMotorEbomTempTable tbody tr').eq(i).find('td input[name=itemSeq]').val();
				upperItemSeq = $('#itemMotorEbomTempTable tbody tr').eq(i).find('td input[name=upperItemSeq]').val();
				
				//BOM 테이블 행 추가
				$('#itemMotorEbomTable').DataTable().row.add({
					'itemLvl' 	: itemMotorEbomTempTable.row(i).data().itemLvl,
					'itemGubun' : itemMotorEbomTempTable.row(i).data().itemGubun,
					'itemCd' 	: itemMotorEbomTempTable.row(i).data().itemCd,
					'itemNm' 	: itemMotorEbomTempTable.row(i).data().itemNm,
					'itemUnit'	: itemMotorEbomTempTable.row(i).data().itemUnit,
					'itemConsumpt'	: itemMotorEbomTempTable.row(i).data().itemConsumpt,
					'prcssCd'	: itemMotorEbomTempTable.row(i).data().prcssCd,
				}).draw(false);
			}

			$('#itemMotorEbomTempTable').DataTable().clear().draw();

			
			$('#itemCdPopUpModal2').modal('hide'); 

			newItemLvl=itemLvl;
		}
		
	});
	
	
	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=devCost],input[name=confirCost],input[name=itemConsumpt]", function(event){
		$(this).val(inputNumberAutoComma($(this).val()));
	}); 
	
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnView == "") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnView == "edit") {
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
	
</script>
</body>
</html>
