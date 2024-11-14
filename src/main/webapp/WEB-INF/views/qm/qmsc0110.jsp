<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!-- 사진 모달 시작-->
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!-- 사진 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">공정검사관리대장(레이저)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 65%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="itemPrcssCompleteAdmTable" class="table table-bordered">
							<%-- <colgroup>
								<col width="9%">
								<col width="8%">
								<col width="6%">
								<col width="6%">
								<col width="8%">
								<col width="10%">
								<col width="15%">
								<col width="7%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="7%">
								<col width="7%">
							</colgroup> --%>
							<thead class="thead-light">
								<tr>
									<th>작업지시번호</th>
									<th>설비명</th>
									<th>작업자</th>
									<th>품번</th>
									<th>품명</th>
									<th>검사일자</th>
									<th class="text-center">검사수량</th>	
									<th class="text-center">초물</th>	
									<th class="text-center">중물</th>	
									<th class="text-center">종물</th>				
									<th class="text-center">승인구분</th>								
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width: 34%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a></li>
				
					</ul>
				</div>
				<!--====================TAB-UI=======================-->
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">								
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup1">초물</button>	
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup2">중물</button>
								<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup3">종물</button>					
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" 	 id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnAdd">등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-1"
										id="itemInspectAdmTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>설비명</th>
												<td><input type="text" class="form-control" id="equipNm" name="equipNm"  disabled />
												<input type="hidden" id="workEndTime" name="workEndTime"  disabled /></td>
												<th>검사일자</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="inspectDate" name="inspectDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="inspectDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</tr>
											<tr>
												<th>검사자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="inspectChargr"name="inspectChargr" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="inspectChargrNm" name="inspectChargrNm" disabled>
														<button type="button" class="btn btn-primary input-sub-search"name="btnInspectChargr" id="btnInspectChargr" onClick="selectInspectChargr();">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
												</td>
												<th>작업자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="workChargrSugi"name="workChargrSugi" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="workChargrSugiNm" name="workChargrSugiNm" disabled>
<!-- 														<button type="button" class="btn btn-primary input-sub-search"name="btnworkChargrSugi" id="btnworkChargrSugi" onClick="selectInspectChargr2();"> -->
<!-- 															<span class="oi oi-magnifying-glass"></span> -->
<!-- 														</button> -->
													</div>
												</td>	
											</tr>
											<tr>
												<th>품번</th>
												<td><input type="text" class="form-control" id="itemCd" name="itemCd" disabled /></td>
												<th>품명</th>
												<td>
													<input class="form-control" style="max-width: 100%" type="text" id="itemNm" name="itemNm" maxlength="10" disabled />
												</td>
											</tr>
											<tr>
												<th>CAVITY수<br>체크</th>
												<td><select class="custom-select" id="cavityCnt" style="min-width : 100%;" disabled></select></td>
												<th></th>
												<td></td>
												<th class="d-none">LOT NO</th>
												<td class="d-none"><input type="text" class="form-control" id="lotNoSugi" name="lotNoSugi"  disabled /></td>
											</tr>
																						
										</thead>
									</table>
								</div>
							</form>	
							<form id="form3">
								<div class="table-responsive">
									<table id="itemMatrlTable" class="table table-bordered">
										<colgroup>										
										</colgroup>					
										<thead class="thead-light">
											<tr>
												<th>원재료 재료명</th>
												<th>원재료 GRADE</th>										
												<th>원재료 LOT NO</th>
												
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<form id="form8" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">제품사진</th>
										</tr>
										<tr>
											<th>사진1</th>
											<th>사진2</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src="" onClick="imgShow(imgSrc1)"
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src="" onClick="imgShow(imgSrc2)"
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<th>사진3</th>
											<th>사진4</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile3" src="" onClick="imgShow(imgSrc3)"
														name="imageFile3" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4" src="" onClick="imgShow(imgSrc4)"
														name="imageFile4" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<!--========tab1 part=====-->			
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!--  Modal Start-->
	<div class="modal fade" id="inspPopupModal" tabindex="-1" role="dialog" aria-labelledby="inspSavePopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document" style="min-width:1000px;">
			<div class="modal-content" >
				<div class="modal-header">
					<h5 class="modal-title" id="inspPopuppLabel">검사항목등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="">
						<button type="button" class="btn btn-primary" id="btnExt">외관</button>
						<button type="button" class="btn btn-primary" id="btnSize">치수</button>
						<button type="button" class="btn btn-primary" id="btnWeight">중량</button>
						
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<!-- <button type="button" class="btn btn-warning float-right mr-1" id="btnInspEdit">수정</button> -->
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
<%-- 								<colgroup> --%>
<%-- 									<col width="3%"> --%>
<%-- 									<col width="40%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 									<col width="8%"> --%>
<%-- 								</colgroup> --%>
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:370px;">기준</th>
										<th rowspan="2" style="min-width:60px;">확인방법</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh2">CVT.2</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh3">CVT.3</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh4">CVT.4</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh5">CVT.5</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh6">CVT.6</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh7">CVT.7</th>
										<th colspan="3" style="min-width:230px; background: #6bbcfb;" id="blueTh8">CVT.8</th>
									</tr>
									<tr>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th> <!-- CVT.1 -->
										<th id="th21">X1</th>
										<th id="th22">X2</th>
										<th id="th23">X3</th> <!-- CVT.2 -->
										<th id="th31">X1</th>
										<th id="th32">X2</th>
										<th id="th33">X3</th> <!-- CVT.3 -->
										<th id="th41">X1</th>
										<th id="th42">X2</th>
										<th id="th43">X3</th> <!-- CVT.4 -->
										<th id="th51">X1</th>
										<th id="th52">X2</th>
										<th id="th53">X3</th> <!-- CVT.5 -->
										<th id="th61">X1</th>
										<th id="th62">X2</th>
										<th id="th63">X3</th> <!-- CVT.6 -->
										<th id="th71">X1</th>
										<th id="th72">X2</th>
										<th id="th73">X3</th> <!-- CVT.7 -->
										<th id="th81">X1</th>
										<th id="th82">X2</th>
										<th id="th83">X3</th> <!-- CVT.8 -->
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv2">
							<table class="table table-bordered" id="sizeAdmTable2" style="width:100%;">
								<%-- <colgroup>
									<col width="10%">
									<col width="20%">
									<col width="26%">
									<col width="22%">
									<col width="22%">
								</colgroup> --%>
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:100px;">목록</th>
										<th rowspan="2" style="min-width:50px;">확인방법</th>
										<th colspan="2" style="min-width:200px;">기준</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo2">CVT.2</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo3">CVT.3</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo4">CVT.4</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo5">CVT.5</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo6">CVT.6</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo7">CVT.7</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThTwo8">CVT.8</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th> <!-- CVT.1 -->
										<th id="thTwo21">X1</th>
										<th id="thTwo22">X2</th>
										<th id="thTwo23">X3</th> <!-- CVT.2 -->
										<th id="thTwo31">X1</th>
										<th id="thTwo32">X2</th>
										<th id="thTwo33">X3</th> <!-- CVT.3 -->
										<th id="thTwo41">X1</th>
										<th id="thTwo42">X2</th>
										<th id="thTwo43">X3</th> <!-- CVT.4 -->
										<th id="thTwo51">X1</th>
										<th id="thTwo52">X2</th>
										<th id="thTwo53">X3</th> <!-- CVT.5 -->
										<th id="thTwo61">X1</th>
										<th id="thTwo62">X2</th>
										<th id="thTwo63">X3</th> <!-- CVT.6 -->
										<th id="thTwo71">X1</th>
										<th id="thTwo72">X2</th>
										<th id="thTwo73">X3</th> <!-- CVT.7 -->
										<th id="thTwo81">X1</th>
										<th id="thTwo82">X2</th>
										<th id="thTwo83">X3</th> <!-- CVT.8 -->
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv">
							<table class="table table-bordered" id="sizeAdmTable" style="width:100%;">
								<%-- <colgroup>
									<col width="10%">
									<col width="15%">
									<col width="10%">
									<col width="31%">
									<col width="17%">
									<col width="17%">
								</colgroup> --%>
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:100px;">목록</th>
										<th rowspan="2" style="min-width:50px;">확인방법</th>
										<th colspan="2" style="min-width:200px;">기준</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne2">CVT.2</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne3">CVT.3</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne4">CVT.4</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne5">CVT.5</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne6">CVT.6</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne7">CVT.7</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThOne8">CVT.8</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th> <!-- CVT.1 -->
										<th id="thOne21">X1</th>
										<th id="thOne22">X2</th>
										<th id="thOne23">X3</th> <!-- CVT.2 -->
										<th id="thOne31">X1</th>
										<th id="thOne32">X2</th>
										<th id="thOne33">X3</th> <!-- CVT.3 -->
										<th id="thOne41">X1</th>
										<th id="thOne42">X2</th>
										<th id="thOne43">X3</th> <!-- CVT.4 -->
										<th id="thOne51">X1</th>
										<th id="thOne52">X2</th>
										<th id="thOne53">X3</th> <!-- CVT.5 -->
										<th id="thOne61">X1</th>
										<th id="thOne62">X2</th>
										<th id="thOne63">X3</th> <!-- CVT.6 -->
										<th id="thOne71">X1</th>
										<th id="thOne72">X2</th>
										<th id="thOne73">X3</th> <!-- CVT.7 -->
										<th id="thOne81">X1</th>
										<th id="thOne82">X2</th>
										<th id="thOne83">X3</th> <!-- CVT.8 -->
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="weightTableDiv">
							<table class="table table-bordered" id="weightTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:100px;">목록</th>
										<th rowspan="2" style="min-width:50px;">확인방법</th>
										<th colspan="2" style="min-width:200px;">기준</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei2">CVT.2</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei3">CVT.3</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei4">CVT.4</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei5">CVT.5</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei6">CVT.6</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei7">CVT.7</th>
										<th colspan="3" style="min-width:280px; background: #6bbcfb;" id="blueThWei8">CVT.8</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th> <!-- CVT.1 -->
										<th id="thWei21">X1</th>
										<th id="thWei22">X2</th>
										<th id="thWei23">X3</th> <!-- CVT.2 -->
										<th id="thWei31">X1</th>
										<th id="thWei32">X2</th>
										<th id="thWei33">X3</th> <!-- CVT.3 -->
										<th id="thWei41">X1</th>
										<th id="thWei42">X2</th>
										<th id="thWei43">X3</th> <!-- CVT.4 -->
										<th id="thWei51">X1</th>
										<th id="thWei52">X2</th>
										<th id="thWei53">X3</th> <!-- CVT.5 -->
										<th id="thWei61">X1</th>
										<th id="thWei62">X2</th>
										<th id="thWei63">X3</th> <!-- CVT.6 -->
										<th id="thWei71">X1</th>
										<th id="thWei72">X2</th>
										<th id="thWei73">X3</th> <!-- CVT.7 -->
										<th id="thWei81">X1</th>
										<th id="thWei82">X2</th>
										<th id="thWei83">X3</th> <!-- CVT.8 -->
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal End-->

<%@include file="../layout/bottom.jsp" %>

