<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 검사항목관리 코드 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title">품목조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="inspCodePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   			<th style="width : 7%">구분</th>
		                   			<th style="width : 8%">품목구분</th>
									<th style="width : 25%">품번</th>
									<th style="width : 30%">품명</th>
									<th style="width : 15%">고객사</th>
									<th style="width : 15%">상태</th>
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
	<!-- 검사항목관리 코드 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">검사항목관리(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="inspAdmTable" class="table table-bordered">
							<colgroup>
								<col width="11%">
								<col width="17%">
								<col width="31%">
								<col width="31%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>검사항목코드</th>
									<th>고객사</th>
									<th>품번</th>
									<th>품명</th>
									<th>상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 44%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
						<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>검사유형</th>
									<td>
										<select  class="custom-select" id="inspChkGrp2" style="min-width:100%" onClick="inspOnclick()" disabled></select>
									</td>  
									<th>검사코드</th>
									<td>
										<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" style="min-width:100%">
										<input type="text" class="form-control" id="inspCd" name="inspCd" disabled>
									</td>  
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="itemCdHide" name="itemCdHide"> 
												<input type="text" class="form-control" id="itemCd" name="itemCd" disabled>
												<button type="button" id="btnItemCd"
													class="btn btn-primary input-sub-search"
													onClick="itemCdSelectInCorpCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
<!-- 											<div class="ml-1" style="width: 5%;"> -->
<!-- 												<button type="button" id="inspCdDelete" class="btn closeBtn" onclick="deleteOnclick()"> -->
<!-- 													<i class="mdi mdi-close"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
										</div>
									</td>
									<th>품명</th>
									<td><input type="text" class="form-control" id="itemNm" name="itemNm" style="min-width:100%" disabled></td>
								</tr>
								<tr>
									<th>고객사</th>
									<td><input type="text" class="form-control" id="itemCusNm" name="itemCusNm" style="min-width:100%" disabled></td>
									<th>상태</th>
									<td><input type="text" class="form-control" id="stateCd" name="stateCd" style="min-width:100%" disabled></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="extTab">외관</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="sizeTab">치수</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab4" id="weightTab">중량</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab3" id="rlbtTab">신뢰성</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnExtAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnExtEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnExtDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnExtSave">저장</button>
							</div>
							<form id="extForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="extAdmTable">
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="60%">
											<col width="15%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>*입력방식</th>
												<th>*기준</th>
												<th>*확인방법</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnSizeAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnSizeEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnSizeDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnSizeSave">저장</button>
							</div>
							<form id="sizeForm" enctype="multipart/form-data">
								<div class="table-responsive d-none" id="sizeAdmTableDiv2">
									<table class="table table-bordered" id="sizeAdmTable2">
										<colgroup id="basicGroup">
											<col width="6%">
											<col width="15%">
											<col width="20%">
											<col width="19%">
											<col width="10%">
											<col width="16%">
											<col width="16%">
										</colgroup>
										
										<colgroup id="newGroup" class="d-none">
											<col width="6%">
											<col width="13%">
											<col width="20%">
											<col id="orderCol" width="10%">
											<col width="17%">
											<col width="10%">
											<col width="13%">
											<col width="13%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>*입력방식</th>
												<th>*목록</th>
												<th>*순서</th>
												<th>*확인방법</th>
												<th>*구분</th>
												<th colspan="2">*기준</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table-responsive" id="sizeAdmTableDiv">
									<table class="table table-bordered" id="sizeAdmTable">
										<colgroup id="basicGroup2">
											<col width="6%">
											<col width="12%">
											<col width="7%">
											<col width="20%">
											<col width="10%">
											<col width="17%">
											<col width="14%">
											<col width="14%">
										</colgroup>
										
										<colgroup id="newGroup2" class="">
											<col width="5%">
											<col width="12%">
											<col width="5%">
											<col id="orderCol" width="8%">
											<col width="23%">
											<col width="10%">
											<col width="15%">
											<col width="11%">
											<col width="11%">
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2">순번</th>
												<th rowspan="2">*입력방식</th>
												<th rowspan="2">특별<br>특성</th>
												<th rowspan="2">*순서</th>
												<th rowspan="2">*기준</th>
												<th rowspan="2">*구분</th>
												<th rowspan="2">*확인방법</th>
												<th colspan="2">SPEC</th>
											</tr>
											<tr>
												<th>*최대</th>
												<th>*최소</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnRlbtAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnRlbtEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnRlbtDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnRlbtSave">저장</button>
							</div>
							<form id="rlbtForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="rlbtAdmTable">
										<colgroup>
											<col width="20%">
											<col width="20%">
											<col width="30%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>	
												<th>*입력방식</th>
												<th>*일정</th>
												<th>*계획</th>
												<th>*실적</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnWeightAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnWeightEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnWeightDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnWeightSave">저장</button>
							</div>
							<form id="weightForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="weightAdmTable" style="width:100%;">
										<colgroup>
											<col width="6%">
											<col width="15%">
											<col width="20%">
											<col width="19%">
											<col width="10%">
											<col width="16%">
											<col width="16%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>*입력방식</th>
												<th>*목록</th>
												<th>*확인방법</th>
												<th>*구분</th>
												<th colspan="2">*기준</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<%-- <div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnMoisSave">수분저장</button>
								<button type="button" class="btn btn-warning float-right ml-1 invisible"
									id="btnMoisDel">수분삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1 invisible"
									id="btnMoisEdit">수분수정</button>
								<button type="button" class="btn btn-primary float-right ml-1 invisible"
									id="btnMoisAdd">수분추가</button>
							</div>
							<form id="sizeForm" enctype="multipart/form-data">
								<div class="table-responsive d-none" id="moisAdmTableDiv">
									<table class="table table-bordered" id="moisAdmTable">
										<colgroup>
											<col width="10%">
											<col width="20%">
											<col width="26%">
											<col width="22%">
											<col width="22%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>*입력방식</th>
												<th>*목록</th>
												<th colspan="2">*기준</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div> --%>
					</div>
				</div>
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

	let currentHref = "bmsc0430";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","검사항목관리(정밀가공)"); 
	
	//변수설정
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	var inspCd;
	var seqCheck = 'G';
	var inspGubun;
	var inspOnchangeCheck = '001';
