
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
				<li class="breadcrumb-item active">3정5S 개선대책</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 50%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<div style="height:450px">
						<table id="samJung5STable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="25%">
								<col width="15%">
								<col width="25%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구역</th>
									<th>담당부서</th>
									<th>점검자</th>
									<th>점검일자</th>
									<th>완료자</th>
									<th>완료일자</th>
								</tr>
							</thead>
						</table>
						</div>						
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 49%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-0" style="height: 30px;">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>									
					</div>
					<hr>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mt-2 mb-2">						
								<button type="button"
									class="btn btn-primary d-none float-right d-none mr" id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnDelConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button>
								
		
								<!-- <button class="btn btn-warning float-left mr-10" type="button" id="btnDel">삭제</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
								</button> -->
							</div>
							<form id="form" enctype="multipart/form-data" method="post">
								<div class="table-responsive">
									<table id="itemFaultyDtlTable" class="table table-lg table-bordered mb-2">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>*구역</th>
											<td>
												<input type = "text"class="form-control" style="max-width: 100%" id="areaGubun" name="areaGubun" disabled>
											</td>
											<th>*담당부서</th>
											<td>
												<select class="custom-select" id="admDept" name="admDept" style="max-width:100%"></select>
											</td>
										</tr>
										<tr>
											<th>*점검자</th>
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control" style="max-width: 100%" id="checkNm" name="checkNm" disabled> 
													<input type="text" class="form-control" style="max-width: 100%" id="checkNmText" name="checkNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search" name="checkNm" id="btnCheckNm" onClick="selectadmChargr(1);">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
											<th>*점검일자</th>
											<td>
												<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="faultyRegDate" name="faultyRegDate" maxlength="10" disabled />
													<button	onclick="fnPopUpCalendar(faultyRegDate,faultyRegDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="faultyRegDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>완료자</th>
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control" style="max-width: 100%" id="finishNm" name="finishNm" disabled> 
													<input type="text" class="form-control" style="max-width: 100%" id="finishNmText" name="finishNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search" name="finishNm" id="btnFinishNm" onClick="selectadmChargr(2);">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
											<th>완료일자</th>
											<td>
												<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="faultyFinishRegDate" name="faultyFinishRegDate" maxlength="10" disabled />
													<button	onclick="fnPopUpCalendar(faultyFinishRegDate,faultyFinishRegDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="faultyFinishRegDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3"><textarea class="form-control" rows="2"	id="faultyCause" name="faultyCause"	style="max-width: 100%; resize: none;"></textarea>
											</td>
										</tr>
										<tr>
											<th colspan="2">개선전</th>
											<th colspan="2">개선후</th>
										</tr>
										<tr>
											<td colspan="2">
												<div class="custom-file" style="height: 100%;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>
											<td colspan="2">
												<div class="custom-file" style="height: 100%;">
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
															name="imgAdd1" accept="image/gif, image/jpeg, image/png"> <label id="imgName1"
															class="custom-file-label" for="imgAdd1"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" id="closeBtn1" name="closeBtn"
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
															name="imgAdd2" accept="image/gif, image/jpeg, image/png"> <label id="imgName2"
															class="custom-file-label" for="imgAdd2"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" id="closeBtn2" name="closeBtn"
															onclick="deleteImg(2);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>지적사항</th>
											<td colspan="3">
												<textarea class="form-control" rows="2"	id="faultyCause1" name="faultyCause1"	style="max-width: 100%; resize: none;"></textarea>
											</td>
										</tr>				
										<tr>
											<th>개선사항</th>
											<td colspan="3">
												<textarea class="form-control" rows="2"	id="faultyCause2" name="faultyCause2"	style="max-width: 100%; resize: none;"></textarea>
											</td>
										
										</tr>						
										<tr>
											<th>첨부파일1</th>
											<td colspan="3">
											    <div class="row">
													<div class="custom-file d-none" id="fileSearch" style="width: 90%;">
														<input type="file" class="custom-file-input" id="fileDate1" name="fileDate1" value=""> 
															<label class="custom-file-label" id="fpValue" for="fileDate1">파일을선택해주세요</label>
													</div>
													<div class="rightsidebar-close d-none" id="btnFpFileDel"
														style="width: 10%;">
														<button type="button" class="btn"
															onClick="deleteImg(3)">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag">
													<a href="/bm/downloadFile" id="fpHref"><span id="fpFn"></span></a>
												</div>
											</td>
										</tr>
										<tr>
											<th>첨부파일2</th>
											<td colspan="3">
											    <div class="row">
													<div class="custom-file d-none" id="fileSearch2" style="width: 90%;">
														<input type="file" class="custom-file-input" id="fileDate2" name="fileDate2" value=""> 
															<label class="custom-file-label" id="fpValue2" for="fileDate2">파일을선택해주세요</label>
													</div>
													<div class="rightsidebar-close d-none" id="btnFpFileDel2"
														style="width: 10%;">
														<button type="button" class="btn"
															onClick="deleteImg(4)">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag2">
													<a href="/bm/downloadFile" id="fpHref2"><span id="fpFn2"></span></a>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnAttachDel">삭제</button>
								<button class="btn btn-primary d-none"
									id="btnAttachDelConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAttachAdd">추가</button>
								<button class="btn btn-primary d-none"
									id="btnAttachAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered"
										id="faultyAttachDataTable">
										<colgroup>
											<col width="10%">
											<col width="10%">
											<col width="10%">
											<%-- <col width="33%"> --%>
											<col width="70%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>등록일</th>
												<th>등록자</th>
												<!-- <th>내용</th> -->
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
							<div class="mt-2">				
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

