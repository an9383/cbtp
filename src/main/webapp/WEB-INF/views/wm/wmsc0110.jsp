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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">재작업관리</li>
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
					<div class="table-responsive">
						<table id="reworkOrdAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>기존작지번호</th>
									<th>재작업 작지번호</th>
									<th>발주처</th>
									<th>품명(Type)</th>
									<th>REV</th>
									<th>발생위치</th>
									<th>등록일</th>
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
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-3">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right"
							id="btnAdd">등록</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<form id="form">
						<div class="table-responsive">
							<table class="table table-bordered" id="reworkOrdDtlTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td>
										<input type="text" class="form-control" id="workOrdNo"name="workOrdNo" disabled> 
										<input type="hidden"class="form-control" id="workOrdSeq" name="workOrdSeq"disabled>
									</td>
									<th>발주처</th>
									<td>
										<input type="text" class="form-control" id="ordCorpNm" disabled> 
										<input type="hidden"id="ordCorpCd">
									</td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td>
										<input type="text" class="form-control" id="itemNm" name="itemNm" maxlength="25" disabled> 
										<input type="hidden" class="form-control" id="itemCd" name="itemCd" maxlength="25" disabled> 
										<input type="hidden" class="form-control" id="itemRev" name="itemRev" maxlength="25" disabled>
									</td>
									<th>불량공정</th>
									<td>
										<input type="text" class="form-control" id="minorPrcssNm" name="minorPrcssNm" maxlength="25" disabled>
										<input type="hidden" class="form-control" id="minorPrcssCd" name="minorPrcssCd" maxlength="25" disabled>
										<input type="hidden" class="form-control" id="middlePrcssCd" name="middlePrcssCd" maxlength="25" disabled>
									</td>
								</tr>
								<tr>
									<th>등록일</th>
									<td>
										<div class="form-group input-sub m-0 row">
											<input class="form-control" type="text" id="ordDate"
												name="ordDate" disabled />
											<button
												onclick="fnPopUpCalendar(ordDate,ordDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												name="ordDateDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>작업수량</th>
									<td>
										<input type="text" class="form-control" id="faultyQty" name="faultyQty" maxlength="25" style="text-align: right;"  disabled>
									</td>
								</tr>
								<!-- <tr>
									<th>담당자</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width:100%;">
												<input type="hidden" class="form-control" id="chargrCd" name="chargrCd"> 
												<input type="text" class="form-control" id="chargrNm" name="chargrNm" disabled>
												<button type="button"
													class="btn btn-primary input-sub-search" id="btnSelWorkOrdNo"
													onClick="selWorkChargr()" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
									<th></th>
									<td></td>
								</tr> -->
								<!--==========/table 내용 추가==========-->
							</table>
						</div>
					</form>
					<div>
						<button type="button" class="btn btn-primary float-right d-none"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnSaveConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->
