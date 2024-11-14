<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!-- 창고조회 모달 시작 -->
	<div class="modal fade" id="locationPopupModal" tabindex="-1" role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			      	<hr class="text-secondary">	         
		                <table id="locationPopupTable" class="table table-bordered">
		                	<colgroup>
								<col width="23%">
								<col width="18%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="23%">
							</colgroup>	
		                    <thead class="thead-light">
			                    <tr>
			                    	<th>창고코드</th>
			                    	<th>창고구분</th>
			                    	<th>구역</th>
			                    	<th>위치</th>
			                    	<th>사용여부</th>
			                    	<th>비고</th>
			                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 창고조회 모달 끝 -->
	<!-- 품목정보관리 - 작업장 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemWorkplacePopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemWorkplacePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemWorkplacePopUpLabel">작업장 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="itemWorkplacePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공정코드</th>
									<th style="width : 80%">공정명</th>
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
	<!-- 품목정보관리 - 작업장 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">자재정보관리(레이저)</li>
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
					<div class="table-responsive">
						<table id="itemPartAdmTable" class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
								<col width="8%">
								<col width="10%">
								<col width="14%">
								<col width="10%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th class="text-center">공급사</th>
									<th>품번</th>
									<th>품명</th>
									<th>SPEC</th>
									<th>단위</th>
									<th>저장위치</th>
									<th>구역위치</th>
									<th>수입검사여부</th>
									<th>사용여부</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item">
									<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2">자재사진</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab3Nav" data-toggle="tab" href="#tab3">관련자료</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab4Nav" data-toggle="tab" href="#tab4">입고단가이력</a>
								</li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
						<!--====start====tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnCall">불러오기</button>
								<button type="button" class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnRevAdd">Rev등록</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">신규등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered">
				                    	<colgroup>
				                           <col width="20%"> 
				                           <col width="30%">
				                           <col width="20%">
				                           <col width="30%">
				                        </colgroup>
				                        <!-- <tr>   
				                           <th>*구분</th>
				                           <td colspan="3">
				                              	<div class="row">
				                                 	<div class="custom-control custom-radio row">
				                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" onclick="radioOnclick()" disabled> 
				                                    	<label class="custom-control-label input-label-sm" for="mg1">사출</label>
				                                 	</div>
				                                 	<div class="custom-control custom-radio row">
				                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" onclick="radioOnclick()" disabled> 
				                                    	<label class="custom-control-label input-label-sm" for="mg2">봉제</label>
				                                	</div>
				                            	</div>
				                        	</td>
				                    	</tr> -->
				                    </table>
									<table class="table table-bordered" id="itemPartInfoTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>*품목구분</th>
											<td><select class="custom-select" id="itemGubun" onChange="selectOnchange()"></select></td>
											<th>상태</th>
											<td><select class="custom-select" id="stateCd"></select></td>
										</tr>
										<tr>
										<th>*공급사</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="itemRealCus" name="itemRealCus"> 
														<input type="text" class="form-control" id="itemCus" name="itemCus" disabled>
														<button type="button" id="btnItemCus" class="btn btn-primary input-sub-search"
															onClick="itemCusSelectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="itemCusDelete" class="btn closeBtn"
															onclick="$('#itemRealCus').val(''); $('#itemCus').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>*MAKER</th>
											<td><input type="text" class="form-control" id="itemMaker" name="itemMaker" maxlength="50"></td>
										</tr>
										<tr>
											<th>*품번</th>
											<td><input type="text" class="form-control" id="itemCd" name="itemCd" maxlength="20"/></td>
											<th>*단위</th>
											<td><select class="custom-select" id="itemUnit"></select></td>
										</tr>
										<tr>
											<th>*품명</th>
											<td><input type="text" class="form-control" id="itemNm" name="itemNm" maxlength="50"></td>
											<th>*수입검사여부</th>
											<td><select class="custom-select" id="importYn"></select></td>
										</tr>
										<tr>
											<th>SPEC</th>
											<td><input type="text" class="form-control" id="itemSpec" name="itemSpec" maxlength="50"></td>
											<th>작업장</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="itemWorkplace" name="itemWorkplace" disabled>
														<input type="text" class="form-control" id="itemWorkplaceNm" name="itemWorkplaceNm" disabled>
														<button type="button" id="btnItemWorkplace" class="btn btn-primary input-sub-search"
															onClick="itemWorkplaceSelectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="itemWorkplaceDelete" class="btn closeBtn" onclick="$('#itemWorkplace').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>*저장위치</th>
											<td><select class="custom-select" id="savelocCd"></select></td>
											<th>*입고단가</th>
											<td>
												<input type="text" class="form-control" id="importCost" name="importCost" maxlength="30" dir="rtl" value="0">
												<input type="hidden" class="form-control" id="importBeforeCost" name="importBeforeCost" value="0">
											</td>
										</tr>
										<tr>
											<th>*구역 / 위치</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="locNo" name="locNo"> 
														<input type="text" class="form-control" id="areaFloor" name="areaFloor" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnAreaFloor" onClick="selectAreaFloor()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="areaFloorDelete" class="btn closeBtn" onclick="$('#locNo').val(''); $('#areaFloor').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>*입고단가적용일</th>
											<td>
												<div class="form-group input-sub m-0">
													<input class="form-control" type="text" id="importDate" name="importDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(importDate, importDate, 'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search" id="mfcDateCalendar2" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>*선입선출</th>
											<td><select class="custom-select" id="itemFifoGubun"></select></td>
											<th>*포장수량</th>
											<td><input type="text" class="form-control" id="boxCount" name="boxCount" maxlength="30" dir="rtl" value="0"></td>
										</tr>
										<tr>
											<th>*품목사용여부</th>
											<td><select class="custom-select" id="useYn"></select></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3">
												<input type="text" class="form-control" id="itemDesc" name="itemDesc" maxlength="128" style="min-width: 100%;">
											</td>
										</tr>
										<tr class="d-none">
											<th class="d-none">내수/수출</th>
											<td class="d-none"><select class="custom-select" id="exportCd"></select></td>
										</tr>
										<tr class="d-none">
											<th class="d-none">장소</th>
											<td class="d-none"><select class="custom-select" id="locationCd"></select></td>
										</tr>
										
										<tr class="d-none">
											<th>안전재고</th>
											<td><input type="text" class="form-control" id="safetyStock" name="safetyStock" maxlength="30" dir="rtl" value="0"></td>
											<th>결재방식</th>
											<td><select class="custom-select" id="payMethodCd"></select></td>
										</tr>
										<tr>
											
										</tr>
										<tr class="d-none">
											<th>출고단가</th>
											<td><input type="text" class="form-control" id="exportCost" name="exportCost" maxlength="30" dir="rtl" value="0"></td>
											<th>출고단가적용일</th>
											<td>
												<div class="form-group input-sub m-0">
													<input class="form-control" type="text" id="exportDate" name="exportDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(exportDate, exportDate, 'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search" id="mfcDateCalendar3" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr class="d-none">
											<th>금형번호1</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldOne1" name="moldOne1"> 
														<input type="text" class="form-control" id="moldOne" name="moldOne" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnMoldCd1" onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne1Delete" class="btn closeBtn" onclick="$('#moldOne1').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형1 사용여부</th>
											<td><select class="custom-select" id="useYnOne"></select></td>
										</tr>
										<tr class="d-none">
											<th>금형번호2</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldTwo2" name="moldTwo2"> 
														<input type="text" class="form-control" id="moldTwo" name="moldTwo" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnMoldCd2" onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne2Delete" class="btn closeBtn" onclick="$('#moldOne2').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형2 사용여부</th>
											<td><select class="custom-select" id="useYnTwo"></select></td>
										</tr>
										<tr class="d-none">
											<th>금형번호3</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldThree3" name="moldThree3"> 
														<input type="text" class="form-control" id="moldThree" name="moldThree" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnMoldCd3" onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne3Delete" class="btn closeBtn" onclick="$('#moldOne3').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형3 사용여부</th>
											<td><select class="custom-select" id="useYnThree"></select></td>
										</tr>
										<tr>
											<th class="d-none">*LH/RH</th>
											<td class="d-none"><select class="custom-select" id="lhrhCd"></select></td>
										</tr>
										<!-- 
										<tr name="celHrTr">
											<th>건조기준(℃)</th>
											<td><input type="text" class="form-control" id="itemCel" name="itemCel" maxlength="50"></td>
											<th>건조기준(HR)</th>
											<td><input type="text" class="form-control" id="itemHr" name="itemHr" maxlength="50"></td>
										</tr>
										<tr name="celHrTr">
											<th>하한(℃)</th>
											<td><input type="text" class="form-control" id="lowerAmtCel" name="lowerAmtCel" maxlength="50"></td>
											<th>하한(HR)</th>
											<td><input type="text" class="form-control" id="lowerAmtHr" name="lowerAmtHr" maxlength="50"></td>
										</tr>
										<tr name="celHrTr">
											<th>상한(℃)</th>
											<td><input type="text" class="form-control" id="upperAmtCel" name="upperAmtCel" maxlength="50"></td>
											<th>상한(HR)</th>
											<td><input type="text" class="form-control" id="upperAmtHr" name="upperAmtHr" maxlength="50"></td>
										</tr>
										 -->
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
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
									<td colspan='3'>
										<input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20">
									</td>
								</tr>
							</table>
						</div>
						<!--====end====tab1 part=====-->
						<!--====start====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">수입검사</th>
										</tr>
										<tr>
											<th>원재료</th>
											<th>수입검사기준서</th>
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
											<th>물성추이도</th>
											<th>Q-POINT</th>
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
						<!--====start====tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary d-none float-right d-none" id="btnAttachSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachAdd">추가</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemPartAttachDataTable">
										<colgroup>
											<col width="7%">
											<col width="10%">
											<col width="33%">
											<col width="50%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>등록자</th>
												<th>내용</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--====start====tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
									<div class="table-responsive">
										<div class="card-body col-sm-12 p-1 mb-2">
											<button type="button" class="btn btn-danger float-right" id="btnImportDel">입고단가삭제</button>
										</div>													
										<table class="table table-bordered" id="itemInformationTable">
											<colgroup>
												<col width="5%">
												<col width="11%">
												<col width="12%">
												<col width="12%">
												<col width="10%">
												<col width="20%">
											</colgroup>				
											<thead>
												<tr>
													<th>No</th>
													<th id="importOrExport" class="text-center">입고단가</th>
													<th id="importOrExportDate">적용일자</th>
													<th>변경일자</th>
													<th>작성자</th>
													<th>변경사유</th>
												</tr>
											</thead>
											<tbody class="text-center">
											</tbody>
											<!--==========/table 내용 추가==========-->
										</table>
									</div>
