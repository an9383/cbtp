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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">설비관리</li>
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
					<button type="button" class="btn btn-primary float-left" id="">ERP
						조회</button>
					<br> <br>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipCodeTable" class="table table-bordered">
							<colgroup>
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
								<col width="16%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>설비명</th>
									<th>자산코드</th>
									<th>제작업체</th>
									<th>구입일</th>
									<th>관리번호</th>
									<th>관리담당</th>
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
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item"><a class="nav-link active show"
								id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a></li>
							<li class="nav-item"><a class="nav-link disabled"
								id="tab2Nav" data-toggle="tab" href="#tab2">사진</a></li>
							<li class="nav-item"><a class="nav-link disabled"
								id="tab3Nav" data-toggle="tab" href="#tab3">관련자료</a></li>
						</ul>
						<!-- /.nav-tabs -->
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
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
											<th>*설비명</th>
											<td><input type="text" class="form-control" id="equipNm"
												name="equipNm"></td>
											<th>*설비모델명</th>
											<td><input type="text" class="form-control"
												id="equipModel" name="equipModel"></td>
										</tr>
										<tr>
											<th>*자산코드</th>
											<td><input type="text" class="form-control" id="assetCd"
												name="assetCd"></td>
											<th>*관리번호</th>
											<td><input type="text" class="form-control" id="admNo"
												name="admNo"></td>
										</tr>
										<tr>
											<th>제작(조)일자</th>
											<!-- <input type="date" class="form-control" id="mfcDate"name="mfcDate"> -->
											<td>
												<div class="form-group input-sub m-0 row">
													<input class="form-control" type="text" id="mfcDate" name="mfcDate" />
													<button onclick="fnPopUpCalendar(mfcDate,mfcDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search"
														id="chooseMfcDate" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>*제작업체</th>
											<td><input type="text" class="form-control"
												id="mfcCorpCd" name="mfcCorpCd"></td>
										</tr>
										<tr>
											<th>구입일</th>
											<td>
												<div class="form-group input-sub m-0 row">
													<input class="form-control" type="text" id="buyDate" name="buyDate" />
													<button onclick="fnPopUpCalendar(buyDate,buyDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search"
														id="chooseBuyDate" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>*구입가격</th>
											<td><input type="text" class="form-control"
												id="buyAmount" name="buyAmount"></td>
												
										</tr>
										<tr>
											<th>*취득일</th>
											<td>
												<div class="form-group input-sub m-0 row">
													<input class="form-control" type="text" id="acqDate" name="acqDate" />
													<button onclick="fnPopUpCalendar(acqDate,acqDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search"
														id="chooseAcqDate" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>	
											<th>부대설비</th>
											<td><input type="text" class="form-control"
												id="supplmtryEquip" name="supplmtryEquip"></td>
										</tr>
										<tr>
											<th>*관리담당(정)</th>
											<td><input type="text" class="form-control"
												id="mainChargr" name="mainChargr"></td>
											<th>관리담당(부)</th>
											<td><input type="text" class="form-control"
												id="subChargr" name="subChargr"></td>
										</tr>
										<tr>
											<th>*사용부서</th>
											<td><input type="text" class="form-control"
												id="useDepart" name="useDepart"></td>
											<th>사용용도</th>
											<td><input type="text" class="form-control"
												id="usePurpose" name="usePurpose"></td>
										</tr>
										<tr>
											<th>설비위치</th>
											<td><input type="text" class="form-control"
												id="equipLocation" name="equipLocation"></td>
											<th>설비사양</th>
											<td><input type="text" class="form-control"
												id="equipSpec" name="equipSpec"></td>
										</tr>
										<tr>
											<th>설비크기</th>
											<td><input type="text" class="form-control"
												id="equipsize" name="equipsize"></td>
											<th>전원</th>
											<td><input type="text" class="form-control"
												id="equipElec" name="equipElec"></td>
										</tr>
										<tr>
											<th>특이사항</th>
											<td colspan="3"><input type="text" class="form-control"
												id="equipDesc" name="equipDesc" style="max-width: 100%"></td>
										</tr>
										<tr>
											<th>*사용상태</th>
											<td><select class="custom-select" id="useYn"
												name="useYn"></select></td>
											<th>미사용사유</th>
											<td><input type="text" class="form-control"
												id="noUseDesc" name="noUseDesc"></td>
										</tr>
									</table>
								</div>
							</form>
						</div>
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
											<td style="text-align:center">사진1</td>
											<td style="text-align:center">사진2</td>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" 
														name="imageFile1" style="width: 100%; height:100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2"
														name="imageFile2" style="width: 100%; height:100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group mt-3">
													<div class="custom-file mt-2">
														<input type="file" class="custom-file-input" id="imgAdd1" name="imgAdd1" onchange="imageUpload(1)"> 
														<label class="custom-file-label" for="imgAdd1"></label>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group mt-3">
													<div class="custom-file mt-2">
														<input type="file" class="custom-file-input" id="imgAdd2" name="imgAdd2" onchange="imageUpload(2)">  
														<label class="custom-file-label" for="imgAdd2"></label>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align:center">사진3</td>
											<td style="text-align:center">사진4</td>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile3"
														name="imageFile3" style="width: 100%; height:100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4"
														name="imageFile4" style="width: 100%; height:100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group mt-3">
													<div class="custom-file mt-2">
														<input type="file" class="custom-file-input" id="imgAdd3" name="imgAdd3" onchange="imageUpload(3)"> 
														<label class="custom-file-label" for="imgAdd3"></label>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group mt-3">
													<div class="custom-file mt-2">
														<input type="file" class="custom-file-input" id="imgAdd4" name="imgAdd4" onchange="imageUpload(4)"> 
														<label class="custom-file-label" for="imgAdd4"></label>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab3">
								<button type="button" class="btn btn-primary float-right mr-2"
									id="btnAttachDataDelete">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAttachDataUpdate">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
								<button type="button" class="btn btn-primary float-right"
									id="btnAttachDataAdd">추가</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
								
							<!--저장 버튼-->
								<div class="table-responsive">
									<form id="form3" method="post" enctype="multipart/form-data">
									<table class="table table-bordered" id="equipAttachTable">
										<colgroup>
											<col width="5%">
											<col width="20%">
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
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
									</table>
								</form>
							</div>			
						</div>
					</div>
				</div>
				<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right"
						id="btnSave">저장</button>
					<button type="button" class="btn btn-primary d-none float-right"
						id="AttachDatabtnSave">저장</button>
					<button type="button" class="btn btn-primary d-none float-right"
						id="AttachDatabtnSave2">수정</button>
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

	let currentHref = "bmsc0100";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	let viewIdx;
	let sideView = 'add';
	var equipCd;
	var attachSeq;
	
	uiProc(true);
	
	//공통코드 처리 시작      
	var useYnCode = new Array(); // 사용여부

	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   
	
	//파일 저장 시간 가져오기
	var now=new Date();
	var year=now.getFullYear();
	var mon=now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var str=year+""+mon;
	
	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", useYn, "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#AttachDatabtnSave').addClass('d-none');
	});

	$("#dealCorpNm").attr("disabled", true);


	
	// 목록
	let equipCodeTable = $('#equipCodeTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						destroy : true,
						paging : true,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						pageLength : 20,
						ajax : {
							url : '<c:url value="/equipCodeAdmList"/>',
							type : 'GET',
							data : {},
						},
						rowId : 'equipCd',
						columns : [ {
							data : 'equipNm'
						}, {
							data : 'assetCd'
						}, {
							data : 'mfcCorpCd'
						}, {
							data : 'buyDate'
						}, {
							data : 'admNo'
						}, {
							data : 'mainChargr'
						}, ],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '설비 관리'
						}, 'print' ]
					});
	
	
	// 설비관리 기본정보 보기
	$('#equipCodeTable tbody')
			.on(
					'click',
					'tr',
					function() {
						$('#tab1Nav').tab('show');
						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							console.log("등록중입니다.");
							return false;
						}
						if ($(this).hasClass('selected')) {
							//$(this).removeClass('selected');
							
						} else {
							$('#equipCodeTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}
						
						$("#tab2Nav").removeClass('disabled');
						$("#tab3Nav").removeClass('disabled');
						equipCd = equipCodeTable.row(this).data().equipCd;
						$('#formBox').removeClass('d-none');
						$('#btnSave').addClass('d-none'); // 저장버튼
						$('#btnEdit').attr('disabled', false); //수정버튼

						//선택 행 데이터 불러오기
						$.ajax({
							url : '<c:url value="/bm/equipCodeAdmRead"/>',
							type : 'GET',
							data : {
								'equipCd' : equipCd
							},
							success : function(res) {
								let data = res.data;
								sideView = 'edit';
								$('#form input[name="equipNm"]').val(data.equipNm);
								$('#form input[name="equipModel"]').val(data.equipModel);
								$('#form input[name="assetCd"]').val(data.assetCd);
								$('#form input[name="admNo"]').val(data.admNo);
								$('#form input[name="mfcCorpCd"]').val(	data.mfcCorpCd);
								$('#form input[name="mfcDate"]').val(data.mfcDate);
								$('#form input[name="buyAmount"]').val(data.buyAmount);
								$('#form input[name="buyDate"]').val(data.buyDate);
								$('#form input[name="supplmtryEquip"]').val(data.supplmtryEquip);

								$('#form input[name="acqDate"]').val(data.acqDate);
								$('#form input[name="mainChargr"]').val(data.mainChargr);
								$('#form input[name="subChargr"]').val(data.subChargr);
								$('#form input[name="useDepart"]').val(data.useDepart);
								$('#form input[name="usePurpose"]').val(data.usePurpose);
								$('#form input[name="equipLocation"]').val(data.equipLocation);
								$('#form input[name="equipSpec"]').val(data.equipSpec);
								$('#form input[name="equipsize"]').val(data.equipsize);
								$('#form input[name="equipElec"]').val(data.equipElec);
								$('#form input[name="equipDesc"]').val(data.equipDesc);
								$('#form input[name="useYn"]').val(data.useYn);
								$('#form input[name="noUseDesc"]').val(data.noUseDesc);
								$('#form input[name="imageFile1"]').val(data.imageFile1);
								$('#form input[name="imageFile2"]').val(data.imageFile2);
								$('#form input[name="imageFile3"]').val(data.imageFile3);
								$('#form input[name="imageFile4"]').val(data.imageFile4);

								//선택박스 처리
								selectBoxAppend(useYnCode, "useYn", data.useYn,	"");
								imgPrint();
								
								$('#equipAttachTable').DataTable().ajax.reload();
								//attachDataList();
							}
						});
					});

	// 등록폼
	$('#btnAdd').on('click', function() {
		$("#tab2Nav").addClass('disabled');
		$("#tab3Nav").addClass('disabled');
		$('#tab1Nav').tab('show');
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});
		$('#form2').each(function() {
			this.reset();
		});
		//설비코드 중복체크
		//$('#equipCdCheck').val("false"); 
		$('#btnCheck').attr("disabled", false);
		//화면처리        
		uiProc(false);

		//선택박스처리\

		$('#useYn option[value="001"]').attr('selected', 'selected');

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#equipNm').val())) {
			toastr.error('설비명를 입력해주세요.');
			$('#equipNm').focus();
			return false;
		}

		if (!$.trim($('#equipModel').val())) {
			toastr.error('설비모델명을 입력해주세요.');
			$('#equipModel').focus();
			return false;
		}

		if (!$.trim($('#assetCd').val())) {
			toastr.error('자산코드를 입력해주세요.');
			$('#assetCd').focus();
			return false;
		}

		if (!$.trim($('#admNo').val())) {
			toastr.error('관리번호를 입력해주세요.');
			$('#admNo').focus();
			return false;
		}

		if (!$.trim($('#mfcCorpCd').val())) {
			toastr.error('제작업체를 입력해주세요.');
			$('#mfcCorpCd').focus();
			return false;
		}

		if (!$.trim($('#buyAmount').val())) {
			toastr.error('구입금액을 입력해주세요.');
			$('#buyAmount').focus();
			return false;
		}

		if (!$.trim($('#acqDate').val())) {
			toastr.error('취득일을 입력해주세요.');
			$('#acqDate').focus();
			return false;
		}

		if (!$.trim($('#mainChargr').val())) {
			toastr.error('관리담당(정)을 입력해주세요.');
			$('#mainChargr').focus();
			return false;
		}

		if (!$.trim($('#useDepart').val())) {
			toastr.error('사용부서를 입력해주세요.');
			$('#useDepart').focus();
			return false;
		}

		var url = '<c:url value="/bm/equipCodeAdmCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/bm/equipCodeAdmUpdate"/>';
		}

		else {
			equipCd = "";
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'equipCd' 			: equipCd,
				'equipNm' 			: $('#equipNm').val(),
				'equipModel' 		: $('#equipModel').val(),
				'assetCd' 			: $('#assetCd').val(),
				'admNo' 			: $('#admNo').val(),
				'mfcCorpCd' 		: $('#mfcCorpCd').val(),
				'mfcDate' 			: $('#mfcDate').val(),
				'buyAmount' 		: $('#buyAmount').val(),
				'buyDate' 			: $('#buyDate').val(),
				'supplmtryEquip' 	: $('#supplmtryEquip').val(),
				'acqDate' 			: $('#acqDate').val(),
				'mainChargr' 		: $('#mainChargr').val(),
				'subChargr' 		: $('#subChargr').val(),
				'useDepart' 		: $('#useDepart').val(),
				'usePurpose' 		: $('#usePurpose').val(),
				'equipLocation' 	: $('#equipLocation').val(),
				'equipSpec' 		: $('#equipSpec').val(),
				'equipsize' 		: $('#equipsize').val(),
				'equipElec' 		: $('#equipElec').val(),
				'equipDesc' 		: $('#equipDesc').val(),
				'useYn' 			: $('#useYn option:selected').val(),
				'noUseDesc' 		: $('#noUseDesc').val()
			},
			//			beforeSend : function() {
			// $('#btnAddConfirm').addClass('d-none');
			//}, 
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#equipCodeTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#equipCodeTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		$("#tab2Nav").removeClass('desabled');
		$("#tab3Nav").removeClass('desabled');
		if (sideView != 'edit') {
			toastr.error("수정할 목록을 선택해 주세요!");
			return false;
		}
		uiProc(false);

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
	});


	
	//이미지 Event
	$('#tab2Nav').on('click', function() {
		$('#imageFile1').attr("src","");
		$('#imageFile2').attr("src","");
		$('#imageFile3').attr("src","");
		$('#imageFile4').attr("src","");
		imgPrint();
	});
	
	//이미지 조회
	function imgPrint() {
		$.ajax({
			url: '<c:url value="/bm/equipCodeImgRead"/>',
			data: {
			'equipCd'	:	equipCd
			},
			type: 'GET',
			success: function(res){
				
				if(res.result == "error"){
					alert("오류가 발생했습니다.");
            	} else {
                	
            		//$('#imageFile1').attr("src","data:image/jpg;base64,"+res.imageFile1);
            		//$('#imageFile2').attr("src","data:image/jpg;base64,"+res.imageFile2);
            		//$('#imageFile3').attr("src","data:image/jpg;base64,"+res.imageFile3);
            		//$('#imageFile4').attr("src","data:image/jpg;base64,"+res.imageFile4);

					
            		if(res.imageFile1 != null) {
						$('#imageFile1').attr("src","data:image/jpg;base64,"+res.imageFile1);
                    }
            		if(res.imageFile2 != null) {
						$('#imageFile2').attr("src","data:image/jpg;base64,"+res.imageFile2);
                    }
            		if(res.imageFile3 != null) {
						$('#imageFile3').attr("src","data:image/jpg;base64,"+res.imageFile3);
                    }
            		if(res.imageFile4 != null) {
						$('#imageFile4').attr("src","data:image/jpg;base64,"+res.imageFile4);
                    }

				}
			},
	        error: function(xhr,textStatus,error){
		        alert("예상치 못한 오류가 발생했습니다.");
	        }
        });
	}
	
	//이미지 등록
	function imageUpload(number) {
		console.log("사진 등록");
		var value = null;

		value = number;
		
		var fileListView = "";
        
        var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data
        
        //var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출
        
        //var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
        
        formData.append("equipCd",equipCd);
        formData.append("value", value);
        //formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
        
        
        $.ajax({
            url: '<c:url value="/bm/equipCodeImageUpload"/>',
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
				if(data.result == "ok"){ //응답결과
					toastr.success('등록되었습니다.');
					imgPrint();
				} else if(data.result =="") {
					
				}else {
					alert("파일 등록에 실패하였습니다.");
				}
            },
            error: function(xhr,textStatus,error){
                                  
              console.log("textStatus: "+xhr.status+", error: "+error);
              alert("예상치 못한 오류가 발생했습니다.");
          }
        });
	}
	
	
	//관련자료 버튼 Event
	$('#tab3Nav').on('click', function() {
		$('#AttachDatabtnSave').addClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', false);
		$('#btnAttachDataUpdate').attr('disabled', false); //수정버튼
		$("#btnAttachDataDelete").attr("disabled", false);
		$('#createValue').remove();
		$('#equipAttachTable').DataTable().ajax.reload();
	});







	status ='';
	let equipAttachTable = $('#equipAttachTable')
			.DataTable(
					{
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
							url : '<c:url value="/equipAttachDataList"/>',
							type : 'GET',
							data : {'attachCd' : function(){return equipCd;}},
						},
						rowId : 'attachCd',
						columns : [ 
						/* 	{
								data : 'attachSeq',
								'className' : 'text-center'
							},*/{	
					    		render: function(data, type, row, meta) {		
									return meta.row + meta.settings._iDisplayStart + 1 ;
				    			}
					    	}, {
								render : function(data,
										type, row) {
									return moment(
											row['regAttachDate'])
											.format(
													'YYYY-MM-DD');
								},
								'className' : 'text-center'
							}, {
								data : 'regNm',
									'className' : 'text-center'
							}, {
								data : 'contents'
									, render : function(data, type, row) {
						                  return '<input type="text" value='+data+' disabled />';
						               }
							}, {
								data : 'attachFn'
									, render : function(data, type, row) {
						                  
										var del = '<div class="rightsidebar-close">';
										del += ' <button type="button" class="btn" name="closeBtn">';
										del += '<i class="mdi mdi-close"></i>';
										del += '</button>';
										del += '</div>';
										
										if(data == ''){
											del = '<a href="/bm/equipAttachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'">'+data+'</a>'
										} else{
											del = '<a href="/bm/equipAttachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'">'+data+'</a>' + del;
										}
										
										
										return  del;
						               }
							}
						], buttons : []
					});

	//데이터 클릭 시
	$('#equipAttachTable tbody')
			.on(
					'click',
					'tr',
					function() {
						if(status=="updating") {
							return;
						}
						
						if ($(this).hasClass('selected')) {
							//$(this).removeClass('selected');
						} else {
							$('#equipAttachTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}
						
						status="choice";
						$("#tab1Nav").removeClass('disabled');
						$("#tab2Nav").removeClass('disabled');
						$('#formBox').removeClass('d-none');
						attachSeq = equipAttachTable.row(this).data().attachSeq;
						contents = equipAttachTable.row(this).data().contents;
						attachFn = equipAttachTable.row(this).data().attachFn;
						$('#btnAttachDataUpdate').attr('disabled', false); //수정버튼
						$('#btnAttachDataAdd').attr('disabled', true);
					});
	
	//수정 버튼 클릭
	$('#btnAttachDataUpdate').on('click', function() {
		if (status != 'choice') {
			toastr.error("수정할 목록을 선택해 주세요!");
			return false;
		}

		$(".selected").eq(1).find('td').eq(4).html('<td><form id="formFileUpdate" method="post" enctype="multipart/form-data"> <div class="custom-file mt-2">'
					+'<input type="file" class="custom-file-input" id="fileNm" name="fileNm">'
					+'<label class="custom-file-label" for="fileNm"></label></form></td>'
					+'</div></form></td>');
		$(".selected").eq(1).find('td').eq(3).html('<td><input type="text" name="contents" value='+contents+' id="contents" style="width:100%"/></td>');
		$("#tab1Nav").addClass('disabled');
		$("#tab2Nav").addClass('disabled');


		$('#btnCheck').attr("disabled", false);
		$('#viewBox').addClass('d-none');
		$('#AttachDatabtnSave2').removeClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', true);
		$('#btnAttachDataDelete').attr('disabled', true);
		$('#btnAttachDataUpdate').attr('disabled', true);		
	});

	//저장 버튼 클릭
	$('#AttachDatabtnSave2').on('click', function() {
		var formData = new FormData(document.getElementById("formFileUpdate"));
		
		contentsValue = $('#contents').val();
		formData.append('contents', contentsValue);
		formData.append('path', str);
		formData.append('attachSeq', attachSeq);
		

		$.ajax({
			url : '<c:url value="/bm/equipAttachDataUpdate"/>',
			type : 'POST',
			data : formData,
			processData: false,
            contentType: false,
			success : function(res) {

				if (res.result == 'ok') {
					// 보기
					toastr.success('수정되었습니다.');
					status = '';
				} else {
					toastr.error(res.message);
				}
			}
		});

		$('#equipAttachTable').DataTable().ajax.reload();
		$('#formBox').removeClass('d-none');
		$('#equipCodeTable').DataTable().ajax.reload();
		$('#AttachDatabtnSave2').addClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', false);
		$('#btnAttachDataUpdate').attr('disabled', false);
		$("#btnAttachDataDelete").attr("disabled", false);
		$("#createValue").remove();
		
	}); 


	//파일삭제버튼
	$(document).on('click','button[name=closeBtn]',function() {
		var formData = new FormData();
		contentsValue = $('#contents').val();
		formData.append('fileNm',$('#equipAttachTable tbody').find('.selected').find('td').eq(4).text());
		formData.append('contents', contentsValue);
		formData.append('attachGubun', 'EQ');
		formData.append('path', str);
		formData.append('attachSeq', attachSeq);
		

		$.ajax({
			url : '<c:url value="/bm/moldAttachFileDelete"/>',
			type : 'POST',
			data : {
				
				'attachFn' : $('#equipAttachTable tbody').find('.selected').find('td').eq(4).text(),
				'contents' : contentsValue,
				'attachGubun' : 'EQ',
				'attachPath' :str,
				'attachSeq' : function(){return attachSeq;},
			},		
			success : function(res) {

				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					$('#equipAttachTable').DataTable().ajax.reload(function(){});
					status = '';
				} else {
					toastr.error(res.message);
				}
			}
		});

		
		$('#formBox').removeClass('d-none');
		$('#equipCodeTable').DataTable().ajax.reload();
		$('#AttachDatabtnSave2').addClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', false);
		$('#btnAttachDataUpdate').attr('disabled', false);
		$("#btnAttachDataDelete").attr("disabled", false);
		$("#createValue").remove();
		
	} );
	


	//삭제 버튼 클릭
	$('#btnAttachDataDelete').on('click', function() {
		if (status != 'choice') {
			toastr.error("삭제할 목록을 선택해 주세요!");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="/bm/equipAttachDataDelete"/>',
			type : 'POST',
			data : {
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
				$('#equipAttachTable').DataTable().ajax.reload();
				
			}
		});
		
		
	});  

	
	//관련 자료 추가 버튼 클릭 event
	$('#btnAttachDataAdd').on('click', function() {
		//관련자료 시퀀스  가져오기
		$.ajax({
			url : '<c:url value="/bm/attachDataSeq"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				attachDataSeq = res.seq;
				name = res.name;
				$('#btnAttachDataUpdate').attr('disabled', true);
				
				$('#equipAttachTable > #dataInsert').append('<tr id="createValue"><td><input type="text" value="'+attachDataSeq+'" style="width:100%" disabled id="createSeq" name="createSeq"</td>'
						+'<td>'
						+'<div class="form-group input-sub m-0 row">'
						+'<input class="form-control" type="text" id="attachRegDate" name="acqDate" />'
						+	'<button onclick="fnPopUpCalendar(attachRegDate,attachRegDate,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
						+		'id="chooseAttachRegDate" type="button">'
						+		'<span class="oi oi-calendar"></span>'
						+	'</button>'
						+'</div>'
						+'</td>'
						+'<td><input type="text" value="'+name+'"name="regId" id="regId" style="width:100%" disabled/></td>'
						+'<td><input type="text" name="contents" id="contents" style="width:100%"/></td>'
						+'<td><form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file mt-2">'
						+'<input type="file" class="custom-file-input" id="fileNm" name="fileNm">'
						+'<label class="custom-file-label" for="fileNm"></label>'
						+'</div></form></td>'
						+'</tr>');
			}
		});
		$('#btnCheck').attr("disabled", false);
		$('#viewBox').addClass('d-none');
		$('#AttachDatabtnSave').removeClass('d-none');
		$('#btnAttachDataAdd').attr('disabled', true); //추가버튼
		$('#btnAttachDataUpdate').attr('disabled', true); //수정버튼
		$('#btnAttachDataDelete').attr('disabled', true);  //삭제버튼		
		
	});

	//관련 자료 추가하기
	$('#AttachDatabtnSave').on('click', function() {
		var formData = new FormData(document.getElementById("formFile"));

		contentsValue = $('#contents').val();
		
		attachRegDateValue = $('#attachRegDate').val();

		createSeqValue = Number($('#createSeq').val());
		
		formData.append('path', str);
		formData.append('attachCd', equipCd);
		formData.append('attachSeq', document.getElementById("createSeq").value);
		formData.append('attachRegDate', moment(attachRegDateValue).format('YYYY-MM-DD'));
		formData.append('contents', contentsValue);
		formData.append('attachGubun', 'EQ');
		
		$.ajax({
			url : '<c:url value="/bm/equipAttachDataCreate"/>',
			type : 'POST',
			data : formData,
		    processData: false,
            contentType: false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					//$('#equipCodeTable').DataTable().ajax.reload(function() {});
					toastr.success('등록되었습니다.');
					$('#equipAttachTable').DataTable().ajax.reload(function() {
					});
					$('#formBox').removeClass('d-none');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
				$('#equipCodeTable').DataTable().ajax.reload();
				$('#AttachDatabtnSave').addClass('d-none');
				$('#btnAttachDataAdd').attr('disabled', false);
				$('#btnAttachDataUpdate').attr('disabled', false);
				$("#btnAttachDataDelete").attr("disabled", false);
				$("#createValue").remove();
				
			}
		});
	});

	
	function uiProc(flag) {
		$("#equipNm").attr("disabled", flag);
		$("#equipModel").attr("disabled", flag);
		$("#assetCd").attr("disabled", flag);
		$("#admNo").attr("disabled", flag);
		$("#mfcCorpCd").attr("disabled", flag);
		$("#mfcDate").attr("disabled", flag);
		$("#buyAmount").attr("disabled", flag);
		$("#buyDate").attr("disabled", flag);
		$("#supplmtryEquip").attr("disabled", flag);
		$("#acqDate").attr("disabled", flag);
		$("#mainChargr").attr("disabled", flag);
		$("#subChargr").attr("disabled", flag);
		$("#useDepart").attr("disabled", flag);
		$("#usePurpose").attr("disabled", flag);
		$("#equipLocation").attr("disabled", flag);
		$("#equipSpec").attr("disabled", flag);
		$("#equipsize").attr("disabled", flag);
		$("#equipElec").attr("disabled", flag);
		$("#equipDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#noUseDesc").attr("disabled", flag);
		$("#chooseAcqDate").attr("disabled", flag);
		$("#chooseBuyDate").attr("disabled", flag);
		$("#chooseMfcDate").attr("disabled", flag);

		   
	}

	


	
</script>

</body>
</html>