// 	var itemGubunThree = null;
// 	var itemGubunFour = null;
// 	var itemGubun = '001';
	var inspType = "002";
	var inspExtSeq;
	var inspSizeSeq;
	var inspRlbtSeq;
	var serverDate = "${serverDateTo}";
	let itemGubunList = ['001'];
	let itemGubunList2 = ['001'];
	
	var sideView2 = "";
	
	//화면설정
	uiProc(true);

	//공통코드 처리 시작      
	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var inspChkGrp = new Array();
	<c:forEach items="${inspChkGrp}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspChkGrp.push(json);
	</c:forEach>

	var methodCode = new Array();
	<c:forEach items="${methodCodeList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	methodCode.push(json);
	</c:forEach>
	
	//확인방법 - 제품검사, 외관
	var inspCheckCode1_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '제품검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode1_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 제품검사, 치수
	var inspCheckCode1_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '제품검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode1_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수분측정, 수분측정
	var inspCheckCode2_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수분측정' && "${info.etc2}" == '수분측정'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode2_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수분측정, 중량
	var inspCheckCode2_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수분측정' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode2_3.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 외관
	var inspCheckCode3_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 치수
	var inspCheckCode3_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 중량
	var inspCheckCode3_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_3.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수입검사, 외관
	var inspCheckCode4_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수입검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode4_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 외관
	var inspCheckCode5_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 치수
	var inspCheckCode5_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 중량
	var inspCheckCode5_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_3.push(json);
	}
	</c:forEach>

	//검사순서
	var inspOrderCode = new Array();
	<c:forEach items="${inspOrder}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspOrderCode.push(json);
	</c:forEach>

	//구분
	var inspStandGubunCode = new Array();
	<c:forEach items="${inspStandGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspStandGubunCode.push(json);
	</c:forEach>

	selectBoxAppend(inspChkGrp, "inspChkGrp2", "", "");
	
	
	//공통코드 처리 종료
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#inspChkGrp2').attr('disabled', true);

		$('#btnExtAdd').addClass('invisible');
		$('#btnExtEdit').addClass('invisible');
		$('#btnExtDel').addClass('invisible');
 		$('#btnExtSave').addClass('invisible');
		
		$('#btnSizeAdd').addClass('invisible');
		$('#btnSizeEdit').addClass('invisible');
		$('#btnSizeDel').addClass('invisible');
 		$('#btnSizeSave').addClass('invisible');
		
		$('#btnRlbtAdd').addClass('invisible');
		$('#btnRlbtEdit').addClass('invisible');
		$('#btnRlbtDel').addClass('invisible');
 		$('#btnRlbtSave').addClass('invisible');

		$('#btnWeightAdd').addClass('invisible');
		$('#btnWeightEdit').addClass('invisible');
		$('#btnWeightDel').addClass('invisible');
 		$('#btnWeightSave').addClass('invisible');
 		
 		//변경이력
 		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');

 		sideView2="";
 		$('#weightAdmTable').DataTable().ajax.reload();
		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload();

		$('#extTab').trigger('click');
	});

	$("#dealCorpNm").attr("disabled", true);
	$("#btnEdit").attr("disabled", true);
	$("#btnDel").attr("disabled", true);
	

	// 목록
	let inspAdmTable = $('#inspAdmTable').DataTable({
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
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/inspAdmList"/>',
			type : 'GET',
			data : {
				'inspGubun' : function(){return inspOnchangeCheck;},
				'mainGubun' : function(){return '002';},
			},
		},
		columns : [
			{
				data : 'inspCd'
			}, 
			{
				data : 'itemCusNm'
			}, 
			{
				data : 'itemCd'
			}, 
			{
				data : 'itemNm'
			}, 
			{
				data : 'stateCd'
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
		}, ]
	});
	
	//코드 팝업 시작
	var inspCodePopUpTable;
	function itemCdSelectInCorpCd() {
		if (inspCodePopUpTable != null && inspCodePopUpTable != 'undefined') {
			inspCodePopUpTable.destroy();
		}
		inspCodePopUpTable = $('#inspCodePopUpTable').DataTable({	
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
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'inspGubun' : function(){return $('#inspChkGrp2 option:selected').val();},
					'itemGubunList' : function(){return itemGubunList2;},
// 					'itemGubun' : function(){return itemGubun;},
// 					'itemGubunThree' : function(){return itemGubunThree;},
// 					'itemGubunFour' : function(){return itemGubunFour;},
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [ 
				{
					data : 'mainGubunNm'
				},
				{
					data : 'itemGubunNm'
				},
				{
					data : 'itemCd'
				}, 
				{
					data : 'itemNm'
				}, 
				{
					data : 'itemCusNm'
				}, 
				{
					data : 'stateCdNm'
				}  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
			drawCallback : function(){
			}
		});
		
		$('#inspCodePopUpTable tbody').on('click', 'tr', function() {
			var data = inspCodePopUpTable.row(this).data();
	
			if(data.mainGubun == '001'){
				$('#mg1').prop('checked', true);
				$('#mg2').prop('checked', false);
				$('#sizeAdmTableDiv2').removeClass('d-none');
				$('#sizeAdmTableDiv').addClass('d-none');
			} else if (data.mainGubun == '002'){
				$('#mg1').prop('checked', false);
				$('#mg2').prop('checked', true);
				$('#sizeAdmTableDiv2').addClass('d-none');
				$('#sizeAdmTableDiv').removeClass('d-none');
			} else {
				$('#mg1').prop('checked', false);
				$('#mg2').prop('checked', false);
				$('#sizeAdmTableDiv2').addClass('d-none');
				$('#sizeAdmTableDiv').removeClass('d-none');
			}
			$('#itemSeq').val(data.itemSeq);
			$('#itemCd').val(data.itemCd);
			$('#itemNm').val(data.itemNm);
			$('#itemCusNm').val(data.itemCusNm);
			$('#stateCd').val(data.stateCdNm);
			
			sizeAdmTable.draw();
			sizeAdmTable2.draw();

			console.log(data.mainGubun);
			$('#inspCodePopUpModal').modal('hide');
		});
		$('#inspCodePopUpModal').modal('show');
	}
	
	// 보기
	$('#inspAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#inspAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		inspCd = inspAdmTable.row(this).data().inspCd;
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //삭제버튼

		if($("#inspChkGrp option:selected").val()=="005"){
			$('#sizeTab').trigger('click');
		}else{
			$('#extTab').trigger('click');
		}
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/inspAdmRead"/>',
			type : 'GET',
			data : {
				'inspCd' : function(){return inspCd;},
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';

				$('#inspCd').val(data.inspCd);
				$('#itemSeq').val(data.itemSeq);
				$('#itemCd').val(data.itemCd);
				$('#itemNm').val(data.itemNm);
				$('#itemCusNm').val(data.itemCusNm);
				$('#stateCd').val(data.stateCd);

				$('#inspChkGrp2').val(data.inspGubun).attr('selected');

				//라디오버튼
				if(data.mainGubun == '001'){
					$('#mg1').prop('checked', true);
					$('#sizeAdmTableDiv2').removeClass('d-none');
					$('#sizeAdmTableDiv').addClass('d-none');
				}else if(data.mainGubun == '002'){
					$('#mg2').prop('checked', true);
					$('#sizeAdmTableDiv2').addClass('d-none');
					$('#sizeAdmTableDiv').removeClass('d-none');
				} 

				//공정순서 항목 숨김처리
				if(inspOnchangeCheck=="003" && inspType=="002"){
					sizeAdmTable.column( 3 ).visible(true);
					sizeAdmTable2.column( 3 ).visible(true);
				
					$('#newGroup').removeClass('d-none');
					$('#basicGroup').addClass('d-none');

					$('#newGroup2').removeClass('d-none');
					$('#basicGroup2').addClass('d-none');

				}else{
					sizeAdmTable.column( 3 ).visible(false);
					sizeAdmTable2.column( 3 ).visible(false);

					$('#newGroup').addClass('d-none');
					$('#basicGroup').removeClass('d-none');

					$('#newGroup2').addClass('d-none');
					$('#basicGroup2').removeClass('d-none');
				}
				
				$('#sizeAdmTable').DataTable().ajax.reload(function(){});
				$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
				$('#extAdmTable').DataTable().ajax.reload(function(){});
				$('#rlbtAdmTable').DataTable().ajax.reload(function(){});
				$('#weightAdmTable').DataTable().ajax.reload(function(){});

			}
		});
		
	});
	
	var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">유형</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="inspChkGrp" onChange="inspOnchange()">';
	html1 += '</select></div>';
    html1 += '</div>';

	$('#inspAdmTable_length').html(html1);
	selectBoxAppend(inspChkGrp, "inspChkGrp", "", "");
	inspType = "002"

	function inspOnchange(){
		$('#extTab').trigger('click');
		inspOnchangeCheck = $("#inspChkGrp option:selected").val();
		$('#sizeTab').text('치수');
		if(inspOnchangeCheck == '001'){
			$('#inspChk1').prop('checked', true);
			seqCheck = 'G';
			itemGubunList = ['001'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck == '002'){
			seqCheck = 'P';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck == '003'){
			seqCheck = 'E';
			itemGubunList = ['003', '004', '005'];


			$('#extTab').removeClass('d-none');
			$('#sizeTab').addClass('d-none');
			$('#rlbtTab').removeClass('d-none');
			$('#weightTab').addClass('d-none');
			$('#sizeTab').addClass('disabled');

			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#rlbtTab').addClass('disabled');
			
		}else if(inspOnchangeCheck == '004'){
			seqCheck = 'J';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck == '005'){
			seqCheck = 'W';
			itemGubunList = ['003', '004', '005'];

			$('#extTab').addClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');

			$('#extTab').removeClass('active');
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#sizeTab').trigger('click');

			$('#sizeTab').text('수분측정');
			inspType = "005"
		}

		$('#inspAdmTable').DataTable().ajax.reload(function(){});
	}
	
	function inspOnclick(){
		$('#extTab').trigger('click');
		inspOnchangeCheck2 = $("#inspChkGrp2 option:selected").val();
		$('#sizeTab').text('치수');
		
		if(inspOnchangeCheck2 == '001'){
			$('#inspChk1').prop('checked', true);
			seqCheck = 'G';
			itemGubunList2 = ['001'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck2 == '002'){
			seqCheck = 'P';
			itemGubunList2 = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck2 == '003'){
			seqCheck = 'E';
			itemGubunList2 = ['003', '004', '005'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').addClass('d-none');
			$('#rlbtTab').removeClass('d-none');
			$('#weightTab').addClass('d-none');
			$('#sizeTab').addClass('disabled');

			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#rlbtTab').addClass('disabled');
			
		}else if(inspOnchangeCheck2 == '004'){
			seqCheck = 'J';
			itemGubunList2 = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		}else if(inspOnchangeCheck2 == '005'){
			seqCheck = 'W';
			itemGubunList2 = ['003', '004', '005'];

			$('#extTab').addClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');

			$('#extTab').removeClass('active');
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#sizeTab').trigger('click');

			$('#sizeTab').text('수분측정');
			inspType = "005"
		}
	}
	
	function deleteOnclick(){
		$('#itemSeq').val('');
		$('#itemCd').val('');
		$('#itemNm').val('');
		$('#itemCusNm').val('');
		$('#stateCd').val('');
		$('#mg1').prop('checked', false);
		$('#mg2').prop('checked', false);
	}

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#inspAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#form').each(function() {this.reset();});
		inspCd = 'none';
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		$('#rlbtAdmTable').DataTable().ajax.reload(function(){});
		$('#weightAdmTable').DataTable().ajax.reload(function(){});

		$('#inspChkGrp2').attr('disabled',false);
		
		//설비코드 중복체크
		$('#btnCheck').attr("disabled", false);
		
		//화면처리        
		uiProc(false);

		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'POST',
			data : {
				'seqCheck' : function(){return seqCheck;},
			},
			success : function(res) {
				data = res.inspCd;
				$('#inspCd').val(data);
			}
		});

		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnDel').attr('disabled', true); //삭제버튼
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		$('#btnExtAdd').removeClass('invisible');
		$('#btnExtEdit').removeClass('invisible');
		$('#btnExtDel').removeClass('invisible');
 		$('#btnExtSave').removeClass('invisible');
		
		$('#btnSizeAdd').removeClass('invisible');
		$('#btnSizeEdit').removeClass('invisible');
		$('#btnSizeDel').removeClass('invisible');
 		$('#btnSizeSave').removeClass('invisible');
		
		$('#btnRlbtAdd').removeClass('invisible');
		$('#btnRlbtEdit').removeClass('invisible');
		$('#btnRlbtDel').removeClass('invisible');
		$('#btnRlbtSave').removeClass('invisible');

		$('#btnWeightAdd').removeClass('invisible');
		$('#btnWeightEdit').removeClass('invisible');
		$('#btnWeightDel').removeClass('invisible');
 		$('#btnWeightSave').removeClass('invisible');

 		
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요.");
			return false;
		}
		uiProc(false);
		
		//수정관련 기능(검사코드는 수정 불가)
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#baseInfoCd').attr('disabled', true);

		$('#btnSave').removeClass('d-none');
		$('#inspChkGrp2').attr('disabled',true);
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		$('#btnExtAdd').removeClass('invisible');
		$('#btnExtEdit').removeClass('invisible');
		$('#btnExtDel').removeClass('invisible');
 		$('#btnExtSave').removeClass('invisible');
		
		$('#btnSizeAdd').removeClass('invisible');
		$('#btnSizeEdit').removeClass('invisible');
		$('#btnSizeDel').removeClass('invisible');
 		$('#btnSizeSave').removeClass('invisible');
		
		$('#btnRlbtAdd').removeClass('invisible');
		$('#btnRlbtEdit').removeClass('invisible');
		$('#btnRlbtDel').removeClass('invisible');
 		$('#btnRlbtSave').removeClass('invisible');

		$('#btnWeightAdd').removeClass('invisible');
		$('#btnWeightEdit').removeClass('invisible');
		$('#btnWeightDel').removeClass('invisible');
 		$('#btnWeightSave').removeClass('invisible');

 		//변경이력
 		$('#changeHisTable').removeClass('d-none');

	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		$.ajax({
			url : '<c:url value="bm/inspAdmDelete"/>',
			type : 'POST',
			data :{
				'inspCd' : function(){return inspCd;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#inspAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {
		var check = true;
		var check2 = true;
		var check3 = true;
		var dataArray = new Array();
		var dataArray2 = new Array();
		var dataArray3 = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		//기본 입력값 검사
		if (!$.trim($('#inspCd').val())) {
			toastr.warning('검사항목코드를 입력해주세요.');
			$('#inspCd').focus();
			return false;
		}

		if (!$.trim($('#itemCd').val())) {
			toastr.warning('품번을 입력해주세요.');
			$('#btnItemCd').focus();
			return false;
		}

		var url = '<c:url value="/bm/inspAdmCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/bm/inspAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'inspGubun' : $('#inspChkGrp2 option:selected').val(),
				'inspCd' : $('#inspCd').val(),
				'itemSeq' : $('#itemSeq').val(),
				'inspDesc1' : $('#inspDesc1').val(),
				'inspDesc2' : $('#inspDesc2').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);

				$('#inspChkGrp2').attr('disabled',true);
				
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnDel').attr('disabled', false);
				
				$('#btnExtAdd').addClass('invisible');
				$('#btnExtEdit').addClass('invisible');
				$('#btnExtDel').addClass('invisible');
		 		$('#btnExtSave').addClass('invisible');
				
				$('#btnSizeAdd').addClass('invisible');
				$('#btnSizeEdit').addClass('invisible');
				$('#btnSizeDel').addClass('invisible');
		 		$('#btnSizeSave').addClass('invisible');
				
				$('#btnRlbtAdd').addClass('invisible');
				$('#btnRlbtEdit').addClass('invisible');
				$('#btnRlbtDel').addClass('invisible');
		 		$('#btnRlbtSave').addClass('invisible');

				$('#btnWeightAdd').addClass('invisible');
				$('#btnWeightEdit').addClass('invisible');
				$('#btnWeightDel').addClass('invisible');
		 		$('#btnWeightSave').addClass('invisible');
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
		
		if (sideView == "edit") {
			toastr.success('수정되었습니다.');
		} else {
			toastr.success('등록되었습니다.');
		}
		sideView = 'edit';
		sideView2 = "";
		
		//새로고침
		$('#inspAdmTable').DataTable().ajax.reload(function() {});
		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload(); 
		$('#weightAdmTable').DataTable().ajax.reload(); 
		
		selectBoxAppend(inspChkGrp, "inspChkGrp", inspOnchangeCheck, "");
		
		//화면설정
		uiProc(true);
		uiProc_ext(true);
		uiProc_size(true);
		uiProc_rlbt(true);
		uiProc_weight(true);

		$('#btnExtSave').addClass('d-none');
		$('#btnSizeSave').addClass('d-none');
		$('#btnRlbtSave').addClass('d-none');
		$('#btnSave').addClass('d-none');
	});

	
	//외관 저장
	$('#btnExtSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#extAdmTable tbody tr').each(function(index, item) {

			if (extAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspList]').val()=="") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspList]').focus();
					check = false;
					return false;
				}
			} 
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "001";
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			rowData.inspList = $(this).find('td input[name=inspList]').val();
			rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();

			dataArray.push(rowData);
			console.log(rowData)
		});
		
		var url = '<c:url value="/bm/inspDtlCreate"/>';

		if (check == true) {
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2 = "";
						//새로고침
						$('#extAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_ext(true);
						$('#btnExtSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});
	
	//치수 저장
	$('#btnSizeSave').on('click',function() {
		var check2 = true;
		var dataArray2 = new Array();

		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		if ($('input[name=mainGubun]:checked').val() == '001') {
			$('#sizeAdmTable2 tbody tr').each(function(index, item) {

				if (sizeAdmTable2.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=inspList]').val() == "") {
						toastr.warning('목록을 입력해 주세요.');
						$(this).find('td input[name=inspList]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandUpper]').val() == "") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspStandUpper]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandLower]').val() == "") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspStandLower]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspOrder]').val() == "") {
						toastr.warning('순서를 선택해 주세요.');
						$(this).find('td input[name=inspOrder]').focus();
						check2 = false;
						return false;
					}
				}
				
				var rowData = new Object();
				rowData.inspCd = inspCd;
				if($("#inspChkGrp option:selected").val()=="005" || $('input[name=inspChkGrp]:checked').val()=="005"){
					rowData.inspType = "005";
				}else{
					rowData.inspType = "002";
				}
				
				rowData.inspSpc = '';
				rowData.inspList = $(this).find('td input[name=inspList]').val();
				rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');;
				rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');;
				rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
				rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
				rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
				
				if(inspOnchangeCheck=="003" && inspType=="002"){
					rowData.inspOrder = $(this).find('td select[name=inspOrder] option:selected').val();
				}else{
					rowData.inspOrder = '0';
				}
				
				
				dataArray2.push(rowData);
				console.log(rowData)
			});
		} else {
			$('#sizeAdmTable tbody tr').each(function(index, item) {

				if (sizeAdmTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=inspList]').val()=="") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspList]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandUpper]').val()=="") {
						toastr.warning('최대를 입력해 주세요.');
						$(this).find('td input[name=inspStandUpper]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandLower]').val()=="") {
						toastr.warning('최소를 입력해 주세요.');
						$(this).find('td input[name=inspStandLower]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspOrder]').val() == "") {
						toastr.warning('순서를 선택해 주세요.');
						$(this).find('td input[name=inspOrder]').focus();
						check2 = false;
						return false;
					}
				}
				
				var rowData = new Object();
				rowData.inspCd = inspCd;

				if($("#inspChkGrp option:selected").val()=="005" || $('input[name=inspChkGrp]:checked').val()=="005"){
					rowData.inspType = "005";
				}else{
					rowData.inspType = "002";
				}
				
				if($(this).find('td input[name=inspSpc]').is(':checked')){
					rowData.inspSpc = '001';
				} else {
					rowData.inspSpc = '002';
				}
				rowData.inspList = $(this).find('td input[name=inspList]').val();
				rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');;
				rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');;
				rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
				rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
				rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
				
				if(inspOnchangeCheck=="003" && inspType=="002"){
					rowData.inspOrder = $(this).find('td select[name=inspOrder] option:selected').val();
				}else{
					rowData.inspOrder = '0';
				}

				dataArray2.push(rowData);
				console.log(rowData)
			});
		}
		
		
		var url = '<c:url value="/bm/inspDtlCreate"/>';

		if (check2) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray2),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}

						sideView2=""
						//새로고침
						$('#sizeAdmTable').DataTable().ajax.reload();
						$('#sizeAdmTable2').DataTable().ajax.reload();
						//화면설정
						uiProc_size(true);
						$('#btnSizeSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});
	
	//신뢰성 저장
	$('#btnRlbtSave').on('click',function() {
		var check3 = true;
		var dataArray3 = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#rlbtAdmTable tbody tr').each(function(index, item) {

			if (rlbtAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspPlan]').val()=="") {
					toastr.warning('계획을 입력해 주세요.');
					$(this).find('td input[name=inspPlan]').focus();
					check3 = false;
					return false;
				}
				if ($(this).find('td input[name=inspReport]').val()=="") {
					toastr.warning('실적을 입력해 주세요.');
					$(this).find('td input[name=inspReport]').focus();
					check3 = false;
					return false;
				}
			}
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "004";
			rowData.inspPlanDate = $(this).find('td input[name=inspPlanDate]').val();
			rowData.inspPlan = $(this).find('td input[name=inspPlan]').val();
			rowData.inspReport = $(this).find('td input[name=inspReport]').val();
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			dataArray3.push(rowData);
			console.log(rowData);
		});
		
		var url = '<c:url value="/bm/inspDtlCreate"/>';

		if (check3) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray3),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2= "";
						//새로고침
						$('#rlbtAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_rlbt(true);
						$('#btnRlbtSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});


	//중량 저장
	$('#btnWeightSave').on('click',function() {
		var check2 = true;
		var dataArray2 = new Array();

		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#weightAdmTable tbody tr').each(function(index, item) {

			if (weightAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspList]').val() == "") {
					toastr.warning('목록을 입력해 주세요.');
					$(this).find('td input[name=inspList]').focus();
					check2 = false;
					return false;
				}
				if ($(this).find('td input[name=inspStandUpper]').val() == "") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspStandUpper]').focus();
					check2 = false;
					return false;
				}
				if ($(this).find('td input[name=inspStandLower]').val() == "") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspStandLower]').focus();
					check2 = false;
					return false;
				}
			}
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "003";
			rowData.inspSpc = '';
			rowData.inspList = $(this).find('td input[name=inspList]').val();
			rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');
			rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
			rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
			
			dataArray2.push(rowData);
			console.log(rowData)
		});
		
		
		var url = '<c:url value="/bm/inspDtlCreate"/>';

		if (check2) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray2),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2="";
						//새로고침
						$('#weightAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_weight(true);
						$('#btnWeightSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});

	function uiProc(flag) {
		$("input[name='inspChkGrp']").attr("disabled", flag);
		$('#btnItemCd').attr('disabled', flag);
		$('#inspDesc1').attr('disabled', flag);
		$('#inspDesc2').attr('disabled', flag);
		
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//외관, 치수, 신뢰성 탭
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	//외관 탭 클릭시
	$('#extTab').on('click', function() {
		setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		},175);

	});
	
	//치수 탭 클릭시
	$('#sizeTab').on('click', function() {
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable.draw();
			sizeAdmTable2.draw();
			sizeAdmTable2.draw();
		},175);

	});
	
	//신뢰성 탭 클릭시
	$('#rlbtTab').on('click', function() {
		setTimeout(function(){
			rlbtAdmTable.draw();
			rlbtAdmTable.draw();
		},175);

	});

	//중량 탭 클릭시
	$('#weightTab').on('click', function() {
		setTimeout(function(){
			weightAdmTable.draw();
			weightAdmTable.draw();
		},175);

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
		scrollY: '30vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "001";},
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
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
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
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode4_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_1,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
					
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	//치수 목록 - 사출
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
		scrollY: '30vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return inspType;},
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
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
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
				data : 'inspOrder',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspOrderCode,"inspOrder", data, row, meta);
				}
			},
			{
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode4_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_2,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%; text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%; text-align:right;" />';
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
		drawCallback : function(){
			
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
		pageLength : -1,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return inspType;},
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
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
			},
			{
				data : 'inspSpc',
				render : function(data, type, row, meta) {
					if (data == null) {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="min-width : 100%" />';
					} else if (data == '001') {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%;" checked disabled/>';
					} else {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspOrder',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspOrderCode,"inspOrder", data, row, meta);
				}
			},
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%;" />';
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode4_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_2,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
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
		drawCallback : function(){
			
		} 
	});
	
	//신뢰성 목록
	let rlbtAdmTable = $('#rlbtAdmTable').DataTable({
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
		pageLength : -1,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "004";},
			},
		},
		columns : [
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
			},
			{
				data : 'inspPlanDate',
				render : function(data, type, row, meta) {
					tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var dateData = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">'
						html += '<input type="date" class="form-control" value="'+dateData+'" id="inspPlanDate'+tempNum+'" name="inspPlanDate" disabled/>';
						html += '</div>';
						return html;
					} else {
						var html = '<div class="form-group input-sub m-0 row">'
							html += '<input type="date" class="form-control" value="'+serverDate+'" id="inspPlanDate'+tempNum+'" name="inspPlanDate"/>';
							html += '</div>';
						return html;
					}
				}
			}, 
			{
				data : 'inspPlan',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspPlan" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspPlan" value="" style="min-width : 100%" />';
					}
				}
			}, 
			{
				data : 'inspReport',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspReport" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspReport" value="" style="min-width : 100%" />';
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
		scrollY: '30vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "003";},
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
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
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
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_3,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_3,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_3,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
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
		}, ]
	});
	
	//외관 데이터 클릭 시
	$('#extAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#extAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#extAdmTable').DataTable().row(this).index();
		inspSeq = extAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//치수 데이터 클릭 시 - 사출
	$('#sizeAdmTable2 tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#sizeAdmTable2').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#sizeAdmTable2').DataTable().row(this).index();
		inspSeq = sizeAdmTable2.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//치수 데이터 클릭 시 - 봉제
	$('#sizeAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#sizeAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#sizeAdmTable').DataTable().row(this).index();
		inspSeq = sizeAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});

	//신뢰성 데이터 클릭 시
	$('#rlbtAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#rlbtAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#rlbtAdmTable').DataTable().row(this).index();
		inspSeq = rlbtAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});

	//중량 데이터 클릭 시 
	$('#weightAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#weightAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#weightAdmTable').DataTable().row(this).index();
		inspSeq = weightAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//외관 추가버튼
	$('#btnExtAdd').on('click', function() {
		btnView = '';
		sideView2 = "add";
		$('#extAdmTable').DataTable().row.add({}).draw(false);
		
 		$('#btnExtSave').removeClass('d-none'); // 등록버튼
	});
	
	//치수 추가버튼
	$('#btnSizeAdd').on('click', function() {
		if($('#itemCd').val() == '' || $('#itemCd').val() == undefined){
			toastr.warning("품번을 입력해주세요.");
			$('#btnItemCd').focus();
			return false;
		}
		
		btnView = '';
		sideView2 = "add";
		if($('input[name=mainGubun]:checked').val() == '001'){
			$('#sizeAdmTable2').DataTable().row.add({}).draw(false);
		} else if($('input[name=mainGubun]:checked').val() == '002') {
			$('#sizeAdmTable').DataTable().row.add({}).draw(false);
		}
		
 		$('#btnSizeSave').removeClass('d-none'); // 등록버튼
	});

	//신뢰성 추가버튼
	$('#btnRlbtAdd').on('click', function() {
		btnView = '';
		sideView2 = "add";
		$('#rlbtAdmTable').DataTable().row.add({}).draw(false);
 		$('#btnRlbtSave').removeClass('d-none'); // 등록버튼
	});

	//중량 추가버튼
	$('#btnWeightAdd').on('click', function() {
		if($('#itemCd').val() == '' || $('#itemCd').val() == undefined){
			toastr.warning("품번을 입력해주세요.");
			$('#btnItemCd').focus();
			return false;
		}
		
		btnView = '';
		sideView2 = "add";
		if($('input[name=mainGubun]:checked').val() == '001'){
			$('#weightAdmTable').DataTable().row.add({}).draw(false);
		} else if($('input[name=mainGubun]:checked').val() == '002') {
			$('#weightAdmTable').DataTable().row.add({}).draw(false);
		}
		
 		$('#btnWeightSave').removeClass('d-none'); // 등록버튼
	});
	
	
	//외관 수정버튼
	$('#btnExtEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
// 		btnView = '';
		console.log(tableIdx);
		$('#extAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
		$('#extAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled',false);
		$('#extAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled',false);
 		$('#btnExtSave').removeClass('d-none');
	});
	
	//치수 수정버튼
	$('#btnSizeEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
// 		btnView = '';
		console.log(tableIdx);
		$('#sizeAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspOrder]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled', false);

		$('#sizeAdmTable2 td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspList]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspOrder]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled', false);
		

		$('#btnSizeSave').removeClass('d-none');
	});
	
	//신뢰성 수정버튼
	$('#btnRlbtEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
// 		btnView = '';
		console.log(tableIdx);
		$('#rlbtAdmTable td').find('button[name=inspPlanDate]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('input[name=inspPlan]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('input[name=inspReport]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
 		$('#btnRlbtSave').removeClass('d-none');
	});


	//중량 수정버튼
	$('#btnWeightEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
// 		btnView = '';
		console.log(tableIdx);
		$('#weightAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled',false);
 		$('#btnWeightSave').removeClass('d-none');
	});
	
	//외관 삭제버튼
	$('#btnExtDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//외관 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "001";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					$('#extAdmTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#extAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		btnView = '';

	});
	
	//치수 삭제버튼
	$('#btnSizeDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//치수 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "002";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					$('#sizeAdmTable').DataTable().rows(tableIdx).remove().draw();
					$('#sizeAdmTable2').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#sizeAdmTable').DataTable().rows(tableIdx).remove().draw();
			$('#sizeAdmTable2').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});
	
	//신뢰성 삭제버튼
	$('#btnRlbtDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//신뢰성 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "004";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					$('#rlbtAdmTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#rlbtAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});

	//치수 삭제버튼
	$('#btnWeightDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//치수 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "003";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					$('#weightAdmTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#weightAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});
	
	function uiProc_ext(flag) {
		$("input[name='inspList']").attr("disabled", flag);
	}
	
	function uiProc_size(flag) {
		$("input[name='inspSpc']").attr("disabled", flag);
		$("input[name='inspList']").attr("disabled", flag);
		$("input[name='inspStandUpper']").attr("disabled", flag);
		$("input[name='inspStandLower']").attr("disabled", flag);
	}
	
	function uiProc_rlbt(flag) {
		$("button[name='inspPlanDate']").attr("disabled", flag);
		$("input[name='inspPlan']").attr("disabled", flag);
		$("input[name='inspReport']").attr("disabled", flag);
	}

	function uiProc_weight(flag) {
		$("input[name='inspSpc']").attr("disabled", flag);
		$("input[name='inspList']").attr("disabled", flag);
		$("input[name='inspStandUpper']").attr("disabled", flag);
		$("input[name='inspStandLower']").attr("disabled", flag);
	}

	/* function inspTypeList(){
		$.ajax({
			url : '<c:url value="bm/inspTypeList"/>',
			type : 'GET',
			data  : {
				'etc1' : function(){return inspOnchangeCheck;},
			},
			success  : function(res){
				
				console.log("res:"+res)
				console.log("리스트 수:"+res.length);
				for(var i=0; i<res.length; i++){

					console.log("res.data[0]:"+res.data[0])
					
					$('#typeList').append(
						'<li class="nav-item">'
						+ '<a class="nav-link active" data-toggle="tab" href="#tab1" id="extTab">'+res.data[0].baseNm+'</a>'
						+ '</li>'
				    );
				}
			}
		}) 
	}*/

	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (sideView2 == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (sideView2 == "add" || sideView2 == "edit") {
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


	
</script>

</body>
</html>
