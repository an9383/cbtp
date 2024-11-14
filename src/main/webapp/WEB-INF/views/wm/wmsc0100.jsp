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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">작업실적등록</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="col-md-2 right-list">
				<div class="card card-primary">
					<div class="card-body p-1">
						<div class="form-group row pb-3">
							<label for="staticEmail" class="col-sm-3 col-form-label p-0">작지번호</label>
							<div class="col-sm-9">
								<div class="input-sub m-0">
									<input type="text" class="form-control" id="workOrdNoScan">
									<button type="button" class="btn btn-primary input-sub-search"
										onClick="selectWorkOrd();">
										<span class="oi oi-magnifying-glass"></span>
									</button>
								</div>
							</div>
						</div>
						<div class="form-group row pb-3">
							<label for="middlePrcssList" class="col-sm-3 col-form-label p-0">중공정</label>
							<div class="col-sm-9">
								<div class="input-sub m-0">
									<select class="custom-select" id="middlePrcssList">
									</select>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<table id="minorPrcssTable" class="table table-bordered">
								<thead>
									<tr>
										<th>소공정</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 right-list p-0">
				<div class="card card-primary">
					<div class="card-body pb-0">
						<table id="workOrderDTLTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>작지번호</th>
									<th>작지일</th>
									<th>제품명</th>
									<th>투입수량</th>
									<th>작지상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="card-body pt-0" id="group1">
						<div class="row">
							<table class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text"
										class="form-control mw-100 resetVal workOrdNo" id="workOrdNo"
										disabled></td>
									<th>구분</th>
									<td><input type="hidden"
										class="form-control resetVal itemGubun" id="itemGubun"
										maxlength="25" disabled> <input type="text"
										class="form-control mw-100 resetVal itemGubunNm"
										id="itemGubunNm" disabled></td>
								</tr>
								<tr>
									<th>중공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal middlePrcssNm"
										id="middlePrcssNm" disabled> <input type="hidden"
										class="form-control resetVal middlePrcssCd" id="middlePrcssCd"
										maxlength="25" disabled></td>
									<th>소공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal minorPrcssNm"
										id="minorPrcssNm" disabled> <input type="hidden"
										class="form-control resetVal minorPrcssCd" id="minorPrcssCd"
										name="" maxlength="3" disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text"
										class="form-control mw-100 resetVal itemNm" id="itemNm"
										disabled> <input type="hidden"
										class="form-control resetVal itemCd" id="itemCd"
										maxlength="32" disabled> <input type="hidden"
										class="form-control resetVal itemRev" id="itemRev"
										maxlength="32" disabled></td>
									<th>LOT NO</th>
									<td><input type="text"
										class="form-control mw-100 resetVal lotNo" id="lotNo" disabled></td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>*설비명</th>
									<td><select
										class="custom-select mw-100 resetVal equipList" id="equipList"
										disabled></select></td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr"
												id="workChargr" disabled> <input type="text"
												class="form-control mw-100 resetVal workChargrNm"
												id="workChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>*작지일</th>
									<td><input type="date" class="resetVal ordDate"
										id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input PD"
												name="workStatus" id="rd1" value="PD" disabled> <label
												class="custom-control-label" for="rd1" style="color: green;">대기</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WI"
												name="workStatus" id="rd2" value="WI" disabled> <label
												class="custom-control-label" for="rd2" style="color: blue;">시작</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WC"
												name="workStatus" id="rd3" value="WC" disabled> <label
												class="custom-control-label" for="rd3" style="color: red;">종료</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input DT"
												name="workStatus" id="rd4" value="DT" disabled> <label
												class="custom-control-label" for="rd4" style="color: brown;">비가동</label>
										</div>
									</td>
									<td><input type="text"
										class="form-control float-left resetVal" id="deadlineQty"
										placeholder="마감수량을 입력해주세요..." disabled>
										<button type="button" class="btn btn-primary float-right ml-2"
											id="btnDeadline" disabled>마감</button></td>
								</tr>
							</table>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2"
									id="btnWorkOrdSave">저장</button>
							</div>
						</div>
						<div class="row pb-2">
							<h6>자재투입내역</h6>
						</div>
						<div class="row pb-2 pt-2 border-top border-primary">
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-3 col-form-label pt-1">바코드</label>
								<div class="col-sm-9">
									<div class="input-sub m-0">
										<input type="text" class="form-control"
											id="matrlBarcodeNoScan" disabled>
									</div>
								</div>
							</div>
						</div>
						<table id="workOrderMatrlTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>CODE</th>
									<th>ITEM</th>
									<th>단위</th>
									<th>소모량</th>
									<th>전체 소모량</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- 생산실적수집 -->
					<div class="card-body pt-0 d-none" id="group2">
						<div class="row">
							<table class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text"
										class="form-control mw-100 resetVal workOrdNo" disabled></td>
									<th>구분</th>
									<td><input type="hidden"
										class="form-control resetVal itemGubun" maxlength="25"
										disabled> <input type="text"
										class="form-control mw-100 resetVal itemGubunNm" disabled>
									</td>
								</tr>
								<tr>
									<th>중공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal middlePrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal middlePrcssCd" maxlength="25"
										disabled></td>
									<th>소공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal minorPrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal minorPrcssCd" maxlength="3"
										disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text"
										class="form-control mw-100 resetVal itemNm" disabled>
										<input type="hidden" class="form-control resetVal itemCd"
										maxlength="32" disabled> <input type="hidden"
										class="form-control resetVal itemRev" maxlength="32" disabled>
									</td>
									<th>LOT NO</th>
									<td><input type="text"
										class="form-control mw-100 resetVal lotNo" disabled></td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>*설비명</th>
									<td><select
										class="custom-select mw-100 resetVal equipList" disabled></select></td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr"
												disabled> <input type="text"
												class="form-control mw-100 resetVal workChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>*작지일</th>
									<td><input type="date" class="resetVal ordDate"
										style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input PD"
												name="workStatus4" id="rd1111" value="PD" disabled>
											<label class="custom-control-label" for="rd1111"
												style="color: green;">대기</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WI"
												name="workStatus4" id="rd2222" value="WI" disabled>
											<label class="custom-control-label" for="rd2222"
												style="color: blue;">시작</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WC"
												name="workStatus4" id="rd3333" value="WC" disabled>
											<label class="custom-control-label" for="rd3333"
												style="color: red;">종료</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input DT"
												name="workStatus4" id="rd4444" value="DT" disabled>
											<label class="custom-control-label" for="rd4444"
												style="color: brown;">비가동</label>
										</div>
									</td>
									<td><input type="text"
										class="form-control float-left resetVal"
										placeholder="마감수량을 입력해주세요..." disabled>
										<button type="button" class="btn btn-primary float-right ml-2"
											disabled>마감</button></td>
								</tr>
							</table>
						</div>
						<div class="row pb-2">
							<h6>생산실적수집</h6>
						</div>
						<div class="row pb-2 pt-2 border-top border-primary">
							<div class="row">
								<div class="table-responsive">
									<table id="" class="table table-bordered">
										<tr>
											<th>투입수량</th>
											<td><input type="text"
												class="form-control mw-100 resetVal targetQty"
												style="text-align: right" id="targetQty" disabled></td>
											<th>생산수량</th>
											<td><input type="text"
												class="form-control mw-100 resetVal outputQty"
												style="text-align: right" id="outputQty" disabled></td>
											<td
												style="border-bottom: none; border-right: none; border-top: none;">
												<button type="button"
													class="btn btn-primary float-right ml-2 d-none"
													id="qtySave">완료</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 자주검사 -->
					<div class="card-body pt-0 d-none" id="group3">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text"
										class="form-control mw-100 workOrdNo" disabled></td>
									<th>구분</th>
									<td><input type="text"
										class="form-control mw-100 itemGubunNm" disabled></td>
								</tr>
								<tr>
									<th>중공정</th>
									<td><input type="text"
										class="form-control mw-100 middlePrcssNm" disabled></td>
									<th>소공정</th>
									<td><input type="text"
										class="form-control mw-100 minorPrcssNm" disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text" class="form-control mw-100 itemNm"
										disabled></td>
									<th>LOT NO</th>
									<td><input type="text" class="form-control mw-100 lotNo"
										disabled></td>
								</tr>
							</table>
						</div>
						<div class="row pb-2">
							<div class="col">
								<button type="button" class="btn btn-warning float-right ml-2"
									id="jajuDelete">삭제</button>
								<!-- <button type="button" class="btn btn-primary float-right ml-2" id="">수정</button> -->
								<button type="button" class="btn btn-primary float-right ml-2"
									id="jajuAdd">추가</button>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table id="workOrderJajuInspectTable"
									class="table table-bordered">
									<%-- <colgroup>
			                            <col width="10%">
			                            <col width="25%">
			                            <col width="25%">
			                            <col width="25%">
			                            <col width="15%">
			                        </colgroup> --%>
									<thead>
										<tr>
											<th>번호</th>
											<th id="itemNmTh1" class=""><span id="itemNmHead1"></span></th>
											<th id="itemNmTh2" class=""><span id="itemNmHead2"></span></th>
											<th id="itemNmTh3" class=""><span id="itemNmHead3"></span></th>
											<th id="itemNmTh4" class=""><span id="itemNmHead4"></span></th>
											<th id="itemNmTh5" class=""><span id="itemNmHead5"></span></th>
											<th>비고</th>
											<th>날짜</th>
										</tr>
										</tead>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2"
									id="jajuSave">저장</button>
							</div>
						</div>
					</div>
					<!-- 불량등록 -->
					<div class="card-body pt-0 d-none" id="group4">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text"
										class="form-control mw-100 resetVal workOrdNo" disabled></td>
									<th>구분</th>
									<td><input type="hidden"
										class="form-control resetVal itemGubun" maxlength="25"
										disabled> <input type="text"
										class="form-control mw-100 resetVal itemGubunNm" disabled>
									</td>
								</tr>
								<tr>
									<th>중공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal middlePrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal middlePrcssCd" maxlength="25"
										disabled></td>
									<th>소공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal minorPrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal minorPrcssCd" maxlength="3"
										disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text"
										class="form-control mw-100 resetVal itemNm" disabled>
										<input type="hidden" class="form-control resetVal itemCd"
										maxlength="32" disabled> <input type="hidden"
										class="form-control resetVal itemRev" maxlength="32" disabled>
									</td>
									<th>LOT NO</th>
									<td><input type="text"
										class="form-control mw-100 resetVal lotNo" disabled></td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>*설비명</th>
									<td><select
										class="custom-select mw-100 resetVal equipList" disabled></select></td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr"
												disabled> <input type="text"
												class="form-control mw-100 resetVal workChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>*작지일</th>
									<td><input type="date" class="resetVal ordDate"
										style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='3'>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input PD"
												name="workStatus2" id="rd11" value="PD" disabled> <label
												class="custom-control-label" for="rd11"
												style="color: green;">대기</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WI"
												name="workStatus2" id="rd22" value="WI" disabled> <label
												class="custom-control-label" for="rd22" style="color: blue;">시작</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WC"
												name="workStatus2" id="rd33" value="WC" disabled> <label
												class="custom-control-label" for="rd33" style="color: red;">종료</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input DT"
												name="workStatus2" id="rd44" value="DT" disabled> <label
												class="custom-control-label" for="rd44"
												style="color: brown;">비가동</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row pt-2">
							<h6>불량수량입력</h6>
							<table class="table table-bordered">
								<colgroup>
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
								</colgroup>
								<tr>
									<th>투입수량</th>
									<th>생산수량</th>
									<th>양품수량</th>
									<th>불량수량</th>
									<th>기타수량</th>
									<th>출고수량</th>
									<th>재고수량</th>
								</tr>
								<tr>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty text-right"
										id="targetQty" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal outputQty text-right"
										id="outputQty" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal fairQty text-right"
										id="fairQty" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal faultyQty text-right"
										id="faultyQty" name="faultyCntNum" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal etcQty text-right"
										id="etcQty" name="faultyCntNum" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal outQty text-right"
										id="outQty" disabled></td>
									<td><input type="text"
										class="form-control mw-100 resetVal remainQty text-right"
										id="remainQty" disabled></td>
								</tr>
							</table>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2"
									id="btnInsertQty">저장</button>
							</div>
						</div>
						<div class="row pb-2 pt-3">
							<h6>자재투입내역</h6>
						</div>
						<div class="row pb-2 pt-2 border-top border-primary">
							<div class="form-group row">
								<label for="staticEmail" class="col-sm-3 col-form-label p-0">바코드</label>
								<div class="col-sm-9">
									<div class="input-sub m-0">
										<input type="text" class="form-control" id="" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="16%">
									<col width="16%">
									<col width="16%">
									<col width="16%">
									<col width="16%">
									<col width="16%">
								</colgroup>
								<thead>
									<tr>
										<th>CODE</th>
										<th>ITEM</th>
										<th>단위</th>
										<th>소모량</th>
										<th>전체 소모량</th>
										<th>불량수량</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<!-- 비가동등록 -->
					<div class="card-body pt-0 d-none" id="group5">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>작지번호</th>
									<td><input type="text"
										class="form-control mw-100 resetVal workOrdNo" disabled></td>
									<th>구분</th>
									<td><input type="hidden"
										class="form-control resetVal itemGubun" maxlength="25"
										disabled> <input type="text"
										class="form-control mw-100 resetVal itemGubunNm" disabled>
									</td>
								</tr>
								<tr>
									<th>중공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal middlePrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal middlePrcssCd" maxlength="25"
										disabled></td>
									<th>소공정</th>
									<td><input type="text"
										class="form-control mw-100 resetVal minorPrcssNm" disabled>
										<input type="hidden"
										class="form-control resetVal minorPrcssCd" maxlength="3"
										disabled></td>
								</tr>
								<tr>
									<th>품명(Type)</th>
									<td><input type="text"
										class="form-control mw-100 resetVal itemNm" disabled>
										<input type="hidden" class="form-control resetVal itemCd"
										maxlength="32" disabled> <input type="hidden"
										class="form-control resetVal itemRev" maxlength="32" disabled>
									</td>
									<th>LOT NO</th>
									<td><input type="text"
										class="form-control mw-100 resetVal lotNo" disabled></td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>*설비명</th>
									<td><select
										class="custom-select mw-100 resetVal equipList" disabled></select></td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr"
												disabled> <input type="text"
												class="form-control mw-100 resetVal workChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>*작지일</th>
									<td><input type="date" class="resetVal ordDate"
										style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='3'>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input PD"
												name="workStatus3" id="rd111" value="PD" disabled> <label
												class="custom-control-label" for="rd111"
												style="color: green;">대기</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WI"
												name="workStatus3" id="rd222" value="WI" disabled> <label
												class="custom-control-label" for="rd222"
												style="color: blue;">시작</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input WC"
												name="workStatus3" id="rd333" value="WC" disabled> <label
												class="custom-control-label" for="rd333" style="color: red;">종료</label>
										</div>
										<div class="custom-control custom-control-inline custom-radio">
											<input type="radio" class="custom-control-input DT"
												name="workStatus3" id="rd444" value="DT"> <label
												class="custom-control-label" for="rd444"
												style="color: brown;">비가동</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row pb-2 pt-3">
							<h6>비가동등록</h6>
						</div>
						<div class="row pb-2 border-top border-primary">
							<div class="col pt-2">
								<button type="button" id="noDelete"
									class="btn btn-warning float-right ml-2" id="">삭제</button>
								<!-- <button type="button" class="btn btn-primary float-right ml-2" id="">수정</button> -->
								<button type="button" id="noAdd"
									class="btn btn-primary float-right ml-2" id="">추가</button>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive">
								<table id="workOrderNonOperationTable"
									class="table table-bordered">
									<colgroup>
										<col width="16%">
										<col width="20%">
										<col width="16%">
										<col width="16%">
										<col width="6%">
										<col width="27%">
									</colgroup>
									<thead>
										<tr>
											<th>비가동구분</th>
											<th>사유</th>
											<th>시작시간</th>
											<th>종료시간</th>
											<th>비가동시간</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2"
									id="noSave">저장</button>
							</div>
						</div>
					</div>
					<!-- 제품라벨발행 -->
					<div class="card-body pt-0 d-none" id="group6">
						<h1>6</h1>
					</div>
				</div>
			</div>
			<div class="col-md-1 right-list p-1">
				<div class="card">
					<div class="card-body p-0">
						<div class="btn-group-vertical" style="width: 100%;">
							<button type="button" class="btn btn-primary btn-lg"
								id="btnGroup1">작업지시선택</button>
							<span><br></span>
							<button type="button" class="btn btn-primary btn-lg"
								id="btnGroup2">생산실적수집</button>
							<span><br></span>
							<button type="button" class="btn btn-primary btn-lg"
								id="btnGroup3">자주검사</button>
							<span><br></span>
							<button type="button" class="btn btn-warning btn-lg"
								id="btnGroup4">불량등록</button>
							<span><br></span>
							<button type="button" class="btn btn-danger btn-lg"
								id="btnGroup5">비가동등록</button>
							<span><br></span>
							<button type="button" class="btn btn-primary btn-lg"
								id="btnGroup6">제품라벨발행</button>
							<span><br></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .right-sidebar -->
