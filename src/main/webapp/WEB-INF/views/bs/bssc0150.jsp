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
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">고객만족도</li>
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
						<table id="custSatisTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>No</th>
									<th>고객사</th>
									<th>작성일</th>
									<th>작성자</th>
									<th>편의성</th>
									<th>친절도</th>
									<th>약속이행</th>
									<th>방문정도</th>
									<th>사유</th>
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
				style="width: 40%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand"
						class="closebtn float-right" onclick="closerNav()"><i
						class="mdi mdi-close"></i></a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-tab p-0 mb-2">
				</div>
				<div class="card-body p-0">
					<div class="card-body col-sm-12 pr-0 pb-2 pt-0 pl-0">
						<button type="button" class="btn btn-warning float-right" id="btnDel" disabled>삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit" disabled>수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item"><a class="nav-link active show"id="reviewShow1">고객사정보</a></li>
					</ul>
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>고객사</th>
									<td><input type="text" class="form-control mw-100" id="customer" name="customer" disabled></td>
									<th colspan="2"></th>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" class="form-control mw-100" id="callNum" name="callNum" disabled></td>
									<th>팩스번호</th>
									<td><input type="text" class="form-control mw-100" id="faxNum" name="faxNum" disabled></td>
								</tr>
								<tr>
									<th>제품명</th>
									<td colspan="3"><input type="text" class="form-control mw-100" id="model" name="model" disabled></td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>
										<div class="form-group input-sub m-0 mw-100 row">
											<input class="form-control mw-100" type="text" id="inputDate" name="inputDate" disabled/>
											<button
												onclick="fnPopUpCalendar(inputDate,inputDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												id="inputDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>작성자</th>
									<td><select class="custom-select" id="inputBy" disabled></select></td>
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="card-body col-sm-12 pr-0 pb-2 pt-0 pl-0">
						<button type="button" class="btn btn-warning float-right" id="" disabled>삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="" disabled>수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="">등록</button>
					</div>
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item"><a class="nav-link active show"id="reviewShow1">만족도</a></li>
					</ul>
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
								<col width="30%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th rowspan="2">항목</th>
									<th colspan="5">만족도</th>
								</tr>
								<tr>
									<th>매우만족</th>
									<th>만족</th>
									<th>보통</th>
									<th>불만</th>
									<th>매우불만</th>
								</tr>
								<tr>
									<th>편의성</th>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
								</tr>
								<tr>
									<th>친절도</th>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
								</tr>
								<tr>
									<th>약속이행</th>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
								</tr>
								<tr>
									<th>방문정도</th>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
									<td>
										<input type="checkbox" class="form-control" name="" value="" style="min-width : 100%" />
									</td>
								</tr>
							</thead>
						</table>
						<table class="table table-bordered">
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="height:50px">사유</th>
									<th style="height:50px">
										<input type="text" class="form-control" name="" value="" style="min-width : 100%; min-height : 100%;" />
									</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				
				<div class="mt-0">
					<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
					</button>
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
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>
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

	let serverDateFrom =  "${serverDateFrom}";
	let serverDateTo =  "${serverDateTo}";
	let currentHref = "bssc0150";
	let currentPage = $('.' + currentHref).attr('id');
	let sideView = 'add';
	let satisNo = 0;

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","고객만족도"); 

	var matrlUserList = new Array(); // 사용여부
	<c:forEach items="${matrlUserList}" var="info">
	var json = new Object();
	json.baseCd = "${info.userId}";
	json.baseNm = "${info.userNm}";
	matrlUserList.push(json);
	</c:forEach>

	selectBoxAppend(matrlUserList, "inputBy", "", "2");

	// 게시글 목록
	let custSatisTable = $('#custSatisTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bs/custSatisAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return serverDateFrom; },
				'endDate' 	: function() {
					var date = new Date(serverDateTo);
					date.setDate(date.getDate()+1);
					return moment(date).format("YYYY-MM-DD"); 
				}
			},
		},
		columns : [
		    	{	
		    		render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1;
	    			}
		    	},
				{ data : 'customer' },
				{
					render : function(data, type, row) {
						return moment(row['regDate']).format('YYYY-MM-DD HH:mm');
					}
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				{
					render : function(data, type, row) {
						return '-';
					} 
				},
				],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목'
		}, 'print' ],
	});
	
    $('#saveBtnModalY').on('click',function() { 
		$('#custSatisTable').DataTable().$('tr.selected').removeClass('selected');
		uiProc(true);
		resetUiProc();
		$('#btnSave').addClass('d-none'); // 저장버튼
    });
    
	// 게시글 상세보기
	$('#custSatisTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			return false;
		}

		if ($(this).hasClass('selected')) {
		} else {
			$('#custSatisTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		satisNo = custSatisTable.row(this).data().satisNo;
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bs/custSatisAdmRead"/>',
			type : 'GET',
			data : {
				'satisNo' : satisNo
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';

				//화면처리
				$("#customer").val(data.customer);
				$("#callNum").val(data.callNum);
				$("#faxNum").val(data.faxNum);
				$("#model").val(data.model);
				$("#inputBy").val(data.regId);
				$("#inputDate").val(moment(data.regDate).format('YYYY-MM-DD'));
			}
		});

		$("#btnEdit").attr("disabled", false);
		$("#btnDel").attr("disabled", false);
	});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		
		//화면처리        
		$('#custSatisTable').DataTable().$('tr.selected').removeClass('selected');
		uiProc(false);
		resetUiProc();
		$("#inputDate").val(moment().format("YYYY-MM-DD")); 
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		
		if (sideView != 'edit') {
			toastr.error("수정할 목록을 선택해 주세요!");
			return false;
		}
		
		uiProc(false);
		$("#inputBy").attr("disabled", true);
		//수정관련 기능(검사코드는 수정 불가)
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.error("삭제할 목록을 선택해 주세요!");
			return false;
		}

		var url = '<c:url value="/bs/custSatisAdmDelete"/>';
		
		$.ajax({
			url : url,
			type : 'post',
			data : {
					'satisNo' : satisNo
				},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() { 
				uiProc(true);
				resetUiProc();
				custSatisTable.ajax.reload();
			}
		});
	});
		
	// 게시판 글 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#customer').val())) {
			toastr.warning('고객사를 입력해주세요.');
			$('#customer').focus();
			return false;
		}

		var url = '<c:url value="/bs/custSatisAdmCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/bs/custSatisAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'satisNo'	:	function() { return satisNo; },
				'customer'	:	function() { return $('#customer').val(); },
				'callNum'	:	function() { return $('#callNum').val(); },
				'faxNum'	:	function() { return $('#faxNum').val(); },
				'model'		:	function() { return $('#model').val(); },
				'regId'		:	function() { return $('#inputBy').val(); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					}else {
						toastr.success('등록되었습니다.');
					}
					$('#btnSave').addClass('d-none');
					uiProc(true);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				custSatisTable.ajax.reload();
			}
		});
	});

	var html1 = '<div class="row">';
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
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
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '</div>';


	$('#custSatisTable_length').html(html1);
	$("#preInWhsDateFrom").val(serverDateFrom);
	$("#preInWhsDateTo").val(serverDateTo);
	
	$('#btnRetv').on('click',function(){
		serverDateFrom = $("#preInWhsDateFrom").val();
		serverDateTo = $("#preInWhsDateTo").val();
		$('#custSatisTable').DataTable().ajax.reload(function() {});
	});
	
	function uiProc(flag) {
		$("#customer").attr("disabled", flag);
		$("#callNum").attr("disabled", flag);
		$("#faxNum").attr("disabled", flag);
		$("#model").attr("disabled", flag);
// 		$("#inputDate").attr("disabled", flag);
// 		$("#inputDateCalendar").attr("disabled", flag);
		$("#inputBy").attr("disabled", flag);
	}
	
	function resetUiProc() {
		$("#customer").val("");
		$("#callNum").val("");
		$("#faxNum").val("");
		$("#model").val("");
		$("#inputDate").val("");
		$("#inputBy").val("");
	}
</script>
</body>
</html>
