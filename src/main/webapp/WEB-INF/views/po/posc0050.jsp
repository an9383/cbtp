<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row pt-2">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">생산실적(봉제)</li>
			</ol>
		</nav>
	</header>
	
	<!-- #main============================================================== -->
	<div class="container-fluid pt-0" id="main">
		<div class="row" style="height:88vh; max-height:90vh;">
			<div class="col-md-2 p-2" style="background-color:#fff; border: 1px solid #e3e3e3;">
				<div class="card card-primary">
					<div class="card-body p-1">
						<div class="form-group row pb-3">
							<label for="staticEmail" class="col-sm-3 col-form-label p-1">작지번호</label>
							<div class="col-sm-9">
								<div class="input-sub m-0">
									<input type="text" class="form-control" id="workOrdNoScan" style="font-size:120% !important; height: 2rem !important;">
									<button type="button" class="btn btn-primary input-sub-search" onClick="selectWorkOrd();">
										<span class="oi oi-magnifying-glass"></span>
									</button>
								</div>
							</div>
						</div>
						<!-- <div class="form-group row pb-3">
							<label for="middlePrcssList" class="col-sm-3 col-form-label p-0">중공정</label>
							<div class="col-sm-9">
								<div class="input-sub m-0">
									<select class="custom-select" id="middlePrcssList" style="font-size:120% !important; height: 2rem !important;">
									</select>
								</div>
							</div>
						</div> -->
						<div class="form-group row">
							<table id="minorPrcssTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>공정명</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 p-1" style="background-color:#fff; border: 1px solid #e3e3e3;">
				<div class="card card-primary">
					<div class="card-body pb-0 pt-1">
						<table id="workOrderDTLTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>작업지시번호</th>
									<th>작업지시일</th>
									<th>품번</th>
									<th>품명</th>
									<th>투입수량</th>
									<th>생산수량</th>
									<th>양품수량</th>
									<th>불량수량</th>
									<th>작업상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="card-body pt-0 pb-0" id="group1">
						<div class="row">
							<table class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>구분</th>
									<td>
										<input type="hidden" class="form-control resetVal itemGubun" id="itemGubun" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal itemGubunNm" id="itemGubunNm" disabled>
									</td>
									<th>공정명</th>
									<td>
										<input type="hidden" class="form-control mw-100 resetVal middlePrcssNm" id="middlePrcssNm" disabled>
										<input type="hidden" class="form-control resetVal middlePrcssCd" id="middlePrcssCd" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal minorPrcssNm" id="minorPrcssNm" disabled>
										<input type="hidden" class="form-control resetVal minorPrcssCd" id="minorPrcssCd" name="" maxlength="3" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemCd" id="itemCd" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemNm" id="itemNm" disabled>
									</td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control equipCd" id="equipCd" disabled>
											<input type="text" class="form-control equipNm" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%;" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr" id="workChargr" disabled>
											<input type="text" class="form-control mw-100 resetVal workChargrNm" id="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control resetVal ordDate" id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="PD" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WI" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WC" name="btnWorkStatus" id="rd3">종료
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="DT" name="btnWorkStatus" id="rd4">비가동
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row float-right">
							<button type="button" class="btn btn-primary float-right ml-2 d-none" id="btnWorkOrdSave" >저장</button>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="row pb-2">
									<div class="col">
										<h5>자재투입등록</h5>
									</div>
								</div>
							
								<div class="row pb-2 pt-2 border-top border-primary">
									<div class="form-group row">
										<label for="staticEmail" class="col-sm-3 col-form-label pt-1">바코드</label>
										<div class="col-sm-9">
											<div class="input-sub m-0">
												<input type="text" class="form-control"
													id="matrlBarcodeNoScan" disabled style="min-width: 230px;">
											</div>
										</div>
									</div>
								</div>
								<div class="row pb-2">
									<div class="col">
									<table id="workOrderMatrlTable" class="table table-bordered">	
										<colgroup>
											<col width="5%"></col>
											<col width="20%"></col>
											<col width="20%"></col>
											<col width="20%"></col>
											<col width="15%"></col>
											<col width="20%"></col>
										</colgroup>
										<thead class="thead-light">
											<tr>	
												<th>No.</th>
												<th>LOT NO</th>
												<th>품번</th>
												<th>품명</th>
												<th>COLOR</th>
												<th>투입일자</th>
											</tr>
										</thead>
									</table>
									</div>
								</div>
							</div>
						</div>
						<div class="row pt-2 pl-2 pb-2">
							<div class="col">
								<h5>불량등록</h5>
							</div>
							<div class="col">
								<button type="button" class="btn btn-warning float-right ml-2" id="btnFaultyDelete" >삭제</button>
								<button type="button" class="btn btn-primary float-right ml-2" id="btnFaultyAdd" >추가</button>
							</div>
						</div>
						<div class="row pt-2 pb-2 border-top border-primary">
							<div class="col-md-12">
								<table id="faultyTypeTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>불량발생일</th>
											<th>불량유형</th>
											<th>수량</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2" id="btnInsertQty" >저장</button>
							</div>
						</div>
					</div>
					<!-- 자재투입 -->
					<div class="card-body pt-0 pb-0 d-none" id="group2">
						<div class="row">
							<table class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>구분</th>
									<td>
										<input type="hidden" class="form-control resetVal itemGubun" id="itemGubun" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal itemGubunNm" id="itemGubunNm" disabled>
									</td>
									<th>공정명</th>
									<td>
										<input type="hidden" class="form-control mw-100 resetVal middlePrcssNm" id="middlePrcssNm" disabled>
										<input type="hidden" class="form-control resetVal middlePrcssCd" id="middlePrcssCd" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal minorPrcssNm" id="minorPrcssNm" disabled>
										<input type="hidden" class="form-control resetVal minorPrcssCd" id="minorPrcssCd" name="" maxlength="3" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemCd" id="itemCd" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemNm" id="itemNm" disabled>
									</td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control equipCd" id="equipCd" disabled>
											<input type="text" class="form-control equipNm" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%;" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr" id="workChargr" disabled>
											<input type="text" class="form-control mw-100 resetVal workChargrNm" id="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control resetVal ordDate" id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="PD" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WI" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WC" name="btnWorkStatus" id="rd3">종료
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="DT" name="btnWorkStatus" id="rd4">비가동
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="row pb-2">
									<div class="col">
										<h5 class="pt-2 pl-2">자재투입등록</h5>
									</div>
								</div>
							
								<div class="row pb-2 pt-2 border-top border-primary">
									<div class="form-group row">
										<label for="staticEmail" class="col-sm-3 col-form-label pt-1">바코드</label>
										<div class="col-sm-9">
											<div class="input-sub m-0">
												<input type="text" class="form-control"
													id="matrlBarcodeNoScan" disabled style="min-width: 230px;">
											</div>
										</div>
									</div>
								</div>
								<div class="row pb-2">
									<div class="col">
									<table id="workOrderMatrlTable" class="table table-bordered">	
										<colgroup>
											<col width="5%"></col>
											<col width="20%"></col>
											<col width="20%"></col>
											<col width="20%"></col>
											<col width="15%"></col>
											<col width="20%"></col>
										</colgroup>
										<thead class="thead-light">
											<tr>	
												<th>No.</th>
												<th>LOT NO</th>
												<th>품번</th>
												<th>품명</th>
												<th>COLOR</th>
												<th>투입일자</th>
											</tr>
										</thead>
									</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 공정검사 -->
					<div class="card-body pt-0 pb-0 d-none" id="group3">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>구분</th>
									<td>
										<input type="hidden" class="form-control resetVal itemGubun" id="itemGubun" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal itemGubunNm" id="itemGubunNm" disabled>
									</td>
									<th>공정명</th>
									<td>
										<input type="hidden" class="form-control mw-100 resetVal middlePrcssNm" id="middlePrcssNm" disabled>
										<input type="hidden" class="form-control resetVal middlePrcssCd" id="middlePrcssCd" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal minorPrcssNm" id="minorPrcssNm" disabled>
										<input type="hidden" class="form-control resetVal minorPrcssCd" id="minorPrcssCd" name="" maxlength="3" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemCd" id="itemCd" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemNm" id="itemNm" disabled>
									</td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control equipCd" id="equipCd" disabled>
											<input type="text" class="form-control equipNm" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%;" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr" id="workChargr" disabled>
											<input type="text" class="form-control mw-100 resetVal workChargrNm" id="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control resetVal ordDate" id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="PD" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WI" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WC" name="btnWorkStatus" id="rd3">종료
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="DT" name="btnWorkStatus" id="rd4">비가동
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>						
						<div class="row pt-2 pl-2 pb-2">
							<div class="col">
								<h5>공정검사등록</h5>
							</div>
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2" id="jajuAdd" style="font-size: 120%; height: 2rem;">등록</button>
							</div>
						</div>
						<div class="row pb-2 pt-2 border-top border-primary">
							<div class="table-responsive">
								<table id="workOrderJajuInspectTable" class="table table-bordered">	
									<colgroup>
										<col width="5%"></col>
										<col width="45%"></col>
										<col width="20%"></col>
										<col width="30%"></col>
										
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>No.</th>
											<th>기준</th>
											<th>확인방법</th>
											<th>검사결과</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2" id="jajuSave" >저장</button>
							</div>
						</div>
					</div>
					<!-- 불량등록 -->
					<div class="card-body pt-0 pb-0 d-none" id="group4">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>구분</th>
									<td>
										<input type="hidden" class="form-control resetVal itemGubun" id="itemGubun" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal itemGubunNm" id="itemGubunNm" disabled>
									</td>
									<th>공정명</th>
									<td>
										<input type="hidden" class="form-control mw-100 resetVal middlePrcssNm" id="middlePrcssNm" disabled>
										<input type="hidden" class="form-control resetVal middlePrcssCd" id="middlePrcssCd" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal minorPrcssNm" id="minorPrcssNm" disabled>
										<input type="hidden" class="form-control resetVal minorPrcssCd" id="minorPrcssCd" name="" maxlength="3" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemCd" id="itemCd" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemNm" id="itemNm" disabled>
									</td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control equipCd" id="equipCd" disabled>
											<input type="text" class="form-control equipNm" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%;" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr" id="workChargr" disabled>
											<input type="text" class="form-control mw-100 resetVal workChargrNm" id="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control resetVal ordDate" id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="PD" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WI" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WC" name="btnWorkStatus" id="rd3">종료
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="DT" name="btnWorkStatus" id="rd4">비가동
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row pt-2 pl-2 pb-2">
							<div class="col">
								<h5>불량등록</h5>
							</div>
							<div class="col">
								<button type="button" class="btn btn-warning float-right ml-2" id="btnFaultyDelete" >삭제</button>
								<button type="button" class="btn btn-primary float-right ml-2" id="btnFaultyAdd" >추가</button>
							</div>
						</div>
						<div class="row pt-2 pb-2 border-top border-primary">
							<div class="col-md-12">
								<table id="faultyTypeTable" class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>불량발생일</th>
											<th>불량유형</th>
											<th>수량</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-primary float-right ml-2" id="btnInsertQty" >저장</button>
							</div>
						</div>
					</div>
					<!-- 비가동등록 -->
					<div class="card-body pt-0 pb-0 d-none" id="group5">
						<div class="row">
							<table id="" class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>
									<th>구분</th>
									<td>
										<input type="hidden" class="form-control resetVal itemGubun" id="itemGubun" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal itemGubunNm" id="itemGubunNm" disabled>
									</td>
									<th>공정명</th>
									<td>
										<input type="hidden" class="form-control mw-100 resetVal middlePrcssNm" id="middlePrcssNm" disabled>
										<input type="hidden" class="form-control resetVal middlePrcssCd" id="middlePrcssCd" maxlength="25" disabled>
										<input type="text" class="form-control mw-100 resetVal minorPrcssNm" id="minorPrcssNm" disabled>
										<input type="hidden" class="form-control resetVal minorPrcssCd" id="minorPrcssCd" name="" maxlength="3" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemCd" id="itemCd" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control mw-100 resetVal itemNm" id="itemNm" disabled>
									</td>
								</tr>
								<tr>
									<th>투입수량</th>
									<td><input type="text"
										class="form-control mw-100 resetVal targetQty" disabled></td>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control equipCd" id="equipCd" disabled>
											<input type="text" class="form-control equipNm" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%;" disabled>
										</div>
									</td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0 mw-100">
											<input type="hidden" class="form-control resetVal workChargr" id="workChargr" disabled>
											<input type="text" class="form-control mw-100 resetVal workChargrNm" id="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnWorkChargrSel" onClick="selWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control resetVal ordDate" id="ordDate" style="min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>상태</th>
									<td colspan='2'>
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="PD" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WI" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="WC" name="btnWorkStatus" id="rd3">종료
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 10px 3px 10px !important;">
												<input type="radio" class="DT" name="btnWorkStatus" id="rd4">비가동
											</label>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="row pb-2 pt-2 pl-2">
							<div class="col">
								<h5 class="">비가동등록</h5>
							</div>
							<div class="col">
								<button type="button" id="noDelete" class="btn btn-warning float-right ml-2" id="" >삭제</button>
								<!-- <button type="button" class="btn btn-primary float-right ml-2" id="">수정</button> -->
								<button type="button" id="noAdd" class="btn btn-primary float-right ml-2" id="" >추가</button>
							</div>
						</div>
						<div class="row pb-2 border-top border-primary">
							<div class="table-responsive">
								<table id="workOrderNonOperationTable"
									class="table table-bordered">
									<colgroup>
										<col width="15%">
										<col width="15%">
										<col width="13%">
										<col width="13%">
										<col width="13%">
										<col width="13%">
										<col width="8%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>비가동구분</th>
											<th>사유</th>
											<th>시작일자</th>
											<th>시작시간</th>
											<th>종료일자</th>
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
								<button type="button" class="btn btn-primary float-right ml-2" id="noSave" >저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1 p-1" style="background-color:#fff; border: 1px solid #e3e3e3;">
				<div class="card">
					<div class="card-body p-0">
						<div class="btn-group-vertical btn-group-toggle btn-block" data-toggle="buttons" style="overflow:hidden;">
							<label class="btn btn-lg btn-primary mb-2" for="btnGroup1" style="font-size: 120% !important; height: 3rem !important;">
								<input type="radio" id="btnGroup1">작업지시선택
							</label>
							<!-- <label class="btn btn-lg btn-primary mb-2 " for="btnGroup2" style="font-size: 120% !important; height: 3rem !important;">
								<input type="radio" id="btnGroup2">자재투입
							</label>  -->
							<label class="btn btn-lg btn-success mb-2" for="btnGroup3" style="font-size: 120% !important; height: 3rem !important;">
								<input type="radio" id="btnGroup3">공정검사
							</label>
							<!-- <label class="btn btn-lg btn-warning mb-2" for="btnGroup4" style="font-size: 120% !important; height: 3rem !important;">
								<input type="radio" id="btnGroup4">불량등록
							</label> -->
							<label class="btn btn-lg btn-danger mb-2" for="btnGroup5" style="font-size: 120% !important; height: 3rem !important;">
								<input type="radio" id="btnGroup5">비가동등록
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .right-sidebar -->
	<!-- 작업지시 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="workOrderPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workOrderPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" style="max-width: 1400px;">
	    	<div class="modal-content">
		    	<div class="modal-header pb-0">
		        	<h4>작업지시 조회</h4>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true" style="font-size: xx-large;">&times;</span>
		        	</button>
		      	</div> 
		      	<div class="modal-body">
		      		<hr class="text-secondary">	         
	                	<table id="workOrderPopUpTable" class="table table-bordered w-100">
	                		<colgroup>
	                			<col width="6%">
	                			<col width="10%">
	                			<col width="10%">
	                			<col width="12%">
	                			<col width="12%">
	                			<col width="10%">
	                			<col width="6%">
	                			<col width="6%">
	                			<col width="8%">
	                			<col width="9%">
	                			<col width="10%">
	                		</colgroup>
		                    <thead class="thead-light">
			                    <tr>
			                    	<th>품목구분</th>
			                    	<th>설비명</th>
			                    	<th>작업지시번호</th>
			                    	<th>품번</th>
			                    	<th>품명</th>
			                    	<th>차종</th>   
			                    	<th>지시수량</th> 
			                    	<th>생산수량</th>
			                    	<th>작업지시일</th>  
			                    	<th>생산일자</th>   
			                    	<th>작업상태</th>      
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
	<!-- 작업지시 모달 종료-->
	<!-- 종료 및 마감시 경고창 ========================================================== -->
	<div class="modal fade bd-example-modal-lg" id="endDeallineModal" tabindex="-1" role="dialog" aria-labelledby="endDeallineModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width:30%;">
			<div class="modal-content">
				<div class="modal-header pb-0">
					<h4 id="endDeallineModalTitle"></h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="font-size: xx-large;">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5 id="endDeallineModalContent"></h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnEndDeallineSave" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-danger" id="btnEndDeallineCancle" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ========================================================== 종료 및 마감시 경고창 -->
