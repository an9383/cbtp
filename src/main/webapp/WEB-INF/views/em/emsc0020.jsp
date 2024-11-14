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
				<li class="breadcrumb-item"><a href="#">설비관리</a></li>
				<li class="breadcrumb-item active">설비이력관리</li>
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
						<table id="equipCodeTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="25%">
								<col width="20%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>설비코드</th>
									<th>구분</th>
									<th>설비명</th>
									<th>모델명</th>
									<th>형식/규격</th>
									<th>제조사</th>
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
						class="closebtn float-right" onclick="closerNav()"> <i
						class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item"><a class="nav-link active show"
							data-toggle="tab" href="#tab1" id="info">기본정보</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab2" id="photo">사진</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab3" id="corr">교정내역</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							data-toggle="tab" href="#tab4" id="etc">기타</a></li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnAdd">등록</button>
							</div>
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="10%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>설비코드</th>
									<td><input type="text" class="form-control" id="equipCd"
										name="equipCd" disabled></td>
									<th>구분</th>
									<td><select class="custom-select" id="equipGubun"></select></td>
								</tr>
								<tr>
									<th>설비명</th>
									<td><input type="text" class="form-control" id="equipNm"
										name="equipNm"></td>
									<th>모델명</th>
									<td><input type="text" class="form-control"
										id="equipModelNm"></td>
								</tr>
								<tr>
									<th>형식/규격</th>
									<td><input type="text" class="form-control" id="equipType"
										name="equipType"></td>
									<th>제조사</th>
									<td><input type="text" class="form-control" id="mfcCorpNm"
										name="mfcCorpNm"></td>
								</tr>
								<tr>
									<th>제조번호</th>
									<td><input type="text" class="form-control" id="mfcNo"
										name="mfcNo"></td>

									<th>관리번호</th>
									<td><input type="text" class="form-control" id="admNo"
										name="admNo"></td>
								</tr>
								<tr>
									<th>관리부서</th>
									<td><select class="custom-select" id="admDept"></select> <!-- <div class="input-sub m-0">
			                            	<input type="hidden" class="form-control" id="admDept"  name="admDept">
			                            	<input type="text" class="form-control" id="admDeptNm" name="admDeptNm" disabled>
			                            	<button type="button" class="btn btn-primary input-sub-search" id="btnAdmDept" onClick="selectAdmDept()">
									          	<span class="oi oi-magnifying-glass"></span>
								         	</button>
							         	</div> --></td>
									<th>구입일자</th>
									<td>
										<div class="form-group input-sub m-0">
											<input class="form-control" type="text" id="buyDate"
												name="buyDate" maxlength="10" disabled />
											<button
												onclick="fnPopUpCalendar(buyDate,buyDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												id="buyDateCalendar" type="button">
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>구입처</th>
									<td><input type="text" class="form-control" id="buyCorpNm"
										name="buyCorpNm"></td>
									<th>구입가격</th>
									<td><input type="text" class="form-control" id="buyAmt"
										name="buyAmt" style="text-align: right;"></td>
								</tr>
								<tr>
									<th>담당자</th>
									<td>
										<div class="input-sub m-0">
											<input type="hidden" class="mainChargr" id="mainChargr"
												name="mainChargr"> <input type="text"
												class="form-control" id="mainChargrNm" name="mainChargrNm"
												disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnMainChargr"
												onClick="selectMainChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작성일</th>
									<td>
										<div class="form-group input-sub m-0">
											<input class="form-control" type="text" id="equipRegDate"
												name="equipRegDate" maxlength="10" disabled />
											<button
												onclick="fnPopUpCalendar(equipRegDate,equipRegDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												id="equipRegDateCalendar" type="button">
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>사용유무</th>
									<td><select class="custom-select" id="useYn"></select></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td colspan="3"><input type="text" class="form-control"
										style="max-width: 100%" id="equipDesc" name="equipDesc"></td>
								</tr>
							</table>
							<div class="mt-2">
								<button type="button" class="btn btn-primary float-right d-none"
									id="btnSave">저장</button>
							</div>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">금형사진</th>
										</tr>
										<tr>
											<td style="text-align: center">사진1</td>
											<td style="text-align: center">사진2</td>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src=""
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd1"
															name="imgAdd1" onchange="imageUpload(1)"> <label
															id="imgName1" class="custom-file-label" for="imgAdd1"></label>
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
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd2"
															name="imgAdd2" onchange="imageUpload(2)"> <label
															id="imgName2" class="custom-file-label" for="imgAdd2"></label>
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
											<td style="text-align: center">사진3</td>
											<td style="text-align: center">사진4</td>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile3" src=""
														name="imageFile3" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4" src=""
														name="imageFile4" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd3"
															name="imgAdd3" onchange="imageUpload(3)"> <label
															id="imgName3" class="custom-file-label" for="imgAdd3"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(3);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd4"
															name="imgAdd4" onchange="imageUpload(4)"> <label
															id="imgName4" class="custom-file-label" for="imgAdd4"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(4);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!--========tab23part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-warning float-right ml-1"
									id="btnCorrDel">삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnCorrEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnCorrAdd">추가</button>

							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="equipCorrInfo">
										<colgroup>
											<col width="7%">
											<col width="20%">
											<col width="25%">
											<col width="23%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>일자</th>
												<th>이력내용</th>
												<th>조치및교정기관</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="card-body col-sm-12 p-1">
								<button type="button"
									class="btn btn-primary float-right d-none ml-1" id="btnSave2">저장</button>
							</div>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab23part=====-->
						<div class="tab-pane fade" id="tab4">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-warning float-right ml-1"
									id="btnEtcDel">삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnEtcEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1"
									id="btnEtcAdd">추가</button>
							</div>
							<form id="form4" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="equipEtcInfo">
										<colgroup>
											<col width="7%">
											<col width="20%">
											<col width="73%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>구분</th>
												<th>내용</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="card-body col-sm-12 p-1">
								<button type="button"
									class="btn btn-primary float-right d-none ml-1" id="btnSave3">저장</button>
							</div>
						</div>
						<!--====end====tab3 part=====-->

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

	let menuAuth = 'emsc0020';
	let currentHref = "emsc0020";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비이력관리");
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	uiProc(true);
	var equipCd = null;
	var serverDate = "${serverDateTo}"
	var index=0;

	//공통코드 처리 시작
	var equipGubunCode = new Array();
	<c:forEach items = "${equipGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>

	var admDeptCode = new Array();
	<c:forEach items="${admDept}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	var etcGubunCode = new Array();
	<c:forEach items="${etcGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	etcGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 종료

	//선택박스 처리
	selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
	selectBoxAppend(admDeptCode, "admDept", "", "2");
	selectBoxAppend(useYnCode, "useYn", "", "");

	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});

	$('#buyDate').val(serverDate);
	$('#equipRegDate').val(serverDate);

	//설비정보 목록
	let equipCodeTable = $('#equipCodeTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : true,
						ordering : false,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						pageLength : 20,
						ajax : {
							url : '<c:url value="/bm/equipCodeAdmList"/>',
							type : 'GET',
							data : {},
						},
						columns : [ {
							data : 'equipCd'
						}, {
							data : 'equipGubunNm'
						}, {
							data : 'equipNm'
						}, {
							data : 'equipModelNm'
						}, {
							data : 'equipType'
						}, {
							data : 'mfcCorpNm'
						}, 
						],
						order : [ [ 0, 'asc' ], ],
						buttons : [ {
							extend : 'copy',
							title : '설비정보관리',
						}, {
							extend : 'excel',
							title : '설비정보관리',
						}, {
							extend : 'print',
							title : '설비정보관리',
						}, ],
					});

	//설비정보 상세정보 보기
	$('#equipCodeTable tbody')
			.on(
					'click',
					'tr',
					function() {

						$('#info').tab('show');
						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							console.log("등록중입니다.");
							return false;
						}

						if ($(this).hasClass('selected')) {
							$(this).removeClass('selected');
						} else {
							$('#equipCodeTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}

						equipCd = equipCodeTable.row(this).data().equipCd;

						$.ajax({
							url : '<c:url value="bm/equipCodeAdmRead"/>',
							type : 'GET',
							data : {
								'equipCd' : function() {
									return equipCd;
								},
							},
							success : function(res) {
								let data = res.data;
								$('#equipCd').val(data.equipCd);
								$('#equipNm').val(data.equipNm);
								$('#equipModelNm').val(data.equipModelNm);
								$('#equipType').val(data.equipType);
								$('#mfcCorpNm').val(data.mfcCorpNm);
								$('#mfcNo').val(data.mfcNo);
								$('#admNo').val(data.admNo);
								$('#admDept').val(data.admDept);
								$('#buyCorpNm').val(data.buyCorpNm);
								$('#buyAmt').val(addCommas(data.buyAmt));
								$('#buyDate').val(moment(data.buyDate).format('YYYY-MM-DD'));
								$('#mainChargrNm').val(data.mainChargrNm);
								$('#equipRegDate').val(moment(data.equipRegDate).format('YYYY-MM-DD'));
								$('#equipDesc').val(data.equipDesc);

								//선택박스 처리
								selectBoxAppend(equipGubunCode, "equipGubun",
										data.equipGubun, "2");
								selectBoxAppend(admDeptCode, "admDept",
										data.admDept, "2");
								selectBoxAppend(useYnCode, "useYn", data.useYn,
										"");

								//화면처리
								sideView = 'edit';
								uiProc(true);
								$('#btnSave').addClass('d-none'); // 저장버튼
								$('#btnAdd').attr('disabled', false); //수정버튼
								$('#btnEdit').attr('disabled', false); //수정버튼
								$('#photo').removeClass('disabled');
								$('#corr').removeClass('disabled');
								$('#etc').removeClass('disabled');
								imgPrint();
							}
						});
					});

	//교정내역 목록
	let equipCorrInfo = $('#equipCorrInfo').DataTable({	
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
			url : '<c:url value="/bm/equipCorrInfolist"/>',
			type : 'GET',
			data : {
				'equipCd' : function(){return equipCd;}
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
					data : 'corrRegDate',
					render : function(data, type, row, meta) {
						var value = "";
						if (data != null) {
							return '<input class="form-control" type="text" id="corrRegDate'+meta.row + meta.settings._iDisplayStart + 1+'" value="'+data+'" name="corrRegDate" style="text-align:center;" disabled>';
						} else {
							var html = '<div class="form-group input-sub m-0">';
							html += '<input class="form-control" type="text" id="corrRegDate'+meta.row + meta.settings._iDisplayStart + 1+'" value="'+serverDate+'" name="corrRegDate" disabled>';
							html += '<button onclick="fnPopUpCalendar(corrRegDate'+meta.row + meta.settings._iDisplayStart + 1+',corrRegDate'+meta.row + meta.settings._iDisplayStart + 1+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="corrRegDate" type="button">';;
							html += '<span class="oi oi-calendar"></span></button>';
							html += '</div>';
							return html;
						}
					}
				},
				{
					data : 'corrCont',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="corrCont" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" name="corrCont" value=""/>';
						}
					}
				},
				{
					data : 'corrActOrgan',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="corrActOrgan" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" name="corrActOrgan" value="" />';
						}
					}
				},
				{
					data : 'corrDesc',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="corrDesc" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control"  name="corrDesc" value="" />';
						}
					}
				}, 
			],
			order : [ [ 0, 'asc' ], ],
			drawCallback: function(settings) {
				//uiProc2(true);
	        }, 
	});

	//기타 목록
	let equipEtcInfo = $('#equipEtcInfo')
			.DataTable(
					{
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
							url : '<c:url value="/bm/equipEtcInfoList"/>',
							type : 'GET',
							data : {
								'equipCd' : function() {
									return equipCd;
								}
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
									data : 'etcGubun',
									render : function(data, type, row, meta) {
										var html = "";
										html = selectBoxHtml2(etcGubunCode,"etcGubun", data, row, meta);
										return html;
									}
								},
								{
									data : 'etcCont',
									render : function(data, type, row, meta) {
										if (data != null) {
											return '<input type="text" class="form-control" style="max-width:100%" name="etcCont" value="'+ data + '" disabled>';
										} else {
											return '<input type="text" class="form-control" style="max-width:100%" name="etcCont" value="">';
										}
									}
								} ],
						order : [ [ 0, 'asc' ], ],
						drawCallback: function(settings) {
				        }, 
					});

	//교정내역 데이터 클릭 시
	$('#equipCorrInfo tbody').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#equipCorrInfo').DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
				tableIdx = $('#equipCorrInfo').DataTable().row(this).index();
				
				console.log(tableIdx);
				btnView = "edit";
			});

	//기타 데이터 클릭 시
	$('#equipEtcInfo tbody').on(
			'click',
			'tr',
			function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					$('#equipEtcInfo').DataTable().$('tr.selected')
							.removeClass('selected');
					$(this).addClass('selected');
				}
				tableIdx = $('#equipEtcInfo').DataTable().row(this).index();
				console.log(tableIdx);
				btnView = "edit";
			});

	//사진 탭 클릭시
	$('#photo').on('click', function() {
		imgPrint();

	});

	//교정내역 탭 클릭시
	$('#corr').on('click', function() {
		//$('#btnCorrAdd').attr('disabled',true);
		//$('#btnCorrDel').attr('disabled',true);
		$('#btnSave1').addClass('d-none');
		$('#btnSave2').addClass('d-none');
		$('#btnSave3').addClass('d-none');

		
		
		$('#equipCorrInfo').DataTable().ajax.reload();
		uiProc2(true);
	});

	//기타 탭 클릭시
	$('#etc').on('click', function() {
		btnView = "";
		
		//$('#btnEtcAdd').attr('disabled',true);
		//$('#btnEtcDel').attr('disabled',true);
		$('#btnSave1').addClass('d-none');
		$('#btnSave2').addClass('d-none');
		$('#btnSave3').addClass('d-none');
		$('#equipEtcInfo').DataTable().ajax.reload();
		uiProc3(true);
	});

	//등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		//초기화
		$('.form-control').val(null);
		uiProc(false);

		$('#btnSave').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#buyDate').val(serverDate);
		$('#equipRegDate').val(serverDate);

		$('#photo').addClass('disabled');
		$('#corr').addClass('disabled');
		$('#etc').addClass('disabled');

		//선택박스 처리
		selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
		selectBoxAppend(admDeptCode, "admDept", "", "2");
		selectBoxAppend(useYnCode, "useYn", "", "");

		$.ajax({
			url : '<c:url value="/bm/readEquipSeq"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$('#equipCd').val(data);
					//$('#equipNm').focus();
				} else {
					toastr.error(res.message);
				}
			},
		}); 
	});

	// 수정폼
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);

		$('#photo').addClass('disabled');
		$('#corr').addClass('disabled');
		$('#etc').addClass('disabled');
		
		//$('#btnSave').attr('disabled', false);
		$('#btnSave').removeClass('d-none');
	});

	// 교정내역 수정버튼
	$('#btnCorrEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		$('input[name=corrCont]').eq(tableIdx).attr('disabled',false);
		$('input[name=corrActOrgan]').eq(tableIdx).attr('disabled',false);
		$('input[name=corrDesc]').eq(tableIdx).attr('disabled',false);
		btnView ='';
		//uiProc2(false);
		//$('#btnCorrAdd').attr('disabled',false);
		//$('#btnCorrDel').attr('disabled',false);
		$('#btnSave2').removeClass('d-none');
	});

	// 기타 수정버튼
	$('#btnEtcEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		//uiProc3(false);
		console.log(tableIdx);
		$('select[name=etcGubun]').eq(tableIdx).attr('disabled',false);
		$('input[name=etcCont]').eq(tableIdx).attr('disabled',false);
		btnView = '';
		//$('#btnEtcAdd').attr('disabled',false);
		//$('#btnEtcDel').attr('disabled',false);
		$('#btnSave3').removeClass('d-none');
	});
	
	//교정내역 추가버튼
	$('#btnCorrAdd').on('click', function() {
		//uiProc2(false);
		$('#equipCorrInfo').DataTable().row.add({}).draw(false);
		//uiProc2(false);
		
		if (equipCorrInfo.data().count() > 0) {
			$('#btnSave2').removeClass('d-none'); // 등록버튼
		}
		btnView = '';
	});

	//기타 추가버튼
	$('#btnEtcAdd').on('click', function() {
		btnView = 'edit';
		$('#equipEtcInfo').DataTable().row.add({}).draw(false);
		//uiProc3(false);
		//$('#btnEtcEdit').attr('disabled',true);
		if (equipEtcInfo.data().count() > 0) {
			$('#btnSave3').removeClass('d-none'); // 등록버튼
		}
		btnView = '';
	}); 


	//교정내역 삭제버튼
	$('#btnCorrDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#equipCorrInfo').DataTable().rows(tableIdx).remove().draw();
		//uiProc2(false);

		if(equipCorrInfo.data().count() == 0){
			$('#btnSave2').addClass('d-none');
		}else{
			$('#btnSave2').removeClass('d-none');
		}
		
		btnView = '';

	});

	//기타 삭제버튼
	$('#btnEtcDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#equipEtcInfo').DataTable().rows(tableIdx).remove().draw();
		//uiProc3(false);

		if(equipEtcInfo.data().count() == 0){
			$('#btnSave3').addClass('d-none');
		}else{
			$('#btnSave3').removeClass('d-none');
		}
	
		btnView = '';

	});

	//설비정보 기본정보 저장
	$('#btnSave').on('click', function() {
		//입력값 검사
		if ($('#equipGubun option:selected').val() == "") {
			$('#equipGubun').focus();
			toastr.warning('구분을 입력해 주세요.');
			return false;
		}
		if (!$.trim($('#equipNm').val())) {
			toastr.warning('설비명을 입력해 주세요.');
			$('#equipNm').focus();
			return false;
		}
		if (sideView == "add") {
			url = '<c:url value="/bm/equipCodeCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bm/equipCodeUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'equipCd' : $('#equipCd').val(),
				'equipGubun' : $('#equipGubun option:selected').val(),
				'equipNm' : $('#equipNm').val(),
				'equipModelNm' : $('#equipModelNm').val(),
				'equipType' : $('#equipType').val(),
				'mfcCorpNm' : $('#mfcCorpNm').val(),
				'mfcNo' : $('#mfcNo').val(),
				'admNo' : $('#admNo').val(),
				'admDept' : $('#admDept option:selected').val(),
				'buyDate' : $('#buyDate').val().replace(/-/g,''),
				'buyCorpNm' : $('#buyCorpNm').val(),
				'buyAmt' : $('#buyAmt').val().replace(/,/g,''),
				'mainChargr' : $('#mainChargr').val(),
				'equipRegDate' : $('#equipRegDate').val().replace(/-/g,''),
				'useYn' : $('#useYnCd option:selected').val(),
				'equipDesc' : $('#equipDesc').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
					$('#equipCodeTable').DataTable().ajax.reload();

					$('#photo').removeClass('disabled');
					$('#corr').removeClass('disabled');
					$('#etc').removeClass('disabled');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				uiProc(true);
				$('#btnEdit').attr('disabled', false);
				$('#btnSave').addClass('d-none');

			}
		});
	});

	//설비정보 교정내역 저장
	$('#btnSave2').on('click',function() {
		var check = true;
		var dataArray = new Array();

		$('#equipCorrInfo tbody tr').each(function(index, item) {

			if (equipCorrInfo.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=corrCont]').val()=="") {
					toastr.warning('이력내용 입력해 주세요.');
					$(this).find('td input[name=corrCont]').focus();
					check = false;
					return false;
				}
				if ($(this).find("td input[name=corrActOrgan]").val()=="") {
					toastr.warning('조치및교정기관을 입력해 주세요.');
					$(this).find('td input[name=corrActOrgan]').focus();
					check = false;
					return false;
				}
			}

			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.corrRegDate = $(this).find('td input[name=corrRegDate]').val();
			rowData.corrCont = $(this).find('td input[name=corrCont]').val();
			rowData.corrActOrgan = $(this).find('td input[name=corrActOrgan]').val();
			rowData.corrDesc = $(this).find('td input[name=corrDesc]').val();

			dataArray.push(rowData);
			console.log(rowData)
		});

		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/equipCorrInfoCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");
						$('#equipCorrInfo').DataTable().ajax.reload();
						uiProc2(true);
						$('#btnSave2').addClass('d-none');
						//$('#btnCorrAdd').attr('disabled',true);
						//$('#btnCorrDel').attr('disabled',true);
					} else if (res.result == "exist") {
						toastr.error("이미 등록된 일자입니다. 확인해주세요.");

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

	//설비정보 기타 저장
	$('#btnSave3').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipEtcInfo tbody tr').each(function(index, item) {
	
			if (equipCorrInfo.data().count() != 0) {

				if ($(this).find('td select[name=etcGubun] option:selected').val() == "") {
					toastr.warning('구분을 선택해 주세요.');
					$('input[name=etcGubun]').focus();
					check = false;
					return false;
				}
				if ($(this).find("td input[name=etcCont]").val() == "") {
					toastr.warning('내용을 입력해 주세요.');
					$('input [name=etcCont]').focus();
					check = false;
					return false;
				}
			}

			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.etcGubun = $(this).find('td select[name=etcGubun] option:selected').val();
			rowData.etcCont = $(this).find('td input[name=etcCont]').val();

			dataArray.push(rowData);
			console.log(dataArray)
		});
	
		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/equipEtcInfoCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");
						$('#equipEtcInfo').DataTable().ajax.reload();
						uiProc3(true);
						$('#btnEtcEdit').attr('disabled',false);
						//$('#btnEtcAdd').attr('disabled',true);
						//$('#btnEtcDel').attr('disabled',true);
						$('#btnSave3').addClass('d-none');
					} else if (res.result == "exist") {
						toastr.error("일자가 중복됩니다.");
	
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
	

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/equipCodeImgRead"/>',
			data : {
				'equipCd' : equipCd
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src",
							"data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
				}
				if (data.imageFile1 == null) {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
				}
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src",
							"data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
				}
				if (data.imageFile2 == null) {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
				}
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src",
							"data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
				}
				if (data.imageFile3 == null) {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
				}
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src",
							"data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
				}
				if (data.imageFile4 == null) {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}

	//이미지 등록
	function imageUpload(number) {
		var value = null;

		value = number;

		var fileListView = "";

		var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("equipCd", equipCd);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.

		$.ajax({
			url : '<c:url value="/bm/equipCodeImageUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgName' + value).text("");
				}
				imgPrint();
			}
		});

	}

	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/equipCodeImageDelete"/>',
			type : 'POST',
			data : {
				'equipCd' : equipCd,
				//'imageFile'			:		function(){a=null; a=$('#imgName'+number).text(); return a;},
				'value' : value,

			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					imgPrint();
				}

			},
			error : function(xhr, textStatus, error) {

				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
		$('#imgAdd' + value).val("");
		$('#imgName' + number).val("");
		$('#imgName' + number).text("");
		$('#imgName' + number).attr("src", "");

	}
	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectMainChargr() {
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
				$('#mainChargr').val(data.userNumber);
				$('#mainChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}

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
	
	//구입가격 계산
	$('#buyAmt').on('keyup',function(){
		var buyAmtValue = uncomma($(this).val());
		$('#buyAmt').val(addCommas(buyAmtValue));
	});
	
	function uiProc(flag) {
		$("#equipGubun").attr("disabled", flag);
		$("#equipNm").attr("disabled", flag);
		$("#equipModelNm").attr("disabled", flag);
		$("#equipType").attr("disabled", flag);
		$("#mfcCorpNm").attr("disabled", flag);
		$("#mfcNo").attr("disabled", flag);
		$("#admNo").attr("disabled", flag);
		$("#admDept").attr("disabled", flag);
		$("#buyCorpNm").attr("disabled", flag);
		$("#buyAmt").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#equipDesc").attr("disabled", flag);

		$('#btnAdmDept').attr("disabled", flag);
		$('#btnMainChargr').attr("disabled", flag);
		$('#equipRegDateCalendar').attr("disabled", flag);
		$('#buyDateCalendar').attr("disabled", flag);
	}

	function uiProc2(flag) {
		//$("input [name=corrRegDate]").attr("disabled", flag);
		$('input[name=corrCont]').attr("disabled", flag);
		$('input[name=corrActOrgan]').attr("disabled", flag);
		$('input[name=corrDesc]').attr("disabled", flag);
		$('button[name=btnCorrRegDate]').attr("disabled", flag);
	}

	function uiProc3(flag) {
		//$("select[name=etcGubun]").attr("disabled", flag);
		$("select[name=etcGubun]").attr("disabled", flag);
		$("input[name=etcCont]").attr("disabled", flag);
	}


</script>
</body>
</html>
