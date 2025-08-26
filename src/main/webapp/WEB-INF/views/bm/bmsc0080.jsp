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
				<li class="breadcrumb-item active">예비품등록</li>
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
						<table id="sparePartsAdmTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>설비명</th>
									<th>예비품명</th>
									<th>예방주기</th>
									<th>수량</th>
									<th>비고</th>
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
						</ul>
						<!-- /.nav-tabs -->
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
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
											<th>설비명</th>
											<td>
												<div class="input-sub m-0">
													<input type="hidden" class="form-control" id="equipCd"
														name="equipCd"> <input type="text"
														class="form-control" id="equipNm" name="equipNm" disabled>
													<button type="button"
														class="btn btn-primary input-sub-search" id="btnEquipCd"
														onClick="selectEquipCd()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
											<th>예비품명</th>
											<td><input type="text" class="form-control" id="spNm"
												name="spNm" disabled></td>
										</tr>
										<tr>
											<th>에방주기</th>
											<td><select class="custom-select" id="spCycle"></select></td>
											<th>수량</th>
											<td><input type="text" class="form-control" id="spCnt"
												name="spCnt" style="text-align: right;"></td>
										</tr>
										<tr>
											<th>부서명</th>
											<td><select class="custom-select" id="admDept"
												name="admDept"></select></td>
											<th>담당자</th>
											<td><select class="custom-select" id="mainChargr"
												name="mainChargr"></select></td>
										</tr>
										<tr>
											<th>사용여부</th>
											<td><select class="custom-select" id="useYn"
												name="useYn"></select></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3"><input type="text" class="form-control"
												id="spDesc" name="spDesc" style="max-width: 100%"></td>
										</tr>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button" class="btn btn-primary float-right d-none"
									id="btnSave">저장</button>
							</div>
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
														<button type="button" class="btn" onclick="deleteImg(1);">
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
														<button type="button" class="btn" onclick="deleteImg(2);">
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
														<button type="button" class="btn" onclick="deleteImg(3);">
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
														<button type="button" class="btn" onclick="deleteImg(4);">
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
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right mr-3"
									id="btnAttachDataDelete">삭제</button>
								<button class="btn btn-warning d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAttachDataAdd">추가</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
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
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
									</table>
								</form>
								<div class="mt-2">
									<button type="button"
										class="btn btn-primary d-none float-right"
										id="AttachDatabtnSave">저장</button>
								</div>
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
</div>
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

	let menuAuth = 'bmsc0080';
	let currentHref = "bmsc0080";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","예비품등록"); 
	let viewIdx;
	let sideView = 'add';
	
	var serverDate =  "${serverDateTo}";
	var spCd=null;

	uiProc(true);

	//공통코드 처리 시작  
	var admDeptCode = new Array();
	<c:forEach items="${admDept}" var="info">	//부서
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var mainChargrCode = new Array();
	<c:forEach items="${mainChargr}" var="info">	//담당
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainChargrCode.push(json);
	</c:forEach>

	var spCycleCode = new Array();
	<c:forEach items="${spCycle}" var="info">	//담당
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	spCycleCode.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">	//사용여부
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	//선택박스 처리
	selectBoxAppend(admDeptCode, "admDept", "", "2");
	selectBoxAppend(mainChargrCode, "mainChargr", "", "2");	
	selectBoxAppend(spCycleCode, "spCycle", "", "2");	
	selectBoxAppend(useYnCode, "useYn", "", "");
	
	//파일 저장 시간 가져오기
	var now=new Date();
	var year=now.getFullYear();
	var mon=now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var str=year+""+mon;
	
	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
	         this.reset();
	      });
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled',false);
	});
	
	$('#btnSave').addClass('d-none');
	$("#dealCorpNm").attr("disabled", true);


	// 목록
	let sparePartsAdmTable = $('#sparePartsAdmTable').DataTable({
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
			url : '<c:url value="bm/sparePartsAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId : 'equipCd',
		columns : [ {
			data : 'equipNm'
		}, {
			data : 'spNm'
		}, {
			data : 'spCycleNm'
		}, {
			data : 'spCnt',
			render : function(data, type, row ,meta){
				return addCommas(data);
			}
		}, {
			data : 'spDesc'
		}, ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '계측기관리'
		}, 'print' ]
	});

	
	// 예비품 기본정보 보기
	$('#sparePartsAdmTable tbody').on('click', 'tr',function() {
		$('#tab1Nav').tab('show');
		
		if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			
		} else {
			$('#sparePartsAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		//화면처리
		uiProc(true);
		$("#tab2Nav").removeClass('disabled');
	
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼

		spCd = sparePartsAdmTable.row(this).data().spCd;
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/sparePartsAdmRead"/>',
			type : 'GET',
			data : {
				'spCd' : function(){ return spCd;}
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				
				$('#equipNm').val(data.equipNm);
				$('#spNm').val(data.spNm);
				$('#spCycle').val(data.spCycle);
				$('#spCnt').val(addCommas(data.spCnt));
				$('#admDept').val(data.admDept);
				$('#mainChargr').val(data.mainChargr);
				$('#spDesc').val(data.spDesc);
				$('#useYn').val(data.useYn);
				//imgPrint();
			}
		});
	});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		
		$('#form').each(function() {
			this.reset();
		});
		
		//화면처리        
		uiProc(false);
		$("#tab2Nav").addClass('disabled');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#corrDate').val(serverDate);
	});


	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요!");
			return false;
		}
		
		//화면처리        
		uiProc(false);
		$("#tab2Nav").addClass('disabled');
		$('#btnSave').removeClass('d-none'); // 등록버튼

	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#equipNm').val())) {
			toastr.warning('설비명을 입력해주세요.');
			$('#equipNm').focus();
			return false;
		}
		
		if (!$.trim($('#spNm').val())) {
			toastr.warning('예비품명을 입력해주세요.');
			$('#spNm').focus();
			return false;
		}

		if (!$.trim($('#spCycle').val())) {
			toastr.warning('예방주기를 입력해주세요.');
			$('#spCycle').focus();
			return false;
		}

		if (!$.trim($('#spCnt').val())) {
			toastr.warning('수량을 입력해주세요.');
			$('#spCnt').focus();
			return false;
		}
		
		if (!$.trim($('#admDept').val())) {
			toastr.warning('부서명을 선택해주세요.');
			$('#admDept').focus();
			return false;
		}
				
		var url = '<c:url value="/bm/sparePartsAdmCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/bm/sparePartsAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'spCd'			:  		spCd,
				'equipCd'		:  		$('#equipCd').val(),
				'spNm' 			: 		$('#spNm').val(),
				'spCycle' 		: 		$('#spCycle').val(),
				'spCnt' 		: 		$('#spCnt').val().replace(/,/g,''),
				'admDept' 		: 		$('#admDept').val(),
				'mainChargr' 	: 		$('#mainChargr').val(),
				'spDesc' 		: 		$('#spDesc').val(),
				'useYn' 		: 		$('#useYn').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#sparePartsAdmTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					$('#mitNm').attr('readonly',false);
					$('#mfcCorpNm').attr('readonly',false);
					$('#spCnt').attr('readonly',false);
					$('#chooseAcqDate').attr('disabled',false);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}

					$("#tab2Nav").removeClass('disabled');
					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#sparePartsAdmTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
	});

	//이미지 Event
	$('#tab2Nav').on('click', function() {
		imgPrint();
	});

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/sparePartsImgRead"/>',
			data : {
				'spCd' : spCd
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

		formData.append("spCd", spCd);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.

		$.ajax({
			url : '<c:url value="/bm/sparePartsImageUpload"/>',
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
			url : '<c:url value="/bm/sparePartsImageDelete"/>',
			type : 'POST',
			data : {
				'spCd' : spCd,
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
	
	//설비명 팝업 시작
   	var equipPopUpTable;
   	function selectEquipCd()
   	{	   	
		if(equipPopUpTable == null || equipPopUpTable == undefined)	{
			equipPopUpTable = $('#equipPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange: false,
		        pageLength: 20,
				ajax : {
					url : '<c:url value="bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'equipCd',
				columns : [{
					data : 'equipCd'
				},{
					data : 'equipNm'
				}, {
					data : 'equipGubunNm'
				}, {
					data : 'equipType'
				}, {
					data : 'admNo'
				}, {
					data : 'mainChargr'
				}
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

		    $('#equipPopUpTable tbody').on('click', 'tr', function () {
		    	var data = equipPopUpTable.row( this ).data();
		    	$('#equipNm').val(data.equipNm);
				$('#equipCd').val(data.equipCd);
				
                $('#equipPopUpModal').modal('hide');
	
				});
		}else{
			$('#equipPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#equipPopUpModal').modal('show');		
   	} 

    //수량 계산
	$('#spCnt').on('keyup',function(){
		var spCntValue = uncomma($(this).val());
		$('#spCnt').val(addCommas(spCntValue));
	});
	
	

	function uiProc(flag) {
		$("#btnEquipCd").attr("disabled", flag);
		$("#spNm").attr("disabled", flag);
		$("#spCycle").attr("disabled", flag);
		$("#spCnt").attr("disabled", flag);
		$("#admDept").attr("disabled", flag);
		$("#mainChargr").attr("disabled", flag);
		$("#spDesc").attr("disabled", flag);
		$('#corrDateCalendar').attr('disabled',flag);
		$("#useYn").attr("disabled", flag);
	}
</script>

	</body>
	</html>