<!-- /.row -->
<style>
.bg-danger2 {
  background-color: #FF7878 !important;
}
.statusColor {
  background-color : white !important;
}
.equipBtnColor {
  background-color : #57BD85 !important;
}
</style>
<%@include file="../layout/bottom.jsp"%>
<script>

	console.log("${userNumber}");

	//공통코드 처리 시작
	let prodGubunCode = new Array(); 
	<c:forEach items="${prodGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prodGubunCode.push(json);
	</c:forEach> 

	var judgeCode=new Array();	//판정
    <c:forEach items="${judge}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		judgeCode.push(json);
	</c:forEach>

	var silhangCode=new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		silhangCode.push(json);
	</c:forEach>
	//공통코드 처리 종료
	
	
	// 작업지시선택 버튼 click
	$('#btnGroup1').on('click', function() {
		$('#group1').removeClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표
		$('#workOrderDTLTable').removeClass('d-none'); //  작업지시번호
	});

	// 생산실적수집 버튼 click
	$('#btnGroup2').on('click', function() {
		if(!$('#workOrderDTLTable tbody tr').hasClass('selected')) { //작지를 선택하지 않았을 경우
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		if(workOrderDTLTable.row('.selected').data().workStatus == '') {
			toastr.warning('작업지시를 계획한 후 다시 시도해주세요.');
			return false;
		}
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').removeClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표
		$('#workOrderDTLTable').removeClass('d-none'); //  작업지시번호
	});

	// 공정검사 버튼 click
	$('#btnGroup3').on('click', function() {
		if(!$('#workOrderDTLTable tbody tr').hasClass('selected')) { //작지를 선택하지 않았을 경우
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		
		if(workOrderDTLTable.row('.selected').data().workStatus != 'WC' ) {
			toastr.warning('작업지시 종료한 후에 다시 시도해주세요.');
			return false;
		}
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').removeClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표
		$('#workOrderDTLTable').removeClass('d-none'); //  작업지시번호
	});

	// 불량등록 버튼 click
	$('#btnGroup4').on('click', function() {
		if(!$('#workOrderDTLTable tbody tr').hasClass('selected')) { //작지를 선택하지 않았을 경우
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		if(workOrderDTLTable.row('.selected').data().workStatus == '') {
			toastr.warning('작업지시를 계획한 후 다시 시도해주세요.');
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/baseInfoFtList"/>',
			type : 'GET',
			data : {
				'baseInfoGubun' : '003',
				'etc3' : function(){return minorPrcssCdVal;},
				}, 
			success : function(res){
				let data = res.data;
				baseInfoGubunCode = [];
				
				for(var i=0; i<res.listSize; i++){
					console.log('i:'+i);
					console.log('data[i].baseInfoCd:'+data[i].baseInfoCd);
					var json = new Object();
					json.baseCd = data[i].baseInfoCd;
					json.baseNm = data[i].baseInfoNm;
					baseInfoGubunCode.push(json);
					
				}

				$('#faultyTypeTable').DataTable().ajax.reload(function(){});
				
			}
		});	
		
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').removeClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표
		$('#workOrderDTLTable').removeClass('d-none'); //  작업지시번호
	});

	// 비가동등록 버튼 click
	$('#btnGroup5').on('click', function() {
		if(!$('#workOrderDTLTable tbody tr').hasClass('selected')) { //작지를 선택하지 않았을 경우
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		if(workOrderDTLTable.row('.selected').data().workStatus == '') {
			toastr.warning('작업지시를 종료한 후 다시 시도해주세요.');
			return false;
		}
		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').removeClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표
		$('#workOrderDTLTable').removeClass('d-none'); //  작업지시번호
	});

	// 작업표준서 버튼 click
	$('#btnGroup6').on('click', function() {
		console.log("작업표준서 클릭함!!!")
		if(!$('#workOrderDTLTable tbody tr').hasClass('selected')) { //작지를 선택하지 않았을 경우
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		if(workOrderDTLTable.row('.selected').data().workStatus == '') {
			toastr.warning('작업지시를 계획한 후 다시 시도해주세요.');
			return false;
		}

		$.ajax({
			url : '<c:url value="po/workStandardDownload" />',
			type : 'GET',
			data : {
					'itemCd' : function(){return itemCdVal},
					'minorPrcssCd' : function(){return minorPrcssCdVal}
				},
			success : function(res){
				if(res.result=="openOk"){
					$('#workStandardModal').modal('show');
					$('#workStandardImg').attr("src","data:image/jpg;base64," + res.data);
					
				}else if(res.result=="downOk"){
					window.location = 'po/downloadFile?itemCd='+itemCdVal+'&itemRev='+itemRevVal+'&prcssCd='+minorPrcssCdVal;
				}else if(res.result=="notExist"){
					toastr.warning("등록된 작업표준서가 없습니다.");
				}
			}
		})
	});

	//생산전표 버튼 click
	$('#btnGroup13').on('click',function() {

		$('#group1').addClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').removeClass('d-none'); //  생산전표
		$('#workOrderDTLTable').addClass('d-none'); //  작업지시번호
		
		$('#prodTable').DataTable().ajax.reload(function(){});
	});

	
</script>
<script>
$(document).attr("title","생산실적(봉제)");

$(document).ready(function() {
	if(!$('#main-wrapper').hasClass('has-compact-menu')) { // 왼쪽 메뉴가 열려있을 경우
		//$('#aside-menu').trigger('click');
		$('#main-wrapper').addClass('has-compact-menu');
		$('#stacked-menu').removeClass('stacked-menu-has-collapsible');
		$('#stacked-menu').addClass('stacked-menu-has-compact');
		$('#stacked-menu').addClass('stacked-menu-has-hoverable');
	}
	$('body').css('font-size','15px');
	$('input').css('font-size','120%').css('height','2rem');
	$('select').css('font-size','120%').css('height','2rem');
	$('th').css('vertical-align','middle')
			.css('background-color','#f6f7f9')
			.css('text-align','center')
			.css('width','100px');
	$('button').css('font-size','120%').css('height','2rem');
});
</script>
<script>

	let currentHref = "posc0050";
	//let currentPage = $('.' + currentHref).attr('id');
	
	//$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	//$('#'+currentPage).closest('.menu-item').addClass('has-active');
	
	let getWorkOrdNo = '${getWorkOrdNo}';
	let getPrcssCd = '${getPrcssCd}'.toUpperCase();
		
	let saveState = 'add';
	let saveUrl = '';

	let workOrdNoVal = '';
	let workOrdSeqVal = '';
	let prcssCdVal = '';
	let ordLotNoVal = '';
	let itemSeqVal = '';
	let itemCdVal = '';
	let itemNmVal = '';
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
	let partCdVal = '';
	let partRevVal = '';
	let barcodeNoVal = '';
	//초기에는 제품으로 설정
	let searchProdGubun = '002';

	let btnWorkStatus = '';

	let selStartDateVal = moment().subtract(6, 'd').format('YYYYMMDD');
	let selEndDateVal = moment().format('YYYYMMDD');
	var today;
	
	//공정검사 데이터
	var minorPrcssCdValue = '';
	var workOrdNoValue = '';
	var middlePrcssCdValue = '';
	var workOrdSeqValue = '';
	let itemNmSize = 0;
	let jajuChoice= '';
	let itemNmValue = '';
	let jajuStatus = 'reset';

	var tableIdx;
	var equipCdVal;
	var timer;
	var equipListVal;
	var noStartTimeVal='';
	var groupPrcssCdVal=null;
	let inspectYnVal = null;
	var prodGubunVal = null;
	var itemSeriesVal = null;
	let faultyQtySum = '';
	let itemGubunVal = '001';

	var partReqNo;
	var partReqSeq;
	var reqStatus;
	
	//공정검사 데이터 끝
	
	let choice = ''; //비가동등록 삭제

	let loginUserNumber = '${userNumber}';
	let loginUserNm = '${userNm}';

	let workOrderObject = new Object();

	let endDeadlineState = ''; // 종료버튼 혹은 마감버튼 클릭 여부
	let endModalSaveState = ''; // 종료 및 마감 모달에서 종료일 경우 등록버튼을 눌렀는지 여부

	let boxLebelType = ''; // 라벨 프린트할 종류
	
	// 설비구분 목록
	var equipGubunCode=new Array();
    <c:forEach items="${equipGubun}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		equipGubunCode.push(json);
    </c:forEach>

    // 공정불량 목록
    var baseInfoGubunCode = new Array();
    <c:forEach items="${baseInfoAdmList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseInfoCd}";
	json.baseNm = "${info.baseInfoNm}";
	baseInfoGubunCode.push(json);
	</c:forEach>

	//긴급여부
    var prcssCd = new Array();
    <c:forEach items="${prcssCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcssCd.push(json);
	</c:forEach>

	//사유
    var reqReasonCode = new Array();
    <c:forEach items="${reqReason}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	reqReasonCode.push(json);
	</c:forEach>
	
	selectBoxAppend(prcssCd, "emerYn", "002", "");			//긴급/일반
	

	function selectBoxHtmlFaultyType(obj, id, sVal, row, meta){
		var shtml = '<select class="custom-select custom-select-sm" id="'+ id +'" name="faultyTypeCd" data-col="' + meta.col + '" style="min-width: 100%;font-size: 120%; height: 2rem;"><option value="">선택</option>';
		
		var option;
		for(key in obj) {
			var tmp; 
			if(obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	
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
			url : '<c:url value="po/workOrderPrcssCdList"/>',
			type : 'GET',
			data : {
 				'itemSeq' :  function() { return itemSeqVal; },
			},
		},
		rowId : 'prcssCd',
		columns : [ 
			{ data : 'minorPrcssNm' },
	    ],
	    columnDefs: [
		    { targets: [0], className: 'text-center-td' }
	    ], 
	    order: [
	    ],
	    buttons: [
	    ],
	    drawCallback: function() {
		    $('#minorPrcssTable_wrapper').css('min-width','100%');
		},
		initComplete: function(settings) {
		},
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
 				'itemSeq' :  function() { return itemSeqVal; },
 				'middlePrcssCd' :  function() { return middlePrcssCdVal; },
 				'minorPrcssCd' :  function() { return minorPrcssCdVal; },
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
	    	{ data : 'itemCd' },
			{ data : 'itemNm' },
			{ data : 'targetQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data.replace(/[^0-9]/g,''));
					}else{
						return 0;
					}
			    }
		   	},
		   	{ data : 'outputQty',
				render : function(data, type, row, meta) {
					if(data != null) {
		    			return addCommas(data.replace(/[^0-9]/g,''));
			    	} else {
				    	return 0;
				    }
		    	}
	    	},
	    	{ data : 'fairQty',
		    	render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data.replace(/[^0-9]/g,''));
					}else{
						return 0;
					}
			    }
		   	},
	    	{ data : 'faultyQty',
		    	render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data.replace(/[^0-9]/g,''));
					}else{
						return 0;
					}
			    }
		   	},
			{ data : 'workStatus',
	    		render : function(data, type, row, meta) {
		    		if(data == 'PD') { return '<b><div style="color:black;" class="statusColor">대기</div></b>'; }
		    		else if(data == 'WI') { return '<b><div style="color:blue;" class="statusColor">시작</div></b>'; }
		    		else if(data == 'WC') { return '<b><div style="color:green;" class="statusColor">종료</div></b>'; }
		    		else if(data == 'DT') { return '<b><div style="color:red;" class="statusColor">비가동</div></b>'; }
		    		else if(data == 'ST') { return '<b><div style="color:orange;" class="statusColor">중지</div></b>'; }
		    		else { return '<b><div style="color:gray;" class="statusColor">미결</div></b>'; }
		    	}
	    	}
	    ],
	    columnDefs: [
		    { targets: '_all', className: 'text-center-td' },
		    { targets: [4,5,6,7], render: $.fn.dataTable.render.number( ',' ) }
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ]
	});


	//공정검사 조회
	let workOrderJajuInspectTable = $('#workOrderJajuInspectTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row'
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "002"},
				'inspSourceNo' : function(){return workOrdNoVal},			
				'inspGubun' : function(){return "002"},
				'inspType' : function(){return "001";},
				'itemSeq' : function(){return itemSeqVal;},
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
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" style="font-size: 120%; height: 2rem; min-width : 100%" disabled="" value="'+data+'">';
					} else {
						return '<input type="text" class="form-control" name="inspList" style="font-size: 120%; height: 2rem; min-width : 100%" disabled="">';
					}
				}
			},
			{
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta,"1");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX1", row['inspX1'], row, meta,"1");
					}else{
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta,"1");
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});

	//셀렉트박스생성
	function selectBoxHtml4(obj, name, sVal, row, meta,idx) {

		var shtml = '<select style="font-size: 120%; height: 2rem; min-width : 100%" class="custom-select" id="e-'+name+'-'+meta.row+'" name="'+ name +'" onkeydown="moveFocus(\'e\','+idx+','+meta.row+')" data-col="' + meta.col + '" disabled>';
		
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

	//등록버튼 클릭시
	$('#jajuAdd').on('click',function(){
		$('select[name=inspX1]').attr('disabled',false);
	});
	
	//저장버튼 클릭시
	$('#jajuSave').on('click',function(){
	     var check = true;
	     var dataArray = new Array();
	     
        $('#workOrderJajuInspectTable tbody tr').each(function(index, item) {
           	var rowData = new Object();
           	rowData.inspResultGubun = "002";
           	rowData.inspSourceNo = workOrdNoVal;
           	rowData.inspSourceSubNo = '';
           	rowData.inspCd = workOrderJajuInspectTable.row(index).data().inspCd;
           	rowData.inspType = workOrderJajuInspectTable.row(index).data().inspType;
           	rowData.inspSeq = workOrderJajuInspectTable.row(index).data().inspSeq;
           
           	var resultYCnt=0;
           
			//최종판정
			for(var i=1; i<=6; i++){
				if($(this).find('td select[name=inspX'+i+']').val()=="001"){
					resultYCnt++;
				}
				if($(this).find('td select[name=inspX'+i+']').val()==""){
					resultYCnt=-1;
					break;
				}
			}
			
			if(resultYCnt==6){
				rowData.inspResult = "001";	//합격
			}else if(resultYCnt==-1){
				rowData.inspResult = "";	//미판정
			}else{
				rowData.inspResult = "002";	//불합격
			}
           	rowData.inspX1 = $(this).find('td select[name=inspX1]').val();
           	rowData.inspX2 = "";
           	rowData.inspX3 = "";
           	rowData.inspX4 = "";
           	rowData.inspX5 = "";
           	rowData.inspX6 = "";
           	
        	dataArray.push(rowData);
        });
	    
	    if (check == true) {
	        $.ajax({
	           url : '<c:url value="/bm/inspResultAdmCreate"/>',
	           type : 'POST',
	           dataType : 'json',
	           data : JSON.stringify(dataArray),
	           contentType : "application/json; charset=UTF-8",
	           success : function(res) {
	              let data = res.data;
	              if (res.result == 'ok') {
	                toastr.success("등록되었습니다.");
	             	$('select[name=inspX1]').attr('disabled',true);
	       			$('#btnInspSave').addClass('d-none');
	            } else {
	                 toastr.error(res.message);
	            }
	         }
	      });
	   }
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
		           		resultHtml += '<input type="text" class="form-control" value="'+data+'" name="noGubun" style="max-width:100%;font-size: 120%; height: 2rem;">';
		           	} else {
			           	resultHtml += '<input type="text" class="form-control" value="" name="noGubun" style="max-width:100%;font-size: 120%; height: 2rem;" >';
			        }
	           		return resultHtml;
              	} 
	        },
	        { data: 'noReason',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
		           		resultHtml += '	<input type="text" name="noReason" class="form-control" value="'+data+'" style="max-width:100%;font-size: 120%; height: 2rem;">';
		           	} else {
			           	resultHtml += '	<input type="text" name="noReason" class="form-control" style="max-width:100%;font-size: 120%; height: 2rem;">';
			        }
	           		return resultHtml;
           		}
	        },
	        { data: 'noStartDate',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '<input type="date" class="form-control" name="noStartDate" value="' + moment(data,"YYYY-MM-DD").format("YYYY-MM-DD") + '" style="font-size: 120%; height: 2rem;">';
		           	} else {
		           		resultHtml += '<input type="date" class="form-control" name="noStartDate" style="font-size: 120%; height: 2rem;">';
			        }
	           		return resultHtml;
           		}
	        },
	        { data: 'noStartTime',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '<input type="time" class="form-control" name="noStartTime"  value="' + moment(data,"HH:mm").format("HH:mm") + '" style="font-size: 120%; height: 2rem;">';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noStartTime" style="font-size: 120%; height: 2rem;">';
			        }
	           		return resultHtml;
           		}
	        },
	        {data : 'noEndDate',
				render: function(data, type, row, meta) {		
					var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '<input type="date" class="form-control" name="noEndDate"  value="' + moment(data,"YYYY-MM-DD").format("YYYY-MM-DD") + '" style="font-size: 120%; height: 2rem;">';
		           	} else {
		           		resultHtml += '<input type="date" class="form-control" name="noEndDate" style="font-size: 120%; height: 2rem;">';
			        }
	           		return resultHtml;
				}
			},
	        {data : 'noEndTime',
				render: function(data, type, row, meta) {		
					var resultHtml='';
					if(data!=null) {
	           			resultHtml += '<input type="time" class="form-control" name="noEndTime" value="' + moment(data,"HH:mm").format("HH:mm") + '" style="font-size: 120%; height: 2rem;">';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noEndTime" style="font-size: 120%; height: 2rem;">';
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
						resultHtml += '	<input type="text" name="noDesc" class="form-control" value="'+data+'" style="max-width:100%;font-size: 120%; height: 2rem;">';
		           	} else {
		           		resultHtml += '	<input type="text" name="noDesc" class="form-control" value="" style="max-width:100%;font-size: 120%; height: 2rem;">';
			        }
	           		return resultHtml;	
				}
			},
	    ],
	    columnDefs: [
		    { targets: [6], className: 'text-center-td' }
	    ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ]
	});

	
	// 자재투입내역
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
		ajax : {
			url : '<c:url value="po/workOrdMatrlListAdm"/>',
			type : 'POST',
			data : {
				'workOrdNo'		:	function() { return workOrdNoVal}, 
 				'workOrdSeq'	:	"0",
	        	'minorPrcssCd'	:	"0",
	        	'middlePrcssCd'	:	"0",
	        	'itemSeq'		:	function() { return itemSeqVal}, 
			},
		},
		rowId : 'barcodeNo',
		columns : [ 
			{
				render:function(data,type,row,meta){
					return meta.row+1;
				}
			},
			{ data : 'barcodeNo'},
			{ data : 'itemCd' },
			{ data : 'itemNm' },
			{ data : 'itemColor' },
			{ data : 'matrlDate',
				render:function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
	    ],
	    buttons: [],
	});

	// 불량 유형 목록 테이블
	let faultyTypeTable = $('#faultyTypeTable').DataTable({
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
	    pageLength: 6,
	    select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax : {
			url : '<c:url value="po/workOrderFaultyTypeList"/>',
			type : 'POST',
			data : {
				'workOrdNo'		:	function() { return workOrdNoVal==''?'0':workOrdNoVal; },
 				'workOrdSeq'	:	function() { return workOrdSeqVal==''?'0':workOrdSeqVal; },
 				'middlePrcssCd'	:	function() { return middlePrcssCdVal==''?'0':middlePrcssCdVal; },
 				'minorPrcssCd'	:	function() { return minorPrcssCdVal==''?'0':minorPrcssCdVal; }
			},
		},
		columns : [ 
			{ data : 'faultyTypeDate',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						resultHtml += '	<input type="date" name="faultyTypeDate" class="form-control mw-100 text-center" style="font-size: 120%; height: 2rem;" value="'+moment(data,'YYYYMMDD').format('YYYY-MM-DD')+'" >';
		           	} else {
		           		resultHtml += '	<input type="date" name="faultyTypeDate" class="form-control mw-100 text-center" style="font-size: 120%; height: 2rem;" value="'+moment().format('YYYY-MM-DD')+'" >';
			        }
	           		return resultHtml;	
				}
			},
			{ data : 'faultyTypeCd',
				render : function(data, type, row, meta) {
					return selectBoxHtmlFaultyType(baseInfoGubunCode, 'baseInfoGubun-'+meta.row, data==null?'':data, row, meta);
				}
			},
			{ data : 'faultyTypeQty',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						resultHtml += '	<input type="text" name="faultyTypeQty" class="form-control mw-100 text-right" style="font-size: 120%; height: 2rem;" value="'+data+'" >';
		           	} else {
		           		resultHtml += '	<input type="text" name="faultyTypeQty" class="form-control mw-100 text-right" style="font-size: 120%; height: 2rem;" value="0" >';
			        }
	           		return resultHtml;	
				}
			},
			{ data : 'faultyTypeDesc',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						resultHtml += '	<input type="text" name="faultyTypeDesc" class="form-control mw-100" style="font-size: 120%; height: 2rem;" value="'+data+'" >';
		           	} else {
		           		resultHtml += '	<input type="text" name="faultyTypeDesc" class="form-control mw-100" style="font-size: 120%; height: 2rem;" value="" >';
			        }
	           		return resultHtml;	
				}
			},
	    ],
	    columnDefs: [
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    ],
	    drawCallback: function() {
	    	//불량수량 입력 keyup
	    	$('input[name=faultyTypeQty]').on('keyup',function() {
			    
	    		faultyQtySum=0;
				for(var i=0;i<faultyTypeTable.data().count();i++) {
	    	  		faultyQtySum += parseInt($('input[name=faultyTypeQty]:eq('+i+')').val().replace(/,/g,''));
	    		}

	    	});
		}
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
                    'workOrdNo'	:	$('#workOrdNoScan').val(),
                    'userDepartmentCd' : "${userDepartmentCd}",
		            'userNumber' : "${userNumber}",
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
        		    	groupPrcssCdVal = data.groupPrcssCd;
        		    	prodGubunVal = data.prodGubun;
        		    	inspectYnVal = data.inspectYn;
        		    	prodGubunVal = data.prodGubun;
        		    	itemSeriesVal = data.itemSeries;		//우선 시리즈로 함
        		    	
        		    	console.log('groupPrcssCd:'+groupPrcssCdVal);
        		    	
        		    	var firstSerial = 'K';
        		    	var secondSerial = data.itemSeries;

        		    	workOrderObject = {};
        		    	workOrderObject.itemGubun = data.itemGubun;	//소형,중형
        		    	workOrderObject.cnt = data.workOrdQty;
        		    	workOrderObject.itemNm = data.itemNm;
        		    	workOrderObject.output = '1.0';
        		    	workOrderObject.rpm = '2000';
        		    	workOrderObject.torque = '4.77';
        		    	workOrderObject.rCurrent = '5.6';
        		    	workOrderObject.encoder = '2500';
        		    	workOrderObject.serialNo = firstSerial + secondSerial;
        		    	workOrderObject.date = moment().format('YYYY.MM.DD');
        		    	workOrderObject.inertia = '33.7x10';
        		    	workOrderObject.rating = 'rating';
        		    	workOrderObject.cable = 'INC';
        		    	workOrderObject.barcodeNo = data.barcodeNo;

        		    	if (prodGubunVal=="002" && data.itemGubun == "001")
            		    	labelButtonProc("소형");
        		    	else if (prodGubunVal=="002" && data.itemGubun == "002")
                		    labelButtonProc("중형");
        		    	else if (prodGubunVal=="003")
                		    labelButtonProc("반제품");
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
        				//$('#fairQty').attr('disabled',true); // 양품수량
        				//$('#faultyQty').attr('disabled',true); // 불량수량
        				$('#etcQty').attr('disabled',true); // 기타수량
        				$('#outQty').attr('disabled',true); // 출고수량

        				$('#targetQty2').val("") // 투입수량
        				$('#outputQty2').val("") // 생산수량
        				//$('#btnEquipReset').attr('disabled',true) // 설비 초기화 버튼
        				

        				$('#deadlineQty').val(''); // 마감수량 초기화
        				$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화

        				$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
        				$('#workOrderJajuInspectReadTable').DataTable().clear().draw(); //공정검사조회 테이블 초기화
        				$('#workOrderJajuInspectTable').DataTable().clear().draw(); //공정검사 테이블 초기화
        				jajuStatus='reset';					        				//공정검사 테이블 헤드의 관리항목 삭제

        				$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
        				
        		    	
        		    	$('#minorPrcssTable').DataTable().ajax.reload( function () {});
        		    	$('#workOrderDTLTable').DataTable().clear().draw(); // 공정별 작지목록 초기화
        		    	$('.resetVal').val('');
        		    	
        		    	$('.btnWorkStatus').removeClass('active'); // 작지 상태 버튼 모두 클릭 해제
        		    	$('.btnWorkStatus').addClass('disabled'); // 작지 상태 버튼 모두 비활성화
        		    	btnWorkStatus = ''; // 작지상태

        		    	//작업지시선택 화면으로 이동 --------------------------
        		    	$('#workOrderDTLTable').removeClass('d-none'); // 작업지시선택
        				$('#group1').removeClass('d-none'); // 작업지시선택
        				$('#group2').addClass('d-none'); // 생산실적수집
        				$('#group3').addClass('d-none'); // 공정검사
        				$('#group4').addClass('d-none'); // 불량등록
        				$('#group5').addClass('d-none'); // 비가동등록
        				$('#group6').addClass('d-none'); //  제품라벨발행
        				$('#group13').addClass('d-none'); //  생산전표번호
        				//----------------------------------------------
        		    	
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
		
		middlePrcssCdVal = minorPrcssTable.row(this).data().middlePrcssCd;
		middlePrcssNmVal = minorPrcssTable.row(this).data().middlePrcssNm;
		minorPrcssCdVal = minorPrcssTable.row(this).data().prcssCd;
		minorPrcssNmVal = minorPrcssTable.row(this).data().minorPrcssNm;
		nextPrcssCdVal = minorPrcssTable.row(this).data().nextPrcssCd;

		$('#equipList').attr('disabled',true);
		$('#ordDate').attr('disabled',true);
		$('#btnWorkChargrSel').attr('disabled',true);
		$('#deadlineQty').attr('disabled',true);
		$('#btnDeadline').attr('disabled',true);
		$('input[name=workStatus]').attr('disabled',true); // 상태
		$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
		$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
		$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
		$('#etcQty').attr('disabled',true); // 기타수량
		$('#outQty').attr('disabled',true); // 출고수량

		$('#targetQty2').val("") // 투입수량
		$('#outputQty2').val("") // 생산수량
		
		$('.btnWorkStatus').removeClass('active'); // 작지 상태 버튼 모두 클릭 해제
    	$('.btnWorkStatus').addClass('disabled'); // 작지 상태 버튼 모두 비활성화
    	btnWorkStatus = ''; // 작지상태
    	
		$('#deadlineQty').val(''); // 마감수량 초기화
		$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화
		$('.resetVal').val('');


		$('#workOrderDTLTable').DataTable().ajax.reload( function () {	
			setTimeout(function() {workOrderDTLTable.row().deselect();}, 1);
		}); // 공정별 작지목록
		$('#workOrderMatrlTable').DataTable().ajax.reload( function () {	
			setTimeout(function() {workOrderDTLTable.row().deselect();}, 1);
		}); // 자재투입내역목록
		$('#workOrderNonOperationTable').DataTable().clear().draw(); //비가동등록 테이블 초기화
		$('#workOrderJajuInspectTable').DataTable().ajax.reload(function(){}); //공정검사 테이블 초기화
		$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
	

		//작업지시선택 화면으로 이동 --------------------------
		$('#workOrderDTLTable').removeClass('d-none'); // 작업지시선택
		$('#group1').removeClass('d-none'); // 작업지시선택
		$('#group2').addClass('d-none'); // 생산실적수집
		$('#group3').addClass('d-none'); // 공정검사
		$('#group4').addClass('d-none'); // 불량등록
		$('#group5').addClass('d-none'); // 비가동등록
		$('#group6').addClass('d-none'); //  제품라벨발행
		$('#group13').addClass('d-none'); //  생산전표번호
		//----------------------------------------------
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

	var jajuChangeName='';
	var b_Lenght='';
	var array = new Array();

	//작업지시 상세조회
	$('#workOrderDTLTable tbody').on('click','tr',function() {

		$('#btnWorkOrdSave').attr('disabled',false); // 작지저장 버튼
		if(workOrderDTLTable.data().count() != 0) { // 테이블이 비어있지 않을 경우에만 활성화
			$('#matrlBarcodeNoScan').attr('disabled',false); // 자재바코드입력
		}
		
		$('#deadlineQty').val(''); // 마감수량 초기화
		$('#matrlBarcodeNoScan').val(''); // 자재바코드입력 초기화

		tableIdx = $('#workOrderDTLTable').DataTable().row(this).index();
		
		if(workOrderDTLTable.row(this).data().workStatus == '') { // 미결상태일 경우
			console.log('ddd');
			saveState = 'add';
			$('.workOrdNo').val(workOrdNoVal);
			$('.middlePrcssCd').val(middlePrcssCdVal);
			$('.middlePrcssNm').val(middlePrcssNmVal);
			$('.minorPrcssCd').val(minorPrcssCdVal);
			$('.minorPrcssNm').val(minorPrcssNmVal);
			$('.itemCd').val(workOrderDTLTable.row(this).data().itemCd);
			$('.itemNm').val(workOrderDTLTable.row(this).data().itemNm);
			$('.itemGubun').val(workOrderDTLTable.row(this).data().itemGubun);
			$('.itemGubunNm').val(workOrderDTLTable.row(this).data().itemGubunNm);
			$('.targetQty').val(addCommas(workOrderDTLTable.row(this).data().targetQty.replace(/[^0-9]/g,'')));
			$('.workChargr').val(loginUserNumber);
			$('.workChargrNm').val(loginUserNm);
			$('.ordDate').val(moment().format('YYYY-MM-DD'));
			$('.equipCd').val(workOrderDTLTable.row(this).data().equipCd);
			$('.equipNm').val(workOrderDTLTable.row(this).data().equipNm);
			
			workOrdSeqVal = workOrderDTLTable.row(this).data().workOrdSeq;
			ordLotNoVal = workOrderDTLTable.row(this).data().ordLotNo==null?"":workOrderDTLTable.row(this).data().ordLotNo;
			itemCdVal = workOrderDTLTable.row(this).data().itemCd;
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
			$('#btnWorkChargrSel').attr('disabled',false);
			$('.btnWorkStatus').removeClass('active'); // 작지 상태 버튼 모두 클릭 해제
			$('.btnWorkStatus').addClass('disabled'); // 작지 상태 버튼 모두 비활성화
			$('#btnWorkOrdSave').attr('disabled', true); // 저장 버튼 비활성화
			$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
			$('#etcQty').attr('disabled',true); // 기타수량
			$('#outQty').attr('disabled',true); // 출고수량
			$('.btnWorkStatus .PD').parent().removeClass('disabled');

			$('#workOrderJajuInspectTable').DataTable().ajax.reload( function () {});
			$('#workOrderNonOperationTable').DataTable().ajax.reload( function () {});
			$('#workOrderMatrlTable').DataTable().ajax.reload( function () {}); // 자재투입내역
			$('#faultyTypeTable').DataTable().clear().draw(); // 블량등록 목록 테이블 초기화
			
			//미결상태일 때 생산실적수집 저장 못하게
			$('#qtySave').addClass('d-none');
			$('#outputQty').attr('disabled', true);

			//작업지시선택 화면으로 이동 --------------------------
			$('#workOrderDTLTable').removeClass('d-none'); // 작업지시선택
			$('#group1').removeClass('d-none'); // 작업지시선택
			$('#group2').addClass('d-none'); // 생산실적수집
			$('#group3').addClass('d-none'); // 공정검사
			$('#group4').addClass('d-none'); // 불량등록
			$('#group5').addClass('d-none'); // 비가동등록
			$('#group6').addClass('d-none'); //  제품라벨발행
			$('#group13').addClass('d-none'); //  생산전표
			//----------------------------------------------

			//$('#btnEquipReset').attr('disabled',true);	//설비 초기화버튼
			
		} else { // 미결상태가 아닐 경우
			jajuStatus = 'read';
			$('#qtySave').removeClass('d-none');
			//$('#btnEquipReset').attr('disabled', false);
			//$('#outputQty').attr('disabled', false);
			saveState = 'edit';
			$('.workOrdNo').val(workOrdNoVal);
			$('.middlePrcssCd').val(workOrderDTLTable.row(this).data().middlePrcssCd);
			$('.middlePrcssNm').val(workOrderDTLTable.row(this).data().middlePrcssNm);
			$('.minorPrcssCd').val(workOrderDTLTable.row(this).data().minorPrcssCd);
			$('.minorPrcssNm').val(workOrderDTLTable.row(this).data().minorPrcssNm);
			$('.itemCd').val(workOrderDTLTable.row(this).data().itemCd);
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
			$('.btnWorkStatus').removeClass('active');
			$('.equipCd').val(workOrderDTLTable.row(this).data().equipCd);
			$('.equipNm').val(workOrderDTLTable.row(this).data().equipNm);
			
			
			workOrdSeqVal = workOrderDTLTable.row(this).data().workOrdSeq;
			ordLotNoVal = workOrderDTLTable.row(this).data().ordLotNo;
			itemCdVal = workOrderDTLTable.row(this).data().itemCd;
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
			$('#btnWorkChargrSel').attr('disabled',false);
			if(workOrderDTLTable.row(this).data().workStatus == 'WI') { // 시작상태일 경우에만 마감 처리 가능
				$('#deadlineQty').attr('disabled',false);
				$('#btnDeadline').attr('disabled',false);
			} else {
				$('#deadlineQty').attr('disabled',true);
				$('#btnDeadline').attr('disabled',true);
			}

			$('.btnWorkStatus').removeClass('active'); // 작지 상태 버튼 모두 클릭 해제
			$('.'+workOrderDTLTable.row(this).data().workStatus).parent().addClass('active');
	    	$('.btnWorkStatus').removeClass('disabled'); // 작지 상태 버튼 모두 활성화
	    	$('#btnWorkOrdSave').attr('disabled', false); // 저장 버튼 활성화
	    	btnWorkStatus = workOrderDTLTable.row(this).data().workStatus; // 작지상태
			$('#btnInsertQty').attr('disabled',false); // 불량수량등록 버튼
			//$('#fairQty').attr('disabled',false); // 양품수량
			//$('#faultyQty').attr('disabled',false); // 불량수량
			$('#etcQty').attr('disabled',false); // 기타수량
			$('#outQty').attr('disabled',false); // 출고수량

			
			//공정검사는 작지상태가 종료일 때만 등록, 수정이 가능
			$('#workOrderJajuInspectTable').DataTable().ajax.reload( function () {});
    		$('#workOrderNonOperationTable').DataTable().ajax.reload( function () {});
    		$('#workOrderMatrlTable').DataTable().ajax.reload( function () {}); // 자재투입내력
    		$('#faultyTypeTable').DataTable().ajax.reload( function () {}); // 불량유형 목록

    		if(workOrderDTLTable.row(this).data().workStatus == 'DT'){
    			$('#group1').addClass('d-none'); // 작업지시등록
        		$('#group5').removeClass('d-none'); // 비가동등록
        	}
		}

		$.ajax({
			url : '<c:url value="bm/baseInfoFtList"/>',
			type : 'GET',
			data : {
				'baseInfoGubun' : '003',
				'etc3' : function(){return minorPrcssCdVal;},
				}, 
			success : function(res){
				let data = res.data;
				baseInfoGubunCode = [];
				
				for(var i=0; i<res.listSize; i++){
					console.log('i:'+i);
					console.log('data[i].baseInfoCd:'+data[i].baseInfoCd);
					var json = new Object();
					json.baseCd = data[i].baseInfoCd;
					json.baseNm = data[i].baseInfoNm;
					baseInfoGubunCode.push(json);
					
				}

				$('#faultyTypeTable').DataTable().ajax.reload(function(){});
				
			}
		});	

	});

	//작업지시 저장 버튼 click
	$('#btnWorkOrdSave').on('click',function() {

		if(saveState == 'add') {
			saveUrl = '/po/workOrdAdd2';
		} else {
			saveUrl = '/po/workOrdEdit2';
		}

		let outputQty = workOrderDTLTable.row(0).data().outputQty;
		let targetQty = workOrderDTLTable.row(0).data().targetQty;
		let workStatus = workOrderDTLTable.row(0).data().workStatus;

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
            	'equipCd'			:	$('#equipCd').val(),
            	'itemSeq'			:	itemSeqVal,
            	'itemCd'			:	itemCdVal,
            	'workStartTime'		:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WI'?moment().format('YYYYMMDDHHmmss'):($('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='PD'?'':workStartTimeVal),
        	    'workEndTime'		:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WC'?moment().format('YYYYMMDDHHmmss'):($('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='PD'?'':''),
            	'ordDate'			:	moment($('#ordDate').val()).format('YYYYMMDD'),
            	'workStatus'		:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class'),
            	'workChargr'		:	$('#workChargr').val(),
            	'targetQty'			:	targetQtyVal,
            	'outputQty'			:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WC'?targetQtyVal:outputQtyVal,
            	'fairQty'			:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WC'?targetQtyVal:fairQtyVal,
            	'faultyQty'			:	faultyQtyVal,
            	'etcQty'			:	etcQtyVal,
            	'outQty'			:	$('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WC'?targetQtyVal:outQtyVal,
            	'remainQty'			:	remainQtyVal,
            	'packYn'			:	'N',
            	'diffOutputQty'		:   $('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='WC'?targetQtyVal:outputQtyVal,
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	if(saveState == 'add') {
                		toastr.success('작지를 등록했습니다.');
            		} else {
            			toastr.success('작지를 수정했습니다.');
            		}

                	endDeadlineState = '';
                   
                	if($('.btnWorkStatus').parent().find('.active').find('input').attr('class')=='DT') {
                		$('#group1').addClass('d-none'); // 작업지시등록
                		$('#group5').removeClass('d-none'); // 비가동등록

                		today = new Date();
                		noStartTimeVal = today.getHours()+":"+today.getMinutes();

                		$('#noAdd').trigger( 'click' );
                    }

                	$('#workOrderDTLTable').DataTable().ajax.reload( function () {
                    	setTimeout(function() {
                    		$('#workOrderDTLTable tbody .selected').trigger('click');
                        },50);
                    }); 
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
		if($('#deadlineQty').val() == '') {
			toastr.warning('마감수량을 입력해주세요.');
			$('#deadlineQty').focus();
			return false;
		}
		var targetQty = parseInt(workOrderDTLTable.row('.selected').data().targetQty);	//투입수량
		let remainQty = parseInt(workOrderDTLTable.row('.selected').data().remainQty);	
		var fairQty = parseInt(workOrderDTLTable.row('.selected').data().fairQty);		//양품수량
		var deadlineQty = parseInt($('#deadlineQty').val());							//마감수량
		
		if(targetQty - fairQty == 0) { // 남은수량이 없을 경우
			toastr.warning('남은수량이 없습니다.');
			return false;
		}
	
		
		endDeadlineState = 'deadline';
		
		$('#endDeallineModalTitle').text('마감 타이틀');
		$('#endDeallineModalContent').empty();
		$('#endDeallineModalContent').append('남은수량이 '+(remainQty-deadlineQty)+'개 입니다.<br>마감하시겠습니까?');
		$('#endDeallineModal').modal('show');
	});

	// 종료 및 마감 모달에서 등록버튼 click
	$('#btnEndDeallineSave').on('click',function() {
		if(endDeadlineState == 'end') { // 종료버튼을 눌렀을 경우
			endModalSaveState = 'save';
			$('#btnWorkOrdSave').trigger('click');
		} else{
			toastr.error('시스템 오류입니다...jsp');
		}
	});

	// 종료 및 마감경고창에서 취소했을 경우
	$('#btnEndDeallineCancle').on('click',function() {
		console.log(endDeadlineState);
		if(endDeadlineState == 'end') { // 종료버튼을 눌렀을 경우
			endModalSaveState = 'cancle';
		}else {
			toastr.error('시스템 오류입니다...jsp');
		}
	});
	
	// 종료 및 마감경고창에서 모달창 밖을 누를 경우(취소판정) 
	$('#endDeallineModal').on('hide.bs.modal',function(e) {
		if(endDeadlineState == 'deadline') { // 마감버튼을 눌렀을 경우
			
		} else if(endDeadlineState == 'end') { // 종료버튼을 눌렀을 경우
			if(endModalSaveState != 'save') {
				$('.btnWorkStatus').removeClass('active');
				$('.'+workOrderDTLTable.row('.selected').data().workStatus).parent().addClass('active');
				$('.btnWorkStatus').removeClass('disabled'); // 작지 상태 버튼 모두 활성화
			}
		} else if(endDeadlineState == 'reset') { // 설비초기화버튼을 눌렀을 경우
		} else if(endDeadlineState == 'set') { // 설비세팅버튼을 눌렀을 경우
		}else {
			toastr.error('시스템 오류입니다...jsp');
		}
	});

	//불량수량 저장버튼 click
	$('#btnInsertQty').on('click',function() {
		
		var dataArray = new Array();
		var check = true;

		if(faultyTypeTable.data().count()>0){
			//처리중..
			$('#my-spinner').show();

			faultyQtySum=0;
			for(var i=0;i<faultyTypeTable.data().count();i++) {
    	  		faultyQtySum += parseInt($('input[name=faultyTypeQty]').eq(i).val().replace(/,/g,''));
    		}

			
			$('#faultyTypeTable tbody tr').each(function(index, item) {
				if($(this).find('input[name=baseInfoNm]').val()==""){
					toastr.warning("불량유형을 선택해주세요.");
					//처리완료..
					$('#my-spinner').hide();
					check = false;
					return false;
				}
				if($(this).find('input[name=faultyTypeQty]').val()=="" || $(this).find('input[name=faultyTypeQty]').val()=="0"){
					toastr.warning("불량수량을 입력해주세요.");
					//처리완료..
					$('#my-spinner').hide();
					check = false;
					return false;
				}

				var rowData = new Object();
				rowData.workOrdNo =  workOrdNoVal;
				rowData.workOrdSeq =  workOrdSeqVal;
				rowData.middlePrcssCd =  middlePrcssCdVal;
				rowData.minorPrcssCd =  minorPrcssCdVal;
				
				rowData.faultyQty = $(this).find('input[name=faultyTypeQty]').val().replace(/,/g,'');
				rowData.faultyTypeCd = $(this).find('select[name=faultyTypeCd]').val();
				rowData.faultyTypeDate = $(this).find('input[name=faultyTypeDate]').val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find('input[name=faultyTypeDesc]').val();
				rowData.fairQty = targetQtyVal-faultyQtySum;	//투입수량-불량수량
				rowData.faultyQtySum = faultyQtySum;
				dataArray.push(rowData);
			});
		}else{
			toastr.warning("우선 불량등록을 해주세요.");
			check=false;
			return false;
		}
		
		if(check){
			$.ajax({
				url: '<c:url value="/po/workOrdInsertQty2"/>',
	            type: 'POST',
	            datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
	            success: function (res) {
	                var data = res.data;
	                if(res.result == 'ok') {
	                	toastr.success('불량등록 되었습니다.');
	                	$('#workOrderDTLTable').DataTable().ajax.reload( function () {});
	                	//처리완료..
						$('#my-spinner').hide();
	                } else {
	                	toastr.error(res.message);
	                }
	            }
			});
		} 
	});

	//비가동등록 행 클릭시
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
			'noStartTime'	:	noStartTimeVal,
			'noEndTime'		:	'',
			'noStartDate'	:	selEndDateVal,
			'noEndDate'		:	'',
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

	var noStartDateVal = null;
	var startYearVal = null;
	var startMonVal = null;
	var startDateVal = null;

	var noEndDateVal = null;
	var endYearVal = null;
	var endMonVal = null;
	var endDateVal = null;

	
	var startTimeVal = null;
	var startHourVal = null;
	var startMinVal = null;

	var endTimeVal = null;
	var endHourVal = null;
	var endMinVal = null;
	
	//비가동시간
	$('#workOrderNonOperationTable tbody').on('change', 'tr', function() { // 비가동 등록시 변경 사항을 DataTable에 적용

		console.log("변경점이 발견되었습니다.");
		var row = workOrderNonOperationTable.row(this).index();
		console.log("날짜: "+ moment($('.selected input[name=noStartTime]').val(),"HH:mm").format("YYYYMMDDHHmmss"));

		var result = 0;
		
		if($('.selected #endTime').val() != "") {
			console.log($('.selected input[name=noStartTime]').val());

			noStartDateVal = $('input[name=noStartDate]').eq(row).val().replace(/-/g,'');
			//noStartDateVal = workOrderNonOperationTable.row(row).data().noStartDate;
			startYearVal = noStartDateVal.substring(0,4);
			startMonVal = noStartDateVal.substring(4,6);
			startDateVal = noStartDateVal.substring(6,8);

			noEndDateVal = $('input[name=noEndDate]').eq(row).val().replace(/-/g,'');
			endYearVal = noEndDateVal.substring(0,4);
			endMonVal = noEndDateVal.substring(4,6);
			endDateVal = noEndDateVal.substring(6,8);

			
			startTimeVal = $('input[name=noStartTime]').eq(row).val().replace(/-/g,'');
			startHourVal = startTimeVal.substring(0,2);
			startMinVal = startTimeVal.substring(3,5);

			endTimeVal = $('input[name=noEndTime]').eq(row).val().replace(/-/g,'');
			endHourVal = endTimeVal.substring(0,2);
			endMinVal = endTimeVal.substring(3,5);

			console.log('row  :'+row);
			console.log('시작년  :'+startYearVal);
			console.log('시작월 :'+startMonVal);
			console.log('시작일  :'+startDateVal);
			console.log('시작시간  :'+startHourVal+"/"+startMinVal);

			console.log('종료년  :'+endYearVal);
			console.log('종료월  :'+endMonVal);
			console.log('종료일  :'+endDateVal);
			console.log('종료시간  :'+endHourVal+"/"+endMinVal);
			
			
			var date1 = new Date(startYearVal, startMonVal, startDateVal, startHourVal, startMinVal, 00);
			var date2 = new Date(endYearVal, endMonVal, endDateVal, endHourVal, endMinVal, 00);

			var noTime = (date2.getTime() - date1.getTime()) / 1000 / 60; 

			if(noTime<0) {
				toastr.warning("비가동시간을 확인해주세요.");
				return false;
			} else {
				workOrderNonOperationTable.cell(row,6).data(noTime);
			}
			
			
		}
		
	});

	//비가동등록 저장 버튼
	$('#noSave').on('click', function() {
		var dataArray = new Array();
		var check = true;

		if(workOrderNonOperationTable.data().count()>0){
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

				if ($(this).find('td input[name=noStartDate]').val() == "") {
					toastr.warning('시작일자를 입력해주세요.');
					$(this).find('td input[name=noStartDate]').focus();
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
				rowData.workOrdNo = workOrdNoVal;
				rowData.middlePrcssCd = middlePrcssCdVal;
				rowData.minorPrcssCd = minorPrcssCdVal;
				rowData.workOrdSeq = workOrdSeqVal;

				noGubunData = $(this).find('td input[name=noGubun]').val();
				rowData.noGubun = noGubunData==undefined ? "" : noGubunData;
				rowData.noReason = $(this).find('td input[name=noReason]').val();
				rowData.noStartTime = $(this).find('td input[name="noStartTime"]').val();
				rowData.noEndTime = $(this).find('td input[name="noEndTime"]').val();
				rowData.noStartDate = $(this).find('td input[name="noStartDate"]').val().replace(/-/g,'');
				rowData.noEndDate = $(this).find('td input[name="noEndDate"]').val().replace(/-/g,'');
				rowData.noTime = workOrderNonOperationTable.row(this).data().noTime;
				rowData.noDesc = $(this).find('td input[name=noDesc]').val();
				dataArray.push(rowData);
			});
		}else{
			var rowData = new Object();
			rowData.workOrdNo = workOrdNoVal;
			rowData.middlePrcssCd = middlePrcssCdVal;
			rowData.minorPrcssCd = minorPrcssCdVal;
			rowData.workOrdSeq = workOrdSeqVal;
			noGubunData = $(this).find('td input[name=noGubun]').val();
			rowData.noGubun = noGubunData==undefined ? "" : noGubunData;
			dataArray.push(rowData);
		}
		

		var url = '<c:url value="/po/workOrderNonOperationCreate2"/>';

		if(check==true) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
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
				}
			});
		}
	});
	

	//자재투입 - 자재바코드스캔
	$('#matrlBarcodeNoScan').keypress(function (e) {

		if(btnWorkStatus=="WE"){
			toastr.warning("이미 종료된 작업지시에는 자재투입 할 수 없습니다.");
			return false;
		}
		
		if (e.which == 13) {
			if($('#matrlBarcodeNoScan').val() == "" || $('#matrlBarcodeNoScan').val() == null) {
				toastr.warning("바코드번호를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#matrlBarcodeNoScan').select();
				return false;
			}
			
			barcodeNoVal = $(this).val();
			
			
			$.ajax({
				url : '<c:url value="po/matrlBarcodeNoScan2"/>',
				type : 'POST',
				data : {					     
		            'menuAuth'			:	'posc0010',
		            'workOrdNo' 		:	workOrdNoVal,
		            'workOrdSeq' 		:	workOrdSeqVal,
		            'minorPrcssCd'		:	minorPrcssCdVal,
	            	'middlePrcssCd'		:	middlePrcssCdVal,
	            	'itemSeq' 			:	itemSeqVal,
	            	'barcodeNo'			:	barcodeNoVal,
	            	'matrlDate'			:	selEndDateVal,
				},				
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("자재투입 되었습니다.");
						$('#workOrderMatrlTable').DataTable().ajax.reload( function () {
							$('#matrlBarcodeNoScan').val('');
							$('#matrlBarcodeNoScan').focus();
						}); // 자재투입내역 새로고침
					}  else  {
						toastr.error(res.message);
						$('#matrlBarcodeNoScan').select();
					}
				}
			});
		}
	});


	function checkWhether(){
		if($('input:checkbox[name=partsCheckbox]:checked').length != workOrderMatrlTable.data().length) {
	       $("#checkboxAll1").prop("checked",false); 
	    }
	}
	
	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=reqQty]", function(event){
		var preInWhsQtyData = $(this).val();
		   
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(addCommas($(this).val()));
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



	//*******************작업지시 정보******************
	//작업지시번호 목록 조회 팝업
   	var workOrderPopUpTable;
   	function selectWorkOrd() {	   	
		if(workOrderPopUpTable == null || workOrderPopUpTable == undefined)	{
			 workOrderPopUpTable = $('#workOrderPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>" +
					"<'row'<'col-sm-12 p-0'tr>>" +
					"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,		
				paging : true,
				searching : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : true,
				lengthChange : true,
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth' 		: 'posc0010',
			            'selStartDate'	:	function() { return selStartDateVal; },
			            'selEndDate'	:	function() { return selEndDateVal; },
			            'mainGubun'		:	'002',
			            'itemGubun'		:	function() { return itemGubunVal; },
			            'value'			:	'',
					},
				},
				rowId : 'workOrdNo',
				columns : [			
					{data : 'itemGubunNm'},	
					{data : 'equipNm'},	
					{data : 'workOrdNo'},
					{data : 'itemCd'},	
					{data : 'itemNm'},	
					{data : 'itemModelNm'},	
					{data : 'workOrdQty'},	
					{data : 'outputQty'},	
					{data : 'workOrdDate',
						render : function(data,type,row,meta){
							if(data!=null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{data : 'workOrdDate',
						render : function(data,type,row,meta){
							if(data!=null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{
						data : 'workStatusCd',
						render : function(data,type,row,meta){
							if(data=="W"){
								return '대기'
							}else if(data=="WS"){
								return '진행중'
							}else if(data=="WE"){
								return '작업종료'
							}else if(data=="NS"){
								return '비가동시작'
							}else if(data=="NE"){
								return '비가동종료'
							}else if(data=="PS"){
								return '가동시작'
							}else if(data=="PE"){
								return '가동종료'
							}
						}
					},			
				],
				columnDefs: [
		        	{ targets: [6,7], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3,4,5,8,9,10], className: 'text-center-td' },
		        	{ targets: [6,7], className: 'text-right-td' }
		        ],
			    order: [
			    ],
			    buttons: [],
			    drawCallback: function() {
				    var api = this.api();
				}
			});
			 $('#workOrderPopUpTable tbody').on('click', 'tr', function () {
		    	var data = workOrderPopUpTable.row( this ).data();

		    	workOrdNoVal = data.workOrdNo;
		    	itemSeqVal = data.itemSeq;
		    	itemCdVal = data.itemCd;
		    	itemNmVal = data.itemNm;
		    	groupPrcssCdVal = data.groupPrcssCd;
		    	prodGubunVal = data.prodGubun;
		    	itemSeriesVal = data.itemSeries;		//우선 시리즈로 함
		    	inspectYnVal = data.inspectYn;
		    	prodGubunVal = data.prodGubun;
		    	
		    	$('#workOrdNoScan').val(data.workOrdNo);
		    	
		    	var firstSerial = 'K';
		    	var secondSerial = data.itemSeries;
		    	
		    	workOrderObject = {};
		    	workOrderObject.itemGubun = data.itemGubun;
		    	workOrderObject.cnt = data.workOrdQty;
		    	workOrderObject.itemNm = data.itemNm;
		    	workOrderObject.output = '1.0';
		    	workOrderObject.rpm = '2000';
		    	workOrderObject.torque = '4.77';
		    	workOrderObject.rCurrent = '5.6';
		    	workOrderObject.encoder = '2500';
		    	workOrderObject.serialNo = firstSerial + secondSerial;
		    	workOrderObject.date = moment().format('YYYY.MM.DD');
		    	workOrderObject.inertia = '33.7x10';
		    	workOrderObject.rating = 'rating';
		    	workOrderObject.barcodeNo = data.barcodeNo;
		    	workOrderObject.cable = data.itemCable;


		    	if (prodGubunVal=="002" && data.itemGubun == "001")
    		    	labelButtonProc("소형");
		    	else if (prodGubunVal=="002" && data.itemGubun == "002")
        		    labelButtonProc("중형");
		    	else if (prodGubunVal=="003")
        		    labelButtonProc("반제품");
    		    
		    	$('#minorPrcssTable').DataTable().ajax.reload(function(){}); //소공정목록

    		   /*  //중공정 목록조회
				$.ajax({
					url : '<c:url value="po/workOrderMiddlePrcssList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth'  : 'posc0010',
			            'workOrdNo' :  data.workOrdNo,
			            'reworkYn' :  data.reworkYn
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
				}); */
		    	
		    	$('#equipList').attr('disabled',true);
				$('#ordDate').attr('disabled',true);
				$('#btnWorkChargrSel').attr('disabled',true);
				$('#deadlineQty').attr('disabled',true);
				$('#btnDeadline').attr('disabled',true);
				$('#btnWorkOrdSave').attr('disabled',true); // 작지저장 버튼
				$('#btnInsertQty').attr('disabled',true); // 불량수량등록 버튼
				$('#matrlBarcodeNoScan').attr('disabled',true); // 자재바코드입력
				$('#btnPartsRequest').attr('disabled',true); //부품요청 버튼
				$('#fairQty').attr('disabled',true); // 양품수량
				$('#faultyQty').attr('disabled',true); // 불량수량
				$('#etcQty').attr('disabled',true); // 기타수량
				$('#outQty').attr('disabled',true); // 출고수량
				
				$('#targetQty').val("") // 투입수량
				$('#outputQty').val("") // 생산수량
				//$('#btnEquipReset').attr('disabled',true) // 설비 초기화 버튼

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
				$('#workOrderJajuInspectTable').DataTable().clear().draw(); //공정검사 테이블 초기화
				jajuStatus='reset';											//공정검사 테이블 헤드의 관리항목 삭제
				$('#workOrderMatrlTable').DataTable().clear().draw(); //자재투입내역 테이블 초기화
				$('#workOrderDTLTable').DataTable().clear().draw();// 공정별 작지목록
                $('#workOrderPopUpModal').modal('hide');

                $('.btnWorkStatus').removeClass('active'); // 작지 상태 버튼 모두 클릭 해제
		    	$('.btnWorkStatus').addClass('disabled'); // 작지 상태 버튼 모두 비활성화
		    	btnWorkStatus = ''; // 작지상태

              	//작업지시선택 화면으로 이동 --------------------------
              	$('#workOrderDTLTable').removeClass('d-none'); //  제품라벨발행
        		$('#group1').removeClass('d-none'); // 작업지시선택
        		$('#group2').addClass('d-none'); // 생산실적수집
        		$('#group3').addClass('d-none'); // 공정검사
        		$('#group4').addClass('d-none'); // 불량등록
        		$('#group5').addClass('d-none'); // 비가동등록
        		$('#group6').addClass('d-none'); //  제품라벨발행
        		$('#group13').addClass('d-none'); //  생산전표번호
        		//----------------------------------------------

			});

		    //workOrderPopUpTable 테이블에 workOrderPopUpTable_length 추가
			var html = '';
			html += '<div class="row">';
			html += '	<label class="input-label-xl mt-2 mr-2">작업지시일</label>';
			html += '	<div class="form-group input-sub m-0 row">';
			html += '		<input type="date" class="form-control-lg" id="selStartDate">';
			html += '	</div>';
			html += '	<label class="input-label-xl mt-2 mr-2 ml-2">~</label>';
			html += '	<div class="form-group input-sub m-0 row">';
			html += '		<input type="date" class="form-control-lg" id="selEndDate">';
			html += '	</div>&nbsp;&nbsp;&nbsp;';
			html += '	<label class="input-label-sm">품목구분</label>';
			html += '	<div class="form-group input-sub m-0">';
			html += '		<select name="itemGubunOption" id="itemGubunOption" title="" class="select w80 col-12 custom-select">';
			html += ' 			<option value="001">제품</option>';
			html += ' 			<option value="002">상품</option>';
			html += ' 			<option value="003">반제품</option>';
			html += '		</select>';
			html += '	</div>&nbsp;&nbsp;&nbsp;';
			html += '	<button type="button" class="btn btn-primary ml-2" id="btnAllRetv">전체조회</button>';
			html += '</div>';
				
			$('#workOrderPopUpTable_length').html(html);
			$('#selStartDate').val(moment(selStartDateVal).format('YYYY-MM-DD'));
			$('#selEndDate').val(moment(selEndDateVal).format('YYYY-MM-DD'));

			$('#selStartDate,#selEndDate,#mainGubun,#itemGubunOption,#workEmerYn').on('change',function() {
				selStartDateVal = moment($('#selStartDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				selEndDateVal = moment($('#selEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				itemGubun =  $('#itemGubunOption option:selected').val();
				$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
			});

			//전체조회 버튼
			$('#btnAllRetv').on('click',function(){
				selStartDateVal = ""
				selEndDateVal = moment($('#selEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				itemGubun =  "";
				$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
			})
						
			$('select').css('font-size','120%').css('height','2rem');
			$('button').css('font-size','120%').css('height','2rem');
			$('input').css('font-size','120%').css('height','2rem'); 
			
		}else{
			$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrderPopUpModal').modal('show');	
   	} 
			
   	
	//접수자 팝업 시작
	var workChargrPopupTable;
	function selWorkChargr() {
		if (workChargrPopupTable == null || workChargrPopupTable == undefined) {
			workChargrPopupTable = $('#workChargrPopupTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				searching : false,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {
					}
				},
				columns : [ 
					{
						data : 'userNm'
					}, {
						data : 'departmentNm'
					}, {
						data : 'postNm'
					}, {
						data : 'chargeDutyNm'
					}, {
						data : 'userDesc'
					},
				],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
			});
		} else {
			$('#workChargrPopupTable').DataTable().ajax.reload(function() {});
		}
			
		$('#workChargrPopupModal').modal('show');
	}

	$(document).on('click', '#workChargrPopupTable tbody tr', function() {
		var data = workChargrPopupTable.row(this).data();				
		$('.workChargr').val(data.userNumber);
		$('.workChargrNm').val(data.userNm);	

		//작업자 수정
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			data : {
				'workOrdNo' : workOrdNoVal,
				'mainWorkChargr' : function(){return data.userNumber},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("수정되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		}); 
		
		$('#workChargrPopupModal').modal('hide');
	});

	//품번검색
	function selectPartCd(){
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
			destroy : true,
			pageLength : 15,
			ajax : {
				url : '<c:url value="bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'partType' : '004'
				},
			},
			rowId : 'partCd',
			columns : [
					{ render : function(data, type, row, meta) {
						return meta.row+ meta.settings._iDisplayStart+ 1;
						}
					},
					{ data : 'partCd'		},
					{ data : 'partNm'		}, 
					{ data : 'partGubunNm'	},
					{ data : 'partTypeNm'	}, 
					{ data : 'partRev'		},
					{ data : 'partSpec'		}
			],
			columnDefs : [ 
				{ "defaultContent" : "-","targets" : "_all","className" : "text-center"}
			],
			order : [ [ 1, 'asc' ] ],
			buttons : [ 'copy', 'excel', 'print' ],
		});

		$('#itemPartPopUpTable tbody').on('click', 'tr', function() {
			
			var data = itemPartPopUpTable.row(this).data();
			$('input[name=partCd]').eq(tableIdx).val(data.partCd);
			$('input[name=partRev]').eq(tableIdx).val(data.partRev);
			$('input[name=partSpec]').eq(tableIdx).val(data.partSpec);
			$('input[name=partUnitNm]').eq(tableIdx).val(data.partUnitNm);
			$('#itemPartPopUpModal').modal('hide');
		});

		$('#itemPartPopUpTable tbody').css('font-size','11px');
		$('#itemPartPopUpModal').modal('show');
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


	//작업지시 상태 버튼 click
	$('.btnWorkStatus').on('click',function() {
		if(!$(this).hasClass('disabled') && $(this).hasClass('focus')) { // 활성화된 버튼을 눌렀을 경우
			if($('.btnWorkStatus').parent().find('.active').find('input').attr('class') == 'WC') {
				endDeadlineState = 'end';
				var remainQty = parseInt(workOrderDTLTable.row('.selected').data().remainQty);

				$('#endDeallineModalTitle').text('종료 타이틀');
				$('#endDeallineModalContent').empty();
				$('#endDeallineModalContent').append('종료하시겠습니까?');
				endModalSaveState = '';
				$('#endDeallineModal').modal('show');
			} else {
				$('#btnWorkOrdSave').trigger('click');
			}
		} 
	});


	//불량유형 추가 버튼 click
	$('#btnFaultyAdd').on('click',function() {
		faultyTypeTable.row.add( {
			"faultyTypeSeq"		:	faultyTypeTable.data().count() + 1,
			"faultyTypeDate"	:	moment().format('YYYYMMDD'),
    		"faultyTypeDate"	:	moment().format('YYYYMMDD'),
    		"faultyTypeCd"		:	'',
    		"faultyTypeQty"		:	'0',
    		"faultyTypeDesc"	:	''
    	}).draw();
	});

	//불량유형 삭제 버튼 click
	$('#btnFaultyDelete').on('click',function() {
		if(faultyTypeTable.data().count() == 0) {
			toastr.warning("삭제할 불량유형이 없습니다.");
			return false;
		}
		var selectedState = false;
		$('#faultyTypeTable tbody tr').each(function( index , item ) {
			if($(this).hasClass('selected')) {
				selectedState = true;
				faultyTypeTable.row('.selected').remove().draw();
				
				var length = faultyTypeTable.data().count();
				
		    	for(var i=0;i<length;i++){
		    		faultyTypeTable.row(i).data().faultyTypeSeq = parseInt(length-i);
		    		faultyTypeTable.cell(i,0).data(i+1);
		    	}
				
		    	faultyTypeTable.row('.selected').order([[0, 'asc']]).draw();

		    	
				
				return false;
			}
		});
		if(!selectedState) {
			toastr.warning("삭제할 불량유형을 선택해주세요.");
		} else {
			$('input[name=faultyTypeQty]').trigger('keyup');
		}
	});

	//불량유형 초기화 버튼 click
	$('#btnFaultyClear').on('click',function() {
		if(faultyTypeTable.data().count() == 0) {
			toastr.warning("삭제할 불량유형이 없습니다.");
			return false;
		}
		faultyTypeTable.clear().draw();
		$('#fairQty').val($('#outputQty').val());
		$('#faultyQty').val('0');
		$('#outQty').val($('#outputQty').val());
		$('#remainQty').val('0');
	});


	//불량유형 전체선택 click
	$('#btnAllCheck').on('click',function() {
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
		}
	});
	


	//불량유형 승인 버튼 click
	$('#btnApproval').on('click',function() {

		var check = true;
		var dataArray = new Array();
		
		if($('input[name=check]').is(":checked")!=true){
			toastr.warning("승인할 항목을 선택해주세요.");
			check = false;
			return false;
		}

		

		$('#faultyTypeTable tbody tr').each(function(index,item){
			var data = faultyTypeTable.row(this).data();
			
			if ($(this).find('td input[name=check]').is(":checked") == true) {
				var rowData = new Object();
				rowData.workOrdNo = data.workOrdNo;
				rowData.workOrdSeq = data.workOrdSeq;
				rowData.minorPrcssCd = data.minorPrcssCd;
				rowData.middlePrcssCd = data.middlePrcssCd;
				rowData.faultyTypeSeq = data.faultyTypeSeq;
				rowData.faultyTypeCd = data.faultyTypeCd;

				dataArray.push(rowData);
				console.log(rowData)
			}

			
		});

		if(check==true){
			$.ajax({
				url :  '<c:url value="po/workOrderFaultyApprove"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res){
					if(res.result=="ok"){
						toastr.success("승인되었습니다.");
						
						$('#faultyTypeTable').DataTable().ajax.reload(function(){});
					}else{
						toastr.error(res.message);
					}
				}
			});
		}
		
		
	});
	
</script>
</body>
</html>