</div>
<!-- /.row -->
<%@include file="../layout/bottom.jsp" %>
<script>
	// 작업지시선택 버튼 click
	$('#btnGroup1').on('click', function() {
		$('#group1').removeClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 자주검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
	});

	// 생산실적수집 버튼 click
	$('#btnGroup2').on('click', function() {
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').removeClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 자주검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
	});

	// 자주검사 버튼 click
	$('#btnGroup3').on('click', function() {
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').removeClass('d-none'); // 자주검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
	});

	// 불량등록 버튼 click
	$('#btnGroup4').on('click', function() {
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 자주검사
		$('#group4').removeClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
	});

	// 비가동등록 버튼 click
	$('#btnGroup5').on('click', function() {
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 자주검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').removeClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
	});

	// 제품라벨발행 버튼 click
	$('#btnGroup6').on('click', function() {
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 자주검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').removeClass('d-none'); //  제품라벨발행
	});
</script>

<script>

	let currentHref = "wmsc0100";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","작업실적등록"); 
	
	let saveState = 'add';
	let saveUrl = '';

	let workOrdNoVal = '';
	let workOrdSeqVal = '';
	let prcssCdVal = '';
	let ordLotNoVal = '';
	let itemCdVal = '';
	let itemNmVal = '';
	let itemRevVal = '';
	let middlePrcssCdVal = '';
	let middlePrcssNmVal = '';
	let minorPrcssCdVal = '';
	let minorPrcssNmVal = '';
	let targetQtyVal = '';
	let outputQtyVal = '';
	let fairQtyVal = '';
	let faultyQtyVal = '';
	let etcQtyVal = '';
	let outQtyVal = '';
	let remainQtyVal = '';
	let workStartTimeVal = '';
	let workEndTimeVal = '';

	//자주검사 데이터
	var minorPrcssCdValue = '';
	var workOrdNoValue = '';
	var middlePrcssCdValue = '';
	var workOrdSeqValue = '';
	let itemNmSize = 0;
	let jajuChoice= '';
	let itemNmValue = '';
	let jajuStatus = 'reset';
	//자주검사 데이터 끝
	
	let choice = ''; //비가동등록 삭제

	let loginUserNumber = '${userNumber}';
	let loginUserNm = '${userNm}';
	
	// 설비구분 목록
	var equipGubunCode=new Array();
    <c:forEach items="${equipGubun}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		equipGubunCode.push(json);
    </c:forEach>

    $('#itemNmTh1').addClass('d-none');
	$('#itemNmTh2').addClass('d-none');
	$('#itemNmTh2').addClass('d-none');
	$('#itemNmTh3').addClass('d-none');
	$('#itemNmTh4').addClass('d-none');
	$('#itemNmTh5').addClass('d-none'); 
    
    //중공정 변경 change
    $('#middlePrcssList').on('change',function() {
    	
    	prcssCdVal = $(this).val();
    	middlePrcssCdVal = $(this).val();
    	middlePrcssNmVal = $('#middlePrcssList option:selected').text();
    	
    	$('#equipList').attr('disabled',true);
		$('#ordDate').attr('disabled',true);
		$('#btnWorkChargrSel').attr('disabled',true);
		$('#deadlineQty').attr('disabled',true);
		$('#btnDeadline').attr('disabled',true);
		$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
		$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
		$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
		$('#fairQty').attr('disabled',true); // 양품수량
		$('#faultyQty').attr('disabled',true); // 불량수량
		$('#etcQty').attr('disabled',true); // 기타수량
		$('#outQty').attr('disabled',true); // 출고수량
		

		$('#deadlineQty').val(''); // 마감수량 초기화
		$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화

		$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
		$('#workOrderJajuInspectTable').DataTable().clear().draw(); //자주검사 테이블 초기화
		jajuStatus='reset';											//자주검사 테이블 헤드의 관리항목 삭제
		
		$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화

    	$('#minorPrcssTable').DataTable().ajax.reload( function () {});
    	$('#workOrderDTLTable').DataTable().clear().draw(); // 공정별 작지목록 초기화
    	$('.resetVal').val('');
    	
    	$('input[name="workStatus"]').each(function() { // 작업지시선택 - 상태
		    $(this).prop('checked', false);
		});
		$('input[name="workStatus2"]').each(function() { // 불량등록 - 상태
    	    $(this).prop('checked', false);
    	});
    	$('input[name="workStatus3"]').each(function() { // 비가동등록 - 상태
    	    $(this).prop('checked', false);
    	});
    })


    
 	// 소공정 목록 테이블
	let minorPrcssTable = $('#minorPrcssTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-9 pr-0'l><'col-sm-12 col-md-3'f>>" +
				"<'row'<'col-sm-12 p-0'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		searching: false,
	    language: lang_kor,
	    paging: false,
	    info: false,
	    ordering: false,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
	    pageLength: 10,
	    select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax : {
			url : '<c:url value="bm/prcssCodeMidDtlList"/>',
			type : 'GET',
			data : {
 				'prcssCd' :  function() { return prcssCdVal; }
			},
		},
		rowId : 'prcssSeq',
		columns : [ 
			{ data : 'prcssNm' },
	    ],
	    columnDefs: [
		    { targets: [0], className: 'text-center-td' }
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ],
	    drawCallback: function() {
		    $('#minorPrcssTable_wrapper').css('min-width','100%');
		}
	});



	// 공정별 작지 목록 테이블
	let workOrderDTLTable = $('#workOrderDTLTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
				"<'row'<'col-sm-12 p-0'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
	    language: lang_kor,
	    paging: false,
	    info: false,
	    searching: false,
	    ordering: false,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
	    pageLength: 10,
	    select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax : {
			url : '<c:url value="po/prcssToWorkOrdNoList"/>',
			type : 'POST',
			data : {
 				'workOrdNo' :  function() { return workOrdNoVal; },
 				'itemCd' :  function() { return itemCdVal; },
 				'itemNm' :  function() { return itemNmVal; },
 				'middlePrcssCd' :  function() { return middlePrcssCdVal; },
 				'minorPrcssCd' :  function() { return minorPrcssCdVal; }
			},
		},
		rowId : 'workOrdSeq',
		columns : [ 
			{ data : 'workOrdNo' },
			{ data : 'ordDate',
	    		render : function(data, type, row, meta) {
		    		if(data == '' || data == null) {
			    		return '';
			    	} else {
			    		return moment(data).format('YYYY-MM-DD');
				    }
		    	}
	    	},
			{ data : 'itemNm' },
			{ data : 'targetQty' },
			{ data : 'workStatus',
	    		render : function(data, type, row, meta) {
		    		if(data == 'PD') { return '<div style="color:green;">대기</div>'; }
		    		else if(data == 'WI') { return '<div style="color:blue;">시작</div>'; }
		    		else if(data == 'WC') { return '<div style="color:red;">종료</div>'; }
		    		else if(data == 'DT') { return '<div style="color:bworn;">비가동</div>'; }
		    		else { return '<div style="color:black;">미결</div>'; }
		    	}
	    	}
	    ],
	    columnDefs: [
		    { targets: [0,1,2,3,4], className: 'text-center-td' },
		    { targets: [3], render: $.fn.dataTable.render.number( ',' ) }
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ]
	});


