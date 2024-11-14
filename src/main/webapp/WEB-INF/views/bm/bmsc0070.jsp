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
				<li class="breadcrumb-item active">계측기관리(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 52%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div> 
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="measureInstrmtTable" class="table table-bordered">
							<colgroup>
								<col width="9%">
								<col width="9%">
								<col width="23%">
								<col width="10%">
								<col width="10%">
								<col width="9%">
								<col width="9%">
								<col width="11%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>관리번호</th>
									<th>기기번호</th>
									<th>계측기명</th>
									<th>규격</th>
									<th>교정주기</th>
									<th>최근교정일</th>
									<th>차기교정일</th>
									<th>제작회사</th>
									<th>위치</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 47%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item">
								<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab4Nav" data-toggle="tab" href="#tab4">교정이력사항</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab3Nav" data-toggle="tab" href="#tab3">관련자료</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab5Nav" data-toggle="tab" href="#tab5">계측기 게이지 R&R</a>
							</li>	
						</ul>
						<!-- /.nav-tabs -->
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-lg table-bordered mb-2">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>*관리번호</th>
												<td><input type="text" class="form-control" id="admNo" name="admNo" style="min-width:100%" disabled></td>
												<th>*기기번호</th>
												<td><input type="text" class="form-control" id="mitNo" name="mitNo" style="min-width:100%"></td>
											</tr>
											<tr>
												<th>사용팀</th>
												<td><select class="custom-select" id="admDept" name="admDept" style="min-width:100%"></select></td>
												<th>관리책임자</th>
												<td><input type="text" class="form-control" id="mainChargr" name="mainChargr" style="min-width:100%"></td>
											</tr>
											<tr>												
												<th>*계측기명</th>
												<td>
													<input type="text" class="form-control" id="mitNm" name="mitNm" style="max-width: 100%">
												</td>
												<th>*교정주기</th>
												<td><select class="custom-select" id="corrCycle" style="min-width:100%"></select></td>
											</tr>
											<tr>												
												<th>*교정횟수</th>
												<td style="position: relative;">
													<input type="text" class="form-control" id="corrCount" name="corrCount" value="0" 
														style="text-align: right; padding-right: 2rem; min-width:100%;">
													<span style="display: block; position: absolute; top: 5px; right: 10px; height: 1.5rem; line-height: 1.5rem;">회</span>
												</td>
												<th>형식</th>
												<td><input type="text" class="form-control" id="mitForm" name="mitForm" style="min-width:100%"></td>
											</tr>
											<tr>												
												<th>기기종류</th>
												<td><select class="custom-select" id="mitKind" style="min-width:100%"></select></td>
												<th>*규격</th>
												<td><input type="text" class="form-control" id="modelNm" name="modelNm" style="min-width:100%"></td>
											</tr>
											<tr>
												<th>*제작회사</th>
												<td><input type="text" class="form-control" id="mfcCorpNm" name="mfcCorpNm" style="min-width:100%"></td>
												<th>취득일자</th>
												<td>
													<input class="form-control" type="date" id="acqDate" name="acqDate" style="min-width:100%" disabled />
												</td>
											</tr>
											<tr>												
												<th>취득가</th>
												<td>
													<input type="text" class="form-control" id="acqCost" name="acqCost" value="0" style="text-align: right; min-width:100%;">
												</td>
												<th>사용여부</th>
												<td><select class="custom-select" id="useYn" name="useYn" style="min-width:100%"></select></td>
											</tr>
											<tr>												
												<th>*위치</th>
												<td><input type="text" class="custom-select" id="mitLoc" name="mitLoc" style="min-width:100%"></td>
												<th>비고</th>
												<td colspan="3">
													<input type="text" class="form-control" id="mitDesc" name="mitDesc" style="max-width: 100%">
												</td>
											</tr>											
										<tr>
											<td colspan="2" style="text-align: center">사진</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src="" onClick="imgShow(imgSrc1)"
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd1"
															name="imgAdd1" onchange="imageThum()"> <label
															id="imgName1" class="custom-file-label" for="imgAdd1"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" id="btnFileDelete" class="btn" onclick="deleteImage();">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										</thead>
									</table>
									
									<form id="form4" method="post" enctype="multipart/form-data">
										<table class="table table-bordered d-none" id="corrDataListTable">
											<colgroup>
												<col width="21%">
<%-- 												<col width="21%"> --%>
												<col width="11%">
												<col width="16%">
												<col width="31%">
											</colgroup>
											<thead class="thead-light">
												<tr>
													<th>교정일자</th>
													<th>차기 예정 교정일자</th>
													<th>작성자</th>
													<th>근거 성적서 번호</th>
													<th>첨부파일</th>
												</tr>
											</thead>
										</table>
									</form>
								</div>
							</form>
<!-- 							<hr> -->
<!-- 							<form id="formCorre" method="post" enctype="multipart/form-data"> -->
<!-- 								<div class="card-body col-sm-12 p-1 mb-2"> -->
<!-- 									<button type="button" class="btn btn-warning float-right mr-1" id="btnCorrDel" disabled>삭제</button> -->
<!-- 									<button type="button" class="btn btn-primary float-right mr-1" id="btnCorrEdit" disabled>수정</button> -->
<!-- 									<button type="button" class="btn btn-primary float-right mr-1" id="btnCorrAdd" disabled>추가</button> -->
									<!-- <div class="form-group input-sub m-0 row">
										<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select" style="max-width: 80px;" onchange="corrYearChange()"></select>
									</div> -->
<!-- 								</div> -->
<!-- 								<table class="table table-lg table-bordered mb-2" id=""> -->
<%-- 									<colgroup> --%>
<%-- 										<col width="20%"> --%>
<%-- 										<col width="30%"> --%>
<%-- 										<col width="20%"> --%>
<%-- 										<col width="30%"> --%>
<%-- 									</colgroup> --%>
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th>교정일자</th> -->
<!-- 											<td><input type="date" class="form-control" id="corrDate" disabled></td> -->
<!-- 											<th>차기교정일자</th> -->
<!-- 											<td><input type="date" class="form-control" id="corrWillDate" disabled></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th>근거성적서번호</th> -->
<!-- 											<td><input type="text" class="form-control" id="corrNo" disabled></td> -->
<!-- 											<td colspan="2"> -->
<!-- 												<div class="row"> -->
<!-- 													<div class="custom-file d-none" id="fileSearch" style="width: 90%;"> -->
<!-- 														<input type="file" class="custom-file-input" id="fileNm1" name="fileNm1" value="" >  -->
<!-- 														<label class="custom-file-label" id="fpValue" for="fileNm1">파일을선택해주세요</label> -->
<!-- 													</div> -->
<!-- 													<div class="rightsidebar-close d-none" id="btnFpFileDel" -->
<!-- 														style="width: 10%;"> -->
<!-- 														<button type="button" class="btn" onClick="fileDelete()"> -->
<!-- 															<i class="mdi mdi-close"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> 첨부파일1 -->
<!-- 												<div class="form-group m-0 mr-2 row p-0 " id="fileTag"> -->
<!-- 													<a href="#" id="fpHref"><span id="fpFn"></span></a> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody id="dataInsert"></tbody> -->
<!-- 								</table> -->
<!-- 							</form> -->
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnAttachDataSave">저장</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnAttachDataDelete">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachDataAdd">추가</button>
							</div>
							<!--저장 버튼-->
							<div class="table-responsive">
								<form id="form3" method="post" enctype="multipart/form-data">
									<table class="table table-bordered"
										id="measureInstrmAttachTable">
										<colgroup>
											<col width="7%">
											<col width="18%">
											<col width="10%">
											<col width="32%">
											<col width="32%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>No.</th>
												<th>일자</th>
												<th>등록자</th>
												<th>내용</th>
												<th>*첨부파일</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
									</table>
								</form>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="card-body col-sm-12 p-1 mb-2 d-none">
									<button type="button" class="btn btn-primary float-right d-none" id="btnCorrSave">저장</button>
									<button type="button" class="btn btn-warning float-right mr-1" id="btnCorrDel">삭제</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnCorrEdit">수정</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnCorrAdd">추가</button>
								</div>
							<div class="table-responsive">
								<table class="table table-bordered" id="corrDataListTabTable">
									<colgroup>
<%-- 											<col width="5%"> --%>
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="15%">
<%-- 											<col width="30%"> --%>
									</colgroup>
									<thead class="thead-light">
										<tr>
<!-- 												<th>순번</th> -->
											<th>교정일자</th>
											<th>실행일자</th>
											<th>작성자</th>
											<th>근거 성적서 번호</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered" id="corrDataFileTable">
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="tab5">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnAttachData2Save">저장</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnAttachData2Delete">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachData2Add">추가</button>
							</div>
							<!--저장 버튼-->
							<div class="table-responsive">
								<form id="form3" method="post" enctype="multipart/form-data">
									<table class="table table-bordered"
										id="measureInstrmAttach2Table">
										<colgroup>
											<col width="7%">
											<col width="18%">
											<col width="10%">
											<col width="32%">
											<col width="32%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>No.</th>
												<th>일자</th>
												<th>등록자</th>
												<th>내용</th>
												<th>*첨부파일</th>
											</tr>
										</thead>
										<tbody id="data2List"></tbody>
										<tbody id="data2Insert"></tbody>
									</table>
								</form>
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
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">계측기 엑셀조회</h5>
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
								<th>관리번호</th>
								<th>기기번호</th>
								<th>계측기명</th>
								<th>규격</th>
								<th>교정주기</th>
								<th>교정횟수</th>
								<th>제작회사</th>
								<th>위치</th>
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
	<!-- /.page-wrapper -->
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "52%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let menuAuth = 'bmsc0070';
	let currentHref = "bmsc0070";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","계측기관리(레이저)"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';

	
	var serverDate =  "${serverDateTo}";
    
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";
	var urlData = null;
	var mitCdVal = null;
	var corrDateVal = null;
	var tableIdx = null;
	var corrSeqVal = null;
	var tempCorrWillDate = serverDate;
	/* var mainGubunList = ''; */
	var editCheck = false;
	uiProc(true);
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	//공통코드 처리 시작      
	var mitGubunCode = new Array();
	<c:forEach items="${mitGubun}" var="info"> //계측기구분
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitGubunCode.push(json);
	</c:forEach>

	var mitUnitCode = new Array();
	<c:forEach items="${mitUnit}" var="info">	//단위
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitUnitCode.push(json);
	</c:forEach>

	var mitLocCode = new Array();
	<c:forEach items="${mitLoc}" var="info">	//장비위치
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitLocCode.push(json);
	</c:forEach>

	var useFqyCode = new Array();
	<c:forEach items="${useFqy}" var="info">	//사용빈도
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useFqyCode.push(json);
	</c:forEach>

	var admDeptCode = new Array();
	<c:forEach items="${admDept}" var="info">	//부서
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var mitKind = new Array();
	<c:forEach items="${mitKind}" var="info">	//기기종류
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitKind.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">	//사용여부
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	var corrCycleCode = new Array();
	<c:forEach items="${corrCycle}" var="info">	//교정주기
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	corrCycleCode.push(json);
	</c:forEach>
	
	//공통코드 처리 종료   

	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	//선택박스 처리
	selectBoxAppend(mitGubunCode, "mitGubun", "", "2");
	selectBoxAppend(mitUnitCode, "mitUnit", "", "2");
	selectBoxAppend(mitLocCode, "mitLoc", "", "2");
	selectBoxAppend(useFqyCode, "useFqy", "", "2");
	selectBoxAppend(admDeptCode, "admDept", "", "2");
	selectBoxAppend(mitKind, "mitKind", "", "2");	
	selectBoxAppend(useYnCode, "useYn", "", "");	
	selectBoxAppend(corrCycleCode, "corrCycle", "", "2");	
	/* selectBoxAppend(mainGubunArray, "mainGubun", "", "2"); */
	
	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
	         this.reset();
	         $('input[type=hidden]').val('');
	    });
		$('#measureInstrmtTable').DataTable().$('tr.selected').removeClass('selected');
		$('#tab1Nav').tab('show');
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAttachDataSave').addClass('d-none');
		$('#btnCorrSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnCorrAdd').attr('disabled', true);	
		$('#btnCorrEdit').attr('disabled', true);
		$('#btnCorrDel').attr('disabled', true);
		$('#corrDate').attr('disabled', true);
		$('#corrWillDate').attr('disabled', true);
		$('#fileSearch').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#fileTag').removeClass('d-none');

		$('#imgAdd1').val(null);
		$('#imageFile1').attr("src", null);
		$('#imgName1').text(null);
		
		$('#corrDataListTable').addClass('d-none');
	});
	
	$('#btnSave').addClass('d-none');
	$("#dealCorpNm").attr("disabled", true);


	// 목록
	let measureInstrmtTable = $('#measureInstrmtTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false, 
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/measureInstrmtAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : '001',
				'corrGubun' : function(){return '001';},
			},
		},
		rowId : 'mitCd',
		columns : [ 
			{//관리번호
				data : 'admNo'
			}, 
			{//기기번호
				data : 'mitNo'
			}, 
			{//계측기명
				data : 'mitNm'
			}, 
			{//규격
				data : 'modelNm'
			}, 
			{//교정주기
				render: function(data, type, row, meta) {
					return row['corrCount'] + '회 / ' + row['corrCycleNm'];
				}
			}, 
			{//최근교정일
				data : 'mitCorrDate'
			},
			{//차기교정일
				data : 'mitCorrWillDate'
			},
			{//제작회사
				data : 'mfcCorpNm'
			}, 
			{//위치
				data : 'mitLoc'
			}, 
		],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '계측기관리(레이저)'
		}, 'print' ],
