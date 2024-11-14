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
	<!-- 설비 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel3" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel3">부대설비 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	         
	                <table id="equipPopUpTable3" class="table table-bordered">
	                	<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="25%">
							<col width="20%">
							<col width="25%">
						</colgroup>
	                    <thead class="thead-light">
	                    <tr>
		                    <th>구분</th>	                          
		                    <th>설비관리번호</th>
		                    <th>설비명</th>	  
		                    <th>설비규격</th>
		                    <th>설비크기 (W*L*H)<br>단위:미터</th>
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
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">설비관리</a></li>
				<li class="breadcrumb-item active">설비수리교체점검이력</li>
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
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipRepairHistAdmTable" class="table table-bordered">
							<colgroup>
								<col width="9%">
								<col width="6%">
								<col width="13%">
								<col width="14%">
								<col width="14%">
								<col width="21%">
								<col width="8%">
								<col width="8%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>발생일자</th>
									<th>구분</th>
									<th>설비관리번호</th>
									<th>설비명</th>
									<th>설비규격</th>
									<th>내역</th>
									<th class="text-center">경과시간(분)</th>
									<th class="text-center">합계비용</th>
									<th>조치자</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 43%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
							<i class="mdi mdi-close"></i>
						</a>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item">
								<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2">관련자료</a>
							</li>
						</ul>
					</div>

					<div class="card-body p-0">
						<div id="myTabContent" class="tab-content">
							<!---------tab1 part--------->
							<div class="tab-pane fade active show" id="tab1">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
									<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
								</div>
								<form id="form" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table table-bordered">
											<colgroup>
												<col width="20%">
												<col width="30%">
												<col width="20%">
												<col width="30%">
											</colgroup>
											<tr>
												<th>*설비관리번호</th>
												<td class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" id="equipCd" name="equipCd">
														<input type="text" class="form-control" style="max-width: 100%" id="equipNo" name="equipNo" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnSelEquipCd" name="btnSelEquipCd"
															onClick="selectEquipCd();">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="equipCdDelete" class="btn closeBtn" 
															onclick="$('#equipCd').val(''); $('#equipNo').val(''); $('#equipNm').val(''); $('#assetCd').val(''); $('#mfcCorpCd').val(''); $('#equipType').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</td>
												<th>설비명</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="equipNm" name="equipNm" disabled>
												</td>
											</tr>
											<tr>
												<th class="d-none">자산코드</th>
												<td class="d-none"><input type="text" class="form-control" id="assetCd" name="assetCd" disabled></td>
												<th>제조사</th>
												<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" disabled></td>
												<th>설비규격</th>
												<td><input type="text" class="form-control" id="equipType" name="equipType" disabled></td>
											</tr>
											<tr>
												<th>수리코드</th>
												<td>
													<input type="text" class="form-control" style="max-width: 100%" id="repairNo" name="repairNo" disabled>
												</td>
												<th>*구분</th>
												<td><select class="custom-select" id="equipGubun" name="equipGubun"></select></td>
											</tr>
											<tr>
												<th class="d-none">관리번호</th>
												<td class="d-none"><input type="text" class="form-control" id="admNo" name="admNo"></td>
												<th>발생일자</th>
												<td>
													<div class="form-group input-sub m-0 row">
														<input class="form-control" type="text" id="troubleDate" name="troubleDate" disabled/>
														<button
															onclick="fnPopUpCalendar(troubleDate,troubleDate,'yyyy-mm-dd')"
															class="btn btn-secondary input-sub-search"
															id="chooseTroubleDate" type="button">
															<span class="oi oi-calendar"></span>
														</button>
													</div>
												</td>
												<th>고장부위</th>
												<td><input type="text" class="form-control" id="troublePart" name="troublePart" disabled></td>
											</tr>
											<tr>
												<th>조치자</th>
												<td><input type="text" class="form-control" id="repairMan" name="repairMan" disabled></td>
												<th>경과시간</th>
												<td style="position: relative;">
													<input type="text" class="form-control" id="changeTime" name="changeTime" value="0" dir="rtl" maxlength = "20"
														style="text-align: right; padding-right: 2rem; min-width:100%;">
													<span style="display: block; position: absolute; top: 5px; right: 10px; height: 1.5rem; line-height: 1.5rem;">분</span>
												</td>
											</tr>
											<tr>
												<th>내역</th>
												<td colspan="3"><input type="text" class="form-control"
													style="max-width: 100%" id="troubleCont" name="troubleCont"></td>
											</tr>
											<tr>
												<th>조사내용</th>
												<td colspan="3"><input type="text" class="form-control"
													style="max-width: 100%" id="troubleCause"
													name="troubleCause"></td>
											</tr>
											<tr>
												<th>수리시작일자</th>
												<td>
													<input class="form-control" type="date" id="repairStartDate" name="repairStartDate" disabled/>
												</td>
												<th>수리시작시간</th>
												<td>
													<input class="form-control" type="time" id="repairStartTime" name="repairStartTime" disabled/>
												</td>
											</tr>
											<tr>
												<th>수리종료일자</th>
												<td>
													<input class="form-control" type="date" id="repairEndDate" name="repairEndDate" disabled/>
												</td>
												<th>수리종료시간</th>
												<td>
													<input class="form-control" type="time" id="repairEndTime" name="repairEndTime" disabled/>
												</td>
											</tr>
											<tr>
												<th>수리업체</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="repairCorpNm" name="repairCorpNm"></td>
												<th>현재상태</th>
												<td><select class="custom-select" id="repairStatus" name="repairStatus"></select></td>
											</tr>
											<tr>
												<th>수리비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="repairCost" value="0" dir="rtl" 
													name="repairCost" onChange="totalCostCal()"></td>
												<th>부품비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="partCost" value="0" dir="rtl" 
													name="partCost" onChange="totalCostCal()"></td>
											</tr>
											<tr>
												<th>합계비용</th>
												<td><input type="text" class="form-control" style="max-width: 100%" id="totalCost" name="totalCost" 
													value="0" dir="rtl" disabled></td>
											</tr>
											<tr>
												<th colspan="2">조치 전</th>
												<th colspan="2">조치 후</th>
											</tr>
											<tr>
												<td colspan="2">
													<div class="custom-file" style="height: 150px;">
														<img alt="등록된 사진이 없습니다." id="beforeImage" name="beforeImage" style="width: 100%; height: 100%" src="">
													</div>
												</td>
												<td colspan="2">
													<div class="custom-file" style="height: 150px;">
														<img alt="등록된 사진이 없습니다." id="afterImage" name="afterImage" style="width: 100%; height: 100%" src="">
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div class="form-group">
														<div class="custom-file" style="width: 90%;">
															<input type="file" class="custom-file-input"
																id="beforeImageFile" onchange="imageThum('before');" name="beforeImageFile" disabled> 
															<label id="beforeImageFileNm" class="custom-file-label" for="beforeImageFile"></label>
														</div>
														<div class="rightsidebar-close" style="width: 10%;">
															<button type="button" class="btn mt-1" name="btnImgDel" onclick="deleteImage('before');" disabled>
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div>

												</td>
												<td colspan="2">
													<div class="form-group">
														<div class="custom-file" style="width: 90%;">
															<input type="file" class="custom-file-input" 
																id="afterImageFile" onchange="imageThum('after');" name="afterImageFile" disabled> 
															<label id="afterImageFileNm" class="custom-file-label" for="afterImageFile"></label>
														</div>
														<div class="rightsidebar-close" style="width: 10%;">
															<button type="button" class="btn mt-1" name="btnImgDel" onclick="deleteImage('after');" disabled>
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
							<!--====start====tab2 part=====-->
							<div class="tab-pane fade" id="tab2">
								<div class="card-body col-sm-12 p-1 mb-2">
									<button type="button" class="btn btn-warning float-right mr-1" id="btnAttachDel">삭제</button>
									<button class="btn btn-primary d-none" id="btnAttachDelConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachAdd">추가</button>
									<button class="btn btn-primary d-none" id="btnAttachAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
									</button>
								</div>
								<form id="form2" enctype="multipart/form-data">
									<div class="table-responsive">
										<table class="table table-bordered" id="equipRepairAttachTable">
											<colgroup>
												<col width="1%">
												<col width="4%">
												<col width="4%">
												<col width="7%">
												<col width="10%">
											</colgroup>
											<thead>
												<tr>
													<th>No.</th>
													<th>일자</th>
													<th>등록자</th>
													<th>내용</th>
													<th>첨부파일</th>
												</tr>
											</thead>
										</table>
									</div>
								</form>
								<div class="mt-2">
									<button type="button" class="btn btn-primary d-none float-right" id="btnAttachSave">저장</button>
									<button class="btn btn-primary d-none" id="btnAttachSaveConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>처리중
									</button>
								</div>
							</div>
							<!--====end====tab2 part=====-->
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