<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>

	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "65%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "qmsc0110";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공정검사관리대장(레이저)"); 
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let btnView = '';

	let printArray = new Array();
	
	var index = 0;
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate = "${serverDate}";
	var workOrdNo = '';
	var workEndTime= '';
	var itemSeq = '';
	var mainGubun=null;
	var chojungjong = '001';
	var approvalTotal = '';
	var mdInspectYn = null;
	//외관,치수 테이블 초기화를 위한 itemSeq 초기화
	
	var modalHide = true;
	
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";
	
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	
	//base64를 담는 변수
	var imgSrc1 = '';
	var imgSrc2 = '';
	var imgSrc3 = '';
	var imgSrc4 = '';

	var choStatus = "";
	var jungStatus = "";
	var jongStatus = ""; 
	
	//공통코드 시작
	let qaEvalCode = new Array();
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>	

	let inputMethodCode = new Array();	//검사입력방식
    <c:forEach items="${inputMethod}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inputMethodCode.push(json);
	</c:forEach>

	let judgeCode = new Array();	//판정
    <c:forEach items="${judge}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		judgeCode.push(json);
	</c:forEach>

	let silhangCode = new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		silhangCode.push(json);
	</c:forEach>
	
	let cavityCntCode = new Array();	//CAVITY
    <c:forEach items = "${cavityCnt}" var="info">
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}" + "개";
		cavityCntCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	uiProc(true);

	selectBoxAppend(cavityCntCode, "cavityCnt", "001", "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnSave').addClass('d-none');

		$('#btnInspPopup1').attr('disabled', true);
    	$('#btnInspPopup2').attr('disabled', true);
    	$('#btnInspPopup3').attr('disabled', true);

    	$('#cavityCnt').attr('disabled', true);
    	
		$('#itemMatrlTable').DataTable().clear().draw();
	});

	//수입검사관리대장 목록조회
	let itemPrcssCompleteAdmTable = $('#itemPrcssCompleteAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : true,
		fixedHeader: true,
		pageLength : 20, 
		ajax : {
			url : '<c:url value="qm/itemPrcssCompleteAdmDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},		
				'approvalTotal' : function() { return approvalTotal;},				
				'mainGubun' : function() { return '001';},				
			},
		}, 
		rowId : 'rowId',
		columns : [ 
			{ 
				data : 'workOrdNo' 
			}, 
			{ 
				data : 'equipNm' 
			}, 			
			{
				data  : 'workChargrNm'
			}, 
			{ 
				data : 'itemCd' 
			}, 
			{ 
				data : 'itemNm' 
			},
			{ 
				data : 'inspectDate' ,						
				render : function(data, type, row, meta){
					if(data != null){
						let result = data == null ? data : moment(data).format('YYYY-MM-DD')
						return result;
					} else {
						return '-';
					}
				}			
			},
			{ 
				data : 'fairQty' 
			}, 	
			{ 
				data : 'approvalCho',
				/* render : function(data, type, row, meta){
					if(data=="승인"){
						return '<span>'+data+'</span>';
					}else{
						return '<span style="color:red;">'+data+'</span>';
					}
				}	 */	
			},
			{ 
				data : 'approvalJung',
				render : function(data, type, row, meta){
					if(row['mdInspectYn'] == "002"){
						return '<span style="color:gray;">검사안함</span>';
					} else {
						return data;
						/* if(data=="승인"){
							return '<span>'+data+'</span>';
						}else{
							return '<span style="color:red;">'+data+'</span>';
						} */
					}
				}		
			}, 		
			{ 
				data : 'approvalJong',
				/* render : function(data, type, row, meta){
					if(data=="승인"){
						return '<span>'+data+'</span>';
					}else{
						return '<span style="color:red;">'+data+'</span>';
					}
				}		 */
			}, 		
			{ 
				data : 'approvalTotal',
				render : function(data, type, row, meta){
					if(data=="승인"){
						return '<span>'+data+'</span>';
					}else{
						return '<span style="color:red;">'+data+'</span>';
					}
				}		
			}, 		
		],
		columnDefs : [ {
			targets : [7],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		} ],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});

	var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">검사일자</label>';
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
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인구분</label>';
		html1 += '&nbsp;<select class="custom-select" id="approvalTotal"><option value="" selected>전체</option><option value="001">승인</option><option value="002">미승인</option></select>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnAllRetv">전체조회</button>';
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right d-none" id="printCnt" placeholder="매수" style="width:40px;" value="1">';
		html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info d-none" id="btnQAPrint">QA라벨발행</button>'
	    html1 += '</div>';
   
	$('#itemPrcssCompleteAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click',function(){

		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').addClass('d-none');

		//$('#btnInspPopup1').attr('disabled',true);
    	//$('#btnInspPopup2').attr('disabled',true);
    	//$('#btnInspPopup3').attr('disabled',true);
    	
		$('#itemMatrlTable').DataTable().clear().draw();

		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		approvalTotal = $('#approvalTotal option:selected').val();

		
		$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload(function() {});
	});


	//전체조회버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		uiProc(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').addClass('d-none');

		//$('#btnInspPopup1').attr('disabled',true);
    	//$('#btnInspPopup2').attr('disabled',true);
    	//$('#btnInspPopup3').attr('disabled',true);
    	
		$('#itemMatrlTable').DataTable().clear().draw();

		serverDateFrom = "";
		serverDateTo = "";
		approvalTotal = "";
		
		$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload(function() {});
	});


	//메인목록 클릭시
	$('#itemPrcssCompleteAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');			
			return false;
		}
		if ( $(this).hasClass('selected') ) {
// 	        $(this).removeClass('selected');
        } else {
        	$('#itemPrcssCompleteAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		$('#itemMatrlTable').removeClass('tr_highlight_row');	//hover

		
		let data = itemPrcssCompleteAdmTable.row(this).data();
		choStatus = data.approvalCho;
		jungStatus = data.approvalJung;
		jongStatus = data.approvalJong;
		
		workOrdNo = data.workOrdNo;
		workEndTime = data.workEndTime;
		itemSeq = data.itemSeq;
		mainGubun = data.mainGubun;
		sideView2 = "";

		mdInspectYn = data.mdInspectYn;

		//중물검사 
    	if(mdInspectYn=="002"){		
    		$('#btnInspPopup2').attr('disabled',true);
        }else{
        	$('#btnInspPopup2').attr('disabled',false);
        }
        
		$('#equipNm').val(data.equipNm); 
		$('#workEndTime').val(data.workEndTime); 
		$('#itemNm').val(data.itemNm); 
		$('#itemCd').val(data.itemCd); 
		$('#workChargrSugiNm').val(data.workChargrNm); 
				
	
	    $('#btnSave').addClass('d-none');	 				
	    $('#itemMatrlTable').DataTable().ajax.reload(function(){});
		$('#btnAdd').attr('disabled',false);
		$('#btnEdit').attr('disabled',false);

	    $.ajax({
			url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'workOrdNo' : function() {return workOrdNo;},
				'workEndTime' : function() {return data.workEndTime;},
			},
			success : function(res) {
				let data2 = res.data;		
				console.log(data2)		
// 				$('#workChargrSugi').val(data2==null?"":data2.workChargrSugi); 
// 				$('#workChargrSugiNm').val(data2==null?"":data2.workChargrSugiNm); 		
				$('#lotNoSugi').val(data2==null?"":data2.lotNoSugi); 
				$('#inspectChargr').val(data2==null?"":data2.inspectChargr);		//검사자
				$('#inspectChargrNm').val(data2==null?"":data2.inspectChargrNm);	//검사자명
				$('#inspectDate').val(data2==null?"": moment(data2.inspectDate).format("YYYY-MM-DD"));		//검사일자
				
				if(data2.cavityCnt != null){
					selectBoxAppend(cavityCntCode, "cavityCnt", data2.cavityCnt, "");
				} else {
					selectBoxAppend(cavityCntCode, "cavityCnt", "001", "");
				}
				
			}
			
		});
	    
	    if($('#inspectDate').val() == ''){
	    	$('#btnEdit').attr('disabled',true);
		}else{
			$('#btnAdd').attr('disabled',true);	    	
		}

	    imgPrint();
		
	});

	

	//수입검사관리대장 바코드별 목록조회
	let itemMatrlTable = $('#itemMatrlTable').DataTable({
		language : lang_kor,		
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
			url : '<c:url value="qm/itemPrcssCompleteAdmMatrlDataList"/>',
			type : 'GET',
			data : {
				'workOrdNo' :  function(){return workOrdNo;},				
			},
		},
		columns : [ 
			{data : 'itemNm'}, 
			{data : 'itemGrade'},
			{data : 'barcodeNo'},
			
		],
		columnDefs: [			
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	    ],
	});


	//등록버튼 클릭시
	$('#btnAdd').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);	

		$('#itemMatrlTable').addClass('tr_highlight_row');	//hover
		
		$('#inspectChargrNm').val(userNm);
		$('#inspectChargr').val(userNumber);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		//$('#btnInspPopup1').attr('disabled',true);
		//$('#btnInspPopup2').attr('disabled',true);
		//$('#btnInspPopup3').attr('disabled',true);
		
		$('#cavityCnt').attr('disabled', false);
	
		sideView ='add';	
		
	});
	
	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		if($('#inspectDate').val() == ''){
			toastr.warning("등록을 먼저 해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);

		$('#itemMatrlTable').addClass('tr_highlight_row');	//hover		
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnEdit').attr('disabled',true);
		
		btnView = 'edit';
		sideView = 'edit';
	});		
	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
// 		if($('#lotNoSugi').val()==""){
// 			toastr.warning("LOT NO를 입력해주세요.");
// 			return false;
// 		}
		if($('#inspectDate').val()==""){
			toastr.warning("검사일자을 입력해주세요.");
			return false;
		}