// 		drawCallback : function() {
//         	var api = this.api();
//         	for(var i = 0; i < api.data().count(); i++) {
//         		if (api.row(i).data().useYn == '002'){
//         			$('#'+api.row(i).data().admNo).find("td").eq(0).css("color", "red");
//             	}
//         	}
//         }
	});


	

	
	// 계측기관리 기본정보 보기
	$('#measureInstrmtTable tbody').on('click', 'tr',function() {
		if($('#btnSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnAttachDataSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnCorrSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#measureInstrmtTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		$('#tab1Nav').tab('show');

		mitCdVal = measureInstrmtTable.row(this).data().mitCd;

		//화면처리
		uiProc(true);
		$("#tab2Nav").removeClass('disabled');
		$("#tab3Nav").removeClass('disabled');
		$("#tab4Nav").removeClass('disabled');
		$("#tab5Nav").removeClass('disabled');
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼

		$('#fileSearch').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#fileTag').removeClass('d-none');

		mitCdVal = measureInstrmtTable.row(this).data().mitCd;
		tableIdx = null;
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/measureInstrmtAdmRead"/>',
			type : 'GET',
			data : {
				'mitCd' : function(){ return mitCdVal;}
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				$('#admNo').val(data.admNo);
				$('#mitNm').val(data.mitNm);
				$('#modelNm').val(data.modelNm);
				$('#mfcCorpNm').val(data.mfcCorpNm);
				$('#mitUnit').val(data.mitUnit);
				$('#mitNo').val(data.mitNo);
				$('#corrOrgan').val(data.corrOrgan);
				
				if(data.acqDate == 'undefined' || data.acqDate == null || data.acqDate == ''){
					$('#acqDate').val('');
				}else{
					$('#acqDate').val(moment(data.acqDate).format('YYYY-MM-DD'));
				}
				
				$('#mitBase').val(data.mitBase);
				$('#mainChargr').val(data.mainChargr);
				$('#mitDesc').val(data.mitDesc);
				$('#corrCount').val(rmDecimal(data.corrCount));
				$('#mitForm').val(data.mitForm);
				$('#mitLoc').val(data.mitLoc);
				$('#acqCost').val(rmDecimal(data.acqCost));

				//선택박스 처리
				selectBoxAppend(mitGubunCode, "mitGubun", data.mitGubun, "2");
				selectBoxAppend(mitUnitCode, "mitUnit", data.mitUnit, "2");
				selectBoxAppend(mitLocCode, "mitLoc", data.mitLoc, "2");
				selectBoxAppend(useFqyCode, "useFqy", data.useFqy, "2");
				selectBoxAppend(admDeptCode, "admDept", data.admDept, "2");
				selectBoxAppend(mitKind, "mitKind",data.mitKind, "2");	
				selectBoxAppend(useYnCode, "useYn", data.useYn, "");	
				selectBoxAppend(corrCycleCode, "corrCycle", data.corrCycle, "");
				if (data.imageFile1 != '' && data.imageFile1 != null) {
					$('#imageFile1').attr("src","data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
					
					imgSrc1 = data.imageFile1;
				} else {
					$('#imageFile1').attr("src","");
					$('#imgName1').text('');
					
					imgSrc1 = '';
				}
			}
		});

		btnView='';
		//$('#corrDataListTable').DataTable().ajax.reload(function(){});

		//교정사항 이력
		$.ajax({
			url : '<c:url value="/bm/measureInstrmtCorreAdmRead"/>',
			type : 'GET',
			data : {
				'mitCd' : function(){ return mitCdVal;}
			},
			success : function(res) {
				let data = res.data;
				
				if(data != null){
					if(data.corrDate == 'undefined' || data.corrDate == null || data.corrDate == ''){
						$('#corrDate').val('');
					}else{
						$('#corrDate').val(moment(data.corrDate).format('YYYY-MM-DD'));
					}
					if(data.corrWillDate == 'undefined' || data.corrWillDate == null || data.corrWillDate == ''){
						$('#corrWillDate').val('');
					}else{
						$('#corrWillDate').val(moment(data.corrWillDate).format('YYYY-MM-DD'));
					}
					$('#corrNo').val(data.corrNo);
					$('#fpFn').text(data.attachFn);
					$('#fpHref').attr('href','/bm/corrDataFileDownload?attachFn='+data.attachFn+'&mitCd='+mitCdVal);

					corrDateVal = data.corrDate;
					console.log('교정일자:'+corrDateVal)
					
				}else{
					$('#corrDate').val('');
					$('#corrWillDate').val('');
					$('#corrNo').val('');
					$('#fpFn').text('');
					corrDateVal = "";
				}
			}
		}); 
	});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});

		$('#formCorre').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});

		$('#attachFn').text('');	//첨부파일 명 삭제

		//계측기코드 자동생성
		$.ajax({
			url : '<c:url value="/bm/getMitCd"/>',
			type : 'GET',
			success : function(res){
				mitCdVal = res.data;
			}
		});
		
		//선택박스처리
		selectBoxAppend(mitGubunCode, "mitGubun", "", "2");
		selectBoxAppend(mitUnitCode, "mitUnit", "", "2");
		selectBoxAppend(mitLocCode, "mitLoc", "", "2");
		selectBoxAppend(useFqyCode, "useFqy", "", "2");
		selectBoxAppend(admDeptCode, "admDept", "", "2");
		selectBoxAppend(mitKind, "mitKind", "", "2");	
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(corrCycleCode, "corrCycle", "", "2");

		//화면처리        
		uiProc(false);
		$("#tab2Nav").addClass('disabled');
		$("#tab3Nav").addClass('disabled');
		$("#tab4Nav").addClass('disabled');
		$("#tab5Nav").addClass('disabled');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');

		$('#btnCorrAdd').attr('disabled', false);  //추가버튼
		$('#btnCorrEdit').attr('disabled', false); //수정버튼
		$('#btnCorrDel').attr('disabled', false);  //삭제버튼

		//$('#corrDataListTable').DataTable().clear().draw();

		$('#corrDate').attr('disabled', false);
		$('#corrWillDate').attr('disabled', false);
		
		$('#corrDate').val('');
		$('#corrWillDate').val('');
		$('#corrNo').val('');
		$('#fpFn').text('');

		$('#fileSearch').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		
		$('#imgAdd1').val(null);
		$('#imageFile1').attr("src", null);
		$('#imgName1').text(null);
		
		$('#corrDataListTable').DataTable().ajax.reload();
		$('#corrDataListTable').DataTable().row.add({}).draw(false);
		$('#corrDataListTable').removeClass('d-none');
	});

	// 수정버튼 click
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리        
		uiProc(false);
		$("#tab2Nav").addClass('disabled');
		$("#tab3Nav").addClass('disabled');
		$("#tab4Nav").addClass('disabled');
		$("#tab5Nav").addClass('disabled');
		$('#btnSave').removeClass('d-none'); // 등록버튼

		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#btnCorrAdd').attr('disabled', false);
		$('#btnCorrEdit').attr('disabled', false);
		$('#btnCorrDel').attr('disabled', false);
		
		$('#corrDate').attr('disabled', false);
		$('#corrWillDate').attr('disabled', false);
		
		$('#fileSearch').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		
		//교정이력
		var nextCorrCheck = false;
		$.ajax({
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
 				'mitCd' : function() {return mitCdVal;},
 				'corrGubun' : function() {return '001';},
			},
			success : function(res) {
				let data = res.data;
				
				if(data.length == 0){
					nextCorrCheck = true;
				}
			}
			
		});
		
		if(nextCorrCheck){
			$('#corrDataListTable').DataTable().ajax.reload();
			$('#corrDataListTable').DataTable().row.add({}).draw(false);
			$('#corrDataListTable').removeClass('d-none');
			editCheck = true;
		} else {
			$('#corrDataListTable').addClass('d-none');
			editCheck = false;
		}
		
	});

	// 삭제버튼 click
	$('#btnDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="/bm/measureInstrmtAdmDelete"/>',
			type : 'POST',
			data : {
				'mitCd' : function(){return mitCdVal;},
				'attachGubun' : 'MI',
				'attachCd' : function(){return mitCdVal;},
				'attachType' : function(){return '001';},
				'corrGubun' : function(){return '001';},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("삭제되었습니다.");
					$('#measureInstrmtTable').DataTable().ajax.reload(function(){});

					$('#form').each(function() {
						this.reset();
						$('input[type=hidden]').val('');
					});

					$('#formCorre').each(function() {
						this.reset();
						$('input[type=hidden]').val('');
					});
					$("#tab2Nav").addClass('disabled');
					$("#tab3Nav").addClass('disabled');
					$("#tab4Nav").addClass('disabled');
					$("#tab5Nav").addClass('disabled');
					sideView = 'add'
				}else{
					toastr.error(res.message);
				}
			}
		});

	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#admNo').val())) {
			toastr.warning('관리번호를 입력해주세요.');
			$('#admNo').focus();
			return false;
		}
		
		//관리번호 중복 체크(미완성)