<%@include file="../layout/bottom.jsp"%>

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

	let currentHref = "emsc0040";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비수리교체점검이력");
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	var attachSeq;
	var equipNo;
    var change = 0;
    var afterChange = 0;
    var beforeChange = 0;
    var imgDelete = 0;
    var deleteChange = 0;
	var preInWhsDateToCal =  "${serverDateFrom}";
// 	var preInWhsDateToCal2 = "${serverDateTo2}";
	var repairGubun = 'EQ';
	var userNm = "${userNm}";
	var tempNum = '';
	var equipGubunVal = '';

	var str = "${serverDateTo}".substring(0,7).replace(/-/g,"");

	uiProc(true);
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	//공통코드 처리 시작      
	var repairStatusCode = new Array(); 
	<c:forEach items="${repairStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	repairStatusCode.push(json);
	</c:forEach>
	
	var equipGubunCode = new Array(); 
	<c:forEach items="${equipGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(repairStatusCode, "repairStatus", "", "2");
	selectBoxAppend(equipGubunCode, "equipGubun", "", "2");

	//일시 처리
	$('#troubleDate').val(preInWhsDateToCal);
// 	$('#repairStartDate').val(preInWhsDateToCal);
// 	$('#repairEndDate').val(preInWhsDateToCal);

	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
	         this.reset();
	         $('input[type=hidden]').val('');
	    });
		$('#equipRepairHistAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		sideView = 'add';
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#beforeImageFile').val(null);
		$('#beforeImage').attr("src", null);
		$('#beforeImageFileNm').text(null);
		$('#afterImageFile').val(null);
		$('#afterImage').attr("src", null);
		$('#afterImageFileNm').text(null)
	});
	
	// 목록
	let equipRepairHistAdmTable = $('#equipRepairHistAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/em/equipRepairHistAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return '001'},
				'equipGubun' : function(){return equipGubunVal},
			},
		},
		columns : [
			{
				data : 'troubleDate',
				render : function(data, type, row){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				}
			},
			{
				data : 'equipGubunNm',
				'className' : 'text-center'
			},
			{
				data : 'equipNo',
				'className' : 'text-center'
			},
			{
				data : 'equipNm',
				'className' : 'text-center'
			},
			{
				data : 'equipType',
				'className' : 'text-center'
			},
			{
				data : 'troubleCont',
				'className' : 'text-center'
			},
			{
				data: 'changeTime',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, 
				"className": "text-center" 	
			},
			{
				data: 'totalCost',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, 
				"className": "text-right" 	
			},
			{
				data : 'repairMan',
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '설비/교체수리점검이력'
		}, 'print' ],
	});

	
	// 보기
	$('#equipRepairHistAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		} 

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#equipRepairHistAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		repairNo = equipRepairHistAdmTable.row(this).data().repairNo;
		
		$('#attach').removeClass('disabled');
		$('#formBox').removeClass('d-none');
		$('#btnImage').addClass('d-none');
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnAdd').removeClass('d-none'); // 추가버튼
		$('#btnEdit').removeClass('d-none'); // 삭제버튼
		
		uiProc(true);
		$("#tab2Nav").removeClass('disabled');
		
		$('#equipRepairAttachTable').DataTable().ajax.reload();
		
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmRead"/>',
			type : 'GET',
			data : {
				'repairNo' : repairNo 
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				console.log(data.equipNm)
				if(res.result == "ok"){
					$('#repairNo').val(data.repairNo);
					$('#repairMan').val(data.repairMan);
					$('#equipCd').val(data.equipCd);
					$('#equipNo').val(data.equipNo);
					$('#equipNm').val(data.equipNm);
					$('#assetCd').val(data.assetCd);
					$('#mfcCorpCd').val(data.mfcCorpCd);
					$('#equipType').val(data.equipType);
					$('#admNo').val(data.admNo);
					$('#troubleDate').val(data.troubleDate == "" ? "" : moment(data.troubleDate).format('YYYY-MM-DD'));
					$('#troublePart').val(data.troublePart);
					$('#troubleCont').val(data.troubleCont);
					$('#troubleCause').val(data.troubleCause);
					$('#changeTime').val(data.changeTime != null ? addCommas(data.changeTime) : '0');
					$('#repairStartDate').val(moment(data.repairStartDate.substr(0,8)).format('YYYY-MM-DD'));
					$('#repairEndDate').val(moment(data.repairEndDate.substr(0,8)).format('YYYY-MM-DD'));
					$('#repairStartTime').val(data.repairStartDate.substr(8,2) + ":" + data.repairStartDate.substr(10,2));
					$('#repairEndTime').val(data.repairEndDate.substr(8,2) + ":" + data.repairEndDate.substr(10,2));
					$('#repairCorpNm').val(data.repairCorpNm);
					$('#repairCost').val(data.repairCost != null ? addCommas(data.repairCost) : '0');
					$('#partCost').val(data.partCost != null ? addCommas(data.partCost) : '0');
					$('#totalCost').val(data.totalCost != null ? addCommas(data.totalCost) : '0');
					
					//셀렉트박스 불러오기
					selectBoxAppend(repairStatusCode, "repairStatus", data.repairStatus, "2");
					selectBoxAppend(equipGubunCode, "equipGubun", data.equipGubun, "");
					
					//이미지 불러오기
					$('#beforeImage').attr("src","");
					$('#afterImage').attr("src","");
					imgShow();
				}
			}
		});
		
	});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
			$("input[type=hidden]").val('');
		});
		$('#equipRepairHistAdmTable').DataTable().$('tr.selected').removeClass('selected');
		$('#btnImage').removeClass('d-none');

		//시퀀스값 가져오기
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmSeq"/>',
			type : 'POST',
			data : {},
			success : function(res){
				if(res.result == "ok"){
					$('#repairNo').val(res.data);					
				}
			}
		});

		//선택박스 처리
		selectBoxAppend(repairStatusCode, "repairStatus", "", "2");
		selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
		
		//일시 처리
		$('#troubleDate').val(preInWhsDateToCal);
