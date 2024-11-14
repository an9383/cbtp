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
				<li class="breadcrumb-item"><a href="#">철형관리</a></li>
				<li class="breadcrumb-item active">철형이력카드</li>
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
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="vertical-align: middle;">철형관리번호</th>
									<th style="vertical-align: middle;">품번</th>
									<th style="vertical-align: middle;">품명</th>
									<th style="vertical-align: middle;">철형규격<br>(MM)</th>
									<th style="vertical-align: middle;">철형등급</th>
									<th style="vertical-align: middle;">제작년도</th>
									<th style="vertical-align: middle;">제작처</th>
									<th style="vertical-align: middle;">업체명</th>
									<th style="vertical-align: middle;">비고</th>
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
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="headTab1">철형이력카드(갑지)</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="headTab2">사진(갑지)</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="headTab3">철형이력카드(을지)</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab5" id="headTab5">점검이력사항</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 d-none">
								<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnAdd">등록</button>
							</div>
							<form id="form">
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>	
										<th>구분</th>
										<td colspan="3">
											<div class="row">
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" onclick="radioOnclick()" disabled> 
													<label class="custom-control-label input-label-sm" for="mg1">설비</label>
												</div>
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" onclick="radioOnclick()" checked disabled> 
													<label class="custom-control-label input-label-sm" for="mg2">철형</label>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>자산코드</th>
										<td><input type="text" class="form-control" id="assetCd" name="assetCd" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
										<th>자산구분</th>
										<td><select class="custom-select" id="assetGubun" style="min-width : 100%"></select></td>
									</tr>
									<tr>
										<th>매입가</th>
										<td>
											<input type="text" class="form-control" id="buyAmt" name="buyAmt" style="min-width : 100%; text-align:right;">
										</td>
										<th></th>
										<td></td>
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
										<th id="equipNoTh">철형관리번호</th>
										<td><input type="text" class="form-control" id="equipNo" name="equipNo" placeholder="50자리 내외" maxlength="50" style="min-width : 100%" disabled></td>
										<!-- <th>차종</th>
										<td><input type="text" class="form-control" id="itemModel" style="min-width : 100%" disabled></td> -->
									</tr>
									<tr>
										<th>품번</th>
										<td><input type="text" class="form-control" id="itemCd" style="min-width : 100%" disabled></td>
										<th>품명</th>
										<td><input type="text" class="form-control" id="itemNm" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>사용장비</th>
										<td><input type="text" class="form-control" id="equipUsed" style="min-width : 100%" disabled></td>
										<th id="equipTypeTh">제품재질</th>
										<td><input type="text" class="form-control" id="equipType" name="equipType" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
									</tr>
									<tr id="moldCavityTr">
										<th>Cavity</th>
										<td><input type="text" class="form-control" id="equipCavity" name="equipCavity" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>코어재질</th>
										<td><input type="text" class="form-control" id="equipCore" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>철형수명(SHOT수)</th>
										<td>
											<input type="text" class="form-control" id="warrantyLife" name="warrantyLife" value="0" style="min-width : 100%; text-align:right;">
										</td>
										<th>철형비</th>
										<td><input type="text" class="form-control" id="purchasePrice" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>제작년도</th>
										<td>
											<input class="form-control" type="date" id="mfcDate" name="mfcDate" disabled />
										</td>
										<th>제작처</th>
										<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" placeholder="64자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3"><input type="text" class="form-control" id="equipDesc" style="min-width : 100%" disabled></td>
									</tr>
								</table>
								<div>
									<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnExtSave">외관저장</button>
									<button type="button" class="btn btn-primary float-right ml-1 d-none"
										id="btnCheckSave">기준서저장</button>
									<button type="button" class="btn btn-danger float-right ml-1"
										id="btnCheckDel" disabled>기준서삭제</button>
									<button type="button" class="btn btn-warning float-right ml-1"
										id="btnCheckEdit" disabled>기준서수정</button>
									<button type="button" class="btn btn-primary float-right ml-1"
										id="btnCheckAdd" disabled>기준서추가</button>	
								</div>
								<div class="table-responsive">
									<table class="table table-bordered mt-3" id="equipCheckTable">
										<colgroup>
											<col width="30%">
											<col width="25%">
											<col width="25%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>*점검상태</th>
												<th>*점검방법</th>
												<th>*점검기준</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>설비조건</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="equipCond" name="equipCond" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
									</tr>
									<tr>
										<th>상한</th>
										<td>
											<input type="text" class="form-control" id="upperAmt" name="upperAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
										<th>하한</th>
										<td>
											<input type="text" class="form-control" id="lowerAmt" name="lowerAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
									</tr>
								</table>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>철형등급</th>
										<td><select class="custom-select" id="moldGrade" style="min-width : 100%"></select></td>
									</tr>
									<tr>
										<th>초기타발수</th>
										<td>
											<input type="text" class="form-control" id="earlyPunchNum" name="earlyPunchNum" value="0" style="min-width : 100%; text-align:right;">
										</td>
										<th>적용일자</th>
										<td>
											<div class="form-group input-sub m-0">
												<input class="form-control" type="text" id="effectiveDate"
													name="effectiveDate" maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(effectiveDate, effectiveDate, 'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="effectiveDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
									</tr>
								</table>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>부대설비</th>
										<td>
											<input type="text" class="form-control" id="ancEquipNm" name="ancEquipNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>제작년도</th>
										<td>
											<div class="form-group input-sub m-0">
												<input class="form-control" type="text" id="ancDate" name="ancDate" maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(ancDate, ancDate, 'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search" id="ancDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>제작처</th>
										<td>
											<input type="text" class="form-control" id="ancCorpCd" name="ancCorpCd" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>소모품</th>
										<td>
											<input type="text" class="form-control" id="expNm" name="expNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>규격</th>
										<td>
											<input type="text" class="form-control" id="ancEquipType" name="ancEquipType" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>구입처</th>
										<td>
											<input type="text" class="form-control" id="buyCorpNm" name="buyCorpNm" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
								</table>
							</form>
							<table class="table table-bordered mt-1 d-none" id="changeHisTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>변경내역</th>
									<td colspan='3'><input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20"></td>
								</tr>
							</table>
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
											<th colspan="2">설비사진</th>
										</tr>
										<tr>
											<td><input type="text" class="form-control" placeholder="사진1" onchange="textSave(1)"
												id="imageFile1Con" name="imageFile1Con" style="min-width: 100%"></td>
											<td><input type="text" class="form-control" placeholder="사진2" onchange="textSave(2)"
												id="imageFile2Con" name="imageFile2Con" style="min-width: 100%"></td>
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
										<tr class="d-none">
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
											<td><input type="text" class="form-control" placeholder="사진3" onchange="textSave(3)"
												id="imageFile3Con" name="imageFile3Con" style="min-width: 100%"></td>
											<td><input type="text" class="form-control" placeholder="사진4" onchange="textSave(4)"
												id="imageFile4Con" name="imageFile4Con" style="min-width: 100%"></td>
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
										<tr class="d-none">
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
						<!--========tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="productListTable">
										<colgroup>
											<col width="13%">
											<col width="15%">
											<col width="15%">
											<col width="13%">
											<col width="13%">
											<col width="15%">
											<col width="16%">
										</colgroup>
										<thead>
											<tr>
												<th>수리시작</th>
												<th>수리내용</th>
												<th>작업결과</th>
												<th>수리비용</th>
												<th>작업처</th>
												<th>품질초품확인</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab5 part=====-->
						<div class="tab-pane fade" id="tab5">
							<div class="table-responsive">
								<table class="table table-bordered" id="corrDataListTabTable">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="15%">
<%-- 										<col width="30%"> --%>
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>점검일자</th>
											<th>실행일자</th>
											<th>작성자</th>
											<th>점검 자료</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered" id="corrDataFileTable">
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--====end====tab5 part=====-->
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
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">철형이력카드 엑셀조회</h5>
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
								<th>설비코드</th>
								<th>설비명</th>
								<th>공정코드</th>
								<th>규격</th>
								<th>제작년도</th>
								<th>제작처</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작년도</th>
								<th>제작처</th>
								<th>소모품</th>
								<th>규격</th>
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
<%= request.getParameter("equipCd") %>

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

	let menuAuth = 'mlsc0120';
	let currentHref = "mlsc0120";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","철형이력카드"); 
	
	let beforeEquipCd = "${param.equipCd}";
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	uiProc(true);
	var mainGubun = '003';
	var equipCd = null;
	var serverDate = "${serverDateTo}"
	var index=0;
	var urlData = null;
	var buyAmtVal;
	var equipCdVal = null;
	var corrRegDate = null;
	var tempCorrWillDate = serverDate;
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";

	//공통코드 처리 시작
	var prcNm = new Array();
	<c:forEach items = "${prcNm}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcNm.push(json);
	</c:forEach>
	
	var assetGubun = new Array();
	<c:forEach items = "${assetGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	assetGubun.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items = "${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var moldGradeCode = new Array();
	<c:forEach items = "${moldGrade}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	moldGradeCode.push(json);
	</c:forEach>
	//공통코드 처리 끝

	//선택박스 처리
	selectBoxAppend(prcNm, "prcNm", "", "");
	selectBoxAppend(assetGubun, "assetGubun", "", "");
	selectBoxAppend(useYnCode, "useYn", "", "001");
	selectBoxAppend(moldGradeCode, "moldGrade", "", "2");
	
	$('#equipNoTh').text('철형관리번호');
	$('#equipNmTh').text('철형명');
	$('#equipTypeTh').text('제품재질');
	$('#moldCavityTr').removeClass('d-none');

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		
// 		$('#btnCheckAdd').attr('disabled', true);
// 		$('#btnCheckEdit').attr('disabled', true);
// 		$('#btnCheckDel').attr('disabled', true);
		$('#btnCheckSave').addClass('d-none');
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);

		$('#equipCheckTable').DataTable().ajax.reload(function(){});
		
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
// 		$('input:radio[name=mainGubun]').prop('checked',false);	
	});

	$('#endDate').val(serverDate);
	$('#mfcDate').val(serverDate);
	$('#ancDate').val(serverDate);
	
	//설비정보 목록
	let equipCodeTable = $('#equipCodeTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/equipCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return mainGubun;},
			},
		},
		rowId : 'equipCd',
		columns : [ 
		{
			data : 'equipNo'
		},
		{
			data : 'itemCd'
		},
		{
			data : 'itemNm'
		},
		{
			data : 'equipStandard'
		},
		{
			data : 'moldGradeNm'
		},
		{
			data : 'mfcDate',
			render: function(data, type, row, meta) {
				if(data != null){
					return moment(data).format('YYYY-MM-DD');
				}else{
					return '-';
				}
			}, "className": "text-center" 	
		},
		{
			data : 'mfcCorpCd'
		}, 
		{
			data : 'equipCompany'
		}, 
		{
			data : 'equipDesc'
		}
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '철형이력카드',
		}, {
			extend : 'excel',
			title : '철형이력카드',
		}, {
			extend : 'print',
			title : '철형이력카드',
		}, ],
		drawCallback: function() {
            var api = this.api();
            if(beforeEquipCd != '') {
               api.row('#' + beforeEquipCd).select();
               equipCd = beforeEquipCd;
               equipCodeTableRead();
            }
          $('#productNoTable_filter').addClass('d-none');
      	}
	});

	var  html = '<div class="row">';
	html += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm d-none">구분</label>'; 
	html += '<select class="custom-select d-none" id="mainGubun">';
	html += '<option value="" selected>전체</option>';
	html += '<option value="001">설비</option>';
	html += '<option value="002">철형</option>';
	html +=	'</select>';
    html += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html += '<a href="/bm/equipBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html += '</div>';

	$('#equipCodeTable_length').html(html);

	//구분 선택시
	$('#mainGubun').on('change', function() {
		mainGubun = $('#mainGubun option:selected').val();
		$('#equipCodeTable').DataTable().ajax.reload(function () {});
    });
	
	//설비정보 상세정보 보기
	$('#equipCodeTable tbody').on('click','tr',function() {
		equipCd = equipCodeTable.row(this).data().equipCd;
		
		equipCodeTableRead();
	});

	function equipCodeTableRead(){
		if ($('#btnCheckSave').attr('class') == 'btn btn-primary float-right ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#headTab1').tab('show');
		
		if ($('#equipCodeTable tbody tr#'+equipCd).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
			$('#equipCodeTable tbody tr#'+equipCd).addClass('selected');
		}

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
				$('input:radio[name=mainGubun]:radio[value='+data.mainGubun+']').prop('checked',true);
				//$('#itemModel').val(data.itemModelNm);
				$('#itemCd').val(data.itemCd);
				$('#itemNm').val(data.itemNm);
				$('#equipNo').val(data.equipNo);
				$('#equipNm').val(data.equipNm);
				$('#equipInitial').val(data.equipInitial);
				$('#equipType').val(data.equipType);
				$('#moldLocation').val(data.moldLocation);
				$('#equipCavity').val(data.equipCavity);
				$('#mfcDate').val(data.mfcDate == null || data.mfcDate == "Invalid date" || data.mfcDate == "" ? "" : moment(data.mfcDate).format('YYYY-MM-DD'));
				$('#endDate').val(data.endDate == null || data.endDate == "Invalid date" || data.endDate == "" ? '' : moment(data.endDate).format('YYYY-MM-DD'));
				$('#mfcCorpCd').val(data.mfcCorpCd);
				$('#assetCd').val(data.assetCd);
				$('#buyAmt').val(data.buyAmt == null ? "" : addCommas(data.buyAmt));
				$('#equipCond').val(data.equipCond);
				$('#upperAmt').val(data.upperAmt);
				$('#lowerAmt').val(data.lowerAmt);
				$('#disposeDate').val(data.disposeDate == null || data.disposeDate == "Invalid date" || data.disposeDate == "" ? "" : moment(data.disposeDate).format('YYYY-MM-DD'));
				$('#moldGrade').val(data.moldGrade);
				$('#warrantyLife').val(data.warrantyLife != null ? addCommas(data.warrantyLife) : '0');
				$('#earlyPunchNum').val(data.earlyPunchNum != null ? addCommas(data.earlyPunchNum) : '0');
				$('#effectiveDate').val(data.effectiveDate == null || data.effectiveDate == "Invalid date" || data.effectiveDate == "" ? "" : moment(data.effectiveDate).format('YYYY-MM-DD'));
				$('#ancEquipNm').val(data.ancEquipNm);
				$('#ancDate').val(data.ancDate == null || data.ancDate == "Invalid date" || data.ancDate == "" ? "" : moment(data.ancDate).format('YYYY-MM-DD'));
				$('#ancCorpCd').val(data.ancCorpCd);
				$('#expNm').val(data.expNm);
				$('#ancEquipType').val(data.ancEquipType);
				$('#buyCorpNm').val(data.buyCorpNm);
				$('#equipDesc').val(data.equipDesc);

				$('#purchasePrice').val(data.purchasePrice);
				$('#equipStandard').val(data.equipStandard);
				$('#equipWeight').val(data.equipWeight);
				$('#equipCompany').val(data.equipCompany);
				$('#equipStorage').val(data.equipStorage);
				$('#equipYangsan').val(data.equipYangsan);
				$('#equipUsed').val(data.equipUsedNm);
				$('#equipCore').val(data.equipCore);
				
				$('#imageFile1Con').val(data.imageFile1Con);
				$('#imageFile2Con').val(data.imageFile2Con);
				$('#imageFile3Con').val(data.imageFile3Con);
				$('#imageFile4Con').val(data.imageFile4Con);
				
				//선택박스 처리
				selectBoxAppend(prcNm, "prcNm", data.prcNm, "");
				selectBoxAppend(assetGubun, "assetGubun", data.assetGubun, "");
				selectBoxAppend(useYnCode, "useYn", data.useYn , "");
				selectBoxAppend(moldGradeCode, "moldGrade", data.moldGrade , "2");

				radioCheck = $('input[name=mainGubun]:checked').val();
				if (radioCheck == '001') {
					$('#equipNoTh').text('설비코드');
					$('#equipNmTh').text('설비명');
					$('#equipTypeTh').text('규격');
					$('#moldCavityTr').addClass('d-none');
					
					$('#moldLocation').val('');
					$('#equipCavity').val('');
				} else if (radioCheck == '002') {
					$('#equipNoTh').text('철형관리번호');
					$('#equipNmTh').text('철형명');
					$('#equipTypeTh').text('제품재질');
					$('#moldCavityTr').removeClass('d-none');
					
					$('#moldLocation').val(data.moldLocation);
					$('#equipCavity').val(data.equipCavity);
				}
				
				$('#equipCheckTable').DataTable().ajax.reload();
				setTimeout(function() { 
					equipCheckTable.draw(); 
				},150);
				
				//화면처리
				sideView = 'edit';
				uiProc(true);
				$('#btnSave').addClass('d-none'); // 저장버튼
				$('#btnAdd').attr('disabled', false); //생성버튼
				$('#btnEdit').attr('disabled', false); //수정버튼
				$('#headTab2').removeClass('disabled');
				$('#headTab3').removeClass('disabled');
				$('#headTab5').removeClass('disabled');
				$('#btnCheckAdd').attr('disabled', false);
				$('#btnCheckEdit').attr('disabled', false);
				$('#btnCheckDel').attr('disabled', false);
// 				imgPrint();
			}
		});
	}
	
	//설비 deviceMulti 입력 예외처리
	$('#deviceMulti').on('click',function(){
		if($('#deviceNum').val()=="0" || $('#deviceNum').val()==""){
			toastr.warning("설비 deviceNum를 입력해주세요.");
			$('#deviceNum').focus();
			return false;
		}
	});

	//사진(갑지) 탭 클릭시
	$('#headTab2').on('click', function() {
		imgPrint();

	});

	//사진(갑지) 탭 클릭시
	$('#headTab3').on('click', function() {
		$('#productListTable').DataTable().ajax.reload();
	});
	
	//등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		uiProc(false);
		