// 		var admNoCheck = false;
		
// 		if(sideView == 'add'){
// 			$.ajax({
// 				url : '<c:url value="bm/itemPartDtlList"/>',
// 				type : 'GET',
// 				async : false,
// 				data : {
// 					'itemCd' : function() {return $('#itemCd').val();},
// 				},
// 				success : function(res) {
// 					let data = res.data;
					
// 					if(data != null && itemSeq != data.itemSeq){
// 						admNoCheck = true;
// 					}
// 				}
				
// 			});
// 		}
	
// 		if (admNoCheck) {
// 			toastr.warning('중복된 품번 입니다.');
// 			$('#admNo').focus();
// 			return false;
// 		}
		
		if (!$.trim($('#mitNo').val())) {
			toastr.warning('기기번호를 입력해주세요.');
			$('#mitNo').focus();
			return false;
		}
		
		
		
		if (!$.trim($('#mitNm').val())) {
			toastr.warning('계측기명을 입력해주세요.');
			$('#mitNm').focus();
			return false;
		}
		
		if (!$.trim($('#corrCycle').val())) {
			toastr.warning('교정주기를 선택해주세요.');
			$('#corrCycle').focus();
			return false;
		}
		
		if ($.trim($('#corrCount').val()) == '0') {
			toastr.warning('교정횟수를 입력해주세요.');
			$('#corrCount').focus();
			return false;
		}
		
		var tempCorrCount = $('#corrCount').val();
		
		if (tempCorrCount.replace(/,/g, '').length > 5) {
			toastr.warning('교정횟수가 너무 큽니다. (십 만 미만으로 입력해 주세요.)');
			$('#corrCount').val('0');
			$('#corrCount').focus();
			return false;
		}
		
		if (!$.trim($('#modelNm').val())) {
			toastr.warning('규격을 입력해주세요.');
			$('#modelNm').focus();
			return false;
		}
		
		if (!$.trim($('#mfcCorpNm').val())) {
			toastr.warning('제작회사를 입력해주세요.');
			$('#mfcCorpNm').focus();
			return false;
		}
		
		var tempAcqCost = $('#acqCost').val();
		
		if (tempAcqCost.replace(/,/g, '').length > 10) {
			toastr.warning('취득가가 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
			$('#acqCost').val('0');
			$('#acqCost').focus();
			return false;
		}
		
		if (!$.trim($('#mitLoc').val())) {
			toastr.warning('위치를 입력해주세요.');
			$('#mitLoc').focus();
			return false;
		}
		
		//교정일자
		var nowCheck = false;
		var check = true;
		var check2 = true;
		var dataArray = new Array();
	
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				if ($(this).find("td input[name=corrNo]").val() != "" || $("#fileCdNm1").val() != "") {
					if ($(this).find("td input[name=corrDate]").val() == "") {
						toastr.warning('교정일자를 입력해 주세요.');
						$(this).find("td input[name=corrDate]").focus();
						check = false;
						nowCheck = true;
						return false;
					}
				}
				if ($(this).find("td input[name=corrDate]").val() == "") {
// 					toastr.warning('교정일자를 입력해 주세요.');
// 					$(this).find("td input[name=corrDate]").focus();
					check = false;
					return false;
				}
				
			});
		}
		if(nowCheck){
			return false;
		}
		////
		

		var url = '<c:url value="/bm/measureInstrmtAdmCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/bm/measureInstrmtAdmUpdate"/>';
		}
		//기본등록 Ajax
		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'mitCd' 		: 		mitCdVal,
				'admNo' 		: 		$('#admNo').val(),
				'mitNm' 		: 		$('#mitNm').val(),
				'mitGubun' 		: 		$('#mitGubun').val(),
				'mainGubun' 	: 		'001',
				'modelNm' 		: 		$('#modelNm').val(),
				'mfcCorpNm' 	: 		$('#mfcCorpNm').val(),
				'corrCycle' 	: 		$('#corrCycle option:selected').val(),
				'corrCount' 	: 		$('#corrCount').val().replace(/,/g, ''),
				'mitNo' 		: 		$('#mitNo').val(),
				'mitForm' 		: 		$('#mitForm').val(),
				'mitKind' 		: 		$('#mitKind option:selected').val(),
				'corrDate' 		: 		$('#corrDate').val(),
				'corrWillDate' 	: 		$('#corrWillDate').val(),
				'mitLoc' 		: 		$('#mitLoc').val(),
				'acqDate' 		: 		$('#acqDate').val(),
				'acqCost' 		: 		$('#acqCost').val().replace(/,/g, ''),
				'admDept' 		: 		$('#admDept option:selected').val(),
				'mainChargr' 	: 		$('#mainChargr').val(),
				'useYn' 		: 		$('#useYn option:selected').val(),
				'mitDesc' 		: 		$('#mitDesc').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					var formData = new FormData(document.getElementById("form")); //ajax로 넘길 data
					formData.append("imageFile1Nm", $('#imgName1').text());
					formData.append("mitCd", mitCdVal);
					formData.append("value", "1");

					$.ajax({
						url : '<c:url value="/bm/measureInstrmtImageUpload2"/>',
						data : formData,
						processData : false,
						contentType : false,
						type : 'POST',
						success : function(data) {
							if (data.result == "ok") { //응답결과
							} else if (data.result == "extensionError") {
								toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
								$('#imgAdd' + value).val("");
								$('#imgName' + value).val("");
								$('#imgName' + value).text("");
								$('#imgName' + value).attr("src", "");
							} else if (data.result == "sizeError") {
								toastr.error('사진 용량이 너무 큽니다. (1메가 이하로 등록해 주세요.)');
								$('#imgAdd' + value).val("");
								$('#imgName' + value).val("");
								$('#imgName' + value).text("");
								$('#imgName' + value).attr("src", "");
							}
						}
					});
					// 보기
					uiProc(true);
					$('#mitNm').attr('readonly',false);
					$('#mfcCorpNm').attr('readonly',false);
					$('#buyAmount').attr('readonly',false);
					$('#chooseAcqDate').attr('disabled',false);
					$('#btnSave').addClass('d-none');

					$("#tab2Nav").removeClass('disabled');
					$("#tab3Nav").removeClass('disabled');
					$("#tab4Nav").removeClass('disabled');
					$("#tab5Nav").removeClass('disabled');

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					
					$('#btnCorrAdd').attr('disabled', true);  //추가버튼
					$('#btnCorrEdit').attr('disabled', true); //수정버튼
					$('#btnCorrDel').attr('disabled', true);  //삭제버튼
					
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
				}else if(res.result == 'fail'){
					toastr.warning(res.message);
				}else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#measureInstrmtTable').DataTable().ajax.reload();
				
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}

		});
		
		//교정일자 등록
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				
// 				check2 = true;
// 				if ($(this).find("td div[name=fileDiv]").attr('class') == 'custom-file d-none') {
// 					check2 = false;
// 				}
				
				if(check && check2){
// 					var formData = new FormData(document.getElementById("formFile_" + index));
					
// 					formData.append('mitCd', mitCdVal);
// 					formData.append('attachFn', $('#fileLabel'+index).text());
// 					formData.append('corrSeq', $(this).find("td input[name=corrSeq]").val());
// 					formData.append('corrNo', $(this).find("td input[name=corrNo]").val());
// 					formData.append('corrGubun', '001');
// 					formData.append('corrDate', $(this).find("td input[name=corrDate]").val().replace(/-/g, ''));
// 					formData.append('corrWillDate', "");
					
					$.ajax({
						url : '<c:url value="/bm/corrDataListCreate"/>',
						type : 'POST',
						async : false,
						data : {
							'mitCd' : mitCdVal,
							'corrSeq' : $("#corrSeq").val(),
							'corrGubun' : '001',
							'corrDate' : $("#corrDate").val().replace(/-/g, ''),
							'corrWillDate' : "",
							'corrNo' : $("#corrNo").val(),
							'attachFn' : $('#fileLabel').text(),
						},
// 						data : formData,
// 					    processData: false,
// 				        contentType: false,
						success : function(res) {
							let data = res.data;
							if (res.result == 'ok') {
// 								$('#btnCorrAdd').attr('disabled', false);
// 								$('#btnCorrEdit').attr('disabled', false);
// 								$('#btnCorrDel').attr('disabled', false);
// 								$('#btnCorrSave').addClass('d-none');
// 								$('#corrDataListTable').DataTable().ajax.reload(function(){});
// 								$('input[name=fileNm]').attr('disabled', true);
// 								$('#corrDate').attr('disabled', true);
// 								$('#corrWillDate').attr('disabled', true);
								
// 								btnView = '';
// 								tableIdx = null;
								
								toastr.success('교정이력이 등록되었습니다.');
							} else {
								toastr.error(res.message);
							}
						}
					});
					
				}
				
			});
		}
		
		$('#corrDataListTable tbody tr').each(function(index, item) {
			index++;
			if($("#fileCdNm"+index).val() != null && $("#fileCdNm"+index).val() != 'undefined' && $("#fileCdNm"+index).val() != ''){
				//값 있나없나 검사
				if (corrDataListTable.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				formData.append('attachGubun', 'CD');
				formData.append('attachCd', mitCdVal);
				formData.append('attachSeq', '');
				formData.append('attachType', '001');
				formData.append('contents', "");
				formData.append('attchPath', fileDate);
				formData.append('attachRegDate', '');
				formData.append('etc1', '0');
				
				index--;
				
				$.ajax({
					url : '<c:url value="/bm/attachCdDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
// 							toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnFileAdd').attr('disabled', false);
						$('#btnFileDel').attr('disabled', false);
// 						btnView = "";
					}
				});
			}
			
		});
		
		sideView = 'add';
		$('#btnCorrAdd').attr('disabled', false);
		$('#btnCorrEdit').attr('disabled', false);
		$('#btnCorrDel').attr('disabled', false);
		$('#btnCorrSave').addClass('d-none');
		$('#corrDataListTable').DataTable().ajax.reload(function(){});
		$('input[name=fileNm]').attr('disabled', true);
		$('#corrDate').attr('disabled', true);
		$('#corrWillDate').attr('disabled', true);
		
		btnView = '';
		tableIdx = null;
		
		$('#corrDataListTable').addClass('d-none');

	});

	
	//교정이력사항 목록조회
	let corrDataListTable = $('#corrDataListTable').DataTable({
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
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
// 				'mitCd' : function() {return mitCdVal;},
				'mitCd' : function() {return " ";},
			},
		},
		rowId : 'mitCd',
		columns : [ 
// 			{
// 				render: function(data, type, row, meta) {		
// 					return meta.row + meta.settings._iDisplayStart + 1 ;
//     			},
//     			'className' : 'text-center'
// 			}, 
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="" name="corrDate"/>';
						html += '</div>';

						return html;
					}else{
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="'+moment(data).format('YYYY-MM-DD')+'" name="corrDate" disabled/>';
						html += '<input class="form-control" type="hidden" id="corrSeq" value="'+row['corrSeq']+'" name="corrSeq"/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrWillDate" value="" name="corrWillDate"/>';
						html += '</div>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrWillDate" value="'+tempCorrWillDate+'" name="corrWillDate" disabled/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name="userNm4"  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name="userNumber4"  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="userNm4" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="userNumber4" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" style="width:100%"/>';
					}else{
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					if (data != null) {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					} else {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [1], visible : false},
		]
	});
	
	//교정이력사항 목록조회
	let corrDataListTabTable = $('#corrDataListTabTable').DataTable({
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
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return mitCdVal;},
				'corrGubun' : function() {return '001';},
			},
		},
		rowId : 'mitCd',
		columns : [ 
// 			{
// 				render: function(data, type, row, meta) {		
// 					return meta.row + meta.settings._iDisplayStart + 1 ;
//     			},
//     			'className' : 'text-center'
// 			}, 
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						var html = '<input class="form-control" type="date" id="" value="'+moment(data).format('YYYY-MM-DD')+'" name="" style="min-width : 100%;" disabled/>';
						html += '<input class="form-control" type="hidden" id="" value="'+row['corrSeq']+'" name=""/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name="" style="min-width : 100%;" disabled/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name=""  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name=""  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" name="" style="width:100%" disabled/>';
					}else{
						return '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					
					if(data == null){
						var html = '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" for=""></label></div></form>';
						return html;
					} else {
						var html = '<a name="" href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+mitCdVal+'&corrSeq='+row['corrSeq']+'&corrGubun='+row['corrGubun']+'">'+data+'</a>';
						html += '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file d-none" name="">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" id="" for="">'+data+'</label></div></form>';
						return html;
					}
	            }
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [4], visible : false},
		]
	});
	
	let corrGubun = '';
	let corrSeq = '';
	
	//설비정보 상세정보 보기
	$('#corrDataListTabTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#corrDataListTabTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		corrGubun = corrDataListTabTable.row(this).data().corrGubun;
		corrSeq = corrDataListTabTable.row(this).data().corrSeq;
		
		$('#corrDataFileTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		},300);
	});
	
	let corrDataFileTable = $('#corrDataFileTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return mitCdVal;},
				'attachGubun' : function(){return 'CD';},
				'attachType' : function(){return corrGubun;},
				'etc1' : function(){return corrSeq;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					var tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType='+corrGubun+'&etc1='+corrSeq+'&attachGubun=CD">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		],
		order : [ [ 0, 'asc' ], ],
	});


	// 계측기관리 기본정보 보기
	$('#corrDataListTable tbody').on('click', 'tr',function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
			//tableIdx = null;
		} else {
			$('#corrDataListTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			tableIdx = $('#corrDataListTable').DataTable().row(this).index();
		}

		attachFnVal = corrDataListTable.row(this).data().attachFn;
		corrSeqVal = corrDataListTable.row(this).data().corrSeq;
		console.log(attachFnVal);
	
	});

	//교정이력사항 추가 버튼
	$('#btnCorrAdd').on('click', function() {
		btnView = 'add';
		
		if(tempCorrWillDate == null || tempCorrWillDate == 'Invalid date'){
			tempCorrWillDate = serverDate;
		}
		$('#corrDataListTable').DataTable().row.add({}).draw(false);
		$('#btnCorrAdd').attr('disabled', true);
		$('#btnCorrEdit').attr('disabled', true);
		$('#btnCorrDel').attr('disabled', true);
		$('#btnCorrSave').removeClass('d-none');
	});

	
	//교정이력사항 수정 버튼
	$('#btnCorrEdit').on('click', function() {
		btnView = 'edit';
		if(tableIdx == null){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

// 		if(attachFnVal == null || attachFnVal == ""){
			$('#btnCorrAdd').attr('disabled', true);
			$('#btnCorrEdit').attr('disabled', true);
			$('#btnCorrDel').attr('disabled', true);
			$('#btnCorrSave').removeClass('d-none');
			
			$('input[name=corrDate]').eq(tableIdx).attr('disabled', false);
			$('input[name=corrWillDate]').eq(tableIdx).attr('disabled', false);
			$('input[name=corrNo]').eq(tableIdx).attr('disabled', false);
			$('a[name=fileA]').eq(tableIdx).addClass('d-none');
			$('div[name=fileDiv]').eq(tableIdx).removeClass('d-none');
			$('#fileNm'+tableIdx).attr('disabled', false);
			
// 			$('button[name=corrDateCalendar]').eq(tableIdx).attr('disabled', false);
// 			$('input[name=corrNo]').eq(tableIdx).attr('disabled',false);
// 		}else{
// 			toastr.warning("해당 항목은 수정할 수 없습니다. 삭제 후 다시 진행해주세요.");
// 			toastr.warning("구현중입니다.");
// 			return false;
// 		}
	});
	
	//교정이력사항 저장 버튼
	$('#btnCorrSave').on('click', function() {
		var check = true;
		var check2 = true;
		var dataArray = new Array();
	
		$('#corrDataListTable tbody tr').each(function(index, item) {
			
			if ($(this).find("td input[name=corrDate]").val() == "") {
				toastr.warning('교정일자를 입력해 주세요.');
				$(this).find("td input[name=corrDate]").focus();
				check = false;
				return false;
			}
			
		});
		
		$('#corrDataListTable tbody tr').each(function(index, item) {
			
			check2 = true;
			if ($(this).find("td div[name=fileDiv]").attr('class') == 'custom-file d-none') {
				check2 = false;
			}
			
			if(check && check2){
				var formData = new FormData(document.getElementById("formFile_" + index));
				
				formData.append('mitCd', mitCdVal);
				formData.append('attachFn', $('#fileLabel'+index).text());
				formData.append('corrSeq', $(this).find("td input[name=corrSeq]").val());
				formData.append('corrNo', $(this).find("td input[name=corrNo]").val());
				formData.append('corrDate', $(this).find("td input[name=corrDate]").val().replace(/-/g, ''));
				formData.append('corrWillDate', $(this).find("td input[name=corrWillDate]").val().replace(/-/g, ''));
				if(btnView == "add"){
					url = '<c:url value="/bm/corrDataListCreate"/>';
				}else{
					url = '<c:url value="/bm/corrDataListUpdate"/>';
				}
				
				$.ajax({
					url : url,
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							$('#btnCorrAdd').attr('disabled', false);
							$('#btnCorrEdit').attr('disabled', false);
							$('#btnCorrDel').attr('disabled', false);
							$('#btnCorrSave').addClass('d-none');
							$('#corrDataListTable').DataTable().ajax.reload(function(){});
							$('input[name=fileNm]').attr('disabled', true);
							$('#corrDate').attr('disabled', true);
							$('#corrWillDate').attr('disabled', true);
							

							btnView = '';
							tableIdx = null;
						} else {
							toastr.error(res.message);
						}
					}
				});
				
			}
			
		});
		
// 		if(check){
// 			if(btnView == "add"){
// 				toastr.success('등록되었습니다.');
// 			}else{
// 				toastr.success('수정되었습니다.');
// 			}
// 		}
		
	});
	
	//관련자료 버튼 Event
	$('#tab3Nav').on('click', function() {
		$('#btnAttachDataSave').addClass('d-none');
		$('#AttachDatabtnEdit').addClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', false);
		$("#btnAttachDataDelete").attr("disabled", false);
		$('#createValue').remove();
		$('#measureInstrmAttachTable').DataTable().ajax.reload();
	});
	
	//교정이력사항 버튼 Event
	$('#tab4Nav').on('click', function() {
		$('#btnCorrAdd').attr('disabled', false);
		$('#btnCorrEdit').attr('disabled', false);
		$('#btnCorrDel').attr('disabled', false);
		$('#btnCorrSave').addClass('d-none');
		
		tempCorrWillDate = serverDate;
// 		$('#corrDataListTable').DataTable().ajax.reload();
		if(tempCorrWillDate == null || tempCorrWillDate == 'Invalid date'){
			tempCorrWillDate = serverDate;
		}

		$('#btnAttachDataSave').addClass('d-none');
		$('#AttachDatabtnEdit').addClass('d-none');
		$('#createValue').remove();
		
		$('#corrDataFileTable').DataTable().clear().draw();
		$('#corrDataListTabTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataListTabTable.draw();
			corrDataFileTable.draw();
			corrDataFileTable.draw();
			corrDataListTabTable.draw();
		},300);
	});

	//R&R 버튼 Event
	$('#tab5Nav').on('click', function() {
		$('#btnAttachData2Save').addClass('d-none');
		$('#AttachData2btnEdit').addClass('d-none');
		$('#btnAttachData2Add').attr('disabled', false);
		$("#btnAttachData2Delete").attr("disabled", false);
		$('#create2Value').remove();
		$('#measureInstrmAttach2Table').DataTable().ajax.reload();
	});

	status = '';

	//관련자료 목록조회
	let measureInstrmAttachTable = $('#measureInstrmAttachTable').DataTable({
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
			url : '<c:url value="bm/attachDataList"/>',
			type : 'GET',
			data : {
				'attachCd' : function() {return mitCdVal;},
				'attachGubun' : 'MI',
				'attachType'  : '001',
			},
		},
		rowId : 'mitCd',
		columns : [ 
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
    			},
    			'className' : 'text-center'
			}, 
			{
				data : 'attachRegDate',
				render : function(data, type, row) {
					return moment(data).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				'className' : 'text-center'
			}, 
			{
				data : 'contents',
				render : function(data, type, row) {
					if(data!=null){
	    				return '<input type="text" class="form-control" name="contents" value="'+data+'"  style="border:none; min-width:100%;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="contents" value=""  style="border:none; min-width:100%;" disabled>';	
					}		
				}
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row) {
					var del = '<div class="rightsidebar-close">';
					del += ' <button type="button" class="btn d-none" name="closeBtn">';
					del += '<i class="mdi mdi-close"></i>';
					del += '</button>';
					del += '</div>';
					
					if(data == ''){
						del = '<a href="/bm/measureAttachDataDownload?attachGubun=MI&attachFn='+encodeURIComponent(data)+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType=001">'+data+'</a>'
					} else{
						del = '<a href="/bm/measureAttachDataDownload?attachGubun=MI&attachFn='+encodeURIComponent(data)+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType=001">'+data+'</a>' + del;
					}
					
					return  del;
	               }
			}
		], buttons : []
	});

	status2 = '';
	//관련자료 목록조회
	let measureInstrmAttach2Table = $('#measureInstrmAttach2Table').DataTable({
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
			url : '<c:url value="bm/attachDataList"/>',
			type : 'GET',
			data : {
				'attachCd' : function() {return mitCdVal;},
				'attachGubun' : 'MI',
				'attachType'  : '002',
			},
		},
		rowId : 'mitCd',
		columns : [ 
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
    			},
    			'className' : 'text-center'
			}, 
			{
				data : 'attachRegDate',
				render : function(data, type, row) {
					return moment(data).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				'className' : 'text-center'
			}, 
			{
				data : 'contents',
				render : function(data, type, row) {
					if(data!=null){
	    				return '<input type="text" class="form-control" name="contents2" value="'+data+'"  style="border:none; min-width:100%;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="contents2" value=""  style="border:none; min-width:100%;" disabled>';	
					}		
				}
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row) {
					var del = '<div class="rightsidebar-close">';
					del += ' <button type="button" class="btn d-none" name="closeBtn">';
					del += '<i class="mdi mdi-close"></i>';
					del += '</button>';
					del += '</div>';
					
					if(data == ''){
						del = '<a href="/bm/measureAttachDataDownload?attachGubun=MI&attachFn='+encodeURIComponent(data)+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType=002">'+data+'</a>'
					} else{
						del = '<a href="/bm/measureAttachDataDownload?attachGubun=MI&attachFn='+encodeURIComponent(data)+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType=002">'+data+'</a>' + del;
					}
					
					return  del;
	               }
			}
		], buttons : []
	});


	//데이터 클릭 시
	$('#measureInstrmAttachTable tbody').on('click','tr',function() {
		if(status=="updating") {
			return;
		}
		
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			status = "";
		} else {
			$('#measureInstrmAttachTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			status = "choice";
		}
		
		$("#tab1Nav").removeClass('disabled');
		$("#tab2Nav").removeClass('disabled');
		$('#formBox').removeClass('d-none');
		
		attachSeq = measureInstrmAttachTable.row(this).data().attachSeq;
		contents = measureInstrmAttachTable.row(this).data().contents;
		attachFn = measureInstrmAttachTable.row(this).data().attachFn;
	});

	//데이터 클릭 시
	$('#measureInstrmAttach2Table tbody').on('click','tr',function() {
		if(status2=="updating") {
			return;
		}
		
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			status2 = "";
		} else {
			$('#measureInstrmAttach2Table').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			status2 = "choice";
		}
		
		$("#tab1Nav").removeClass('disabled');
		$("#tab2Nav").removeClass('disabled');
		$('#formBox').removeClass('d-none');
		
		attachSeq = measureInstrmAttach2Table.row(this).data().attachSeq;
		contents = measureInstrmAttach2Table.row(this).data().contents;
		attachFn = measureInstrmAttach2Table.row(this).data().attachFn;
	});
	
	

	//관련자료 추가 버튼
	$('#btnAttachDataAdd').on('click', function() {

		count = measureInstrmAttachTable.data().count();
		if(count==0) $('#measureInstrmAttachTable tbody').empty();

		$.ajax({
			url : '<c:url value="/bm/attachDataSeq"/>',
			type : 'GET',
			data : {
				'attachGubun' : 'MI',
				'attachCd' : function(){return mitCdVal;}
			},
			success : function(res) {
				attachDataSeq = res.seq;
				
				$('#measureInstrmAttachTable > #dataInsert').append('<tr id="createValue"><td style="text-align:center;">'+(count+1)+'</td>'
					+'<td>'
					+'<div class="form-group input-sub m-0 row">'
					+'<input class="form-control" type="text" id="attachRegDate" value="'+serverDate+'"name="acqDate" disabled/>'
					+	'<button onclick="fnPopUpCalendar(acqDate,acqDate,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
					+		'id="chooseAttachRegDate" type="button">'
					+		'<span class="oi oi-calendar"></span>'
					+	'</button>'
					+'</div>'
					+'</td>'
					+'<td><input type="text" value="'+userNm+'"name="userNm" id="userNm" style="width:100%; text-align:center;" disabled/>'
					+'<input type="hidden" value="'+userNumber+'"name="regId" id="regId" style="width:100%; text-align:center;" disabled/></td>'
					+'<td><input type="text" class="form-control" name="contents" id="contents" style="min-width:100%;"/></td>'
					+'<td><form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">'
					+'<input type="file" class="custom-file-input" id="fileNm" name="fileNm">'
					+'<label class="custom-file-label" for="fileNm"></label>'
					+'</div></form></td>'
					+'</tr>');
			}
		});
		
		$('#btnAttachDataSave').removeClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', true); //추가버튼
		$('#btnAttachDataDelete').attr('disabled', true);  //삭제버튼		
	});

	//관련자료 추가 버튼
	$('#btnAttachData2Add').on('click', function() {

		count = measureInstrmAttach2Table.data().count();
		if(count==0) $('#measureInstrmAttach2Table tbody').empty();

		$.ajax({
			url : '<c:url value="/bm/attachDataSeq"/>',
			type : 'GET',
			data : {
				'attachGubun' : 'MI',
				'attachCd' : function(){return mitCdVal;}
			},
			success : function(res) {
				attachDataSeq = res.seq;
				
				$('#measureInstrmAttach2Table > #data2Insert').append('<tr id="create2Value"><td style="text-align:center;">'+(count+1)+'</td>'
					+'<td>'
					+'<div class="form-group input-sub m-0 row">'
					+'<input class="form-control" type="text" id="attach2RegDate" value="'+serverDate+'"name="acq2Date" disabled/>'
					+	'<button onclick="fnPopUpCalendar(acq2Date,acq2Date,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
					+		'id="chooseAttach2RegDate" type="button">'
					+		'<span class="oi oi-calendar"></span>'
					+	'</button>'
					+'</div>'
					+'</td>'
					+'<td><input type="text" value="'+userNm+'"name="user2Nm" id="user2Nm" style="width:100%; text-align:center;" disabled/>'
					+'<input type="hidden" value="'+userNumber+'"name="reg2Id" id="reg2Id" style="width:100%; text-align:center;" disabled/></td>'
					+'<td><input type="text" class="form-control" name="contents" id="contents2" style="min-width:100%;"/></td>'
					+'<td><form id="form2File" method="post" enctype="multipart/form-data"> <div class="custom-file">'
					+'<input type="file" class="custom-file-input" id="file2Nm" name="fileNm">'
					+'<label class="custom-file-label" for="file2Nm"></label>'
					+'</div></form></td>'
					+'</tr>');
			}
		});
		
		$('#btnAttachData2Save').removeClass('d-none');
		$('#btnAttachData2Add').attr('disabled', true); //추가버튼
		$('#btnAttachData2Delete').attr('disabled', true);  //삭제버튼		
	});

	//관련자료 저장
	$('#btnAttachDataSave').on('click', function() {

		//입력값 검사
// 		if (!$.trim($('#contents').val())) {
// 			toastr.warning('내용을 입력해주세요.');
// 			$('#contents').focus();
// 			return false;
// 		}
		if (!$.trim($('#fileNm').val())) {
			toastr.warning('파일을 선택해주세요.');
			$('#fileNm').focus();
			return false;
		}
		
		var formData = new FormData(document.getElementById("formFile"));

		contentsValue = $('#contents').val();
		attachRegDateValue = $('#attachRegDate').val();
		createSeqValue = Number($('#createSeq').val());
		formData.append('path', fileDate);
		formData.append('attachCd', mitCdVal);
		formData.append('attachType', "001");
		formData.append('attachSeq', attachDataSeq);
		formData.append('attachRegDate', moment(attachRegDateValue).format('YYYY-MM-DD'));
		formData.append('contents', contentsValue);
		formData.append('idCheck', '');
		formData.append('attachGubun', 'MI');
		
		$.ajax({
			url : '<c:url value="/bm/attachDataCreate"/>',
			type : 'POST',
			data : formData,
		    processData: false,
	        contentType: false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					toastr.success('등록되었습니다.');
					$('#measureInstrmAttachTable').DataTable().ajax.reload(function() {
					});
					$('#formBox').removeClass('d-none');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#equipCodeTable').DataTable().ajax.reload();
				$('#btnAttachDataSave').addClass('d-none');
				$('#btnAttachDataAdd').attr('disabled', false);
				$("#btnAttachDataDelete").attr("disabled", false);
				$("#createValue").remove();
				status="";	
			}
		});
	});

	//관련자료 저장
	$('#btnAttachData2Save').on('click', function() {

		//입력값 검사
// 		if (!$.trim($('#contents').val())) {
// 			toastr.warning('내용을 입력해주세요.');
// 			$('#contents').focus();
// 			return false;
// 		}
		if (!$.trim($('#file2Nm').val())) {
			toastr.warning('파일을 선택해주세요.');
			$('#file2Nm').focus();
			return false;
		}
		
		var formData = new FormData(document.getElementById("form2File"));

		contentsValue = $('#contents2').val();
		attachRegDateValue = $('#attach2RegDate').val();
		formData.append('path', fileDate);
		formData.append('attachCd', mitCdVal);
		formData.append('attachType', "002");
		formData.append('attachSeq', attachDataSeq);
		formData.append('attachRegDate', moment(attachRegDateValue).format('YYYY-MM-DD'));
		formData.append('contents', contentsValue);
		formData.append('attachGubun', 'MI');
		formData.append('idCheck', '');
		
		$.ajax({
			url : '<c:url value="/bm/attachDataCreate"/>',
			type : 'POST',
			data : formData,
		    processData: false,
	        contentType: false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					toastr.success('등록되었습니다.');
					$('#measureInstrmAttach2Table').DataTable().ajax.reload(function() {
					});
					$('#formBox').removeClass('d-none');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#equipCodeTable').DataTable().ajax.reload();
				$('#btnAttachData2Save').addClass('d-none');
				$('#btnAttachData2Add').attr('disabled', false);
				$("#btnAttachData2Delete").attr("disabled", false);
				$("#create2Value").remove();
				status2="";	
			}
		});
	});
	
	
	//삭제 버튼 클릭
	$('#btnAttachDataDelete').on('click', function() {
		if (status != 'choice') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/attachDataDelete"/>',
			type : 'POST',
			data : {
				'attachGubun' : 'MI',
				'attachCd' : mitCdVal,
				'attachSeq' : attachSeq
			},
			success : function(res) {
				// 보기
				$('#equipCodeTable').DataTable().ajax.reload();
				$('#btnSave').addClass('d-none');
				toastr.success('삭제되었습니다.');
				status = '';
				$('#formBox').removeClass('d-none');

			},
			complete : function() {
				$('#measureInstrmAttachTable').DataTable().ajax.reload();
			}
		});
	});  

	//삭제 버튼 클릭
	$('#btnAttachData2Delete').on('click', function() {
		if (status2 != 'choice') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/attachDataDelete"/>',
			type : 'POST',
			data : {
				'attachGubun' : 'MI',
				'attachCd' : mitCdVal,
				'attachSeq' : attachSeq
			},
			success : function(res) {
				// 보기
				//$('#equipCodeTable').DataTable().ajax.reload();
				$('#btnSave').addClass('d-none');
				toastr.success('삭제되었습니다.');
				status2 = '';
				$('#formBox').removeClass('d-none');

			},
			complete : function() {
				$('#measureInstrmAttach2Table').DataTable().ajax.reload();
			}
		});
	});  
	

	
	//교정사항 이력 조회
	let measureInstrmLogTable = $('#measureInstrmLogTable').DataTable({
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
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			data : {
				'mitCd' : function() {return mitCdVal;},
				'corrGubun' : function() {return '001';},
			},
		},
		rowId : 'mitCd',
		columns : [ 
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
    			},
    			'className' : 'text-center'
			}, 
			{
				data : 'corrDate',
				render : function(data, type, row) {
					return moment(data).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row) {
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
					
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo'
			}, 
			{
				data : 'attachFn', 
				render : function(data, type, row) {
					if(data == ''){
						del = '<a href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+mitCdVal+'">'+data+'</a>';
					} else{
						del = '<a href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+mitCdVal +'">'+data+'</a>';
					}
					return  del;
	           }
			}
		], 
		buttons : []
	});

	

	//파일삭제버튼
	$(document).on('click','button[name=closeBtn]',function() {
		var formData = new FormData();
		contentsValue = $('#contents').val();
		formData.append('fileNm',$('#measureInstrmAttachTable tbody').find('.selected').find('td').eq(4).text());
		formData.append('contents', contentsValue);
		formData.append('attachGubun', 'MI');
		formData.append('path', fileDate);
		formData.append('attachSeq', attachSeq);
		
		$.ajax({
			url : '<c:url value="/bm/moldAttachFileDelete"/>',
			type : 'POST',
			data : {
				
				'attachFn' : $('#measureInstrmAttachTable tbody').find('.selected').find('td').eq(4).text(),
				'contents' : contentsValue,
				'attachGubun' : 'MI',
				'attachPath' :fileDate,
				'attachSeq' : function(){return attachSeq;},
				'attachCd' : mitCd
			},		
			success : function(res) {

				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					$('#measureInstrmAttachTable').DataTable().ajax.reload(function(){});
					status = '';
				} else {
					toastr.error(res.message);
				}
			}
		});

		$('#formBox').removeClass('d-none');
		$('#equipCodeTable').DataTable().ajax.reload();
		$('#AttachDatabtnEdit').addClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', false);
		$("#btnAttachDataDelete").attr("disabled", false);
		$("#createValue").remove();
		
	});




	
	//******************************************엑셀업로드*********************************************
	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/measureExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		rowId: 'admNo',
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'admNo'},
			{data : 'mitNo'},
			{data : 'mitNm'},
			{data : 'modelNm'},
			{data : 'corrCycle'},
			{data : 'corrCount'},
			{data : 'mfcCorpNm'},
			{data : 'mitLoc'},
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
        drawCallback: function() {
        	var api = this.api();
		}
	});

	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check = true;  	
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.admNo = inTable.row(index).data().admNo;
			rowData.mitNo = inTable.row(index).data().mitNo;
			rowData.mitNm = inTable.row(index).data().mitNm;
			rowData.mitLoc = inTable.row(index).data().mitLoc;
			rowData.admDept = inTable.row(index).data().admDept;
			rowData.mainChargr = inTable.row(index).data().mainChargr;
			rowData.corrCycle = inTable.row(index).data().corrCycle;
			rowData.corrCount = inTable.row(index).data().corrCount;
			rowData.mitForm = inTable.row(index).data().mitForm;
			rowData.mitKind = inTable.row(index).data().mitKind;
			rowData.modelNm = inTable.row(index).data().modelNm;
			rowData.mfcCorpNm = inTable.row(index).data().mfcCorpNm;
			rowData.acqDate = inTable.row(index).data().acqDate;
			rowData.acqCost = inTable.row(index).data().acqCost;
			rowData.mitDesc = inTable.row(index).data().mitDesc;
			
	        dataArray.push(rowData);
		});
			
		if(check){
			$.ajax({
				url : '<c:url value="bm/measureExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						
						$('#measureInstrmtTable').DataTable().ajax.reload(function(){
					        measureInstrmtTable.row('#'+mitCdVal).select();
					    });
						$('#inModal').modal('hide');
						toastr.success('저장되었습니다.');
						
					}else if(res.result == 'exist') {
						toastr.warning("동일한 관리번호("+res.overlapData+")가 존재합니다.");
						
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	
	function uiProc(flag) {
		/* $("#mainGubun").attr("disabled", flag); */
		$("#mitGubun").attr("disabled", flag);
		$("#admNo").attr("disabled", flag);
		$("#mitNm").attr("disabled", flag);
		$("#modelNm").attr("disabled", flag);
		$("#mfcCorpNm").attr("disabled", flag);
		$("#corrCycle").attr("disabled", flag);
		$("#mitUnit").attr("disabled", flag);
		$("#mitNo").attr("disabled", flag);
		$("#corrNo").attr("disabled", flag);
		$("#corrOrgan").attr("disabled", flag);
		$("#mitLoc").attr("disabled", flag);
		$("#mitBase").attr("disabled", flag);
		$("#useFqy").attr("disabled", flag);
		$("#admDept").attr("disabled", flag);
		$("#mainChargr").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#mitDesc").attr("disabled", flag);
		$('#corrCount').attr('disabled',flag);
		$('#mitForm').attr('disabled',flag);
		$('#mitKind').attr('disabled',flag);
		$('#acqCost').attr('disabled',flag);
		$('#fileName').attr('disabled',flag);
		$('#corrDateCalendar2').attr('disabled',flag);
		$('#corrDateCalendar3').attr('disabled',flag);
		$('#imgAdd1').attr('disabled',flag);
		$('#btnFileDelete').attr('disabled',flag);
		$('#acqDate').attr('disabled',flag);
	}
	
	//숫자만 입력하게 처리
	$(document).on('keyup', "#corrCount, #acqCost", function(event){
		var preInWhsQtyData = $(this).val();	   
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if($(this).val()==""){
			$(this).val("0");
		}
		
		$(this).val(rmDecimal($(this).val().replace(/,/g,'')));

	}); 

	//이미지 썸네일 보여주기
	function imageThum() {
		var reader = new FileReader(); 
		reader.onload = function(event) {
			$('#imageFile1').attr("src", event.target.result);
		}; 
		reader.readAsDataURL(event.target.files[0]);
		beforeChange = 1;
	}

	//이미지 삭제 (View)
	function deleteImage() {
		$('#imgAdd1').val(null);
		$('#imageFile1').attr("src", null);
		$('#imgName1').text(null);
	}
	
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
	
</script>

</body>
</html>
