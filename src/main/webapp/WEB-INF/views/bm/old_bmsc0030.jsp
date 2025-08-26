
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!-- 모터조회 모달 시작--> 
	<div class="modal fade bd-example-modal-lg" id="motorPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="margin-right: 40%;">
			<div class="modal-content" style="width: 150%;">
				<div class="modal-header">
					<h5 class="modal-title">품목정보관리(모터) 조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive">
					<table id="itemMotorPopUpTable" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="25%">
							<col width="10%">
							<col width="10%">
							<col width="14%">
							<col width="13%">
							<col width="13%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>제품코드</th>
								<th class="text-center">모델명</th>
								<th>구분</th>
								<th>SERIES</th>
								<th>FRAME SIZE</th>
								<th>용량</th>
								<th>Revision</th>
							</tr>
						</thead>
					</table>
				</div>
				<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모터조회 모달 종료-->

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">품목정보관리(모터)</li>
			</ol>
		</nav>
	</header>
	<!--=======모달영역====================================================-->
	<div class="modal fade" id="itemBomMapModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header modal-header-colored">
					<h3 class="modal-title">BOM매칭</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body pb-4" style="height: 650px">
					<!-- <div class="modal-footer">
                     <button class="btn btn-space btn-secondary" type="button" data-dismiss="modal">취소</button>
                     <button class="btn btn-space btn-info" type="button" data-dismiss="modal">저장</button>
                 </div> -->
					<div class="row">
						<!--left box-->
						<div class="modal-50" style="height: 630px;">
							<div class="table-responsive">
								<table id="itemBomMapAdmTable"
									class="table table-bordered table-td-center">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>소공정코드</th>
											<td><input type="text" class="form-control" id="prcssCd"
												name="prcssCd" disabled /></td>
											<th>소공정명</th>
											<td><input type="text" class="form-control" id="prcssNm"
												name="prcssNm" disabled /></td>
										</tr>
									</thead>

								</table>
							</div>
							<div class="table-responsive">
								<!--오른쪽 등록 부분 하단 버튼 영역-->
								<div class="card-body col-sm-12">
									<button type="button" class="btn btn-warning float-right mr-1 "
										id="bomMatDel">삭제</button>
									<button type="button" class="btn btn-primary float-right mr-1 "
										id="bomMatEdit">수정</button>
									<button type="button" class="btn btn-primary float-right mr-1 "
										id="bomMatAdd">추가</button>
								</div>

								<table id="itemBomMapDtlTable"
									class="table table-bordered table-td-center">
									<colgroup>
										<col width="25%">
										<col width="30%">
										<col width="10%">
										<col width="35%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>CODE</th>
											<th>ITEM</th>
											<th>Revision</th>
											<th>SPEC</th>
										</tr>
									</thead>
								</table>
							</div>

							<div style="padding-top: 15px;">
								<button type="button" class="btn btn-primary float-right d-none"
									id="bomMatSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>

							</div>
						</div>
						<!--left box-->


						<!--right box-->
						<div class="modal-50">
							<div class="table-responsive" style="height: 600px;">
								<table id="itemPartAdmTable"
									class="table table-bordered table-td-center">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>CODE</th>
											<th>ITEN</th>
											<th>구분</th>
											<th>Type</th>
											<th>Revision</th>
											<th>SPEC</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
						<!--right box-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--=======모달영역====================================================-->
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 50%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="itemMotorTable" class="table table-bordered">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="25%">
								<col width="10%">
								<col width="10%">
								<col width="14%">
								<col width="13%">
								<col width="13%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>제품코드</th>
									<th class="text-center">모델명</th>
									<th>구분</th>
									<th>SERIES</th>
									<th>FRAME SIZE</th>
									<th>용량</th>
									<th>Revision</th>
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
				style="width: 49%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item"><a class="nav-link active show"
									id="info2" data-toggle="tab" href="#tab1">모터정보</a></li>
								<li class="nav-item"><a class="nav-link disabled" id="eBom"
									data-toggle="tab" href="#tab2">E-BOM</a></li>
								<li class="nav-item"><a class="nav-link disabled" id="mBom"
									data-toggle="tab" href="#tab3">M-BOM</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="photo" data-toggle="tab" href="#tab4">모터사진</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="bomMatch" data-toggle="tab" href="#tab5">BOM 매칭</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="tab6Nav" data-toggle="tab" href="#tab6">작업표준서</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="tab7Nav" data-toggle="tab" href="#tab7">특주</a></li>
								<li class="nav-item"><a class="nav-link disabled"
									id="tab8Nav" data-toggle="tab" href="#tab8">사양서</a></li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-left"
									id="btnCall">불러오기</button>
								<button type="button" class="btn btn-primary float-right"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnRevAdd">Revision등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAdd">신규등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
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
											<th>*제품코드</th>
											<td><input type="text" class="form-control" id="itemCd"
												name="itemCd" disabled style="max-width:100%"></td>
											<th>*모델명</th>
											<td><input type="text" class="form-control" id="itemNm"
												name="itemNm" style="max-width:100%"></td>
										</tr>
										<tr>
											<th>*Revision</th>
											<td><input type="text" class="form-control" id="itemRev"
												name="itemRev" disabled style="max-width:100%"></td>
											<th>*구분</th>
											<td><select class="custom-select" id="itemGubun"
												name="itemGubun" style="max-width:100%"></select></td>
											
										</tr>
										<tr>
											<th>*SERIES</th>
											<td><input type="text" class="form-control"
												id="itemSeries" name="itemSeries" style="max-width:100%"></td>
											<th>FRAME SIZE</th>
											<td><input type="text" class="form-control"
												id="frameSize" name="frameSize" style="max-width:100%"></td>
											
										</tr>
										<tr>
											<th>용량</th>
											<td><input type="text" class="form-control"
												id="itemCapa" name="itemCapa" style="max-width:100%"></td>
											<th>ENCODER</th>
											<td><input type="text" class="form-control"
												id="itemEncdr" name="itemEncdr" style="max-width:100%"></td>
										</tr>
										<tr>
											<th>IP CLASS</th>
											<td><input type="text" class="form-control" id="ipClass"
												name="ipClass" style="max-width:100%"></td>
											<th>Serial No</th>
											<td><input type="text" class="form-control"
												id="serialNo" name="serialNo" style="max-width:100%"></td>
										</tr>
										<tr>
											<th>전압</th>
											<td><input type="text" class="form-control" id="itemVoltage"
												name="itemVoltage" style="max-width:100%"></td>
											<th>출력</th>
											<td><input type="text" class="form-control"
												id="itemOutput" name="itemOutput" style="max-width:100%"></td>
										</tr>
										<tr>
											<th>Size</th>
											<td><input  type="text" class="form-control" id="itemSize"
												name="itemSize" style="max-width:100%"></td>
											<th>스페셜/표준</th>
											<td><select class="custom-select"
												id="itemGubun2" name="itemGubun2" style="max-width:100%"></select></td>
										</tr>
										<tr>
											<th>단가</th>
											<td><input type="text" class="form-control" id="unitCost"
												name="unitCost" style="text-align:right; max-width:100%"></td>
											<th>Type</th>
											<td><select  class="custom-select"
												id="itemType" name="itemType" style="text-align:right; max-width:100%"></select></td>
										</tr>
										<tr>
											<th>케이블</th>
											<td><input type="text" class="form-control"
												id="itemCable" name="itemCable" style="max-width:100%"></td>
											<th>*사용여부</th>
											<td><select class="custom-select" id="useYn"
												name="useYn" style="max-width:100%"></select></td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3"><input type="text" class="form-control"
												id="itemDesc" name="itemDesc" style="max-width:100%"></td>
										</tr>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2">
							<form  method="POST" enctype="multipart/form-data" id="fileUploadForm3" action="" class="col-sm-12 col-md">
								<a href="/bm/eBomBasicForm">
								<button type="button" class="btn btn-secondary float-right mr-1"
									id="btnFileDownload3">기본양식다운로드</button>
								</a>
								<button class="btn btn-primary d-none" id="btnFileDownloadConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<label for="btnExcelUpload3" class="btn btn-info mr-1 float-right">엑셀업로드</label>
								<input type="file" id="btnExcelUpload3" name="excelfile3" style="display: none" />
							</form>
							<div class="card-body col-sm-12 p-1 mb-2">
								<!-- <button type="button" class="btn btn-danger float-right mr-1"
									id="ebomAllDelete">전체삭제</button>
								<button class="btn btn-primary d-none"
									id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button> -->
								<button type="button" class="btn btn-primary float-right d-none"
									id="ebomSave">저장</button>
								<button class="btn btn-primary d-none"
									id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
								
								
								<button type="button" class="btn btn-primary float-left mr-1"
									id="ebomAdd">추가</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-left mr-1"
									id="ebomEdit">수정</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-warning float-left mr-1"
									id="ebomDelete">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="ebomTable">
										<colgroup>
											<col width="5%">
											<col width="17%">
											<col width="23%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="10%">
											<col width="10%">
											<col width="9%">
										</colgroup>
										<thead>
											<tr>
												<th>
													<input type="checkbox" class="checkbox_sm" name="checkboxAll" id="checkboxAll" value="">
												</th>
												<th>CODE</th>
												<th>ITEM</th>
												<th>REV</th>
												<th>구분</th>
												<th>Type</th>
												<th>SPEC</th>
												<th>단위</th>
												<th>소모량</th>
											</tr>
										</thead>
									</table>
									<table class="table table-bordered d-none" id="ebomTempTable">
										<colgroup>
											<col width="17%">
											<col width="23%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="15%">
											<col width="10%">
											<col width="9%">
										</colgroup>
										<thead>
											<tr>
												<th>CODE</th>
												<th>ITEM</th>
												<th>REV</th>
												<th>구분</th>
												<th>Type</th>
												<th>SPEC</th>
												<th>단위</th>
												<th>소모량</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-left mr-1"
									id="bomBtn" onClick="selectMbom();">BOM</button>

								<button type="button" class="btn btn-warning float-right mr-1"
									id="mbomDelete">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="mbomTable">
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="20%">
											<col width="25%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>구분</th>
												<th>중공정명</th>
												<th>소공정코드</th>
												<th>소공정명</th>
												<th>외주공정여부</th>
												<th>비고</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div>
							<button type="button" class="btn btn-primary float-right d-none "
								id="mbomSave">저장</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
						</div>
						<div class="tab-pane fade" id="tab4">
							<form id="form4" enctype="multipart/form-data">
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
						<div class="tab-pane fade" id="tab5">
							<div>
								<form method="POST" enctype="multipart/form-data" id="fileUploadForm2" action="" class="col-sm-12 col-md">
									<label for="btnExcelUpload2" class="btn btn-info mr-1">엑셀업로드</label>
									<input type="file" id="btnExcelUpload2" name="excelfile2" style="display: none" />
									<a href="/bm/bomMatchBasicForm"><button type="button" class="btn btn-secondary" id="btnFileDownload2">기본양식다운로드</button></a>
								</form>
							</div>
							<form id="form5" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="bomMatchTable">
										<colgroup>
											<col width="15%">
											<col width="20%">
											<col width="20%">
											<col width="30%">
											<col width="15%">
										</colgroup>
										<thead>
											<tr>
												<th>구분</th>
												<th>중공정명</th>
												<th class="text-center">소공정코드</th>
												<th>소공정명</th>
												<th>등록유무</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div>
								<div>
									<button type="button" class="btn btn-primary float-right"
										id="bomMatchSave">저장</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span>처리중
									</button>

								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab6">
							<form id="form6" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="workStandTable">
										<colgroup>
											<col width="30%">
											<col width="80%">
										</colgroup>
										<thead>
											<tr>
												<th>소공정명</th>
												<th>작업표준서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div>
								<div>
									<button type="button" class="btn btn-primary float-right"
										id="workStandSave">저장</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span>처리중
									</button>

								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab7">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnSpecialOrderDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnSpecialOrderAdd">추가</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
							<form id="form7" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="specialOrderTable">
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
												<th>특주</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none" id="specialOrderSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
							</div>
						</div>
						<div class="tab-pane fade" id="tab8">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnSpecifyDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnSpecifyAdd">추가</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
							<form id="form8" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="specifyTable">
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
												<th>특주</th>
											</tr>
										</thead>
										<tbody id="dataList2"></tbody>
										<tbody id="dataInsert2"></tbody>
									</table>
								</div>
							</form>
							<div class="mt-2">
								<button type="button"
									class="btn btn-primary d-none float-right d-none" id="specifySave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
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
	<!-- 모터정보 엑셀 업로드 모달 시작 -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel" aria-hidden="true">
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
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>CODE</th>
								<th>ITEM</th>
								<th>REV</th>
								<th>구분<br>코드</th>
								<th>SERIES</th>
								<th>프레임<br>크기</th>
								<th>용량</th>
								<th>인코더</th>
								<th>유형</th>
								<th>IP<br>CLASS</th>
								<th>S/N</th>
								<th>전압</th>
								<th>출력</th>
								<th>Size</th>
								<th>스페셜<br>/표준</th>
								<th>단가</th>
								<th>사용<br>여부</th>
								<th>비고</th>
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
	<!-- 모터정보 엑셀업로드 모달 끝 -->
	<!-- BOM-MAT 엑셀 업로드 모달 시작 -->
	<div class="modal fade bd-example-modal-lg" id="inModal2" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel2">BOM-MAT 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable2" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>제품코드</th>
								<th>제품REV</th>
								<th>소공정코드</th>
								<th>부품코드</th>
								<th>부품REV</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply2">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- E-BOM 엑셀 업로드 모달 시작 -->
	<div class="modal fade bd-example-modal-lg" id="inModal3" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel3" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel3">E-BOM 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<div class="col-sm-12" style="overflow: auto; max-height: 600px;">
					<table id="inTable3" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>부품코드</th>
								<th>부품REV</th>
								<th class="text-center">부품소모량</th>
							</tr>
						</thead>
					</table>
					</div>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply3">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모터정보 엑셀업로드 모달 끝 -->
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

	let currentHref = "bmsc0030";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","품목정보관리(모터)"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = "";
	let ebom = 'add';

	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	
	uiProc(true);
	var tableIdx = null;

	var itemCd = null;
	var itemRev = null;
	var partCd;
	var index = 0;
	var updateOrCreate;
	var btnView;
	var btnView2;
	var btnView3;
	var bomCd = null;
	var lowerPrcssCd = null;
	var prcssCd = null;
	var prcssNm = null;
	var urlData = null;
	var fileType=null;
	var fileDateVal=null;
	var fileContentVal=null;
	var fileTableIdx=null;
	var fileSeqVal=null;

	var checkArr=[];

	//공통코드 처리 시작      
	var useYnCode = new Array(); // 상태여부
	var itemTypeCode = new Array();
	var itemGubunCode = new Array();

	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	<c:forEach items="${itemType}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemTypeCode.push(json);
	</c:forEach>

	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunCode.push(json);
	</c:forEach>

	var itemGubunCode2 = new Array(); // 스페셜/표준
	<c:forEach items="${itemGubun2}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode2.push(json1);
	</c:forEach>
	//공통코드 처리 종료

	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", useYn, "");
	selectBoxAppend(itemGubunCode, "itemGubun", itemGubun, "");
	selectBoxAppend(itemTypeCode, "itemType", itemType, "2");
	selectBoxAppend(itemGubunCode2, "itemGubun2", "", "2");  //스페셜/표준

	//모달 창 예 클릭 시
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnRevAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnCall').attr('disabled', false);

		//탭 활성화
		$("#eBom").removeClass('disabled');
		$("#mBom").removeClass('disabled');
		$("#photo").removeClass('disabled');
		$("#bomMatch").removeClass('disabled');
		$("#tab6Nav").removeClass('disabled');
		$("#tab7Nav").removeClass('disabled');
		$("#tab8Nav").removeClass('disabled');

		//저장 버튼 비 활성화
		$('#ebomSave').addClass('d-none');
		$('#specialOrderSave').addClass('d-none');
		$('#specifySave').addClass('d-none');

		//탭 리로드
		$('#ebomTable tbody').empty();
		$('#specialOrderTable tbody').empty();
		$('#specifyTable tbody').empty();
		
		$('#ebomTable').DataTable().ajax.reload(function() {});
		$('#specialOrderTable').DataTable().ajax.reload(function() {});
		$('#specifyTable').DataTable().ajax.reload(function() {});

		//버튼 활성화
		$('#btnSpecialOrderAdd').attr('disabled', false);
		$('#btnSpecialOrderDel').attr('disabled', false);
		$('#btnSpecifyAdd').attr('disabled', false);
		$('#btnSpecifyDel').attr('disabled', false);
	});

	$("#dealCorpNm").attr("disabled", true);

	var cNm = 'btn btn-primary float-right';
	
	//모터정보 탭 클릭시
	$('#info2').on('click', function() {

		console.log("모터탭 클릭");
		
		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnRevAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
	});

	//E-BOM 탭 클릭시
	$('#eBom').on('click', function() {
		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		uiProc2(true);
		tableIdx = 0;
		$('#ebomTable').DataTable().ajax.reload(function() {});
		$('#ebomTempTable').DataTable().ajax.reload(function() {});
		$('#ebomSave').addClass('d-none');
	});

	//M-BOM 탭 클릭시
	$('#mBom').on('click', function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		uiProc3(true);
		$('#mbomTable').DataTable().ajax.reload(function() {
		});

		$('#mbomSave').addClass('d-none');
	});

	//모터 사진 탭 클릭시
	$('#photo').on('click', function() {
		
		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		uiProc3(true);
	})

	//BOM-MATCH 탭 클릭시
	$('#bomMatch').on('click', function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		$('#bomMatchTable').DataTable().ajax.reload(function() {
			$('#bomMatchTable').rowspan(0);
			$('#bomMatchTable').rowspan(1);
		});
		
		$('#bomMatchSave').addClass('d-none');
	})
	
	//작업표준서 탭 클릭시
	$('#tab6Nav').on('click', function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		$('#workStandTable').DataTable().ajax.reload(function() {
			$('#workStandTable').rowspan(0);
		});
		
		$('#workStandSave').addClass('d-none');
		
	})

	//특주 탭 클릭시
	$('#tab7Nav').on('click', function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		fileType = '001';
		$('#specialOrderTable tbody').empty();
		$('#specialOrderTable').DataTable().ajax.reload(function() {});
		
		$('#specialOrderSave').addClass('d-none');

		$('#btnSpecialOrderAdd').attr('disabled', false); //추가버튼
		$('#btnSpecialOrderDel').attr('disabled', false);  //삭제버튼		
		
	})
	
	//사양서 탭 클릭시
	$('#tab8Nav').on('click', function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		fileType = '002';
		$('#specifyTable tbody').empty();
		$('#specifyTable').DataTable().ajax.reload(function() {});
		
		$('#specifySave').addClass('d-none');

		$('#btnSpecifyAdd').attr('disabled', false); //추가버튼
		$('#btnSpecifyDel').attr('disabled', false);  //삭제버튼		
	})
	
	
	// 목록
	let itemMotorTable = $('#itemMotorTable').DataTable({
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
			url : '<c:url value="/itemMotorList"/>',
			type : 'GET',
			data : {},
		},
		rowId : '',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					},
					'className' : 'text-center'
				}, {
					data : 'itemCd'
				}, {
					data : 'itemNm',
					'className' : 'text-center'
				}, {
					data : 'itemGubunNm'
				}, {
					data : 'itemSeries'
				}, {
					data : 'frameSize'
				}, {
					data : 'itemCapa'
				}, {
					data : 'itemRev'
				} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '품목정보관리(모터)'
		}, 'print' ],
		columnDefs : [ {
			className : "text-left",
			targets : 2
		}, ]
	});
	// 보기
	$('#itemMotorTable tbody').on('click','tr',function() {

		if ($('#ebomSave').attr('class') == cNm || $('#specialOrderSave').attr('class') == cNm || $('#specifySave').attr('class') == cNm || $('#btnSave').attr('class') == cNm) {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemMotorTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}

		$("#eBom").removeClass('disabled');
		$("#mBom").removeClass('disabled');
		$("#photo").removeClass('disabled');
		$("#bomMatch").removeClass('disabled');
		$("#tab6Nav").removeClass('disabled');
		$("#tab7Nav").removeClass('disabled');
		$("#tab8Nav").removeClass('disabled');

		
		
		itemCd = itemMotorTable.row(this).data().itemCd;
		itemRev = itemMotorTable.row(this).data().itemRev;
		bomCd = itemMotorTable.row(this).data().bomCd;

		$('#formBox').removeClass('d-none');
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnCall').attr('disabled', false);

		uiProc2(false);
		$('#ebomSave').addClass('d-none');

		$('#imageFile1').attr("src", "");
		$('#imageFile2').attr("src", "");
		$('#imageFile3').attr("src", "");
		$('#imageFile4').attr("src", "");

		$('#imageFile5').attr("src", "");
		$('#imageFile6').attr("src", "");
		$('#imageFile7').attr("src", "");
		$('#imageFile8').attr("src", "");
		tableIdx = 0;
		imgPrint();

		callView='';

		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/itemMotorRead"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {return itemCd;},
				'itemRev' : function() {return itemRev;}
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				$('#info2').tab('show');

				$('#form input[name="itemCd"]').val(data.itemCd);
				$('#form input[name="itemRev"]').val(data.itemRev);
				$('#form input[name="itemNm"]').val(data.itemNm);
				$('#form input[name="itemGubun"]').val(data.itemGubun);
				$('#form input[name="itemSeries"]').val(data.itemSeries);
				$('#form input[name="frameSize"]').val(data.frameSize);
				$('#form input[name="itemCapa"]').val(data.itemCapa);
				$('#form input[name="itemEncdr"]').val(data.itemEncdr);
				$('#form input[name="itemType"]').val(data.itemType);
				$('#form input[name="ipClass"]').val(data.ipClass);
				$('#form input[name="serialNo"]').val(data.serialNo);
				$('#form input[name="itemVoltage"]').val(data.itemVoltage);
				$('#form input[name="itemOutput"]').val(data.itemOutput);
				$('#form input[name="itemSize"]').val(data.itemSize);
				$('#form input[name="itemGubun2"]').val(data.itemGubun2);
				$('#form input[name="itemCable"]').val(data.itemCable);
				$('#form input[name="unitCost"]').val(addCommas(uncomma(data.unitCost)));
				$('#form input[name="itemDesc"]').val(data.itemDesc);
				$('#form input[name="useYn"]').val(data.useYn);

				//선택박스 처리
				selectBoxAppend(itemGubunCode, "itemGubun",data.itemGubun, "");
				selectBoxAppend(itemTypeCode, "itemType",data.itemType, "");
				selectBoxAppend(useYnCode, "useYn", data.useYn,"");
				selectBoxAppend(itemGubunCode2, "itemGubun2", data.itemGubun2, "2");  //스페셜/표준

				$('#ebomTable').DataTable().ajax.reload(function() {});
				$('#mbomTable').DataTable().ajax.reload(function() {});
				$('#bomMatchTable').DataTable().ajax.reload(function() {
					$('#bomMatchTable').rowspan(0);
					$('#bomMatchTable').rowspan(1);
				});
				$('#workStandTable').DataTable().ajax.reload(function() {
				});
			}
		});

	});

	var html1 = '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/itemMotorBasicForm"><button type="button" class="btn btn-secondary" id="btnFileDownload">기본양식다운로드</button></a></form>';

	$('#itemMotorTable_length').html(html1);
	
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		$.ajax({
			url : '<c:url value="/bm/itemMotorSeq"/>',
			type : 'POST',
			data : {},
			success : function(res) {
				data = res.itemCd;
				$('#form input[name="itemCd"]').val(data);
			}
		});

		//선택박스처리
		$('#useYn option[value="001"]').attr('selected', 'selected');
		$('#itemGubun option[value="001"]').attr('selected', 'selected');
		$('#itemType option[value="001"]').attr('selected', 'selected');

		//화면처리        
		uiProc(false);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$("#eBom").addClass('disabled');
		$("#mBom").addClass('disabled');
		$("#photo").addClass('disabled');
		$("#bomMatch").addClass('disabled');
		$("#tab6Nav").addClass('disabled');
		$("#tab7Nav").addClass('disabled');
		$("#tab8Nav").addClass('disabled');

		$('#btnCall').attr('disabled', true);
		
		$('#form input[name="itemRev"]').val("00");
		$('#btnCheck').attr("disabled", false);
		//$('#formBox').removeClass('d-none');
		//$('#btnRevAdd').attr('disabled', true); //수정버튼
		$('#btnEdit').attr('disabled', true); //수정버튼

	});

	// 리비전 등록폼
	$('#btnRevAdd').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("Revision등록할 목록을 선택해 주세요!");
			return false;
		}