// 		$('#repairStartDate').val(preInWhsDateToCal);
// 		$('#repairEndDate').val(preInWhsDateToCal);
		$('#beforeImageFile').attr('disabled',false);
		$('#afterImageFile').attr('disabled',false);
		$('#afterImage').attr("src", "");
		$('#beforeImage').attr("src", "");
		$('#beforeImageFileNm').text("");
		$('#afterImageFileNm').text("");
		$('#beforeImageFile').val("");
		$('#afterImageFile').val("");
		$('button[name=btnImgDel]').attr('disabled',false);
		
		//화면처리        
		uiProc(false);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
	});


	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요.");
			return false;
		}
		uiProc(false);
		
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#beforeImageFile').attr('disabled',false);
		$('#afterImageFile').attr('disabled',false);
		$('#repairNo').attr('disabled', true);
		$('#btnImage').removeClass('d-none');
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('button[name=btnImgDel]').attr('disabled',false);
		totalCostCal();
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		$.ajax({
			url : '<c:url value="em/equipRepairHistAdmDelete"/>',
			type : 'POST',
			data :{
				'repairNo' : function(){return repairNo;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#equipRepairHistAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});

	
	// 저장 처리
	$('#btnSave').on('click', function() {
		
		//입력값 검사
		if (!$.trim($('#equipGubun').val())) {
			toastr.warning('구분을 입력해 주세요.');
			$('#equipGubun').focus();
			return false;
		}
		
		if (!$.trim($('#equipCd').val())) {
			toastr.warning('설비관리번호를 입력해 주세요.');
			$('#btnSelEquipCd').focus();
			return false;
		}
		
		if ($('#repairCost').val().replace(/,/g, '').length > 10) {
			toastr.warning('수리비용이 너무 큽니다. (백 억 미만으로 입력해주세요.)');
			$('#repairCost').val(0);
			totalCostCal();
			$('#repairCost').focus();
			return false;
		}
		
		if ($('#partCost').val().replace(/,/g, '').length > 10) {
			toastr.warning('부품비용이 너무 큽니다. (백 억 미만으로 입력해주세요.)');
			$('#partCost').val(0);
			totalCostCal();
			$('#partCost').focus();
			return false;
		}
		
		var url = '<c:url value="/em/equipRepairHistAdmCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/em/equipRepairHistAdmUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'repairNo'            	: 	$('#repairNo').val(),
				'repairMan'           	: 	$('#repairMan').val(),
				'equipCd'            	: 	$('#equipCd').val(),
				'admNo'            		: 	$('#admNo').val(),
				'troubleDate'           : 	$('#troubleDate').val().replace(/-/g,''),
				'troublePart'           : 	$('#troublePart').val(),
				'troubleCont'           : 	$('#troubleCont').val(),
				'troubleCause'          : 	$('#troubleCause').val(),
				'equipGubun'          	: 	$('#equipGubun').val(),
				'changeTime'          	: 	$('#changeTime').val().replace(/,/g, ''),
				'repairStartDate'       : 	$('#repairStartDate').val().replace(/-/g,'') + $('#repairStartTime').val().replace(/:/g, ''),
				'repairEndDate'         : 	$('#repairEndDate').val().replace(/-/g,'') + $('#repairEndTime').val().replace(/:/g, ''),
				'repairCorpNm'          : 	$('#repairCorpNm').val(),
				'repairStatus'          : 	$('#repairStatus').val(),
				'repairCost'            : 	$('#repairCost').val().replace(/,/g, ''),
				'partCost'            	: 	$('#partCost').val().replace(/,/g, ''),
				'totalCost'            	: 	$('#totalCost').val().replace(/,/g, ''),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					//이미지 업로드
					imgUpload();
					
					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					sideView = 'add';
				} else {
					toastr.error(res.message);
				}
				$('#equipRepairHistAdmTable').DataTable().ajax.reload(function() {});
			},
			complete : function() {
				$('#equipRepairHistAdmTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('button[name=btnImgDel]').attr('disabled',true);

				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnDel').attr('disabled', false);
			}
		});

	});
	
	//이미지 조회
	function imgShow() {
		$.ajax({
			url : '<c:url value="/em/equipRepairHistAdmImgRead"/>',
			data : {
				'repairNo'	:	function() {return repairNo;}
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				
				if (data.beforeImageFile != null) {
					$('#beforeImage').attr("src", "data:image/jpg;base64," + data.beforeImageFile);
					$('#beforeImageFileNm').text(data.beforeImageFileNm);
				} else {
					$('#beforeImage').attr("src", " ");
					$('#beforeImageFileNm').text("");
				}
				
				if (data.afterImageFile != null) {
					$('#afterImage').attr("src", "data:image/jpg;base64," + data.afterImageFile);
					$('#afterImageFileNm').text(data.afterImageFileNm);
				} else {
					$('#afterImage').attr("src", " ");
					$('#afterImageFileNm').text("");
				}
			},
			error : function(xhr, textStatus, error) {
			}
		});
	}
	
	//이미지 썸네일 보여주기
	function imageThum(value) {
		if(value == "before") {
			var reader = new FileReader(); 
			reader.onload = function(event) {
				$('#beforeImage').attr("src", event.target.result);
				console.log("set before on");
			}; 
			reader.readAsDataURL(event.target.files[0]);
			beforeChange = 1;
		}
		else if(value == "after") {
			var reader = new FileReader(); 
			reader.onload = function(event) {
				$('#afterImage').attr("src", event.target.result);
				console.log("set after on");
			}; 
			reader.readAsDataURL(event.target.files[0]);
			afterChange = 2;
		}
	}
	
	//이미지 저장
	function imgUpload() {
		if(afterChange != 0 || beforeChange != 0) {
			var formData = new FormData(document.getElementById("form"));
			formData.append("repairNo", $('#repairNo').val());
			formData.append("status", sideView);
			formData.append("change", afterChange + beforeChange);
			for (var pair of formData.entries()) {
				console.log(pair[0]+ ', ' + pair[1]); 
			}
			$.ajax({
				url : '<c:url value="/em/equipRepairHistAdmImgUpload"/>',
				data : formData,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(res) {
					beforeChange = 0;
					afterChange = 0;
					if (res.result == "ok") { //응답결과
					} else {
					}
				},
				error : function(xhr, textStatus, error) {
					console.log("textStatus: " + xhr.status + ", error: " + error);
				}
			});
		}
	}
	
	//이미지 삭제 (View)
	function deleteImage(value) {
		if(value =="before") {
			$('#beforeImageFile').val(null);
			$('#beforeImage').attr("src", null);
			$('#beforeImageFileNm').text(null);
			beforeChange = 1;
		}
		else {
			$('#afterImageFile').val(null);
			$('#afterImage').attr("src", null);
			$('#afterImageFileNm').text(null)
			afterChange = 2;
		}
	}
	
	//설비명 팝업 시작
   	var equipPopUpTable3;
   	function selectEquipCd() {
		if(equipPopUpTable3 == null || equipPopUpTable3 == undefined)	{
			equipPopUpTable3 = $('#equipPopUpTable3').DataTable({
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
					url : '<c:url value="bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){return '001'},
					},
				},
				rowId : 'equipCd',
				columns : [
					{
						data : 'equipGubunNm'
					}, 
					{
						data : 'equipNo'
					}, 
					{
						data : 'equipNm'
					}, 
					{
						data : 'equipType'
					},
					{
						data : 'equipWidth',
						render : function(data, type, row, meta) {
							if(data != null){
								return data;
							} else {
								return '-';
							}
							
						}
					},
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

		    $('#equipPopUpTable3 tbody').on('click', 'tr', function () {
		    	var data = equipPopUpTable3.row( this ).data();
		    	$('#equipCd').val(data.equipCd);
		    	$('#equipNo').val(data.equipNo);
				$('#equipNm').val(data.equipNm);
				$('#assetCd').val(data.assetCd);
				$('#mfcCorpCd').val(data.mfcCorpCd);
				$('#equipType').val(data.equipType);

                $('#equipPopUpModal3').modal('hide');

				});
		}else{
			$('#equipPopUpTable3').DataTable().ajax.reload(function() {});
		}
		$('#equipPopUpModal3').modal('show');
   	}

 	
	function uiProc(flag) {
		$("#repairMan").attr("disabled", flag);
		$("#troubleCd").attr("disabled", flag);
		$("#troublePart").attr("disabled", flag);
		$("#troubleCont").attr("disabled", flag);
		$("#troubleCause").attr("disabled", flag);
		$("#equipGubun").attr("disabled", flag);
		$("#changeTime").attr("disabled", flag);
		$("#repairCorpNm").attr("disabled", flag);
		$("#repairStatus").attr("disabled", flag);
		$("#imgAdd1").attr("disabled", flag);
		$("#imgAdd2").attr("disabled", flag);
		$("#equipCdDelete").attr("disabled", flag);
		$("#repairEndTime").attr("disabled", flag);
		$("#repairEndDate").attr("disabled", flag);
		$("#repairStartTime").attr("disabled", flag);
		$("#repairStartDate").attr("disabled", flag);
		
		$("#btnSelEquipNm").attr("disabled", flag);
		$("#chooseTroubleDate").attr("disabled", flag);
		$("#chooseRepairStartDate").attr("disabled", flag);
		$("#chooseRepairEndDate").attr("disabled", flag);

		$('#beforeImageFile').attr('disabled',flag);
		$('#afterImageFile').attr('disabled',flag);
		$('#admNo').attr('disabled',flag);
		$('#repairCost').attr('disabled',flag);
		$('#partCost').attr('disabled',flag);
		$('#btnSelEquipCd').attr('disabled',flag);
		$('input[name=beforeImageFile]').attr('disabled',flag);
		$('button[name=btnImgDel]').attr('disabled',flag);
	}

	//기본정보 탭
	$('#tab1Nav').on('click',function(){
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#btnSave').addClass('d-none');
	});
	
	//숫자 콤마생성
	$(document).on('keyup', "#repairCost, #partCost, #totalCost, #changeTime",  function(evt) { //입력시 콤마 추가
		var costSum = 0;
		if ($(this).val() == "") {
			$(this).val("0");
			$(this).select();
		}
		//입력 정규식 0~9 .
		reg = /[^0-9.]/gi;
		let poQty = $(this).val().replace(/,/g, '');
		if (reg.test(poQty)) {
			poQty = poQty.replace(reg, '');
			$(this).val(addCommas(poQty));
			return false;
		}
		$(this).val(addCommas(poQty));

	});
	
	function totalCostCal() {
		var totalCostVal = 0;
		totalCostVal = Number($('#repairCost').val().replace(/,/g, '')) + Number($('#partCost').val().replace(/,/g, ''));
		$('#totalCost').val(addCommas(totalCostVal));
	}
	
	//관련자료 탭 클릭시
	$('#tab2Nav').on('click', function() {
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		
		$('#equipRepairAttachTable').DataTable().ajax.reload();
	});
	
	//관련자료 목록
	let equipRepairAttachTable = $('#equipRepairAttachTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 10,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			data : {
				'attachCd' : function(){return repairNo;},
				'attachGubun' : function(){return 'ER';},
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						tempNum = meta.row + meta.settings._iDisplayStart + 1;
						return tempNum;
					},
					'className' : 'text-center'
				},
				{
					data : 'regDate',
					render : function(data, type, row, meta) {
						if (data != null) {
							data = moment(data).format('YYYY-MM-DD')
							return '<input type="text" class="form-control" style="text-align:center" name="regDate" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="regDate" value="'+preInWhsDateToCal+'" disabled/>';
						}
					}
				},
				{
					data : 'regNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center" name="regNm" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="regNm" value="'+userNm+'" disabled/>';
						}
					}
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="" />';
						}
					}
				},
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+repairNo+'&attachGubun=ER">'+data+'</a>';
							return html;
						} else {
							var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
							html += '<input type="file" class="custom-file-input" id="fileErNm'+tempNum+'" name="fileNm">';
							html += '<label class="custom-file-label" for="fileErNm'+tempNum+'"></label>';
							html += '</div></form>';
							return html;
						}
					}
				},
			],
		order : [ [ 0, 'asc' ], ],
		drawCallback: function(settings) {
        }, 
	});
	
	//관련자료 데이터 클릭 시
	$('#equipRepairAttachTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
		} else {
			$('#equipRepairAttachTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#equipRepairAttachTable').DataTable().row(this).index();
		attachSeq = equipRepairAttachTable.row(tableIdx).data().attachSeq;
		btnView = "edit";
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
		$('#equipRepairAttachTable').DataTable().row.add({}).draw(false);
		
		if (equipRepairAttachTable.data().count() > 0) {
			$('#btnAttachSave').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnAttachAdd').attr('disabled', true);
		$('#btnAttachDel').attr('disabled', true);
		
		btnView = '';
	});
	
	//관련자료 삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(attachSeq != undefined && attachSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'ER';},
					'attachCd' : function(){return repairNo;},
					'attachSeq' : function(){return attachSeq;},
				},
				success  : function(res){
					$('#equipRepairAttachTable').DataTable().ajax.reload();
					
					toastr.success("삭제되었습니다.");
					
				}
			});
		} else {
			$('#equipRepairAttachTable').DataTable().rows(tableIdx).remove().draw();
			toastr.success("삭제되었습니다.");
		}
		
		btnView = '';

	});
	
	// 관련자료 저장
	$('#btnAttachSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipRepairAttachTable tbody tr').each(function(index, item) {
			index++;
			
			if ($(this).find("td input[name=fileNm]").val() == "") {
				toastr.warning('파일을 선택해 주세요.');
				$(this).find("td input[name=fileNm]").focus();
				check = false;
				return false;
			}
			
			if($(this).find("td input[name=fileNm]").val() == undefined){
				
			} else {
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'ER',
						'attachCd' : function(){return repairNo;}
					},
					success : function(res) {
						attachSeq = res.seq;
					}
				});

				formData.append('path', fileDate);
				formData.append('attachCd', repairNo);
				formData.append('attachSeq', attachSeq);
				formData.append('contents', $(this).find("td input[name=contents]").val());
				formData.append('attachGubun', 'ER');
				formData.append('idCheck', 'ER');
				
				
				$.ajax({
					url : '<c:url value="/bm/attachDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success('등록되었습니다.');
						} else if (res.result == 'error') {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#equipRepairAttachTable').DataTable().ajax.reload();
						$('#btnAttachSave').addClass('d-none');
						$('#btnAttachAdd').attr('disabled', false);
						$('#btnAttachDel').attr('disabled', false);
						btnView = "";
					}
				});
			}
			
		});
		
	});
	
	//자재(일자)
	var html1 = '<div class="row">';
		html1 += '<label class="input-label-sm">구분</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<select id="equipGubunList" name="equipGubunList" class="custom-select" onChange="equipGubunListOnchange()">';
		html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	    html1 += '</div>';
    
   
	$('#equipRepairHistAdmTable_length').html(html1);
	
	selectBoxAppend(equipGubunCode, "equipGubunList", "", "1");
	
	function equipGubunListOnchange(){
		equipGubunVal = $("#equipGubunList option:selected").val();
		$("#equipGubun").val(equipGubunVal).prop("selected", true);
		
		$('#equipRepairHistAdmTable').DataTable().ajax.reload();
	}
	
			
</script>

</body>
</html>