/* 
	// 작업지시 공정별 자재투입 목록
	let workOrderMatrlTable = $('#workOrderMatrlTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
				"<'row'<'col-sm-12 p-0'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
	    language: lang_kor,
	    paging: false,
	    info: false,
	    searching: false,
	    ordering: false,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
	    pageLength: 5,
	    select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax : {
			url : '<c:url value="po/workOrdMatrlListAll"/>',
			type : 'POST',
			data : {
 				'workOrdNo' :  function() { return workOrdNoVal; },
 				'middlePrcssCd' :  function() { return middlePrcssCdVal; },
 				'minorPrcssCd' :  function() { return minorPrcssCdVal; }
			},
		},
		rowId : 'workOrdSeq',
		columns : [ 
			{ data : 'partCd' },
			{ data : 'partNm' },
			{ data : 'partUnit' },
			{ data : 'partConsumpt' },
			{ data : 'totalConsumpt' }
	    ],
	    columnDefs: [
		    { targets: [0,1,2,3,4], className: 'text-center-td' },
		    { targets: [3,4], render: $.fn.dataTable.render.number( ',' ) }
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ],
	    drawCallback: function() {
		    $('#workOrderMatrlTable_wrapper').css('min-width','100%');
		}
	}); */

	//자주검사 테이블 초기화
	let workOrderJajuInspectTable = $('#workOrderJajuInspectTable').DataTable({
		language: lang_kor,
	    destroy : true,
	    paging: false,
	    info: false,
	    searching: false,
	    ordering: false,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
	      //ordering: false,      
	      ajax : {
	    	  url: '<c:url value="/po/workOrderJajuInspectReset"/>',
	         type : 'GET',
	         data : {},
	      },
	      rowId : 'soNsb',
	      columns : [ 
	    	  {
		    		render : function(data, type, row, meta) {
						return meta.row+1;
					}
			    },
			  { data : 'itemNm'      },
			  { data : 'itemCont'    },
			  { data : 'itemCont' 	 },
			  { data : 'jajuRegDate' },
			  { data : 'jajuRegDate' },
			  { data : 'jajuRegDate' },
			  { data : 'jajuRegDate' },
	      ],         
	       order: [
	          [ 0, 'asc' ]
	       ],
	       columnDefs: [
	           {"className": "text-center", "targets": "_all"},
	        ],
	        /* drawCallback: function() {
	        	$('#itemNmTh1').addClass('d-none');
	      		$('#itemNmTh2').addClass('d-none');
	      		$('#itemNmTh3').addClass('d-none');
	      		$('#itemNmTh4').addClass('d-none');
	      		$('#itemNmTh5').addClass('d-none');

	      		$('#itemNmHead1').text('');
	      		$('#itemNmHead2').text('');
	      		$('#itemNmHead3').text('');
	      		$('#itemNmHead4').text('');
	      		$('#itemNmHead5').text('');
			} */
	        
	   });  

	//작지 상태 상관 없이 데이터 표시 및 수정 가능
	let workOrderNonOperationTable = $('#workOrderNonOperationTable').DataTable({
	    language: lang_kor,
	    destroy : true,
	    paging: false,
	    info: false,
	    searching: false,
	    ordering: false,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
        ajax: {
	        url: '<c:url value="/po/workOrderNonOperationRead"/>',
	        type: 'GET',
	        data: {
	        	'workOrdNo'		:	function() { return workOrdNoVal;},
	        	'workOrdSeq'	:	function() { return workOrdSeqVal;},
	        	'minorPrcssCd'	:	function() { return minorPrcssCdVal;},
	        	'middlePrcssCd'	:	function() { return middlePrcssCdVal;},
	        },
	    },
	    columns: [
		    { data: 'noGubun',
		    	render : function(data, type, row, meta) {
		    		var resultHtml='';
	           		if(data!=null) {
		           		resultHtml += '<input type="text" class="form-control" value="'+data+'" name="noGubun" style="border:0px;max-width:100%" >';
		           	} else {
			           	resultHtml += '<input type="text" class="form-control" value="" name="noGubun" style="border:0px;max-width:100%" >';
			        }
	           		return resultHtml;
              	} 
	        },
	        { data: 'noReason',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
		           		resultHtml += '	<input type="text" name="noReason" class="form-control" value="'+data+'" style="border:none; max-width:100%">';
		           	} else {
			           	resultHtml += '	<input type="text" name="noReason" class="form-control" style="border:none; max-width:100%">';
			        }
	           		return resultHtml;
           		}
	        },
	        { data: 'noStartTime',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '<input type="time" class="form-control" name="noStartTime" value="' + moment(data,"HH:mm").format("HH:mm") + '">';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noStartTime">';
			        }
	           		return resultHtml;
           		}
	        },
	        {data : 'noEndTime',
				render: function(data, type, row, meta) {		
					var resultHtml='';
					if(data!=null) {
	           			resultHtml += '<input type="time" class="form-control" name="noEndTime" value="' + moment(data,"HH:mm").format("HH:mm") + '">';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noEndTime">';
			        }
	           		return resultHtml;	
				}
			},
			{data : 'noTime',
				render: function(data, type, row, meta) {	
					return '<div class="noTime">'+data+'분</div>';
					
				}
			},
			{data : 'noDesc',
				render: function(data, type, row, meta) {		
					var resultHtml='';
					if(data!=null) {
						resultHtml += '	<input type="text" name="noDesc" class="form-control" value="'+data+'" style="border:none; max-width:100%">';
		           	} else {
		           		resultHtml += '	<input type="text" name="noDesc" class="form-control" value="" style="border:none; max-width:100%">';
			        }
	           		return resultHtml;	
				}
			},
	    ],
	    columnDefs: [
		    { targets: [4], className: 'text-center-td' }
	    ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ]
	});

	// 자재투입내역
	let workOrderMatrlTable = $('#workOrderMatrlTable').DataTable({
		language : lang_kor,
		paging : true,
		searching:false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 5,
		ajax : {
			url : '<c:url value="bm/workOrderMatrlRead"/>',
			type : 'GET',
			data : {
				'itemCd' : function(){return itemCdVal;},
				'itemRev' : function(){return itemRevVal;},
				'prcssCd' : function(){return minorPrcssCdVal;}
			},
		},
		rowId : '',
		columns : [ 
			{data : 'partCd'},
			{data : 'partNm'},
			//{data : 'partRev'}, 
			//{data : 'partSpec'},
			{data : 'partUnitNm'},
			{data : 'partConsumpt'},
			{data : 'partConsumpt',
				render : function(data, type, row, meta) {
					return data*targetQtyVal;
				}
			},
			
		],
		order : [ [ 0, 'asc' ] ],
		columnDefs: [
	        { className: "text-center", targets:'_all' },					       
	    ]
	});

	//작지번호 스캔
	$('#workOrdNoScan').keypress(function (e) {
		if (e.which == 13) {
			if($('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null) {
				toastr.warning("작지번호를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#workOrdNoScan').select();
				return false;
			}
			if($('#workOrdNoScan').val().length != 12) {
				toastr.warning("잘못된 작지번호입니다.");
				$('#workOrdNoScan').select();
				return false;
			}

			$.ajax({
    			url: '<c:url value="/po/workOrdNoScan"/>',
                type: 'POST',
                data: {
                    'workOrdNo'	:	$('#workOrdNoScan').val()
                },
                success: function (res) {
                    var data = res.data;
                    if(res.result == 'ok') {
                    	toastr.success('작지번호스캔에 성공했습니다.');
                    	
                    	$('#minorPrcssTable').DataTable().clear().draw(); // 소공정목록
        				$('#workOrderDTLTable').DataTable().clear().draw();// 공정별 작지목록
                    	
                    	workOrdNoVal = data.workOrdNo;
        		    	itemCdVal = data.itemCd;
        		    	itemNmVal = data.itemNm;
        		    	
        				$.ajax({
        					url : '<c:url value="po/workOrderMiddlePrcssList"/>',
        					type : 'GET',
        					data : {					     
        			            'menuAuth'  : 'posc0010',
        			            'workOrdNo' :  data.workOrdNo
        					},				
        					success : function(res) {
        						let data = res.data;
        						if (res.result == 'ok') {
        							var data2 = res.data;
        							var prcssMiddleCode=new Array();
        						
        						 	$.each(data2, function(index, item){
        							 	var jsonMiddleCode=new Object();
        								jsonMiddleCode.baseCd= item.prcssCd;
        								jsonMiddleCode.baseNm= item.prcssNm;
        								prcssMiddleCode.push(jsonMiddleCode);
        							});

        							selectBoxAppend(prcssMiddleCode, 'middlePrcssList', '', '2');
        							
        						} else {
        							toastr.error(res.message);
        						}
        					},				
        				});
        				prcssCdVal = '';
    			    	middlePrcssCdVal = '';
    			    	middlePrcssNmVal = '';
    			    	
        				$('#equipList').attr('disabled',true);
        				$('#ordDate').attr('disabled',true);
        				$('#btnWorkChargrSel').attr('disabled',true);
        				$('#deadlineQty').attr('disabled',true);
        				$('#btnDeadline').attr('disabled',true);
        				$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
        				$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
        				$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
        				$('#fairQty').attr('disabled',true); // 양품수량
        				$('#faultyQty').attr('disabled',true); // 불량수량
        				$('#etcQty').attr('disabled',true); // 기타수량
        				$('#outQty').attr('disabled',true); // 출고수량
        				

        				$('#deadlineQty').val(''); // 마감수량 초기화
        				$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화

        				$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
        				$('#workOrderJajuInspectTable').DataTable().clear().draw(); //자주검사 테이블 초기화
        				jajuStatus='reset';					        				//자주검사 테이블 헤드의 관리항목 삭제

        				$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
        				
        		    	
        		    	$('#minorPrcssTable').DataTable().ajax.reload( function () {});
        		    	$('#workOrderDTLTable').DataTable().clear().draw(); // 공정별 작지목록 초기화
        		    	$('.resetVal').val('');
        		    	
        		    	$('input[name="workStatus"]').each(function() { // 작업지시선택 - 상태
        				    $(this).prop('checked', false);
        				});
        				$('input[name="workStatus2"]').each(function() { // 불량등록 - 상태
        		    	    $(this).prop('checked', false);
        		    	});
        		    	$('input[name="workStatus3"]').each(function() { // 비가동등록 - 상태
        		    	    $(this).prop('checked', false);
        		    	});
                    } else if(res.result == 'fail') {
                    	toastr.warning(res.message);
                    } else {
                    	toastr.error(res.message);
                    }
                }
    		});

			
		}
	});



	//소공정 공정 click
	$('#minorPrcssTable tbody').on('click','tr',function() {
		minorPrcssCdVal = minorPrcssTable.row(this).data().lowerPrcssCd;
		minorPrcssNmVal = minorPrcssTable.row(this).data().prcssNm;

		$('#equipList').attr('disabled',true);
		$('#ordDate').attr('disabled',true);
		$('#btnWorkChargrSel').attr('disabled',true);
		$('#deadlineQty').attr('disabled',true);
		$('#btnDeadline').attr('disabled',true);
		$('input[name=workStatus]').attr('disabled',true); // 상태
		$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
		$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
		$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
		$('#fairQty').attr('disabled',true); // 양품수량
		$('#faultyQty').attr('disabled',true); // 불량수량
		$('#etcQty').attr('disabled',true); // 기타수량
		$('#outQty').attr('disabled',true); // 출고수량
		
		$('input[name="workStatus"]').each(function() { // 작업지시선택 - 상태
		    $(this).prop('checked', false);
		});
		$('input[name="workStatus2"]').each(function() { // 불량등록 - 상태
    	    $(this).prop('checked', false);
    	});
    	$('input[name="workStatus3"]').each(function() { // 비가동등록 - 상태
    	    $(this).prop('checked', false);
    	});
		$('#deadlineQty').val(''); // 마감수량 초기화
		$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화
		$('.resetVal').val('');

		$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
		$('#workOrderJajuInspectTable').DataTable().clear().draw(); //자주검사 테이블 초기화
		jajuStatus='reset';											//자주검사 테이블 헤드의 관리항목 삭제
		$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
		$('#workOrderDTLTable').DataTable().ajax.reload( function () {}); // 공정별 작지목록
	});



	// 소공정 공정별 설비목록조회
	function prcssToEquip(obj, id, sVal) {
		$('.'+ id).empty();

		//공정에 배정된 설비가 없을 경우
		if(obj.equipCd1 == '' && obj.equipCd2 == '' && obj.equipCd3 == '' && obj.equipCd4 == '' && obj.equipCd5 == '') {
			$('.'+ id).append($("<option value=''>"+"미배정"+"</option>"));
		} else {
			$('.'+ id).append($("<option value=''>"+"선택"+"</option>"));
		}
		
	   	if(obj.equipCd1!='') {
	   		$('.'+ id).append($("<option value="+ obj.equipCd1 +">"+obj.equipNm1+"</option>"));
		}
	   	if(obj.equipCd2!='') {
	   		$('.'+ id).append($("<option value="+ obj.equipCd2 +">"+obj.equipNm2+"</option>"));
		}
	   	if(obj.equipCd3!='') {
	   		$('.'+ id).append($("<option value="+ obj.equipCd3 +">"+obj.equipNm3+"</option>"));
		}
	   	if(obj.equipCd4!='') {
	   		$('.'+ id).append($("<option value="+ obj.equipCd4 +">"+obj.equipNm4+"</option>"));
		}
	   	if(obj.equipCd5!='') {
	   		$('.'+ id).append($("<option value="+ obj.equipCd5 +">"+obj.equipNm5+"</option>"));
		}

		//처음 등록하는 작지일 경우
	   	if(sVal == '') {
	   		$('.'+id+' option:eq(0)').attr('selected','selected');
		} else {
			if(sVal == obj.equipCd1) {
				$('.'+id).val(obj.equipCd1);
			} else if(sVal == obj.equipCd2) {
				$('.'+id).val(obj.equipCd2);
			} else if(sVal == obj.equipCd3) {
				$('.'+id).val(obj.equipCd3);
			} else if(sVal == obj.equipCd4) {
				$('.'+id).val(obj.equipCd4);
			} else if(sVal == obj.equipCd5) {
				$('.'+id).val(obj.equipCd5);
			}
		}
	}



	//작업지시 상세조회
	$('#workOrderDTLTable tbody').on('click','tr',function() {

		$('#btnWorkOrdSave').attr('disabled',false); // 작지저장 버튼
		if(workOrderDTLTable.data().count() != 0) { // 테이블이 비어있지 않을 경우에만 활성화
			$('#matrlBarcodeNoScan').attr('disabled',false); // 자재바코드입력
		}
		
		$('#deadlineQty').val(''); // 마감수량 초기화
		$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화
		
		
		if(workOrderDTLTable.row(this).data().workStatus == '') { // 미결상태일 경우
			saveState = 'add';
			$('.workOrdNo').val(workOrdNoVal);
			$('.middlePrcssCd').val(middlePrcssCdVal);
			$('.middlePrcssNm').val(middlePrcssNmVal);
			$('.minorPrcssCd').val(minorPrcssCdVal);
			$('.minorPrcssNm').val(minorPrcssNmVal);
			$('.itemCd').val(workOrderDTLTable.row(this).data().itemCd);
			$('.itemRev').val(workOrderDTLTable.row(this).data().itemRev);
			$('.itemNm').val(workOrderDTLTable.row(this).data().itemNm);
			$('.itemGubun').val(workOrderDTLTable.row(this).data().itemGubun);
			$('.itemGubunNm').val(workOrderDTLTable.row(this).data().itemGubunNm);
			$('.targetQty').val(addCommas(workOrderDTLTable.row(this).data().targetQty.replace(/[^0-9]/g,'')));
			$('.workChargr').val(loginUserNumber);
			$('.workChargrNm').val(loginUserNm);
			$('.ordDate').val(moment().format('YYYY-MM-DD'));
			$('.PD').prop('checked', true);

			
			workOrdSeqVal = workOrderDTLTable.row(this).data().workOrdSeq;
			ordLotNoVal = workOrderDTLTable.row(this).data().ordLotNo;
			itemCdVal = workOrderDTLTable.row(this).data().itemCd;
			itemRevVal = workOrderDTLTable.row(this).data().itemRev;
			itemNmVal = workOrderDTLTable.row(this).data().itemNm;
			itemGubunVal = workOrderDTLTable.row(this).data().itemGubun;
			itemGubunNmVal = workOrderDTLTable.row(this).data().itemGubunNm;
			targetQtyVal = workOrderDTLTable.row(this).data().targetQty;
			outputQtyVal = 0;
			fairQtyVal = 0;
			faultyQtyVal = 0;
			etcQtyVal = 0;
			outQtyVal = 0;
			remainQtyVal = 0;
			workStartTimeVal = workOrderDTLTable.row(this).data().workStartTime;
			workEndTimeVal = workOrderDTLTable.row(this).data().workEndTime;

			$('#equipList').attr('disabled',false);
			$('#ordDate').attr('disabled',false);
			$('#btnWorkChargrSel').attr('disabled',false);
			$('#rd2').attr('disabled',true); // 시작
			$('#rd3').attr('disabled',true); // 종료
			$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
			$('#fairQty').attr('disabled',true); // 양품수량
			$('#faultyQty').attr('disabled',true); // 불량수량
			$('#etcQty').attr('disabled',true); // 기타수량
			$('#outQty').attr('disabled',true); // 출고수량

			// 설비명 가져오기
			$.ajax({
    			url: '<c:url value="/po/prcssToEquipList"/>',
                type: 'POST',
                data: {
                    'lowerPrcssCd'	:	function() { return minorPrcssCdVal; }
                },
                success: function (res) {
                    var data = res.data;
                    if(res.result == 'ok') {
                    	prcssToEquip(data,'equipList', '');
                    } else {
                    	toastr.error(res.message);
                    }
                }
    		});
			workOrderJajuInspectTable = $('#workOrderJajuInspectTable').DataTable({
				language: lang_kor,
				destroy : true,
				paging: false,
				info: false,
				searching: false,
				ordering: false,
				processing: false,
				autoWidth: false,
				lengthChange: false,
				//ordering: false,      
				ajax : {
					url: '<c:url value="/po/workOrderJajuInspectReset"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'soNsb',
				columns : [ 
					{
						render : function(data, type, row, meta) {
						return meta.row+1;
						}
					},
					{ data : 'itemNm'      },
					{ data : 'itemCont'    },
					{ data : 'itemCont' 	 },
					{ data : 'jajuRegDate' },
					{ data : 'jajuRegDate' },
					{ data : 'jajuRegDate' },
					{ data : 'jajuRegDate' },
				],         
				order: [
				[ 0, 'asc' ]
				],
				columnDefs: [
				{"className": "text-center", "targets": "_all"},
				],
				drawCallback: function() {
		        	$('#itemNmTh1').addClass('d-none');
		      		$('#itemNmTh2').addClass('d-none');
		      		$('#itemNmTh3').addClass('d-none');
		      		$('#itemNmTh4').addClass('d-none');
		      		$('#itemNmTh5').addClass('d-none');

		      		$('#itemNmHead1').text('');
		      		$('#itemNmHead2').text('');
		      		$('#itemNmHead3').text('');
		      		$('#itemNmHead4').text('');
		      		$('#itemNmHead5').text('');
				}
			});  
			$('#workOrderNonOperationTable').DataTable().ajax.reload( function () {});
			$('#workOrderMatrlTable').DataTable().ajax.reload( function () {});

			$('#workOrderJajuInspectTable').DataTable().clear().draw(); //자주검사 테이블 초기화
			//자주검사 테이블 헤드의 관리항목 삭제
			$('#itemNmTh1').addClass('d-none');
			$('#itemNmTh2').addClass('d-none');
			$('#itemNmTh3').addClass('d-none');
			$('#itemNmTh4').addClass('d-none');
			$('#itemNmTh5').addClass('d-none');

			$('#itemNmHead1').text('');
			$('#itemNmHead2').text('');
			$('#itemNmHead3').text('');
			$('#itemNmHead4').text('');
			$('#itemNmHead5').text('');
			
			//미결상태일 때 생산실적수집 저장 못하게
			$('#qtySave').addClass('d-none');
			$('#outputQty').attr('disabled', true);
		} else { // 미결상태가 아닐 경우
			jajuStatus = 'read';
			$('#qtySave').removeClass('d-none');
			$('#outputQty').attr('disabled', false);
			saveState = 'edit';
			$('.workOrdNo').val(workOrdNoVal);
			$('.middlePrcssCd').val(workOrderDTLTable.row(this).data().middlePrcssCd);
			$('.middlePrcssNm').val(workOrderDTLTable.row(this).data().middlePrcssNm);
			$('.minorPrcssCd').val(workOrderDTLTable.row(this).data().minorPrcssCd);
			$('.minorPrcssNm').val(workOrderDTLTable.row(this).data().minorPrcssNm);
			$('.itemCd').val(workOrderDTLTable.row(this).data().itemCd);
			$('.itemRev').val(workOrderDTLTable.row(this).data().itemRev);
			$('.itemNm').val(workOrderDTLTable.row(this).data().itemNm);
			$('.itemGubun').val(workOrderDTLTable.row(this).data().itemGubun);
			$('.itemGubunNm').val(workOrderDTLTable.row(this).data().itemGubunNm);
			$('.targetQty').val(addCommas(workOrderDTLTable.row(this).data().targetQty.replace(/[^0-9]/g,'')));
			$('.outputQty').val(addCommas(workOrderDTLTable.row(this).data().outputQty.replace(/[^0-9]/g,'')));
			$('.fairQty').val(addCommas(workOrderDTLTable.row(this).data().fairQty.replace(/[^0-9]/g,'')));
			$('.faultyQty').val(addCommas(workOrderDTLTable.row(this).data().faultyQty.replace(/[^0-9]/g,'')));
			$('.etcQty').val(addCommas(workOrderDTLTable.row(this).data().etcQty.replace(/[^0-9]/g,'')));
			$('.outQty').val(addCommas(workOrderDTLTable.row(this).data().outQty.replace(/[^0-9]/g,'')));
			$('.remainQty').val(addCommas(workOrderDTLTable.row(this).data().remainQty.replace(/[^0-9]/g,'')));
			$('.workChargr').val(workOrderDTLTable.row(this).data().workChargr);
			$('.workChargrNm').val(workOrderDTLTable.row(this).data().workChargrNm);
			$('.ordDate').val(moment(workOrderDTLTable.row(this).data().ordDate).format('YYYY-MM-DD'));
			$('.'+workOrderDTLTable.row(this).data().workStatus).prop('checked', true);

			workOrdSeqVal = workOrderDTLTable.row(this).data().workOrdSeq;
			ordLotNoVal = workOrderDTLTable.row(this).data().ordLotNo;
			itemCdVal = workOrderDTLTable.row(this).data().itemCd;
			itemRevVal = workOrderDTLTable.row(this).data().itemRev;
			itemNmVal = workOrderDTLTable.row(this).data().itemNm;
			itemGubunVal = workOrderDTLTable.row(this).data().itemGubun;
			itemGubunNmVal = workOrderDTLTable.row(this).data().itemGubunNm;
			targetQtyVal = workOrderDTLTable.row(this).data().targetQty;
			outputQtyVal = workOrderDTLTable.row(this).data().outputQty;
			fairQtyVal = workOrderDTLTable.row(this).data().fairQty;
			faultyQtyVal = workOrderDTLTable.row(this).data().faultyQty;
			etcQtyVal = workOrderDTLTable.row(this).data().etcQty;
			outQtyVal = workOrderDTLTable.row(this).data().outQty;
			remainQtyVal = workOrderDTLTable.row(this).data().remainQty;
			workStartTimeVal = workOrderDTLTable.row(this).data().workStartTime;
			workEndTimeVal = workOrderDTLTable.row(this).data().workEndTime;

			$('#equipList').attr('disabled',false);
			$('#ordDate').attr('disabled',false);
			$('#btnWorkChargrSel').attr('disabled',false);
			if(workOrderDTLTable.row(this).data().workStatus == 'WI') { // 시작상태일 경우에만 마감 처리 가능
				$('#deadlineQty').attr('disabled',false);
				$('#btnDeadline').attr('disabled',false);
			}
			$('#rd1').attr('disabled',false); // 대기
			$('#rd2').attr('disabled',false); // 시작
			$('#rd3').attr('disabled',false); // 종료
			$('#btnInsertQty').attr('disabled',false); // 불량수량등록 버튼
			$('#fairQty').attr('disabled',false); // 양품수량
			$('#faultyQty').attr('disabled',false); // 불량수량
			$('#etcQty').attr('disabled',false); // 기타수량
			$('#outQty').attr('disabled',false); // 출고수량

			// 설비명 가져오기
			$.ajax({
    			url: '<c:url value="/po/prcssToEquipList"/>',
                type: 'POST',
                data: {
                    'lowerPrcssCd'	:	function() { return minorPrcssCdVal; }
                },
                success: function (res) {
                    var data = res.data;
                    if(res.result == 'ok') {
                    	prcssToEquip(data,'equipList', workOrderDTLTable.row(this).data().equipCd);
                    } else {
                    	toastr.error(res.message);
                    }
                }
    		});

			//자주검사는 작지상태가 종료일 때만 등록, 수정이 가능
    		if(workOrderDTLTable.row(this).data().workStatus=='WC') {
    			minorPrcssCdValue = workOrderDTLTable.row(this).data().minorPrcssCd;
    			workOrdNoValue = workOrderDTLTable.row(this).data().workOrdNo;
    			middlePrcssCdValue = workOrderDTLTable.row(this).data().middlePrcssCd;
    			workOrdSeqValue = workOrderDTLTable.row(this).data().workOrdSeq;

        		//자주검사 테이블 불러오기
    			let workOrderJajuInspectTable = $('#workOrderJajuInspectTable').DataTable({
    			    language: lang_kor,
    			    destroy : true,
    			    paging: false,
    			    info: false,
    			    searching: false,
    			    ordering: false,
    			    processing: false,
    			    autoWidth: false,
    			    lengthChange: false,
    		        ajax: {
    			        url: '<c:url value="/po/workOrderJajuInspectRead"/>',
    			        type: 'GET',
    			        data: {
    			        	'workOrdNo'		:	workOrdNoValue,
    			        	'workOrdSeq'	:	workOrdSeqValue,
    			        	'minorPrcssCd'	:	minorPrcssCdValue,
    			        	'middlePrcssCd'	:	middlePrcssCdValue,
    			        },
    			    },
    			    columns: [
    			    	{
    			    		render : function(data, type, row, meta) {
    							return meta.row+1;
    						}
    				    },
    			        { data: 'itemCont',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    			           			sideView='edit';
    			           			var result = data.split('/');
    				           		resultHtml += '	<input type="text" name="itemCont1" class="form-control" value="'+replaceAll(result[0])+'" style="border:none; max-width:100%">';
    				           	} else {
    				           		sideView='add';
        				           	resultHtml += '	<input type="text" name="itemCont1" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        { data: 'itemCont',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    			           			var result = data.split('/');
    				           		resultHtml += '	<input type="text" name="itemCont2" class="form-control" value="'+replaceAll(result[1])+'"  style="border:none; max-width:100%">';
    			                    
    				           	} else {
        				           	resultHtml += '	<input type="text" name="itemCont2" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        { data: 'itemCont',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    			           			var result = data.split('/');
    				           		resultHtml += '	<input type="text" name="itemCont3" class="form-control" value="'+replaceAll(result[2])+'" style="border:none; max-width:100%">';
    				           	} else {
        				           	resultHtml += '	<input type="text" name="itemCont3" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        { data: 'itemCont',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    			           			var result = data.split('/');
    				           		resultHtml += '	<input type="text" name="itemCont4" class="form-control" value="'+replaceAll(result[3])+'"  style="border:none; max-width:100%">';
     				           	} else {
        				           	resultHtml += '	<input type="text" name="itemCont4" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        { data: 'itemCont',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    			           			var result = data.split('/');
    				           		resultHtml += '	<input type="text" name="itemCont5" class="form-control" value="'+replaceAll(result[4])+'" style="border:none; max-width:100%">';
    				           	} else {
        				           	resultHtml += '	<input type="text" name="itemCont5" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        { data: 'jajuDesc',
    		           		render : function(data, type, row, meta) {
    		           			var resultHtml = '';
    			           		if(data!=null) {
    				           		resultHtml += '	<input type="text" name="jajuDesc" class="form-control" value="'+data+'" style="border:none; max-width:100%">';
    				           	} else {
        				           	resultHtml += '	<input type="text" name="jajuDesc" class="form-control" style="border:none; max-width:100%">';
    					        }
    			           		return resultHtml;
    		           		}
    			        },
    			        {data : 'jajuRegDate',
    						render: function(data, type, row, meta) {		
    							var value;						
    							data == null ? value="" : value= moment(data).format("YYYY-MM-DD");			
    							var html = '<input class="form-control" style="min-width:100%;" type="date" value="'+value+'"  name="jajuRegDate"/>';			
    						    /* var html = '<div class="row">';					
    						    html += '&nbsp;<div class="form-group input-sub m-0 row" style="width:95%;">';
    						    html += '<input class="form-control" style="width:100%;" type="text" value="'+value+'" id="osrRegDate" name="osrRegDate" disabled/>';
    						    html += '<button onclick="fnPopUpCalendar(osrRegDate,osrRegDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    						    html += '<span class="oi oi-calendar"></span>';
    						    html += '</button>'; 
    						    html += '</div>'; */
    							return html;			
    						}
    					},
    			    ],
    			    columnDefs: [
    				    { targets: [0], className: 'text-center-td' }
    			    ],
    			    order: [
    			        [ 0, 'asc' ]
    			    ],
    			    buttons: [
    			    ],
    			    drawCallback: function() {
        			    
    			    	var table = this.api();
    			    	// 자주검사 관리항목 목록 가져오기
    	    			$.ajax({
    	        			url: '<c:url value="/po/workOrderJajuInspectItemNmList"/>',
    	                    type: 'GET',
    	                    data: {
    	                    	'workOrdNo'		:	workOrdNoValue,
    				        	'workOrdSeq'	:	workOrdSeqValue,
    				        	'minorPrcssCd'	:	minorPrcssCdValue,
    				        	'middlePrcssCd'	:	middlePrcssCdValue,
    	                    },
    	                    success: function (res) {
    	                        var data = res.data;
    	                        if(res.result == 'ok') {
    	                        	itemNmValue = res.itemNmList;
    	                        	var itemNmList = res.itemNmList.split('/');
    	                        	console.log(itemNmList);
    	                        	console.log(itemNmList[0]);
    	                        	if(itemNmList[0]=='' || itemNmList[0] ==null || jajuStatus=='reset') {
    	                        		$('#itemNmTh1').addClass('d-none');
    	                        		$('#itemNmTh2').addClass('d-none');
    	                        		$('#itemNmTh3').addClass('d-none');
    	                        		$('#itemNmTh4').addClass('d-none');
    	                        		$('#itemNmTh5').addClass('d-none');

    	                        		$('#itemNmHead1').text('');
    	                        		$('#itemNmHead2').text('');
    	                        		$('#itemNmHead3').text('');
    	                        		$('#itemNmHead4').text('');
    	                        		$('#itemNmHead5').text('');
    	                        		table.columns( [1,2,3,4,5] ).visible( false );
    	                        		itemNmSize = 0;
    	                            } else if(itemNmList[1]=='') {
    									$('#itemNmTh1').removeClass('d-none');
    									$('#itemNmTh2').addClass('d-none');
    	                        		$('#itemNmTh3').addClass('d-none');
    	                        		$('#itemNmTh4').addClass('d-none');
    	                        		$('#itemNmTh5').addClass('d-none');

    	                        		$('#itemNmHead1').text(itemNmList[0]);
    									$('#itemNmHead2').text('');
    	                        		$('#itemNmHead3').text('');
    	                        		$('#itemNmHead4').text('');
    	                        		$('#itemNmHead5').text('');
    	                        		table.columns( [2,3,4,5] ).visible( false );
    	                        		itemNmSize = 1;
    	                            }  else if(itemNmList[2]=='') {
    	                            	$('#itemNmTh1').removeClass('d-none');
    	                            	$('#itemNmTh2').removeClass('d-none');
    	                            	$('#itemNmTh3').addClass('d-none');
    	                        		$('#itemNmTh4').addClass('d-none');
    	                        		$('#itemNmTh5').addClass('d-none');

    	                        		$('#itemNmHead1').text(itemNmList[0]);
    	                        		$('#itemNmHead2').text(itemNmList[1]);
    	                        		$('#itemNmHead3').text('');
    	                        		$('#itemNmHead4').text('');
    	                        		$('#itemNmHead5').text('');
    	                        		table.columns( [3,4,5] ).visible( false );
    	                        		itemNmSize = 2;
    	                            }  else if(itemNmList[3]=='') {
    	                            	$('#itemNmTh1').removeClass('d-none');
    	                            	$('#itemNmTh2').removeClass('d-none');
    	                            	$('#itemNmTh3').removeClass('d-none');
    	                            	$('#itemNmTh4').addClass('d-none');
    	                        		$('#itemNmTh5').addClass('d-none');
    	                        		
    	                            	$('#itemNmHead1').text(itemNmList[0]);
    	                        		$('#itemNmHead2').text(itemNmList[1]);
    	                        		$('#itemNmHead3').text(itemNmList[2]);
    	                            	$('#itemNmHead4').text('');
    	                        		$('#itemNmHead5').text('');
    	                        		table.columns( [4,5] ).visible( false );
    	                        		itemNmSize = 3;
    	                            }  else if(itemNmList[4]=='') {
    	                            	$('#itemNmTh1').removeClass('d-none');
    	                            	$('#itemNmTh2').removeClass('d-none');
    	                            	$('#itemNmTh3').removeClass('d-none');
    	                            	$('#itemNmTh4').removeClass('d-none');
    	                        		$('#itemNmTh5').addClass('d-none');
    	                        		
    	                            	$('#itemNmHead1').text(itemNmList[0]);
    	                        		$('#itemNmHead2').text(itemNmList[1]);
    	                        		$('#itemNmHead3').text(itemNmList[2]);
    	                            	$('#itemNmHead4').text(itemNmList[3]);
    	                        		$('#itemNmHead5').text('');
    	                        		table.columns( [5] ).visible( false );
    	                        		itemNmSize = 4;
    	                            } else if(itemNmList[4]!='') {
    	                            	$('#itemNmTh1').removeClass('d-none');
    	                            	$('#itemNmTh2').removeClass('d-none');
    	                            	$('#itemNmTh3').removeClass('d-none');
    	                            	$('#itemNmTh4').removeClass('d-none');
    	                        		$('#itemNmTh5').removeClass('d-none');
    	                        		
    	                            	$('#itemNmHead1').text(itemNmList[0]);
    	                        		$('#itemNmHead2').text(itemNmList[1]);
    	                        		$('#itemNmHead3').text(itemNmList[2]);
    	                            	$('#itemNmHead4').text(itemNmList[3]);
    	                        		$('#itemNmHead5').text(itemNmList[4]);
    	                        		itemNmSize = 5;
    	                            }
    	                        	console.log(itemNmSize);
    	                        } else {
    	                        	toastr.error(res.message);
    	                        }
    	                    }
    	        		});
    	        		
    				},
    			});
        	}
        	//작지상태가 종료가 아니면 초기화 
        	else {
        		$('#itemNmTh1').addClass('d-none');
        		$('#itemNmTh2').addClass('d-none');
        		$('#itemNmTh3').addClass('d-none');
        		$('#itemNmTh4').addClass('d-none');
        		$('#itemNmTh5').addClass('d-none');

        		$('#itemNmHead1').text('');
        		$('#itemNmHead2').text('');
        		$('#itemNmHead3').text('');
        		$('#itemNmHead4').text('');
        		$('#itemNmHead5').text('');
        		//workOrderJajuInspectTable
        		workOrderJajuInspectTable = $('#workOrderJajuInspectTable').DataTable({
        			language: lang_kor,
        		    destroy : true,
        		    paging: false,
        		    info: false,
        		    searching: false,
        		    ordering: false,
        		    processing: false,
        		    autoWidth: false,
        		    lengthChange: false,
        		      //ordering: false,      
        		      ajax : {
        		    	  url: '<c:url value="/po/workOrderJajuInspectReset"/>',
        		         type : 'GET',
        		         data : {},
        		      },
        		      rowId : 'soNsb',
        		      columns : [ 
        		    	  {
        			    		render : function(data, type, row, meta) {
        							return meta.row+1;
        						}
        				    },
        				    { data : 'itemNm'      },
        					{ data : 'itemCont'    },
        					{ data : 'itemCont'	   },
        					{ data : 'jajuRegDate' },
        					{ data : 'jajuRegDate' },
        					{ data : 'jajuRegDate' },
        					{ data : 'jajuRegDate' },
        		      ],         
        		       order: [
        		          [ 0, 'asc' ]
        		       ],
        		       columnDefs: [
        		           {"className": "text-center", "targets": "_all"},
        		        ],
        		   });  
            }
    		$('#workOrderNonOperationTable').DataTable().ajax.reload( function () {});
    		$('#workOrderMatrlTable').DataTable().ajax.reload( function () {});
		}
	});


	//작업지시 저장 버튼 click
	$('#btnWorkOrdSave').on('click',function() {
		if($('#equipList').val() == '') {
			if($('#equipList option:selected').text() != '미배정') {
				toastr.warning('설비명을 선택해주세요.');
				$('#equipList').focus();
				return false;
			}
		}

		if($('#ordDate').val() == '') {
			toastr.warning('작지일을 선택해주세요.');
			$('#ordDate').focus();
			return false;
		}

		if(saveState == 'add') {
			saveUrl = '/po/workOrdAdd';
		} else {
			saveUrl = '/po/workOrdEdit';
		}

		//저장 처리
		$.ajax({
			url: saveUrl,
            type: 'POST',
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'minorPrcssCd'		:	minorPrcssCdVal,
            	'middlePrcssCd'		:	middlePrcssCdVal,
            	'ordLotNo'			:	ordLotNoVal,
            	'equipCd'			:	$('#equipList').val(),
            	'itemCd'			:	itemCdVal,
            	'itemRev'			:	itemRevVal,
            	'workStartTime'		:	$('input[name="workStatus"]:checked').val()=='WI'?moment().format('YYYYMMDDHHmmss'):($('input[name="workStatus"]:checked').val()=='PD'?'':workStartTimeVal),
        	    'workEndTime'		:	$('input[name="workStatus"]:checked').val()=='WC'?moment().format('YYYYMMDDHHmmss'):($('input[name="workStatus"]:checked').val()=='PD'?'':''),
            	'ordDate'			:	moment($('#ordDate').val()).format('YYYYMMDD'),
            	
            	'workStatus'		:	$('input[name="workStatus"]:checked').val(),
            	'workChargr'		:	$('#workChargr').val(),
            	'targetQty'			:	targetQtyVal,
            	'outputQty'			:	$('input[name="workStatus"]:checked').val()=='WC'?targetQtyVal:outputQtyVal,
            	'fairQty'			:	$('input[name="workStatus"]:checked').val()=='WC'?targetQtyVal:fairQtyVal,
            	'faultyQty'			:	faultyQtyVal,
            	'etcQty'			:	etcQtyVal,
            	'outQty'			:	$('input[name="workStatus"]:checked').val()=='WC'?targetQtyVal:outQtyVal,
            	'remainQty'			:	remainQtyVal,
            	'packYn'			:	'N'
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	if(saveState == 'add') {
                		toastr.success('작지를 등록했습니다.');
            		} else {
            			toastr.success('작지를 수정했습니다.');
            		}
                	$('#workOrderDTLTable').DataTable().ajax.reload( function () {});
                } else {
                	toastr.error(res.message);
                }
            }
		});
	});

	//생산실적수집 저장 버튼 click
	$('#qtySave').on('click',function() {
		if($('#outputQty').val()=='') {
			toastr.warning('생산수량을 입력해주세요.');
			$('#outputQty').focus();
			return false;
		}
		var targerQtyValue = parseInt($('#targetQty').val());
		var outputQtyValue = parseInt($('#outputQty').val());
		if(targerQtyValue-outputQtyValue<0) {
			toastr.warning('생산수량이 투입수량보다 많습니다.');
			$('#outputQty').focus();
			return false;
		}

		//저장 처리
		$.ajax({
			url: '<c:url value="/po/workOrderPrcssQtyUpdate"/>',
            type: 'POST',
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'minorPrcssCd'		:	minorPrcssCdVal,
            	'middlePrcssCd'		:	middlePrcssCdVal,
            	'outputQty'			:	$('#outputQty').val().replace(/,/g,""),
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	toastr.success('저장되었습니다.');
                	$('#workOrderDTLTable').DataTable().ajax.reload( function () {});
                } else {
                	toastr.error(res.message);
                }
            }
		});
	});


	//마감버튼 click
	$('#btnDeadline').on('click',function() {
		$('#outputQty').val($('#deadlineQty').val());
		$('#fairQty').val($('#deadlineQty').val());
		$('#outQty').val($('#deadlineQty').val());

		outputQtyVal = $('#deadlineQty').val().replace(/,/g,'');
		fairQtyVal = $('#deadlineQty').val().replace(/,/g,'');
		outQtyVal = $('#deadlineQty').val().replace(/,/g,'');
		
		$.ajax({
			url: '<c:url value="/po/workOrdInsertQty"/>',
            type: 'POST',
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'minorPrcssCd'		:	minorPrcssCdVal,
            	'middlePrcssCd'		:	middlePrcssCdVal,
            	'targetQty'			:	targetQtyVal,
            	'outputQty'			:	$('#deadlineQty').val().replace(/,/g,''),
            	'fairQty'			:	$('#deadlineQty').val().replace(/,/g,''),
            	'faultyQty'			:	'0',
            	'etcQty'			:	'0',
            	'outQty'			:	$('#deadlineQty').val().replace(/,/g,''),
            	'remainQty'			:	'0'
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	if(saveState == 'add') {
                		toastr.success('작지를 등록했습니다.');
            		} else {
            			toastr.success('작지를 수정했습니다.');
            		}
                } else {
                	toastr.error(res.message);
                }
            }
		});
	});

	//자주검사 테이블 선택시
	$('#workOrderJajuInspectTable tbody').on('click','tr',function() {
		if(jajuChoice != null) {
			if ($(this).hasClass('selected')) {
				//$(this).removeClass('selected');
				jajuChoice='delete';
			} else {
				$('#workOrderJajuInspectTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
				jajuChoice='delete';		
			}		
		}
		//tableIdx = $('#completTable1').DataTable().row(this).index();	
	});

	// 열추가
	$('#jajuAdd').on('click', function() {
		$('#workOrderJajuInspectTable').DataTable().row.add({}).draw(false);
	});

	// 열삭제
	$('#jajuDelete').on('click', function() {

		if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
			toastr.warning('데이터가 존재하지 않습니다.');
			return false;
		}
		
		if(jajuChoice !='delete') {
			toastr.warning('데이터를 선택해주세요.');
			return false;
		}
		$('#workOrderJajuInspectTable').DataTable().rows('.selected').remove().draw(false);
		jajuChoice = '';
		//$('#dtlDelete').attr('disabled',true);
	});

	//자주검사 저장 버튼
	$('#jajuSave').on('click', function() {
		var dataArray = new Array();
		var check = true;
		$('#workOrderJajuInspectTable tbody tr').each(function(index, item) {
			if(itemNmSize==1) {
				if ($(this).find('td input[name=itemCont1]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont1]').focus();
					check = false;
					return false;
				}
			} else if(itemNmSize==2) {
				if ($(this).find('td input[name=itemCont1]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont1]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont2]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont2]').focus();
					check = false;
					return false;
				}
			} else if(itemNmSize==3) {
				if ($(this).find('td input[name=itemCont1]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont1]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont2]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont2]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont3]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont3]').focus();
					check = false;
					return false;
				}
			} else if(itemNmSize==4) {
				if ($(this).find('td input[name=itemCont1]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont1]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont2]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont2]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont3]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont3]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont4]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont4]').focus();
					check = false;
					return false;
				}
			} else if(itemNmSize==5) {
				if ($(this).find('td input[name=itemCont1]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont1]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont2]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont2]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont3]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont3]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont4]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont4]').focus();
					check = false;
					return false;
				}
				if ($(this).find('td input[name=itemCont5]').val() == "") {
					toastr.warning('값을 입력해주세요.');
					$(this).find('td input[name=itemCont5]').focus();
					check = false;
					return false;
				}
			}
			if ($(this).find('td input[name=jajuRegDate]').val() == "") {
				toastr.warning('날짜를 입력해주세요.');
				$(this).find('td input[name=jajuRegDate]').focus();
				check = false;
				return false;
			}
			var rowData = new Object();
			rowData.minorPrcssCd = minorPrcssCdValue;
			rowData.workOrdNo = workOrdNoValue;
			rowData.middlePrcssCd = middlePrcssCdValue;
			rowData.workOrdSeq = workOrdSeqValue;
			rowData.itemNm = itemNmValue;
			rowData.jajuDesc = $(this).find('td input[name=jajuDesc]').val();
			if(itemNmSize==1) {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = replaceSlash($(this).find('td input[name=itemCont1]').val())+"////";
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
			} else if(itemNmSize==2) {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = replaceSlash($(this).find('td input[name=itemCont1]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont2]').val())+"///";
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
			} else if(itemNmSize==3) {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = replaceSlash($(this).find('td input[name=itemCont1]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont2]').val())
					+ "/" + replaceSlash($(this).find('td input[name=itemCont3]').val()) +"//";
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
			} else if(itemNmSize==4) {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = replaceSlash($(this).find('td input[name=itemCont1]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont2]').val())
					+ "/" + replaceSlash($(this).find('td input[name=itemCont3]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont4]').val())+"/";
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
			} else if(itemNmSize==5) {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = replaceSlash($(this).find('td input[name=itemCont1]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont2]').val())
					+ "/" + replaceSlash($(this).find('td input[name=itemCont3]').val()) 
					+ "/" + replaceSlash($(this).find('td input[name=itemCont4]').val())
					+ "/" + replaceSlash($(this).find('td input[name=itemCont5]').val());
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
			} else {
				if( $('#workOrderJajuInspectTable').DataTable().rows().count()==0 ) {
					rowData.itemCont="allDelete";
				} else {
					rowData.itemCont = null;
					rowData.jajuRegDate = $(this).find('td input[name="jajuRegDate"]').val().replace(/-/g,"");
				}
				
			}
			
			
			dataArray.push(rowData);
		});

		var url = '<c:url value="/po/workOrderJajuInspectCreate"/>';
		/* if(sideView=='edit') {
			url = '<c:url value="/po/workOrderJajuInspectUpdate"/>';
		} */
		if(check) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				//			beforeSend : function() {
				// $('#btnAddConfirm').addClass('d-none');
				//}, 
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						toastr.success('저장되었습니다.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//$('#workOrderJajuInspectTable').DataTable().ajax.reload( function () {});
				}
			});
		}
		
	});

	//불량수량 저장버튼 click
	$('#btnInsertQty').on('click',function() {
		if(parseInt($('#targetQty').val().replace(/,/g,'')) < parseInt($('#outputQty').val().replace(/,/g,''))) {
			toastr.warning('투입수량보다 생산수량이 더 많습니다. 확인후 다시 시도해주세요.');
			return false;
		}
		if((parseInt($('#outQty').val().replace(/,/g,'')) + parseInt($('#remainQty').val().replace(/,/g,''))) > parseInt($('#fairQty').val().replace(/,/g,''))) {
			toastr.warning('출고수량과 재고수량의 합이 양품수량을 초과합니다. 확인후 다시 시도해주세요.');
			return false;
		}
		if($('#remainQty').val().charAt(0) == '-') {
			toastr.warning('재고수량이 음수(-)입니다. 확인후 다시 시도해주세요.');
			return false;
		}
		$.ajax({
			url: '<c:url value="/po/workOrdInsertQty"/>',
            type: 'POST',
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'minorPrcssCd'		:	minorPrcssCdVal,
            	'middlePrcssCd'		:	middlePrcssCdVal,
            	'targetQty'			:	$('#targetQty').val().replace(/,/g,''),
            	'outputQty'			:	$('#outputQty').val().replace(/,/g,''),
            	'fairQty'			:	$('#fairQty').val().replace(/,/g,''),
            	'faultyQty'			:	$('#faultyQty').val().replace(/,/g,''),
            	'etcQty'			:	$('#etcQty').val().replace(/,/g,''),
            	'outQty'			:	$('#outQty').val().replace(/,/g,''),
            	'remainQty'			:	$('#remainQty').val().replace(/,/g,'')
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	toastr.success('불량수령을 입력했습니다.');
                } else {
                	toastr.error(res.message);
                }
            }
		});
	});

	$('#workOrderNonOperationTable tbody').on('click','tr',function() {
		if(choice != null) {
			if ($(this).hasClass('selected')) {
				//$(this).removeClass('selected');
				choice='delete';
			} else {
				$('#workOrderNonOperationTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
				choice='delete';		
			}		
		}
		//tableIdx = $('#completTable1').DataTable().row(this).index();	
	});

	// 열추가
	$('#noAdd').on('click', function() {
		$('#workOrderNonOperationTable').DataTable().row.add({
			'noGubun'		:	'',
			'noReason'		:	'',
			'noStartTime'	:	'',
			'noEndTime'		:	'',
			'noTime'		:	0,
			'noDesc'		:	''
		}).draw(false);
	});

	// 열삭제
	$('#noDelete').on('click', function() {

		if( $('#workOrderNonOperationTable').DataTable().rows().count()==0 ) {
			toastr.warning('데이터가 존재하지 않습니다.');
			return false;
		}
		
		if(choice !='delete') {
			toastr.warning('데이터를 선택해주세요.');
			return false;
		}
		$('#workOrderNonOperationTable').DataTable().rows('.selected').remove().draw(false);
		choice = '';
		//$('#dtlDelete').attr('disabled',true);
	});

	$('#workOrderNonOperationTable tbody').on('change', 'tr', function() { // 비가동 등록시 변경 사항을 DataTable에 적용
		console.log("변경점이 발견되었습니다.");
		var row = workOrderNonOperationTable.row(this).index();
		console.log("날짜: "+ moment($('.selected input[name=noStartTime]').val(),"HH:mm").format("YYYYMMDDHHmmss"));
		var result = 0;
		if($('.selected #endTime').val() != "") {
			console.log($('.selected input[name=noStartTime]').val());
			var startTimeToM = moment.duration(moment($('.selected input[name=noStartTime]').val(),"HH:mm").format("HH:mm")).asMinutes();
			var endTimeToM = moment.duration(moment($('.selected input[name=noEndTime]').val(),"HH:mm").format("HH:mm")).asMinutes();
			console.log(moment.duration(moment($('.selected input[name=noStartTime]').val(),"HH:mm").format("HH:mm")).asMinutes());
			console.log(moment.duration(moment($('.selected input[name=noEndTime]').val(),"HH:mm").format("HH:mm")).asMinutes());
			if(endTimeToM - startTimeToM<0) {
				toastr.warning("비가동시간을 확인해주세요.");
				return false;
			} else {
				workOrderNonOperationTable.cell(row,4).data(endTimeToM - startTimeToM);
			}
			
			
		}
		
		
		/* console.log(equipDowntimeAdmTable.cell(row,4).data($('.selected #downtimeGubun option:selected').val()));
		console.log(equipDowntimeAdmTable.cell(row,5).data($('.selected #downtimeCause option:selected').val()));
		console.log(equipDowntimeAdmTable.cell(row,6).data($('.selected #startTime').val()));
		console.log(equipDowntimeAdmTable.cell(row,7).data($('.selected #endTime').val()));
		console.log(equipDowntimeAdmTable.cell(row,9).data($('.selected #downtimeDesc').val())); */
		//$('#btnDowntimeSave').removeClass('d-none');
	});

	//비가동등록 저장 버튼
	$('#noSave').on('click', function() {
		var dataArray = new Array();
		var check = true;
		$('#workOrderNonOperationTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=noGubun]').val() == "") {
				toastr.warning('비가동 구분을 입력해주세요.');
				$(this).find('td input[name=noGubun]').focus();
				check = false;
				return false;
			}

			if ($(this).find('td input[name=noReason]').val() == "") {
				toastr.warning('사유를 입력해주세요.');
				$(this).find('td input[name=noReason]').focus();
				check = false;
				return false;
			}

			if ($(this).find('td input[name=noStartTime]').val() == "") {
				toastr.warning('시작시간을 입력해주세요.');
				$(this).find('td input[name=noStartTime]').focus();
				check = false;
				return false;
			}
			
			var rowData = new Object();
			rowData.minorPrcssCd = minorPrcssCdVal;
			rowData.workOrdNo = workOrdNoVal;
			rowData.middlePrcssCd = middlePrcssCdVal;
			rowData.workOrdSeq = workOrdSeqVal;
			
			noGubunData = $(this).find('td input[name=noGubun]').val();
			rowData.noGubun = noGubunData==undefined ? "" : noGubunData;
			
			rowData.noReason = $(this).find('td input[name=noReason]').val();
			rowData.noStartTime = $(this).find('td input[name="noStartTime"]').val();
			rowData.noEndTime = $(this).find('td input[name="noEndTime"]').val();
			rowData.noTime = workOrderNonOperationTable.row(this).data().noTime;
			rowData.noDesc = $(this).find('td input[name=noDesc]').val();
			dataArray.push(rowData);
		});

		var url = '<c:url value="/po/workOrderNonOperationCreate"/>';

		if(check==true) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				//			beforeSend : function() {
				// $('#btnAddConfirm').addClass('d-none');
				//}, 
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						toastr.success('저장되었습니다.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//$('#workOrderJajuInspectTable').DataTable().ajax.reload( function () {});
				}
			});
		}
	});
	

	//자재바코드스캔
	//작지번호 스캔
	$('#matrlBarcodeNoScan').keypress(function (e) {
		if (e.which == 13) {
			if($('#matrlBarcodeNoScan').val() == "" || $('#matrlBarcodeNoScan').val() == null) {
				toastr.warning("바코드번호를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#matrlBarcodeNoScan').select();
				return false;
			}
			if($('#matrlBarcodeNoScan').val().length != 12) {
				toastr.warning("잘못된 바코드번호입니다.");
				$('#matrlBarcodeNoScan').select();
				return false;
			}

			toastr.success("자재를 투입하였습니다.");
		}
	});



	//마감수량입력 keyup
	$("#deadlineQty").on('keyup', function(event){
	  	var deadlineNum = addCommas($(this).val().replace(/[^0-9]/g,''));
	  	if(deadlineNum == '' || deadlineNum == '0') {
	  		deadlineNum = '0';
		} else {
			if(deadlineNum.charAt(0) == '0') {
				deadlineNum = deadlineNum.substr(1,deadlineNum.length);
			}
			if(deadlineNum.charAt(0) == ',') {
				deadlineNum = deadlineNum.substr(1,deadlineNum.length);
			}
		}
		
	  	$(this).val(deadlineNum);
  	});

	//양품수량입력 keyup
	$("#fairQty").on('keyup', function(event){
	  	var fairNum = addCommas($(this).val().replace(/[^0-9]/g,''));
	  	if(fairNum == '' || fairNum == '0') {
	  		fairNum = '0';
		} else {
			if(fairNum.charAt(0) == '0') {
				fairNum = fairNum.substr(1,fairNum.length);
			}
			if(fairNum.charAt(0) == ',') {
				fairNum = fairNum.substr(1,fairNum.length);
			}
		}
		
	  	$(this).val(fairNum);
	  	var faultySum = 0;
	  	$('input[name=faultyCntNum]').each(function(index, item) {
		  	faultySum += parseInt($(this).val().replace(/,/g,''));
		});
		
	  	//생산수량 계산
		var outputResult = faultySum + parseInt(fairNum.replace(/,/g,''));
		$('.outputQty').val(addCommas(outputResult.toString().replace(/[^0-9]/g,'')));
		
		//재고수량 계산
		var remainResult = parseInt(fairNum.replace(/,/g,'')) - parseInt($('#outQty').val().replace(/,/g,''));
		if(remainResult < 0) { // 음수일 경우
			$('.remainQty').val('-'+addCommas(remainResult.toString().replace(/[^0-9]/g,'')));
		} else { // 양수일 경우
			$('.remainQty').val(addCommas(remainResult.toString().replace(/[^0-9]/g,'')));
		}
		
  	});

	//불량수량입력 keyup
	$("input[name=faultyCntNum]").on('keyup', function(event){
	  	var faultyNum = addCommas($(this).val().replace(/[^0-9]/g,''));
	  	if(faultyNum == '' || faultyNum == '0') {
	  		faultyNum = '0';
		} else {
			if(faultyNum.charAt(0) == '0') {
				faultyNum = faultyNum.substr(1,faultyNum.length);
			}
			if(faultyNum.charAt(0) == ',') {
				faultyNum = faultyNum.substr(1,faultyNum.length);
			}
		}
		
	  	$(this).val(faultyNum);
	  	var faultySum = 0;
	  	$('input[name=faultyCntNum]').each(function(index, item) {
		  	faultySum += parseInt($(this).val().replace(/,/g,''));
		});

		//생산수량 계산
		var outputResult = parseInt($('#fairQty').val().replace(/,/g,'')) + faultySum;
		$('.outputQty').val(addCommas(outputResult.toString().replace(/[^0-9]/g,'')));

		
  	});

	//출고수량입력 keyup
	$("#outQty").on('keyup', function(event){
		// 출고수량이 양품수량을 넘어서면
		if(parseInt($(this).val().replace(/,/g,'')) > parseInt($('#fairQty').val().replace(/,/g,''))) {
			$(this).val($('#fairQty').val());
			toastr.warning('양품수량을 초과하는 값을 입력하셨습니다.');
			return false;
		}
	  	var outNum = addCommas($(this).val().replace(/[^0-9]/g,''));
	  	if(outNum == '' || outNum == '0') {
	  		outNum = '0';
		} else {
			if(outNum.charAt(0) == '0') {
				outNum = outNum.substr(1,outNum.length);
			}
			if(outNum.charAt(0) == ',') {
				outNum = outNum.substr(1,outNum.length);
			}
		}
		
	  	$(this).val(outNum);

	  	//재고수량 계산
	  	var remainResult = parseInt($('#fairQty').val().replace(/,/g,'')) - parseInt(outNum.replace(/,/g,''));
		$('.remainQty').val(addCommas(remainResult.toString().replace(/[^0-9]/g,'')));
  	});








	














	


	//작업지시번호 목록 조회 팝업
   	var workOrdPopUpTable;
   	function selectWorkOrd()
   	{	   	
		if(workOrdPopUpTable == null || workOrdPopUpTable == undefined)	{
			//작지상세 테이블 
			 workOrdPopUpTable = $('#workOrdPopUpTable').DataTable({
				language : lang_kor,		
				paging : true,
				searching : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth' : 'posc0010'
					},
				},
				rowId : 'workOrdNo',
				columns : [ 				
						{data : 'workOrdNo'},	
						{data : 'itemGubunNm'},	
						{data : 'itemNm'},	
						{data : 'ordLotNo'},
						{data : 'workOrdQty'},						
				],
				columnDefs: [
		        	{ targets: [4], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3], className: 'text-center-td' },
		        	{ targets: [4], className: 'text-right-td' }
		        ],
			    order: [
			        [ 0, 'asc' ]
			    ]
			});
			
		    $('#workOrdPopUpTable tbody').on('click', 'tr', function () {
		    	var data = workOrdPopUpTable.row( this ).data();

		    	workOrdNoVal = data.workOrdNo;
		    	itemCdVal = data.itemCd;
		    	itemNmVal = data.itemNm;
		    	$('#workOrdNoScan').val(data.workOrdNo);
		    	
				$.ajax({
					url : '<c:url value="po/workOrderMiddlePrcssList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth'  : 'posc0010',
			            'workOrdNo' :  data.workOrdNo
					},				
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							var data2 = res.data;
							var prcssMiddleCode=new Array();
						
						 	$.each(data2, function(index, item){
							 	var jsonMiddleCode=new Object();
								jsonMiddleCode.baseCd= item.prcssCd;
								jsonMiddleCode.baseNm= item.prcssNm;
								prcssMiddleCode.push(jsonMiddleCode);
							});

							selectBoxAppend(prcssMiddleCode, 'middlePrcssList', '', '2');
							
						} else {
							toastr.error(res.message);
						}
					},				
				});
		    	
		    	$('#equipList').attr('disabled',true);
				$('#ordDate').attr('disabled',true);
				$('#btnWorkChargrSel').attr('disabled',true);
				$('#deadlineQty').attr('disabled',true);
				$('#btnDeadline').attr('disabled',true);
				$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
				$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
				$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
				$('#fairQty').attr('disabled',true); // 양품수량
				$('#faultyQty').attr('disabled',true); // 불량수량
				$('#etcQty').attr('disabled',true); // 기타수량
				$('#outQty').attr('disabled',true); // 출고수량
				

				$('#deadlineQty').val(''); // 마감수량 초기화
				$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화
				
		    	$('.resetVal').val('');
		    	
		    	$('input[name="workStatus"]').each(function() { // 작업지시선택 - 상태
				    $(this).prop('checked', false);
				});
				$('input[name="workStatus2"]').each(function() { // 불량등록 - 상태
		    	    $(this).prop('checked', false);
		    	});
		    	$('input[name="workStatus3"]').each(function() { // 비가동등록 - 상태
		    	    $(this).prop('checked', false);
		    	});

		    	$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
				$('#workOrderJajuInspectTable').DataTable().clear().draw(); //자주검사 테이블 초기화
				jajuStatus='reset';											//자주검사 테이블 헤드의 관리항목 삭제
				$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
				$('#minorPrcssTable').DataTable().clear().draw(); // 소공정목록
				$('#workOrderDTLTable').DataTable().clear().draw();// 공정별 작지목록
                $('#workOrdPopUpModal').modal('hide');
	
			});
		}else{
			$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrdPopUpModal').modal('show');		
   	} 


	//접수자 팝업 시작
	var userPopUpTable;
	function selWorkChargr() {
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
				$('.workChargr').val(data.userNumber);
				$('.workChargrNm').val(data.userNm);	
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}
	
	
	

//생산실적수집의 생산수량 입력 시 체크
	$(document).on('keyup',"#outputQty", function(event){
		
		var preInWhsQtyData = $(this).val();
		
		if ( !(	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)	) {
			/* $('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); */
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
 			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(addCommas(uncomma($(this).val())));
		
	});
	
	
</script>

</body>
</html>