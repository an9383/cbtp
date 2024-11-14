<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog" aria-labelledby="saveBtnModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<h6>현재 진행 중이던 작업을 저장 하시겠습니까?</h6> 
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="saveBtnModalY" data-dismiss="modal">예</button>
	      	<button type="button" class="btn btn-danger" id="saveBtnModalN" data-dismiss="modal">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">거래처정보관리</li>
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
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="dealCorpTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="18%">
								<col width="23%">
								<col width="19%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>거래구분</th>
									<th>거래처코드</th>
									<th>업체명</th>
									<th>대표자</th>
									<th>대표품목</th>
									<th>사업자번호</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 44%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item">
									<a class="nav-link active show" data-toggle="tab" href="#tab1" id="tab1Nav">기본정보</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Nav">관련자료</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<!--오른쪽 등록 부분 하단 버튼 영역-->
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnSaveConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnDelConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
							</div>

							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered" id="">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr style="border-collapse: separate; border-spacing: 0 20px;">
											<th>거래구분</th>
											<td colspan="2">
												<div class="container">	
													<div class="row">
														<div class="col-sm">
															<input class="custom-radio mt-1" type="radio" id="dealChk1" name="dealChkGrp1" value="001" disabled="disabled" checked> 
															<label class="" for="dealChk1">고객사</label>
														</div>
														<div class="col-sm">
															<input class="custom-radio mt-1" type="radio" id="dealChk2" name="dealChkGrp1" value="002" disabled="disabled"> 
															<label class="" for="dealChk2">공급사</label>
														</div>
														<div class="col-sm">
															<input class="custom-radio mt-1" type="radio" id="dealChk3" name="dealChkGrp1" value="003" disabled="disabled"> 
															<label class="" for="dealChk3">외주사</label>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>*거래처코드</th>
											<td><input type="text" class="form-control" id="dealCorpCd" name="dealCorpCd" maxlength="6" placeholder="숫자,영어 포함 최대 6자리" style="max-width: 100%"></td>
											<th>*업체명</th>
											<td><input type="text" class="form-control" id="dealCorpNm" maxlength="25" style="max-width: 100%"></td>
										</tr>
										<tr>
											<th>*대표자</th>
											<td>
												<input type="text" class="form-control" id="presidentNm" name="presidentNm" maxlength="25" style="max-width: 100%">
											</td>
											<th>사업자번호</th>
											<td><input type="text" class="form-control" id="corpNo" name="corpNo" maxlength="20" style="max-width: 100%"></td>
										</tr>
										<tr>
											<th>대표품목</th>
											<td colspan='3'>
												<input type="text" class="form-control" style="max-width: 100%" id="repreItem" maxlength="128">
											</td>
										</tr>
										<tr class="d-none">
											<th>업태</th>
											<td><input type="text" class="form-control" id="bizCond"
												name="bizCond" maxlength="20"></td>
											<th>업종</th>
											<td><input type="text" class="form-control" id="bizType"
												name="bizType" maxlength="20"></td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td>
												<input type="text" style="max-width: 100%;" placeHolder="우편번호" class="form-control" 
												id="addrNo" name="addrNo" maxlength="6" disabled>
											</td>
											<td>
												<button type="button" style="min-width : 100%" class="btn btn-primary float-right" id="zipNumber">우편번호 찾기</button>
											</td>

										</tr>
										<tr>
											<th rowspan="2">주소</th>
											<td colspan='3'><input type="text"
												style="max-width: 100%" class="form-control" id="addrBase" placeHolder="도로명주소"
												name="addrBase" maxlength="128" disabled></td>
										</tr>
										<tr>
											<td colspan='3'><input type="text"
												style="max-width: 100%" class="form-control" id="addrDtl" placeHolder="상세주소"
												name="addrDtl" maxlength="128" disabled></td>
										</tr>
										<tr>
											<th>회사구분</th>
											<td><select class="custom-select" id="companyGubun" style="max-width: 100%;"></select></td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td><input type="text" class="form-control" id="telNo" name="telNo" maxlength="20" style="max-width: 100%;"></td>
											<th>팩스번호</th>
											<td><input type="text" class="form-control" id="faxNo" name="faxNo" maxlength="20" style="max-width: 100%;"></td>
										</tr>
										<tr>
											<th>E-mail</th>
											<td><input type="text" class="form-control" id="emailAddr" name="emailAddr" maxlength="128" style="max-width: 100%;"></td>
											<th>업무담당</th>
											<td>
												<input type="text" class="form-control" id="officeCharger" name="officeCharger" maxlength="20" style="max-width: 100%;">
											</td>
										</tr>
										<tr>
											<th>홈페이지</th>
											<td><input type="text" class="form-control" id="dealHomepage" name="dealHomepage" maxlength="128" style="max-width: 100%;"></td>
											<th>세금계산서이메일</th>
											<td>
												<input type="text" class="form-control" id="taxEmail" name="taxEmail" maxlength="128" style="max-width: 100%;">
											</td>
										</tr>
										<tr>
											<th>영업담당</th>
											<td><input type="text" class="form-control" id="bizCharger" name="bizCharger" maxlength="20" style="max-width: 100%;"></td>
											<th>비고</th>
											<td><input type="text" class="form-control" id="dealCorpDesc" name="dealCorpDesc" style="max-width: 100%;" disabled></td>
										</tr>
										<tr class="d-none">
											<th>사용여부</th>
											<td colspan="3">
												<div style="display: inline-flex; margin-right: 0.5rem;">
													<input type="radio" class="" id="spChk11" name="spChkGrp1" value="사용"/>
													<label class="" for="spChk11">사용</label>
												</div>
												<div style="display: inline-flex; margin-right: 0.5rem;">
													<input type="radio" class="" id="spChk12" name="spChkGrp1" value="미사용">
													<label class="" for="spChk12">미사용</label>
												</div>
											</td>
										</tr>
										<!--==========/table 내용 추가==========-->
									</table>
									<table class="table table-bordered mt-5 d-none" id="changeHisTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>변경내역</th>
											<td colspan='3'>
												<input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20">
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<!--====start====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right mr-1 d-none"
									id="btnAttachSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAttachSaveConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-danger float-right mr-1"
									id="btnVisitDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnVisitAdd">추가</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="dealCorpVistTable">
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
												<th>*일자</th>
												<th>*등록자</th>
												<th>첨부파일 종류</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
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
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">거래처정보 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" >
					<hr class="text-secondary">
					<div class="table-responsive" style="height: 700px;">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>거래처코드</th>
								<th>거래처명</th>
								<th>이니셜</th>
								<th>대표자명</th>
								<th>국가명</th>
								<th>사업자번호</th>
								<th>법인주민번호</th>
								<th>업태</th>
								<th>업종</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>주소상세</th>
								<th>전화번호</th>
								<th>팩스번호</th>
								<th>메일</th>
								<th>과세</th>
								<th>업무담당</th>
								<th>영업담당</th>
								<th>거래구분</th>
								<th>사용여부</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					</div>
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
	<!--=======모달영역====================================================-->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

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

	let currentHref = "bmsc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","거래처정보관리"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	var activeTab = '기본정보';
	var count = 0;
	var visitSeq;
	var urlData = null;
	var dealGubunList = '';
	uiProc(true);

	// 공통코드 처리 시작
	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var dealGubun_com = new Array();
	<c:forEach items="${dealGubun_com}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	dealGubun_com.push(json);
	</c:forEach>
	
	var visitContent = new Array();
	<c:forEach items="${visitContent}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	visitContent.push(json);
	</c:forEach>
	
	var companyGubun = new Array();
	<c:forEach items="${companyGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	companyGubun.push(json);
	</c:forEach>
	// 공통코드 처리 끝

	//셀렉트박스 초기설정
	selectBoxAppend(companyGubun, "companyGubun", "", "2");

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	$('#saveBtnModalY').on('click', function() {
		if(btnSaveFunction()){
			uiProc(true);
			$('#btnSave').addClass('d-none');
			$('#btnAdd').attr('disabled', false);
			$('#btnEdit').attr('disabled', false);
			$('#btnDel').attr('disabled', false);
			$('#btnVisitAdd').attr('disabled', false);
			$('#btnVisitDel').attr('disabled', false);
			$("#createValue").remove();
			$("#visit").removeClass('disabled');
			$('#dealCorpVistTable').DataTable().ajax.reload();
			$('#changeHisTable').addClass('d-none');
			$('#changeHis').val('');
			
			readFunction();
		}
	});
	
	$('#saveBtnModalN').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnVisitAdd').attr('disabled', false);
		$('#btnVisitDel').attr('disabled', false);
		$("#createValue").remove();
		$("#visit").removeClass('disabled');
		$('#dealCorpVistTable').DataTable().ajax.reload();
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		
		readFunction();
		
	});

	$("#tab2Nav").addClass('disabled');

 	// 목록
	let dealCorpTable = $('#dealCorpTable').DataTable({
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
		searching : true,
// 		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/dealCorpDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'dealGubun' : function(){return dealGubunList;},
			}
		},
		rowId : 'dealCorpCd',
		columns : [ 
			{
				data : 'dealGubunNm',
				'className' : 'text-center'
			}, 
			{
				data : 'dealCorpCd',
				'className' : 'text-center'
			}, 
			{
				data : 'dealCorpNm',
				'className' : 'text-center'
			}, 
			{
				data : 'presidentNm',
				'className' : 'text-center'
			}, 
			{
				data : 'repreItem',
				'className' : 'text-center'
			}, 
			{
				data : 'corpNo',
				'className' : 'text-center'
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 
			'excel', 'print' 
	   	],
		
	}); 


	// 보기
	$('#dealCorpTable tbody').on('click','tr',function() {
		
		sideView = 'edit';
		$('#tab1Nav').tab('show');
		
		dealCorpCd = dealCorpTable.row(this).data().dealCorpCd;
		
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		} else {
			if ($('#dealCorpTable tbody tr#'+dealCorpCd).hasClass('selected')) {
			} else {
				$('#dealCorpTable').DataTable().$('tr.selected').removeClass('selected');
				$('#dealCorpTable tbody tr#'+dealCorpCd).addClass("selected");
			}
		}
		
		readFunction ();
		
	});
	
	function readFunction () {
		
		sideView = 'edit';
		$('#tab1Nav').tab('show');
		
		if ($('#dealCorpTable tbody tr#'+dealCorpCd).hasClass('selected')) {
		} else {
			$('#dealCorpTable').DataTable().$('tr.selected').removeClass('selected');
			$('#dealCorpTable tbody tr#'+dealCorpCd).addClass("selected");
		}


		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); // 수정버튼
		$('#btnDel').attr('disabled', false); // 삭제버튼

		$('#btnAdd').removeClass('d-none');
		$('#btnEdit').removeClass('d-none');
		$('#btnDel').removeClass('d-none');
		$('#btnVisitAdd').addClass('d-none');
		$('#btnVisitDel').addClass('d-none');
		$('#btnSave').addClass('d-none');
		$("#tab2Nav").removeClass('disabled');
		
		$.ajax({
			url : '<c:url value="/bm/dealCorpDataRead"/>',
			type : 'GET',
			data : {
				'dealCorpCd' : function(){return dealCorpCd;}
			},
			success : function(res) {
				let data = res.data;
				let statusYn = res.statusYn;

				if (res.result == 'ok') {

					// 보기
					$('#dealCorpCd').val(data.dealCorpCd);
					$('#dealCorpNm').val(data.dealCorpNm);
					$('#presidentNm').val(data.presidentNm);
					$('#corpNo').val(data.corpNo);
					$('#repreItem').val(data.repreItem);
					$('#bizCond').val(data.bizCond);
					$('#bizType').val(data.bizType);
					$('#addrNo').val(data.addrNo);
					$('#addrBase').val(data.addrBase);
					$('#addrDtl').val(data.addrDtl);
					$('#telNo').val(data.telNo);
					$('#faxNo').val(data.faxNo);
					$('#emailAddr').val(data.emailAddr);
					$('#dealHomepage').val(data.dealHomepage);
					$('#taxEmail').val(data.taxEmail);
					$('#officeCharger').val(data.officeCharger);
					$('#bizCharger').val(data.bizCharger);
					$('#dealGubun').val(data.dealGubun);
					$('#useYn').val(data.useYn);
					$('#dealCorpDesc').val(data.dealCorpDesc);
					
					//radioButton
					if(data.dealGubun == '001'){
						$('#dealChk1').prop('checked', true);
					}else if(data.dealGubun == '002'){
						$('#dealChk2').prop('checked', true);
					}else if(data.dealGubun == '003'){
						$('#dealChk3').prop('checked', true);
					}

					
					uiProc(true);
					selectBoxAppend(companyGubun, "companyGubun", data.companyGubun, "2");
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">거래구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="dealGubun_com" onChange="dealOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>';
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/dealCorpBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html1 += '</div>';

	$('#dealCorpTable_length').html(html1);
	selectBoxAppend(dealGubun_com, "dealGubun_com", dealGubunList, "1");
	
	function dealOnchange(){
		dealGubunList = $("#dealGubun_com option:selected").val();
		if(dealGubunList == '001'){
			$('#dealChk1').prop('checked', true);
		}else if(dealGubunList == '002'){
			$('#dealChk2').prop('checked', true);
		}else if(dealGubunList == '003'){
			$('#dealChk3').prop('checked', true);
		}

		$('#dealCorpTable').DataTable().ajax.reload(function(){});
		
	}
	
	// 등록 버튼 click 
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#dealCorpTable').DataTable().$('tr.selected').removeClass('selected');
		$('#form').each(function() {
			this.reset();
		});
		
		uiProc(false);

		selectBoxAppend(companyGubun, "companyGubun", "002", "2");

		$('input:radio[name=dealChkGrp1]:radio[value="'+dealGubunList+'"]').prop('checked',true);
		$("#tab2Nav").addClass('disabled');
		$('#btnSave').removeClass('d-none'); 	// 등록버튼
		$('#btnEdit').attr('disabled', true); 	// 수정버튼
		$('#btnDel').attr('disabled', true); 	// 삭제버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		uiProc(false);
		$('#dealCorpCd').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
		$("#tab2Nav").addClass('disabled');
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
	});

	// 저장 처리
	$('#btnSave').on('click', function() {
		btnSaveFunction();
	});
	
	function btnSaveFunction () {
		if (activeTab == "기본정보") {
			if (!$.trim($('#dealCorpCd').val())) {
				toastr.warning('거래처코드를 입력해주세요.');
				$('#dealCorpCd').focus();
				return false;
			}
			
			var dealCorpCdCheck = false;
			
			if(sideView == 'add'){
				$.ajax({
					url : '<c:url value="bm/dealCorpDataRead"/>',
					type : 'GET',
					async : false,
					data : {
						'dealCorpCd' : function() {return $('#dealCorpCd').val();},
					},
					success : function(res) {
						let data = res.data;
						
						if(data != null){
							dealCorpCdCheck = true;
						}
					}
					
				});
			}
		
			if (dealCorpCdCheck) {
				toastr.warning('중복된 거래처코드 입니다.');
				$('#dealCorpCd').val('');
				$('#dealCorpCd').focus();
				return false;
			}
			
			if (!$.trim($('#dealCorpNm').val())) {
				toastr.warning('업체명을 입력해주세요.');
				$('#dealCorpNm').focus();
				return false;
			}

			if (!$.trim($('#presidentNm').val())) {
				toastr.warning('대표자를 입력해 주세요.');
				$('#presidentNm').focus();
				return false;
			}

// 			if (!$.trim($('#corpNo').val())) {
// 				toastr.warning('사업자번호를 입력해주세요.');
// 				$('#corpNo').focus();
// 				return false;
// 			}
			
// 			if (!$.trim($('#repreItem').val())) {
// 				toastr.warning('대표품목을 입력해주세요.');
// 				$('#repreItem').focus();
// 				return false;
// 			}

			var url = '/bm/dealCorpCreate';
			if (sideView == "edit") {
				url = '/bm/dealCorpUpdate'
			}

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'dealCorpCd'  : $('#dealCorpCd').val(),
					'dealCorpNm'  : $('#dealCorpNm').val(),
					'repreItem'	  : $('#repreItem').val(),
					'presidentNm' : $('#presidentNm').val(),
					'corpNo' 	  : $('#corpNo').val(),
					'bizCond'     : $('#bizCond').val(),
					'bizType'     : $('#bizType').val(),
					'addrNo'      : $('#addrNo').val(),
					'addrBase'    : $('#addrBase').val(),
					'addrDtl'     : $('#addrDtl').val(),
					'telNo'       : $('#telNo').val(),
					'faxNo'       : $('#faxNo').val(),
					'emailAddr'   : $('#emailAddr').val(),
					'dealHomepage'   : $('#dealHomepage').val(),
					'taxEmail'   : $('#taxEmail').val(),
					'officeCharger' : $('#officeCharger').val(),
					'bizCharger'  : $('#bizCharger').val(),
					'companyGubun'  : $('#companyGubun').val(),
					'dealGubun'   : $('input[name=dealChkGrp1]:checked').val(),
					'useYn'       : '001',
					'dealCorpDesc' : $('#dealCorpDesc').val(),
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
// 						dealCorpCd = $('#dealCorpCd').val();
						$('#dealCorpTable').DataTable().ajax.reload(null, false);

						$('#dealCorpTable tbody tr#'+$('#dealCorpCd').val()).addClass("selected");
						uiProc(true);
						$("#tab2Nav").removeClass('disabled');
						$('#btnSave').addClass('d-none');
						$('#btnAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
						$('#btnDel').attr('disabled', false);

						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else {
							toastr.success('등록되었습니다.');
						}

						sideView = 'edit';
// 						$('#form').each(function() {
// 							this.reset();
// 						});

					} else if (res.result == "exist") {
						toastr.error('업체명이 중복되었습니다.');
						$('#dealCorpNm').focus();
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
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
					complete : function() {
// 						$('#btnAddConfirm').removeClass('d-none');
// 						$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}else{
				$('#changeHisTable').addClass('d-none');
			}
			
		}
		return true;
	}


	//입고수량 숫자 및 영문만 입력하게 처리
	$(document).on('keyup',"#dealCorpCd", function(event){
		var preInWhsQtyData = $(this).val();
		if (!(
				(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || //숫자
				(event.which >= 97 && event.which <= 122) || (event.which >= 65 && event.which <= 90) || //영문
					(event.which >= 37 && event.which <= 40) || //화살표
						event.which == 8 || event.which == 9 || //backspace,tab
							event.which == 13 || event.which == 16 || event.which == 46) //shift,enter,delete
			) {
			toastr.warning('숫자 및 영문만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val($(this).val());
	}); 


	function uiProc(flag) {
		$("#dealChk1").attr("disabled", flag);
		$("#dealChk2").attr("disabled", flag);
		$("#dealChk3").attr("disabled", flag);
		$("#dealCorpCd").attr("disabled", flag);
		$("#dealCorpNm").attr("disabled", flag);
		$("#presidentNm").attr("disabled", flag);
		$("#corpNo").attr("disabled", flag);
		$("#repreItem").attr("disabled", flag);
		$("#bizCond").attr("disabled", flag);
		$("#bizType").attr("disabled", flag);
		$("#zipNumber").attr("disabled", flag);
		$("#companyGubun").attr("disabled", flag);
		$("#telNo").attr("disabled", flag);
		$("#faxNo").attr("disabled", flag);
		$("#emailAddr").attr("disabled", flag);
		$("#dealHomepage").attr("disabled", flag);
		$("#taxEmail").attr("disabled", flag);
		$("#officeCharger").attr("disabled", flag);
		$("#bizCharger").attr("disabled", flag);
		$("#dealCorpDesc").attr("disabled", flag);

// 		$("#initial").attr("disabled", flag);
// 		$("#country").attr("disabled", flag);
// 		$("#registNo").attr("disabled", flag);
// 		$("#tax").attr("disabled", flag);
// 		$("#btnSelOfficeUser").attr("disabled", flag);
// 		$("#btnSelBizUser").attr("disabled", flag);
// 		$("#dealGubun").attr("disabled", flag);
// 		$("#useYn").attr("disabled", flag);
// 		$('.closeBtn').attr("disabled", flag);

		
	}

	//기본정보 탭 클릭시 
	$('#tab1Nav').on('click', function() {
		$('#btnVisitAdd').addClass('d-none');
		$('#btnVisitDel').addClass('d-none');
		$('#btnAdd').removeClass('d-none');
		$('#btnEdit').removeClass('d-none');
		$('#btnDel').removeClass('d-none');
		$('#dealCorpVistTable').DataTable().ajax.reload();
	});

	//방문관련자료 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#btnVisitAdd').removeClass('d-none');
		$('#btnVisitDel').removeClass('d-none');
		$('#btnVisitAdd').attr('disabled', false);
		$('#btnVisitDel').attr('disabled', false);
		$('#btnAdd').addClass('d-none');
		$('#btnEdit').addClass('d-none');
		$('#btnDel').addClass('d-none');
		$('#btnSave').addClass('d-none');
		$("#createValue").remove();
		$('#dealCorpVistTable').DataTable().ajax.reload();
	});

	status = '';
	
	//관련자료 테이블
	let dealCorpVistTable = $('#dealCorpVistTable').DataTable({
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
			url : '<c:url value="/bm/dealCorpVisitList"/>',
			type : 'POST',
			data : {
				'dealCorpCd' : function() {return dealCorpCd;}
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					},
					'className' : 'text-center'
				},
				{
					render : function(data, type, row) {
						return moment(row['visitDate']).format(
								'YYYY-MM-DD');
					},
					'className' : 'text-center'
				},
				{
					data : 'regNm',
					'className' : 'text-center'
				},
				{
					data : 'visitContent',
					render : function(data, type, row) {
						if (data != null) {
							return '<input type="text" class="form-control" name="visitContent" value="'
									+ data
									+ '"  style="border:none; min-width:100%;" disabled>';
						} else {
							return '<input type="text" class="form-control" name="visitContent" value=""  style="border:none; min-width:100%;" disabled>';
						}
					}
				},
				{
					data : 'fileNm',
					render : function(data, type, row) {

						if (data != null) {
							return '<a href="/bm/downloadFile?dealCorpCd='
									+ row['dealCorpCd']
									+ '&visitSeq='
									+ row['visitSeq']
									+ '">'
									+ data + '</a>';
						} else {
							return '<a href="/bm/downloadFile?dealCorpCd='
									+ row['dealCorpCd']
									+ '&visitSeq='
									+ row['visitSeq']
									+ '"></a>';
						}
					}
				} ],
		buttons : []
	});

	//데이터 클릭 시
	$('#dealCorpVistTable tbody').on(
			'click',
			'tr',
			function() {
				if (status == "updating") {
					return;
				}

				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#dealCorpVistTable').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}

				status = "choice";
				dealCorpCd = dealCorpVistTable.row(this).data().dealCorpCd;
				visitSeq = dealCorpVistTable.row(this).data().visitSeq;
			});

	//추가버튼
	$('#btnVisitAdd').on('click',function() {

		count = dealCorpVistTable.data().count();
		if (count == 0) {
			$('#dealCorpVistTable tbody').empty();
		}

		$.ajax({
			url : '<c:url value="/bm/dealCorpVisitSeq"/>',
			type : 'GET',
			data : {
				'dealCorpCd' : function() {return dealCorpCd;}
			},
			success : function(res) {
				visitSeq = res.seq;

				$('#dealCorpVistTable > #dataInsert').append(
					'<tr id="createValue"><td style="text-align:center;">'
					+ (count + 1)
					+ '</td>'
					+ '<td>'
					+ '<div class="form-group input-sub m-0 row">'
					+ '<input class="form-control" type="text" id="visitDate" value="'+serverDate+'"name="visitDate" disabled/>'
					+ '<button onclick="fnPopUpCalendar(visitDate,visitDate,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
					+ 'id="visitDateCalendar" type="button">'
					+ '<span class="oi oi-calendar"></span>'
					+ '</button>'
					+ '</div>'
					+ '</td>'
					+ '<td style="text-align:center;">'
					+ userNm
					+ '</td>'
					+ '<td><select class="form-control p-0" name="visitContent" id="visitContent" style="min-width:100%"/></td>'
					+ '<td><form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">'
					+ '<input type="file" class="custom-file-input" id="fileNm" name="file">'
					+ '<label class="custom-file-label" for="fileNm"></label>'
					+ '</div></form></td>'
					+ '</tr>'
				);
				
				selectBoxAppend(visitContent, "visitContent", "", "");
				selectBoxAppend(companyGubun, "companyGubun", "", "");
			}
		});

		$('#btnCheck').attr("disabled", false);
		$('#viewBox').addClass('d-none');
		$('#btnAttachSave').removeClass('d-none');
		$('#btnVisitAdd').attr('disabled', true); //추가버튼
		$('#btnVisitDel').attr('disabled', true); //삭제버튼		

	});

	//저장 버튼 클릭
	$('#btnAttachSave').on('click',function() {
		if (activeTab == "관련자료") {
	
			if (!$.trim($('#visitContent').val())) {
				toastr.warning('내용을 입력해주세요.');
				$('#visitContent').focus();
				return false;
			}
	
			if (!$.trim($('#fileNm').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#fileNm').focus();
				return false;
			}
	
			var formData = new FormData(document.getElementById("formFile"));
			
			formData.append('dealCorpCd', dealCorpCd);
			formData.append('visitSeq', visitSeq);
			formData.append('visitContent', $("#visitContent option:selected").text());
			formData.append('visitDate', $('#visitDate').val().replace(/-/g, ''));
	
			$.ajax({
				url : '<c:url value="/bm/dealCorpVisitCreate"/>',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(res) {
					if (res.result == 'ok') {
						// 보기
						toastr.success('등록되었습니다.');
						status = '';
					} else {
						toastr.error(res.message);
					}
					$('#dealCorpVistTable').DataTable().ajax.reload();
				}
			});
	
			$('#dealCorpVistTable').DataTable().ajax.reload();
			$('#formBox').removeClass('d-none');
			$('#equipCodeTable').DataTable().ajax.reload();
			$('#btnAttachSave').addClass('d-none');
			$('#btnVisitAdd').attr('disabled', false);
			$("#btnVisitDel").attr("disabled", false);
			$("#createValue").remove();
		}
	});

	//삭제 버튼 클릭
	$('#btnVisitDel').on('click', function() {
		if (status != 'choice') {
			toastr.warning("삭제할 목록을 선택해 주세요!");
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/dealCorpVisitDelete"/>',
			type : 'POST',
			data : {
				'dealCorpCd' : function(){return dealCorpCd;},
				'visitSeq' : function(){return visitSeq;},
			},
			success : function(res) {
				// 보기
				$('#dealCorpVistTable').DataTable().ajax.reload();
				$('#btnAttachSave').addClass('d-none');
				toastr.success('삭제되었습니다.');
				status = '';
				$('#formBox').removeClass('d-none');

			},
			complete : function() {
				$('#equipAttachTable').DataTable().ajax.reload();

			}
		});
	});

	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/dealCorpExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				}
			},
			{data : 'dealCorpCd'},
			{data : 'dealCorpNm'},
			{data : 'initial'},
			{data : 'presidentNm'},
			{data : 'country'},
			{data : 'corpNo'},
			{data : 'registNo'},
			{data : 'bizCond'},
			{data : 'bizType'},
			{data : 'addrNo'},
			{data : 'addrBase'},
			{data : 'addrDtl'},
			{data : 'telNo'},
			{data : 'faxNo'},
			{data : 'emailAddr'}, 
			{data : 'tax'},
			{data : 'officeCharger'},
			{data : 'bizCharger'},
			{data : 'dealGubun'},
			{data : 'useYn',
				render : function(data, type, row, meta){
					if(data!=null){
						console.log(data);
						return data;
					}else{
						console.log("001")
						return "001";
					}
				}
			}, 
			{data : 'dealCorpDesc'}
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);
	
		var str = $('#btnExcelUpload').val();
		index = 0;
	
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/dealCorpExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});

	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.dealCorpCd= inTable.row(index).data().dealCorpCd==null?"": inTable.row(index).data().dealCorpCd;
			rowData.dealCorpNm= inTable.row(index).data().dealCorpNm==null?"": inTable.row(index).data().dealCorpNm;
			rowData.initial= inTable.row(index).data().initial==null?"": inTable.row(index).data().initial;
			rowData.presidentNm= inTable.row(index).data().presidentNm==null?"": inTable.row(index).data().presidentNm;
			rowData.country= inTable.row(index).data().country==null?"": inTable.row(index).data().country;
			rowData.corpNo= inTable.row(index).data().corpNo==null?"": inTable.row(index).data().corpNo;
			rowData.registNo= inTable.row(index).data().registNo==null?"": inTable.row(index).data().registNo;
			rowData.bizCond= inTable.row(index).data().bizCond==null?"": inTable.row(index).data().bizCond;
			rowData.bizType= inTable.row(index).data().bizType==null?"": inTable.row(index).data().bizType;
			rowData.addrNo= inTable.row(index).data().addrNo==null?"": inTable.row(index).data().addrNo;
			rowData.addrBase= inTable.row(index).data().addrBase==null?"": inTable.row(index).data().addrBase;
			rowData.addrDtl= inTable.row(index).data().addrDtl==null?"": inTable.row(index).data().addrDtl;
			rowData.telNo= inTable.row(index).data().telNo==null?"": inTable.row(index).data().telNo;
			rowData.faxNo= inTable.row(index).data().faxNo==null?"": inTable.row(index).data().faxNo;
			rowData.emailAddr= inTable.row(index).data().emailAddr==null?"": inTable.row(index).data().emailAddr;
			rowData.tax= inTable.row(index).data().tax==null?"": inTable.row(index).data().tax;
			rowData.officeCharger= inTable.row(index).data().officeCharger==null?"": inTable.row(index).data().officeCharger;
			rowData.bizCharger= inTable.row(index).data().officeCharger==null?"": inTable.row(index).data().officeCharger;
			rowData.dealGubun= inTable.row(index).data().dealGubun==null?"": inTable.row(index).data().dealGubun;
			rowData.useYn= inTable.row(index).data().useYn==null?"": inTable.row(index).data().useYn;
			rowData.dealCorpDesc= inTable.row(index).data().dealCorpDesc==null?"": inTable.row(index).data().dealCorpDesc;
			
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/dealCorpExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#dealCorpTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	
	//input click event
	function fn_jusoPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	var mySggNm = '';
	var myEmdNm = '';
	var mySiNm = '';
	var myZipNo;
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		console.log("road full" + roadFullAddr, "road part 1"+roadAddrPart1, "add Detail"+addrDetail, "load Part 2"+roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);			
		//인풋 벨류
		$("#search-input").val(roadFullAddr);
		//값 넣어주기
		$("#addrNo").val(zipNo);
		$("#addrBase").val(roadAddrPart1);
		$("#addrDtl").val(addrDetail);
		mySggNm = sggNm;
		myEmdNm = emdNm;
		mySiNm = siNm;
		myZipNo = zipNo;
	     
		console.log(myZipNo + "= zipNo" , mySiNm + "= siNm"  ,mySggNm + "= sggNm" , myEmdNm + "emdNm" );
	}
	
	$("#zipNumber").on("click",function(){
		fn_jusoPopup();
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
			url : '<c:url value="bm/dealCorpDataDelete"/>',
			type : 'POST',
			data :{
				'dealCorpCd' : function(){return dealCorpCd;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#dealCorpTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});

	
</script>

</body>
</html>