// 		$('input:radio[name=mainGubun]').prop('checked',false);
		$('#btnSave').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#mfcDate').attr('disabled', true);
		$('#ancDate').attr('disabled', true);
		$('#mfcDate').val(serverDate);
		$('#ancDate').val(serverDate);
		$('#endDate').val(serverDate);

		$('#headTab2').addClass('disabled');
		$('#headTab3').addClass('disabled');
		$('#headTab5').addClass('disabled');

		//선택박스 처리
		selectBoxAppend(prcNm, "prcNm", "", "");
		selectBoxAppend(assetGubun, "assetGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "" , "");
		selectBoxAppend(moldGradeCode, "moldGrade", "" , "2");
		
		$.ajax({
			url : '<c:url value="/bm/readEquipSeq"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					equipCd = data;
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
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#mfcDate').attr('disabled', true);
		$('#ancDate').attr('disabled', true);
		$('#headTab2').addClass('disabled');
		$('#headTab3').addClass('disabled');
		$('#headTab5').addClass('disabled');
		
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});

	//철형이력카드(갑지) 저장
	$('#btnSave').on('click', function() {
		
		if ($('input[name=mainGubun]:checked').val() == '' || $('input[name=mainGubun]:checked').val() == undefined) {
			toastr.warning('구분을 선택해 주세요.');
			$('#mg1').focus();
			return false;
		}
		
		if (!$.trim($('#equipNo').val())) {
			toastr.warning('설비코드를 입력해 주세요.');
			$('#equipNo').focus();
			return false;
		}
		if (!$.trim($('#equipNm').val())) {
			toastr.warning('설비명을 입력해 주세요.');
			$('#equipNm').focus();
			return false;
		}
		if (!$.trim($('#equipInitial').val())) {
			toastr.warning('이니셜을 입력해 주세요.');
			$('#equipInitial').focus();
			return false;
		}

		if ($('#equipInitial').val().length!=3) {
			toastr.warning('이니셜을 3자리까지 입력해 주세요.');
			$('#equipInitial').focus();
			return false;
		}
		
		if (!$.trim($('#equipType').val())) {
			toastr.warning('규격을 입력해 주세요.');
			$('#equipType').focus();
			return false;
		}
		if (!$.trim($('#equipCavity').val()) && ($('input[name=mainGubun]:checked').val() == '002')) {
			toastr.warning('Cavity를 입력해 주세요.');
			$('#equipCavity').focus();
			return false;
		}
		if (!$.trim($('#mfcCorpCd').val())) {
			toastr.warning('제조사를 입력해 주세요.');
			$('#mfcCorpCd').focus();
			return false;
		}
		if (!$.trim($('#mfcDate').val())) {
			toastr.warning('제작일자를 선택해 주세요.');
			$('#mfcDateCalendar').focus();
			return false;
		}
		
		var tempWarrantyLife = $('#warrantyLife').val();
		if(tempWarrantyLife.indexOf('.') == -1){
			tempWarrantyLife = tempWarrantyLife + '.00';
		}
		
		if (tempWarrantyLife.substring(tempWarrantyLife.lastIndexOf("."), 0).replace(/,/g, '').length > 10) {
			toastr.warning('보증수명이 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
			$('#warrantyLife').val('0');
			$('#warrantyLife').focus();
			return false;
		}
		
		var tempEarlyPunchNum = $('#earlyPunchNum').val();
		if(tempEarlyPunchNum.indexOf('.') == -1){
			tempEarlyPunchNum = tempEarlyPunchNum + '.00';
		}
		
		if (tempEarlyPunchNum.substring(tempEarlyPunchNum.lastIndexOf("."), 0).replace(/,/g, '').length > 10) {
			toastr.warning('초기타발수가 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
			$('#earlyPunchNum').val('0');
			$('#earlyPunchNum').focus();
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
			async : false,
			data : {
				'mainGubun' : $('input:radio[name=mainGubun]:checked').val(),
				'equipCd' : equipCd,
				'assetCd' : $('#assetCd').val(),
				'assetGubun' : $('#assetGubun option:selected').val(),
				'buyAmt' : $('#buyAmt').val(),
				'equipNo' : $('#equipNo').val(),
				'equipNm' : $('#equipNm').val(),
				'equipInitial' : $('#equipInitial').val(),
				'prcNm' : $('#prcNm option:selected').val(),
				'equipType' : $('#equipType').val(),
				'moldLocation' : $('#moldLocation').val(),
				'equipCavity' : $('#equipCavity').val(),
				'mfcDate' : $('#mfcDate').val().replace(/-/g,''),
				'endDate' : $('#endDate').val().replace(/-/g,''),
				'useYn' : $('#useYn option:selected').val(),
				'mfcCorpCd' : $('#mfcCorpCd').val(),
				'equipCond' : $('#equipCond').val(),
				'upperAmt' : $('#upperAmt').val(),
				'lowerAmt' : $('#lowerAmt').val(),
				'disposeDate' : $('#disposeDate').val().replace(/-/g,''),
				'moldGrade' : $('#moldGrade').val(),
				'warrantyLife' : $('#warrantyLife').val().replace(/,/g,''),
				'earlyPunchNum' : $('#earlyPunchNum').val().replace(/,/g,''),
				'effectiveDate' : $('#effectiveDate').val().replace(/-/g,''),
				'ancEquipNm' : $('#ancEquipNm').val(),
				'ancDate' : $('#ancDate').val().replace(/-/g,''),
				'ancCorpCd' : $('#ancCorpCd').val(),
				'expNm' : $('#expNm').val(),
				'ancEquipType' : $('#ancEquipType').val(),
				'buyCorpNm' : $('#buyCorpNm').val(),
				'equipDesc' : $('#equipDesc').val(),
				'purchasePrice' : $('#purchasePrice').val(),
				'equipStandard' : $('#equipStandard').val(),
				'equipWeight' : $('#equipWeight').val(),
				'equipCompany' : $('#equipCompany').val(),
				'equipStorage' : $('#equipStorage').val(),
				'equipYangsan' : $('#equipYangsan').val(),
				'equipUsed' : $('#equipUsed').val(),
				'equipCore' : $('#equipCore').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
					$('#equipCodeTable').DataTable().ajax.reload();

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					
					$('#headTab2').removeClass('disabled');
					$('#headTab3').removeClass('disabled');
					$('#headTab5').removeClass('disabled');

					uiProc(true);
					$('#btnEdit').attr('disabled', false);
					$('#btnSave').addClass('d-none');
				} else {
					toastr.warning(res.message);
				}
			},
		});
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			var url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
//						$('#btnAddConfirm').removeClass('d-none');
//						$('#btnAddConfirmLoading').addClass('d-none');
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
	function imageUpload(value) {

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
					imgPrint();
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				} else if (data.result == "sizeError") {
					toastr.error('사진 용량이 너무 큽니다. (1메가 이하로 올려 주세요.)');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				}
				
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

	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : true,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/equipExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'assetCd'},
			{data : 'assetGubun'},
			{data : 'buyAmt'},
			{data : 'equipNo'},
			{data : 'equipNm'},
			{data : 'prcNm'},
			{data : 'equipType'},
			{data : 'mfcDate'},
			{data : 'mfcCorpCd'},
			{data : 'equipCond'},
			{data : 'upperAmt'},
			{data : 'lowerAmt'},
			{data : 'ancEquipNm'},
			{data : 'ancDate'},
			{data : 'ancCorpCd'}, 
			{data : 'expNm'}, 
			{data : 'ancEquipType'}, 
			{data : 'buyCorpNm'}, 
		],
		columnDefs: [
			{ targets: [12] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"targets": "_all" , "className": "text-center"},
        	
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);

		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/equipExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});

	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.assetCd= inTable.row(index).data().assetCd;
			rowData.assetGubun= inTable.row(index).data().assetGubun;
			rowData.buyAmt= inTable.row(index).data().buyAmt;
			
			rowData.equipNo= inTable.row(index).data().equipNo;
			rowData.equipNm= inTable.row(index).data().equipNm;
			rowData.prcNm= inTable.row(index).data().prcNm;
			rowData.equipType= inTable.row(index).data().equipType;
			rowData.mfcDate= inTable.row(index).data().mfcDate;
			rowData.mfcCorpCd= inTable.row(index).data().mfcCorpCd;
			
			rowData.equipCond= inTable.row(index).data().equipCond;
			rowData.upperAmt= inTable.row(index).data().upperAmt;
			rowData.lowerAmt= inTable.row(index).data().lowerAmt;
			
			rowData.ancEquipNm= inTable.row(index).data().ancEquipNm;
			rowData.ancDate= inTable.row(index).data().ancDate;
			rowData.ancCorpCd= inTable.row(index).data().ancCorpCd;
			rowData.expNm= inTable.row(index).data().expNm;
			rowData.ancEquipType= inTable.row(index).data().ancEquipType;
			rowData.buyCorpNm= inTable.row(index).data().buyCorpNm;
			
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/equipExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#equipCodeTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
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
	
	//숫자 콤마생성
	$(document).on('keyup', "#buyAmt, #warrantyLife, #earlyPunchNum",  function(evt) { //입력시 콤마 추가
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
	
	function uiProc(flag) {
		$('input[name=mainGubun]').attr('disabled',flag);
		$("#equipNo").attr("disabled", flag);
		$("#equipNm").attr("disabled", flag);
		$("#equipInitial").attr("disabled", flag);
		$("#prcNm").attr("disabled", flag);
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
		$("#disposeDateCalendar").attr("disabled", flag);
		$("#moldGrade").attr("disabled", flag);
		$("#warrantyLife").attr("disabled", flag);
		$("#earlyPunchNum").attr("disabled", flag);
		$("#effectiveDateCalendar").attr("disabled", flag);
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
		$('#purchasePrice').attr("disabled", flag);
		$('#equipStandard').attr("disabled", flag);
		$('#equipWeight').attr("disabled", flag);
		$('#equipCompany').attr("disabled", flag);
		$('#equipStorage').attr("disabled", flag);
		$('#equipYangsan').attr("disabled", flag);
		$('#equipUsed').attr("disabled", flag);
		$('#equipCore').attr("disabled", flag);
	}

	function uiProc2(flag) {
		$('input[name=corrCont]').attr("disabled", flag);
		$('input[name=corrActOrgan]').attr("disabled", flag);
		$('input[name=corrDesc]').attr("disabled", flag);
		$('button[name=btnCorrRegDate]').attr("disabled", flag);
	}

	function uiProc3(flag) {
		$("select[name=etcGubun]").attr("disabled", flag);
		$("input[name=etcCont]").attr("disabled", flag);
	}
	
	function textSave(x){
		url = '<c:url value="/bm/equipImgUpdate"/>';

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'equipCd' : equipCd,
				'imageFile1Con' : $('#imageFile1Con').val(),
				'imageFile2Con' : $('#imageFile2Con').val(),
				'imageFile3Con' : $('#imageFile3Con').val(),
				'imageFile4Con' : $('#imageFile4Con').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				uiProc(true);
			}
		});
	}
	
	var radioCheck;
	function radioOnclick(){
		radioCheck = $('input[name=mainGubun]:checked').val();
		if (radioCheck == '001') {
			$('#equipNoTh').text('설비코드');
			$('#equipNmTh').text('설비명');
			$('#equipTypeTh').text('규격');
			$('#moldCavityTr').addClass('d-none');
			
			$('#moldLocation').val('');
			$('#equipCavity').val('');
		} else if (radioCheck == '002') {
			$('#equipNoTh').text('철형관리번호');
			$('#equipNmTh').text('철형명');
			$('#equipTypeTh').text('제품재질');
			$('#moldCavityTr').removeClass('d-none');
			
			$('#moldLocation').val('');
			$('#equipCavity').val('');
		}
	}

	//숫자 및 영문만 입력하게 처리
	$(document).on('keyup',"#equipInitial", function(event){
		$(this).val($(this).val().replace(/[^A-Z0-9]/gi,""));
	});
	

	//철형이력카드(을지) 목록
	let productListTable = $('#productListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
			url : '<c:url value="/em/equipRepairHistAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return '002'},
				'equipCd' : function(){return equipCd;},
			},
		},
		columns : [ 
			{
				data : 'repairStartDate',
				render : function(data, type, row){
					if(data != null && data != ''){
						return moment(data.substr(0, 8)).format('YYYY-MM-DD');
					} else {
						return '';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'troubleCause',
				'className' : 'text-center'
			},
			{
				data : 'workResult',
				'className' : 'text-center'
			},
			{
				data : 'repairCost',
				'className' : 'text-center'
			},
			{
				data : 'repairCorpNm',
				'className' : 'text-center'
			},
			{
				data : 'qualityCheck',
				'className' : 'text-center'
			},
			{
				data : 'repairDesc',
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '철형이력카드',
		}, {
			extend : 'excel',
			title : '철형이력카드',
		}, {
			extend : 'print',
			title : '철형이력카드',
		}, ],
	});
	
	//기준서 목록
	let equipCheckTable = $('#equipCheckTable').DataTable({
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
		ajax : {
			url : '<c:url value="bm/equipCheckAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return equipCd;},
			},
		},
		columns : [
			{
				data : 'checkState',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkState" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkState" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			},
			{
				data : 'checkMethod',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkMethod" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkMethod" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			},
			{
				data : 'checkStandard',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkStandard" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkStandard" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			},
			{
				data : 'checkDesc',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkDesc" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkDesc" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			},
			
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	var checkView = "";
	//기준서 데이터 클릭 시
	$('#equipCheckTable tbody').on('click','tr',function() {
		checkView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			checkView = "";
			return false;
		} else {
			$('#equipCheckTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#equipCheckTable').DataTable().row(this).index();
		checkSeq = equipCheckTable.row(tableIdx).data().checkSeq;
		
		console.log(tableIdx);
	});
	
	//기준서 추가버튼
	$('#btnCheckAdd').on('click', function() {
		checkView = '';
		$('#equipCheckTable').DataTable().row.add({}).draw(false);
		
 		$('#btnCheckSave').removeClass('d-none'); // 등록버튼
	});
	
	//기준서 수정버튼
	$('#btnCheckEdit').on('click', function() {
		if(checkView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		console.log(tableIdx);
		$('#equipCheckTable td').find('input[name=checkState]').eq(tableIdx).attr('disabled',false);
		$('#equipCheckTable td').find('input[name=checkMethod]').eq(tableIdx).attr('disabled',false);
		$('#equipCheckTable td').find('input[name=checkStandard]').eq(tableIdx).attr('disabled',false);
		$('#equipCheckTable td').find('input[name=checkDesc]').eq(tableIdx).attr('disabled',false);
 		$('#btnCheckSave').removeClass('d-none');
	});
	
	//기준서 삭제버튼
	$('#btnCheckDel').on('click', function() {
		if (checkView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (checkSeq != undefined && checkSeq != ''){
			//기준서 삭제
			$.ajax({
				url : '<c:url value="bm/equipCheckAdmDelete"/>',
				type : 'POST',
				data  : {
					'equipCd' : function(){return equipCd;},
					'checkSeq' : function(){return checkSeq;},
				},
				success  : function(res){
					$('#equipCheckTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#equipCheckTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		checkView = '';

	});
	
	//기준서 저장버튼
	$('#btnCheckSave').on('click',function() {
		var check = true;
		var dataArray = new Array();

		$('#equipCheckTable tbody tr').each(function(index, item) {

			if (equipCheckTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=checkState]').val() == "") {
					toastr.warning('점검상태를 입력해 주세요.');
					$(this).find('td input[name=checkState]').focus();
					check = false;
					return false;
				}
				
				if ($(this).find('td input[name=checkMethod]').val() == "") {
					toastr.warning('점검방법을 입력해 주세요.');
					$(this).find('td input[name=checkMethod]').focus();
					check = false;
					return false;
				}
				
				if ($(this).find('td input[name=checkStandard]').val() == "") {
					toastr.warning('점검기준을 입력해 주세요.');
					$(this).find('td input[name=checkStandard]').focus();
					check = false;
					return false;
				}
			} 
			
			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.checkState = $(this).find('td input[name=checkState]').val();
			rowData.checkMethod = $(this).find('td input[name=checkMethod]').val();
			rowData.checkStandard = $(this).find('td input[name=checkStandard]').val();
			rowData.checkDesc = $(this).find('td input[name=checkDesc]').val();

			dataArray.push(rowData);
			console.log(rowData)
		});
		
		var url = '<c:url value="/bm/equipCheckAdmCreate"/>';

		if (check) {
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						checkView = "";
						//새로고침
						$('#equipCheckTable').DataTable().ajax.reload();
						$('#btnCheckSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					checkView = "";
				}
			});
		}
	});
	
	// 테이블 행 더블클릭
	$('#equipCodeTable tbody').on('dblclick','tr',function() {
		window.location.href = "mlsc0130";
	});
	
	//점검이력사항 버튼 Event
	$('#headTab5').on('click', function() {
		$('#corrDataFileTable').DataTable().clear().draw();
		$('#corrDataListTabTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataListTabTable.draw();
			corrDataFileTable.draw();
			corrDataFileTable.draw();
			corrDataListTabTable.draw();
		},300);
	});
	
	//점검이력사항 테이블
	let corrDataListTabTable = $('#corrDataListTabTable').DataTable({
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
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return equipCd;},
				'corrGubun' : function() {return '003';},
			},
		},
		rowId : 'mitCd',
		columns : [
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name=""/>';
						html += '</div>';

						return html;
					}else{
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="" value="'+moment(data).format('YYYY-MM-DD')+'" name="" disabled/>';
						html += '<input class="form-control" type="hidden" id="" value="'+row['corrSeq']+'" name=""/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="" value="" name=""/>';
						html += '</div>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name="" disabled/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name=""  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name=""  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" name="" style="width:100%"/>';
					}else{
						return '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					
					if(data == null){
						var html = '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" for=""></label></div></form>';
						return html;
					} else {
						var html = '<a name="" href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+equipCd+'&corrSeq='+row['corrSeq']+'&corrGubun='+row['corrGubun']+'">'+data+'</a>';
						html += '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file d-none" name="">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" id="" for="">'+data+'</label></div></form>';
						return html;
					}
	            }
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [4], visible : false},
		]
	});
	
	let corrGubun = '';
	let corrSeq = '';
	
	//설비정보 상세정보 보기
	$('#corrDataListTabTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#corrDataListTabTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		corrGubun = corrDataListTabTable.row(this).data().corrGubun;
		corrSeq = corrDataListTabTable.row(this).data().corrSeq;
		
		$('#corrDataFileTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		},300);
	});
	
	let corrDataFileTable = $('#corrDataFileTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return equipCd;},
				'attachGubun' : function(){return 'CD';},
				'attachType' : function(){return corrGubun;},
				'etc1' : function(){return corrSeq;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					var tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachType='+corrGubun+'&etc1='+corrSeq+'&attachGubun=CD">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		],
		order : [ [ 0, 'asc' ], ],
	});
	
</script>
</script>
</body>
</html>