// 		$('#form').each(function() {
// 			this.reset();
// 		});

		sideView = 'add';

		$.ajax({
			url : '<c:url value="/bm/itemMotorRevSeq"/>',
			type : 'POST',
			data : {
				'itemCd' : function() {
					return itemCd;
				}
			},
			success : function(res) {
				data = res.itemRev;
				$('#form input[name="itemRev"]').val(data);
			}
		});

		//화면처리        
		uiProc(false);
		$("#eBom").addClass('disabled');
		$("#mBom").addClass('disabled');
		$("#photo").addClass('disabled');
		$("#bomMatch").addClass('disabled');
		$("#tab6Nav").addClass('disabled');
		
		$('#form input[name="itemCd"]').val(itemCd);
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}
		uiProc(false);
		$("#eBom").addClass('disabled');
		$("#mBom").addClass('disabled');
		$("#photo").addClass('disabled');
		$("#bomMatch").addClass('disabled');
		$("#tab6Nav").addClass('disabled');
		$("#tab7Nav").addClass('disabled');
		$("#tab8Nav").addClass('disabled');
		
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#itemNm').val())) {
			toastr.warning('모델명을 입력해주세요.');
			$('#itemNm').focus();
			return false;
		}
		if (!$.trim($('#itemGubun').val())) {
			toastr.warning('구분을 선택해주세요.');
			$('#itemGubun').focus();
			return false;
		}
		/* if (!$.trim($('#itemSeries').val())) {
			toastr.warning('SERIES를 입력해주세요.');
			$('#itemSeries').focus();
			return false;
		}
		if (!$.trim($('#frameSize').val())) {
			toastr.warning('FRAME SIZE를 입력해주세요.');
			$('#frameSize').focus();
			return false;
		}
		if (!$.trim($('#itemCapa').val())) {
			toastr.warning('용량을 입력해주세요.');
			$('#itemCapa').focus();
			return false;
		}
		if (!$.trim($('#itemEncdr').val())) {
			toastr.warning('ENCODER를 입력해주세요.');
			$('#itemEncdr').focus();
			return false;
		}
		if (!$.trim($('#itemType').val())) {
			toastr.warning('TYPE을 선택해주세요.');
			$('#itemType').focus();
			return false;
		}
		if (!$.trim($('#ipClass').val())) {
			toastr.warning('IP CLASS를 입력해주세요.');
			$('#ipClass').focus();
			return false;
		} */

		if(callView =='' || callView !="saveReady"){
			var url = '<c:url value="/bm/itemMotorCreate"/>';
	
			if (sideView == "edit") {
				url = '<c:url value="/bm/itemMotorUpdate"/>';
			} else if (sideView == "delete") {
				url = '<c:url value="/bm/itemMotorDelete"/>';
			}
	
			else {
				baseInfoSeq = "";
			}
	
			$.ajax({
				url : url,
				type : 'POST',
				data : {
					'itemCd' : $('#itemCd').val(),
					'itemNm' : $('#itemNm').val(),
					'itemGubun' : $('#itemGubun option:selected').val(),
					'itemSeries' : $('#itemSeries').val(),
					'frameSize' : $('#frameSize').val(),
					'itemCapa' : $('#itemCapa').val(),
					'itemEncdr' : $('#itemEncdr').val(),
					'itemType' : $('#itemType option:selected').val(),
					'ipClass' : $('#ipClass').val(),
					'serialNo' : $('#serialNo').val(),
					'itemVoltage' : $('#itemVoltage').val(),
					'itemOutput' : $('#itemOutput').val(),
					'itemSize' : $('#itemSize').val(),
					'itemGubun2' : $('#itemGubun2').val(),
					'unitCost' : $('#unitCost').val().replace(/,/g,''),
					'itemCable' : $('#itemCable').val(),
					'itemDesc' : $('#itemDesc').val(),
					'itemRev' : $('#itemRev').val(),
					'useYn' : $('#useYn option:selected').val()
				},
				/* 			beforeSend : function() {
				 // $('#btnAddConfirm').addClass('d-none');
				 }, */
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						$('#itemMotorTable').DataTable().ajax.reload(function() {
						});
						uiProc(true);
						$('#btnSave').addClass('d-none');
						$('#btnRevAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
	
						$('#eBom').removeClass('disabled');
						$('#mBom').removeClass('disabled');
						$('#photo').removeClass('disabled');
						$('#bomMatch').removeClass('disabled');
						$("#tab6Nav").removeClass('disabled');
						$("#tab7Nav").removeClass('disabled');
						$("#tab8Nav").removeClass('disabled');
						
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
					$('#itemMotorTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
					$('#btnSelDealCorp').attr('disabled', true);
				}
			});
		}
		//불러오기 저장 처리
		else if(callView == "saveReady"){
			itemCd = callItemCd;
			itemRev = '00';
			//모터정보 저장
			$.ajax({
				url : '<c:url value="/bm/itemMotorCreate"/>',
				type : 'POST',
				data : {
					'itemCd' : $('#itemCd').val(),
					'itemNm' : $('#itemNm').val(),
					'itemGubun' : $('#itemGubun option:selected').val(),
					'itemSeries' : $('#itemSeries').val(),
					'frameSize' : $('#frameSize').val(),
					'itemCapa' : $('#itemCapa').val(),
					'itemEncdr' : $('#itemEncdr').val(),
					'itemType' : $('#itemType option:selected').val(),
					'ipClass' : $('#ipClass').val(),
					'serialNo' : $('#serialNo').val(),
					'itemVoltage' : $('#itemVoltage').val(),
					'itemOutput' : $('#itemOutput').val(),
					'itemSize' : $('#itemSize').val(),
					'itemGubun2' : $('#itemGubun2').val(),
					'unitCost' : $('#unitCost').val().replace(/,/g,''),
					'itemDesc' : $('#itemDesc').val(),
					'itemRev' : $('#itemRev').val(),
					'useYn' : $('#useYn option:selected').val()
				},
				success : function(res) {
					console.log(res);
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						$('#itemMotorTable').DataTable().ajax.reload(function() {});
						uiProc(true);
						$('#btnSave').addClass('d-none');
						$('#btnRevAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);

						$('#eBom').removeClass('disabled');
						$('#mBom').removeClass('disabled');
						$('#photo').removeClass('disabled');
						$('#bomMatch').removeClass('disabled');
						$("#tab6Nav").removeClass('disabled');
						$("#tab7Nav").removeClass('disabled');
						$("#tab8Nav").removeClass('disabled');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#itemMotorTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
					$('#btnSelDealCorp').attr('disabled', true);
				}
			});//모터 정보 저장

			//E-BOM저장
			var dataArray = new Array();
	
			$('#ebomTable tbody tr').each(
				function(index, item) {
		
					var rowData = new Object();
					rowData.itemCd = itemCd;
					rowData.itemRev = itemRev;
					partCdData = $(this).find('td input[name=partCd]').val();
					rowData.partCd = partCdData == null ? "": partCdData;
					rowData.partRev = $(this).find('td input[name=partRev]').val();
					rowData.partConsumpt = $(this).find('td input[name=partConsumpt]').val();
					rowData.ebom = ebom;
					dataArray.push(rowData);
					console.log(rowData);
		
				});
	
				$.ajax({
					url : '<c:url value="/bm/itemMotorEBomCreate"/>',
					type : 'POST',
					datatype : 'json',
					data : JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					beforeSend : function() {
						// $('#btnAddConfirm').addClass('d-none');
					},
					success : function(res) {
						console.log(res);
						if (res.result == 'ok') {
							uiProc2(true);
							$('#ebomEdit').attr('disabled',false);
							$('#ebomSave').addClass('d-none');
							btnView = '';
						} else if (res.result == 'distinct') {
// 							toastr.warning("중복된 품번("+res.data+")이 있습니다. 확인해주세요.");
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						
					}
				});//E-BOM저장
				//M-BOM저장
				$.ajax({
					url : '<c:url value="/bm/itemMotorMBomCreate"/>',
					type : 'POST',
					data : {
						'itemCd' 	: function() {return itemCd;	},
						'itemRev'	: function() {return itemRev;	},
						'bomCd' 	: function() {return bomCd;		},
					},
					beforeSend : function() {},
					success : function(res) {
						console.log(res);
						if (res.result == "ok") {
							$('#mbomSave').addClass('d-none');
						} else {
							toastr.error(res.message);
						}
					},
				});//M_BOM저장
				//모터사진
				$.ajax({
					url : '<c:url value="/bm/itemMotorImgCallUpload"/>',
					data : {
							'itemCd' 	: function(){return itemCd;},
							'itemRev' 	: function(){return itemRev;},
							'itemCdTo' 	: function(){return itemCdTo;},
							'itemRevTo' : function(){return itemRevTo;}  
						},
					type : 'POST',
					success : function(data) {
						console.log(data);
						if (data.result == "ok") { //응답결과
// 							toastr.success('등록되었습니다.');
						} else{
							toastr.error(res.message);
						}
						imgPrint();
					}
				});//모터사진
				//작업표준서
				var data = JSON.stringify(array);
				$.ajax({
					url : '<c:url value="/bm/itemWorkStandardCallCreate"/>',
					type : 'POST',
					data : {
						'arrayData' : 	function(){return data;}
					},
					success: function (res) {
						let data = res.data;
						console.log(res);
						$('#btnSave').addClass('d-none');

						if (res.result == 'ok') {
// 								toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
		            },
				});//작업표준서 DB

				//특주, 사양서 등록
				var data2 = JSON.stringify(array2);
				$.ajax({
					url : '<c:url value="/bm/itemMotorFileCallCreate"/>',
					type : 'POST',
					data : {
						'arrayData2' : 	function(){return data2;}
					},
					success: function (res) {
						let data = res.data;
						console.log(res);
						$('#btnSave').addClass('d-none');

						if (res.result == 'ok') {
								toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
		            },
		            complete : function() {
			            array = new Array();
			            array2 = new Array();
			            $('#btnRevAdd').attr('disabled', false);
			            $('#btnAdd').attr('disabled', false);
					}
				});//작업표준서 DB
			}//if문
		});

	
	// E- BOM 
	let ebomTable = $('#ebomTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,		
		ajax : {
			url : '<c:url value="bm/itemMotorEBomList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				}
			},
		},
		rowId : 'partCd',
		columns : [
				{
					render : function(data, type, row, meta) {
						return '<input type="checkbox" class="checkbox_sm" name="check"  value="">';
					},
					'className' : 'text-center'
				},
				{
					data : 'partCd',
					render : function(data, type, row, meta) {
						var value = "";
						if (data != null) {
							value = '<input type="text" class="form-control" style="max-width:100%;" name="partCd" value="'
									+ data + '" disabled>';
							value2 = '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectRev();" disabled>';

						} else {
							value = '<input type="text" class="form-control" name="partCd" value=""  style="max-width:100%;" disabled>';
							value2 = '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectRev();" >';
						}

						var html = '<div class="input-sub m-0">';
						html += value;
						//html += '<input type="hidden" name="partRev" value="'+row['partRev']+'">';
						html += value2;
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				},
				{
					data : 'partNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="max-width:100%;" name="partNm" value="' + data + '" disabled>';
						} else {
							return '<input type="text" class="form-control"  name="partNm" value="" style="max-width:100%;" disabled>';
						}
					}
				},
				{
					data : 'partRev',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partRev" value="'+ data + '" style="max-width:100%; text-align:center;"  disabled>';
						} else {
							return '<input type="text" class="form-control" name="partRev" value="" style="max-width:100%; text-align:center;" disabled>';
						}
					}
				},
				{
					data : 'partGubunNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partGubun" value="'+ data + '" style="max-width:100%; text-align:center;"  disabled>';
						} else {
							return '<input type="text" class="form-control" name="partGubun" value="" style="max-width:100%; text-align:center;" disabled>';
						}
					}
				},{
					data : 'partTypeNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partType" value="'+ data + '" style="max-width:100%; text-align:center;"  disabled>';
						} else {
							return '<input type="text" class="form-control" name="partType" value="" style="max-width:100%; text-align:center;" disabled>';
						}
					}
				},
				{
					data : 'partSpec',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partSpec" value="'
									+ data
									+ '" style="max-width:100%;"  disabled>';
						} else {
							return '<input type="text" class="form-control" name="partSpec" value="" style="max-width:100%;" disabled>';
						}
					}
				},
				{
					data : 'partUnitNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partUnit" value="'
									+ data
									+ '" style="max-width:100%; text-align:center;"  disabled>';
						} else {
							return '<input type="text" class="form-control" name="partUnit" value="" style="max-width:100%; text-align:center;" disabled>';
						}
					}
				},
				{
					data : 'partConsumpt',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partConsumpt" value="'
									+ data
									+ '" style="max-width:100%; text-align:center;" disabled>';
						} else {
							return '<input type="text" class="form-control" name="partConsumpt" value="" style="max-width:100%; text-align:center;" >';
						}
					}
				}

		],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {
			//uiProc2(false);
		},
		buttons : [ ],
		
		
	});

	let ebomTempTable = $('#ebomTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,		
		ajax : {
			url : '<c:url value="bm/itemMotorEBomList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				}
			},
		},
		rowId : 'partCd',
		columns : [
				{
					data : 'partCd'
				},
				{
					data : 'partNm'
				},
				{
					data : 'partRev'
				},
				{
					data : 'partGubunNm'
				},{
					data : 'partTypeNm'
				},
				{
					data : 'partSpec'
				},
				{
					data : 'partUnitNm'
				},
				{
					data : 'partConsumpt'
				}

		],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {
			//uiProc2(false);
		},
		buttons : [ 'copy', {
			extend : 'excel',
			title : 'E-BOM관리'
		}, 'print' ],
		
	});

	$('#ebomTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');

		} else {
			$('#ebomTable').DataTable().$('tr.selected').removeClass(
					'selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#ebomTable').DataTable().row(this).index();
		console.log(tableIdx);
		$('#ebomDelete').attr('disabled', false);
		$('#ebomAllDelete').attr('disabled', false);

		btnView = 'edit';

	});

	
	// 추가버튼 
	$('#ebomAdd').on('click', function() {
		$('#ebomTable').DataTable().row.add({}).draw(false);
		$('#ebomSave').removeClass('d-none');
		//uiProc2(false);
		btnView = '';
	});

	// 수정버튼
	$('#ebomEdit').on('click', function() {

		if (btnView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('button[name=btnPartCd]').eq(tableIdx).attr('disabled', false);
		$('button[name=btnPartNm]').eq(tableIdx).attr('disabled', false);
		$('input[name=partConsumpt]').eq(tableIdx).attr('disabled', false);

		$('#ebomSave').removeClass('d-none');
		//$('#ebomAdd').attr('disabled',false);
		//$('#ebomDelete').attr('disabled',false);
		//$('#ebomAllDelete').attr('disabled',false);
		//$('#ebomEdit').attr('disabled',true);
		//uiProc2(false);

		btnView = '';
	});

	//전체체크
    $('#checkboxAll').on('click', function(){
        if($("#checkboxAll").prop("checked")) { 
           $("input[type=checkbox]").prop("checked",true); 
        } else { 
           $("input[type=checkbox]").prop("checked",false);
        }        
    });


	//삭제버튼
	$('#ebomDelete').on('click',function(){
		
	 	var checkbox = $("input:checkbox[name=check]:checked");
	 	checkbox.each(function(i) {
		 	var tr = checkbox.parent().parent().eq(i);
		 	checkArr[i]=tr.index();
	 	});

	 	$('#ebomTable').DataTable().rows(checkArr).remove().draw(); 
	 	checkArr=[];
	 	
		$('input:checkbox[name=check]').prop("checked",false);
		$('#checkboxAll').prop("checked",false);
		$('#ebomSave').removeClass('d-none');
	});
	

	// 열 전체삭제
	$('#ebomAllDelete').on('click', function() {
		$('#ebomTable').DataTable().clear().draw();
		$('#ebomSave').addClass('d-none');
	});

	// 저장 처리
	$('#ebomSave').on('click',function() {

		var check = true;
		var dataArray = new Array();
	
		$('#ebomTable tbody tr').each(
			function(index, item) {
	
				if (ebomTable.data().count() != 0) {
	
					if ($(this).find('td input[name=partCd]').val() == "") {
						toastr.warning('코드를 선택해주세요.');
						$('input [name=partCd]').focus();
						check = false;
						return false;
					}
					if ($(this).find('td input[name=partConsumpt]').val() == "") {
						toastr.warning('소모량을 입력해주세요.');
						$('input [name=partConsumpt]').focus();
						check = false;
						return false;
					}
				}
	
				var rowData = new Object();
				rowData.itemCd = itemCd;
				rowData.itemRev = itemRev;
				partCdData = $(this).find('td input[name=partCd]').val();
				rowData.partCd = partCdData == null ? "": partCdData;
				rowData.partRev = $(this).find('td input[name=partRev]').val();
				rowData.partConsumpt = $(this).find('td input[name=partConsumpt]').val();
				rowData.ebom = ebom;
				dataArray.push(rowData);
				console.log(rowData);
	
			});

		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/itemMotorEBomCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {
					if (res.result == 'ok') {
						uiProc2(true);
						$('#ebomEdit').attr('disabled',false);
						$('#ebomSave').addClass('d-none');
						btnView = '';

						$('#ebomTable').DataTable().ajax.reload(function() {});
						
						toastr.success('저장되었습니다.');

					} else if (res.result == 'distinct') {
						toastr.warning("중복된 품번("+res.data+")이 있습니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
			});
		}
	});

	//m-bom 목록보기
	let mbomTable = $('#mbomTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'p>>B",
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
			url : '<c:url value="/bm/prcssCodeAdmAllList"/>',
			type : 'GET',
			data : {
				bomCd : function() {
					return bomCd;
				}
			},
		},
		rowId : 'prcssCd',
		columns : [ {
			data : 'bomGubun',
			'className' : 'text-center',
			name : 'rowspan'
		}, {
			data : 'prcssMidNm',
			'className' : 'text-center',
			name : 'rowspan'
		}, {
			data : 'lowerPrcssCd',
			'className' : 'text-center'
		}, {
			data : 'prcssNm',
			'className' : 'text-center'
		}, {
			data : 'osrcYnNm',
			'className' : 'text-center'
		}, {
			data : 'prcssDesc',
			'className' : 'text-center'
		} ],
		rowsGroup : [ 'rowspan:name', [ 0, 1 ] ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : 'M-BOM관리'
		}, 'print' ],
	});

	$('#mbomTable tbody').on(
			'click',
			'tr',
			function() {

				if ($(this).hasClass('selected')) {
					//$(this).removeClass('selected');

				} else {
					$('#mbomTable').DataTable().$('tr.selected').removeClass(
							'selected');
					$(this).addClass('selected');
				}
				tableIdx = $('#mbomTable').DataTable().row(this).index();
				console.log(tableIdx);
				$('#mbomDelete').attr('disabled', false);
				$('#mbomAllDelete').attr('disabled', false);
				btnView = 'edit';
			});

	// 열삭제
	$('#mbomDelete').on('click', function() {

		if (mbomTable.data().count() == 0) {
			toastr.warning("삭제할 BOM코드가 없습니다. 확인해주세요.");
		} else {
			$('#mbomTable').DataTable().clear().draw();
			bomCd = "";
			$('#mbomSave').removeClass('d-none');
			btnView = "edit";
		}
	});

	// 저장 처리
	$('#mbomSave').on('click', function() {

		if (btnView == "add") {
			var url = '<c:url value="/bm/itemMotorMBomCreate"/>';
		} else {
			url = '<c:url value="/bm/itemMotorMBomUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'bomCd' : function() {
					return bomCd;
				},
			},
			beforeSend : function() {
			},
			success : function(res) {
				if (res.result == "ok") {
					$('#mbomSave').addClass('d-none');
					if (btnView == "add") {
						toastr.success('저장되었습니다.');
					} else {
						toastr.success('삭제되었습니다.');
					}
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#mbomTable').DataTable().ajax.reload(function() {
				});
				$('#itemMotorTable').DataTable().ajax.reload(function() {
				});

			}
		});
	});

	//이미지 Event
	$('#photo').on('click', function() {
		$('#imageFile1').attr("src", "");
		$('#imageFile2').attr("src", "");
		$('#imageFile3').attr("src", "");
		$('#imageFile4').attr("src", "");
		imgPrint();
	});

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemMotorImgRead"/>',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
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
		console.log('img');
		var value = null;

		value = number;
		console.log('value : '+value);
		var fileListView = "";

		var formData = new FormData(document.getElementById("form4")); //ajax로 넘길 data
		for (var pair of formData.entries()) {console.log(pair[1]); }
		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("itemCd", itemCd);
		formData.append("itemRev", itemRev);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.

		$.ajax({
			url : '<c:url value="/bm/itemMotorImgUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				console.log('value : '+data.result);
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
			url : '<c:url value="/bm/itemMotorImageDelete"/>',
			type : 'POST',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'value' : value

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

	var partCd;
	var partRev;
	var itemPartPopUpTable;

	function selectRev() {
		if (itemPartPopUpTable == null || itemPartPopUpTable == undefined) {

			itemPartPopUpTable = $('#itemPartPopUpTable').DataTable({
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
				serverSide : true,
				pageLength : 15,
				ajax : {
					url : '<c:url value="bm/itemPartAdmList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'partCd',
				columns : [
						{
							render : function(data, type, row,
									meta) {
								return meta.row+ meta.settings._iDisplayStart+ 1;
							}
						}, {
							data : 'partCd',
							'className' : 'text-center'
						}, {
							data : 'partNm'
						}, {
							data : 'partGubunNm',
							'className' : 'text-center'
						}, {
							data : 'partTypeNm',
							'className' : 'text-center'
						}, {
							data : 'partRev',
							'className' : 'text-center'
						}, {
							data : 'partSpec'
						} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 1, 'asc' ] ],
				buttons : [],
			});

			$('#itemPartPopUpTable tbody').on('click', 'tr', function() {

				var data = itemPartPopUpTable.row(this).data();
				console.log(data);
				console.log('tableIdx:'+tableIdx)
				//partCd = itemPartPopUpTable.row(this).data().partCd;
				//partRev = itemPartPopUpTable.row(this).data().partRev;
				$('input[name=partCd]').eq(tableIdx).val(data.partCd);
				$('input[name=partRev]').eq(tableIdx).val(data.partRev);
				$('input[name=partNm]').eq(tableIdx).val(data.partNm);
				$('input[name=partSpec]').eq(tableIdx).val(data.partSpec);
				$('input[name=partUnit]').eq(tableIdx).val(data.partUnitNm);
				$('input[name=partGubun]').eq(tableIdx).val(data.partGubunNm);
				$('input[name=partType]').eq(tableIdx).val(data.partTypeNm);
				$('input[name=partConsumpt]').eq(tableIdx).val(data.partConsumpt);
				
				sideView = 'rev';
				$('#itemPartPopUpModal').modal('hide');
			});
		} else {
			$('#itemPartPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#itemPartPopUpModal').modal('show');
	};

	// 가져오기 처리
	$('#btnGet').on('click', function() {
		if (sideView != 'rev') {
			toastr.warning("등록할 부품을 선택해 주세요!");
			return false;
		}

		//Revision값 가져오기
		$.ajax({
			url : '<c:url value="bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'partCd' : partCd,
				'partRev' : partRev
			},
			success : function(res) {
				var data = res.data;

			}
		});
		$('#itemPartPopUpModal').modal('hide');
	});

	//Bom 팝업 시작
	var bomPopUpTable;
	function selectMbom() {
		if (bomPopUpTable == null || bomPopUpTable == undefined) {
			bomPopUpTable = $('#bomPopUpTable').DataTable({
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
				pageLength : 20,
				ajax : {
					url : '<c:url value="/bm/prcssBomAdmList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'partCd',
				columns : [ {
					data : 'bomCd',
					'className' : 'text-center'
				}, {
					data : 'bomGubunNm',
					'className' : 'text-center'
				}, {
					data : 'bomNm',
					'className' : 'text-center'
				}, {
					data : 'bomDtlNm',
					'className' : 'text-center'
				}, {
					data : 'useYnNm',
					'className' : 'text-center'
				} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});

			$('#bomPopUpTable tbody').on('click', 'tr', function() {
				//var data = dealCorpPopUpTable.row( this ).data();
				bomCd = bomPopUpTable.row(this).data().bomCd;
				$('#mbomTable').DataTable().ajax.reload(function() {
				});
				$('#mbomSave').removeClass('d-none');
				$('#bomPopUpModal').modal('hide');
				btnView = "add";
			});
		} else {
			$('#bomPopUpTable').DataTable().ajax.reload(function() {
			});
		}
		$('#bomPopUpModal').modal('show');
	}

	// BOM-MATCH 목록조회
	let bomMatchTable = $('#bomMatchTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/prcssCodeAdmAllList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'bomCd' : function() {
					return bomCd;
				}
			},
		},
		rowId : 'prcssCd',
		columns : [ {
			data : 'bomGubun',
			'className' : 'text-center'
		}, {
			data : 'prcssMidNm',
			'className' : 'text-center'
		}, {
			data : 'lowerPrcssCd',
			'className' : 'text-center'
		}, {
			data : 'prcssNm',
			'className' : 'text-center'
		}, {
			data : 'partCd',
			'className' : 'text-center'
		} ],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {

		},
	});

	$('#bomMatchTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');

		} else {
			$('#bomMatchTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#bomMatchTable').DataTable().row(this).index();

		lowerPrcssCd = bomMatchTable.row(this).data().lowerPrcssCd;
		prcssNm = bomMatchTable.row(this).data().prcssNm;

		$('#prcssCd').val(lowerPrcssCd);
		$('#prcssNm').val(prcssNm);

		if ($('#itemPartAdmTable tbody tr').length == 0) {
			$('#itemPartAdmTable tbody').append(
					'<tr><td colspan="5">데이터가 없습니다.</td></tr>');

		}
		$('#itemBomMapDtlTable').DataTable().ajax.reload(function() {});
		$('#itemPartAdmTable').DataTable().clear().draw();
		
		$('#itemBomMapModal').modal('show');

		$('#bomMatSave').addClass('d-none');
		$('#bomMatEdit').attr('disabled', false);
		btnView = 'edit';

	});

	// BOM-MAT 상세 조회
	let itemBomMapDtlTable = $('#itemBomMapDtlTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		ajax : {
			url : '<c:url value="bm/itemBomMapRead"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'prcssCd' : function() {
					return lowerPrcssCd;
				}
			},
		},
		rowId : '',
		columns : [
				{
					data : 'partCd',
					render : function(data, type, row, meta) {
						var value = "";
						if (data != null) {
							value = '<input type="text" class="form-control" style="max-width:100%;" name="partCd" value="'
									+ data + '" disabled>';
							value2 = '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectPartCd();" disabled>';

						} else {
							value = '<input type="text" class="form-control" name="partCd" value="" disabled>';
							value2 = '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectPartCd();">';
						}

						var html = '<div class="input-sub m-0">';
						html += value;
						html += value2;
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				},
				{
					data : 'partNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partNm" value="'+data+'" style="text-align:center;" disabled>';

						} else {
							return '<input type="text" class="form-control" name="partNm" value="" style="text-align:center;" disabled>';
						}
					}
				},
				{
					data : 'partRev',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partRev" value="'+data+'" style="text-align:center;" disabled>';

						} else {
							return '<input type="text" class="form-control" name="partRev" value="" style="text-align:center;" disabled>';
						}
					}
				},
				{
					data : 'partSpec',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" name="partSpec" value="'+data+'" style="text-align:center;" disabled>';

						} else {
							return '<input type="text" class="form-control" name="partSpec" value="" style="text-align:center;" disabled>';
						}
					}
				}, ],
		order : [ [ 0, 'asc' ] ],
		columnDefs : [ {
			className : "text-center",
			targets : '_all'
		}, ]
	});

	$('#itemBomMapDtlTable tbody').on('click','tr',
		function() {
	
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
	
			} else {
				$('#itemBomMapDtlTable').DataTable().$('tr.selected')
						.removeClass('selected');
				$(this).addClass('selected');
			}
			tableIdx = $('#itemBomMapDtlTable').DataTable().row(this).index();
	
			btnView2 = 'edit';
			
	
		});

	// 열추가
	$('#bomMatAdd').on('click', function() {

		if (itemBomMapDtlTable.data().count() == 11) {
			toastr.warning("부품 추가를 초과하였습니다.");
			return true;
		}

		$('#itemBomMapDtlTable').DataTable().row.add({}).draw(false);
		//$('#bomMatEdit').attr('disabled',true);

		$('#bomMatSave').removeClass('d-none');
		//uiProc3(false);
		btnView2 = '';

	});

	// 열수정
	$('#bomMatEdit').on('click', function() {

		if (btnView2 != "edit") {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('button[name=btnPartCd]').eq(tableIdx).attr('disabled', false);

		$('#bomMatSave').removeClass('d-none');
		btnView2 = '';

	});

	// 열삭제
	$('#bomMatDel').on('click',function() {

		if (btnView2 != "edit") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$('#itemBomMapDtlTable').DataTable().rows('.selected').remove()
				.draw(true);
		$('#bomMatSave').removeClass('d-none');
		$('#bomMatAdd').attr('disabled', false);

		btnView2 = '';

	});

	// 저장 처리
	$('#bomMatSave').on('click',function() {

		var check = true;
		var dataArray = new Array();
	
		$('#itemBomMapDtlTable tbody tr').each(function(index, item) {
	
			if (itemBomMapDtlTable.data().count() != 0) {

				if ($(this).find('td input[name=partCd]').val() == "") {
					toastr.warning('코드를 선택해주세요.');
					$('input [name=partCd]').focus();
					check = false;
					return false;
				}
			}

			var rowData = new Object();

			rowData.itemCd = itemCd;
			rowData.itemRev = itemRev;
			rowData.prcssCd = $('#prcssCd').val();

			var partCdValue = $(this).find('td input[name=partCd]').val();

			rowData.partCd = partCdValue == null ? "": partCdValue;
			rowData.partRev = $(this).find('td input[name=partRev]').val();

			dataArray.push(rowData);
			console.log(rowData);

		});
	
		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/itemBomMapCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {
					if (res.result == 'ok') {
	
						$('#bomMatEdit').attr('disabled', false);
						$('#bomMatSave').addClass('d-none');
						$('#itemBomMapDtlTable').DataTable().ajax.reload(function() {});
						$('#bomMatchTable').DataTable().ajax.reload(function() {$('#bomMatchTable').rowspan(0);
						$('#bomMatchTable').rowspan(1);});
						btnView = '';
						toastr.success('저장되었습니다.');
						$('#itemBomMapModal').modal('hide');
					} else if (res.result == 'exist') {
						toastr.error("동일한 부품코드(" + res.data + ")가 존재합니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//$('#ebomTable').DataTable().ajax.reload(function() {});
				}
			});
		}
	});

	// 작업표준서 목록조회
	let workStandTable = $('#workStandTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemWorkStandardList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'bomCd' : function() {
					return bomCd;
				}
			},
		},
		rowId : 'prcssCd',
		columns : [{
			data : 'prcssNm',
			'className' : 'text-center'
		}, {
			data : 'workStandardNm'
			, render : function(data, type, row,meta) {
               var del;
               
			   del = '<div class="rightsidebar-close">';
			   del += '<button type="button" class="btn" name="closeBtn" onclick=deleteWorkStandard("'+row['prcssCd']+'");>';
			   del += '<i class="mdi mdi-close"></i>';
			   del += '</button>';
			   del += '</div>';
			   
			   var html;
			   if(data == null){
				   html = '<div class="custom-file">'
				   html += '<input type="file" class="custom-file-input" id="fileNm_'+row['prcssCd']+'" name="fileNm_'+row['prcssCd']+'" onchange=uploadWorkStandard("'+row['prcssCd']+'"); />'    
	 			   html += '<label class="custom-file-label" for="fileNm_'+row['prcssCd']+'">파일을 선택해주세요.</label></div>'
	 			   
			   } else{
				   html = '<a href="/bm/itemWorkStandardDownload?itemCd='+itemCd+'&itemRev='+itemRev+'&prcssCd='+row['prcssCd']+'">'+data+'</a>'+del
			   }
				
			   return  html;
              } 
		} ],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {

		},
	});

	// 작업표준서 등록
	function uploadWorkStandard(prcssCd) {

		console.log(prcssCd);
		
		var formData = new FormData(document.getElementById("form6")); //ajax로 넘길 data

		formData.append("itemCd", itemCd);
		formData.append("itemRev", itemRev);
		formData.append("prcssCd", prcssCd);
		

		$.ajax({
			url : '<c:url value="/bm/itemWorkStandardUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
					$('#workStandTable').DataTable().ajax.reload(function(){});
				} 
			}
		});

	}

	//작업표준서 삭제
	function deleteWorkStandard(prcssCd) {
		console.log("Ddd");
		
		$.ajax({
			url : '<c:url value="/bm/itemWorkStandardDelete"/>',
			type : 'POST',
			data : {
				'itemCd' : function() {return itemCd;},
				'itemRev' : function() {return itemRev;},
				'prcssCd' : prcssCd

			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#workStandTable').DataTable().ajax.reload(function(){});
				}

			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	} 


	//부품조회
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		paging : false,
		ajax : {
			url : '<c:url value="bm/itemBomMapEbomList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() { return itemCd;},
				'itemRev': function() { return itemRev;},
			},
		},
		rowId : 'partCd',
		columns : [ {
			data : 'partCd',
			'className' : 'text-center'
		}, {
			data : 'partNm'
		}, {
			data : 'partGubunNm',
			'className' : 'text-center'
		}, {
			data : 'partTypeNm',
			'className' : 'text-center'
		}, {
			data : 'partRev'
		}, {
			data : 'partSpec'
		}, ],
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center"
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
	});

	$('#itemPartAdmTable tbody').on('click', 'tr', function() {

		var data = itemPartAdmTable.row(this).data();
		$('input[name=partCd]').eq(tableIdx).val(data.partCd);
		$('input[name=partNm]').eq(tableIdx).val(data.partNm);
		$('input[name=partSpec]').eq(tableIdx).val(data.partSpec);
		$('input[name=partRev]').eq(tableIdx).val(data.partRev);

		$('#itemPartAdmTable').DataTable().clear().draw();

		sideView = 'rev';
	});


	// 특주 목록조회
	let specialOrderTable = $('#specialOrderTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemMotorFileList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'fileType' : function() {
					return fileType;
				}
			},
		},
		rowId : 'prcssCd',
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
				render : function(data, type, row) {
					return moment(row['fileDate']).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			},
			{
				data : 'regNm',
				'className' : 'text-center'
			},
			{
				data : 'fileContent',
				render : function(data, type, row) {
					if (data != null) {
						return '<input type="text" class="form-control" name="fileContent" value="'+ data+'"  style="border:none; min-width:100%;" disabled>';
					} else {
						return '<input type="text" class="form-control" name="visitContent" value=""  style="border:none; width:100%;" disabled>';
					}
				}
			},
			{
				data : 'fileNm',
				render : function(data, type, row) {

					if (data != null) {
						return '<a href="/bm/itemMotorFileDownload?itemCd='+itemCd+'&itemRev='+itemRev+'&fileType='+row['fileType']+'&fileSeq='+row['fileSeq']+'">'+data+'</a>';
					} else {
						return '<a href="/bm/itemMotorFileDownload?itemCd='+itemCd+'&itemRev='+itemRev+'&fileType='+row['fileType']+'&fileSeq='+row['fileSeq']+'"></a>';
						
					} 
				}
			}
		],
		order : [ [ 1, 'desc' ] ],
		drawCallback : function(settings) {

		},
	});


	// 특주 목록조회
	let specifyTable = $('#specifyTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemMotorFileList"/>',
			type : 'GET',
			data : {
				'itemCd' : function() {
					return itemCd;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'fileType' : function() {
					return fileType;
				}
			},
		},
		rowId : 'prcssCd',
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
				render : function(data, type, row) {
					return moment(row['fileDate']).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			},
			{
				data : 'regNm',
				'className' : 'text-center'
			},
			{
				data : 'fileContent',
				render : function(data, type, row) {
					if (data != null) {
						return '<input type="text" class="form-control" name="fileContent" value="'+ data+'"  style="border:none; min-width:100%;" disabled>';
					} else {
						return '<input type="text" class="form-control" name="visitContent" value=""  style="border:none; width:100%;" disabled>';
					}
				}
			},
			{
				data : 'fileNm',
				render : function(data, type, row) {

					if (data != null) {
						return '<a href="/bm/itemMotorFileDownload?itemCd='+itemCd+'&itemRev='+itemRev+'&fileType='+row['fileType']+'&fileSeq='+row['fileSeq']+'">'+data+'</a>';
					} else {
						return '<a href="/bm/itemMotorFileDownload?itemCd='+itemCd+'&itemRev='+itemRev+'&fileType='+row['fileType']+'&fileSeq='+row['fileSeq']+'"></a>';
						
					} 
				}
			}
		],
		order : [ [ 1, 'asc' ] ],
		drawCallback : function(settings) {

		},
	});

	
	var count;
	
	//특주 추가 버튼
	$('#btnSpecialOrderAdd').on('click', function() {

		count = specialOrderTable.data().count();
		
		if(count==0){
			$('#specialOrderTable tbody').empty();
		} 
		
		$('#specialOrderTable > #dataInsert').append('<tr id="createValue"><td style="text-align:center;">'+(count+1)+'</td>'
				+'<td>'
				+'<div class="form-group input-sub m-0 row">'
				+'<input class="form-control" type="text" id="fileDate" value="'+serverDate+'"name="fileDate" disabled/>'
				+	'<button onclick="fnPopUpCalendar(fileDate,fileDate,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
				+		'id="fileDateCalendar" type="button">'
				+		'<span class="oi oi-calendar"></span>'
				+	'</button>'
				+'</div>'
				+'</td>'
				+'<td><input type="text" value="'+userNm+'"name="regNm" id="regNm" style="width:100%; text-align:center; border:none;" disabled/></td>'
				+'<td><input type="text" class="form-control" name="fileContent" id="fileContent" style="min-width:100%"/></td>'
				+'<td><form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">'
				+'<input type="file" class="custom-file-input" id="specialOrderFileNm" name="specialOrderFileNm">'
				+'<label class="custom-file-label" for="fileNm"></label>'
				+'</div></form></td>'
				+'</tr>');
		
		$('#specialOrderSave').removeClass('d-none');
		$('#btnSpecialOrderAdd').attr('disabled', true); //추가버튼
		$('#btnSpecialOrderDel').attr('disabled', true);  //삭제버튼		
		
	});

	//관련자료 추가 버튼
	$('#btnSpecifyAdd').on('click', function() {

		count = specifyTable.data().count();
		
		if(count==0){
			$('#specifyTable tbody').empty();
		} 
		
		$('#specifyTable > #dataInsert2').append('<tr id="createValue2"><td style="text-align:center;">'+(count+1)+'</td>'
				+'<td>'
				+'<div class="form-group input-sub m-0 row">'
				+'<input class="form-control" type="text" id="fileDate2" value="'+serverDate+'"name="fileDate2" disabled/>'
				+	'<button onclick="fnPopUpCalendar(fileDate2,fileDate2,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"'
				+		'id="fileDateCalendar2" type="button">'
				+		'<span class="oi oi-calendar"></span>'
				+	'</button>'
				+'</div>'
				+'</td>'
				+'<td><input type="text" value="'+userNm+'" name="regNm2" id="regNm2" style="width:100%; text-align:center; border:none;" disabled/></td>'
				+'<td><input type="text" class="form-control" name="fileContent2" id="fileContent2" style="min-width:100%"/></td>'
				+'<td><form id="formFile2" method="post" enctype="multipart/form-data"> <div class="custom-file">'
				+'<input type="file" class="custom-file-input" id="specifyFileNm" name="specifyFileNm">'
				+'<label class="custom-file-label" for="fileNm"></label>'
				+'</div></form></td>'
				+'</tr>');
		
		$('#specifySave').removeClass('d-none');
		$('#btnSpecifyAdd').attr('disabled', true); //추가버튼
		$('#btnSpecifyDel').attr('disabled', true);  //삭제버튼		
		
	});


	// 특주 선택
	$('#specialOrderTable tbody').on('click', 'tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#specialOrderTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		fileTableIdx = $('#specialOrderTable').DataTable().row(this).index();
		fileSeqVal = specialOrderTable.row(fileTableIdx).data().fileSeq;
		btnView3='edit';
		
	});

	// 사양서 선택
	$('#specifyTable tbody').on('click', 'tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#specifyTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		fileTableIdx = $('#specifyTable').DataTable().row(this).index();
		fileSeqVal = specifyTable.row(fileTableIdx).data().fileSeq;
		btnView3='edit';
	});

	//특주 저장
	$('#specialOrderSave').on('click', function() {
		fileSave('1' , 'formFile');
	});

	//사양서 저장
	$('#specifySave').on('click', function() {
		fileSave('2' , 'formFile2');
	});

	function fileSave(type , formDataVal){

		//입력값 검사
		if(type=="1"){
			if (!$.trim($('#specialOrderFileNm').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#specialOrderFileNm').focus();
				return false;
			} 

			fileDateVal  =  $('#fileDate').val().replace(/-/g,'');
			fileContentVal = $('#fileContent').val();

		}else if(type=="2"){
			if (!$.trim($('#specifyFileNm').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#specifyFileNm').focus();
				return false;
			} 

			fileDateVal  =  $('#fileDate2').val().replace(/-/g,'');
			fileContentVal = $('#fileContent2').val();
		}
		
		var formData = new FormData(document.getElementById(formDataVal));
		
		formData.append('itemCd', itemCd);
		formData.append('itemRev', itemRev);
		formData.append('fileType', fileType);
		formData.append('fileDate', fileDateVal);
		formData.append('fileContent', fileContentVal);
	
		
		$.ajax({
			url : '<c:url value="/bm/itemMotorFileCreate"/>',
			type : 'POST',
			data : formData,
		    processData: false,
	        contentType: false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					toastr.success('등록되었습니다.');
					if(type=="1"){
						$('#specialOrderTable').DataTable().ajax.reload(function() {});

						$('#specialOrderSave').addClass('d-none');
						$('#btnSpecialOrderAdd').attr('disabled', false); //추가버튼
						$('#btnSpecialOrderDel').attr('disabled', false);  //삭제버튼		

						$("#createValue").remove();
					}else if(type=="2"){
						$('#specifyTable').DataTable().ajax.reload(function() {});

						$('#specifySave').addClass('d-none');
						$('#btnSpecifyAdd').attr('disabled', false); //추가버튼
						$('#btnSpecifyDel').attr('disabled', false);  //삭제버튼		

						$("#createValue2").remove();
					}

				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
			}
		});
	}

	//특주 삭제
	$('#btnSpecialOrderDel').on('click', function() {
		fileDel();
	});

	//사양서 삭제
	$('#btnSpecifyDel').on('click', function() {
		fileDel();
	});


	function fileDel(){

		if(btnView3 != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		$.ajax({
			url : '<c:url value="/bm/itemMotorFileDelete" />',
			type : 'GET',
			data : {
				'itemCd' : function() {return itemCd;},
				'itemRev' : function() {return itemRev;},
				'fileType' : function() {return fileType;},
				'fileSeq' : function() {return fileSeqVal;}
			},
			success : function(res){
				toastr.success("삭제되었습니다.");
				$('#specialOrderTable').DataTable().ajax.reload(function() {});
				$('#specifyTable').DataTable().ajax.reload(function() {});

				btnView3='';
			}
		})
	}

	

	//엑셀 업로드 시작-----------------------------------------------------------------------
	
	//모터정보 엑셀업로드 모달
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
			url : '<c:url value="bm/itemMotorExcelDataList" />',
			type : 'GET',
			data : {
				 'url' : function(){return urlData;} 
				}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{data : 'itemRev'},
			{data : 'itemGubun'},
			{data : 'itemSeries'},
			{data : 'frameSize'},
			{data : 'itemCapa'},
			{data : 'itemEncdr'},
			{data : 'itemType'},
			{data : 'ipClass'},
			{data : 'serialNo'},
			{data : 'itemVoltage'},
			{data : 'itemOutput'},
			{data : 'itemSize'},
			{data : 'itemGubun2'},
			{data : 'unitCost'},
			{data : 'useYn'},
			{data : 'itemDesc'}
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
	});


	//BOM-MAT 엑셀 업로드 모달
	let inTable2 = $('#inTable2').DataTable({
		language : lang_kor,
		paging : true,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/bomMatchExcelDataList" />',
			type : 'GET',
			data : {
				 'url' : function(){return urlData;} 
				}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'itemCd'},
			{data : 'itemRev'},
			{data : 'prcssCd'},
			{data : 'partCd'},
			{data : 'partRev'},
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
	});


	//E-BOM정보 엑셀업로드 모달
	let inTable3 = $('#inTable3').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/eBomExcelDataList" />',
			type : 'GET',
			data : {
				 'url' : function(){return urlData;} 
				}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'partCd'},
			{data : 'partRev'},
			{data : 'partConsumpt'},
		],
		columnDefs: [
			{ "targets": [3] , "className" : "text-right" },
        	{"targets": "_all" , "className": "text-center"},
        ],
	});

	
	//모터정보 파일 선택
	$('#btnExcelUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);
		
		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls" || str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/itemMotorExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});

					$('#inModal').modal('show');
					$('#btnExcelUpload').val("");
					$('#my-spinner').hide();
				},
				complete : function() {
			}
			});

		} else {
			return false;
		}

	});

	//BOM매칭 파일 선택
	$('#btnExcelUpload2').change( function() {
		var formData = new FormData($('#fileUploadForm2')[0]);

		var str = $('#btnExcelUpload2').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls" || str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/bomMatchExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;
					$('#inTable2').DataTable().ajax.reload(function(){});
					$('#inModal2').modal('show');
					$('#btnExcelUpload2').val("");
				},
				error : function(e) {
				}
			});

		} else {
			return false;
		}

	});


	//Ebom매칭 파일 선택
	$('#btnExcelUpload3').change( function() {
		var formData = new FormData($('#fileUploadForm3')[0]);

		var str = $('#btnExcelUpload3').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls" || str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/eBomExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;
					$('#inTable3').DataTable().ajax.reload(function(){});
					$('#inModal3').modal('show');
					$('#btnExcelUpload3').val("");
				},
				error : function(e) {
				}
			});

		} else {
			return false;
		}

	});
	

	//모터정보 적용버튼 클릭시
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.itemCd= inTable.row(index).data().itemCd;
			rowData.itemNm= inTable.row(index).data().itemNm;
			rowData.itemRev= inTable.row(index).data().itemRev;
			rowData.itemGubun= inTable.row(index).data().itemGubun;
			rowData.itemSeries= inTable.row(index).data().itemSeries;
			rowData.frameSize= inTable.row(index).data().frameSize;
			rowData.itemCapa= inTable.row(index).data().itemCapa;
			rowData.itemEncdr = inTable.row(index).data().itemEncdr;
			rowData.itemType= inTable.row(index).data().itemType;
			rowData.ipClass= inTable.row(index).data().ipClass;
			rowData.serialNo= inTable.row(index).data().serialNo;
			rowData.itemVoltage= inTable.row(index).data().itemVoltage;
			rowData.itemOutput= inTable.row(index).data().itemOutput;
			rowData.itemSize= inTable.row(index).data().itemSize;
			rowData.itemGubun2= inTable.row(index).data().itemGubun2;
			rowData.unitCost= inTable.row(index).data().unitCost;
			rowData.useYn= inTable.row(index).data().useYn;
			rowData.itemDesc= inTable.row(index).data().itemDesc;
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/itemMotorAdmExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#itemMotorTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {

					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});


	//BOM매칭 적용버튼 클릭시
	$('#btnApply2').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	
			
		$('#inTable2 tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.itemCd= inTable2.row(index).data().itemCd;
			rowData.itemRev= inTable2.row(index).data().itemRev;
			rowData.prcssCd= inTable2.row(index).data().prcssCd;
			rowData.partCd= inTable2.row(index).data().partCd;
			rowData.partRev= inTable2.row(index).data().partRev;
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/bomMatchExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#bomMatchTable').DataTable().ajax.reload(function(){});
						$('#inModal2').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});


	//Ebom매칭 적용버튼 클릭시
	$('#btnApply3').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	
			
		$('#inTable3 tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.itemCd= itemCd;
			rowData.itemRev= itemRev;
			rowData.partCd= inTable3.row(index).data().partCd;
			rowData.partRev= inTable3.row(index).data().partRev;
			rowData.partConsumpt= inTable3.row(index).data().partConsumpt;
			
	        dataArray.push(rowData);
	        console.log(dataArray)
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/itemMotorEbomExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#ebomTable').DataTable().ajax.reload(function(){});
						$('#inModal3').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'distinct') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	//엑셀 업로드 끝-----------------------------------------------------------------------
	
	
	function selectPartCd() {
		$('#itemPartAdmTable').DataTable().ajax.reload(function() {});
	};


	//열병합
	$.fn.rowspan = function(colIdx, isStats) { //jQuery.prototype에 함수 추가
		return this.each(function() {
			var that;
			$('tr', this).each(function(row) { //this -> $(this).find('tr') 
				$('td:eq(' + colIdx + ')', this).each(function(col) {

					if ($(this).text() == $(that).text() && (!isStats || isStats && $(this).prev().text() == $(that).prev().text())) {
						rowspan = $(that).attr("rowspan") || 1; 
						rowspan = Number(rowspan) + 1;

						$(that).attr("rowspan",rowspan);
						$(this).hide();
					} else {
						that = this;
					}
					// set the that if not already set
					that = (that == null) ? this: that;
				});
			});
		});
		
	};

	$('#unitCost').on('keyup',function(){
		$('#unitCost').val(addCommas(uncomma($(this).val())));
	})

	function uiProc(flag) {
		$("#itemNm").attr("disabled", flag);
		$("#itemGubun").attr("disabled", flag);
		$("#itemSeries").attr("disabled", flag);
		$("#frameSize").attr("disabled", flag);
		$("#itemCapa").attr("disabled", flag);
		$("#itemEncdr").attr("disabled", flag);
		$("#itemType").attr("disabled", flag);
		$("#ipClass").attr("disabled", flag);
		$("#ptpOhm").attr("disabled", flag);
		$("#ptpInduct").attr("disabled", flag);
		$("#phaseBemf").attr("disabled", flag);
		$("#phaseCurrent").attr("disabled", flag);
		
		$("#itemVoltage").attr("disabled", flag);
		$("#itemOutput").attr("disabled", flag);
		$("#itemSize").attr("disabled", flag);
		$("#itemGubun2").attr("disabled", flag);
		$("#unitCost").attr("disabled", flag);
		$("#itemCable").attr("disabled", flag);
		$("#itemDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);

		$('#serialNo').attr('disabled', flag);
	}

	function uiProc2(flag) {
		//$("input[name=partConsumpt]").attr("disabled", flag);	
		$("button[name=btnPart]").attr("disabled", flag);
	}

	function uiProc3(flag) {
		$('button[name=btnPrcssCdCorp]').attr('disabled', flag);
		$('button[name=btnEquipCdCorp]').attr('disabled', flag);
		$('button[name=osrcCorpCdBtn]').attr('disabled', flag);
	}





	var callView= '';
	var callItemCd= '';
	var itemCdTo= '';
	var itemRevTo= '';
	var array = new Array();

	var array2 = new Array();
	
	//불러오기 버튼을 클릭 시
	$('#btnCall').on('click', function(){
		$('#motorPopUpModal').modal('show');
		array = new Array();
		array2 = new Array();

		$('#itemMotorPopUpTable').DataTable().ajax.reload(function(){});	// 모터정보 팝업 테이블
	});

	//팝업테이블 클릭 시
	$(document).on('click', '#itemMotorPopUpTable tbody tr', function () {
		$('#my-spinner').show();

		callView= "saveReady";
		
		$('#itemMotorTable').DataTable().$('tr.selected').removeClass('selected');
		$('#form').each(function(){
        	this.reset();
    	});
		sideView = 'add';

		//제품코드 불러오기
		$.ajax({
			url : '<c:url value="/bm/itemMotorSeq"/>',
			type : 'POST',
			data : {},
			success : function(res) {
				data = res.itemCd;
				$('#form input[name="itemCd"]').val(data);
				callItemCd = data;
// 				console.log("data : "+data)
// 				console.log("callItemCd : "+callItemCd)
			}
		});

		
		//화면처리
		uiProc(false);
		$('#btnAdd').addClass('disabled');
		$('#btnRevAdd').addClass('disabled');
		$('#btnSave').removeClass('d-none');
		$("#eBom").addClass('disabled');
		$("#mBom").addClass('disabled');
		$("#photo").addClass('disabled');
		$("#bomMatch").addClass('disabled');
		$("#tab6Nav").addClass('disabled');
		$("#tab7Nav").addClass('disabled');
		$("#tab8Nav").addClass('disabled');
		
		$('#form input[name="itemRev"]').val("00");
		$('#btnCheck').attr("disabled", false);
		$('#btnEdit').attr('disabled', true); //수정버튼
		
	  	var data = itemMotorPopUpTable.row(this).data();
// 	  	console.log(data);
	  	//모터정보 값
		$('#itemNm').val(data.itemNm);
		$('#itemGubun').val(data.itemGubun);
		$('#itemSeries').val(data.itemSeries);
		$('#frameSize').val(data.frameSize);
		$('#itemCapa').val(data.itemCapa);
		
		$('#itemEncdr').val(data.itemEncdr);
		$('#ipClass').val(data.ipClass);
		$('#serialNo').val(data.serialNo);
		$('#itemVoltage').val(data.itemVoltage);
		$('#itemOutput').val(data.itemOutput);
		$('#itemSize').val(data.itemSize);
		$('#itemGubun2').val(data.itemGubun2);
		$('#itemDesc').val(data.itemDesc);
		
		$('#unitCost').val(data.unitCost);
		$('#itemType').val(data.itemType);
		//모터 정보 값

// 		console.log(data.itemCd);
// 		console.log(data.itemRev);
// 		console.log(data.bomCd);

// 		console.log(data.fileType);	//값 없음
		
		itemCd = data.itemCd;
		itemCdTo =	data.itemCd;	//계속 가지고 있을 itemCd 
		itemRev = data.itemRev;
		itemRevTo = data.itemRev;	//계속 가지고 있을 itemRev
		bomCd =	data.bomCd;

		//다른 테이블 값 불러오기
// 		imgPrint();//모터사진
		$('#ebomTable').DataTable().ajax.reload(function(){});			//E-BOM
		$('#mbomTable').DataTable().ajax.reload(function(){});			//M-BOM
		$('#bomMatchTable').DataTable().ajax.reload(function(){});		//BOM 매칭
		$('#workStandTable').DataTable().ajax.reload(function(){});		//작업표준서
		$('#specialOrderTable').DataTable().ajax.reload(function(){});	//특주
		$('#specifyTable').DataTable().ajax.reload(function(){});		//사양서

		setTimeout(function(){

			//작업표준서
			$.ajax({
				url : '<c:url value="bm/itemWorkStandardList"/>',
				type: 'GET',
				dataType: 'json',
				async: false,
				data : {
					'itemCd' 	: function() {return itemCd;},
					'itemRev' 	: function() {return itemRev;},
					'bomCd'		: function() {return bomCd;}
				},
				success: function(res) {
					let data = res.data;
					for(var i=0; i<data.length; i++){
						var obj = new Object();
						obj.itemCd = callItemCd;	//신규 값
						obj.itemCdTo = itemCd;		//기존 불러온 값
						obj.itemRev = '00';
						obj.itemRevTo = itemRevTo;
						obj.prcssCd = data[i].prcssCd;
						obj.workStandardNm = data[i].workStandardNm;
						array.push(obj);
					}
				},
			});//작업표준서

			//특주(001)
			$.ajax({
				url : '<c:url value="bm/itemMotorFileList"/>',
				type: 'GET',
				dataType: 'json',
				async: false,
				data : {
					'itemCd' 	: function() {return itemCd;},
					'itemRev' 	: function() {return itemRev;},
					'bomCd'		: function() {return bomCd;},
					'fileType' 	: function() {return '001';}
				},
				success: function(res) {
					let data = res.data;
//						console.log(data);
					for(var i=0; i<data.length; i++){
						var obj = new Object();

						obj.fileType = data[i].fileType;
						obj.fileSeq = data[i].fileSeq;
						
						obj.itemCd = callItemCd;	//신규 값
						obj.itemCdTo = itemCd;		//기존 불러온 값
						obj.itemRev = '00';
						obj.itemRevTo = itemRevTo;
						
						obj.fileNm = data[i].fileNm;
						obj.fileContent = data[i].fileContent;
						obj.fileDate = data[i].fileDate;
						obj.regNm = data[i].regNm;
						
						array2.push(obj);
//						console.log(array2);
					}
				},
			});//특주

			//사양서(002)
			$.ajax({
				url : '<c:url value="bm/itemMotorFileList"/>',
				type: 'GET',
				dataType: 'json',
				async: false,
				data : {
					'itemCd' 	: function() {return itemCd;},
					'itemRev' 	: function() {return itemRev;},
					'bomCd'		: function() {return bomCd;},
					'fileType' 	: function() {return '002';}
				},
				success: function(res) {
					let data = res.data;
//						console.log(data);
					for(var i=0; i<data.length; i++){
						var obj = new Object();
						
						obj.fileType = data[i].fileType;
						obj.fileSeq = data[i].fileSeq;
						
						obj.itemCd = callItemCd;	//신규 값
						obj.itemCdTo = itemCd;		//기존 불러온 값
						obj.itemRev = '00';
						obj.itemRevTo = itemRevTo;
						
						obj.fileNm = data[i].fileNm;
						obj.fileContent = data[i].fileContent;
						obj.fileDate = data[i].fileDate;
						obj.regNm = data[i].regNm;
						
						array2.push(obj);
// 						console.log(array2);
					}
				},
			});//사양서
			$('#my-spinner').hide();
		},300);
	    $('#motorPopUpModal').modal('hide');
	});

	// 목록
	let itemMotorPopUpTable = $('#itemMotorPopUpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		destroy : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/itemMotorList"/>',
			type : 'GET',
			data : {},
		},
		rowId : '',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{ data : 'itemCd'		},
			{ data : 'itemNm'		},
			{ data : 'itemGubunNm'	},
			{ data : 'itemSeries'	},
			{ data : 'frameSize'	},
			{ data : 'itemCapa'		},
			{ data : 'itemRev'		}
		],
		order : [ [ 0, 'asc' ] ],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
	});
	
</script>

</body>
</html>