<!-- 								</form> -->
<!-- 							</div> -->
						</div>
						<!--====end====tab4 part=====-->
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">품목정보관리 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<div class="table-responsive" style="height: 700px;">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>CODE</th>
								<th>ITEM</th>
								<th>구분</th>
								<th>Type</th>
								<th>REV</th>
								<th>SPEC</th>
								<th>입고처</th>
								<th>단위</th>
								<th>기본납기일</th>
								<th>자재단가</th>
								<th>사용여부</th>
								<th>수입검사여부</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--=======모달영역====================================================-->
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

	let currentHref = "bmsc0030";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "자재정보관리(레이저)");

	uiProc(true);
	let sideView = 'add';
	let btnView = '';
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	var dealCorpCd = "${dealCorpCd}";
	var activeTab = '기본정보';
	var itemCd;
	var itemAttachSeq;
	var itemRev = '00';
	var urlData = null;
	var itemCdArr = [];
	var itemSeq = null;
	var itemGubunList = '004';
	var mainGubunList = '';
	var status = '';
	var serverDate = "${serverDateTo}";

	//서버 시간 입력
	$('#importDate').val(serverDate);
	$('#exportDate').val(serverDate);
	
	//공통코드 처리 시작
	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var itemGubun = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubun.push(json);
	</c:forEach>
	
	var importYn = new Array();
	<c:forEach items="${importYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	importYn.push(json);
	</c:forEach>
	
	var itemType = new Array();
	<c:forEach items="${itemType}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemType.push(json);
	</c:forEach>
	
	var itemJustGubun = new Array();
	<c:forEach items="${itemJustGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemJustGubun.push(json);
	</c:forEach>
	
	var exportCd = new Array();
	<c:forEach items="${exportCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	exportCd.push(json);
	</c:forEach>
	
	var stateCd = new Array();
	<c:forEach items="${stateCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	stateCd.push(json);
	</c:forEach>
	
	var payMethodCd = new Array();
	<c:forEach items="${payMethodCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	payMethodCd.push(json);
	</c:forEach>
	
	var lhrhCd = new Array();
	<c:forEach items="${lhrhCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	lhrhCd.push(json);
	</c:forEach>
	
	var accCd = new Array();
	<c:forEach items="${accCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	accCd.push(json);
	</c:forEach>
	
	var itemModel = new Array();
	<c:forEach items="${itemModel}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemModel.push(json);
	</c:forEach>
	
	var locationCd = new Array();
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locationCd.push(json);
	</c:forEach>
	
	var savelocCd = new Array();
	<c:forEach items="${savelocCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	savelocCd.push(json);
	</c:forEach>
	
	var itemFifoGubun = new Array();
	<c:forEach items="${itemFifoGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemFifoGubun.push(json);
	</c:forEach>
	
	var itemUnit = new Array();
	<c:forEach items="${itemUnit}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemUnit.push(json);
	</c:forEach>

	var mainGubun = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubun.push(json);
	</c:forEach>
	//공통코드 처리 끝

	//선택박스 처리
	selectBoxAppend(itemGubun, "itemGubun", "", "");
	selectBoxAppend(itemModel, "itemModel", "", "");
	selectBoxAppend(stateCd, "stateCd", "004", "");
	selectBoxAppend(lhrhCd, "lhrhCd", "", "2");
	selectBoxAppend(exportCd, "exportCd", "", "");
	selectBoxAppend(importYn, "importYn", "", "");
	selectBoxAppend(locationCd, "locationCd", "", "");
	selectBoxAppend(savelocCd, "savelocCd", "", "2");
	selectBoxAppend(payMethodCd, "payMethodCd", "", "");
	selectBoxAppend(useYnCode, "useYnOne", "", "");
	selectBoxAppend(useYnCode, "useYnTwo", "", "");
	selectBoxAppend(useYnCode, "useYnThree", "", "");
	selectBoxAppend(useYnCode, "useYn", "", "2");
	selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
	selectBoxAppend(itemUnit, "itemUnit", "", "");

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#tab1Nav').tab('show');
		$('#btnSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnRevAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		/* $('#mainGubun2').attr('disabled', false); */
		$('#itemGubun2').attr('disabled', false);
	});

	// 목록
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : function(){return itemGubunList;},
				'mainGubun' : function(){return '001';},
			},
		},
		rowId : 'itemCd',
		columns : [
				{
					data : 'itemCusNm',
					'className' : 'text-center'
				}, 
				{
					data : 'itemCd',
					'className' : 'text-center'
				}, 
				{
					data : 'itemNm',
					'className' : 'text-center'
				}, 
				{
					data : 'itemSpec',
					'className' : 'text-center'
				}, 
				{
					data : 'itemUnit',
					'className' : 'text-center'
				}, 
				{
					data : 'savelocCdNm',
					'className' : 'text-center'
				}, 
				{
					data : 'locationNm',
					render : function(data, type, row, meta) {
						if(data != null){
							return row['locationNm'] + '/' + row['floorNm'];
						} else return '-';
					}
				}, 
				{
					data : 'importYn',
					render : function(data, type, row, meta) {
						if(data == '001'){
							return 'Y';
						}else if(data == '002'){
							return 'N';
						}
					}
				}, 
				{
					data : 'useYn',
					render : function(data, type, row, meta) {
						if(data == '001'){
							return 'Y';
						}else if(data == '002'){
							return 'N';
						}
					}
				}
		],		
		order : [ [ 1, 'asc' ] ],
		buttons : [ 'copy', 
			{
			"extend": 'excel',
	        "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
	        "titleAttr": 'Excel',
	        "action": newexportaction
	   		 
			}, 'print' ],
	});


	//DataTable button click
	function newexportaction(e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;
        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = 2147483647;
            dt.one('preDraw', function (e, settings) {
                // Call the original action function
                if (button[0].className.indexOf('buttons-copy') >= 0) {
                    $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                    $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                    $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                    $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-print') >= 0) {
                    $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                }
                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });
                // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);
                // Prevent rendering of the full data to the DOM
                return false;
            });
        });
        // Requery the server with the new one-time export settings
        dt.ajax.reload();
    }

	// 보기
	$('#itemPartAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnAttachSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#tab1Nav').tab('show');

		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		//중요 키 값 가져오기
		itemSeq = itemPartAdmTable.row(this).data().itemSeq;
		itemCd = itemPartAdmTable.row(this).data().itemCd;
		itemRev = itemPartAdmTable.row(this).data().itemRev;
		
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#tab2Nav').removeClass('disabled');
		$('#tab3Nav').removeClass('disabled');
		$('#tab4Nav').removeClass('disabled');

		$.ajax({
			url : '<c:url value="/bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'itemSeq' : itemSeq
			},
			success : function(res) {
				let data = res.data;
				let statusYn = res.statusYn;

				if (res.result == 'ok') {
					sideView = 'edit';

					//상세보기
					$('#itemRev').val(data.itemRev);
					$('#itemMaker').val(data.itemMaker);
					$('#itemRealCus').val(data.itemCus);
					$('#itemCus').val(data.itemCusNm);
					$('#itemCd').val(data.itemCd);
					$('#itemNm').val(data.itemNm);
					$('#accRealCd').val(data.accCd);
					$('#accCd').val(data.accCdNm);
					$('#itemGenre').val(data.itemGenre);
					$('#boxCount').val(data.boxCount != null ? rmDecimal(data.boxCount) : '0');
					$('#itemSpec').val(data.itemSpec);
					$('#itemWorkplace').val(data.itemWorkplace);
					$('#itemWorkplaceNm').val(data.itemWorkplaceNm);
					$('#safetyStock').val(data.safetyStock != null ? rmDecimal(data.safetyStock) : '0');
					$('#importCost').val(data.importCost != null ? rmDecimal(data.importCost) : '0');
					$('#importBeforeCost').val(data.importCost != null ? rmDecimal(data.importCost) : '0');
					$('#importDate').val(moment(data.importDate).format('YYYY-MM-DD'));
					$('#moldOne').val(data.moldOne);
					$('#moldTwo').val(data.moldTwo);
					$('#moldThree').val(data.moldThree);
					$('#itemDesc').val(data.itemDesc);
					/*
					$('#itemCel').val(data.itemCel);
					$('#itemHr').val(data.itemHr);
					$('#upperAmtCel').val(data.upperAmtCel);
					$('#upperAmtHr').val(data.upperAmtHr);
					$('#lowerAmtCel').val(data.lowerAmtCel);
					$('#lowerAmtHr').val(data.lowerAmtHr);
					*/
					$('#locNo').val(data.locNo);
					$('#areaFloor').val(data.areaNm != null ? data.areaNm + ' / ' + data.floorNm : '');
					
					//셀렉트박스 상세보기
					selectBoxAppend(itemGubun, "itemGubun", data.itemGubun, "");
					selectBoxAppend(itemModel, "itemModel", data.itemModel, "");
					selectBoxAppend(stateCd, "stateCd", data.stateCd, "");
					selectBoxAppend(lhrhCd, "lhrhCd", data.lhrhCd, "2");
					selectBoxAppend(exportCd, "exportCd", data.exportCd, "");
					selectBoxAppend(importYn, "importYn", data.importYn, "");
					selectBoxAppend(locationCd, "locationCd", data.locationCd, "");
					selectBoxAppend(savelocCd, "savelocCd", data.savelocCd, "");
					selectBoxAppend(payMethodCd, "payMethodCd", data.payMethodCd, "");
					selectBoxAppend(useYnCode, "useYnOne", data.useYnOne, "");
					selectBoxAppend(useYnCode, "useYnTwo", data.useYnTwo, "");
					selectBoxAppend(useYnCode, "useYnThree", data.useYnThree, "");
					selectBoxAppend(useYnCode, "useYn", data.useYn, "2");
					selectBoxAppend(itemFifoGubun, "itemFifoGubun", data.itemFifoGubun, "");
					selectBoxAppend(itemUnit, "itemUnit", data.itemUnit, "");
					
					// 사출/봉제
					/* if(data.mainGubun == '001'){
						$('#mg1').prop('checked', true);
						$('tr[name=celHrTr]').removeClass('d-none');
					}else if(data.mainGubun == '002'){
						$('#mg2').prop('checked', true);
						$('tr[name=celHrTr]').addClass('d-none');
					}
 */
					//disabled 비활성화
					uiProc(true);
					
// 					$('#unitCost').val(data.unitCost == null ? data.unitCost: rmDecimal(data.unitCost));
// 					$('#standCost').val(data.standCost == null ? data.standCost: rmDecimal(data.standCost));

				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	var html1 = '<div class="row">';
	/* html1 += '<label class="input-label-sm">구분</label>'; */
	/* html1 += '<div class="form-group input-sub m-0">'; */
	/* html1 += '<select class="custom-select" id="mainGubun2" onChange="mainOnchange()">'; */
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">품목구분</label>';
	//html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="itemGubun2" onChange="itemOnchange()">';
	html1 += '</select>&nbsp;&nbsp;&nbsp;';
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/itemPartBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html1 += '</div>';

	$('#itemPartAdmTable_length').html(html1);
	
	selectBoxAppend(itemGubun, "itemGubun2", "", "");
	/* selectBoxAppend(mainGubun, "mainGubun2", "", "1"); */
	
	function itemOnchange(){
		itemGubunList = $("#itemGubun2 option:selected").val();
		$("#itemGubun").val(itemGubunList).prop("selected", true);
		
		$('#itemPartAdmTable').DataTable().ajax.reload();
		
	}
	
/* 	function mainOnchange(){
		mainGubunList = $("#mainGubun2 option:selected").val();
		$("#mainGubun").val(mainGubunList).prop("selected", true);
		
		$('#itemPartAdmTable').DataTable().ajax.reload();
		
	} */
	
	function selectOnchange(){
// 		var itemGubunFind = $("#itemGubun option:selected").val();
// 		if(itemGubunFind == '001'){
// 			$('#itemType').attr('disabled', false);
// 			selectBoxAppend(itemType, "itemType", "", "");
// 		}else if(itemGubunFind == '002'){
// 			$('#itemType').attr('disabled', true);
// 			selectBoxAppend(itemType, "itemType", "", "2");
// 		}
	}

	//기본정보 등록 버튼
	$('#btnAdd').on('click', function() {
		sideView = 'add';

		//행 선택 취소
		$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		//상세정보 초기화
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		
		//서버시간 넣기
		$('#importDate').val(serverDate);
		$('#exportDate').val(serverDate);
		
		//seq 찾기
		$.ajax({
			url : '<c:url value="/bm/getItemCdSeq"/>',
			type : 'POST',
			async : false,
			data : {},
			success : function(res) {
				data = res.itemCdSeq;
				itemSeq = data;
			}
		});
		
		
		//선택박스 처리
		selectBoxAppend(itemGubun, "itemGubun", "", "");
		selectBoxAppend(itemModel, "itemModel", "", "");
		selectBoxAppend(stateCd, "stateCd", "004", "");
		selectBoxAppend(lhrhCd, "lhrhCd", "", "2");
		selectBoxAppend(exportCd, "exportCd", "", "");
		selectBoxAppend(importYn, "importYn", "", "");
		selectBoxAppend(locationCd, "locationCd", "", "");
		selectBoxAppend(savelocCd, "savelocCd", "001", "2");
		selectBoxAppend(payMethodCd, "payMethodCd", "", "");
		selectBoxAppend(useYnCode, "useYnOne", "", "");
		selectBoxAppend(useYnCode, "useYnTwo", "", "");
		selectBoxAppend(useYnCode, "useYnThree", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
		selectBoxAppend(itemUnit, "itemUnit", "", "");

		uiProc(false);
		$('#itemRev').val('00');
		$('#btnSave').removeClass('d-none'); // 저장버튼
		$('#btnRevAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$("#itemGubun").val(itemGubunList).prop("selected", true);
		/* $('#mainGubun2').attr('disabled', true); */
		$('#itemGubun2').attr('disabled', true);
	});

	//기본정보 리비전 등록 버튼
	$('#btnRevAdd').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("Revision등록할 항목을 선택해주세요.");
			return false;
		}

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		
		//Revision값 가져오기
		$.ajax({
			url : '<c:url value="bm/getPartRev"/>',
			type : 'GET',
			data : {
				'itemSeq' : itemSeq,
				'itemRev' : itemRev
			},
			success : function(res) {
				var data = res.data;
				$('#itemCd').val(itemCd);
				$('#itemRev').val(data.itemRev);
			}
		});

		uiProc(false);
		/* if($('input[name=mainGubun]:checked').val() == '001'){
			$('#itemWorkplace').val('S-S');
			$("#btnItemWorkplace").attr("disabled", true);
			$("#itemWorkplaceDelete").attr("disabled", true);
		}else if($('input[name=mainGubun]:checked').val() == '002'){
			$('#itemWorkplace').val('');
			$("#btnItemWorkplace").attr("disabled", false);
			$("#itemWorkplaceDelete").attr("disabled", false);
		} */
		
		$('#itemCd').attr('disabled', true);
		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');

		sideView = 'rev';
		
		//셀렉트박스 새로고침
		selectBoxAppend(importYn, "importYn", "", "");
		selectBoxAppend(lhrhCd, "lhrhCd", "", "");
		selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");
	});

	//기본정보 수정 버튼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		
		uiProc(false);
		if($('input[name=mainGubun]:checked').val() == '001'){
			$('#itemWorkplace').val('S-S');
			$("#btnItemWorkplace").attr("disabled", true);
			$("#itemWorkplaceDelete").attr("disabled", true);
		}else if($('input[name=mainGubun]:checked').val() == '002'){
// 			$('#itemWorkplace').val('');
			$("#btnItemWorkplace").attr("disabled", false);
			$("#itemWorkplaceDelete").attr("disabled", false);
		}
		
		$('#btnAdd').attr('disabled', true);
		$('#btnRevAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
		/* $('#mainGubun2').attr('disabled', true); */
		$('#itemGubun2').attr('disabled', true);
	});

	//기본정보 저장 처리
	$('#btnSave').on('click',function() {
		if (activeTab == "기본정보") {
			
			if ($('#itemGubun option:selected').val() == '' || $('#itemGubun option:selected').val() == undefined) {
				toastr.warning('품목구분을 선택해 주세요.');
				$('#mg1').focus();
				return false;
			}

			if (!$('#itemRealCus').val()) {
				toastr.warning('공급사를 선택해 주세요.');
				$('#itemRealCus').focus();
				return false;
			}

			if (!$('#itemMaker').val()) {
				toastr.warning('Maker를 선택해 주세요.');
				$('#itemMaker').focus();
				return false;
			}
			
			if (!$('#itemCd').val()) {
				toastr.warning('품번을 선택해 주세요.');
				$('#itemCd').focus();
				return false;
			}
			
			var itemCdCheck = false;
			
			if(sideView == 'add' || sideView == 'edit'){
				$.ajax({
					url : '<c:url value="bm/itemPartDtlList"/>',
					type : 'GET',
					async : false,
					data : {
						'itemCd' : function() {return $('#itemCd').val();},
						'mainGubun'  : '001'
					},
					success : function(res) {
						let data = res.data;
						
						if(data != null && itemSeq != data.itemSeq){
							itemCdCheck = true;
						}
					}
					
				});
			}
		
			if (itemCdCheck) {
				toastr.warning('중복된 품번 입니다.');
				//$('#itemCd').val('');
				$('#itemCd').focus();
				return false;
			}
			
			if (!$('#itemNm').val()) {
				toastr.warning('품명을 선택해 주세요.');
				$('#itemNm').focus();
				return false;
			}
			
			if (!$('#importYn').val()) {
				toastr.warning('수입검사여부를 선택해 주세요.');
				$('#importYn').focus();
				return false;
			}
			
			if ($('#boxCount').val().replace(/,/g, '').length > 10) {
				toastr.warning('포장수량이 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
				$('#boxCount').val(0);
				$('#boxCount').focus();
				return false;
			}

			if ($('#boxCount').val()=="" || $('#boxCount').val()=="0" || $('#boxCount').val()=="0") {
				toastr.warning('포장수량을 입력해주세요.');
				$('#boxCount').focus();
				return false;
			}
			
			if (!$('#itemFifoGubun').val()) {
				toastr.warning('선입선출을 선택해 주세요.');
				$('#itemFifoGubun').focus();
				return false;
			}
			
			if (!$('#useYn').val()) {
				toastr.warning('품목사용여부를 선택해 주세요.');
				$('#useYn').focus();
				return false;
			}
			
			var tempImportCost = $('#importCost').val();
			if(tempImportCost.indexOf('.') == -1){
				tempImportCost = tempImportCost + '.00';
			}
			
			if (tempImportCost.substring(tempImportCost.lastIndexOf("."), 0).replace(/,/g, '').length > 8) {
				toastr.warning('입고단가가 너무 큽니다. (일 억 미만으로 입력해 주세요.)');
				$('#importCost').val('0');
				$('#importCost').focus();
				return false;
			}
			
			if (!(/^(\d*)[\.]?(\d{1,2})?$/g.test($('#importCost').val().replace(/,/g, '')))) {
				toastr.warning('소수점 둘째 자리까지만 입력해 주세요.');
				$('#importCost').val('0');
				$('#importCost').focus();
				return false;
			}

			if ($('#importCost').val()=="" || $('#importCost').val()=="0" || $('#importCost').val()=="0") {
				toastr.warning('입고단가를 입력해주세요.');
				$('#importCost').focus();
				return false;
			}
			
			
			if (!$('#savelocCd').val()) {
				toastr.warning('저장위치를 선택해 주세요.');
				$('#savelocCd').focus();
				return false;
			}
			
			if (!$('#locNo').val()) {
				toastr.warning('구역/위치를 입력해 주세요.');
				$('#btnAreaFloor').focus();
				return false;
			}
			
			//값이 하나라도 있으면 다 입력하게 하는 if문(값이 다 있거나 다 없거나) 
			if ($('input[name=mainGubun]:checked').val() == '001') { // 사출은 기준, 상한, 하한이 있다.
				if ($.trim($('#itemCel').val()) || $.trim($('#upperAmtCel').val()) || $.trim($('#lowerAmtCel').val())) { //(℃) - 기준, 상한, 하한이 하나라도 값이 있으면
					if ($.trim($('#itemCel').val()) && $.trim($('#upperAmtCel').val()) && $.trim($('#lowerAmtCel').val())) { //기준, 상한, 하한의 값이 다 있으면 넘어감
						
					} else {
						if (!$.trim($('#itemCel').val())) {
							toastr.warning('건조기준(℃)을 입력해 주세요.');
							$('#itemCel').focus();
							return false;
						}
						if (!$.trim($('#upperAmtCel').val())) {
							toastr.warning('상한(℃)을 입력해 주세요.');
							$('#upperAmtCel').focus();
							return false;
						}
						if (!$.trim($('#lowerAmtCel').val())) {
							toastr.warning('하한(℃)을 입력해 주세요.');
							$('#lowerAmtCel').focus();
							return false;
						}
					}
				}
			
				if ($.trim($('#itemHr').val()) || $.trim($('#upperAmtHr').val()) || $.trim($('#lowerAmtHr').val())) { //(HR) - 기준, 상한, 하한이 하나라도 값이 있으면
					if ($.trim($('#itemHr').val()) && $.trim($('#upperAmtHr').val()) && $.trim($('#lowerAmtHr').val())) { //기준, 상한, 하한의 값이 다 있으면 넘어감
						
					} else {
						if (!$.trim($('#itemHr').val())) {
							toastr.warning('건조기준(HR)을 입력해 주세요.');
							$('#itemHr').focus();
							return false;
						}
						if (!$.trim($('#upperAmtHr').val())) {
							toastr.warning('상한(HR)을 입력해 주세요.');
							$('#upperAmtHr').focus();
							return false;
						}
						if (!$.trim($('#lowerAmtHr').val())) {
							toastr.warning('하한(HR)을 입력해 주세요.');
							$('#lowerAmtHr').focus();
							return false;
						}
					}
				}
			}
			
			//입고단가 등록
			if($('#importCost').val() != $('#importBeforeCost').val()){
				$.ajax({
					url : '<c:url value="bm/itemCostListCreate"/>',
					type : 'POST',
					async : false,
					data : {
						'itemSeq' 		: 	function(){return itemSeq;},
						'importCost' 	: 	function(){return $('#importCost').val().replace(/,/g,'');},
						'importDate' 	: 	function(){return $('#importDate').val().replace(/-/g,'');},
						'changeDate' 	: 	function(){return serverDate.replace(/-/g,'');},
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success('입고단가이력이 등록되었습니다.');
							
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnAddConfirm').removeClass('d-none');
						$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}
			
			var url = '/bm/itemPartAdmCreate';
			if (sideView == "edit") {
				url = '/bm/itemPartAdmUpdate';
			} else if (sideView == "rev") {
				url = '/bm/itemPartRevCreate';
			}

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'itemSeq' : itemSeq,
					'mainGubun'   : '001',
					'itemGubun' : $("#itemGubun option:selected").val(),
					'itemCd' : $('#itemCd').val(),
					'itemRev' : "00",
					'itemType' : $("#itemType option:selected").val(),
					'itemCus' : $('#itemRealCus').val(),
					'itemMaker' : $('#itemMaker').val(),
					'accCd' : $("#accRealCd").val(),
					'itemNum' : $('#itemNum').val(),
					'itemNm' : $('#itemNm').val(),
					'itemJustGubun' : $("#itemJustGubun option:selected").val(),
					'itemModel' : $('#itemModel').val(),
					'itemSpec' : $('#itemSpec').val(),
					'exportCd' : $("#exportCd option:selected").val(),
					'itemGenre' : $('#itemGenre').val(),
					'importYn' : $("#importYn option:selected").val(),
					'stateCd' : $("#stateCd option:selected").val(),
					'locationCd' : $("#locationCd option:selected").val(),
					'itemWorkplace' : $('#itemWorkplace').val(),
					'savelocCd' : $("#savelocCd option:selected").val(),
					'safetyStock' : $('#safetyStock').val().replace(/,/g, ''),
					'payMethodCd' : $("#payMethodCd option:selected").val(),
					'lhrhCd' : $("#lhrhCd option:selected").val(),
					'importCost' : $('#importCost').val().replace(/,/g, ''),
					'importDate' : $('#importDate').val().replace(/-/g, ''),
					'exportCost' : $('#exportCost').val().replace(/,/g, ''),
					'exportDate' : $('#exportDate').val().replace(/-/g, ''),
					'boxCount' : $('#boxCount').val().replace(/,/g, ''),
					'useYn' : $("#useYn option:selected").val(),
					'moldOne' : $('#moldOne').val(),
					'useYnOne' : $('#useYnOne').val(),
					'moldTwo' : $('#moldTwo').val(),
					'useYnTwo' : $('#useYnTwo').val(),
					'moldThree' : $('#moldThree').val(),
					'useYnThree' : $('#useYnThree').val(),
					'itemFifoGubun' : $('#itemFifoGubun').val(),
					'itemDesc' : $('#itemDesc').val(),
					'locNo' : $('#locNo').val(),
					'itemUnit' : $('#itemUnit').val(),
					/*
					'itemCel' : $('#itemCel').val(),
					'itemHr' : $('#itemHr').val(),
					'upperAmtCel' : $('#upperAmtCel').val(),
					'upperAmtHr' : $('#upperAmtHr').val(),
					'lowerAmtCel' : $('#lowerAmtCel').val(),
					'lowerAmtHr' : $('#lowerAmtHr').val(),
					*/
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						$('#itemPartAdmTable').DataTable().ajax.reload(function() {});
// 						$('#itemInformationTable').DataTable().ajax.reload(function() {});
						uiProc(true);
						$('#btnSave').addClass('d-none');
						$('#btnAdd').attr('disabled', false);
						$('#btnRevAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
						$('#btnDel').attr('disabled', false);
// 						$('#tab3Nav').removeClass('disabled');
// 						$('#tab4Nav').removeClass('disabled');
					/* 	$('#mainGubun2').attr('disabled', false); */
						$('#itemGubun2').attr('disabled', false);
					
						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else if (sideView == "add") {
							toastr.success('신규 등록되었습니다.');
						} else if (sideView == "rev") {
							toastr.success('리비전 등록되었습니다.');
						}

						itemCd = $('#itemCd').val();
						itemRev = $('#itemRev').val();

						sideView = 'edit';
					} else if (res.result == "exist") {
						toastr.error("이미 등록된 코드입니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
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
					}
				});
			}else{
				$('#changeHisTable').addClass('d-none');
			}
			
		}
	});

	$('#tab1Nav').on('click', function() {
		uiProc(true);
		/* $('#mainGubun2').attr('disabled', false); */
		$('#itemGubun2').attr('disabled', false);
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
	});

	$('#tab3Nav').on('click', function() {
		$('#btnAttachAdd').removeClass('d-none');
		$('#btnAttachDel').removeClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#itemPartAttachDataTable').DataTable().ajax.reload();
	});

	$('#tab4Nav').on('click', function() {
		$('#itemInformationTable').DataTable().ajax.reload();
	});

	//입고단가이력 테이블 조회
	let itemInformationTable = $('#itemInformationTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,		
		ajax : {
			url : '<c:url value="bm/itemInformationList"/>',
			type : 'GET',
			data : {
				'itemSeq'	: function() {return itemSeq;},
			},
		},
		rowId : 'itemCostSeq',
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
					data : 'importCost',
					render : function(data, type, row) {
						return rmDecimal(data);
					},
					'className' : 'text-right'
				},
				{
					data : 'importDate',
					render : function(data, type, row) {
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{
					data : 'changeDate',
					render : function(data, type, row) {
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{ data : 'regNm' 	},
				{ 
					data : 'itemReason',	
					render : function(data, type, row, meta) {
						var str = data;
						if (data == null)
							str = '';
						return '<input class="form-control" type="text" id="itemReason'+ row['itemCostSeq']+ '" style="min-width : 100%" value="'+str+'" onchange="itemReasonCreate('
								+ row['itemCostSeq']+')"/>';
					}
				}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});
	
	var html_import = '<div class="row">';
	/* html_import += '<button type="button" class="btn btn-warning float-left d-none ml-2" id="btnImportDel">입고단가삭제</button>'; */
	html_import += '</div>';
	
	$('#itemInformationTable_length').html(html_import);
	
	let importCheck = "";
	
	//입고단가이력 테이블 클릭
	$('#itemInformationTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			importCheck = "";
			return false;
		} else {
			$('#itemInformationTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemCostSeq = itemInformationTable.row(this).data().itemCostSeq;
		console.log("itemCostSeq = " + itemCostSeq);
	
		importCheck = "edit";
	});
	
	//입고단가이력 삭제
	$('#btnImportDel').on('click', function() {
		if (importCheck != "edit") {
			toastr.warning("삭제할 입고단가이력을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/itemCostDtlDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemCostSeq' : function() {return itemCostSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('입고단가이력이 삭제되었습니다.');
					importCheck = '';
				} else {
					toastr.error(res.message);
				}
				$('#itemInformationTable').DataTable().ajax.reload();
			}
		});

	});
	
	function itemReasonCreate(itemCostSeq){
		$.ajax({
			url : '<c:url value="/bm/itemReasonCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'itemSeq' : function() {
					return itemSeq;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'itemCostSeq' : function() {
					return itemCostSeq;
				},
				'itemReason' : $('#itemReason' + itemCostSeq).val()
			},
			beforeSend : function() {
				// $('#btnAddConfirm').addClass('d-none');
				// $('#btnAddConfirmLoading').removeClass('d-none');
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('변경사유가 수정되었습니다.');
					
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
	}

	//관련자료 목록조회
	let itemPartAttachDataTable = $('#itemPartAttachDataTable').DataTable({
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
			url : '<c:url value="/bm/itemPartAttachDataList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemRev' : function() {return itemRev;},
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					}
				},
				{
					data : 'regNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return userNm;
						}
					}
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return '<input class="form-control" type="text" id="contents" name="contents" style="min-width:100%;"/>';
						}
					}
				},
				{
					data : 'fileNm',
					render : function(data, type, row, meta) {

						var html;

						if (data != null) {
							html = '<a href="/bm/itemPartAttachFileDownload?itemSeq='
									+ row['itemSeq']
									+ '&itemRev='
									+ row['itemRev']
									+ '&itemAttachSeq='
									+ row['itemAttachSeq']
									+ '">'
									+ data + '</a>';
						} else {
							html = '<div class="custom-file" disabled>'
							html += '<input type="file" class="custom-file-input" id="fileNm_'
									+ meta.row
									+ '" name="file" onchange=uploadWorkStandard("'
									+ meta.row + '"); />'
							html += '<label class="custom-file-label" for="fileNm_'+meta.row+'">파일을 선택해주세요.</label></div>'
						}

						return html;
					}
				} ],
		columnDefs : [ {
			"targets" : [ 0, 1 ],
			"className" : "text-center"
		},

		],
		buttons : []
	});

	//데이터 클릭 시
	$('#itemPartAttachDataTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemPartAttachDataTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemAttachSeq = itemPartAttachDataTable.row(this).data().itemAttachSeq;
		console.log("itemAttachSeq = " + itemAttachSeq);
	
		status = "choice";
	});

	//추가버튼
	$('#btnAttachAdd').on('click', function() {
		/* if(status != "choice"){
			toastr.warning("관련자료 항목을 선택해주세요.");
		} */
		$('#itemPartAttachDataTable').DataTable().row.add({}).draw(false);

		$('#btnAttachAdd').attr('disabled', true);
		$('#btnAttachDel').attr('disabled', true);

		$('#btnAttachSave').removeClass('d-none');

	});

	//삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (status != "choice") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="bm/itemPartAttachDataDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {
					return itemSeq;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'itemAttachSeq' : function() {
					return itemAttachSeq;
				},

			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					status = '';
				} else {
					toastr.error(res.message);
				}
				$('#itemPartAttachDataTable').DataTable().ajax.reload();
			}
		});

	});

	//저장 버튼 클릭
	$('#btnAttachSave').on('click', function() {
		if (activeTab == "관련자료") {

			if (!$.trim($('input[name=file]').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#file').focus();
				return false;
			}

			var formData = new FormData(document.getElementById("form3"));
			formData.append('itemSeq', itemSeq);
			formData.append('itemRev', $('#itemRev').val());

			$.ajax({
				url : '<c:url value="bm/itemPartAttachDataCreate" />',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(res) {
					if (res.result == 'ok') {
						// 보기
						toastr.success('등록되었습니다.');
						status = '';
					} else {
						toastr.error(res.message);
					}

					$('#itemPartAttachDataTable').DataTable().ajax.reload();
					$('#btnAttachSave').addClass('d-none');
					$('#btnAttachAdd').attr('disabled', false);
					$('#btnAttachDel').attr('disabled', false);
				}
			});

		}
	});

	//공급사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function itemCusSelectInCorpCd() {
		popUpCheck = '고객사';
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		var dealArr = ['002','003'];
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4')
				.DataTable(
						{	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
								url : '<c:url value="/bm/dealCorpDataList"/>',
								type : 'GET',
								data : {
									'dealArr' :  function(){return dealArr;},
								},
							},
							rowId : 'dealCorpSeq',
							columns : [ {
								data : 'dealCorpNm'
							}, {
								data : 'dealCorpCd'
							}, {
								data : 'presidentNm'
							}, {
								data : 'repreItem'
							}, {
								data : 'corpNo'
							} ],
							columnDefs : [ {
								"defaultContent" : "-",
								"targets" : "_all",
								"className" : "text-center"
							} ],
							order : [ [ 0, 'asc' ] ],
							buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			if(popUpCheck == '고객사'){
				var data = dealCorpPopUpTable4.row(this).data();
				$('#itemRealCus').val(data.dealCorpCd);
				$('#itemCus').val(data.dealCorpNm);
				$('#dealCorpPopUpModal4').modal('hide');
			}
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	//입고처 팝업 시작
	var dealCorpPopUpTable4;
	function accCdSelectInCorpCd() {
		popUpCheck = '입고처';
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4')
				.DataTable(
						{	dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
								url : '<c:url value="/bm/dealCorpDataJustList"/>',
								type : 'GET',
								data : {},
							},
							rowId : 'dealCorpSeq',
							columns : [ {
								data : 'dealCorpNm'
							}, {
								data : 'dealCorpCd'
							}, {
								data : 'presidentNm'
							}, {
								data : 'repreItem'
							}, {
								data : 'corpNo'
							} ],
							columnDefs : [ {
								"defaultContent" : "-",
								"targets" : "_all",
								"className" : "text-center"
							} ],
							order : [ [ 0, 'asc' ] ],
							buttons : [],
		});

		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			if(popUpCheck == '입고처'){
				var data = dealCorpPopUpTable4.row(this).data();
				$('#accRealCd').val(data.dealCorpCd);
				$('#accCd').val(data.dealCorpNm);
				$('#dealCorpPopUpModal4').modal('hide');
			}
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	//작업장 팝업 시작
	var itemWorkplacePopUpTable;
	function itemWorkplaceSelectInCorpCd() {
		popUpCheck = '작업장';
		if (itemWorkplacePopUpTable == null || itemWorkplacePopUpTable == undefined) {
			itemWorkplacePopUpTable = $('#itemWorkplacePopUpTable').DataTable({	
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
					url : '<c:url value="/bm/prcssItemWorkplace"/>',
					type : 'GET',
					data : {
						'prcssGubun' : '001',
						'prcssType' : '002'
					},
				},
				rowId : 'prcssCd',
				columns : [ {
					data : 'prcssCd'
				}, {
					data : 'prcssNm'
				}  ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
			
			$('#itemWorkplacePopUpTable tbody').on('click', 'tr', function() {
				if(popUpCheck == '작업장'){
					var data = itemWorkplacePopUpTable.row(this).data();
					$('#itemWorkplace').val(data.prcssCd);
					$('#itemWorkplaceNm').val(data.prcssNm);
					$('#itemWorkplacePopUpModal').modal('hide');
				}
			});
		}
		$('#itemWorkplacePopUpModal').modal('show');
	}
	
	// 구역/위치 팝업 시작
	var locationPopupTable;
	function selectAreaFloor() {
		
		if (!$('#savelocCd').val()) {
			toastr.warning('저장위치를 선택해 주세요.');
			$('#savelocCd').focus();
			return false;
		}
		if (locationPopupTable != null && locationPopupTable != 'undefined') {
			locationPopupTable.destroy();
		}
		
		locationPopupTable = $('#locationPopupTable')
				.DataTable(
						{	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
								url : '<c:url value="/bm/locationAdmList"/>',
								type : 'GET',
								data : {
									'locCd' : function(){return $('#savelocCd').val();},
									'mainGubun' : function(){return '001'},
								},
							},
							columns : [ 
								{
									data : 'locNo' , 
										render : function(data, type, row, meta){
											if(data!=null){
												return data;
											} else{
												return '-';
											}
										}
								}, 
								{
									data : 'locNm'
								}, 
								{
									data : 'areaNm'
								}, 
								{
									data : 'floorNm'
								}, 
								{
									data : 'useYnNm'
								}, 
								{
									data : 'locDesc'
								},  
							],
							columnDefs : [ {
								"defaultContent" : "-",
								"targets" : "_all",
								"className" : "text-center"
							} ],
							order : [ [ 0, 'asc' ] ],
							buttons : [],
		});

		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();
			$('#locNo').val(data.locNo);
			$('#areaFloor').val(data.areaNm + ' / ' + data.floorNm);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	//숫자 콤마생성
	$(document).on('keyup', "#importCost, #exportCost, #boxCount, #safetyStock",  function(evt) { //입력시 콤마 추가
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
			$(this).val(rmDecimal(poQty));
			return false;
		}
		$(this).val(rmDecimal(poQty));

	});


	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/itemPartExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		rowId : 'itemCd',
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							
							+ 1;
				}
			},
			{data : 'itemCd'},
			{data : 'partNm'},
			{data : 'partGubun'},
			{data : 'partType'},
			{data : 'itemRev'},
			{data : 'partSpec'},
			{data : 'inCorpCd'},
			{data : 'partUnit'},
			{data : 'basicDlvDate'},
			{data : 'unitCost'},
			{data : 'useYn',
				render : function(data, type, row, meta){
					if(data!=null){
						return data;
					}else{
						return "001";
					}
				}
			},
			{data : 'inspectYn',
				render : function(data, type, row, meta){
					if(data!=null){
						return data;
					}else{
						return "001";
					}
				}
			},
			{data : 'partDesc'}, 
		],
		columnDefs: [
			{ targets: [9] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"targets": "_all" , "className": "text-center"},
        	
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);

		var str = $('#btnExcelUpload').val();
		index = 0;

		
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/itemPartExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
					
					//처리완료..
					$('#my-spinner').hide();
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
			rowData.itemSeq= inTable.row(index).data().itemSeq==null?"":inTable.row(index).data().itemSeq;
			rowData.itemCd= inTable.row(index).data().itemCd==null?"":inTable.row(index).data().itemCd;
			rowData.partNm= inTable.row(index).data().partNm==null?"":inTable.row(index).data().partNm;
			rowData.partGubun= inTable.row(index).data().partGubun==null?"":inTable.row(index).data().partGubun;
			rowData.partType= inTable.row(index).data().partType==null?"":inTable.row(index).data().partType;
			rowData.itemRev= inTable.row(index).data().itemRev==null?"":inTable.row(index).data().itemRev;
			rowData.partSpec= inTable.row(index).data().partSpec==null?"":inTable.row(index).data().partSpec;
			rowData.inCorpCd= inTable.row(index).data().inCorpCd==null?"":inTable.row(index).data().inCorpCd;
			rowData.partUnit= inTable.row(index).data().partUnit==null?"":inTable.row(index).data().partUnit;
			rowData.basicDlvDate= inTable.row(index).data().basicDlvDate==null?"":inTable.row(index).data().basicDlvDate;
			rowData.unitCost= inTable.row(index).data().unitCost==null?"":inTable.row(index).data().unitCost;
			rowData.useYn= inTable.row(index).data().useYn==null?"001":inTable.row(index).data().useYn;
			rowData.inspectYn= inTable.row(index).data().inspectYn==null?"001":inTable.row(index).data().inspectYn;
			rowData.partDesc= inTable.row(index).data().partDesc==null?"":inTable.row(index).data().partDesc;
			
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/itemPartAdmExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#itemPartAdmTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						console.log(res.itemCdList);

						// '/' 짤라서 동일한 부품 행 색깔 채워주기
						/* itemCdArr= res.itemCdList.split("/");

						for(var i=0;i<inTable.data().count();i++) {
							for(var j=0;j<itemCdArr.length; j++){
							    if(api.row(i).data().itemCd == itemCdArr[j]) {
							    	$('#'+api.row(i).data().itemCd).addClass('bg-warning');
								} else {
									$('#'+api.row(i).data().itemCd).removeClass('bg-warning');
								}
							}
						} */
						
						setTimeout(function() {
							toastr.warning("동일한 부품코드("+res.itemCdList+")가 존재합니다.");
						},1000);
						
					}else {
						toastr.error(res.message);
					}
					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
					
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	function uiProc(flag) {
		$("#itemGubun").attr("disabled", flag);
		$("#itemType").attr("disabled", flag);
		$("#itemMaker").attr("disabled", flag);
		$("#btnItemCus").attr("disabled", flag);
		$("#itemCd").attr("disabled", flag);
		$("#itemCusDelete").attr("disabled", flag);
		$("#btnAccCd").attr("disabled", flag);
		$("#accCdDelete").attr("disabled", flag);
		$("#itemNum").attr("disabled", flag);
		$("#itemNm").attr("disabled", flag);
		$("#itemJustGubun").attr("disabled", flag);
		$("#itemModel").attr("disabled", flag);
		$("#itemSpec").attr("disabled", flag);
		$("#exportCd").attr("disabled", flag);
		$("#itemGenre").attr("disabled", flag);
		$("#importYn").attr("disabled", flag);
		$("#stateCd").attr("disabled", flag);
		$("#locationCd").attr("disabled", flag);
		$("#btnItemWorkplace").attr("disabled", flag);
		$("#itemWorkplaceDelete").attr("disabled", flag);
		$("#savelocCd").attr("disabled", flag);
		$("#safetyStock").attr("disabled", flag);
		$("#itemFifoGubun").attr("disabled", flag);
		$("#payMethodCd").attr("disabled", flag);
		$("#lhrhCd").attr("disabled", flag);
		$("#importCost").attr("disabled", flag);
		$("#exportCost").attr("disabled", flag);
		$("#boxCount").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#useYnOne").attr("disabled", flag);
		$("#useYnTwo").attr("disabled", flag);
		$("#useYnThree").attr("disabled", flag);
		$("#itemDesc").attr("disabled", flag);
		$("#btnMoldCd1").attr("disabled", flag);
		$("#btnMoldCd2").attr("disabled", flag);
		$("#btnMoldCd3").attr("disabled", flag);
		$("#moldOne1Delete").attr("disabled", flag);
		$("#moldOne2Delete").attr("disabled", flag);
		$("#moldOne3Delete").attr("disabled", flag);
		$("#mfcDateCalendar1").attr("disabled", flag);
		$("#mfcDateCalendar2").attr("disabled", flag);
		$("#mfcDateCalendar3").attr("disabled", flag);
		$("#itemUnit").attr("disabled", flag);
		$("#mg1").attr("disabled", flag);
		$("#mg2").attr("disabled", flag);
		$("#itemCel").attr("disabled", flag);
		$("#itemHr").attr("disabled", flag);
		$("#upperAmtCel").attr("disabled", flag);
		$("#upperAmtHr").attr("disabled", flag);
		$("#lowerAmtCel").attr("disabled", flag);
		$("#lowerAmtHr").attr("disabled", flag);
		$("#btnAreaFloor").attr("disabled", flag);
		$("#areaFloorDelete").attr("disabled", flag);
	}
	

	//불러오기 버튼을 클릭 시
	$('#btnCall').on('click', function(){
		$('#partPopUpModal').modal('show');

		$('#itemPartAdmPopUpTable').DataTable().ajax.reload(function(){});

		//팝업테이블 클릭 시
		$('#itemPartAdmPopUpTable tbody').on('click', 'tr', function () {

			//event
			if ($(this).hasClass('selected')) {
				//$(this).removeClass('selected');
			} else {
				$('#itemMotorTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}

// 			$('#itemMotorTable').DataTable().$('tr.selected').removeClass('selected');
			$('#form').each(function(){
	        	this.reset();
	    	});
	    	
			sideView = 'add';

		  	var data = itemPartAdmPopUpTable.row( this ).data();
		  	console.log(data);

			//화면처리
			$('#form').each(function() {
				this.reset();
			});

			$('#tab2Nav').addClass('disabled');
			$('#tab3Nav').addClass('disabled');
			$('#tab4Nav').addClass('disabled');
			
			uiProc(false);
			$('#itemRev').val('00');
			$('#btnSave').removeClass('d-none');
			$('#btnEdit').attr('disabled', true);
			$('#btnDel').attr('disabled', true);
		  	
			$('#partNm').val(data.partNm);					//ITEM
			$('#itemRev').val(data.itemRev);				//Revision
			$('#partUnit').val(data.partUnit);				//단위
			$('#partSpec').val(data.partSpec);				//SPEC
			$('#partGubun').val(data.partGubun);			//구분
			$('#partType').val(data.partType);				//Type

			$('#inCorpCd').val(data.inCorpCd);				//입고처**
			$('#inCorpNm').val(data.inCorpNm);				//입고처**
			
			$('#basicDlvDate').val(data.basicDlvDate);		//기본납기일
			$('#unitCost').val(data.unitCost);				//자재단가
			$('#standCost').val(data.standCost != null ? rmDecimal(data.standCost):'');	//표준단가
			$('#inspectYn').val(data.inspectYn);			//수입검사여부
			$('#partDesc').val(data.partDesc);				//비고
			
		     $('#partPopUpModal').modal('hide');
		});
	});

	// 불러오기 목록
	let itemPartAdmPopUpTable = $('#itemPartAdmPopUpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : false,
		destroy : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId : 'itemCd',
		columns : [
			{ render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{ data : 'itemCd'		},
			{ data : 'partNm'		},
			{ data : 'partGubunNm'	},
			{ data : 'itemRev'		},
			{ data : 'partSpec' 	}
		],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
		order : [ [ 1, 'asc' ] ],
	});
	
	//삭제
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		
		$.ajax({
			url : '<c:url value="bm/itemInfoAdmDelete"/>',
			type : 'POST',
			data :{
				'itemSeq' : function() {
					return itemSeq;
				},
				'itemRev' : function() {
					return itemRev;
				},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#itemPartAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	/* var radioCheck;
	function radioOnclick(){
		radioCheck = $('input[name=mainGubun]:checked').val();
		if (radioCheck == '001') {
			$('#equipCdTable').removeClass('d-none');
			
			$('#itemWorkplace').val('S-S');
			$("#btnItemWorkplace").attr("disabled", true);
			$("#itemWorkplaceDelete").attr("disabled", true);
			
			$('tr[name=celHrTr]').removeClass('d-none');
		} else if (radioCheck == '002') {
			$('#equipRealCd').val('');
			$('#equipCd').val('');
			$('#equipNm').val('');
			$('#mfcCorpCd').val('');
			$('#mfcDate').val('');
			$('#equipCdTable').addClass('d-none');
			
			$('#itemWorkplace').val('');
			$("#btnItemWorkplace").attr("disabled", false);
			$("#itemWorkplaceDelete").attr("disabled", false);
			
			$('tr[name=celHrTr]').addClass('d-none');
		}
	} */

	//자재사진 탭 클릭시
	$('#tab2Nav').on('click', function() {
		imgPrint();
	});
	
	//이미지 등록
	function imageUpload(value) {

		var fileListView = "";

		var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("itemSeq", itemSeq);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageUpload"/>',
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
			url : '<c:url value="/bm/itemInfoImageDelete"/>',
			type : 'POST',
			data : {
				'itemSeq' : function(){return itemSeq;},
				//'imageFile'			:		function(){a=null; a=$('#imgName'+number).text(); return a;},
				'value' : function(){return value;},

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


	//filter 
	$("div.dataTables_wrapper div.dataTables_filter label").css("margin-right", "0px");
	
</script>

</body>
</html>