<!-- 작업지시 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="workOrdPrcssPopUpModal"
	tabindex="-1" role="dialog"
	aria-labelledby="workOrdPrcssPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="workOrdPrcssPopUpLabel">작업지시 조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="workOrdPrcssPopUpTable" class="table table-bordered">
					<thead class="thead-light">
						<tr>
							<th>작지번호</th>
							<th>중공정</th>
							<th>소공정</th>
							<th>품명</th>
							<th>투입수량</th>
							<th>담당자</th>
							<th>작지일</th>
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
<!-- 작업지시 모달 종료-->
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

	let currentHref = "wmsc0110";
	let currentPage = $('.' + currentHref).attr('id');
	$(document).attr("title","재작업관리"); 
	
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	let viewIdx;
	let sideView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	$('#ordDate').val(serverDate);
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	$('#saveBtnModalY').on('click', function() {
		
		$('#btnSave').addClass('d-none');
		$('#btnSelWorkOrdNo').attr('disabled',true);
		$('button[name=ordDateDateCalendar]').attr('disabled',true);
	});
	
	// 목록
	let reworkOrdAdmTable = $('#reworkOrdAdmTable').DataTable({
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="po/reworkOrderDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, '');
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, '');
				}
			},
		},
		rowId : 'contNo',
		columns : [
				{
					data : 'preWorkOrdNo'
				},
				{
					data : 'workOrdNo',
					render : function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '-';
						}
						
					}
				},
				{
					data : 'ordCorpNm'
				},
				{
					data : 'itemNm'
				},
				//{data : 'dtlOrdCnt'},	
				{
					data : 'itemRev'
				},
				/* {
					data : 'workChargrNm',
					render : function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '-';
						}
						
					}
				}, */
				{
					data : 'reworkType',
					render : function(data,type,row,meta){
						if(data=="001"){
							return '자주검사';
						}else{
							return '완제품검사';
						}
					}
				},
				{
					data : 'ordDate',
					render : function(data, type, row, meta) {
						if(data!=null){
							return moment(data).format("YYYY-MM-DD");
						}else {
							return "-";
						}
					}
				}, ],
		columnDefs : [ {
			"className" : "text-center",
			"targets" : "_all"
		} ],
		order : [ [ 0, 'asc' ] ],

	});

	// 보기
	$('#reworkOrdAdmTable tbody').on('click','tr',function() {
		sideView = "edit"
			
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#reworkOrdAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}


		workOrdNo = reworkOrdAdmTable.row(this).data().workOrdNo;
		workOrdSeq = reworkOrdAdmTable.row(this).data().workOrdSeq;
		preWorkOrdNo = reworkOrdAdmTable.row(this).data().preWorkOrdNo;
		itemCd = reworkOrdAdmTable.row(this).data().itemCd;
		itemRev = reworkOrdAdmTable.row(this).data().itemRev;
		
		
		/* if(workOrdNo!=null){
			$('#btnAdd').attr('disabled',true);
		}else{
			$('#btnAdd').attr('disabled',false);
		} */

		$('button[name=ordDateDateCalendar]').attr('disabled',true);		
		$('#btnSelWorkOrdNo').attr('disabled',true);		
		
		$('#workOrdNo').val(preWorkOrdNo);
		$('#workOrdSeq').val(workOrdSeq);
		$('#itemNm').val(reworkOrdAdmTable.row(this).data().itemNm);
		$('#itemCd').val(reworkOrdAdmTable.row(this).data().itemCd);
		$('#itemRev').val(reworkOrdAdmTable.row(this).data().itemRev);
		$('#ordCorpCd').val(reworkOrdAdmTable.row(this).data().ordCorpCd);
		$('#ordCorpNm').val(reworkOrdAdmTable.row(this).data().ordCorpNm);
		//$('#chargrCd').val(reworkOrdAdmTable.row(this).data().workChargr);
		//$('#chargrNm').val(reworkOrdAdmTable.row(this).data().workChargrNm);
		$('#faultyQty').val(reworkOrdAdmTable.row(this).data().reworkQty);
		$('#faultyType').val(reworkOrdAdmTable.row(this).data().faultyType);
		$('#faultyTypeNm').val(reworkOrdAdmTable.row(this).data().faultyTypeNm);
		$('#middlePrcssCd').val(reworkOrdAdmTable.row(this).data().middlePrcssCd);
		$('#minorPrcssCd').val(reworkOrdAdmTable.row(this).data().minorPrcssCd);
		$('#minorPrcssNm').val(reworkOrdAdmTable.row(this).data().minorPrcssNm);

		ordDateValue = reworkOrdAdmTable.row(this).data().ordDate;
		$('#ordDate').val(ordDateValue==null?serverDate:moment(ordDateValue).format('YYYY-MM-DD'));
		
	});

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="reworkDateFrom" name="reworkDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(reworkDateFrom,reworkDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="reworkDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="reworkDateTo" name="reworkDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(reworkDateTo,reworkDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="reworkDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#reworkOrdAdmTable_length').html(html1);
	$('#reworkDateFrom').val(serverDateFrom);
	$('#reworkDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#reworkDateFrom').val();
		serverDateTo = $('#reworkDateTo').val();

		$('#reworkOrdAdmTable').DataTable().ajax.reload(function() {
		});
		$('#form').each(function() {
			this.reset();
		});

	});

	$('#btnAdd').on('click', function() {
		
		if (sideView != "edit") {
			toastr.warning("재작업등록할 작지항목을 선택해주세요.");
			return false;
		}

		$('#btnSelWorkOrdNo').attr('disabled',false);
		$('button[name=ordDateDateCalendar]').attr('disabled',false);

		$('#btnSave').removeClass('d-none');

	});

	$('#btnSave').on('click', function() {

		if ($('#workOrdNo').val() == "") {
			toastr.warning("작지를 선택해주세요");
			return false;
		}
		if ($('#chargrNm').val() == "") {
			toastr.warning("담당자를 선택해주세요");
			return false;
		}
		url = '<c:url value="/po/reworkOrderCreate"/>';

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'menuAuth' : 'wmsc0010',
				'workOrdNo' : $('#workOrdNo').val(),
				'workOrdSeq' : $('#workOrdSeq').val(),
				//'workChargr' : $('#chargrCd').val(),
				'minorPrcssCd' : $('#minorPrcssCd').val(),
				'middlePrcssCd' : $('#middlePrcssCd').val(),
				'ordDate' : $('#ordDate').val().replace(/-/g, ""),
				'workOrdQty' : $('#faultyQty').val().replace(/,/g, ""),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#reworkOrdAdmTable').DataTable().ajax.reload(function() {});
					$('button[name=ordDateDateCalendar]').attr('disabled',true);		
					$('#btnSelWorkOrdNo').attr('disabled',true);	
					$('#btnSave').addClass('d-none');			
					toastr.success('수정되었습니다.');
					
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
	});

	//접수자 팝업 시작
	var workOrdPrcssPopUpTable;
	function selectWorkOrder() {
		if (workOrdPrcssPopUpTable == null|| workOrdPrcssPopUpTable == undefined) {
			workOrdPrcssPopUpTable = $('#workOrdPrcssPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				destroy : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : '<c:url value="po/reworkOrderModalDataList"/>',
					type : 'GET',
					data : {}
				},
				rowId : 'userNumber',
				columns : [
						{
							data : 'workOrdNo'
						},
						{
							data : 'middlePrcssNm'
						},
						{
							data : 'minorPrcssNm'
						},
						{
							data : 'itemNm'
						},
						{
							data : 'targetQty'
						},
						{
							data : 'workChargrNm'
						},
						{
							data : 'ordDate',
							render : function(data, type, row,
									meta) {
								var result = (data == null) ? ""
										: moment(data).format(
												"YYYY-MM-DD");
								return result;
							}
						}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4, 5, 6 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#workOrdPrcssPopUpTable tbody').on('click', 'tr', function() {
				var data = workOrdPrcssPopUpTable.row(this).data();
				$('#workOrdNo').val(data.workOrdNo);
				$('#workOrdSeq').val(data.workOrdSeq);
				$('#dealCorpNm').val();
				$('#itemNm').val(data.itemNm);
				$('#itemRev').val(data.itemRev);
				$('#itemCd').val(data.itemCd);
				$('#ordCnt').val(data.targetQty);

				$('#chargrCd').val(data.workChargr);
				$('#chargrNm').val(data.workChargrNm);

				$('#minorPrcssCd').val(data.minorPrcssCd);
				$('#middlePrcssCd').val(data.middlePrcssCd);
				$('#ordDate').val(moment(data.ordDate).format("YYYY-MM-DD"));
				$('#reworkDesc').val(data.ordDesc);

				$('#btnSave').removeClass('d-none');

				$('#workOrdPrcssPopUpModal').modal('hide');
			});
		}/*  else {
					$('#workOrdPrcssPopUpModal').DataTable().ajax.reload(function() {});
				} */

		$('#workOrdPrcssPopUpModal').modal('show');
	}

	//접수자 팝업 시작
	var userPopUpTable;
	function selWorkChargr() {
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
				$('#chargrCd').val(data.userNumber);
				$('#chargrNm').val(data.userNm);

				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}
</script>

</body>
</html>
