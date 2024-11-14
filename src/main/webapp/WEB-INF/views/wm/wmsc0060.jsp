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
				<li class="breadcrumb-item active">일일작업계획</li>
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
						<table id="workOrdTable" class="table table-bordered">

							<thead class="thead-light">
								<tr>
									<th class="text-center">작지번호</th>
									<th class="text-center">구분</th>
									<th class="text-center">품명(Type)</th>
									<th class="text-center">생산예정일</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">긴급여부</th>
									<th class="text-center">재작업여부</th>
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
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
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
									id="tab2Nav" data-toggle="tab" href="#tab2">일일작업계획</a></li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
						
						<!-- <button type="button" class="btn btn-primary float-right"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none"
							id="btnEditConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button> -->
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
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
										<tr>
											<th>작지번호</th>
											<td><input type="text" class="form-control" id="workOrdNo"
												name="workOrdNo" disabled></td>
											<th>구분</th>
											<td><input type="text" class="form-control"
												id="itemGubunNm" name="itemGubunNm" disabled> <input
												type="hidden" class="form-control" id="itemGubun"
												name="itemGubun" disabled></td>
										</tr>
										<tr>
											<th>품명(Type)</th>
											<td><input type="text" class="form-control"
												style="max-width: 100%" id="itemNm" name="itemNm" disabled>
												<input type="hidden" class="form-control"
												style="max-width: 100%" id="itemCd" name="itemCd"></td>
											<th>지시수량</th>
											<td><input type="text" class="form-control"
												id="workOrdQty" name="workOrdQty" disabled></td>
										</tr>
										<tr>
											<th>생산예정일</th>
											<td><div class="form-group input-sub m-0 row">
													<input class="form-control" type="text" id="outputDate"
														name="outputDate" disabled>
													<button
														onclick="fnPopUpCalendar(outputDate,outputDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														name="outputDateCalendar" type="button" disabled>
														<span class="oi oi-calendar"></span>
													</button>
												</div></td>
											<th>긴급여부</th>
											<td><select class="custom-select" id="workEmerYn"></select></td>
										</tr>
										<tr>
											<th>작업지시일</th>
											<td><div class="form-group input-sub m-0 row">
													<input class="form-control" type="text" id="workOrdDate"
														name="workOrdDate" disabled>
													<button
														onclick="fnPopUpCalendar(workOrdDate,workOrdDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														name="workOrdDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>재작업여부</th>
											<td><input class="form-control" type="text" id="reworkYn" style="border: none; text-align:center;" disabled></td>
										</tr>
										<tr>
											<th>전달사항</th>
											<td colspan="3">
												<input type="hidden" id="etcGubun" />
												<input type="hidden" id="etcSeq" />
												<input type="hidden" id="contDtlNo" />
												<textarea rows="6" cols="97" id="etcSdContent" style="resize: none; border: none;" disabled></textarea>
											</td>
										</tr>
										
									</table>
									<div class="row">
										<button type="button" class="btn btn-primary float-right mr-1 d-none"
											id="btnDtlAdd">추가</button>
										<button class="btn btn-primary d-none" id="btnDtlAddConfirmLoading"
											type="button" disabled>
											<span class="spinner-border spinner-border-sm" role="status"
												aria-hidden="true"></span> 처리중
										</button>
									</div>
									<table class="table table-sm table-bordered mb-2"
										id="bizOrderDaTable">
										<colgroup>
											<col width="15%">
											<col width="25%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
											<th colspan="4">생산지연사유</th>
											<!-- <td colspan="3">
												<textarea rows="6" cols="97" id="etcDaContent" style="resize: none;" disabled></textarea>
											</td> -->
										</tr>
										<tr>
											<th>No.</th>
											<th>담당자</th>
											<th colspan="2">내용</th>
										</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								
							</div>
						</div>
						<!--====end====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none"
									id="btnSave2">저장</button>
								<button class="btn btn-primary d-none" id="btnSave2ConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnEdit2">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEdit2ConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
							</div>
							<form id="form2">
								<div class="table-responsive">
									<table class="table table-bordered"
										id="dailyWorkPlanTable">
										<colgroup>
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>중공정명</th>
												<th>소공정명</th>
												<th>작업자</th>
												<th>작업일자</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
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

	let currentHref = "wmsc0060";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","일일작업계획"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";
	var workOrdNo = null;
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;
	var bomCd=null;
	var contDtlNo = null;
	
	uiProc(true);
	
	//공통코드 처리 시작      
	var workEmerYnCode = new Array(); //단위
	<c:forEach items="${workEmerYnCode}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료   
    
	//선택박스 처리
	selectBoxAppend(workEmerYnCode, "workEmerYn", "", "2");
	
    $('#saveBtnModalY').on('click',function() {
    	uiProc(true);
    	$('#btnSave').addClass('d-none');
    });

    
	//납품일(영업) 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#dailyWorkPlanTable').DataTable().ajax.reload();
	});

	// 기본정보 목록
	let workOrdTable = $('#workOrdTable').DataTable({
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="po/workOrderDayDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return rcvDateOutFromCal.replace(/-/g, "");
				},
				'endDate' : function() {
					return rcvDateOutToCal.replace(/-/g, "");
				}
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{
				data : 'workOrdNo'
			},
			{
				data : 'itemGubunNm'
			},
			{
				data : 'itemNm'
			},
			{
				data : 'outputDate',
				render : function(data, type, row, meta) {
					var result = (data == null) ? "" : moment(data)
							.format("YYYY-MM-DD");
					return result;
				}
			}, {
				data : 'workOrdQty'
			}, {
				data : 'workEmerYnNm'
			}, {
				data : 'reworkYn',
					render : function(data, type, row, meta){
						if(data=="Y"){
							return '재작업';
						}else{
							return '정상';
						}
					}
			},  
		],
		order : [ 
			[ 0, 'desc' ] 
		],
		columnDefs : [ 
			{ targets : [ 4 ], render : $.fn.dataTable.render.number(',')}, 
			{targets : [ 4 ], className : 'text-right'}, 
		],
		drawCallback : function(settings){
			var api = this.api();
			for(var i=0; i<api.data().count(); i++){
				if(api.row(i).data().reworkYn == "Y"){
					$('#'+api.row(i).data().workOrdNo).addClass('bg-danger2');
				}else{
					$('#'+api.row(i).data().workOrdNo).removeClass('bg-danger2');
				}
			}
		}
	});

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '일자 &nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control" style="width:97px;" type="text" id="rcvDateOutFrom" name="rcvDateOutFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateOutFrom,rcvDateOutFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutTo" name="rcvDateOutTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(rcvDateOutTo,rcvDateOutTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnOutRetv">조회</button>'
	html1 += '</div>';

	$('#workOrdTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	$('#btnOutRetv').on('click', function() {
		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
		rcvDateOutToCal = $('#rcvDateOutTo').val();

		$('#workOrdTable').DataTable().ajax.reload(function() {});
		$('#form').each(function() {
			this.reset();
		});

	});

	// 보기
	$('#workOrdTable tbody').on('click','tr',function() {
		sideView = "edit";
		
		if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#workOrdTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		$('#tab2Nav').removeClass('disabled');	//일일작업계획 탭 활성화

		bomCd = workOrdTable.row(this).data().bomCd;
		workOrdNo = workOrdTable.row(this).data().workOrdNo;
		contDtlNo = workOrdTable.row(this).data().contDtlNo;
		
		$('#workOrdNo').val(workOrdTable.row(this).data().workOrdNo);
		$('#itemGubunNm').val(workOrdTable.row(this).data().itemGubunNm);
		$('#itemNm').val(workOrdTable.row(this).data().itemNm);
		$('#workOrdQty').val(workOrdTable.row(this).data().workOrdQty);
		$('#outputDate').val(moment(workOrdTable.row(this).data().outputDate).format("YYYY-MM-DD"));
		$('#workOrdDate').val(moment(workOrdTable.row(this).data().workOrdDate).format("YYYY-MM-DD"));
		$('#reworkYn').val(workOrdTable.row(this).data().reworkYn=='Y'?'재작업':'정상');
		selectBoxAppend(workEmerYnCode, "workEmerYn", workOrdTable.row(this).data().workEmerYn, "");

		$('#dailyWorkPlanTable').DataTable().ajax.reload();
		$('#bizOrderDaTable').DataTable().ajax.reload();
		
		
		$.ajax({
			url : '<c:url value="/bs/bizOrderDtlRead"/>',
			type : 'GET',
			data : {
				'contDtlNo' : workOrdTable.row(this).data().contDtlNo,
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
					sideView = 'edit';
						
					$('#etcDaContent').text(res.etcDaData);
					$('#etcSdContent').text(res.etcSdData);

					//$('#etcGubun').text(res.etcGubun);
					//$('#contDtlNo').text(res.contDtlNo);
				} else {
					toastr.error(res.message);
				}
			}
		});

	});

	//수정 처리
	$('#btnEdit').on('click', function(){
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		uiProc(false);
		$('#btnSave').removeClass('d-none');
		$('#btnDtlAdd').removeClass('d-none');
	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {
		
		var check = true;
		var dataArray = new Array();
		
		$.ajax({
			url : '<c:url value="/po/workOrderDateUpdate"/>',
			type : 'POST',
			data : {
				'menuAuth' : 'wmsc0060',
				'workOrdNo' : function() {return workOrdNo},
				'workOrdDate' : $('#workOrdDate').val().replace(/-/g, ""),
				'workEmerYn' : $('#workEmerYn option:selected').val(),
				//'etcCont' : $('#etcDaContent').val(),
				//'etcGubun' : $('#etcGubun').val(),
				//'contDtlNo' : $('#contDtlNo').val(),
			},
			success : function(res) {
				let data = res.data;
				uiProc(true);
				if (res.result == 'ok') {
					$('#workOrdTable').DataTable().ajax.reload(function() {});
					$('#btnSave').addClass('d-none');
					daCreate();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});

		function daCreate(){
			$('#bizOrderDaTable tbody tr').each(function(index, item) {

				if (bizOrderDaTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=etcChargerNm]').val() == "") {
						toastr.warning('담당자를 선택해 주세요.');
						$('button[name=btnEtcCharger]').focus();
						check = false;
						return false;
					}
					if ($(this).find("td input[name=etcCont]").val() == "") {
						toastr.warning('내용을 입력해 주세요.');
						$('input[name=etcCont]').focus();
						check = false;
						return false;
					}
					
				}
		
				var rowData = new Object();
				rowData.etcGubun = 'DA';
				rowData.contDtlNo = contDtlNo;
				etcChargerValue = $(this).find('td input[name=etcCharger]').val();
				rowData.etcCharger = etcChargerValue==null?"":etcChargerValue;
				rowData.etcCont = $(this).find('td input[name=etcCont]').val();

				dataArray.push(rowData);
			});

			if (check == true) {
				$.ajax({
					url : '<c:url value="/bs/bizOrderEtcDtlCreate"/>',
					type : 'POST',
					dataType : 'json',
					data : JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success("저장되었습니다.");
							$('#bizOrderDaTable').DataTable().ajax.reload();
							
							$('#btnSave').addClass('d-none');
							$('#btnDtlAdd').addClass('d-none');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
					}
				});
			}
		}
		
	});



	//생산지연사유 목록조회
	let bizOrderDaTable = $('#bizOrderDaTable').DataTable({
		language : lang_kor,	
		destroy : true,	
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcDtlList"/>',
			type : 'GET',
			data : {
				'etcGubun': 'DA',
				'contDtlNo' : function(){return contDtlNo;}
			},
		},
		rowId : '',
		columns : [ 
				{
					render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1 ;
		        	},
				},
				{data : 'etcChargerNm',
					render: function(data, type, row, meta) {	
						var value ="";
						if(data!=null){
							value = '<input type="text" class="form-control" style="max-width:100%;" name="etcChargerNm" value="'+data+'" disabled>';		
							
						} else{
							value = '<input type="text" class="form-control" name="etcChargerNm" value=""disabled>';
						}								
						
		    			var html = '<div class="input-sub m-0">';
		    				 html += value;
		    				 html += '<input type="hidden" name="etcCharger" value="'+row['etcCharger']+'">';
		    				 html += '<button type="button" class="btn btn-primary input-sub-search" name="btnEtcCharger" onClick="selectWorkChargr('+meta.row+');" disabled>';
		    				 html += '<span class="oi oi-magnifying-glass"></span>';
		    				 html += '</button>' ;
		    				 html += '</div>' ;
						return html;
					} 
				}, 
				{data : 'etcCont',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="etcCont" value="'+data+'"style="max-width:100%;" disabled/>';
						}else{
							return '<input class="form-control" type="text" name="etcCont" style="max-width:100%;"/>';
						}
					}
				}
		],
		columnDefs: [
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    
	});

	//추가버튼 클릭시
	$('#btnDtlAdd').on('click',function(){

		$('#bizOrderDaTable').DataTable().row.add({}).draw(false);
		$('button[name=btnEtcCharger]').eq(bizOrderDaTable.data().count()-1).attr('disabled',false);
	});

	
	let dailyWorkPlanTable = $('#dailyWorkPlanTable').DataTable({
	/* 	dom : "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B", */
		language : lang_kor,
		paging : true,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="wm/dailyWorkPlanAdmRead"/>',
			type : 'GET',
			data : {
				bomCd : function() {return bomCd;},
				workOrdNo : function() {return workOrdNo;}
			},
		},
		rowId : 'prcssCd',
		columns : [ 
			{
				data : 'middlePrcssNm',
				'className' : 'text-center',
				name : 'rowspan',
				render : function(data, type, row, meta) {
					var html3;
					html3 = '<input type="text" class="form-control" name="middlePrcssNm" value="'+data+'"  style="max-width:100%;border:none;background-color: white; text-align:center;" disabled>';
					html3 += '<input type="hidden" name="middlePrcssCd" value="'+row['middlePrcssCd']+'">';

					return html3;
				}
			
			}, {
				data : 'minorPrcssNm',
				'className' : 'text-center',
				render : function(data, type, row, meta) {
					var html2;
					html2 = '<input type="text" class="form-control" name="minorPrcssNm" value="'+data+'"  style="max-width:100%;border:none;background-color: white; text-align:center;" disabled>';
					html2 += '<input type="hidden" name="minorPrcssCd" value="'+row['minorPrcssCd']+'">';

					return html2;
				}
			}, {
				data : 'dailyWorkChargrNm',
				render : function(data, type, row, meta) {
					var value = "";
					if (data != null) {
						value = '<input type="text" class="form-control" style="max-width:100%;" name="dailyWorkChargrNm" value="'+ data + '" disabled>';
	
					} else {
						value = '<input type="text" class="form-control" name="dailyWorkChargrNm" value=""  style="max-width:100%;" disabled>';
					}
	
					var html = '<div class="input-sub m-0">';
					html += value;
					html += '<input type="hidden" name="dailyWorkChargr" value="'+row['dailyWorkChargr']+'">';
					html += '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectWorkChargr('+meta.row+');" disabled>';
					html += '<span class="oi oi-magnifying-glass"></span>';
					html += '</button>';
					html += '</div>';
					return html;
				}
			}, {
				data : 'dailyWorkDate',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="date" class="form-control" style="max-width:100%;" name="dailyWorkDate" value="'+moment(data).format('YYYY-MM-DD')+'" disabled>';
	
					} else {
						return '<input type="date" class="form-control" name="dailyWorkDate" value=""  style="max-width:100%;" disabled>';
					}
				}
			}, {
				data : 'dailyWorkDesc',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" style="max-width:100%;" name="dailyWorkDesc" value="'+ data + '" disabled>';
	
					} else {
						return '<input type="text" class="form-control" name="dailyWorkDesc" value=""  style="max-width:100%;" disabled>';
					}
				}
			} 
		],
		rowsGroup : [ 'rowspan:name', [ 0, 1 ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '일일작업계획서'
		}, 'print' ],
	});


	//일일작업계획 수정 처리
	$('#btnEdit2').on('click', function(){
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('button[name=btnPartCd]').attr('disabled',false);
		$('input[name=dailyWorkDesc]').attr('disabled',false);
		$('input[name=dailyWorkDate]').attr('disabled',false);
		
		$('#btnSave2').removeClass('d-none');
	});

	//일일작업계획 저장 처리
	$('#btnSave2').on('click', function(){

		var check = true;
		var dataArray = new Array();

		$('#dailyWorkPlanTable tbody tr').each( function(index, item) {
	
			var rowData = new Object();
			rowData.workOrdNo = workOrdNo;
		
			rowData.middlePrcssCd = $(this).find('td input[name=middlePrcssCd]').val();
			rowData.minorPrcssCd = $(this).find('td input[name=minorPrcssCd]').val();

			
			rowData.dailyWorkChargr = $(this).find('td input[name=dailyWorkChargr]').val();
			rowData.dailyWorkDate = $(this).find('td input[name=dailyWorkDate]').val().replace(/-/g,'');
			rowData.dailyWorkDesc = $(this).find('td input[name=dailyWorkDesc]').val();
			
			dataArray.push(rowData);
			console.log(rowData);

		});

		if (check == true) {
			$.ajax({
				url : '<c:url value="/wm/dailyWorkPlanAdmCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {
					if (res.result == 'ok') {

						$('#dailyWorkPlanTable').DataTable().ajax.reload(function() {});
						toastr.success('저장되었습니다.');

					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
			});
		}

	});

	
	//작업자 팝업 시작
	var userPopUpTable;
	var index2;
	
	function selectWorkChargr(index) {
		index2 = index;
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/sm/matrlUserDataList"/>',
					type : 'GET',
					data : {
						
						},
				},
				rowId : 'matrlUser',
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
				} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});

			$('#userPopUpTable tbody').on('click', 'tr', function() {

				console.log('index : '+index)
				var data = userPopUpTable.row(this).data();
				$('input[name=dailyWorkChargrNm]').eq(index2).val(data.userNm);
				$('input[name=dailyWorkChargr]').eq(index2).val(data.userNumber);

				$('input[name=etcChargerNm]').eq(index2).val(data.userNm);
				$('input[name=etcCharger]').eq(index2).val(data.userNumber);

				
				$('#userPopUpModal').modal('hide');
			});
		}
		$('#userPopUpModal').modal('show');
	}

	
	function uiProc(flag) {
		$("#workEmerYn").attr("disabled", flag);
		$("button[name=workOrdDateCalendar]").attr("disabled", flag);
		//$('#etcDaContent').attr('disabled',flag);
		
	}
</script>
<style>
.bg-danger2 {
  background-color: #FF7878 !important;
}
</style>
   	

</body>
</html>
