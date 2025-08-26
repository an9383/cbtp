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
				<li class="breadcrumb-item active">부적합관리(자주검사)</li>
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
						<div style="height:400px">
						<table id="itemJajuFaultyTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="14%">
								<col width="15%">
								<col width="17%">
								<col width="17%">
								<col width="8%">
								<col width="15%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>자주검사일</th>
									<th>작지번호</th>
									<th>ITEM</th>
									<th>소공정</th>
									<th>작업자</th>
									<th>S/N</th>
									<th class="text-center">불량수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="row pt-2">
						 <div class="col-6 mt-4">
					    	<table id="itemJajuFaultyDetailTable" class="table table-bordered" style="margin:0!important">
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
							  <table class="table table-bordered" id="">
								<colgroup>
									<col width="20%">
									<col width="40%">
									<col width="40%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th colspan="3">부적합처리</th>
									</tr>
									<tr>
										<th></th>
										<th>수량</th>
										<th>등록일</th>
									</tr>
									<tr>
										<th>재작업</th>
										<td><input type="text" class="form-control" id="reworkQty" name="reworkQty" style="text-align:right;"></td>
										<td><input type="date" class="form-control" id="reworkDate" name="reworkDate" style="max-width:100%"></td>
									</tr>
									<tr>
										<th>폐기</th>
										<td><input type="text" class="form-control" id="disuseQty" name="disuseQty" style="text-align:right;"></td>
										<td><input type="date" class="form-control" id="disuseDate" name="disuseDate" style="max-width:100%"></td>
									</tr>
									<tr>
										<th>부적합 담당자</th>
										<td colspan="2">
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
										<th>비고</th>
										<td colspan="2"><input type="text" class="form-control" id="faultyDesc" name="faultyDesc" style="max-width:100%" disabled></td>
									</tr>
								</thead>
						       </table>
						       </form>
						       <button type="button" class="btn btn-primary float-right mr-1 d-none"
									id="btnDtlSave">저장</button>
								<button class="btn btn-primary d-none" id="btnDtlSaveConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
							   	</button>
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
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">등록</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled="">
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
									<td colspan="3">
										<textarea class="form-control" rows="3" id="faultyStatus" name="faultyStatus"
											style="max-width: 100%; resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<th>불량원인</th>
									<td colspan="3">
										<textarea class="form-control" rows="3"
											id="faultyCause" name="faultyCause"
											style="max-width: 100%; resize: none;"></textarea>
									</td>
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
									<th>조치사항</th>
									<td><input class="form-control" type="text" id="faultyAct"
										name="faultyAct"></td>
									<th>귀책부서</th>
									<td><input class="form-control" type="text"
										id="faultyDept" name="faultyDept"></td>
								</tr>
								<tr>
									<th>부적합보고서 발행번호</th>
									<td><input class="form-control" type="text" id="faultyNo"
										name="faultyNo"></td>
									<th>진행사항</th>
									<td><input class="form-control" type="text"
										id="faultyProg" name="faultyProg"></td>
								</tr>
								<tr>
									<th>개선사항</th>
									<td><input class="form-control" type="text"
										id="faultyImprv" name="faultyImprv"></td>
									<th>유효성</th>
									<td><input class="form-control" type="text"
										id="faultyEffect" name="faultyEffect"></td>
								</tr>
							<!-- 	<tr>
									<th>부적합처리</th>
									<td><select class="custom-select" id="faultyPcs"
										name="faultyPcs"></select></td>
									<th></th>
									<td></td>
								</tr> -->
							</table>
						</div>
					</form>
				</div>
				<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right"
						id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span>처리중
					</button>
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

	let currentHref = "qmsc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","부적합관리(자주검사)"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';

	uiProc(true);
	uiProc2(true);
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	var workOrdNo=null;
	var workOrdSeq=null;
	var middlePrcssCd=null;
	var minorPrcssCd=null;
	var itemCd;
	var itemRev;
	var faultyRegDate;
	var faultyQty;
	var faultyType;

	//공통코드 처리 시작      
	var admDeptCode = new Array(); // 부서명
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

	$('#faultyRegDate').val(serverDate);

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		uiProc2(true);
		$('#btnSave').addClass('d-none');
		$('#btnDtlSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	// 목록
	let itemJajuFaultyTable = $('#itemJajuFaultyTable').DataTable({
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
			url : '<c:url value="qm/itemJajuFaultyList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, "");},
				'endDate' : function() {return serverDateTo.replace(/-/g, "");}
			},
		},
		rowId : 'workOrdNo',
		columns : [ {
			data : 'itemGubunNm'
		}, {
			data : 'faultyTypeDate',
			render : function(data, type, row, meta){
				if(data!=null){
					return moment(data).format("YYYY-MM-DD");
				}else{
					return '-';
				}
			} 
		}, {
			data : 'workOrdNo'
		}, {
			data : 'itemNm'
		}, {
			data : 'minorPrcssNm'
		}, {
			data : 'workChargrNm'
		}, {
			data : 'serialNo'
		}, {
			data : 'faultyQty'
		},
		],
		columnDefs: [
			{ "targets": [7] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '부적합관리(자주검사)'
		}, 'print' ],

	});

	// 보기
	$('#itemJajuFaultyTable tbody').on('click','tr',function() {
		sideView = "edit"
			
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right' || $('#btnDtlSave').attr('class') == 'btn btn-primary float-right mr-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemJajuFaultyTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}


		workOrdNo = itemJajuFaultyTable.row(this).data().workOrdNo;
		workOrdSeq = itemJajuFaultyTable.row(this).data().workOrdSeq;
		middlePrcssCd = itemJajuFaultyTable.row(this).data().middlePrcssCd;
		minorPrcssCd = itemJajuFaultyTable.row(this).data().minorPrcssCd;
		itemCd = itemJajuFaultyTable.row(this).data().itemCd;
		itemRev = itemJajuFaultyTable.row(this).data().itemRev;
		faultyQty = itemJajuFaultyTable.row(this).data().faultyQty;

		$('#itemJajuFaultyDetailTable').DataTable().ajax.reload(function(){});


		//부적합처리 가져오기
		$.ajax({
			url : '<c:url value="qm/itemJajuFaultyJdgAdmRead" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNo;},
				'workOrdSeq' : function(){return workOrdSeq;},
				'middlePrcssCd' : function(){return middlePrcssCd;},
				'minorPrcssCd' :function(){return minorPrcssCd;},
			}, 
			success : function(res){
				let data = res.data;
				
				$('#reworkQty').val(data.reworkQty==""||data.reworkQty==null?data.reworkQty:addCommas(data.reworkQty));
				$('#reworkDate').val(moment(data.reworkDate).format('YYYY-MM-DD'));
				$('#disuseQty').val(data.reworkQty==""||data.reworkQty==null?data.disuseQty:addCommas(data.disuseQty));
				$('#disuseDate').val(moment(data.disuseDate).format('YYYY-MM-DD'));
				$('#faultyChargr').val(data.faultyChargr);
				$('#faultyChargrNm').val(data.faultyChargrNm);
				$('#faultyDesc').val(data.faultyDesc);

				console.log(res.data)
				if(data.regDate==null){
					$('#btnDtlAdd').attr('disabled',false);
					$('#btnDtlEdit').attr('disabled',true);
				}else{
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',false);
				}
			}

		})

	});

	// 목록
	let itemJajuFaultyDetailTable = $('#itemJajuFaultyDetailTable').DataTable({
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
			url : '<c:url value="qm/itemJajuFaultyDetailList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNo;},
				'workOrdSeq' : function(){return workOrdSeq;},
				'middlePrcssCd' : function(){return middlePrcssCd;},
				'minorPrcssCd' :function(){return minorPrcssCd;},
			},
		},
		rowId : '',
		columns : [ {
			render : function(data, type, row, meta) {
				return meta.row+1;
			}
		}, {
			data : 'faultyTypeNm'
		}, {
			data : 'faultyQty'
		}, {
			data : 'faultyRegDate',
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
			title : '부적합관리(자주검사)'
		}, 'print' ],

	});

	// 보기
	$('#itemJajuFaultyDetailTable tbody').on('click','tr',function() {
		sideView2 = "edit"
			
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemJajuFaultyDetailTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}


		faultyTypeCd = itemJajuFaultyDetailTable.row(this).data().faultyTypeCd;
		faultyQty = itemJajuFaultyDetailTable.row(this).data().faultyQty;
		faultyRegDate = itemJajuFaultyDetailTable.row(this).data().faultyRegDate;
		console.log(faultyTypeCd)

		if (faultyRegDate != null) {
			$('#btnAdd').attr('disabled', true);
			$('#btnEdit').attr('disabled', false);
		} else {
			$('#btnAdd').attr('disabled', false);
			$('#btnEdit').attr('disabled', true);
		}
		
		$.ajax({
			url : '<c:url  value="qm/itemJajuFaultyRead"/>',
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNo,
				'workOrdSeq' : workOrdSeq,
				'middlePrcssCd' : middlePrcssCd,
				'minorPrcssCd' : minorPrcssCd,
				'faultyTypeCd' : faultyTypeCd
			},
			success : function(res) {
				let data = res.data;
				if (res.result == "ok") {
					
					$('#admChargr').val(data.admChargr);
					$('#admChargrNm').val(data.admChargrNm);
					$('#admDept').val(data.admDept);
					$('#admDeptNm').val(data.admDeptNm);
					faultyRegDateValue = data.faultyRegDate==null?serverDate:data.faultyRegDate;
					$('#faultyRegDate').val(moment(faultyRegDateValue).format('YYYY-MM-DD'));
					$('#faultyStatus').val(data.faultyStatus);
					$('#faultyCause').val(data.faultyCause);
					$('#faultyAct').val(data.faultyAct);
					$('#faultyDept').val(data.faultyDept);
					$('#faultyNo').val(data.faultyNo);
					$('#faultyProg').val(data.faultyProg);
					$('#faultyImprv').val(data.faultyImprv);
					$('#faultyEffect').val(data.faultyEffect);
					$('#faultyType').val(res.faultyType);

					faultyType = res.faultyType;
					
					selectBoxAppend(admDeptCode, "admDept",data.admDept, "2");
					selectBoxAppend(faultyPcsCode, "faultyPcs",data.faultyPcs, "2");
				}
			}
		});
	});
	
	
	// 등록폼
	$('#btnAdd').on('click', function() {

		if (sideView2 != "edit") {
			toastr.warning("부적합관리 등록할 항목을 선택해주세요.");
			return false;
		}

		sideView2 = 'add';
		$('#form').each(function() {
			this.reset();
		});

		//화면처리        
		selectBoxAppend(admDeptCode, "admDept","", "2");
		selectBoxAppend(faultyPcsCode, "faultyPcs","", "2");
					
		uiProc(false);
		$('#faultyType').val(faultyType);
		$('#faultyRegDate').val(serverDate);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); // 수정버튼

	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("부적합관리 수정할 항목을 선택해주세요.");
			return false;
		}
		
		uiProc(false);
		$('#faultyPcs').attr('disabled',true);

		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');

	});

	function deleteImg(value) {
		$.ajax({
			url : '<c:url  value="qm/itemFaultyImageDelete"/>',
			type : 'GET',
			data : {
				'value' : value,
				'poNo' : poNo,
				'poSeq' : poSeq,
				'inSeq' : inSeq
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
					}

				}
			}
		});
	}

	// 저장 처리
	$('#btnSave').on('click',function() {

		//입력값 검사
		if ($('#admDept option:selected').val()=="") {
			toastr.warning('부서명을 선택해주세요.');
			$('#admDept').focus();
			return false;
		}
		if (!$.trim($('#admChargrNm').val())) {
			toastr.warning('담당자를 입력해주세요.');
			$('#btnAdmChargr').focus();
			return false;
		}

		if (!$.trim($('#faultyStatus').val())) {
			toastr.warning('불량현상을 입력해주세요.');
			$('#faultyStatus').focus();
			return false;
		}
		
		if (!$.trim($('#faultyCause').val())) {
			toastr.warning('불량원인을 입력해주세요.');
			$('#faultyCause').focus();
			return false;
		}
		
		var formData = new FormData(document.getElementById("form"));
		formData.append('workOrdNo', workOrdNo);
		formData.append('workOrdSeq', workOrdSeq);
		formData.append('middlePrcssCd', middlePrcssCd);
		formData.append('minorPrcssCd', minorPrcssCd);
		formData.append('itemCd', itemCd);
		formData.append('itemRev', itemRev);
		formData.append('faultyQty', faultyQty);
		formData.append('faultyTypeCd', faultyTypeCd);
		formData.append('admChargr', $('#admChargr').val());
		formData.append('faultyRegDate', $('#faultyRegDate').val().replace(/-/g, ''));

		var url = '<c:url value="/qm/itemJajuFaultyCreate"/>';

		if (sideView2 == "edit") {
			url = '<c:url value="/qm/itemJajuFaultyUpdate"/>';
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
					$('#itemJajuFaultyTable').DataTable().ajax.reload(function() {});
					$('#itemJajuFaultyDetailTable').DataTable().ajax.reload(function() {});
					
					uiProc(true);
					$('#btnSave').addClass('d-none');

					if (sideView2 == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
						$('#btnAdd').attr('disabled', true);
						$('#btnEdit').attr('disabled', false);
					}

					$('#imageFile1').attr("src",'data:image/jpg;base64,'+ res.faultyImage1);
					$('#imageFile2').attr("src",'data:image/jpg;base64,'+ res.faultyImage2);

					sideView = 'add';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
			}
		});
	});


	//등록버튼
	$('#btnDtlAdd').on('click',function(){
		if (sideView != 'edit') {
			toastr.warning("부적합처리 등록할 항목을 선택해주세요.");
			return false;
		}

		$('#form2').each(function() {
			this.reset();
		});

		btnView = 'add';
		uiProc2(false);

		$('#reworkDate').val(serverDate);
		$('#disuseDate').val(serverDate);
		$('#btnDtlSave').removeClass('d-none');
	});

	//수정버튼
	$('#btnDtlEdit').on('click',function(){
		if (sideView != 'edit') {
			toastr.warning("부적합처리 수정할 항목을 선택해주세요.");
			return false;
		}
		
		btnView = 'edit';
		uiProc2(false);
		$('#btnDtlSave').removeClass('d-none');
	});


	//저장버튼
	$('#btnDtlSave').on('click',function(){

		
		if ((parseInt($('#reworkQty').val())+parseInt($('#disuseQty').val())) > parseInt(faultyQty)) {
			toastr.warning('부적합처리수량이 불량수량보다 큽니다. 확인해주세요.');
			$('#reworkQty').focus();
			return false;
		}
		
		if(btnView=="add"){
			url = '<c:url value="qm/itemJajuFaultyJdgAdmCreate" />';
		}else{
			url = '<c:url value="qm/itemJajuFaultyJdgAdmUpdate" />';
		}
		 
		$.ajax({
			url : url,
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNo,
				'workOrdSeq' : workOrdSeq,
				'middlePrcssCd' : middlePrcssCd,
				'minorPrcssCd' : minorPrcssCd,
				'middlePrcssCd' : middlePrcssCd,
				'itemCd' : itemCd,
				'itemRev' : itemRev,
				'reworkQty'  :$('#reworkQty').val().replace(/,/g,''),
				'reworkDate'  :$('#reworkDate').val().replace(/-/g,''),
				'disuseQty'  :$('#disuseQty').val().replace(/,/g,''),
				'disuseDate'  :$('#disuseDate').val().replace(/-/g,''),
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
				}else if(res.result=="excess"){
					toastr.warning("불량수량을 초과하였습니다.");
				}
			}
		})
	});

	
	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectadmChargr(value) {
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
				var data = userPopUpTable.row(this).data();

				if(value==1){
					$('#admChargr').val(data.userNumber);
					$('#admChargrNm').val(data.userNm);
				}else{
					$('#faultyChargr').val(data.userNumber);
					$('#faultyChargrNm').val(data.userNm);
				}
			
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="faultyRegDateFrom" name="faultyRegDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(faultyRegDateFrom,faultyRegDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="faultyRegDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="faultyRegDateTo" name="faultyRegDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(faultyRegDateTo,faultyRegDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="faultyRegDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#itemJajuFaultyTable_length').html(html1);
	$('#faultyRegDateFrom').val(serverDateFrom);
	$('#faultyRegDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#faultyRegDateFrom').val();
		serverDateTo = $('#faultyRegDateTo').val();

		$('#itemJajuFaultyTable').DataTable().ajax.reload(function() {
		});

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
		$("#reworkQty").attr("disabled", flag);
		$("#reworkDate").attr("disabled", flag);
		$("#disuseQty").attr("disabled", flag);
		$("#disuseDate").attr("disabled", flag);
		$("#btnfaultyChargr").attr("disabled", flag);
		$("#faultyDesc").attr("disabled", flag);
	}
</script>

</body>
</html>