<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "50%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});
	let currentHref = "qmsc0100";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","3정5S 개선대책"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let status = '';
	
	uiProc(true);
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";

	var tableIdx = null;
	var poNo=null;
	var poSeq=null;
	var inSeq=null;
	var itemSeq=null;
	var faultyCnt=null;
	var sourceNoVal=null;
	var attachCdVal=null;
	
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	let checkNm =  "${userNm}";     // 점검자
	let finishNm = "${userNm}";     // 완료자
	let sjCd = ''; // 구분(관리)코드 - 테이블 클릭하여 상세정보 조회시 사용
	//공통코드 처리 시작      
	var admDeptCode = new Array(); // 담당부서명
	<c:forEach items="${admDept}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   
	
	//선택박스 처리
	selectBoxAppend(admDeptCode, "admDept", "", "");
	$('#admDept').val('');
	$("#btnAdd").attr("disabled", false);
	
	// 목록
	let samJung5STable = $('#samJung5STable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 10,
		ajax : {
			url : '<c:url value="qm/samJung5SList"/>',
			type : 'GET',
			data : {
			},
		},
		columns : [ 
			{ data : 'sjArea' },
			{ data : 'sjDept',
				render : function(data, type, row, meta) {
					return admDeptCode[data-1].baseNm;
				}
		    },
			{ data : 'checkChargrName'}, 
			{ data : 'checkDate'  }, 
			{ data : 'compChargrName',
				render : function(data, type, row, meta) {
					if(data == '' || data == null){
						return "-";
					}else{
						return data;
					}
				}
			 }, 
			{ data : 'compDate',
				render : function(data, type, row, meta) {
					if(data == '' || data == null){
						return "-";
					}else{
						return data;
					}
				}
			}, 
		],
		order : [ [ 1, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '3정5S 개선대책'
		}, 'print' 
		],
		columnDefs: [
			{ targets: [] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
	});
	//데이터 클릭 시
	$('#samJung5STable tbody').on('click','tr',function() {
		uiProc(true);
		if ($(this).hasClass('selected')) {
			
			$(this).removeClass('selected');
			$('#btnAdd').attr('disabled', false);
			$('#btnEdit').attr('disabled', true);
			$('#btnDel').attr('disabled', true);
			sideView = 'add';
			sjCd = '';
		} else {
			$('#samJung5STable').DataTable().$('tr.selected').removeClass('selected');

			$(this).addClass('selected');
			$('#btnSave').addClass('d-none');
		
			$('#btnAdd').attr('disabled', false);
			$('#btnEdit').attr('disabled', false);
			$('#btnDel').attr('disabled', false);
			sideView = 'edit';
			sjCd = samJung5STable.row(this).data().sjCd;
		}
		$('#areaGubun').val('');
		$('#admDept').val('');
		$('#checkNm').val('');
		$('#checkNmText').val('');
		$('#faultyRegDate').val('');
		$('#finishNm').val('');
		$('#finishNmText').val('');
		$('#faultyFinishRegDate').val('');
		$('#faultyCause').val('');
		$('#faultyCause1').val('');
		$('#faultyCause2').val('');
		
		$.ajax({
			url : '<c:url value="/qm/samJung5SAdmread"/>',
			type : 'GET',
			data : {
				'sjCd' : function() {return sjCd;},
			},
			success : function(res) {
				var data = res.data;
				if (res.result == 'ok') {
					//상세내용
					$('#areaGubun').val(data.sjArea);
					$('#admDept').val(data.sjDept);
					$('#checkNm').val(data.checkChargr);
					$('#checkNmText').val(data.checkChargrName);
					$('#faultyRegDate').val(data.checkDate);
					$('#finishNm').val(data.compChargr);
					$('#finishNmText').val(data.compChargrName);
					$('#faultyFinishRegDate').val(data.compDate);
					$('#faultyCause').val(data.sjDesc);
					$('#faultyCause1').val(data.errorList);
					$('#faultyCause2').val(data.improvList);
					if (res.image1 != null) {
						$('#imageFile1').attr("src",'data:image/jpg;base64,'+ res.image1);
						$('#imgName1').text(data.imageNm1);
					} else {
						$('#imageFile1').attr("src", " ");
						$('#imgName1').text("파일을 선택해주세요");
					}
					if (res.image2 != null) {
						$('#imageFile2').attr("src",'data:image/jpg;base64,'+ res.image2);
						$('#imgName2').text(data.imageNm2);
					} else {
						$('#imageFile2').attr("src", " ");
						$('#imgName2').text("파일을 선택해주세요");
					}

					$('#fpFn').text(data.fileNm1);
					(data.fileNm1 == null || data.fileNm1 == "")?$('#fpValue').text("파일을 선택해주세요"):$('#fpValue').text(data.fileNm1);
					$('#fpHref').attr('href','qm/downloadFileSamJung5S?sjCd='+ data.sjCd +'&value=1');
					$('#fpFn2').text(data.fileNm2);
					(data.fileNm2 == null || data.fileNm2 == "")?$('#fpValue2').text("파일을 선택해주세요"):$('#fpValue2').text(data.fileNm2);
					$('#fpHref2').attr('href','qm/downloadFileSamJung5S?sjCd='+ data.sjCd +'&value=2');
					
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = "add";
		//화면처리        
		uiProc(false);
		$('#areaGubun').attr('disabled',false);
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnDel').attr('disabled',true);
		$('#btnSave').removeClass('d-none');
		$('#faultyRegDate').val(serverDate);
		$('#admDept').val('001');
		$('#areaGubun').val('');
		$('#checkNm').val('');
		$('#checkNmText').val('');
		$('#finishNm').val('');
		$('#finishNmText').val('');
		$('#faultyFinishRegDate').val('');
		$('#faultyCause').val('');
		$('#faultyCause1').val('');
		$('#faultyCause2').val('');
		$('#imageFile1').attr("src", "");
		$('#imgName1').text("");
		$('#imageFile2').attr("src", "");
		$('#imgName2').text("");
		$('#imgAdd1').val("");
		$('#imgAdd2').val("");

		$('#fpValue').text("파일을 선택해주세요");
		$('#fpHref').attr("href", "");
		$('#fpFn').text('');
		$('#fpValue2').text("파일을 선택해주세요");
		$('#fpHref2').attr("href", "");
		$('#fpFn2').text('');

		$('#fileDate1').val('');
		$('#fileDate2').val('');
	});
	
	//수정버튼
	$('#btnEdit').on('click',function(){
		sideView = "edit";
		uiProc(false);
		
		$('#areaGubun').attr('disabled',false);
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnDel').attr('disabled',true);
		$('#btnSave').removeClass('d-none');
		$('#fpFn').text('');
		$('#fpFn2').text('');

	});

	
	//삭제버튼
	$('#btnDel').on('click',function(){
		$.ajax({
			url : '<c:url value="qm/samJung5SDelete"/>',
			type : 'POST',
			data : {
				'sjCd' : function(){return sjCd;}
			},
			success : function(res){
				toastr.success("삭제되었습니다.");
				$('#samJung5STable').DataTable().ajax.reload();
				$('#btnAdd').attr('disabled',false);
				$('#btnEdit').attr('disabled',true);
				$('#btnDel').attr('disabled',true);
				$('#btnSave').addClass('d-none');
				
				$('#form').each(function() {
					this.reset();
				});

				$('#imageFile1').attr("src", "");
				$('#imgName1').text("");
				$('#imageFile2').attr("src", "");
				$('#imgName2').text("");

				$('#fpHref').attr("href", "");
				$('#fpFn').text('');
				$('#fpHref2').attr("href", "");
				$('#fpFn2').text('');
			}
		});	

	});
	
	// 저장 처리
	$('#btnSave').on('click',function() {
		//입력값 검사
		if($('#areaGubun').val() == ''){
			toastr.warning('구역을 입력해주세요.');
			$('#areaGubun').focus();
			return false;	
		}
		if($('#checkNm').val() == ''){
			toastr.warning('점검자를 선택해주세요.');
			$('#btnCheckNm').focus();
			return false;
		}
		if($('#finishNm').val() != '' && $('#faultyFinishRegDate').val() == ''){
			toastr.warning('완료일자를 선택해주세요.');
			$('#faultyFinishRegDateCalendar').focus();
			return false;
		}
		if($('#faultyFinishRegDate').val() != '' && $('#finishNm').val() == ''){
			toastr.warning('완료자를 선택해주세요.');
			$('#btnFinishNm').focus();
			return false;
		}
		if($('#finishNm').val() != '' && ( $('#faultyFinishRegDate').val().replace(/-/g, "") < $('#faultyRegDate').val().replace(/-/g, "")) ){
			toastr.warning('완료일자는 점김일자보다 늦게 설정 할 수 없습니다.');
			$('#faultyFinishRegDateCalendar').focus();
			return false;
		}

		var formData = new FormData(document.getElementById("form"));
		formData.append('sjArea', $('#areaGubun').val());
		formData.append('sjDept', $('#admDept').val());
		formData.append('checkChargr', $('#checkNm').val());
		formData.append('checkDate', $('#faultyRegDate').val());
		formData.append('compChargr', $('#finishNm').val());
		formData.append('compDate', $('#faultyFinishRegDate').val());
		formData.append('sjDesc', $('#faultyCause').val());
		formData.append('errorList', $('#faultyCause1').val());
		formData.append('improvList', $('#faultyCause2').val()); 
		formData.append('imageStatus1', $('#imgAdd1').val()); 
		formData.append('imageStatus2', $('#imgAdd2').val());
		formData.append('fileStatus1', $('#fileDate1').val()); 
		formData.append('fileStatus2', $('#fileDate2').val());
		
		var url = '<c:url value="/qm/samJung5SAdmCreate"/>';

		if (sideView == "edit") {
			formData.append('sjCd',sjCd);
			url = '<c:url value="/qm/samJung5SAdmUpdate"/>';
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
					$('#samJung5STable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#btnSave').addClass('d-none');

					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
					$('#btnDel').attr('disabled', true);
					$('#fpFn').text(data.fileNm1);
					(data.fileNm1 == null || data.fileNm1 == "")?$('#fpValue').text("파일을 선택해주세요"):$('#fpValue').text(data.fileNm1);
					$('#fpHref').attr('href','qm/downloadFileSamJung5S?sjCd='+ data.sjCd +'&value=1');
					$('#fpFn2').text(data.fileNm2);
					(data.fileNm2 == null || data.fileNm2 == "")?$('#fpValue2').text("파일을 선택해주세요"):$('#fpValue2').text(data.fileNm2);
					$('#fpHref2').attr('href','qm/downloadFileSamJung5S?sjCd='+ data.sjCd +'&value=2');
					
					$('#imageFile1').attr("src",'data:image/jpg;base64,'+ res.image1);
					$('#imageFile2').attr("src",'data:image/jpg;base64,'+ res.image2);
					
					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
		});
	});

	function deleteImg(value) {
		$.ajax({
			url : '<c:url  value="qm/samJung5SAdmImageDelete"/>',
			type : 'GET',
			data : {
				'value' : value,
				'sjCd'  : sjCd,
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
					} else if (value == 3) {
						$('#fpValue').text("파일을 선택해주세요");
						$('#fpHref').attr("src", " ");
						$('#fpFn').val("");
						$('#fileDate1').val('');
					} else if (value == 4) {
						$('#fpValue2').text("파일을 선택해주세요");
						$('#fpHref2').attr("src", " ");
						$('#fpFn2').val("");
						$('#fileDate1').val('');
					}

				} else {
					toastr.error(res.message);
				}
			}
		});
	}
	
	//담당자조회 팝업 시작
	var value2;
	var userPopUpTable;
	function selectadmChargr(value) {
		value2 = value;
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
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				if(value2=="1"){
					$('#checkNm').val(data.userNumber);
					$('#checkNmText').val(data.userNm);
				}else if(value2=="2"){
					$('#finishNm').val(data.userNumber);
					$('#finishNmText').val(data.userNm);
				}
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}
	

	var sysdate = "${serverTime}";

	function uiProc(flag) {
		$('#areaGubun').attr('disabled', flag);
		$('#admDept').attr('disabled', flag);
		$('#btnCheckNm').attr('disabled', flag);
		$('#faultyRegDateCalendar').attr('disabled', flag);
		$('#btnFinishNm').attr('disabled', flag);
		$('#faultyFinishRegDateCalendar').attr('disabled', flag);
		$('#btnAdd').attr('disabled', flag);
		$('#btnEdit').attr('disabled', flag);
		$('#btnDel').attr('disabled', flag);
		
		$('#faultyCause').attr('disabled', flag);
		$('#imgAdd1').attr('disabled', flag);
		$('#imgAdd2').attr('disabled', flag);
		$('#faultyCause1').attr('disabled', flag);
		$('#faultyCause2').attr('disabled', flag);
		$('#closeBtn1').attr('disabled', flag);
		$('#closeBtn2').attr('disabled', flag);
		
		if(flag == true){
			$('#btnSave').addClass('d-none');
			$('#fileSearch').addClass('d-none');
			$('#btnFpFileDel').addClass('d-none');
			$('#fileSearch2').addClass('d-none');
			$('#btnFpFileDel2').addClass('d-none');
		}else{
			$('#btnSave').removeClass('d-none');
			$('#fileSearch').removeClass('d-none');
			$('#btnFpFileDel').removeClass('d-none');
			$('#fileSearch2').removeClass('d-none');
			$('#btnFpFileDel2').removeClass('d-none');
		}
	}

	
</script>

</body>
</html>