// 		if($('#workChargrSugiNm').val()==""){
// 			toastr.warning("작업자를 입력해주세요.");
// 			return false;
// 		}
		if($('#inspectChargrNm').val()==""){
			toastr.warning("검사자을 입력해주세요.");
			return false;
		}

		var url = "";
		if (sideView == "add") {
			url = '<c:url value="qm/itemPrcssCompleteAdmCreate"/>';
		} else {
			url = '<c:url value="qm/itemPrcssCompleteAdmUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNo;},
				'workEndTime' : function(){return $('#workEndTime').val().replace(/-/g,'');},
				'inspectDate' : function(){return $('#inspectDate').val().replace(/-/g,'')},
				'inspectChargr' : function(){return $('#inspectChargr').val()},
// 				'workChargrSugi' : function(){return $('#workChargrSugi').val()},
				'lotNoSugi' : function(){return $('#lotNoSugi').val()},
				'cavityCnt' : function(){return $('#cavityCnt').val()},
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);
					$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);				    	
			    	$('#btnSave').addClass('d-none');			   	
					$('#itemMatrlTable').removeClass('tr_highlight_row');	//hover

			    	//$('#btnInspPopup1').attr('disabled',false);
			    	//$('#btnInspPopup2').attr('disabled',false);
			    	//$('#btnInspPopup3').attr('disabled',false);
			    	
					$('#cavityCnt').attr('disabled', true);
					
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	}) 
	

	//담당자 팝업 시작
	var userPopUpTable;
	function selectInspectChargr() {
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
						//'departmentCd' : '007'			
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
					"targets" : [ 0, 1, 2, 3, 4 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});

			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				
					$('#inspectChargr').val(data.userNumber);
					$('#inspectChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		
		}

		
		
		$('#userPopUpModal').modal('show');

		
	}

	var userPopUpTable2;
	function selectInspectChargr2() {
		if (userPopUpTable2 == null || userPopUpTable2 == undefined) {
			userPopUpTable2 = $('#userPopUpTable2').DataTable({
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
						//'departmentCd' : '007'			
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
					"targets" : [ 0, 1, 2, 3, 4 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});

			$('#userPopUpTable2 tbody').on('click', 'tr', function() {
				var data = userPopUpTable2.row(this).data();		
			
				$('#workChargrSugi').val(data.userNumber);
				$('#workChargrSugiNm').val(data.userNm);
				
				$('#userPopUpModal2').modal('hide');
			});
		} else {
			$('#userPopUpTable2').DataTable().ajax.reload(function() {});
		
		}

		
		
		$('#userPopUpModal2').modal('show');

		
	}

	

	

	function uiProc(flag) {
		$('#inspectDateCalendar').attr('disabled', flag);
		$('#btnInspectChargr').attr('disabled', flag);
		$('#btnworkChargrSugi').attr('disabled', flag);	
		$('#lotNoSugi').attr('disabled', flag);

	}

</script>
<script>
	
	


	//검사항목등록 - 초물
	$('#btnInspPopup1').on('click',function(){
		var check = true;

		if(!$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			check = false;
			return false;
		}

		if(choStatus=="대기"){
			toastr.warning("초물은 대기상태입니다.");
			check = false;
			return false;
		}
		
		let data2 = null;

		if(check){
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' : function() {return workOrdNo;},
					'workEndTime' : function() {return workEndTime;},
				},
				success : function(res) {
					data2 = res.data;
											
				}				
			});
				
			if(data2 == null){
				toastr.warning("초물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}
	
			
			inspTypeVal = "외관";
			chojungjong = '001';
	
			$('#inspPopupModal').modal('show');
			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
			
			setTimeout(function(){
				extAdmTable.draw();
				extAdmTable.draw();
			}, 300) 
			
			//cavity 수에 따라 보여지는 컬럼 설정
		 	//먼저 다 d-none 해제
		 	extDnone();
 			
 			//그다음 cavity 수에 따라 d-none 부여
 			let cavityCntVal = $('#cavityCnt').val();
		 	cavityCntVal *= 1;
		 	
		 	switch(cavityCntVal){
			 	case 1:
		 			$('#blueTh2').addClass('d-none');
		 			$('#th21').addClass('d-none');
		 			$('#th22').addClass('d-none');
		 			$('#th23').addClass('d-none');
		 			extAdmTable.column(6).visible(false);
		 			extAdmTable.column(7).visible(false);
		 			extAdmTable.column(8).visible(false);
		 		case 2:
		 			$('#blueTh3').addClass('d-none');
		 			$('#th31').addClass('d-none');
		 			$('#th32').addClass('d-none');
		 			$('#th33').addClass('d-none');
		 			extAdmTable.column(9).visible(false);
		 			extAdmTable.column(10).visible(false);
		 			extAdmTable.column(11).visible(false);
		 		case 3:
		 			$('#blueTh4').addClass('d-none');
		 			$('#th41').addClass('d-none');
		 			$('#th42').addClass('d-none');
		 			$('#th43').addClass('d-none');
		 			extAdmTable.column(12).visible(false);
		 			extAdmTable.column(13).visible(false);
		 			extAdmTable.column(14).visible(false);
		 		case 4:
		 			$('#blueTh5').addClass('d-none');
		 			$('#th51').addClass('d-none');
		 			$('#th52').addClass('d-none');
		 			$('#th53').addClass('d-none');
		 			extAdmTable.column(15).visible(false);
		 			extAdmTable.column(16).visible(false);
		 			extAdmTable.column(17).visible(false);
		 		case 5:
		 			$('#blueTh6').addClass('d-none');
		 			$('#th61').addClass('d-none');
		 			$('#th62').addClass('d-none');
		 			$('#th63').addClass('d-none');
		 			extAdmTable.column(18).visible(false);
		 			extAdmTable.column(19).visible(false);
		 			extAdmTable.column(20).visible(false);
		 		case 6:
		 			$('#blueTh7').addClass('d-none');
		 			$('#th71').addClass('d-none');
		 			$('#th72').addClass('d-none');
		 			$('#th73').addClass('d-none');
		 			extAdmTable.column(21).visible(false);
		 			extAdmTable.column(22).visible(false);
		 			extAdmTable.column(23).visible(false);
		 		case 7:
		 			$('#blueTh8').addClass('d-none');
		 			$('#th81').addClass('d-none');
		 			$('#th82').addClass('d-none');
		 			$('#th83').addClass('d-none');
		 			extAdmTable.column(24).visible(false);
		 			extAdmTable.column(25).visible(false);
		 			extAdmTable.column(26).visible(false);
		 	}
 			
		}
		
	});

	//검사항목등록 - 중물
	$('#btnInspPopup2').on('click',function(){		
		var check = true;

		if(!$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			check = false;
			return false;
		}

		if(jungStatus=="대기"){
			toastr.warning("중물은 대기상태입니다.");
			check = false;
			return false;
		}
		
		let data2 = null;
		if(check){
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' : function() {return workOrdNo;},
					'workEndTime' : function() {return workEndTime;},
				},
				success : function(res) {
					data2 = res.data;
											
				}				
			});

			if(data2 == null){
				toastr.warning("중물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}

			inspTypeVal="외관";
			
			chojungjong = '002';
			$('#inspPopupModal').modal('show');

			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
		 	setTimeout(function(){
				extAdmTable.draw();
				extAdmTable.draw();
			}, 300) 
			
			//cavity 수에 따라 보여지는 컬럼 설정
		 	//먼저 다 d-none 해제
		 	extDnone();
 			
 			//그다음 cavity 수에 따라 d-none 부여
 			let cavityCntVal = $('#cavityCnt').val();
		 	cavityCntVal *= 1;
		 	
		 	switch(cavityCntVal){
			 	case 1:
		 			$('#blueTh2').addClass('d-none');
		 			$('#th21').addClass('d-none');
		 			$('#th22').addClass('d-none');
		 			$('#th23').addClass('d-none');
		 			extAdmTable.column(6).visible(false);
		 			extAdmTable.column(7).visible(false);
		 			extAdmTable.column(8).visible(false);
		 		case 2:
		 			$('#blueTh3').addClass('d-none');
		 			$('#th31').addClass('d-none');
		 			$('#th32').addClass('d-none');
		 			$('#th33').addClass('d-none');
		 			extAdmTable.column(9).visible(false);
		 			extAdmTable.column(10).visible(false);
		 			extAdmTable.column(11).visible(false);
		 		case 3:
		 			$('#blueTh4').addClass('d-none');
		 			$('#th41').addClass('d-none');
		 			$('#th42').addClass('d-none');
		 			$('#th43').addClass('d-none');
		 			extAdmTable.column(12).visible(false);
		 			extAdmTable.column(13).visible(false);
		 			extAdmTable.column(14).visible(false);
		 		case 4:
		 			$('#blueTh5').addClass('d-none');
		 			$('#th51').addClass('d-none');
		 			$('#th52').addClass('d-none');
		 			$('#th53').addClass('d-none');
		 			extAdmTable.column(15).visible(false);
		 			extAdmTable.column(16).visible(false);
		 			extAdmTable.column(17).visible(false);
		 		case 5:
		 			$('#blueTh6').addClass('d-none');
		 			$('#th61').addClass('d-none');
		 			$('#th62').addClass('d-none');
		 			$('#th63').addClass('d-none');
		 			extAdmTable.column(18).visible(false);
		 			extAdmTable.column(19).visible(false);
		 			extAdmTable.column(20).visible(false);
		 		case 6:
		 			$('#blueTh7').addClass('d-none');
		 			$('#th71').addClass('d-none');
		 			$('#th72').addClass('d-none');
		 			$('#th73').addClass('d-none');
		 			extAdmTable.column(21).visible(false);
		 			extAdmTable.column(22).visible(false);
		 			extAdmTable.column(23).visible(false);
		 		case 7:
		 			$('#blueTh8').addClass('d-none');
		 			$('#th81').addClass('d-none');
		 			$('#th82').addClass('d-none');
		 			$('#th83').addClass('d-none');
		 			extAdmTable.column(24).visible(false);
		 			extAdmTable.column(25).visible(false);
		 			extAdmTable.column(26).visible(false);
		 	}
		 	
		}

	});

	//검사항목등록 - 종물
	$('#btnInspPopup3').on('click',function(){
		var check = true;
		
		if(!$('#itemPrcssCompleteAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			check = false;
			return false;
		}

		if(jongStatus=="대기"){
			toastr.warning("종물은 대기상태입니다.");
			check = false;
			return false;
		}

		
		let data2 = null;
		if(check){
			$.ajax({
				url : '<c:url value="qm/itemPrcssCompleteAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' : function() {return workOrdNo;},
					'workEndTime' : function() {return workEndTime;},
				},
				success : function(res) {
					data2 = res.data;
											
				}				
			});
				
			if(data2 == null){
				toastr.warning("종물을 등록할 기본정보를 먼저 저장해주세요.");
				return false;
			}
			inspTypeVal="외관";
			chojungjong = '003';
			$('#inspPopupModal').modal('show');
	
			$('#extAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
		 	setTimeout(function(){
				extAdmTable.draw();
				extAdmTable.draw();
			}, 300) 
			
			//cavity 수에 따라 보여지는 컬럼 설정
		 	//먼저 다 d-none 해제
		 	extDnone();
 			
 			//그다음 cavity 수에 따라 d-none 부여
 			let cavityCntVal = $('#cavityCnt').val();
		 	cavityCntVal *= 1;
		 	
		 	switch(cavityCntVal){
			 	case 1:
		 			$('#blueTh2').addClass('d-none');
		 			$('#th21').addClass('d-none');
		 			$('#th22').addClass('d-none');
		 			$('#th23').addClass('d-none');
		 			extAdmTable.column(6).visible(false);
		 			extAdmTable.column(7).visible(false);
		 			extAdmTable.column(8).visible(false);
		 		case 2:
		 			$('#blueTh3').addClass('d-none');
		 			$('#th31').addClass('d-none');
		 			$('#th32').addClass('d-none');
		 			$('#th33').addClass('d-none');
		 			extAdmTable.column(9).visible(false);
		 			extAdmTable.column(10).visible(false);
		 			extAdmTable.column(11).visible(false);
		 		case 3:
		 			$('#blueTh4').addClass('d-none');
		 			$('#th41').addClass('d-none');
		 			$('#th42').addClass('d-none');
		 			$('#th43').addClass('d-none');
		 			extAdmTable.column(12).visible(false);
		 			extAdmTable.column(13).visible(false);
		 			extAdmTable.column(14).visible(false);
		 		case 4:
		 			$('#blueTh5').addClass('d-none');
		 			$('#th51').addClass('d-none');
		 			$('#th52').addClass('d-none');
		 			$('#th53').addClass('d-none');
		 			extAdmTable.column(15).visible(false);
		 			extAdmTable.column(16).visible(false);
		 			extAdmTable.column(17).visible(false);
		 		case 5:
		 			$('#blueTh6').addClass('d-none');
		 			$('#th61').addClass('d-none');
		 			$('#th62').addClass('d-none');
		 			$('#th63').addClass('d-none');
		 			extAdmTable.column(18).visible(false);
		 			extAdmTable.column(19).visible(false);
		 			extAdmTable.column(20).visible(false);
		 		case 6:
		 			$('#blueTh7').addClass('d-none');
		 			$('#th71').addClass('d-none');
		 			$('#th72').addClass('d-none');
		 			$('#th73').addClass('d-none');
		 			extAdmTable.column(21).visible(false);
		 			extAdmTable.column(22).visible(false);
		 			extAdmTable.column(23).visible(false);
		 		case 7:
		 			$('#blueTh8').addClass('d-none');
		 			$('#th81').addClass('d-none');
		 			$('#th82').addClass('d-none');
		 			$('#th83').addClass('d-none');
		 			extAdmTable.column(24).visible(false);
		 			extAdmTable.column(25).visible(false);
		 			extAdmTable.column(26).visible(false);
		 	}
		}
		
	});


	var inspTypeVal="외관";
	
	//외관 버튼 클릭시
	$('#btnExt').on('click', function(){
		console.log('외관 버튼 클릭');

		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightTableDiv').addClass('d-none');
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		 setTimeout(function(){
			extAdmTable.draw();
		}, 300);

		
	});
	
	//치수 버튼 클릭시
	$('#btnSize').on('click',function(){

		console.log('치수 버튼 클릭');

		inspTypeVal = '치수';

		if (mainGubun == '001') {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){sizeDnone2();});
			
			setTimeout(function(){
				sizeAdmTable2.draw();
				sizeAdmTable2.draw();
			}, 300);
			
			//cavity 수에 따라 보여지는 컬럼 설정
		 	//먼저 다 d-none 해제
		 	sizeDnone2();
 			
 			//그다음 cavity 수에 따라 d-none 부여
 			let cavityCntVal = $('#cavityCnt').val();
		 	cavityCntVal *= 1;
		 	
		 	switch(cavityCntVal){
			 	case 1:
		 			$('#blueThTwo2').addClass('d-none');
		 			$('#thTwo21').addClass('d-none');
		 			$('#thTwo22').addClass('d-none');
		 			$('#thTwo23').addClass('d-none');
		 			sizeAdmTable2.column(8).visible(false);
		 			sizeAdmTable2.column(9).visible(false);
		 			sizeAdmTable2.column(10).visible(false);
		 		case 2:
		 			$('#blueThTwo3').addClass('d-none');
		 			$('#thTwo31').addClass('d-none');
		 			$('#thTwo32').addClass('d-none');
		 			$('#thTwo33').addClass('d-none');
		 			sizeAdmTable2.column(11).visible(false);
		 			sizeAdmTable2.column(12).visible(false);
		 			sizeAdmTable2.column(13).visible(false);
		 		case 3:
		 			$('#blueThTwo4').addClass('d-none');
		 			$('#thTwo41').addClass('d-none');
		 			$('#thTwo42').addClass('d-none');
		 			$('#thTwo43').addClass('d-none');
		 			sizeAdmTable2.column(14).visible(false);
		 			sizeAdmTable2.column(15).visible(false);
		 			sizeAdmTable2.column(16).visible(false);
		 		case 4:
		 			$('#blueThTwo5').addClass('d-none');
		 			$('#thTwo51').addClass('d-none');
		 			$('#thTwo52').addClass('d-none');
		 			$('#thTwo53').addClass('d-none');
		 			sizeAdmTable2.column(17).visible(false);
		 			sizeAdmTable2.column(18).visible(false);
		 			sizeAdmTable2.column(19).visible(false);
		 		case 5:
		 			$('#blueThTwo6').addClass('d-none');
		 			$('#thTwo61').addClass('d-none');
		 			$('#thTwo62').addClass('d-none');
		 			$('#thTwo63').addClass('d-none');
		 			sizeAdmTable2.column(20).visible(false);
		 			sizeAdmTable2.column(21).visible(false);
		 			sizeAdmTable2.column(22).visible(false);
		 		case 6:
		 			$('#blueThTwo7').addClass('d-none');
		 			$('#thTwo71').addClass('d-none');
		 			$('#thTwo72').addClass('d-none');
		 			$('#thTwo73').addClass('d-none');
		 			sizeAdmTable2.column(23).visible(false);
		 			sizeAdmTable2.column(24).visible(false);
		 			sizeAdmTable2.column(25).visible(false);
		 		case 7:
		 			$('#blueThTwo8').addClass('d-none');
		 			$('#thTwo81').addClass('d-none');
		 			$('#thTwo82').addClass('d-none');
		 			$('#thTwo83').addClass('d-none');
		 			sizeAdmTable2.column(26).visible(false);
		 			sizeAdmTable2.column(27).visible(false);
		 			sizeAdmTable2.column(28).visible(false);
		 	}
		 	
		} else if (mainGubun == '002') {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#sizeAdmTable').DataTable().ajax.reload(function(){sizeDnone();});
			
			setTimeout(function(){
				sizeAdmTable.draw();
				sizeAdmTable.draw();
			}, 300);
			
			//cavity 수에 따라 보여지는 컬럼 설정
		 	//먼저 다 d-none 해제
		 	sizeDnone();
 			
 			//그다음 cavity 수에 따라 d-none 부여
 			let cavityCntVal = $('#cavityCnt').val();
		 	cavityCntVal *= 1;
		 	
		 	switch(cavityCntVal){
			 	case 1:
		 			$('#blueThOne2').addClass('d-none');
		 			$('#thOne21').addClass('d-none');
		 			$('#thOne22').addClass('d-none');
		 			$('#thOne23').addClass('d-none');
		 			sizeAdmTable.column(8).visible(false);
		 			sizeAdmTable.column(9).visible(false);
		 			sizeAdmTable.column(10).visible(false);
		 		case 2:
		 			$('#blueThOne3').addClass('d-none');
		 			$('#thOne31').addClass('d-none');
		 			$('#thOne32').addClass('d-none');
		 			$('#thOne33').addClass('d-none');
		 			sizeAdmTable.column(11).visible(false);
		 			sizeAdmTable.column(12).visible(false);
		 			sizeAdmTable.column(13).visible(false);
		 		case 3:
		 			$('#blueThOne4').addClass('d-none');
		 			$('#thOne41').addClass('d-none');
		 			$('#thOne42').addClass('d-none');
		 			$('#thOne43').addClass('d-none');
		 			sizeAdmTable.column(14).visible(false);
		 			sizeAdmTable.column(15).visible(false);
		 			sizeAdmTable.column(16).visible(false);
		 		case 4:
		 			$('#blueThOne5').addClass('d-none');
		 			$('#thOne51').addClass('d-none');
		 			$('#thOne52').addClass('d-none');
		 			$('#thOne53').addClass('d-none');
		 			sizeAdmTable.column(17).visible(false);
		 			sizeAdmTable.column(18).visible(false);
		 			sizeAdmTable.column(19).visible(false);
		 		case 5:
		 			$('#blueThOne6').addClass('d-none');
		 			$('#thOne61').addClass('d-none');
		 			$('#thOne62').addClass('d-none');
		 			$('#thOne63').addClass('d-none');
		 			sizeAdmTable.column(20).visible(false);
		 			sizeAdmTable.column(21).visible(false);
		 			sizeAdmTable.column(22).visible(false);
		 		case 6:
		 			$('#blueThOne7').addClass('d-none');
		 			$('#thOne71').addClass('d-none');
		 			$('#thOne72').addClass('d-none');
		 			$('#thOne73').addClass('d-none');
		 			sizeAdmTable.column(23).visible(false);
		 			sizeAdmTable.column(24).visible(false);
		 			sizeAdmTable.column(25).visible(false);
		 		case 7:
		 			$('#blueThOne8').addClass('d-none');
		 			$('#thOne81').addClass('d-none');
		 			$('#thOne82').addClass('d-none');
		 			$('#thOne83').addClass('d-none');
		 			sizeAdmTable.column(26).visible(false);
		 			sizeAdmTable.column(27).visible(false);
		 			sizeAdmTable.column(28).visible(false);
		 	}
		}
		
	});

	//중량 버튼 클릭시
	$('#btnWeight').on('click',function(){

		console.log('중량 버튼 클릭');

		inspTypeVal = '중량';		

		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');	
		$('#weightTableDiv').removeClass('d-none');
		
		$('#weightTable').DataTable().ajax.reload(function(){weightDnone();});
		
		setTimeout(function(){
			 weightTable.draw();
			 weightTable.draw();
		}, 300);
		
		//cavity 수에 따라 보여지는 컬럼 설정
	 	//먼저 다 d-none 해제
	 	weightDnone();
			
		//그다음 cavity 수에 따라 d-none 부여
		let cavityCntVal = $('#cavityCnt').val();
	 	cavityCntVal *= 1;
	 	
	 	switch(cavityCntVal){
		 	case 1:
	 			$('#blueThWei2').addClass('d-none');
	 			$('#thWei21').addClass('d-none');
	 			$('#thWei22').addClass('d-none');
	 			$('#thWei23').addClass('d-none');
	 			weightTable.column(8).visible(false);
	 			weightTable.column(9).visible(false);
	 			weightTable.column(10).visible(false);
	 		case 2:
	 			$('#blueThWei3').addClass('d-none');
	 			$('#thWei31').addClass('d-none');
	 			$('#thWei32').addClass('d-none');
	 			$('#thWei33').addClass('d-none');
	 			weightTable.column(11).visible(false);
	 			weightTable.column(12).visible(false);
	 			weightTable.column(13).visible(false);
	 		case 3:
	 			$('#blueThWei4').addClass('d-none');
	 			$('#thWei41').addClass('d-none');
	 			$('#thWei42').addClass('d-none');
	 			$('#thWei43').addClass('d-none');
	 			weightTable.column(14).visible(false);
	 			weightTable.column(15).visible(false);
	 			weightTable.column(16).visible(false);
	 		case 4:
	 			$('#blueThWei5').addClass('d-none');
	 			$('#thWei51').addClass('d-none');
	 			$('#thWei52').addClass('d-none');
	 			$('#thWei53').addClass('d-none');
	 			weightTable.column(17).visible(false);
	 			weightTable.column(18).visible(false);
	 			weightTable.column(19).visible(false);
	 		case 5:
	 			$('#blueThWei6').addClass('d-none');
	 			$('#thWei61').addClass('d-none');
	 			$('#thWei62').addClass('d-none');
	 			$('#thWei63').addClass('d-none');
	 			weightTable.column(20).visible(false);
	 			weightTable.column(21).visible(false);
	 			weightTable.column(22).visible(false);
	 		case 6:
	 			$('#blueThWei7').addClass('d-none');
	 			$('#thWei71').addClass('d-none');
	 			$('#thWei72').addClass('d-none');
	 			$('#thWei73').addClass('d-none');
	 			weightTable.column(23).visible(false);
	 			weightTable.column(24).visible(false);
	 			weightTable.column(25).visible(false);
	 		case 7:
	 			$('#blueThWei8').addClass('d-none');
	 			$('#thWei81').addClass('d-none');
	 			$('#thWei82').addClass('d-none');
	 			$('#thWei83').addClass('d-none');
	 			weightTable.column(26).visible(false);
	 			weightTable.column(27).visible(false);
	 			weightTable.column(28).visible(false);
	 	}
	
	});


	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){

		
		$('select[name=inspResult]').attr('disabled',false);

		$('input[name=inspX1]').attr('disabled',false);
		$('input[name=inspX2]').attr('disabled',false);
		$('input[name=inspX3]').attr('disabled',false);
		$('input[name=inspX4]').attr('disabled',false);
		$('input[name=inspX5]').attr('disabled',false);
		$('input[name=inspX6]').attr('disabled',false);
		$('input[name=inspX7]').attr('disabled',false);
		$('input[name=inspX8]').attr('disabled',false);
		$('input[name=inspX9]').attr('disabled',false);
		$('input[name=inspX10]').attr('disabled',false);
		$('input[name=inspX11]').attr('disabled',false);
		$('input[name=inspX12]').attr('disabled',false);
		$('input[name=inspX13]').attr('disabled',false);
		$('input[name=inspX14]').attr('disabled',false);
		$('input[name=inspX15]').attr('disabled',false);
		$('input[name=inspX16]').attr('disabled',false);
		$('input[name=inspX17]').attr('disabled',false);
		$('input[name=inspX18]').attr('disabled',false);
		$('input[name=inspX19]').attr('disabled',false);
		$('input[name=inspX20]').attr('disabled',false);
		$('input[name=inspX21]').attr('disabled',false);
		$('input[name=inspX22]').attr('disabled',false);
		$('input[name=inspX23]').attr('disabled',false);
		$('input[name=inspX24]').attr('disabled',false);
		
		$('select[name=inspResult1]').attr('disabled',false);
		$('select[name=inspResult2]').attr('disabled',false);
		$('select[name=inspResult3]').attr('disabled',false);
		$('select[name=inspResult4]').attr('disabled',false);
		$('select[name=inspResult5]').attr('disabled',false);
		$('select[name=inspResult6]').attr('disabled',false);
		$('select[name=inspResult7]').attr('disabled',false);
		$('select[name=inspResult8]').attr('disabled',false);
		$('select[name=inspResult9]').attr('disabled',false);
		$('select[name=inspResult10]').attr('disabled',false);
		$('select[name=inspResult11]').attr('disabled',false);
		$('select[name=inspResult12]').attr('disabled',false);
		$('select[name=inspResult13]').attr('disabled',false);
		$('select[name=inspResult14]').attr('disabled',false);
		$('select[name=inspResult15]').attr('disabled',false);
		$('select[name=inspResult16]').attr('disabled',false);
		$('select[name=inspResult17]').attr('disabled',false);
		$('select[name=inspResult18]').attr('disabled',false);
		$('select[name=inspResult19]').attr('disabled',false);
		$('select[name=inspResult20]').attr('disabled',false);
		$('select[name=inspResult21]').attr('disabled',false);
		$('select[name=inspResult22]').attr('disabled',false);
		$('select[name=inspResult23]').attr('disabled',false);
		$('select[name=inspResult24]').attr('disabled',false);

		//focus&select
		$('#extAdmTable select[name=inspResult1').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).select();
		$('#sizeAdmTable2 input[name=inspX1]').eq(0).focus();
		$('#sizeAdmTable2 input[name=inspX1]').eq(0).select();
		$('#weightTable input[name=inspX1]').eq(0).focus();
		$('#weightTable input[name=inspX1]').eq(0).select();
	});


	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array();
		
		if (inspTypeVal == "외관") {
			$('#extAdmTable tbody tr').each(function(index, item) {

				var rowData = new Object();

				rowData.inspResultGubun = "002";
				rowData.inspSourceNo = workOrdNo;
				rowData.inspSourceSubNo = workEndTime;
				rowData.inspCd = extAdmTable.row(index).data().inspCd;
				rowData.inspType = extAdmTable.row(index).data().inspType;
				rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
				rowData.inspectGubun = chojungjong;
				
				var resultYCnt=0;
				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				//최종판정
				for(var i = 1; i <= cavityCntVal; i++){
					if($(this).find('td select[name=inspResult'+i+']').val()=="001"){
						resultYCnt++;
					}
					if($(this).find('td select[name=inspResult'+i+']').val()==""){
						resultYCnt=-1;
						break;
					}
				}
				if(resultYCnt == cavityCntVal){
					rowData.inspResult = "001";	//합격
				}else if(resultYCnt == -1){
					rowData.inspResult = "";	//미판정
				}else{
					rowData.inspResult = "002";	//불합격
				}

				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				rowData.inspX11 = '';
				rowData.inspX12 = '';
				rowData.inspX13 = '';
				rowData.inspX14 = '';
				rowData.inspX15 = '';
				rowData.inspX16 = '';
				rowData.inspX17 = '';
				rowData.inspX18 = '';
				rowData.inspX19 = '';
				rowData.inspX20 = '';
				rowData.inspX21 = '';
				rowData.inspX22 = '';
				rowData.inspX23 = '';
				rowData.inspX24 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch(cavityCntVal/3){
					case 8:
						rowData.inspX22 = $(this).find('td select[name=inspResult22]').val();
						rowData.inspX23 = $(this).find('td select[name=inspResult23]').val();
						rowData.inspX24 = $(this).find('td select[name=inspResult24]').val();
					case 7:
						rowData.inspX19 = $(this).find('td select[name=inspResult19]').val();
						rowData.inspX20 = $(this).find('td select[name=inspResult20]').val();
						rowData.inspX21 = $(this).find('td select[name=inspResult21]').val();
					case 6:
						rowData.inspX16 = $(this).find('td select[name=inspResult16]').val();
						rowData.inspX17 = $(this).find('td select[name=inspResult17]').val();
						rowData.inspX18 = $(this).find('td select[name=inspResult18]').val();
					case 5:
						rowData.inspX13 = $(this).find('td select[name=inspResult13]').val();
						rowData.inspX14 = $(this).find('td select[name=inspResult14]').val();
						rowData.inspX15 = $(this).find('td select[name=inspResult15]').val();
					case 4:
						rowData.inspX10 = $(this).find('td select[name=inspResult10]').val();
						rowData.inspX11 = $(this).find('td select[name=inspResult11]').val();
						rowData.inspX12 = $(this).find('td select[name=inspResult12]').val();
					case 3:
						rowData.inspX7 = $(this).find('td select[name=inspResult7]').val();
						rowData.inspX8 = $(this).find('td select[name=inspResult8]').val();
						rowData.inspX9 = $(this).find('td select[name=inspResult9]').val();
					case 2:
						rowData.inspX4 = $(this).find('td select[name=inspResult4]').val();
						rowData.inspX5 = $(this).find('td select[name=inspResult5]').val();
						rowData.inspX6 = $(this).find('td select[name=inspResult6]').val();
					case 1:
						rowData.inspX1 = $(this).find('td select[name=inspResult1]').val();
						rowData.inspX2 = $(this).find('td select[name=inspResult2]').val();
						rowData.inspX3 = $(this).find('td select[name=inspResult3]').val();
				}
				
				rowData.inspPass = $(this).find('td select[name=inspResult]').val();
				
				
				dataArray.push(rowData);
				console.log(rowData)
			});
		} else if (inspTypeVal == "치수") {
			if (mainGubun == "001") {
				$('#sizeAdmTable2 tbody tr').each(function(index, item) {

					var rowData = new Object();
					let pass = true;
					let passCheck = true;
					rowData.inspResultGubun = "002";
					rowData.inspSourceNo = workOrdNo;
					rowData.inspSourceSubNo = workEndTime;
					rowData.inspCd = sizeAdmTable2.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable2.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable2.row(index).data().inspSeq;
					rowData.inspectGubun = chojungjong;

					let min = sizeAdmTable2.row(index).data().inspStandLower;
					let max = sizeAdmTable2.row(index).data().inspStandUpper;
					
					var resultYCnt = 0;
					let cavityCntVal = $('#cavityCnt').val();
					cavityCntVal *= 3;
					
					for (var i = 1; i <= cavityCntVal; i++) {
						var inspData= $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

						if(!((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max)))){
							resultYCnt++;
						}
						if(inspData==null || inspData==""){
							resultYCnt=-1;
							break;
						}
					}
					if (resultYCnt == cavityCntVal) {
						rowData.inspResult = "001";	//합격
					} else if (resultYCnt == -1) {
						rowData.inspResult = "";	//미판정
					} else {
						rowData.inspResult = "002";	//불합격
					}
					
					//먼저 초기화
					rowData.inspX1 = '';
					rowData.inspX2 = '';
					rowData.inspX3 = '';
					rowData.inspX4 = '';
					rowData.inspX5 = '';
					rowData.inspX6 = '';
					rowData.inspX7 = '';
					rowData.inspX8 = '';
					rowData.inspX9 = '';
					rowData.inspX10 = '';
					rowData.inspX11 = '';
					rowData.inspX12 = '';
					rowData.inspX13 = '';
					rowData.inspX14 = '';
					rowData.inspX15 = '';
					rowData.inspX16 = '';
					rowData.inspX17 = '';
					rowData.inspX18 = '';
					rowData.inspX19 = '';
					rowData.inspX20 = '';
					rowData.inspX21 = '';
					rowData.inspX22 = '';
					rowData.inspX23 = '';
					rowData.inspX24 = '';
					
					//그 후 cavity 값에 따라 값을 찾아서 입력
					switch(cavityCntVal/3){
						case 8:
							rowData.inspX22 = $(this).find('td input[name=inspX22]').val();
							rowData.inspX23 = $(this).find('td input[name=inspX23]').val();
							rowData.inspX24 = $(this).find('td input[name=inspX24]').val();
						case 7:
							rowData.inspX19 = $(this).find('td input[name=inspX19]').val();
							rowData.inspX20 = $(this).find('td input[name=inspX20]').val();
							rowData.inspX21 = $(this).find('td input[name=inspX21]').val();
						case 6:
							rowData.inspX16 = $(this).find('td input[name=inspX16]').val();
							rowData.inspX17 = $(this).find('td input[name=inspX17]').val();
							rowData.inspX18 = $(this).find('td input[name=inspX18]').val();
						case 5:
							rowData.inspX13 = $(this).find('td input[name=inspX13]').val();
							rowData.inspX14 = $(this).find('td input[name=inspX14]').val();
							rowData.inspX15 = $(this).find('td input[name=inspX15]').val();
						case 4:
							rowData.inspX10 = $(this).find('td input[name=inspX10]').val();
							rowData.inspX11 = $(this).find('td input[name=inspX11]').val();
							rowData.inspX12 = $(this).find('td input[name=inspX12]').val();
						case 3:
							rowData.inspX7 = $(this).find('td input[name=inspX7]').val();
							rowData.inspX8 = $(this).find('td input[name=inspX8]').val();
							rowData.inspX9 = $(this).find('td input[name=inspX9]').val();
						case 2:
							rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
							rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
							rowData.inspX6 = $(this).find('td input[name=inspX6]').val();
						case 1:
							rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
							rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
							rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					}

					if($(this).find('td input[name=inspX1]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX1]').val())) || (parseFloat($(this).find('td input[name=inspX1]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}
					}
					if($(this).find('td input[name=inspX2]').val() != ""){
						passCheck = false;
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX2]').val())) || (parseFloat($(this).find('td input[name=inspX2]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX3]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX3]').val())) || (parseFloat($(this).find('td input[name=inspX3]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX4]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX4]').val())) || (parseFloat($(this).find('td input[name=inspX4]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX5]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX5]').val())) || (parseFloat($(this).find('td input[name=inspX5]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX6]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX6]').val())) || (parseFloat($(this).find('td input[name=inspX6]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX7]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX7]').val())) || (parseFloat($(this).find('td input[name=inspX7]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX8]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX8]').val())) || (parseFloat($(this).find('td input[name=inspX8]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX9]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX9]').val())) || (parseFloat($(this).find('td input[name=inspX9]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX10]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX10]').val())) || (parseFloat($(this).find('td input[name=inspX10]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX11]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX11]').val())) || (parseFloat($(this).find('td input[name=inspX11]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX12]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX12]').val())) || (parseFloat($(this).find('td input[name=inspX12]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX13]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX13]').val())) || (parseFloat($(this).find('td input[name=inspX13]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX14]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX14]').val())) || (parseFloat($(this).find('td input[name=inspX14]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX15]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX15]').val())) || (parseFloat($(this).find('td input[name=inspX15]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX16]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX16]').val())) || (parseFloat($(this).find('td input[name=inspX16]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX17]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX17]').val())) || (parseFloat($(this).find('td input[name=inspX17]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX18]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX18]').val())) || (parseFloat($(this).find('td input[name=inspX18]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX19]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX19]').val())) || (parseFloat($(this).find('td input[name=inspX19]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX20]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX20]').val())) || (parseFloat($(this).find('td input[name=inspX20]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX21]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX21]').val())) || (parseFloat($(this).find('td input[name=inspX21]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX22]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX22]').val())) || (parseFloat($(this).find('td input[name=inspX22]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX23]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX23]').val())) || (parseFloat($(this).find('td input[name=inspX23]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX24]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX24]').val())) || (parseFloat($(this).find('td input[name=inspX24]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}

					if (passCheck) {
						rowData.inspPass = '';
					} else {
						if (pass) {
							rowData.inspPass ='001';
						} else {
							rowData.inspPass ='002';
						}
					}	
				
					dataArray.push(rowData);
					console.log(rowData)
				});
			} else {
				$('#sizeAdmTable tbody tr').each(function(index, item) {

					var rowData = new Object();
					let pass = true;
					let passCheck = true;
					rowData.inspResultGubun = "002";
					rowData.inspSourceNo = workOrdNo;
					rowData.inspSourceSubNo = workEndTime;
					rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
					rowData.inspType = sizeAdmTable.row(index).data().inspType;
					rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
					rowData.inspectGubun = chojungjong;

					let min = sizeAdmTable.row(index).data().inspStandLower;
					let max = sizeAdmTable.row(index).data().inspStandUpper;
					
					var resultYCnt = 0;
					let cavityCntVal = $('#cavityCnt').val();
					cavityCntVal *= 3;
					
					for (var i = 1; i <= cavityCntVal; i++) {
						var inspData= $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

						if(!((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max)))){
							resultYCnt++;
						}
						if(inspData==null || inspData==""){
							resultYCnt=-1;
							break;
						}
					}
					
					if (resultYCnt == cavityCntVal) {
						rowData.inspResult = "001";	//합격
					} else if (resultYCnt == -1) {
						rowData.inspResult = "";	//미판정
					} else {
						rowData.inspResult = "002";	//불합격
					}
					
					//먼저 초기화
					rowData.inspX1 = '';
					rowData.inspX2 = '';
					rowData.inspX3 = '';
					rowData.inspX4 = '';
					rowData.inspX5 = '';
					rowData.inspX6 = '';
					rowData.inspX7 = '';
					rowData.inspX8 = '';
					rowData.inspX9 = '';
					rowData.inspX10 = '';
					rowData.inspX11 = '';
					rowData.inspX12 = '';
					rowData.inspX13 = '';
					rowData.inspX14 = '';
					rowData.inspX15 = '';
					rowData.inspX16 = '';
					rowData.inspX17 = '';
					rowData.inspX18 = '';
					rowData.inspX19 = '';
					rowData.inspX20 = '';
					rowData.inspX21 = '';
					rowData.inspX22 = '';
					rowData.inspX23 = '';
					rowData.inspX24 = '';
					
					//그 후 cavity 값에 따라 값을 찾아서 입력
					switch(cavityCntVal/3){
						case 8:
							rowData.inspX22 = $(this).find('td input[name=inspX22]').val();
							rowData.inspX23 = $(this).find('td input[name=inspX23]').val();
							rowData.inspX24 = $(this).find('td input[name=inspX24]').val();
						case 7:
							rowData.inspX19 = $(this).find('td input[name=inspX19]').val();
							rowData.inspX20 = $(this).find('td input[name=inspX20]').val();
							rowData.inspX21 = $(this).find('td input[name=inspX21]').val();
						case 6:
							rowData.inspX16 = $(this).find('td input[name=inspX16]').val();
							rowData.inspX17 = $(this).find('td input[name=inspX17]').val();
							rowData.inspX18 = $(this).find('td input[name=inspX18]').val();
						case 5:
							rowData.inspX13 = $(this).find('td input[name=inspX13]').val();
							rowData.inspX14 = $(this).find('td input[name=inspX14]').val();
							rowData.inspX15 = $(this).find('td input[name=inspX15]').val();
						case 4:
							rowData.inspX10 = $(this).find('td input[name=inspX10]').val();
							rowData.inspX11 = $(this).find('td input[name=inspX11]').val();
							rowData.inspX12 = $(this).find('td input[name=inspX12]').val();
						case 3:
							rowData.inspX7 = $(this).find('td input[name=inspX7]').val();
							rowData.inspX8 = $(this).find('td input[name=inspX8]').val();
							rowData.inspX9 = $(this).find('td input[name=inspX9]').val();
						case 2:
							rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
							rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
							rowData.inspX6 = $(this).find('td input[name=inspX6]').val();
						case 1:
							rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
							rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
							rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					}
					
					if($(this).find('td input[name=inspX1]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX1]').val())) || (parseFloat($(this).find('td input[name=inspX1]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}
					}
					if($(this).find('td input[name=inspX2]').val() != ""){
						passCheck = false;
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX2]').val())) || (parseFloat($(this).find('td input[name=inspX2]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX3]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX3]').val())) || (parseFloat($(this).find('td input[name=inspX3]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX4]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX4]').val())) || (parseFloat($(this).find('td input[name=inspX4]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX5]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX5]').val())) || (parseFloat($(this).find('td input[name=inspX5]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX6]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX6]').val())) || (parseFloat($(this).find('td input[name=inspX6]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX7]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX7]').val())) || (parseFloat($(this).find('td input[name=inspX7]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX8]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX8]').val())) || (parseFloat($(this).find('td input[name=inspX8]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX9]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX9]').val())) || (parseFloat($(this).find('td input[name=inspX9]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX10]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX10]').val())) || (parseFloat($(this).find('td input[name=inspX10]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX11]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX11]').val())) || (parseFloat($(this).find('td input[name=inspX11]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX12]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX12]').val())) || (parseFloat($(this).find('td input[name=inspX12]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX13]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX13]').val())) || (parseFloat($(this).find('td input[name=inspX13]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX14]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX14]').val())) || (parseFloat($(this).find('td input[name=inspX14]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX15]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX15]').val())) || (parseFloat($(this).find('td input[name=inspX15]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX16]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX16]').val())) || (parseFloat($(this).find('td input[name=inspX16]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX17]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX17]').val())) || (parseFloat($(this).find('td input[name=inspX17]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX18]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX18]').val())) || (parseFloat($(this).find('td input[name=inspX18]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX19]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX19]').val())) || (parseFloat($(this).find('td input[name=inspX19]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX20]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX20]').val())) || (parseFloat($(this).find('td input[name=inspX20]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX21]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX21]').val())) || (parseFloat($(this).find('td input[name=inspX21]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX22]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX22]').val())) || (parseFloat($(this).find('td input[name=inspX22]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX23]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX23]').val())) || (parseFloat($(this).find('td input[name=inspX23]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}
					if($(this).find('td input[name=inspX24]').val() != ""){
						passCheck = false;
						if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX24]').val())) || (parseFloat($(this).find('td input[name=inspX24]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
							pass = false;
						}	
					}

					if(passCheck){
						rowData.inspPass ='';
					} else{
						if(pass){
							rowData.inspPass ='001';
						} else{
							rowData.inspPass ='002';
						}
						
					}	
					dataArray.push(rowData);
					console.log(rowData)
				});
			}
		} else if (inspTypeVal == "중량") {
			$('#weightTable tbody tr').each(function(index, item) {

				var rowData = new Object();
				let pass = true;
				let passCheck = true;
				rowData.inspResultGubun = "002";
				rowData.inspSourceNo = workOrdNo;
				rowData.inspSourceSubNo = workEndTime;
				rowData.inspCd = weightTable.row(index).data().inspCd;
				rowData.inspType = weightTable.row(index).data().inspType;
				rowData.inspSeq = weightTable.row(index).data().inspSeq;
				rowData.inspectGubun = chojungjong;
				
				let min = weightTable.row(index).data().inspStandLower;
				let max = weightTable.row(index).data().inspStandUpper;
				
				var resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for (var i = 1; i <= cavityCntVal; i++) {
					var inspData= $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

					if(!((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max)))){
						resultYCnt++;
					}
					if(inspData==null || inspData==""){
						resultYCnt=-1;
						break;
					}
				}
				
				if (resultYCnt == cavityCntVal) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1) {
					rowData.inspResult = "";	//미판정
				} else {
					rowData.inspResult = "002";	//불합격
				}
				
				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				rowData.inspX11 = '';
				rowData.inspX12 = '';
				rowData.inspX13 = '';
				rowData.inspX14 = '';
				rowData.inspX15 = '';
				rowData.inspX16 = '';
				rowData.inspX17 = '';
				rowData.inspX18 = '';
				rowData.inspX19 = '';
				rowData.inspX20 = '';
				rowData.inspX21 = '';
				rowData.inspX22 = '';
				rowData.inspX23 = '';
				rowData.inspX24 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch(cavityCntVal/3){
					case 8:
						rowData.inspX22 = $(this).find('td input[name=inspX22]').val();
						rowData.inspX23 = $(this).find('td input[name=inspX23]').val();
						rowData.inspX24 = $(this).find('td input[name=inspX24]').val();
					case 7:
						rowData.inspX19 = $(this).find('td input[name=inspX19]').val();
						rowData.inspX20 = $(this).find('td input[name=inspX20]').val();
						rowData.inspX21 = $(this).find('td input[name=inspX21]').val();
					case 6:
						rowData.inspX16 = $(this).find('td input[name=inspX16]').val();
						rowData.inspX17 = $(this).find('td input[name=inspX17]').val();
						rowData.inspX18 = $(this).find('td input[name=inspX18]').val();
					case 5:
						rowData.inspX13 = $(this).find('td input[name=inspX13]').val();
						rowData.inspX14 = $(this).find('td input[name=inspX14]').val();
						rowData.inspX15 = $(this).find('td input[name=inspX15]').val();
					case 4:
						rowData.inspX10 = $(this).find('td input[name=inspX10]').val();
						rowData.inspX11 = $(this).find('td input[name=inspX11]').val();
						rowData.inspX12 = $(this).find('td input[name=inspX12]').val();
					case 3:
						rowData.inspX7 = $(this).find('td input[name=inspX7]').val();
						rowData.inspX8 = $(this).find('td input[name=inspX8]').val();
						rowData.inspX9 = $(this).find('td input[name=inspX9]').val();
					case 2:
						rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
						rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
						rowData.inspX6 = $(this).find('td input[name=inspX6]').val();
					case 1:
						rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
						rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
						rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
				}
				
				if($(this).find('td input[name=inspX1]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX1]').val())) || (parseFloat($(this).find('td input[name=inspX1]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}
				}
				if($(this).find('td input[name=inspX2]').val() != ""){
					passCheck = false;
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX2]').val())) || (parseFloat($(this).find('td input[name=inspX2]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX3]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX3]').val())) || (parseFloat($(this).find('td input[name=inspX3]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX4]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX4]').val())) || (parseFloat($(this).find('td input[name=inspX4]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX5]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX5]').val())) || (parseFloat($(this).find('td input[name=inspX5]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX6]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX6]').val())) || (parseFloat($(this).find('td input[name=inspX6]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX7]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX7]').val())) || (parseFloat($(this).find('td input[name=inspX7]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX8]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX8]').val())) || (parseFloat($(this).find('td input[name=inspX8]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX9]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX9]').val())) || (parseFloat($(this).find('td input[name=inspX9]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX10]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX10]').val())) || (parseFloat($(this).find('td input[name=inspX10]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX11]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX11]').val())) || (parseFloat($(this).find('td input[name=inspX11]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX12]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX12]').val())) || (parseFloat($(this).find('td input[name=inspX12]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX13]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX13]').val())) || (parseFloat($(this).find('td input[name=inspX13]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX14]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX14]').val())) || (parseFloat($(this).find('td input[name=inspX14]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX15]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX15]').val())) || (parseFloat($(this).find('td input[name=inspX15]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX16]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX16]').val())) || (parseFloat($(this).find('td input[name=inspX16]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX17]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX17]').val())) || (parseFloat($(this).find('td input[name=inspX17]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX18]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX18]').val())) || (parseFloat($(this).find('td input[name=inspX18]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX19]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX19]').val())) || (parseFloat($(this).find('td input[name=inspX19]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX20]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX20]').val())) || (parseFloat($(this).find('td input[name=inspX20]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX21]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX21]').val())) || (parseFloat($(this).find('td input[name=inspX21]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX22]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX22]').val())) || (parseFloat($(this).find('td input[name=inspX22]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX23]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX23]').val())) || (parseFloat($(this).find('td input[name=inspX23]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX24]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX24]').val())) || (parseFloat($(this).find('td input[name=inspX24]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}

				if(passCheck){
					rowData.inspPass ='';
				} else{
					if(pass){
						rowData.inspPass ='001';
					} else{
						rowData.inspPass ='002';
					}
					
				}	
				dataArray.push(rowData);
				console.log(rowData)
			});
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspPrcResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("등록되었습니다.");

						$('select[name=inspResult]').attr('disabled',true);
						$('input[name=inspX1]').attr('disabled',true);
						$('input[name=inspX2]').attr('disabled',true);
						$('input[name=inspX3]').attr('disabled',true);
						$('input[name=inspX4]').attr('disabled',true);
						$('input[name=inspX5]').attr('disabled',true);
						$('input[name=inspX6]').attr('disabled',true);
						$('input[name=inspX7]').attr('disabled',true);
						$('input[name=inspX8]').attr('disabled',true);
						$('input[name=inspX9]').attr('disabled',true);
						$('input[name=inspX10]').attr('disabled',true);
						$('input[name=inspX11]').attr('disabled',true);
						$('input[name=inspX12]').attr('disabled',true);
						$('input[name=inspX13]').attr('disabled',true);
						$('input[name=inspX14]').attr('disabled',true);
						$('input[name=inspX15]').attr('disabled',true);
						$('input[name=inspX16]').attr('disabled',true);
						$('input[name=inspX17]').attr('disabled',true);
						$('input[name=inspX18]').attr('disabled',true);
						$('input[name=inspX19]').attr('disabled',true);
						$('input[name=inspX20]').attr('disabled',true);
						$('input[name=inspX21]').attr('disabled',true);
						$('input[name=inspX22]').attr('disabled',true);
						$('input[name=inspX23]').attr('disabled',true);
						$('input[name=inspX24]').attr('disabled',true);
						
						$('select[name=inspResult1]').attr('disabled',true);
						$('select[name=inspResult2]').attr('disabled',true);
						$('select[name=inspResult3]').attr('disabled',true);
						$('select[name=inspResult4]').attr('disabled',true);
						$('select[name=inspResult5]').attr('disabled',true);
						$('select[name=inspResult6]').attr('disabled',true);
						$('select[name=inspResult7]').attr('disabled',true);
						$('select[name=inspResult8]').attr('disabled',true);
						$('select[name=inspResult9]').attr('disabled',true);
						$('select[name=inspResult10]').attr('disabled',true);
						$('select[name=inspResult11]').attr('disabled',true);
						$('select[name=inspResult12]').attr('disabled',true);
						$('select[name=inspResult13]').attr('disabled',true);
						$('select[name=inspResult14]').attr('disabled',true);
						$('select[name=inspResult15]').attr('disabled',true);
						$('select[name=inspResult16]').attr('disabled',true);
						$('select[name=inspResult17]').attr('disabled',true);
						$('select[name=inspResult18]').attr('disabled',true);
						$('select[name=inspResult19]').attr('disabled',true);
						$('select[name=inspResult20]').attr('disabled',true);
						$('select[name=inspResult21]').attr('disabled',true);
						$('select[name=inspResult22]').attr('disabled',true);
						$('select[name=inspResult23]').attr('disabled',true);
						$('select[name=inspResult24]').attr('disabled',true);

						$('#itemPrcssCompleteAdmTable').DataTable().ajax.reload();
						
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});

	
	
	//외관 목록
	let extAdmTable = $('#extAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : 100000000,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 3
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "002"},
				'inspSourceNo' : function(){return workOrdNo;},
				'inspSourceSubNo' : function(){return workEndTime;},				
				'inspGubun' : function(){return "002"},
				'inspType' : function(){return "001";},
				'itemSeq' : function(){return itemSeq;},
				'inspectGubun'	: function(){return chojungjong;},
				
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{//기준
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//CVT.1 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.1 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="002"){
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.1 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="003"){
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="004"){
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="005"){
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult11", row['inspX11'], row, meta, "11");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult11", row['inspX11'], row, meta, "11");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult11", row['inspX11'], row, meta, "11");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult12", row['inspX12'], row, meta, "12");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult12", row['inspX12'], row, meta, "12");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult12", row['inspX12'], row, meta, "12");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult13", row['inspX13'], row, meta, "13");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult13", row['inspX13'], row, meta, "13");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult13", row['inspX13'], row, meta, "13");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult14", row['inspX14'], row, meta, "14");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult14", row['inspX14'], row, meta, "14");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult14", row['inspX14'], row, meta, "14");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult15", row['inspX15'], row, meta, "15");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult15", row['inspX15'], row, meta, "15");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult15", row['inspX15'], row, meta, "15");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult16", row['inspX16'], row, meta, "16");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult16", row['inspX16'], row, meta, "16");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult16", row['inspX16'], row, meta, "16");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult17", row['inspX17'], row, meta, "17");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult17", row['inspX17'], row, meta, "17");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult17", row['inspX17'], row, meta, "17");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult18", row['inspX18'], row, meta, "18");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult18", row['inspX18'], row, meta, "18");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult18", row['inspX18'], row, meta, "18");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult19", row['inspX19'], row, meta, "19");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult19", row['inspX19'], row, meta, "19");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult19", row['inspX19'], row, meta, "19");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult20", row['inspX20'], row, meta, "20");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult20", row['inspX20'], row, meta, "20");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult20", row['inspX20'], row, meta, "20");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult21", row['inspX21'], row, meta, "21");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult21", row['inspX21'], row, meta, "21");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult21", row['inspX21'], row, meta, "21");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult22", row['inspX22'], row, meta, "22");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult22", row['inspX22'], row, meta, "22");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult22", row['inspX22'], row, meta, "22");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult23", row['inspX23'], row, meta, "23");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult23", row['inspX23'], row, meta, "23");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult23", row['inspX23'], row, meta, "23");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult24", row['inspX24'], row, meta, "24");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult24", row['inspX24'], row, meta, "24");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult24", row['inspX24'], row, meta, "24");
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ 
		]
	});
	
	//치수 목록 - 레이저
	let sizeAdmTable2 = $('#sizeAdmTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : 100000000,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 5
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "002"},
				'inspSourceNo' : function(){return workOrdNo;},
				'inspSourceSubNo' : function(){return workEndTime;},				
				'inspGubun' : function(){return "002"},
				'inspType' : function(){return "002";},
				'itemSeq' : function(){return itemSeq;},
				'inspectGubun'	: function(){return chojungjong;},
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//기준 - 하한
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.2 - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s2-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s2\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s2-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s2\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s2-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s2\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s2-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s2\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s2-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s2\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s2-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s2\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s2-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s2\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s2-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s2\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s2-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s2\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s2-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s2\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s2-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s2\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s2-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s2\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s2-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s2\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s2-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s2\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s2-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s2\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s2-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s2\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s2-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s2\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s2-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s2\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s2-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s2\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s2-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s2\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s2-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s2\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s2-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s2\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s2-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s2\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s2-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s2\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s2-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s2\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s2-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s2\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s2-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s2\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s2-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s2\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s2-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s2\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s2-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s2\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s2-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s2\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s2-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s2\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s2-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s2\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s2-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s2\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s2-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s2\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s2-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s2\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s2-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s2\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s2-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s2\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
			}, 
		],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for(var r = 1; r <= cavityCntVal; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					
					switch(r){
						case 1:
							inspResult = api.row(i).data().inspX1;
							break;
						case 2:
							inspResult = api.row(i).data().inspX2;
							break;
						case 3:
							inspResult = api.row(i).data().inspX3;
							break;
						case 4:
							inspResult = api.row(i).data().inspX4;
							break;
						case 5:
							inspResult = api.row(i).data().inspX5;
							break;
						case 6:
							inspResult = api.row(i).data().inspX6;
							break;
						case 7:
							inspResult = api.row(i).data().inspX7;
							break;
						case 8:
							inspResult = api.row(i).data().inspX8;
							break;
						case 9:
							inspResult = api.row(i).data().inspX9;
							break;
						case 10:
							inspResult = api.row(i).data().inspX10;
							break;
						case 11:
							inspResult = api.row(i).data().inspX11;
							break;
						case 12:
							inspResult = api.row(i).data().inspX12;
							break;
						case 13:
							inspResult = api.row(i).data().inspX13;
							break;
						case 14:
							inspResult = api.row(i).data().inspX14;
							break;
						case 15:
							inspResult = api.row(i).data().inspX15;
							break;
						case 16:
							inspResult = api.row(i).data().inspX16;
							break;
						case 17:
							inspResult = api.row(i).data().inspX17;
							break;
						case 18:
							inspResult = api.row(i).data().inspX18;
							break;
						case 19:
							inspResult = api.row(i).data().inspX19;
							break;
						case 20:
							inspResult = api.row(i).data().inspX20;
							break;
						case 21:
							inspResult = api.row(i).data().inspX21;
							break;
						case 22:
							inspResult = api.row(i).data().inspX22;
							break;
						case 23:
							inspResult = api.row(i).data().inspX23;
							break;
						case 24:
							inspResult = api.row(i).data().inspX24;
							break;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('input[name='+rString+']').eq(i).css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('input[name='+rString+']').eq(i).css('background','#92d050');
					}else{
						$('input[name='+rString+']').eq(i).css('background','#f6f7f9');
					}
				}
			} 
		}
	});
	
	//치수 목록 - 봉제
	let sizeAdmTable = $('#sizeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : 100000000,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 5
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "002"},
				'inspSourceNo' : function(){return workOrdNo;},
				'inspSourceSubNo' : function(){return workEndTime;},				
				'inspGubun' : function(){return "002"},
				'inspType' : function(){return "002";},
				'itemSeq' : function(){return itemSeq;},
				'inspectGubun'	: function(){return chojungjong;},
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
// 			{
// 				data : 'inspSpc',
// 				render : function(data, type, row, meta) {
// 					if (data == null) {
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="min-width : 100%" />';
// 					} else if (data == '001') {
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" checked disabled/>';
// 					} else {
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" disabled/>';
// 					}
// 				}
// 			}, 
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//기준 - 하한
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},  
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT. - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
			}, 
		],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for(var r = 1; r <= cavityCntVal; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					
					switch(r){
						case 1:
							inspResult = api.row(i).data().inspX1;
							break;
						case 2:
							inspResult = api.row(i).data().inspX2;
							break;
						case 3:
							inspResult = api.row(i).data().inspX3;
							break;
						case 4:
							inspResult = api.row(i).data().inspX4;
							break;
						case 5:
							inspResult = api.row(i).data().inspX5;
							break;
						case 6:
							inspResult = api.row(i).data().inspX6;
							break;
						case 7:
							inspResult = api.row(i).data().inspX7;
							break;
						case 8:
							inspResult = api.row(i).data().inspX8;
							break;
						case 9:
							inspResult = api.row(i).data().inspX9;
							break;
						case 10:
							inspResult = api.row(i).data().inspX10;
							break;
						case 11:
							inspResult = api.row(i).data().inspX11;
							break;
						case 12:
							inspResult = api.row(i).data().inspX12;
							break;
						case 13:
							inspResult = api.row(i).data().inspX13;
							break;
						case 14:
							inspResult = api.row(i).data().inspX14;
							break;
						case 15:
							inspResult = api.row(i).data().inspX15;
							break;
						case 16:
							inspResult = api.row(i).data().inspX16;
							break;
						case 17:
							inspResult = api.row(i).data().inspX17;
							break;
						case 18:
							inspResult = api.row(i).data().inspX18;
							break;
						case 19:
							inspResult = api.row(i).data().inspX19;
							break;
						case 20:
							inspResult = api.row(i).data().inspX20;
							break;
						case 21:
							inspResult = api.row(i).data().inspX21;
							break;
						case 22:
							inspResult = api.row(i).data().inspX22;
							break;
						case 23:
							inspResult = api.row(i).data().inspX23;
							break;
						case 24:
							inspResult = api.row(i).data().inspX24;
							break;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#92d050');
					}else{
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#f6f7f9');
					}
				}
			} 
		}
	});

	//중량 목록
	let weightTable = $('#weightTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : 100000000,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 5
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' 	: function(){return "002"},
				'inspSourceNo' 		: function(){return workOrdNo;},
				'inspSourceSubNo' 	: function(){return workEndTime;},				
				'inspGubun'			: function(){return "002"},
				'inspType' 			: function(){return "003";},
				'itemSeq' 			: function(){return itemSeq;},	
				'inspectGubun'	: function(){return chojungjong;},			
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//기준 - 하한
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="w-inspX2-'+meta.row+'" onkeydown="moveFocus(\'w\',2,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="w-inspX2-'+meta.row+'" onkeydown="moveFocus(\'w\',2,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="w-inspX3-'+meta.row+'" onkeydown="moveFocus(\'w\',3,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="w-inspX3-'+meta.row+'" onkeydown="moveFocus(\'w\',3,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="w-inspX4-'+meta.row+'" onkeydown="moveFocus(\'w\',4,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="w-inspX4-'+meta.row+'" onkeydown="moveFocus(\'w\',4,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="w-inspX5-'+meta.row+'" onkeydown="moveFocus(\'w\',5,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="w-inspX5-'+meta.row+'" onkeydown="moveFocus(\'w\',5,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.2 - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="w-inspX6-'+meta.row+'" onkeydown="moveFocus(\'w\',6,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="w-inspX6-'+meta.row+'" onkeydown="moveFocus(\'w\',6,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="w-inspX7-'+meta.row+'" onkeydown="moveFocus(\'w\',7,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="w-inspX7-'+meta.row+'" onkeydown="moveFocus(\'w\',7,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="w-inspX8-'+meta.row+'" onkeydown="moveFocus(\'w\',8,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="w-inspX8-'+meta.row+'" onkeydown="moveFocus(\'w\',8,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="w-inspX9-'+meta.row+'" onkeydown="moveFocus(\'w\',9,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="w-inspX9-'+meta.row+'" onkeydown="moveFocus(\'w\',9,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="w-inspX10-'+meta.row+'" onkeydown="moveFocus(\'w\',10,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="w-inspX10-'+meta.row+'" onkeydown="moveFocus(\'w\',10,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="w-inspX11-'+meta.row+'" onkeydown="moveFocus(\'w\',11,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="w-inspX11-'+meta.row+'" onkeydown="moveFocus(\'w\',11,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="w-inspX12-'+meta.row+'" onkeydown="moveFocus(\'w\',12,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="w-inspX12-'+meta.row+'" onkeydown="moveFocus(\'w\',12,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="w-inspX13-'+meta.row+'" onkeydown="moveFocus(\'w\',13,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="w-inspX13-'+meta.row+'" onkeydown="moveFocus(\'w\',13,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="w-inspX14-'+meta.row+'" onkeydown="moveFocus(\'w\',14,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="w-inspX14-'+meta.row+'" onkeydown="moveFocus(\'w\',14,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="w-inspX15-'+meta.row+'" onkeydown="moveFocus(\'w\',15,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="w-inspX15-'+meta.row+'" onkeydown="moveFocus(\'w\',15,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="w-inspX16-'+meta.row+'" onkeydown="moveFocus(\'w\',16,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="w-inspX16-'+meta.row+'" onkeydown="moveFocus(\'w\',16,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="w-inspX17-'+meta.row+'" onkeydown="moveFocus(\'w\',17,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="w-inspX17-'+meta.row+'" onkeydown="moveFocus(\'w\',17,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="w-inspX18-'+meta.row+'" onkeydown="moveFocus(\'w\',18,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="w-inspX18-'+meta.row+'" onkeydown="moveFocus(\'w\',18,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="w-inspX19-'+meta.row+'" onkeydown="moveFocus(\'w\',19,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="w-inspX19-'+meta.row+'" onkeydown="moveFocus(\'w\',19,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="w-inspX20-'+meta.row+'" onkeydown="moveFocus(\'w\',20,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="w-inspX20-'+meta.row+'" onkeydown="moveFocus(\'w\',20,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="w-inspX21-'+meta.row+'" onkeydown="moveFocus(\'w\',21,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="w-inspX21-'+meta.row+'" onkeydown="moveFocus(\'w\',21,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="w-inspX22-'+meta.row+'" onkeydown="moveFocus(\'w\',22,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="w-inspX22-'+meta.row+'" onkeydown="moveFocus(\'w\',22,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="w-inspX23-'+meta.row+'" onkeydown="moveFocus(\'w\',23,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="w-inspX23-'+meta.row+'" onkeydown="moveFocus(\'w\',23,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="w-inspX24-'+meta.row+'" onkeydown="moveFocus(\'w\',24,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="w-inspX24-'+meta.row+'" onkeydown="moveFocus(\'w\',24,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for(var r = 1; r <= cavityCntVal; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					
					switch(r){
						case 1:
							inspResult = api.row(i).data().inspX1;
							break;
						case 2:
							inspResult = api.row(i).data().inspX2;
							break;
						case 3:
							inspResult = api.row(i).data().inspX3;
							break;
						case 4:
							inspResult = api.row(i).data().inspX4;
							break;
						case 5:
							inspResult = api.row(i).data().inspX5;
							break;
						case 6:
							inspResult = api.row(i).data().inspX6;
							break;
						case 7:
							inspResult = api.row(i).data().inspX7;
							break;
						case 8:
							inspResult = api.row(i).data().inspX8;
							break;
						case 9:
							inspResult = api.row(i).data().inspX9;
							break;
						case 10:
							inspResult = api.row(i).data().inspX10;
							break;
						case 11:
							inspResult = api.row(i).data().inspX11;
							break;
						case 12:
							inspResult = api.row(i).data().inspX12;
							break;
						case 13:
							inspResult = api.row(i).data().inspX13;
							break;
						case 14:
							inspResult = api.row(i).data().inspX14;
							break;
						case 15:
							inspResult = api.row(i).data().inspX15;
							break;
						case 16:
							inspResult = api.row(i).data().inspX16;
							break;
						case 17:
							inspResult = api.row(i).data().inspX17;
							break;
						case 18:
							inspResult = api.row(i).data().inspX18;
							break;
						case 19:
							inspResult = api.row(i).data().inspX19;
							break;
						case 20:
							inspResult = api.row(i).data().inspX20;
							break;
						case 21:
							inspResult = api.row(i).data().inspX21;
							break;
						case 22:
							inspResult = api.row(i).data().inspX22;
							break;
						case 23:
							inspResult = api.row(i).data().inspX23;
							break;
						case 24:
							inspResult = api.row(i).data().inspX24;
							break;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#weightTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#weightTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#92d050');
					}else{
						$('#weightTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#f6f7f9');
					}
				}
			} 
		}
	});


	
	//소숫점 2자리 제한
	$(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5],input[name=inspX6]", function(event){
		var _pattern3 = /^\d*[.]\d{3}$/;	//누르고있는 키는 예외처리 안됨
        if (_pattern3.test( $(this).val())) {
        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
        	$(this).val("0");
 			$(this).select();
            return false;
		}
	});


	//치수 x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){

		let inspResult = $('input[name='+result+']').eq(row).val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('input[name='+result+']').eq(row).css('background','#ff0000');
		}else{
			$('input[name='+result+']').eq(row).css('background','#92d050');
		}
	} 	

	//즁령 x1~x5 결과값 onchage시
	function sizeCheck2(min,max,result,row){

		let inspResult = $('#weightTable tbody tr').eq(row).find('input[name='+result+']').val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('#weightTable tbody tr').eq(row).find('input[name='+result+']').css('background','#ff0000');
		}else{
			$('#weightTable tbody tr').eq(row).find('input[name='+result+']').css('background','#92d050');
		}
	} 	


	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" id="e-'+id+'-'+meta.row+'" onkeydown="moveFocus(\'e\','+idx+','+meta.row+')" data-col="' + meta.col + '" disabled>';
		
		var option = "<option value=''>선택</option>";
		for (key in obj) {
			var tmp; 
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}
	
	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeq;},
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;

				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src", "data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);

					imgSrc1 = data.imageFile1;
				} else {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
					
					imgSrc1 = '';
				}
				
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src", "data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
					
					imgSrc2 = data.imageFile2;
				} else {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
					
					imgSrc2 = '';
				}
				
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src", "data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
					
					imgSrc3 = data.imageFile3;
				} else {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
					
					imgSrc3 = '';
				}
				
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src", "data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
					
					imgSrc4 = data.imageFile4;
				} else {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
					
					imgSrc4 = '';
				}

			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}

	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){
			console.log("커서이동입니다.");
			console.log("value:" + value);	//inspX1
			console.log("row:" + row);		//0

			if(type=="w"){//중량
				rowCount = weightTable.data().count()-1;	//행수
			}else if(type=="s"){//치수-봉제
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="s2"){//치수-레이저
				rowCount = sizeAdmTable2.data().count()-1;	//행수
			}else if(type=="e"){//외관
				rowCount = extAdmTable.data().count()-1;	//행수
			}

			console.log(rowCount >= row+1);
			console.log('#'+type+'-inspResult'+(value+1)+'-'+(row+1));
			
			if(type=="e"){
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value+1)+'-0').focus();
						$('#'+type+'-inspResult'+(value+1)+'-0').select();
					},10);
				}
			} else {
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value+1)+'-0').focus();
						$('#'+type+'-inspX'+(value+1)+'-0').select();
					},10);
				}
			}
			
			
		}
	}
	
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}

	//외관 d-none 처리
	function extDnone() {
		$('#blueTh2').removeClass('d-none');
		$('#blueTh3').removeClass('d-none');
		$('#blueTh4').removeClass('d-none');
		$('#blueTh5').removeClass('d-none');
		$('#blueTh6').removeClass('d-none');
		$('#blueTh7').removeClass('d-none');
		$('#blueTh8').removeClass('d-none');
		$('#th21').removeClass('d-none');
		$('#th22').removeClass('d-none');
		$('#th23').removeClass('d-none');
		$('#th31').removeClass('d-none');
		$('#th32').removeClass('d-none');
		$('#th33').removeClass('d-none');
		$('#th41').removeClass('d-none');
		$('#th42').removeClass('d-none');
		$('#th43').removeClass('d-none');
		$('#th51').removeClass('d-none');
		$('#th52').removeClass('d-none');
		$('#th53').removeClass('d-none');
		$('#th61').removeClass('d-none');
		$('#th62').removeClass('d-none');
		$('#th63').removeClass('d-none');
		$('#th71').removeClass('d-none');
		$('#th72').removeClass('d-none');
		$('#th73').removeClass('d-none');
		$('#th81').removeClass('d-none');
		$('#th82').removeClass('d-none');
		$('#th83').removeClass('d-none');
		extAdmTable.column(6).visible(true);
		extAdmTable.column(7).visible(true);
		extAdmTable.column(8).visible(true);
		extAdmTable.column(9).visible(true);
		extAdmTable.column(10).visible(true);
		extAdmTable.column(11).visible(true);
		extAdmTable.column(12).visible(true);
		extAdmTable.column(13).visible(true);
		extAdmTable.column(14).visible(true);
		extAdmTable.column(15).visible(true);
		extAdmTable.column(16).visible(true);
		extAdmTable.column(17).visible(true);
		extAdmTable.column(18).visible(true);
		extAdmTable.column(19).visible(true);
		extAdmTable.column(20).visible(true);
		extAdmTable.column(21).visible(true);
		extAdmTable.column(22).visible(true);
		extAdmTable.column(23).visible(true);
		extAdmTable.column(24).visible(true);
		extAdmTable.column(25).visible(true);
		extAdmTable.column(26).visible(true);
	}
	
	//치수 - 레이저 d-none 처리
	function sizeDnone2() {
		$('#blueThTwo2').removeClass('d-none');
		$('#blueThTwo3').removeClass('d-none');
		$('#blueThTwo4').removeClass('d-none');
		$('#blueThTwo5').removeClass('d-none');
		$('#blueThTwo6').removeClass('d-none');
		$('#blueThTwo7').removeClass('d-none');
		$('#blueThTwo8').removeClass('d-none');
		$('#thTwo21').removeClass('d-none');
		$('#thTwo22').removeClass('d-none');
		$('#thTwo23').removeClass('d-none');
		$('#thTwo31').removeClass('d-none');
		$('#thTwo32').removeClass('d-none');
		$('#thTwo33').removeClass('d-none');
		$('#thTwo41').removeClass('d-none');
		$('#thTwo42').removeClass('d-none');
		$('#thTwo43').removeClass('d-none');
		$('#thTwo51').removeClass('d-none');
		$('#thTwo52').removeClass('d-none');
		$('#thTwo53').removeClass('d-none');
		$('#thTwo61').removeClass('d-none');
		$('#thTwo62').removeClass('d-none');
		$('#thTwo63').removeClass('d-none');
		$('#thTwo71').removeClass('d-none');
		$('#thTwo72').removeClass('d-none');
		$('#thTwo73').removeClass('d-none');
		$('#thTwo81').removeClass('d-none');
		$('#thTwo82').removeClass('d-none');
		$('#thTwo83').removeClass('d-none');
		sizeAdmTable2.column(8).visible(true);
		sizeAdmTable2.column(9).visible(true);
		sizeAdmTable2.column(10).visible(true);
		sizeAdmTable2.column(11).visible(true);
		sizeAdmTable2.column(12).visible(true);
		sizeAdmTable2.column(13).visible(true);
		sizeAdmTable2.column(14).visible(true);
		sizeAdmTable2.column(15).visible(true);
		sizeAdmTable2.column(16).visible(true);
		sizeAdmTable2.column(17).visible(true);
		sizeAdmTable2.column(18).visible(true);
		sizeAdmTable2.column(19).visible(true);
		sizeAdmTable2.column(20).visible(true);
		sizeAdmTable2.column(21).visible(true);
		sizeAdmTable2.column(22).visible(true);
		sizeAdmTable2.column(23).visible(true);
		sizeAdmTable2.column(24).visible(true);
		sizeAdmTable2.column(25).visible(true);
		sizeAdmTable2.column(26).visible(true);
		sizeAdmTable2.column(27).visible(true);
		sizeAdmTable2.column(28).visible(true);
	}
	
	//치수 - 봉제 d-none 처리
	function sizeDnone() {
		$('#blueThOne2').removeClass('d-none');
		$('#blueThOne3').removeClass('d-none');
		$('#blueThOne4').removeClass('d-none');
		$('#blueThOne5').removeClass('d-none');
		$('#blueThOne6').removeClass('d-none');
		$('#blueThOne7').removeClass('d-none');
		$('#blueThOne8').removeClass('d-none');
		$('#thOne21').removeClass('d-none');
		$('#thOne22').removeClass('d-none');
		$('#thOne23').removeClass('d-none');
		$('#thOne31').removeClass('d-none');
		$('#thOne32').removeClass('d-none');
		$('#thOne33').removeClass('d-none');
		$('#thOne41').removeClass('d-none');
		$('#thOne42').removeClass('d-none');
		$('#thOne43').removeClass('d-none');
		$('#thOne51').removeClass('d-none');
		$('#thOne52').removeClass('d-none');
		$('#thOne53').removeClass('d-none');
		$('#thOne61').removeClass('d-none');
		$('#thOne62').removeClass('d-none');
		$('#thOne63').removeClass('d-none');
		$('#thOne71').removeClass('d-none');
		$('#thOne72').removeClass('d-none');
		$('#thOne73').removeClass('d-none');
		$('#thOne81').removeClass('d-none');
		$('#thOne82').removeClass('d-none');
		$('#thOne83').removeClass('d-none');
		sizeAdmTable.column(8).visible(true);
		sizeAdmTable.column(9).visible(true);
		sizeAdmTable.column(10).visible(true);
		sizeAdmTable.column(11).visible(true);
		sizeAdmTable.column(12).visible(true);
		sizeAdmTable.column(13).visible(true);
		sizeAdmTable.column(14).visible(true);
		sizeAdmTable.column(15).visible(true);
		sizeAdmTable.column(16).visible(true);
		sizeAdmTable.column(17).visible(true);
		sizeAdmTable.column(18).visible(true);
		sizeAdmTable.column(19).visible(true);
		sizeAdmTable.column(20).visible(true);
		sizeAdmTable.column(21).visible(true);
		sizeAdmTable.column(22).visible(true);
		sizeAdmTable.column(23).visible(true);
		sizeAdmTable.column(24).visible(true);
		sizeAdmTable.column(25).visible(true);
		sizeAdmTable.column(26).visible(true);
		sizeAdmTable.column(27).visible(true);
		sizeAdmTable.column(28).visible(true);
	}
	
	//중량 d-none 처리
	function weightDnone() {
		$('#blueThWei2').removeClass('d-none');
		$('#blueThWei3').removeClass('d-none');
		$('#blueThWei4').removeClass('d-none');
		$('#blueThWei5').removeClass('d-none');
		$('#blueThWei6').removeClass('d-none');
		$('#blueThWei7').removeClass('d-none');
		$('#blueThWei8').removeClass('d-none');
		$('#thWei21').removeClass('d-none');
		$('#thWei22').removeClass('d-none');
		$('#thWei23').removeClass('d-none');
		$('#thWei31').removeClass('d-none');
		$('#thWei32').removeClass('d-none');
		$('#thWei33').removeClass('d-none');
		$('#thWei41').removeClass('d-none');
		$('#thWei42').removeClass('d-none');
		$('#thWei43').removeClass('d-none');
		$('#thWei51').removeClass('d-none');
		$('#thWei52').removeClass('d-none');
		$('#thWei53').removeClass('d-none');
		$('#thWei61').removeClass('d-none');
		$('#thWei62').removeClass('d-none');
		$('#thWei63').removeClass('d-none');
		$('#thWei71').removeClass('d-none');
		$('#thWei72').removeClass('d-none');
		$('#thWei73').removeClass('d-none');
		$('#thWei81').removeClass('d-none');
		$('#thWei82').removeClass('d-none');
		$('#thWei83').removeClass('d-none');
		weightTable.column(8).visible(true);
		weightTable.column(9).visible(true);
		weightTable.column(10).visible(true);
		weightTable.column(11).visible(true);
		weightTable.column(12).visible(true);
		weightTable.column(13).visible(true);
		weightTable.column(14).visible(true);
		weightTable.column(15).visible(true);
		weightTable.column(16).visible(true);
		weightTable.column(17).visible(true);
		weightTable.column(18).visible(true);
		weightTable.column(19).visible(true);
		weightTable.column(20).visible(true);
		weightTable.column(21).visible(true);
		weightTable.column(22).visible(true);
		weightTable.column(23).visible(true);
		weightTable.column(24).visible(true);
		weightTable.column(25).visible(true);
		weightTable.column(26).visible(true);
		weightTable.column(27).visible(true);
		weightTable.column(28).visible(true);
	}
	
</script>

</body>
</html>

