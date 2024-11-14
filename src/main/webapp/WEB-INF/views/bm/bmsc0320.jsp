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
	        		<h5 class="modal-title" id="equipRestartPopUpLabel">공구 일상점검 기준서 조회</h5>
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
								<col width="12%">
								<col width="20%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="20%">
							</colgroup>	
		                    <thead class="thead-light">
			                    <tr>
			                    	<th>구분</th>
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
	<!-- 공구 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel">부대공구 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	         
	                <table id="equipPopUpTable" class="table table-bordered">
	                	<colgroup>
	                		<col width="13%">
							<col width="12%">
							<col width="19%">
							<col width="19%">
							<col width="18%">
							<col width="20%">
						</colgroup>
	                    <thead class="thead-light">
	                    <tr>
	                    	<th>지정된 공구명</th>
		                    <th>구분</th>	                          
		                    <th>공구관리번호</th>
		                    <th>공구명</th>	  
		                    <th>공구규격</th>
		                    <th>공구크기 (W*L*H)<br>단위:미터</th>
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
	<!-- 공구 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공구정보관리</li>
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
						<table id="equipCodeTable" class="table table-bordered">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="12%">
								<col width="16%">
								<col width="20%">
								<col width="17%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="vertical-align: middle;">NO</th>
									<th style="vertical-align: middle;">공구장소</th>
									<th style="vertical-align: middle;">구분</th>
									<th style="vertical-align: middle;">공구관리번호</th>
									<th style="vertical-align: middle;">공구명</th>
									<th style="vertical-align: middle;">공구규격</th>
									<th style="vertical-align: middle;">공구크기 (W*L*H)<br>단위:미터</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 44%;">
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
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="headTab2">사진</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="headTab3">관련자료</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab4" id="headTab4">점검이력사항</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab5" id="headTab5">일상점검</a>
						</li>
					</ul> 
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnEdit">수정</button>
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
										<th>*구분</th>
										<td colspan="3">
											<div class="row">
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" onclick="radioOnclick()" checked disabled> 
													<label class="custom-control-label input-label-sm" for="mg1">공구</label>
												</div>
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" onclick="radioOnclick()" disabled> 
													<label class="custom-control-label input-label-sm" for="mg2">금형</label>
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
								</table>
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>*공구장소</th>
										<td><select class="custom-select" id="prcNm" style="min-width : 100%"></select></td>
										<th id="equipNoTh">*공구관리번호</th>
										<td><input type="text" class="form-control" id="equipNo" name="equipNo" placeholder="50자리 내외" maxlength="50"   style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>*공구명</th>
										<td><input type="text" class="form-control" id="equipNm" name="equipNm" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
										<th>*구분</th>
										<td><select class="custom-select" id="equipGubun" style="min-width : 100%" onChange="mainSemiChange();" disabled></select></td>
									</tr>
									<tr id="moldCavityTr" class="d-none">
										<th>금형위치</th>
										<td><input type="text" class="form-control" id="moldLocation" name="moldLocation" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>*Cavity</th>
										<td><input type="text" class="form-control" id="equipCavity" name="equipCavity" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th id="equipTypeTh">*공구규격</th>
										<td><input type="text" class="form-control" id="equipType" name="equipType" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>*제작사</th>
										<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" placeholder="64자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>모델명</th>
										<td><input type="text" class="form-control" id="equipModel" style="min-width : 100%" disabled></td>
										<th id="equipInitialTh">이니셜</th>
										<td><input type="text" class="form-control" id="equipInitial" name="equipInitial" placeholder="숫자,영문 포함 3자리 내외" maxlength="3" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>*제작일자</th>
										<td>
											<input class="form-control" type="date" id="mfcDate" name="mfcDate" style="min-width : 100%" disabled />
										</td>
										<th>창고</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="width: 80%;">
													<input type="hidden" class="form-control" id="locNo" name="locNo"> 
													<input type="text" class="form-control" id="locCd" name="locCd" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnLocCd" onClick="selectLocCd()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
												<div class="ml-1" style="width: 5%;">
													<button type="button" id="locCdDelete" class="btn closeBtn" onclick="$('#locNo').val(''); $('#locCd').val('');">
														<i class="mdi mdi-close"></i>
													</button>
												</div>
											</div>
										</td>
										<th class="d-none">종료일자</th>
										<td class="d-none">
											<input class="form-control" type="date" id="endDate" name="endDate" style="min-width : 100%" disabled />
										</td>
									</tr>
									<tr>
										<th>구입일자</th>
										<td>
											<input class="form-control" type="date" id="purchaseDate" name="purchaseDate" style="min-width : 100%" disabled />
										</td>
										<th>공구등급</th>
										<td><select class="custom-select" id="moldGrade" style="min-width : 100%" disabled></select></td>
									</tr>
									<tr>
										<th>구입가격</th>
										<td><input type="text" class="form-control" id="purchasePrice" style="min-width : 100%; text-align:right;" value="0" disabled></td>
										<th>공구상태</th>
										<td><select class="custom-select" id="useYn" style="min-width : 100%" onChange="useYnChange();" disabled></select></td>
									</tr>
									<tr>
										<th>구입처</th>
										<td>
											<input class="form-control" type="text" id="buyCorpNm" name="buyCorpNm" style="min-width : 100%" disabled />
										</td>
										<th>*공구크기(W*L*H)</th>
										<td><input type="text" class="form-control" id="equipWidth" style="min-width : 100%;" disabled></td>
									</tr>
									<tr>
										<th>A/S 담당자</th>
										<td><input type="text" class="form-control" id="asChargr" style="min-width : 100%;" disabled></td>
										<th>A/S 연락처</th>
										<td><input type="text" class="form-control" id="asPhoneNumber" style="min-width : 100%;" disabled></td>
									</tr>
									<tr>
										<th>*점검주기</th>
										<td><select class="custom-select" id="checkCycle" style="min-width:100%"></select></td>
										<th>*점검횟수</th>
										<td style="position: relative;">
											<input type="text" class="form-control" id="checkCount" name="checkCount" value="0" 
												style="text-align: right; padding-right: 2rem; min-width:100%;">
											<span style="display: block; position: absolute; top: 5px; right: 10px; height: 1.5rem; line-height: 1.5rem;">회</span>
										</td>
									</tr>
									<tr>
										<th>CAPA</th>
										<td>
											<input type="text" class="form-control" id="equipCapa" style="min-width : 100%" disabled>
										</td>
										<th>비고</th>
										<td>
											<input colspan="3" type="text" class="form-control" id="equipDesc" style="min-width : 100%" disabled>
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
										<th>작업자 정</th>
										<td>
											<select class="custom-select" id="workerJung" style="min-width : 100%" disabled></select>
										</td>
									</tr>
									<tr>
										<th>공구조건</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="equipCond" name="equipCond" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>상한</th>
										<td>
											<input type="text" class="form-control" id="upperAmt" name="upperAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
										<th>하한</th>
										<td>
											<input type="text" class="form-control" id="lowerAmt" name="lowerAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
								</table>
								<table class="table table-bordered d-none" id="corrDataListTable">
									<colgroup>
										<col width="21%">
		<%-- 								<col width="21%"> --%>
										<col width="11%">
										<col width="16%">
										<col width="31%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>점검일자</th>
											<th>차기 예정</th>
											<th>작성자</th>
											<th>점검 자료</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>부대공구</th>
										<td>
											<input type="text" class="form-control" id="ancEquipNm" name="ancEquipNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>제작일자</th>
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
										<th>제작사</th>
										<td>
											<input type="text" class="form-control" id="ancCorpCd" name="ancCorpCd" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>소모품</th>
										<td>
											<input type="text" class="form-control" id="expNm" name="expNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>공구규격</th>
										<td>
											<input type="text" class="form-control" id="ancEquipType" name="ancEquipType" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>구입처</th>
										<td>
											<input type="text" class="form-control" id="buyCorpNm" name="buyCorpNm" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
								</table>
							</form>
							<table class="table table-bordered d-none" id="changeHisTable">
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
											<th colspan="2" id="equipTitleTh">공구사진</th>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<td><input type="text" class="form-control" placeholder="사진1 비고" onchange="textSave(1)"
												id="imageFile1Con" name="imageFile1Con" style="min-width: 100%"></td>
											<td id="subEquip1"><input type="text" class="form-control" placeholder="사진2 비고" onchange="textSave(2)"
												id="imageFile2Con" name="imageFile2Con" style="min-width: 100%"></td>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>

											<td id="subEquip2">
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
											<td id="subEquip3">
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
										<tr class="d-none">
											<td><input type="text" class="form-control" placeholder="사진3 비고" onchange="textSave(3)"
												id="imageFile3Con" name="imageFile3Con" style="min-width: 100%"></td>
											<td><input type="text" class="form-control" placeholder="사진4 비고" onchange="textSave(4)"
												id="imageFile4Con" name="imageFile4Con" style="min-width: 100%"></td>
										</tr>
										<tr class="d-none">
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
							<form id="form8" enctype="multipart/form-data">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnCheckSave">저장</button>
									<button type="button" class="btn btn-danger float-right ml-1" id="btnCheckDel">삭제</button>
									<button type="button" class="btn btn-primary float-right ml-1" id="btnCheckAdd">추가</button>
								</div>
								<table class="table table-bordered" id="equipFtInfo">
									<colgroup>
										<col width="10%"> 
										<col width="40%">
										<col width="50%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>내용</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
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
						<!--====end====tab4 part=====-->
						<!--========tab5 part=====-->
						<div class="tab-pane fade" id="tab5">
							<div>
								<button type="button" class="btn btn-primary float-left ml-1" id="fileReferenceBtn" onclick="fileReferenceClick();">점검기준서</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnDailySave">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnDailyDel">삭제</button>								
								<button type="button" class="btn btn-warning float-right ml-1" id="btnDailyEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnDailyAdd">추가</button>
							</div>
							<form id="dailyForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="dailyAdmTable">
										<colgroup>
											<col width="10%">
											<col width="22.5%">
											<col width="22.5%">
											<col width="22.5%">
											<col width="22.5%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>점검항목</th>
												<th>점검방법</th>
												<th>SPEC</th>
												<th>입력방식</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
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
					<h5 class="modal-title" id="inLabel">공구정보관리 엑셀조회</h5>
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
								<th>공구관리번호</th>
								<th>공구명</th>
								<th>공정코드</th>
								<th>공구규격</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>공구조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>공구공구</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>소모품</th>
								<th>공구규격</th>
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
				width : "55%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
		state = !state;
	});

	let menuAuth = 'bmsc0320';
	let currentHref = "bmsc0320";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "공구정보관리"); 
	
	let sideView = 'add';
	let btnView = '';
	let selectCheck1 = '';
	let selectCheck2 = '';
	uiProc(true);
	var mainGubun = '002';
	var equipCd = null;
	var serverDate = "${serverDateTo}"
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";
	var index = 0;
	var urlData = null;
	var equipGubunVal = '';
	var prcNmVal = '';
	var mainEquipCd = ' ';
	var equipGubun = ' ';
	var popUpEquipGubun = '002';
	var editCheck = false;
	var tempCorrWillDate = serverDate;
	let equipNo = "";
	let equipNm = "";
	var repairNo;
	var afterChange;
	var beforeChange;
	let partEquipCd = '';
	let btnDailyCheck = '';
	let checkSeq = '';
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;

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
	
	var repairStatusCode = new Array(); 
	<c:forEach items="${repairStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	repairStatusCode.push(json);
	</c:forEach>
	
	var moldGradeCode = new Array();
	<c:forEach items = "${moldGrade}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	moldGradeCode.push(json);
	</c:forEach>
	
	//공구구분 - 전체
	var equipGubunCode = new Array();
	<c:forEach items = "${equipGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>
	
	//공구구분 - 주생산공구 제외
	var equipGubunCode2 = new Array();
	<c:forEach items = "${equipGubun}" var="info">
	if("${info.baseCd}" != '001'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		equipGubunCode2.push(json);
	}
	</c:forEach>
	
	var matrlUserList = new Array(); // 사용여부
	<c:forEach items="${matrlUserList}" var="info">
	var json = new Object();
	json.baseCd = "${info.userNumber}";
	json.baseNm = "${info.userNm}";
	matrlUserList.push(json);
	</c:forEach>
	
	var checkCycleCode = new Array(); //점검주기
	<c:forEach items="${checkCycle}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	checkCycleCode.push(json);
	</c:forEach>
	
	var inspInputMethodCode = new Array(); //점검주기
	<c:forEach items="${inspInputMethod}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspInputMethodCode.push(json);
	</c:forEach>
	//공통코드 처리 끝

	//선택박스 처리
	selectBoxAppend(prcNm, "prcNm", "", "");
	selectBoxAppend(assetGubun, "assetGubun", "", "");
	selectBoxAppend(useYnCode, "useYn", "", "2");
	selectBoxAppend(repairStatusCode, "repairStatus", "", "2");
	selectBoxAppend(moldGradeCode, "moldGrade", "", "2");
	selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
	selectBoxAppend(matrlUserList, "workerJung", "", "2");
	selectBoxAppend(checkCycleCode, "checkCycle", "", "2");

	$('#saveBtnModalY').on('click', function() {
		$('#headTab1').tab('show');
		uiProc(true);
		$('#btnSave').addClass('d-none');
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#btnAncAdd').attr('disabled', true);
		$('#btnAncDel').attr('disabled', true);
		$('#btnAncAllDel').attr('disabled', true);
		$('#btnPartAdd').attr('disabled', true);
		$('#btnPartDel').attr('disabled', true);
		$('#btnPartAllDel').attr('disabled', true);

		$('#ancFacTable').DataTable().ajax.reload(function(){});
		$('#partTable').DataTable().ajax.reload(function(){});
		
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		setTimeout(function() {
			ancFacTable.draw(); 
			partTable.draw(); 
		},150);
		
		$('#corrDataListTable').addClass('d-none');
	});
	
	//공구정보 목록
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
			url : '<c:url value="/bm/toolCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return mainGubun;},
				'prcNm' : function(){return prcNmVal;},
				'equipGubun' : function(){return equipGubunVal;},
				'listGubun' : function(){return '002';},
			},
		},
		columns : [ 
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{
				data : 'prcNmNm'
			}, 
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
				data : 'equipWidth'
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ 
		{
			extend : 'copy',
			title : '공구정보관리',
		}, 
		{
			extend : 'excel',
			title : '공구정보관리',
		}, 
		{
			extend : 'print',
			title : '공구정보관리',
		}, 
		],
	});

	var  html = '<div class="row">';
	html += '<label class="input-label-sm">공구장소</label>'; 
	html += '<select class="custom-select" id="prcNm2">';
	html +=	'</select>';
	html += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label>'; 
	html += '<select class="custom-select" id="equipGubun2">';
	html +=	'</select>';
    html += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html += '<a href="/bm/toolBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html += '</div>';

	$('#equipCodeTable_length').html(html);
	selectBoxAppend(prcNm, "prcNm2", "", "1");
	selectBoxAppend(equipGubunCode, "equipGubun2", "", "1");

	//공구장소, 구분 선택시
	$('#prcNm2, #equipGubun2').on('change', function() {
		prcNmVal = $('#prcNm2').val();
		equipGubunVal = $('#equipGubun2').val();
		$('#equipCodeTable').DataTable().ajax.reload(function () {});
    });
	
	//공구정보 상세정보 보기
	$('#equipCodeTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#headTab1').tab('show');
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		equipCd = equipCodeTable.row(this).data().equipCd;
		equipNo = equipCodeTable.row(this).data().equipNo;
		equipNm = equipCodeTable.row(this).data().equipNm;
		mainEquipCd = equipCodeTable.row(this).data().equipCd;
		equipGubun = equipCodeTable.row(this).data().equipGubun;
		
		uiProc(true);

		$.ajax({
			url : '<c:url value="bm/toolCodeAdmRead"/>',
			type : 'GET',
			data : {
				'equipCd' : function() {return equipCd;},
			},
			success : function(res) {
				let data = res.data;
				$('input:radio[name=mainGubun]:radio[value='+data.mainGubun+']').prop('checked',true);
				$('#equipNo').val(data.equipNo);
				$('#equipNm').val(data.equipNm);
				$('#equipInitial').val(data.equipInitial);
				$('#equipType').val(data.equipType);
				$('#moldLocation').val(data.moldLocation);
				$('#equipCavity').val(data.equipCavity);
				$('#mfcDate').val(moment(data.mfcDate).format('YYYY-MM-DD'));
				$('#endDate').val(data.endDate == null ? '' : moment(data.endDate).format('YYYY-MM-DD'));
				$('#mfcCorpCd').val(data.mfcCorpCd);
				$('#assetCd').val(data.assetCd);
				$('#equipCond').val(data.equipCond);
				$('#upperAmt').val(data.upperAmt);
				$('#lowerAmt').val(data.lowerAmt);
				$('#ancEquipNm').val(data.ancEquipNm);
				$('#ancDate').val(moment(data.ancDate).format('YYYY-MM-DD'));
				$('#ancCorpCd').val(data.ancCorpCd);
				$('#expNm').val(data.expNm);
				$('#ancEquipType').val(data.ancEquipType);
				$('#buyCorpNm').val(data.buyCorpNm);
				$('#equipCapa').val(data.equipCapa);
				$('#equipDesc').val(data.equipDesc);
				$('#equipModel').val(data.equipModel);
				$('#equipWidth').val(data.equipWidth);
				$('#locNo').val(data.locNo);
				$('#locCd').val(data.locCdNm);
				$('#purchaseDate').val(moment(data.purchaseDate).format('YYYY-MM-DD'));
				$('#purchasePrice').val(data.purchasePrice == null ? "0" : rmDecimal(data.purchasePrice));
				$('#checkCount').val(data.checkCount == null ? "0" : rmDecimal(data.checkCount));
				$('#asChargr').val(data.asChargr);
				$('#asPhoneNumber').val(data.asPhoneNumber);
				$('#imageFile1Con').val(data.imageFile1Con);
				$('#imageFile2Con').val(data.imageFile2Con);
				$('#imageFile3Con').val(data.imageFile3Con);
				$('#imageFile4Con').val(data.imageFile4Con);
				
				popUpEquipGubun = "002";
				//주생산관리냐 그 나머지냐
				if(data.equipGubun == "001") {
					$('#ancFacDiv').removeClass("d-none");
					$('#partDiv').removeClass("d-none");
					$('#ancFacTable').DataTable().ajax.reload(function(){});
					$('#partTable').DataTable().ajax.reload(function(){});
					setTimeout(function() { 
						ancFacTable.draw(); 
						partTable.draw(); 
					},150);
					
					if(data.prcNm == "002") {//주생산관리이며 사출이면
						$('#equipInitialTh').text('*이니셜');
					} else {
						$('#equipInitialTh').text('이니셜');
					}
					
				} else {
					$('#ancFacDiv').addClass("d-none");
					$('#partDiv').addClass("d-none");
					$('#equipInitialTh').text('이니셜');
					if (data.equipGubun == "003" || data.equipGubun == "005" || data.equipGubun == "002") {
						$('#ancFacDiv').removeClass("d-none");
						$('#partDiv').removeClass("d-none");
						$('#ancFacTable').DataTable().ajax.reload(function(){});
						$('#partTable').DataTable().ajax.reload(function(){});
						setTimeout(function() { 
							ancFacTable.draw(); 
							partTable.draw(); 
						},150);
						if(data.equipGubun == "002"){
							popUpEquipGubun = "006";
						}
					}
				}
				
				//선택박스 처리
				selectBoxAppend(prcNm, "prcNm", data.prcNm, "");
				selectBoxAppend(assetGubun, "assetGubun", data.assetGubun, "");
				selectBoxAppend(useYnCode, "useYn", data.useYn , "2");
				selectBoxAppend(moldGradeCode, "moldGrade", data.moldGrade , "2");
				selectBoxAppend(equipGubunCode, "equipGubun", data.equipGubun, "");
				selectBoxAppend(matrlUserList, "workerJung", data.workerJung, "2");
				selectBoxAppend(checkCycleCode, "checkCycle", data.checkCycle, "");
				
				//화면처리
				sideView = 'edit';
				$('#btnSave').addClass('d-none');
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#headTab2').removeClass('disabled');
				$('#headTab3').removeClass('disabled');
				$('#headTab4').removeClass('disabled');
				$('#headTab5').removeClass('disabled');
			}
		});

		
	});

	//기본정보 등록
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		uiProc(false);
		
		$('#btnSave').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnAncAdd').attr('disabled', false);
		$('#btnAncDel').attr('disabled', false);
		$('#btnAncAllDel').attr('disabled', false);
		$('#btnPartAdd').attr('disabled', false);
		$('#btnPartDel').attr('disabled', false);
		$('#btnPartAllDel').attr('disabled', false);
 		$('#endDate').attr('disabled', true);
		
		$('#mfcDate').val(serverDate);
 		$('#purchaseDate').val(serverDate);
		$('#ancDate').val(serverDate);

		$('#headTab2').addClass('disabled');
		$('#headTab3').addClass('disabled');
		$('#headTab4').addClass('disabled');
		$('#headTab5').addClass('disabled');
		$('#ancFacDiv').addClass("d-none");
		$('#partDiv').addClass("d-none");

		//선택박스 처리
		selectBoxAppend(prcNm, "prcNm", "", "");
		selectBoxAppend(assetGubun, "assetGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "" , "2");
		selectBoxAppend(moldGradeCode, "moldGrade", "", "2");
		selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
		selectBoxAppend(matrlUserList, "workerJung", "", "2");
		selectBoxAppend(checkCycleCode, "checkCycle", "", "2");
		
		$('#ancFacTable').DataTable().clear().draw();
		$('#partTable').DataTable().clear().draw();
		
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
		
		//점검이력 등록
		$('#corrDataListTable').DataTable().ajax.reload();
		$('#corrDataListTable').DataTable().row.add({}).draw(false);
		$('#corrDataListTable').removeClass('d-none');
		
	});

	//기본정보 수정
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);
		
		if($('#useYn').val() == "001" || $('#useYn').val() == "") {
			$('#endDate').attr("disabled", true);
		} else {
			$('#endDate').attr("disabled", false);
		}
		
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnAncAdd').attr('disabled', false);
		$('#btnAncDel').attr('disabled', false);
		$('#btnAncAllDel').attr('disabled', false);
		$('#btnPartAdd').attr('disabled', false);
		$('#btnPartDel').attr('disabled', false);
		$('#btnPartAllDel').attr('disabled', false);
		
		$('#headTab2').addClass('disabled');
		$('#headTab3').addClass('disabled');
		$('#headTab4').addClass('disabled');
		$('#headTab5').addClass('disabled');
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
		
		//점검이력 check
		var nextCorrCheck = false;
		$.ajax({
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
 				'mitCd' : function() {return equipCd;},
 				'corrGubun' : function() {return '002';},
			},
			success : function(res) {
				let data = res.data;
				
				if(data.length == 0){
					nextCorrCheck = true;
				}
			}
			
		});
		
		if(nextCorrCheck){
			$('#corrDataListTable').DataTable().ajax.reload();
			$('#corrDataListTable').DataTable().row.add({}).draw(false);
			$('#corrDataListTable').removeClass('d-none');
			editCheck = true;
		} else {
			$('#corrDataListTable').addClass('d-none');
			editCheck = false;
		}
		////
		
	});
	
	//기본정보 삭제
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/toolDataDelete"/>',
			type : 'POST',
			async : false,
			data :{
				'equipCd' : function(){return equipCd;},
				'mitCd' : function(){return equipCd;},
				'attachGubun' : 'CD',
				'attachCd' : function(){return equipCd;},
				'corrGubun' : function(){return '002';},
				'attachType' : function(){return '002';},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#equipCodeTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		$('#form').each(function(){
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		sideView = 'add';
		selectBoxAppend(prcNm, "prcNm", "", "");
		selectBoxAppend(assetGubun, "assetGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "" , "");
		selectBoxAppend(moldGradeCode, "moldGrade", "", "");
		selectBoxAppend(equipGubunCode, "equipGubun", "", "");
		
		$('#headTab2').addClass('disabled');
		$('#headTab3').addClass('disabled');
		$('#headTab4').addClass('disabled');
		$('#headTab5').addClass('disabled');
		
	});

	//기본정보 저장
	$('#btnSave').on('click', function() {
		var check = true;
		var check2 = true;
		var dataArray = new Array();
		var dataArray2 = new Array();
		
		if (!$.trim($('#equipNo').val())) {
			toastr.warning('공구관리번호를 입력해 주세요.');
			$('#equipNo').focus();
			return false;
		}
		if (!$.trim($('#equipNm').val())) {
			toastr.warning('공구명을 입력해 주세요.');
			$('#equipNm').focus();
			return false;
		}
		
		if (!$.trim($('#equipType').val())) {
			toastr.warning('공구규격을 입력해 주세요.');
			$('#equipType').focus();
			return false;
		}
		
		if (!$.trim($('#mfcCorpCd').val())) {
			toastr.warning('제작사를 입력해 주세요.');
			$('#mfcCorpCd').focus();
			return false;
		}
		
		if (!$.trim($('#equipInitial').val()) && $('#prcNm').val() == "002" && $('#equipGubun').val() == "001") {
			toastr.warning('이니셜을 입력해 주세요.');
			$('#equipInitial').focus();
			return false;
		}

		if ($('#equipInitial').val().length!=3 && $('#prcNm').val() == "002" && $('#equipGubun').val() == "001") {
			toastr.warning('이니셜을 3자리까지 입력해 주세요.');
			$('#equipInitial').focus();
			return false;
		}
		
		if (!$.trim($('#mfcDate').val())) {
			toastr.warning('제작일자를 입력해 주세요.');
			$('#mfcDate').focus();
			return false;
		}
		
		var tempPurchasePrice = $('#purchasePrice').val();
		if(tempPurchasePrice.indexOf('.') == -1){
			tempPurchasePrice = tempPurchasePrice + '.00';
		}
		
		if (tempPurchasePrice.substring(tempPurchasePrice.lastIndexOf("."), 0).replace(/,/g, '').length > 10) {
			toastr.warning('구입가격이 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
			$('#purchasePrice').val('0');
			$('#purchasePrice').focus();
			return false;
		}
		
		if ($('#equipWidth').val() == '') {
			toastr.warning('공구크기(W*L*H)를 입력해 주세요.');
			$('#equipWidth').focus();
			return false;
		}
		
		if (!$.trim($('#checkCycle').val())) {
			toastr.warning('점검주기를 선택해주세요.');
			$('#checkCycle').focus();
			return false;
		}
		
		if ($.trim($('#checkCount').val()) == '0') {
			toastr.warning('점검횟수를 입력해주세요.');
			$('#checkCount').focus();
			return false;
		}
		
		var tempcheckCount = $('#checkCount').val();
		
		if (tempcheckCount.replace(/,/g, '').length > 5) {
			toastr.warning('점검횟수가 너무 큽니다. (십 만 미만으로 입력해 주세요.)');
			$('#checkCount').val('0');
			$('#checkCount').focus();
			return false;
		}

		//부대공구 입력값 검사
		var ancFacTableCheck = false;
		var create1 = false;
		var create2 = false;

		
		if(false) {
			create1 = true;
			create2 = true;
			$('#ancFacTable tbody tr').each(function(index, item) {

				if (ancFacTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=equipAncCd]').val()=="") {
						toastr.warning('공구관리번호를 입력해 주세요.');
						$(this).find('td button[name=btnEquipAncNo]').focus();
						ancFacTableCheck = true;
						return false;
					}
					
					var rowData = new Object();
					rowData.equipCd = $(this).find('td input[name=equipAncCd]').val();
					rowData.mainEquipCd = equipCd;
					dataArray.push(rowData);
				} else {
					var rowData = new Object();
					rowData.equipCd = "x";
					rowData.mainEquipCd = equipCd;
					dataArray.push(rowData);
				}
				
			});
			
			//부속품 입력값 검사
			var partCheck = false;
			$('#partTable tbody tr').each(function(index, item) {

				if (partTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=partArticle]').val()=="") {
						toastr.warning('부속품을 입력해 주세요.');
						$(this).find('td input[name=partArticle]').focus();
						ancFacTableCheck = true;
						return false;
					}
					
					if ($(this).find('td input[name=exchangeCycle]').val()=="") {
						toastr.warning('교환주기를 입력해 주세요.');
						$(this).find('td input[name=exchangeCycle]').focus();
						ancFacTableCheck = true;
						return false;
					}
					
					var rowData = new Object();
					rowData.equipCd = equipCd;
					rowData.partArticle = $(this).find('td input[name=partArticle]').val();
					rowData.exchangeCycle = $(this).find('td input[name=exchangeCycle]').val();

					dataArray2.push(rowData);
					console.log(rowData)
				} else {
					var rowData = new Object();
					rowData.equipCd = equipCd;
					rowData.partArticle = "데이터xx";
					rowData.exchangeCycle = "데이터xx";
					dataArray2.push(rowData);
					console.log(rowData)
				}
			});
		}
		
		if(ancFacTableCheck){
			console.log("걸림 1")
			create1 = false;
			create2 = false;
			return false;
		}

		if (sideView == "add") {
			//등록시 공구관리번호 중복체크
			$.ajax({
				url : '<c:url value="bm/toolNoCheck" />',
				type : 'POST',
				async : false,
				data  : {
					'equipNo' : $('#equipNo').val(),
					'mainGubun': '001',
				},
				success  : function(res){
					if(res.result=="exist") {
						toastr.warning("같은 이름의 공구관리번호가 존재합니다.");
						$('#equipNo').focus();
						ancFacTableCheck = true;
					}
				}
			})
		} else {
			//수정시 공구관리번호를 수정했다면 중복체크
			if(equipNo != $('#equipNo').val()) {
				$.ajax({
					url : '<c:url value="bm/toolNoCheck" />',
					type : 'POST',
					async : false,
					data  : {
						'equipNo' : $('#equipNo').val(),
						'mainGubun': '001',
					},
					success  : function(res){
						if(res.result=="exist") {
							toastr.warning("같은 이름의 공구관리번호가 존재합니다.");
							$('#equipNo').focus();
							ancFacTableCheck = true;
						}
					}
				})
			}
		}

		if(ancFacTableCheck){
			console.log("걸림 2")
			create1 = false;
			create2 = false;
			return false;
		}
		
		//점검이력 필터링
		var nowCheck = false;
		var check11 = true;
		var check22 = true;
		var dataArray11 = new Array();
	
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				if ($(this).find("td input[name=corrNo]").val() != "" || $("#fileCdNm1").val() != "") {
					if ($(this).find("td input[name=corrDate]").val() == "") {
						toastr.warning('점검일자를 입력해 주세요.');
						$(this).find("td input[name=corrDate]").focus();
						check11 = false;
						nowCheck = true;
						return false;
					}
				}
				if ($(this).find("td input[name=corrDate]").val() == "") {
// 					toastr.warning('교정일자를 입력해 주세요.');
// 					$(this).find("td input[name=corrDate]").focus();
					check11 = false;
					return false;
				}
				
			});
		}
		if(nowCheck){
			return false;
		}
		////
		
		if (sideView == "add") {
			url = '<c:url value="/bm/toolCodeCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bm/toolCodeUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'mainGubun' : '002',
				'equipCd' : equipCd,
				'assetCd' : $('#assetCd').val(),
				'assetGubun' : $('#assetGubun option:selected').val(),
				'equipNo' : $('#equipNo').val(),
				'equipNm' : $('#equipNm').val(),
				'equipInitial' : $('#equipInitial').val(),
				'prcNm' : $('#prcNm').val(),
				'equipGubun' : $('#equipGubun').val(),
				'equipType' : $('#equipType').val(),
				'moldLocation' : $('#moldLocation').val(),
				'equipCavity' : $('#equipCavity').val(),
				'mfcDate' : $('#mfcDate').val().replace(/-/g,''),
				'endDate' : $('#endDate').val().replace(/-/g,''),
				'useYn' : $('#useYn option:selected').val(),
				'mfcCorpCd' : $('#mfcCorpCd').val(),
				'equipCond' : $('#equipCond').val(),
				'workerJung' : $('#workerJung').val(),
				'upperAmt' : $('#upperAmt').val(),
				'lowerAmt' : $('#lowerAmt').val(),
				'ancEquipNm' : $('#ancEquipNm').val(),
				'ancDate' : $('#ancDate').val().replace(/-/g,''),
				'ancCorpCd' : $('#ancCorpCd').val(),
				'expNm' : $('#expNm').val(),
				'ancEquipType' : $('#ancEquipType').val(),
				'buyCorpNm' : $('#buyCorpNm').val(),
				'equipCapa' : $('#equipCapa').val(),
				'equipDesc' : $('#equipDesc').val(),
				'asChargr' : $('#asChargr').val(),
				'asPhoneNumber' : $('#asPhoneNumber').val(),
				'equipModel' : $('#equipModel').val(),
				'equipWidth' : $('#equipWidth').val(),
				'purchaseDate' : $('#purchaseDate').val().replace(/-/g,''),
				'moldGrade' : $('#moldGrade').val(),
				'purchasePrice' : $('#purchasePrice').val().replace(/,/g,''),
				'locNo' : $('#locNo').val(),
				'checkCycle' : $('#checkCycle').val(),
				'checkCount'	: $('#checkCount').val().replace(/,/g, ''),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success("저장되었습니다.");
					$('#equipCodeTable').DataTable().ajax.reload();

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					$('#btnAncAdd').attr('disabled', true);
					$('#btnAncDel').attr('disabled', true);
					$('#btnAncAllDel').attr('disabled', true);
					$('#btnPartAdd').attr('disabled', true);
					$('#btnPartDel').attr('disabled', true);
					$('#btnPartAllDel').attr('disabled', true);
					
					$('#headTab2').removeClass('disabled');
					$('#headTab3').removeClass('disabled');
					$('#headTab4').removeClass('disabled');
					$('#headTab5').removeClass('disabled');

					uiProc(true);
					$('#btnEdit').attr('disabled', false);
					$('#btnSave').addClass('d-none');
				} else {
					toastr.warning(res.message);
				}
			},
		});
		
		if (create1) {
			$.ajax({
				url : '<c:url value="/bm/ancFacUpdateDelete"/>',
				type : 'POST',
				dataType : 'json',
				async : false,
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					selectCheck1 = "";
				}
			});
		}
		
		if (create2) {
			$.ajax({
				url : '<c:url value="/bm/partAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				async : false,
				data : JSON.stringify(dataArray2),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					selectCheck2 = "";
				}
			});
		}
		
		//점검일자 등록
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				
// 				check22 = true;
// 				if ($(this).find("td div[name=fileDiv]").attr('class') == 'custom-file d-none') {
// 					check22 = false;
// 				}
				
				if(check11 && check22){
// 					var formData = new FormData(document.getElementById("formFile_" + index));
					
// 					formData.append('mitCd', equipCd);
// 					formData.append('attachFn', $('#fileLabel'+index).text());
// 					formData.append('corrSeq', $(this).find("td input[name=corrSeq]").val());
// 					formData.append('corrNo', $(this).find("td input[name=corrNo]").val());
// 					formData.append('corrGubun', '002');
// 					formData.append('corrDate', $(this).find("td input[name=corrDate]").val().replace(/-/g, ''));
// 					formData.append('corrWillDate', "");
					
					$.ajax({
						url : '<c:url value="/bm/corrDataListCreate"/>',
						type : 'POST',
				        async : false,
				        data : {
							'mitCd' : equipCd,
							'corrSeq' : $("#corrSeq").val(),
							'corrGubun' : '002',
							'corrDate' : $("#corrDate").val().replace(/-/g, ''),
							'corrWillDate' : "",
							'corrNo' : $("#corrNo").val(),
							'attachFn' : $('#fileLabel').text(),
						},
// 						data : formData,
// 					    processData: false,
// 				        contentType: false,
						success : function(res) {
							let data = res.data;
							if (res.result == 'ok') {
// 								$('#btnCorrSave').addClass('d-none');
// 								$('#corrDataListTable').DataTable().ajax.reload(function(){});
// 								$('input[name=fileNm]').attr('disabled', true);
// 								$('#corrDate').attr('disabled', true);
// 								$('#corrWillDate').attr('disabled', true);
								
// 								tableIdx = null;
								
								toastr.success('교정이력이 등록되었습니다.');
							} else {
								toastr.error(res.message);
							}
						}
					});
					
				}
				
			});
		}
		
		$('#corrDataListTable tbody tr').each(function(index, item) {
			index++;
			if($("#fileCdNm"+index).val() != null && $("#fileCdNm"+index).val() != 'undefined' && $("#fileCdNm"+index).val() != ''){
				//값 있나없나 검사
				if (corrDataListTable.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				formData.append('attachGubun', 'CD');
				formData.append('attachCd', equipCd);
				formData.append('attachSeq', '');
				formData.append('attachType', '002');
				formData.append('contents', "");
				formData.append('attchPath', fileDate);
				formData.append('attachRegDate', '');
				formData.append('etc1', '0');
				
				index--;
				
				$.ajax({
					url : '<c:url value="/bm/attachCdDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
// 							toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnFileAdd').attr('disabled', false);
						$('#btnFileDel').attr('disabled', false);
// 						btnView = "";
					}
				});
			}
			
		});
		
		$('#corrDataListTable').addClass('d-none');
		$('#btnCorrSave').addClass('d-none');
		$('#corrDataListTable').DataTable().ajax.reload(function(){});
		$('input[name=fileNm]').attr('disabled', true);
		$('#corrDate').attr('disabled', true);
		$('#corrWillDate').attr('disabled', true);
		
		tableIdx = null;
		////
		
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
						//toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
			});
		} else {
			$('#changeHisTable').addClass('d-none');
		}
	});
	
	//사진 탭 클릭시
	$('#headTab2').on('click', function() {
		imgPrint();
		
		if(equipGubun == '002') {
			$('#equipTitleTh').text($('#equipGubun2 option:checked').text());
			$('#subEquip1').addClass('d-none');
			$('#subEquip2').addClass('d-none');
			$('#subEquip3').addClass('d-none');
		} else {
			$('#equipTitleTh').text($('#equipGubun2 option:checked').text());
			$('#subEquip1').removeClass('d-none');
			$('#subEquip2').removeClass('d-none');
			$('#subEquip3').removeClass('d-none');
		}

	});
	
	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/toolCodeImgRead"/>',
			data : {
				'equipCd' : equipCd
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src", "data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
				}
				if (data.imageFile1 == null) {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
				}
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src", "data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
				}
				if (data.imageFile2 == null) {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
				}
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src", "data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
				}
				if (data.imageFile3 == null) {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
				}
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src", "data:image/jpg;base64," + data.imageFile4);
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
			url : '<c:url value="/bm/toolCodeImageUpload"/>',
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

	//이미지 조회
	function imgShow() {
		$.ajax({
			url : '<c:url value="/em/toolRepairHistAdmImgRead"/>',
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
	
	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/toolCodeImageDelete"/>',
			type : 'POST',
			data : {
				'equipCd' : equipCd,
// 				'imageFile' : function(){a=null; a=$('#imgName'+number).text(); return a;},
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
	$(document).on('keyup', "#buyAmt, #purchasePrice",  function(evt) { //입력시 콤마 추가
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
		$("#assetGubun").attr("disabled", flag);
		$("#equipCond").attr("disabled", flag);
		$("#workerJung").attr("disabled", flag);
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
		$("#equipCapa").attr("disabled", flag);
		$("#equipDesc").attr("disabled", flag);
		$('#mfcDateCalendar').attr("disabled", flag);
		$('#ancDateCalendar').attr("disabled", flag);
		$('#endDateCalendar').attr("disabled", flag);
		$('#mfcDate').attr("disabled", flag);
		$('#endDate').attr("disabled", flag);
		$('#purchaseDate').attr("disabled", flag);
		$('#equipModel').attr("disabled", flag);
		$('#equipWidth').attr("disabled", flag);
		$('#equipLength').attr("disabled", flag);
		$('#equipHeight').attr("disabled", flag);
		$('#purchaseDateCalendar').attr("disabled", flag);
		$('#moldGrade').attr("disabled", flag);
		$('#purchasePrice').attr("disabled", flag);
		$('button[name=btnEquipAncNo]').attr('disabled', flag);
		$('input[name=partArticle]').attr('disabled', flag);
		$('input[name=exchangeCycle]').attr('disabled', flag);
		$('#asChargr').attr("disabled", flag);
		$('#asPhoneNumber').attr("disabled", flag);
		$('#btnLocCd').attr("disabled", flag);
		$('#locCdDelete').attr("disabled", flag);
		$("#checkCycle").attr("disabled", flag);
		$('#checkCount').attr('disabled', flag);
	}
	
	//숫자만 입력하게 처리
	$(document).on('keyup', "#checkCount", function(event){
		var preInWhsQtyData = $(this).val();	   
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if($(this).val()==""){
			$(this).val("0");
		}
		
		$(this).val(rmDecimal($(this).val().replace(/,/g,'')));

	});
	
	//숫자 및 영문만 입력하게 처리
	$(document).on('keyup',"#equipInitial", function(event){
		$(this).val($(this).val().replace(/[^A-Z0-9]/gi,""));
	});
	
	function textSave(x){
		url = '<c:url value="/bm/toolImgUpdate"/>';

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
	
	//부대공구 목록
	let ancFacTable = $('#ancFacTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		ajax : {
			url : '<c:url value="bm/toolCodeAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'mainEquipCd' : function(){return mainEquipCd;},
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
				data : 'equipCd',
				render : function(data, type, row, meta) {
					if (data != null) {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="deleteCheck1" value="'+data+'">';
						html += '<input type="hidden" class="form-control" name="equipAncCd" value="'+data+'">';
						html += '<input type="text" class="form-control" name="equipAncNo" value="'+row['equipNo']+'" disabled>';
						html += '<button type="button" name="btnEquipAncNo" class="btn btn-primary input-sub-search" onClick="equipCodeOnClick()" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					} else {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="deleteCheck1" value="">';
						html += '<input type="hidden" class="form-control" name="equipAncCd" value="">';
						html += '<input type="text" class="form-control" name="equipAncNo" value="" disabled>';
						html += '<button type="button" name="btnEquipAncNo" class="btn btn-primary input-sub-search" onClick="equipCodeOnClick()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				}
			},
			{
				data : 'equipNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="equipAncNm" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="equipAncNm" value="" style="min-width : 100%" disabled/>';
					}
				}
			}, 
		],
		order : [  ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	//부속품 목록
	let partTable = $('#partTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		ajax : {
			url : '<c:url value="bm/toolPartAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return mainEquipCd;},
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
				data : 'partArticle',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="partArticle" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="partArticle" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			}, 
			{
				data : 'exchangeCycle',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="exchangeCycle" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="exchangeCycle" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			}, 
		],
		order : [],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	function mainSemiChange() {
		popUpEquipGubun = "002";
		if($('#equipGubun').val() == "001") {
			$('#ancFacDiv').removeClass("d-none");
			$('#partDiv').removeClass("d-none");
			$('#ancFacTable').DataTable().clear().draw();
			$('#partTable').DataTable().clear().draw();
			if($('#prcNm').val() == "002") {
				$('#equipInitialTh').text('*이니셜');
			} else {
				$('#equipInitialTh').text('이니셜');
			}
		} else {
			$('#equipInitialTh').text('이니셜');
			if ($('#equipGubun').val() == "003" || $('#equipGubun').val() == "005" || $('#equipGubun').val() == "002") {
				$('#ancFacDiv').removeClass("d-none");
				$('#partDiv').removeClass("d-none");
				$('#ancFacTable').DataTable().clear().draw();
				$('#partTable').DataTable().clear().draw();
				if($('#equipGubun').val() == "002"){
					popUpEquipGubun = "006";
				}
			} else {
				$('#ancFacDiv').addClass("d-none");
				$('#partDiv').addClass("d-none");
			}
		}
	}
	
	function useYnChange() {
		if($('#useYn').val() == "001" || $('#useYn').val() == "") {
			$('#endDate').attr("disabled", true);
			$('#endDate').val("");
		} else {
			$('#endDate').attr("disabled", false);
		}
	}

	
	//공구명 팝업 시작
	var inputDataEquipCd = '';
	var equipPopUpGubun = '';
	var equipArr = ['002', '003', '004', '005', '006'];
	
   	var equipPopUpTable;
   	function equipCodeOnClick() {
   		equipPopUpGubun = '';
		if(equipPopUpTable == null || equipPopUpTable == undefined)	{
			equipPopUpTable = $('#equipPopUpTable').DataTable({
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
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/toolCodeAdmList"/>',
					type : 'GET',
					data : {
						'equipArr' : function(){return equipArr;},
						'equipGubun' : function(){return equipPopUpGubun;},
						'mainGubun' : function(){return mainGubun;},
					},
				},
				rowId : 'equipCd',
				columns : [
					{	data : "mainEquipCd",
						render : function(data, type, row, meta) {
							if(data==null) {
								return '<span name="equipCdText"></span>';
							} else {
								inputDataEquipCd = row['equipCd'];
								return '<span name="equipCdText">'+row['mainEquipNm']+'</span>';
							}
						}
					},
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
						data : 'equipWidth'
					},
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ ],
				buttons : [],
				drawCallback: function(settings) {
					
		        }, 
		    });
			
			var  html2 = '<div class="row">';
			html2 += '<label class="input-label-sm">구분</label>'; 
			html2 += '<select class="custom-select" id="equipGubun3">';
			html2 += '</select>';
			html2 += '</div>';

			$('#equipPopUpTable_length').html(html2);
			selectBoxAppend(equipGubunCode2, "equipGubun3", "", "1");
			
			$('#equipGubun3').on('change', function() {
				equipPopUpGubun = $('#equipGubun3').val();
				$('#equipPopUpTable').DataTable().ajax.reload(function () {});
		    });
			

		    $('#equipPopUpTable tbody').on('click', 'tr', function () {
		    	var data = equipPopUpTable.row( this ).data();
		    	
				//중복되는 공정코드 필터링
				var noInsert = false;
				$('#ancFacTable tbody tr').each(function(index, item) {
						if(data.equipCd==$(this).find('td input[name=equipAncCd]').val()) {
							toastr.warning("이미 지정된 부대공구입니다.");
							noInsert = true;
							return false;
						}
				});
				if(noInsert) {
					return false;
				}
				
				if($(this).find("td span[name=equipCdText]").text() != ''){
					toastr.warning("다른 공구에 지정된 부대공구입니다.");
					return false;
				}
				
		    	$('input[name=equipAncCd]').eq(tableIdx).val(data.equipCd);
		    	$('input[name=equipAncNo]').eq(tableIdx).val(data.equipNo);
		    	$('input[name=equipAncNm]').eq(tableIdx).val(data.equipNm);
                $('#equipPopUpModal').modal('hide');

			});
		}else{
			$('#equipPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#equipPopUpModal').modal('show');
   	}
   	
	//부대공구 데이터 클릭 시
	$('#ancFacTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			selectCheck1 = "";
			return false;
		} else {
			$('#ancFacTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#ancFacTable').DataTable().row(this).index();
		partEquipCd = $(this).find('input[name=equipAncCd]').val();
		selectCheck1 = "edit";
	});

	//부대관리 추가버튼
	$('#btnAncAdd').on('click', function() {
		$('#ancFacTable').DataTable().row.add({}).draw(false);
	});
	
	//부대공구 삭제버튼
	$('#btnAncDel').on('click', function() {
		if($('#ancFacTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		if (selectCheck1 != 'edit') {
			toastr.warning('삭제할 부대공구 항목을 선택해주세요.');
			return false;
		}
		$('#ancFacTable').DataTable().row('.selected').remove().draw();
		selectCheck1 = '';
	});

	//부대공구 전체 삭제 버튼
	$('#btnAncAllDel').on('click', function() {
		if($('#ancFacTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		$('#ancFacTable').DataTable().clear().draw();
		selectCheck1 = '';
	});
	
	//부속품 추가버튼
	$('#btnPartAdd').on('click', function() {
		$('#partTable').DataTable().row.add({}).draw(false);
	});
	
	var partSeq = '';
	//부속품 데이터 클릭 시
	
	$('#partTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
			//selectCheck2 = "";
			//return false;
		} else {
			$('#partTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		selectCheck2 = "edit";
	});
	
	//부대공구 삭제버튼
	$('#btnPartDel').on('click', function() {
		if($('#partTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		if (selectCheck2 != 'edit') {
			toastr.warning('삭제할 부속품을 선택해주세요.');
			return false;
		}
		$('#partTable').DataTable().row('.selected').remove().draw();
		selectCheck2 = '';
	});

	//부대공구 전체 삭제 버튼
	$('#btnPartAllDel').on('click', function() {
		if($('#partTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		$('#partTable').DataTable().clear().draw();
		selectCheck2 = '';
	});
	
	//관련자료 목록
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
				'attachCd' : function(){return equipCd;},
				'attachGubun' : function(){return 'EA';},
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
						data : 'contents',
						render : function(data, type, row) {
							if(data!=null){
			    				return '<input type="text" class="form-control" name="contents" value="'+data+'" style="min-width : 100%;" disabled>' ;	
							} else{
								return '<input type="text" class="form-control" name="contents" value="" style="min-width : 100%;">';	
							}		
						}
					}, 
					{
						data : 'attachFn',
						render : function(data, type, row, meta) {
							if (data != null) {
								var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachGubun=EA">'+data+'</a>';
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
	
	let tempView1 = 'add';
	let baseInfoSeq = '';
	
	//관련자료 데이터 클릭 시
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
	
	//관련자료 추가버튼
	$('#btnCheckAdd').on('click', function() {
		$('#equipFtInfo').DataTable().row.add({}).draw(false);
		
		if (equipFtInfo.data().count() > 0) {
			$('#btnCheckSave').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnCheckAdd').attr('disabled', true);
		$('#btnCheckDel').attr('disabled', true);
	});
	
	//관련자료 삭제버튼
	$('#btnCheckDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 관련자료를 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'EA';},
					'attachCd' : function(){return equipCd;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#equipFtInfo').DataTable().ajax.reload();
					toastr.success("관련자료가 삭제되었습니다.");
				}
			})
		} else {
			$('#equipFtInfo').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});
	
	//관련자료 탭 버튼 클릭 시
	$('#headTab3').on('click', function() {
		$('#btnCheckSave').addClass('d-none');
		$('#btnCheckAdd').attr('disabled', false);
		$('#btnCheckDel').attr('disabled', false);
		
		$('#equipFtInfo').DataTable().ajax.reload();
	});
	
	//점검이력사항 버튼 Event
	$('#headTab4').on('click', function() {
		$('#corrDataFileTable').DataTable().clear().draw();
		$('#corrDataListTabTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataListTabTable.draw();
			corrDataFileTable.draw();
			corrDataFileTable.draw();
			corrDataListTabTable.draw();
		},300);
	});
	
	// 관련자료 저장
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
						'attachGubun' : 'EA',
						'attachCd' : function(){return equipCd;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('attachSeq', attachDataSeq);
				attachRegDateValue = $('#attachDrDate' + index).val();
				formData.append('attachRegDate', attachRegDateValue);
	
				formData.append('attachCd', equipCd);
				formData.append('path', fileDate);
				formData.append('contents', $(this).find("td input[name=contents]").val());
				formData.append('attachGubun', 'EA');
				formData.append('idCheck', 'EA');
				
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
							toastr.success('관련자료가 등록되었습니다.');
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
	
	// 구역/위치 팝업 시작
	var locationPopupTable;
	function selectLocCd() {
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
								},
							},
							columns : [ 
								{
									data : 'mainGubunNm' 
								},
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
			$('#locCd').val(data.locNm);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	//점검이력사항 등록, 수정
	let corrDataListTable = $('#corrDataListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return " ";},
			},
		},
		rowId : 'mitCd',
		columns : [ 
// 			{
// 				render: function(data, type, row, meta) {		
// 					return meta.row + meta.settings._iDisplayStart + 1 ;
//     			},
//     			'className' : 'text-center'
// 			}, 
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="" name="corrDate"/>';
						html += '</div>';

						return html;
					}else{
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="'+moment(data).format('YYYY-MM-DD')+'" name="corrDate" disabled/>';
						html += '<input class="form-control" type="hidden" id="corrSeq" value="'+row['corrSeq']+'" name="corrSeq"/>';
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
						html += '<input class="form-control" type="date" id="corrWillDate" value="" name="corrWillDate"/>';
						html += '</div>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrWillDate" value="'+tempCorrWillDate+'" name="corrWillDate" disabled/>';
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
						 var html = '<input type="text" class="form-control" name="userNm4"  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name="userNumber4"  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="userNm4" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="userNumber4" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" style="width:100%"/>';
					}else{
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					if (data != null) {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					} else {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [1], visible : false},
		]
	});
	
	//점검이력사항 목록조회
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
				'corrGubun' : function() {return '002';},
			},
		},
		rowId : 'mitCd',
		columns : [
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						var html = '<input class="form-control" type="date" id="" value="'+moment(data).format('YYYY-MM-DD')+'" name="" style="min-width : 100%;" disabled/>';
						html += '<input class="form-control" type="hidden" id="" value="'+row['corrSeq']+'" name=""/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name="" style="min-width : 100%;" disabled/>';

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
						return '<input type="text" class="form-control" name="" style="width:100%" disabled/>';
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
	
	//공구정보 상세정보 보기
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
	
	//일상점검 탭 클릭
	$('#headTab5').on('click', function() {
		btnDailyCheck = '';
		$('#btnDailyAdd').attr('disabled', false);
		$('#btnDailyEdit').attr('disabled', false);
		$('#btnDailyDel').attr('disabled', false);
		$('#btnDailySave').addClass('d-none');
		
		$('#dailyAdmTable').DataTable().ajax.reload();
		setTimeout(function(){
			dailyAdmTable.draw();
			dailyAdmTable.draw();
		},175);
	});
	
	//일상점검 목록
	let dailyAdmTable = $('#dailyAdmTable').DataTable({
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
		scrollY: '60vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/toolDailyCheckList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return equipCd;},
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
				data : 'checkList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkList" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
						return '<input type="hidden" class="form-control" name="checkSeq" value="'+row['checkSeq']+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkList" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'checkMethod',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkMethod" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkMethod" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'checkSpec',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkSpec" value="'+data+'" placeholder="하한~상한 단위"  style="min-width : 100%; text-align : center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkSpec" value="" placeholder="하한~상한 단위" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml(inspInputMethodCode, "inspInputMethod", data, row, meta);
					return html;
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ]
	});
	
	//일상점검 추가버튼
	$('#btnDailyAdd').on('click', function() {
		btnDailyCheck = 'add';
		$('#btnDailyEdit').attr('disabled', true);
// 		$('#btnDailyDel').attr('disabled', true);
 		$('#btnDailySave').removeClass('d-none');
 		
		$('#dailyAdmTable').DataTable().row.add({}).draw(false);
	});
	
	//일상점검 테이블 행 클릭 시
	$('#dailyAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnDailyCheck = "";
			return false;
		} else {
			$('#dailyAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		btnDailyCheck = "edit";
		tableIdx = $('#dailyAdmTable').DataTable().row(this).index();
		checkSeq = dailyAdmTable.row(tableIdx).data().checkSeq;
		
		console.log("tableIdx => " + tableIdx + ", checkSeq => " + checkSeq);
	});
	
	//일상점검 수정버튼
	$('#btnDailyEdit').on('click', function() {
// 		if(btnDailyCheck != 'edit'){
// 			toastr.warning("수정할 항목을 선택해주세요.");
// 			return false;
// 		}
		
		$('input[name=checkList]').attr('disabled', false);
		$('input[name=checkMethod]').attr('disabled', false);
		$('input[name=checkSpec]').attr('disabled', false);
		$('select[name=inspInputMethod]').attr('disabled', false);
		$('#btnDailyAdd').attr('disabled', true);
		$('#btnDailyDel').attr('disabled', true);
 		$('#btnDailySave').removeClass('d-none');
	});
	
	//일상점검 삭제버튼
	$('#btnDailyDel').on('click', function() {
		if (btnDailyCheck != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(checkSeq != null && checkSeq != undefined){
			//일상점검 삭제
			$.ajax({
				url : '<c:url value="bm/toolDailyCheckDelete"/>',
				type : 'POST',
				data  : {
					'equipCd' : function(){return equipCd;},
					'checkSeq' : function(){return checkSeq;},
				},
				success  : function(res){
					$('#dailyAdmTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#dailyAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		btnDailyCheck = '';
		

	});

	//일상점검 저장
	$('#btnDailySave').on('click',function() {
		var check = true;
		var dataArray = new Array();

		$('#dailyAdmTable tbody tr').each(function(index, item) {

			if (dailyAdmTable.data().count() != 0) {
				//입력값 검사 - 필요하면 주석 해제하기
// 				if (!$.trim($(this).find('td input[name=checkList]').val())) {
// 					toastr.warning('점검항목을 입력해 주세요.');
// 					$(this).find('td input[name=checkList]').focus();
// 					check = false;
// 					return false;
// 				}
// 				if (!$.trim($(this).find('td input[name=checkMethod]').val())) {
// 					toastr.warning('점검방법을 입력해 주세요.');
// 					$(this).find('td input[name=checkMethod]').focus();
// 					check = false;
// 					return false;
// 				}
// 				if (!$.trim($(this).find('td input[name=checkSpec]').val())) {
// 					toastr.warning('SPEC을 입력해 주세요.');
// 					$(this).find('td input[name=checkSpec]').focus();
// 					check = false;
// 					return false;
// 				}
			} 
			
			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.checkSeq = $(this).find('td input[name=checkSeq]').val();
			rowData.mainGubun = '001';
			rowData.checkList = $(this).find('td input[name=checkList]').val();
			rowData.checkMethod = $(this).find('td input[name=checkMethod]').val();
			rowData.checkSpec = $(this).find('td input[name=checkSpec]').val();
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();

			dataArray.push(rowData);
			console.log(rowData);
		});
		
		var url = '<c:url value="/bm/toolDailyCheckCreate"/>';

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
						if (!$('#btnDailyEdit').is(':disabled')) {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						
						btnDailyCheck = "";
						
						$('#btnDailyAdd').attr('disabled', false);
						$('#btnDailyEdit').attr('disabled', false);
						$('#btnDailyDel').attr('disabled', false);
						$('#btnDailySave').addClass('d-none');
						$('#dailyAdmTable').DataTable().ajax.reload();
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});
	
	//통합자료실 모달
	var fileReferencePopUpTable;
	function fileReferenceClick() {
		if (fileReferencePopUpTable != null && fileReferencePopUpTable != 'undefined') {
			fileReferencePopUpTable.destroy();
		}
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
					'fileGubun'	:	function(){return '005';},
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
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnDailyCheck == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnDailyCheck == "add" || btnDailyCheck == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		var option;
// 		option = "<option value=''>선택</option>";
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
	
</script>
</body>
</html>
