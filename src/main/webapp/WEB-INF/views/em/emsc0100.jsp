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
	<!-- 통합자료실 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="fileReferencePopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipRestartPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 1200px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipRestartPopUpLabel">설비 재가동 기준서 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="fileReferencePopUpTable" class="table table-bordered">
	                   		<colgroup>
								<col width="1%">
								<col width="3%">
								<col width="3%">
								<col width="2%">
								<col width="10%">
								<col width="2%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th style="padding:0.35rem !important;">담당자</th>
									<th>부서명</th>
									<th style="padding:0.35rem !important;">첨부일자</th>
									<th>파일명</th>
									<th>파일종류</th>
									<th style="padding:0.35rem !important;">비고</th>
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
	<!-- 통합자료실 모달 종료-->
	<!------------모달full 사진 screen------------>
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close">       </span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!------------/사진 모달------------>
	<!-- 설비 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel">부대설비 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	         
	                <table id="equipPopUpTable" class="table table-bordered">
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
	<!-- 설비 모달 종료-->
	<!-- 수리이력 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="repairHistPopUpModal" tabindex="-1" role="dialog" aria-labelledby="repairHistPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	        	<div class="modal-header">
	           		<h5 class="modal-title" id="repairHistPopUpLabel">수리이력관리 정보</h5>
	           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	             		<span aria-hidden="true">&times;</span>
	           		</button>
	         	</div> 
	         	<div class="modal-body">
	            	<div class="card-body col-sm-12 p-1">
						<button type="button" class="btn btn-primary float-right d-none" id="btnRepairSave">저장</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnRepairDel">삭제</button>
	            		<button type="button" class="btn btn-primary float-right mr-1" id="btnRepairEdit">수정</button>
					</div>
					<form id="repairForm" enctype="multipart/form-data">
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>수리코드</th>
									<td>
										<input type="text" class="form-control" style="max-width: 100%" id="repairNo" name="repairNo" disabled>
									</td>
									<th>수리자</th>
									<td><input type="text" class="form-control" id="repairMan" name="repairMan" style="max-width: 100%" disabled></td>
								</tr>
								<tr>
									<th>*설비관리번호</th>
									<td>
										<input type="hidden" id="equipCd" name="equipCd">
										<input type="text" class="form-control" style="max-width: 100%" id="equipRepairNo" name="equipRepairNo" disabled>
									</td>
									<th>설비명</th>
									<td>
										<input type="text" class="form-control" style="max-width: 100%" id="repairEquipNm" name="repairEquipNm" disabled>
									</td>
								</tr>
								<tr>
									<th>자산코드</th>
									<td><input type="text" class="form-control" id="repairAssetCd" name="repairAssetCd" style="max-width: 100%" disabled></td>
									<th>제작사</th>
									<td><input type="text" class="form-control" id="repairMfcCorpCd" name="repairMfcCorpCd" style="max-width: 100%" disabled></td>
								</tr>
								<tr>
									<th>고장부위</th>
									<td><input type="text" class="form-control" id="troublePart" name="troublePart" style="max-width: 100%" disabled></td>
									<th>고장일시</th>
									<td>
										<input class="form-control" type="date" id="troubleDate" name="troubleDate" style="max-width: 100%" disabled/>
									</td>
								</tr>
								<tr>
									<th>고장내용</th>
									<td colspan="3">
										<input type="text" class="form-control" style="max-width: 100%" id="troubleCont" name="troubleCont" disabled>
									</td>
								</tr>
								<tr>
									<th>조사내용</th>
									<td colspan="3">
										<input type="text" class="form-control" style="max-width: 100%" id="troubleCause" name="troubleCause" disabled>
									</td>
								</tr>
								<tr>
									<th>수리시작</th>
									<td>
										<input class="form-control" type="date" id="repairStartDate" name="repairStartDate" style="max-width: 100%" disabled/>
									</td>
									<th>수리종료</th>
									<td>
										<input class="form-control" type="date" id="repairEndDate" name="repairEndDate" style="max-width: 100%" disabled/>
									</td>
								</tr>
								<tr>
									<th>수리업체</th>
									<td><input type="text" class="form-control" style="max-width: 100%" id="repairCorpNm" name="repairCorpNm" disabled></td>
									<th>현재상태</th>
									<td><select class="custom-select" id="repairStatus" name="repairStatus" style="max-width: 100%" disabled></select></td>
								</tr>
								<tr>
									<th>수리비용</th>
									<td>
										<input type="text" class="form-control" style="max-width: 100%" id="repairCost" value="0" dir="rtl" 
										name="repairCost" onChange="totalCostCal()" disabled>
									</td>
									<th>부품비용</th>
									<td>
										<input type="text" class="form-control" style="max-width: 100%" id="partCost" value="0" dir="rtl" 
										name="partCost" onChange="totalCostCal()" disabled>
									</td>
								</tr>
								<tr>
									<th>합계비용</th>
									<td><input type="text" class="form-control" style="max-width: 100%" id="totalCost" name="totalCost" 
										value="0" dir="rtl" disabled></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th colspan="2">수리이전</th>
									<th colspan="2">수리이후</th>
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
	    	</div>
		</div>
	</div>
	<!-- 수리이력 모달 모달 종료-->
	<!-- 설비 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel3" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel3">설비코드조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	 
			      	<div class="table-responsive">  
		                <table id="equipPopUpTable3" class="table table-bordered">
		                	<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
		                    <thead class="thead-light">
		                    <tr>
			                    <th>설비관리번호</th>
			                    <th>설비명</th>	                            
			                    <th>자산코드</th>
			                    <th>제작사</th>
		                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
		 			</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
	</div>
	<!-- 설비 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">설비관리</a></li>
				<li class="breadcrumb-item active">설비 R&R</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 60%;">
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
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="12%">
								<col width="12%">
								<col width="8%">
								<col width="8%">
								<col width="10%">
								<col width="9%">
								<col width="7%">
								<col width="6%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>시작일자</th>
									<th>시작시간</th>
									<th>종료일자</th>
									<th>종료시간</th>
									<th>설비관리번호</th>
									<th>설비명</th>
									<th>설비규격</th>
									<th>비가동구분</th>
									<th>사유</th>
									<th>비가동시간(분)</th>
									<th>작업자</th>
									<th>체크시트</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 39%;">
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
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="headTab1">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab2" id="photo">사진</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab3" id="corr">교정내역</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab4" id="etc">기타</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab5" id="headTab5">작업조건</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab6" id="headTab6">수리이력</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>	
										<th>*구분</th>
										<td colspan="3">
											<div class="row">
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" onclick="radioOnclick()" checked disabled> 
													<label class="custom-control-label input-label-sm" for="mg1">설비</label>
												</div>
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" onclick="radioOnclick()" disabled> 
													<label class="custom-control-label input-label-sm" for="mg2">금형</label>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>설비관리번호</th>
										<td><input type="text" class="form-control" id="equipNo" name="equipNo" style="min-width : 100%" disabled></td>
										<th>설비명</th>
										<td><input type="text" class="form-control" id="equipNm" name="equipNm" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>설비규격</th>
										<td><input type="text" class="form-control" id="equipType" name="equipType" style="min-width : 100%" disabled></td>
										<th>비가동구분</th>
										<td><input type="text" class="form-control" id="noGubun" name="noGubun" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>시작일자</th>
										<td><input type="text" class="form-control" id="noStartDate" name="noStartDate" style="min-width : 100%" disabled></td>
										<th>시작시간</th>
										<td><input type="text" class="form-control" id="noStartTime" name="noStartTime" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>종료일자</th>
										<td><input type="text" class="form-control" id="noEndDate" name="noEndDate" style="min-width : 100%" disabled></td>
										<th>종료시간</th>
										<td><input type="text" class="form-control" id="noEndTime" name="noEndTime" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>비가동시간</th>
										<td style="position: relative;">
											<input type="text" class="form-control" id="noTime" name="noTime" dir="rtl"
												style="text-align: right; padding-right: 2rem; min-width:100%;" disabled>
											<span style="display: block; position: absolute; top: 5px; right: 10px; height: 1.5rem; line-height: 1.5rem;">분</span>
										</td>
										<th>작업자</th>
										<td><input type="text" class="form-control" id="userNm" name="userNm" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>사유</th>
										<td colspan="3">
											<input type="text" class="form-control" id="noReason" name="noReason" style="min-width : 100%" disabled>
										</td>
									</tr>
								</table>
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnCheckSave">체크시트저장</button>
									<button type="button" class="btn btn-primary float-left ml-1" id="btnCheckAdd" disabled>체크시트추가</button>
									<button type="button" class="btn btn-warning float-left ml-1" id="btnCheckDel" disabled>체크시트삭제</button>
								</div>
								<table class="table table-bordered" id="equipFtInfo">
									<colgroup>
										<col width="20%"> 
										<col width="80%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>설비점검체크시트</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">설비 R&R 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>자산코드</th>
								<th>자산구분</th>
								<th>매입가</th>
								<th>설비관리번호</th>
								<th>설비명</th>
								<th>공정코드</th>
								<th>설비규격</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>소모품</th>
								<th>설비규격</th>
								<th>구입처</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
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
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "60%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
		state = !state;
	});

	let menuAuth = 'emsc0100';
	let currentHref = "emsc0100";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비 R&R"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	let selectCheck1 = '';
	let selectCheck2 = '';
	uiProc(true);
	var mainGubun = '001';
	var equipCd = null;
	var serverDate = "${serverDateTo}"
	var index=0;
	var urlData = null;
	var buyAmtVal;
	var equipCdVal = null;
	var corrRegDate = null;
	var equipGubunVal = '';
	var mainEquipCd = ' ';
	var equipGubun = ' ';
	var nonOperationGubunVal = '';
	var tempView1 = 'add';
	var baseInfoSeq = '';

	//공통코드 처리 시작
	var nonOperationGubunCode = new Array();
	<c:forEach items = "${nonOperationGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	nonOperationGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnCheckSave').addClass('d-none');
		$('#btnCheckAdd').attr('disabled', true);
		$('#btnCheckDel').attr('disabled', true);
		$('#equipCodeTable').DataTable().ajax.reload(function(){});
		$('#equipFtInfo').DataTable().ajax.reload(function(){});
	});

	$('#endDate').val(serverDate);
	$('#mfcDate').val(serverDate);
	$('#ancDate').val(serverDate);
	$('#purchaseDate').val(serverDate);
	
	//설비정보 목록
	let equipCodeTable = $('#equipCodeTable').DataTable({
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
			url : '<c:url value="/bm/equipRestartInfoList"/>',
			type : 'GET',
			data : {
				'noGubun' : function(){return nonOperationGubunVal;},
			},
		},
		columns : [ 
			{
				data: 'noStartDate',
				render: function(data, type, row, meta) {
					if (data != null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}, "className": "text-center" 	
			},
			{
				data : 'noStartTime',
				render: function(data, type, row, meta) {		
					if (data != null){
						if(data.substr(0, 2) > 12){
							var tempHour = data.substr(0, 2) - 12;
							if(tempHour < 10){
								tempHour = "0" + tempHour;
							}
							return "오후 " + tempHour + data.substr(2);							
						} else {
							return "오전 " + data;		
						}
					} else {
						return '-';
					}
	           		return resultHtml;
				}
			}, 
			{
				data: 'noEndDate',
				render: function(data, type, row, meta) {
					if (data != null && data != ""){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}, "className": "text-center" 	
			},
			{
				data : 'noEndTime',
				render: function(data, type, row, meta) {		
					if (data != null && data != ""){
						if(data.substr(0, 2) > 12){
							var tempHour = data.substr(0, 2) - 12;
							if(tempHour < 10){
								tempHour = "0" + tempHour;
							}
							return "오후 " + tempHour + data.substr(2);							
						} else {
							return "오전 " + data;		
						}
					} else {
						return '-';
					}
	           		return resultHtml;
				}
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
				data : 'noGubunNm'
			},
			{
				data : 'noReason'
			},
			{
				data : 'noTime'
			},
			{
				data : 'userNm'
			},
			{
				data: 'attachCheck',
				render: function(data, type, row, meta) {
					if (data != null){
						return '<span style="color : blue;">등록완료</span>';
					} else {
						if(parseInt(row['noTime'])>29){
							return '<span style="color : red;">미등록</span>';
						}else{
							return '<span>해당없음</span>';
						}
					}
				}, "className": "text-center" 
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '설비 R&R',
		}, {
			extend : 'excel',
			title : '설비 R&R',
		}, {
			extend : 'print',
			title : '설비 R&R',
		}, ],
	});

	var  html = '<div class="row">';
// 	html += '&nbsp;&nbsp;&nbsp;'; 
	html += '<label class="input-label-sm">구분</label>'; 
	html += '<select class="custom-select" id="nonOperationGubun">';
	html +=	'</select>';
	html += '&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="fileReferenceBtn" onclick="fileReferenceClick();">설비 재가동 기준서</button>';
    html += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html += '<a href="/bm/equipBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html += '</div>';

	$('#equipCodeTable_length').html(html);
	
	selectBoxAppend(nonOperationGubunCode, "nonOperationGubun", "", "1");

	//구분 선택시
	$('#nonOperationGubun').on('change', function() {
		nonOperationGubunVal = $('#nonOperationGubun').val();
		$('#equipCodeTable').DataTable().ajax.reload(function () {});
    });
	
	var workOrdNo = '';
	var noSeq = '';
	
	//설비정보 상세정보 보기
	$('#equipCodeTable tbody').on('click','tr',function() {
		tempView1 = 'add';
		
		if ($('#btnCheckSave').attr('class') == 'btn btn-primary float-right ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($('#btnSave2').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#headTab1').tab('show');
		if ($(this).hasClass('selected')) {
		} else {
			$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		workOrdNo = equipCodeTable.row(this).data().workOrdNo;
		noSeq = equipCodeTable.row(this).data().noSeq;
		
		$('#equipFtInfo').DataTable().ajax.reload();
		$('#btnCheckAdd').attr('disabled',false);
		$('#btnCheckDel').attr('disabled',false);

		$.ajax({
			url : '<c:url value="bm/equipRestartInfoRead"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function() {return workOrdNo;},
				'noSeq' : function() {return noSeq;},
			},
			success : function(res) {
				let data = res.data;
				
				$('#equipNo').val(data.equipNo);
				$('#equipNm').val(data.equipNm);
				$('#equipType').val(data.equipType);
				$('#noGubun').val(data.noGubunNm);
				$('#noStartDate').val(moment(data.noStartDate).format('YYYY-MM-DD'));
				var tempNoStartTime = data.noStartTime;
				if(tempNoStartTime.substr(0, 2) > 12){
					var tempHour = tempNoStartTime.substr(0, 2) - 12;
					if(tempHour < 10){
						tempHour = "0" + tempHour;
					}
					tempNoStartTime = "오후 " + tempHour + tempNoStartTime.substr(2);							
				} else {
					tempNoStartTime = "오전 " + tempNoStartTime;		
				}
				$('#noStartTime').val(tempNoStartTime);
				$('#noEndDate').val(moment(data.noEndDate).format('YYYY-MM-DD'));
				var tempNoEndTime = data.noEndTime;
				if(tempNoEndTime.substr(0, 2) > 12){
					var tempHour = tempNoEndTime.substr(0, 2) - 12;
					if(tempHour < 10){
						tempHour = "0" + tempHour;
					}
					tempNoEndTime = "오후 " + tempHour + tempNoEndTime.substr(2);							
				} else {
					tempNoEndTime = "오전 " + tempNoEndTime;		
				}
				$('#noEndTime').val(tempNoEndTime);
				$('#noTime').val(data.noTime);
				$('#userNm').val(data.userNm);
				$('#noReason').val(data.noReason);
				
			}
		});

		
	});

	function uiProc(flag) {
		$('input[name=mainGubun]').attr('disabled',flag);
		$("#equipNo").attr("disabled", flag);
		$("#equipNm").attr("disabled", flag);
		$("#equipInitial").attr("disabled", flag);
		$("#prcNm").attr("disabled", flag);
		$("#equipGubun").attr("disabled", flag);
		$("#equipType").attr("disabled", flag);
		$("#moldLocation").attr("disabled", flag);
		$("#equipCavity").attr("disabled", flag);
		$("#mfcDate").attr("disabled", flag);
		$("#mfcCorpCd").attr("disabled", flag);
		$("#assetCd").attr("disabled", flag);
		$("#buyAmt").attr("disabled", flag);
		$("#assetGubun").attr("disabled", flag);
		$("#equipCond").attr("disabled", flag);
		$("#upperAmt").attr("disabled", flag);
		$("#lowerAmt").attr("disabled", flag);
		$("#ancEquipNm").attr("disabled", flag);
		$("#ancDate").attr("disabled", flag);
		$("#ancEquipNm").attr("disabled", flag);
		$("#ancDate").attr("disabled", flag);
		$("#ancCorpCd").attr("disabled", flag);
		$("#expNm").attr("disabled", flag);
		$("#ancEquipType").attr("disabled", flag);
		$("#buyCorpNm").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#equipDesc").attr("disabled", flag);
		$('#mfcDateCalendar').attr("disabled", flag);
		$('#ancDateCalendar').attr("disabled", flag);
		$('#endDateCalendar').attr("disabled", flag);

// 		$('#equipmanageNo').attr("disabled", flag);
		$('#equipModel').attr("disabled", flag);
		$('#equipWidth').attr("disabled", flag);
		$('#equipLength').attr("disabled", flag);
		$('#equipHeight').attr("disabled", flag);
		$('#purchaseDateCalendar').attr("disabled", flag);
		$('#moldGrade').attr("disabled", flag);
		$('#purchasePrice').attr("disabled", flag);
		$('button[name=btnEquipAncNo]').attr('disabled', flag);
	}


	

	
	var tempNum = '';
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	//금형점검체크시트 목록
	let equipFtInfo = $('#equipFtInfo').DataTable({
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
				'attachCd' : function(){return workOrdNo;},
				'etc1' : function(){return noSeq;},
				'attachGubun' : function(){return 'EI';},
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
						data : 'attachFn',
						render : function(data, type, row, meta) {
							if (data != null) {
								var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+workOrdNo+'&attachGubun=EI">'+data+'</a>';
								return html;
							} else {
								var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
								html += '<input type="file" class="custom-file-input" id="fileDrNm'+tempNum+'" name="fileNm">';
								html += '<label class="custom-file-label" for="fileDrNm'+tempNum+'"></label>';
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
	
	//금형점검체크시트 클릭 시
	$('#equipFtInfo tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView1 = "add";
		} else {
			$('#equipFtInfo').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			tempView1 = "edit";
		}
		tableIdx = $('#equipFtInfo').DataTable().row(this).index();
		baseInfoSeq = equipFtInfo.row(tableIdx).data().attachSeq;
	});
	
	//금형점검체크시트 추가버튼
	$('#btnCheckAdd').on('click', function() {

		$('#equipFtInfo').DataTable().row.add({}).draw(false);
		
		if (equipFtInfo.data().count() > 0) {
			$('#btnCheckSave').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnCheckAdd').attr('disabled', true);
		$('#btnCheckDel').attr('disabled', true);
	});
	
	//설비점검체크시트 삭제버튼
	$('#btnCheckDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 설비점검체크시트를 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//설비점검체크시트 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'EI';},
					'attachCd' : function(){return workOrdNo;},
					'etc1' : function(){return noSeq;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#equipFtInfo').DataTable().ajax.reload();
					$('#equipCodeTable').DataTable().ajax.reload();
					toastr.success("설비점검체크시트가 삭제되었습니다.");
				}
			})
		} else {
			$('#equipFtInfo').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});
	
	// 설비점검체크시트 저장
	$('#btnCheckSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipFtInfo tbody tr').each(function(index, item) {
			index++;
			if($("#fileDrNm"+index).val() != null && $("#fileDrNm"+index).val() != 'undefined' && $("#fileDrNm"+index).val() != ''){
				//값 있나없나 검사
				if (equipFtInfo.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						check = false;
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'EI',
						'attachCd' : function(){return workOrdNo;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				formData.append('attachSeq', attachDataSeq);
				attachRegDateValue = $('#attachDrDate' + index).val();
				formData.append('attachRegDate', attachRegDateValue);
	
				formData.append('attachCd', workOrdNo);
				formData.append('etc1', noSeq);
				formData.append('path', fileDate);
				formData.append('contents', '');
				formData.append('attachGubun', 'EI');
				formData.append('idCheck', 'EI');
				
				index--;
				
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
							// 보기
							toastr.success('설비점검체크시트가 등록되었습니다.');
							tempView1 = 'add';
							$('#equipCodeTable').DataTable().ajax.reload();
							$('#equipFtInfo').DataTable().ajax.reload();
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnCheckSave').addClass('d-none');
						$('#btnCheckAdd').attr('disabled', false);
						$('#btnCheckDel').attr('disabled', false);
					}
				});
			}
			
		});
		
	});
	
	//통합자료실 모달
	var fileReferencePopUpTable;
	function fileReferenceClick() {
		if (fileReferencePopUpTable == null || fileReferencePopUpTable == 'undefined') {
			fileReferencePopUpTable = $('#fileReferencePopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				paging : true,
				searching: true,
				pageLength : 100000000, 
				scrollY: "50vh",
				ajax : {
					url : '<c:url value="fr/fileReferenceList"/>',
					type : 'POST',
					data : {
						'gubun'	:	function(){return '001';},
						'fileGubun'	:	function(){return '001';},
					},
				},
				select: false,
				rowId: 'idx',
				columns : [
					{
						className : 'text-center',
						render : function(data, type, row, meta) {
							return meta.row+1;
						}
					},
					{
						data : 'fileManagerNm', 
						render : function(data, type, row, meta) {
							if(data != null){
								return data;
							} else {
								return '';
							}
						},
						className : 'text-center p-0'
					},
					{
						data : 'fileManagerDepartmentNm', 
						className : 'text-center' 
					},
					{
						data : 'fileInputDate', className : 'text-center p-0',
						render : function(data, type, row, meta) {
							if(data != null && data != ''){
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
							
						}
					},
					{ 
						data : 'fileName', 
						render : function(data, type, row, meta) {
							var length = data.split('.').length;
							let idx = row['idx'];
							if($.inArray(data.split('.')[length-1], ["tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"]) == -1){
								return '<a href="fr/fileReferenceRead?idx='+idx+'">'+data+'</a>';
							} else {
								return '<button type="button" class="btn btn-info" id="" onclick="imageModalClick('+idx+');">'+data+'</button>';
							}
							
						},
						className : 'text-center'
					},
					{ 
						data : 'fileName', className : 'text-center',
						render : function(data, type, row, meta) {
							var length = data.split('.').length;
							return data.split('.')[length-1];
						}
					},
					{ 
						data : 'fileDesc', className : 'text-center p-0',
						render : function(data, type, row, meta) {
							if(data != null){
								return data;
							} else {
								return '';
							}
							
						}
					},
				],
				columnDefs : [],
				buttons : [],
				order : [],
			});
		}
		$('#fileReferencePopUpModal').modal('show');
		setTimeout(function(){
			fileReferencePopUpTable.draw();
		},170);
	}
	
	function imageModalClick(idx) {
		$.ajax({
			url: '<c:url value="fr/fileReferenceJustRead"/>',
            type: 'GET',
            async: false,
            data : {
				'idx'	:	function(){return idx;},
			},
			success : function(res) {
				let data = res.data;
				$('#imageModal').modal('show');
				$('#fileReferenceImg').attr("src","data:image/jpg;base64," + data.fileBlob);
			}
		});
	}

</script>
</body>
</html>
