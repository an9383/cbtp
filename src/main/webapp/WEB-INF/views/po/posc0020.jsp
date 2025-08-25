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
				<li class="breadcrumb-item"><a href="#">공정관리</a></li>
				<li class="breadcrumb-item active">생산실적(레이저)</li>
			</ol>
		</nav>
	</header>
	
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 33%;">
				<div class="card">
					<form id="formLeft">
						<div class="table-responsive">
							<table class="table table-bordered" id="">
								<colgroup>
									<col width="18%">
									<col width="32%">
									<col width="18%">
									<col width="32%">
								</colgroup>
								<tr>
									<th>작업지시번호</th>
									<td>
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="text" class="form-control" id="workOrdNoScan" style="font-size:120% !important; height: 2rem !important; background:#ffa50085;" disabled>
											<button type="button" id="btnWorkOrdNo" class="btn btn-primary input-sub-search" style="min-height : 100%;" onClick="selectWorkOrd();">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업지시일</th>
									<td><input type="text" class="form-control" id="workOrdDate" name="workOrdDate" style="text-align:center" disabled></td>
								</tr>
								<tr>
									<th>작업자</th>
									<td>
										<div class="input-sub m-0" style="max-width: 100%">
											<input type="hidden" id="workChargr"name="workChargr"> 
											<input type="text"class="form-control" style="max-width: 100%;background:#ffa50085;"id="workChargrNm" name="workChargrNm" disabled>
											<button type="button" class="btn btn-primary input-sub-search"name="btnWorkChargr" id="btnWorkChargr"  style="min-height : 100%;" onClick="selectWorkChargr();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작업구분</th>
									<td><select class="custom-select" id="workGubun" style="background:#ffa50085;" disabled></select></td>
								</tr>
								<!-- <tr>
									<th>상태</th>
									<td colspan="3">
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd1" style="font-size: 130% !important; padding: 3px 25px 3px 25px !important;">
												<input type="radio" class="W" name="btnWorkStatus" id="rd1">대기
											</label>
											<label class="btn btn-lg btn-outline-primary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 25px 3px 25px !important;">
												<input type="radio" class="S" name="btnWorkStatus" id="rd2">시작
											</label>
											<label class="btn btn-lg btn-outline-success btnWorkStatus disabled" for="rd3" style="font-size: 130% !important; padding: 3px 25px 3px 25px !important;">
												<input type="radio" class="D" name="btnWorkStatus" id="rd3">중지
											</label>
											<label class="btn btn-lg btn-outline-danger btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 25px 3px 25px !important;">
												<input type="radio" class="E" name="btnWorkStatus" id="rd4">종료
											</label>
											<label class="btn btn-lg btn-outline-dark btnWorkStatus disabled" for="rd5" style="font-size: 130% !important; padding: 3px 25px 3px 25px !important;">
												<input type="radio" class="N" name="btnWorkStatus" id="rd5">비가동
											</label>
										</div>
									</td>
								</tr> -->
								<tr><td colspan="4"style="height:20px;"></td></tr>
								<tr>
									<th>설비명</th>
									<td colspan="3">
										<div class="input-sub m-0" style="min-width : 100%">
											<input type="hidden" class="form-control" id="equipCd" disabled>
											<input type="text" class="form-control" id="equipNm" style="font-size:120% !important; height: 2rem !important; min-width : 100%; text-align: center;" disabled>
											<!-- <button type="button" id="btnEquipNm" class="btn btn-primary input-sub-search" style="min-height : 100%" onClick="equipNmOnClick();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button> -->
										</div>
									</td>
								</tr>
								<tr>
									<th>작업방식</th>
									<td><select class="custom-select" id="workMethod" style="background:#ffa50085;" disabled></select></td>
									<th>설비점검</th>
									<td><input type="text" class="form-control" style="min-width: 100%;text-align:center;cursor: pointer;background:#ffa50085;" id="equipCheck1" name="equipCheck1" onclick="equipDailyCheck('001');" placeholder="미점검" disabled readonly></td>
								</tr>
								<tr><td colspan="4"style="height:20px;"></td></tr>
								<tr>
									<th>총 퍼징횟수</th>
									<td><input type="text" class="form-control" id="totalFuzz" name="totalFuzz"  style="text-align:center;" disabled></td>
									<th>초기허용불량</th>
									<td><input type="text" class="form-control" id="initFaultyQty" name="initFaultyQty" style="min-width: 100%;text-align:center;" disabled></td> 
								</tr>
								<tr>
									<th>퍼징량(g)</th>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="fuzzQty" name="fuzzQty" onkeyup="numberFormat(this, 'float')" onchange="updateFrHist('F')" style="text-align:center;background:#ffa50085; width: 100%;" disabled>
											<!-- <select class="custom-select" id="fuzzingUnit" name="fuzzingUnit" style="width: 35%;" disabled>
												<option value="001" selected>g</option>
												<option value="002">kg</option>
											</select> -->
										</div>
									</td>
									<th>런너량(g)</th>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="runnerQty" name="runnerQty" onkeyup="numberFormat(this, 'float')" onchange="updateFrHist('R')"  style="text-align:center;background:#ffa50085; width: 100%;" disabled>
											<!-- <select class="custom-select" id="runnerUnit" name="runnerUnit" style="width: 35%;" disabled>
												<option value="001" selected>g</option>
												<option value="002">kg</option>
											</select> -->
										</div>
									</td>
								</tr>
								
								<tr><td colspan="4"style="height:20px;"></td></tr>
								<tr>
									<th>품목구분</th>
									<td><input type="text" class="form-control" id="itemGubun" name="itemGubun" style="text-align:center;" disabled></td>
									<th>차종</th>
									<td><input type="text" class="form-control" id="itemModel" name="itemModel" style="text-align:center;" disabled></td>
								</tr>
								<tr>
									<th>품번</th>
									<td><input type="text" class="form-control" id="itemCd" name="itemCd" style="text-align:center" disabled></td>
									<th>품명</th>
									<td><input type="text" class="form-control" id="itemNm" name="itemNm" style="text-align:center;" disabled></td>
								</tr>
								<tr><td colspan="4"style="height:20px;"></td></tr>
								<tr>
									<th>계획수량</th>
									<td><input type="text" class="form-control" id="workOrdQty" name="workOrdQty" style="text-align:right" disabled></td>
									<th>생산수량</th>
									<td><input type="text" class="form-control" id="outputQty" name="outputQty" style="text-align:right" disabled></td>
								</tr>
								<tr>
									<th>양품수량</th>
									<td><input type="text" class="form-control" id="fairQty" name="fairQty" style="text-align:right" disabled></td>
									<th>불량수량</th>
									<td><input type="text" class="form-control" id="faultyQty" name="faultyQty" style="text-align:right" disabled></td>
								</tr>
								<tr>
									<th>생산시간</th>
									<td>
										<div class="row">
											<!-- <input type="text" class="form-control" id="realWorkHour" name="realWorkHour" style="text-align:right;max-width:25%;background:white;border:none;" disabled>
											<label class="input-label-sm ml-2 mt-2">시간</label> -->
											<input type="text" class="form-control" id="realWorkTime" name="realWorkTime" style="text-align:right;max-width:75%;background:white;border:none;" disabled>
											<label class="input-label-sm ml-2 mt-2">분</label>
										</div>
									</td>
									<th>비가동시간</th>
									<td>
										<div class="row">
											<!-- <input type="text" class="form-control" id="nonWorkHour" name="nonWorkHour" style="text-align:right;max-width:25%;background:white;border:none;" disabled>
											<label class="input-label-sm ml-2 mt-2">시간</label> -->
											<input type="text" class="form-control" id="nonWorkTime" name="nonWorkTime" style="text-align:right;max-width:75%;background:white;border:none;" disabled>
											<label class="input-label-sm ml-2 mt-2">분</label>
										</div>
									</td>
								</tr>
								<tr><td colspan="4"style="height:20px;"></td></tr>
								<tr>
									<th>금형코드</th>
									<td><input type="text" class="form-control" id="moldNo" name="moldNo"  style="text-align:center" disabled></td>
									<th>금형위치</th>
									<td><input type="text" class="form-control" id="moldLocation" name="moldLocation"  style="text-align:center" disabled></td>
								</tr>
								<tr>
									<th>CAVITY수<br>체크</th>
									<td><select class="custom-select" id="cavityCnt" style="background:#ffa50085;" disabled></select></td>
<!-- 									<td><input type="text" class="form-control" id="equipCavity" name="equipCavity"  style="text-align:right" disabled></td> -->
									<th>금형점검</th>
									<td><input type="text" class="form-control" id="equipCheck2" name="equipCheck2" onclick="equipDailyCheck('002');"  style="text-align:center;cursor: pointer;background:#ffa50085;" placeholder="미점검" disabled readonly></td>
								</tr>
								<!--==========/table 내용 추가==========-->
							</table>
						</div>
						<div class="row">
							<label class="btn ml-1" id="btnMainWorkEnd" style="width: 20%; font-size: 120%; background: #959595;color: white;font-size: 18px;">
								<span>작업종료</span>
							</label>
							<!-- <label class="btn ml-1" id="btnMainWorkEnd" style="width: 20%; font-size: 120%; background: #959595;color: white;font-size: 18px;border-radius: 0px;">
								<span>가동내역</span>
							</label> -->
						</div>
					</form>
					<!-- /.table-responsive -->
					<!-- <button type="button" class="btn btn-primary float-right mt-2" id="btnWorkOrdSave" >저장</button> -->
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 66%;">
				<div class="card" id="formBox">	
					<div class="row">
						<table class="table table-bordered">
							<colgroup>
								<col width="12%">
								<col width="30%">
								<col width="45%">
								<col width="13%">
							</colgroup>
							<tbody>
								<tr>
									<td class="text-center text-bg" style="background:#959595;">
										<b><span class="" style="font-size: 130%; color: white;" id="workStatusNm">대기</span></b>
									</td>
									<td colspan="" class="text-center" style="font-size: 120%;font-weight: bold;">
										<div class="row">
	 										<h4 id="clock" style="margin:auto;width: 18.4rem;"></h4> 
											<!-- <span class="ml-5" id="clockChange" >▼</span> -->
										</div>
									</td>
									<td>
										<div class="" data-toggle="buttons">
											<label class="btn ml-3 mr-1" id="btnWorkStart" style="width: 20%; font-size: 120%; background: #959595;color: white;font-size: 1.2rem;">
												<span>가동시작</span>
											</label>
											<label class="btn ml-0 mr-1" id="btnWorkEnd" style="width: 20%;  font-size: 120%;background: #959595;color: white;font-size: 1.2rem;">
												<span>가동종료</span>
											</label>
											<label class="btn ml-0 mr-1" id="btnWorkNonStart" style="width: 25%; font-size: 120%; background: #959595;color: white;font-size: 1.2rem;">
												<span>비가동시작</span>
											</label>
											<label class="btn ml-0 mr-1" id="btnWorkNonEnd" style="width: 25%;  font-size: 120%;background: #959595;color: white;font-size: 1.2rem;">
												<span>비가동종료</span>
											</label>
											<!-- <label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="WS" name="btnWorkStatus" id="rd2">작업시작
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="WE" name="btnWorkStatus" id="rd4">작업종료
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd5" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="NS" name="btnWorkStatus" id="rd5">비가동시작
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd5" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="NE" name="btnWorkStatus" id="rd5">비가동종료
											</label> -->
										</div>
										<!--
										<div class="btn-group btn-group-toggle ml-4" data-toggle="buttons">
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd2" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="WS" name="btnWorkStatus" id="rd2">작업시작
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd4" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="WE" name="btnWorkStatus" id="rd4">작업종료
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd5" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="NS" name="btnWorkStatus" id="rd5">비가동시작
											</label>
											<label class="btn btn-lg btn-secondary btnWorkStatus disabled" for="rd5" style="font-size: 130% !important; padding: 3px 15px 3px 15px !important;">
												<input type="radio" class="NE" name="btnWorkStatus" id="rd5">비가동종료
											</label> 
										</div>
										-->
									</td>
									<td colspan="" class="text-center" onClick="workStandardClick()" style="background: #00a28a;">
										<b><span class="" style="font-size: 130%; color: white; cursor: pointer;">작업표준서</span></b>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<hr style="margin-top: auto;">
						<div class="card-body p-1">
							<ul class="nav nav-tabs card-header-tabs m-0 float-left">
								<li class="nav-item">
									<a class="nav-link active show disabled" data-toggle="tab" href="#tab5" id="tab5Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										작업조건
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab1" id="tab1Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										자재투입
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										생산실적등록
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="tab3Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										불량등록 
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab4" id="tab4Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										비가동등록
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" data-toggle="tab" href="#tab6" id="tab6Nav" style="font-size: 130% !important; /* padding: 5px 25px 5px 25px !important; */">
										자주검사
									</a>
								</li>
							</ul>
							<button type="button" class="btn btn-primary float-right" id="fuzzPopup" style="width:120px" disabled>퍼징기록</button>
						</div> 
					</div>
					<hr>
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade" id="tab1">
							<div class="card-body p-0">
								<label class="input-label-sm float-left">바코드 스캔</label>
								<input type="text" class="form-control float-left" id="matrlBarcodeNoScan" disabled style="min-width: 230px;">
								<!-- <button type="button" class="btn btn-primary float-right" id="btnWorkOutList" onclick="workOutWhsList();">출고내역</button> -->
								<button type="button" class="btn btn-warning float-right mr-1" id="btnMatrlRefresh" style="font-size: 120%; height: 2rem;">새로고침</button>
							</div>
							<div class="table-responsive">
								<table id="workOrderMatrlTable" class="table table-bordered">
									<colgroup>
										<col width="13%">
										<col width="13%">
										<col width="9%">
										<col width="9%">
										<col width="6%">
										<col width="6%">
										<col width="5%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="7%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>LOT NO</th>
											<th>자재명</th>
											<th>COLOR</th>
											<th class="text-center">투입일자</th>
											<th class="text-center">투입량</th>
											<th class="text-center">사용량</th>
											<th class="text-center">잔량</th>
											<th>건조기준<br>(℃)</th>
											<th>건조기준<br>(HR)</th>
											<th>건조조건<br>(℃)</th>
											<th>건조조건<br>(HR)</th>
											<th>수분측정</th>
										</tr>
<!-- 									</thead> -->
								</table>
							</div>
						</div>
						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body p-0">
								<!-- <button type="button" class="btn btn-primary float-right ml-2" name="workOrderPrcssAdd" onclick="workOrdPrcssAdd();">야간실적등록</button> -->
								<!-- <div class="row float-left">
									<input type="checkbox" class="float-left mr-2 " id="fixClock" name="fixClock" style="width:23px;">
									<label style="font-size: 16px;" class="input-label-sm">작업일자 고정</label>
								</div> -->
								<button type="button" class="btn btn-warning float-right ml-2" id="workOrderPrcssDel" name="workOrderPrcssDel">실적삭제</button>
								<button type="button" class="btn btn-primary float-right ml-2" id="workOrderPrcssAdd" name="workOrderPrcssAdd" onclick="workOrdPrcssAdd();">실적추가</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnRefresh" name="btnRefresh">새로고침</button>
								
								<!-- <div>
									<select class="custom-select" id="workGubun2" style="width:80px">
										<option value="" selected>전체</option>
										<option value="001">주간</option>
										<option value="002">야간</option>
									</select>
								</div> -->
							</div>
							<div class="table-responsive">
								<table id="workOrderPrcssTable" class="table table-bordered" style="width:100%">
									<colgroup>
										<col width="4%">
										<col width="14%">
			                            <col width="6%">
			                            <col width="8%">
			                            <col width="8%">
			                            <col width="13%">
			                            <col width="8%">
			                            <col width="7%">
			                            <col width="7%">
			                            <col width="6%">
			                            <col width="7%">
			                            <col width="7%">
			                            <col width="4%">
			                        </colgroup>
									<thead class="thead-light">
										<tr>	
											<th class="text-center">상태</th>
											<th class="text-center">LOT NO</th>
											<th class="text-center">작업구분</th>
											<th class="text-center">작업자</th>
											<th class="text-center">생산수량</th>
											<th class="text-center">완료시간</th>
											<th class="text-center">검사취출</th>
											<th class="text-center">양품수량</th>
											<th class="text-center">불량수량</th>
											<th class="text-center">불량등록</th>
											<th class="text-center">실적등록</th>
											<th class="text-center">라벨</th>
											<th class="text-center">출력</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--========tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right ml-1" id="btnInsertQty" >불량 저장</button>
								<button type="button" class="btn btn-danger float-right ml-1 d-none" id="btnFaultyClear" >초기화</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnFaultyDel" >불량 삭제</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnFaultyAdd" >불량 추가</button>
							</div>
							<div class="table-responsive">
								<table id="faultyTypeTable" class="table table-bordered">
									<colgroup>
										<col width="5%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="20%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>
												<!-- <input type="checkbox" class="checkbox_lg" id="btnAllCheck" /> -->
												No.
											</th>
											<th>LOT NO</th>
											<th>불량 발생일</th>
											<th>불량 유형</th>
											<th>불량 CAVITY 구분</th>
											<th>불량 수량</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right ml-1" id="noSave" >비가동 저장</button>
								<button type="button" id="btnNoDel" class="btn btn-warning float-right ml-1" id="" >비가동 삭제</button>
								<!-- <button type="button" class="btn btn-primary float-right ml-2" id="">수정</button> -->
								<!-- <button type="button" id="noAdd" class="btn btn-primary float-right ml-1" id="" >추가</button> -->
							</div>
							<div class="table-responsive">
								<table id="workOrderNonOperationTable" class="table table-bordered">
									<colgroup>
										<col width="13%">
										<col width="24%">
										<col width="28%">
										<col width="28%">
										<col width="7%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>비가동구분</th>
											<th>사유</th>
											<th>시작일시</th>
											<th>종료일시</th>
											<!-- <th>시작일자</th>
											<th>시작시간</th>
											<th>종료일자</th>
											<th>종료시간</th> -->
											<th>비가동시간</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--========tab5 part=====-->
						<div class="tab-pane fade active show" id="tab5">
							<div class="card-body p-0 mb-1">
								<button type="button" class="btn btn-primary float-right ml-1" id="btnWorkConSave" disabled>저장</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnWorkConEdit" disabled>등록</button>
								
								<select class="custom-select" id="histSeq" onchange="getWorkCond();" disabled></select>
							</div>      
							<form id="form">
								<div class="table-responsive">
				                	<table id="workConPopUpTable" class="table table-bordered w-100">
					               		<colgroup>
											<col width="5%">
											
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											<col width="9%">
											
											<col width="3%">
											<col width="3%">
											<col width="3%">
											
											<col width="3%">
											<col width="3%">
											<col width="3%">
											
											<col width="3%">
											<col width="3%">
											<col width="3%">
											
											<col width="3%">
											<col width="3%">
											<col width="3%">
										</colgroup> 
					                    <thead class="thead-light">
						                    <tr>
						                    	<th>목록</th>                               
						                    	<th>NZ 온도</th>                               
						                    	<th>H1 온도</th>                               
						                    	<th>H2 온도</th>                               
						                    	<th>H3 온도</th>                               
						                    	<th>H4 온도</th>                               
						                    	<th>계량위치 1차</th>                               
						                    	<th colspan="3">계량위치 2차</th>                               
						                    	<th colspan="3">계량위치 3차</th>                               
						                    	<th colspan="3">계량위치 4차</th>                               
						                    	<th colspan="3">계량완료</th>                               
						                    </tr>
						                     <tr>
						                    	<th>표준</th>                               
						                    	<td><input type="text" class="form-control work-st" id="stNzTemperature" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-st" id="stH1Temperature" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stH2Temperature" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stH3Temperature" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stH4Temperature" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stChgPosition1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stChgPosition2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stChgPosition3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stChgPosition4" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stSuckBack" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                        
						                    </tr>
						                    <tr>
						                    	<th>조건</th>                               
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdNzTemperature" name="condition" onchange="changeCond(0)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdH1Temperature" name="condition" onchange="changeCond(1)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdH2Temperature" name="condition" onchange="changeCond(2)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdH3Temperature" name="condition" onchange="changeCond(3)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdH4Temperature" name="condition" onchange="changeCond(4)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdChgPosition1" name="condition" onchange="changeCond(5)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdChgPosition2" name="condition" onchange="changeCond(6)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdChgPosition3" name="condition" onchange="changeCond(7)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdChgPosition4" name="condition" onchange="changeCond(8)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdSuckBack" name="condition" onchange="changeCond(9)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                       
						                    </tr>
						                    <tr><td colspan="4"style="height:10px;"></td></tr>
						                    <tr>
						                    	<th>목록</th>                               
						                    	<th>레이저압력 1차</th>                               
						                    	<th>레이저압력 2차</th>                               
						                    	<th>레이저압력 3차</th>                               
						                    	<th>레이저속도 1차</th>                               
						                    	<th>레이저속도 2차</th>                               
						                    	<th>레이저속도 3차</th>                               
						                    	<th colspan="3">레이저위치 1차</th>                               
						                    	<th colspan="3">레이저위치 2차</th>                               
						                    	<th colspan="3">레이저위치 3차</th>                               
						                    	<th colspan="3"></th>                               
						                    </tr>
						                    <tr>
						                    	<th>표준</th>                               
						                    	<td><input type="text" class="form-control work-st" id="stInjPressure1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-st" id="stInjPressure2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stInjPressure3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stInjVelocity1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stInjVelocity2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stInjVelocity3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stInjPosition1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stInjPosition2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stInjPosition3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td> 
						                   		<td colspan="3"></td>       
						                    </tr>
						                    <tr>
						                    	<th>조건</th>                               
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPressure1" name="condition" onchange="changeCond(10)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPressure2" name="condition" onchange="changeCond(11)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPressure3" name="condition" onchange="changeCond(12)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjVelocity1" name="condition" onchange="changeCond(13)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjVelocity2" name="condition" onchange="changeCond(14)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjVelocity3" name="condition" onchange="changeCond(15)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPosition1" name="condition" onchange="changeCond(16)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPosition2" name="condition" onchange="changeCond(17)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdInjPosition3" name="condition" onchange="changeCond(18)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                        
						                   		<td colspan="3"></td>                        
						                    </tr>
						                    <tr><td colspan="4"style="height:10px;"></td></tr>
						                    <tr>
						                    	<th>목록</th>                               
						                    	<th>배압 1차</th>                               
						                    	<th>배압 2차</th>                               
						                    	<th>배압 3차</th>                               
						                    	<th>배압 4차</th>                               
						                    	<th>보압 1차</th>                               
						                    	<th>보압 2차</th>                               
						                    	<!-- <th colspan="3">보압 3차</th>   -->                             
						                    	<th colspan="3">보압속도 1차</th>                               
						                    	<th colspan="3">보압속도 2차</th>                               
						                    	<th colspan="3">쿠션량</th>                               
						                    </tr>
						                     <tr>
						                    	<th>표준</th>                               
						                    	<td><input type="text" class="form-control work-st" id="stBackPressure1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-st" id="stBackPressure2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stBackPressure3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-st" id="stBackPressure4" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stHldPressure1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-st" id="stHldPressure2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    	<!-- <td colspan="3"><input type="text" class="form-control work-st" id="stHldPressure3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>  -->                          
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stHldVel1" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stHldVel2" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-st" id="stHldVel3" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                           
						                    </tr>
						                    <tr>
						                    	<th>조건</th>                               
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdBackPressure1" name="condition" onchange="changeCond(19)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdBackPressure2" name="condition" onchange="changeCond(20)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdBackPressure3" name="condition" onchange="changeCond(21)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                            
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdBackPressure4" name="condition" onchange="changeCond(22)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHldPressure1" name="condition" onchange="changeCond(23)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHldPressure2" name="condition" onchange="changeCond(24)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                           
						                    	<!-- <td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHldPressure3" name="condition" onchange="changeCond(25)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>  -->                          
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHldVel1" name="condition" onchange="changeCond(25)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                              
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHldVel2" name="condition" onchange="changeCond(26)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                             
						                    	<td colspan="3"><input type="text" class="form-control work-cd" onkeyup="" id="cdHldVel3" name="condition" style="background: #eeeeee;border: white;text-align: center; color:#ff0000;" disabled/></td>                                             
						                    </tr>
						                    <tr><td colspan="4"style="height:10px;"></td></tr>
						                    <tr>
						                    	<th>목록</th>                               
						                    	<th>온도조절기</th>                               
						                    	<th>작동유</th>                               
						                    	<th>냉각수 IN</th>                               
						                    	<th>냉각수 OUT</th>                               
						                    	<th>고정측 온도</th>                               
						                    	<th>이동측 온도</th>
						                    	<th colspan="6" class="1cha" style="border-top: solid 2px #959595b8;border-left: solid 2px #959595b8;">내측 고정측 온도</th>                               
						                    	<th colspan="6" class="1cha" style="border-top: solid 2px #959595b8;border-right: solid 2px #959595b8;">내측 이동측 온도</th>
						                    </tr>
						                    <tr>
						                    	<th>표준</th>                               
						                    	<td><input type="text" class="form-control work-st" id="stThermostat" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>  
						                    	<td><input type="text" class="form-control work-st" id="stHydraulicOil" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                   		<td>
						                    		<div class="row">
														<label class="input-label-sm ml-1 mr-0" style=" height: 2rem;font-size: 120%;">±</label>
														<input type="text" class="form-control work-st" id="stCoolwaterIn" name="stand" style="background: #ffffff;border: none;text-align: center;width:50%;" disabled>
														<label class="input-label-sm mr-0" style=" height: 2rem;font-size: 120%;">℃</label>
													</div>
						                    	</td>                        
						                    	<td colspan=""> 
						                    		<div class="row">
														<label class="input-label-sm ml-1 mr-0" style=" height: 2rem;font-size: 120%;">±</label>
														<input type="text" class="form-control work-st" id="stCoolwaterOut" name="stand" style="background: #ffffff;border: none;text-align: center; width:50%;" disabled/>
														<label class="input-label-sm mr-0" style=" height: 2rem;font-size: 120%;">℃</label>
													</div>
						                    	</td>                      
						                    	<td><input type="text" class="form-control work-st" id="stMoldFixed" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-st" id="stMoldMoving" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" style="border-left: solid 2px #959595b8; text-align:center;">
						                    		<input type="text" class="form-control work-st" id="inFixedOne" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/>
						                    	</td>  
						                    	<td colspan="2" class="1cha" style="text-align:center;"><input type="text" class="form-control work-st" id="inFixedTwo" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" style="text-align:center;"><input type="text" class="form-control work-st" id="inFixedThree" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" style="text-align:center;"><input type="text" class="form-control work-st" id="inMovingOne" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" style="text-align:center;"><input type="text" class="form-control work-st" id="inMovingTwo" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" style="border-right: solid 2px #959595b8;text-align:center;">
						                    		<input type="text" class="form-control work-st" id="inMovingThree" name="stand" style="background: #ffffff;border: none;text-align: center;" disabled/>
						                    	</td>                          
						                    	                         
						                    </tr>
						                    <tr>
						                    	<th>조건</th>                               
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdThermostat" name="condition" onchange="changeCond(28)" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdHydraulicOil" name="condition" onchange="changeCond(29)" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>   
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdCoolwaterIn" name="condition" onchange="" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdCoolwaterOut" name="condition" onchange="changeCond(30)" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdMoldFixed" name="condition" onchange="changeCond(31)" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>                          
						                    	<td><input type="text" class="form-control work-cd" onkeyup="numberFormat(this, 'float')" id="cdMoldMoving" name="condition" onchange="changeCond(32)" style="background: #eeeeee;text-align: center;border:white;" disabled/></td>                                 
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-left: solid 2px #959595b8; border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inFixTemp1" name="condition" onchange="changeCond(33)"style="background: #eeeeee;border: white;text-align: center;" disabled/></td>  
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inFixTemp2" name="condition" onchange="changeCond(34)"style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inFixTemp3" name="condition" onchange="changeCond(35)"style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inMoveTemp1" name="condition" onchange="changeCond(36)"style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inMoveTemp2" name="condition" onchange="changeCond(37)"style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    	<td colspan="2" class="1cha" onkeyup="numberFormat(this, 'float')" style="border-right: solid 2px #959595b8; border-bottom: solid 2px #959595b8;"><input type="text" class="form-control work-st" id="inMoveTemp3" name="condition" onchange="changeCond(38)" style="background: #eeeeee;border: white;text-align: center;" disabled/></td>                          
						                    </tr>
					                    </thead>
									</table>
								</div>
							</form>
						</div>
						<!--========tab6 part=====-->
						<div class="tab-pane fade" id="tab6">
						
						
							<form id="form8" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tr>
											<th colspan="4">제품사진</th>
										</tr>
										<tr>
											<th>사진1</th>
											<th>사진2</th>
											<th>사진3</th>
											<th>사진4</th>
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
							<div class="card-body p-0">
								<div class="card-body col-sm-12 p-1">	
																
									<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup1">초물</button>	
									<button type="button" class="btn btn-primary float-left mr-1" 	id="btnInspPopup2">중물</button>
									<button type="button" class="btn btn-primary float-left mr-5" 	id="btnInspPopup3">종물</button>
									<div class="row float-left">
										<input type="checkbox" class="float-right mr-2 " id="ckMdInspectNo" name="ckMdInspectNo" style="width:23px;">
										<label style="font-size: 16px;" class="input-label-sm">중물검사안함</label>
									</div>
								</div>
								<hr>
								<div class="card-body col-sm-12 p-1 d-none" id="jajuHd">
									<button type="button" class="btn btn-primary" id="btnExt">외관</button>
									<button type="button" class="btn btn-primary" id="btnSize">치수</button>
									<button type="button" class="btn btn-primary" id="btnWeight">중량</button>
									
									<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnInspSave">저장</button>
									<!-- <button type="button" class="btn btn-warning float-right mr-1" id="btnInspEdit">수정</button> -->
									<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
								</div>
								<hr>
								<div class="table-responsive d-none" id="extAdmTableDiv">
									<table class="table table-bordered" id="extAdmTable" style="width:100%;">
<%-- 										<colgroup> --%>
<%-- 											<col width="3%"> --%>
<%-- 											<col width="40%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 											<col width="8%"> --%>
<%-- 										</colgroup> --%>
										<thead>
											<tr>
												<th rowspan="2" style="min-width:40px;">순번</th>
												<th rowspan="2" style="min-width:450px;">기준</th>
												<th rowspan="2" style="min-width:80px;">확인방법</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt">CVT.1</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh2">CVT.2</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh3">CVT.3</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh4">CVT.4</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh5">CVT.5</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh6">CVT.6</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh7">CVT.7</th>
												<th colspan="3" style="min-width:270px;" class="th-cvt" id="blueTh8">CVT.8</th>
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
												<th rowspan="2" style="min-width:40px;">순번</th>
												<th rowspan="2" style="min-width:100px;">목록</th>
												<th rowspan="2" style="min-width:80px;">확인방법</th>
												<th colspan="2" style="min-width:200px;">기준</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt">CVT.1</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo2">CVT.2</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo3">CVT.3</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo4">CVT.4</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo5">CVT.5</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo6">CVT.6</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo7">CVT.7</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThTwo8">CVT.8</th>
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
												<th rowspan="2" style="min-width:40px;">순번</th>
												<th rowspan="2" style="min-width:100px;">목록</th>
												<th rowspan="2" style="min-width:80px;">확인방법</th>
												<th colspan="2" style="min-width:200px;">기준</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt">CVT.1</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne2">CVT.2</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne3">CVT.3</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne4">CVT.4</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne5">CVT.5</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne6">CVT.6</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne7">CVT.7</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThOne8">CVT.8</th>
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
												<th rowspan="2" style="min-width:40px;">순번</th>
												<th rowspan="2" style="min-width:100px;">목록</th>
												<th rowspan="2" style="min-width:80px;">확인방법</th>
												<th colspan="2" style="min-width:200px;">기준</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt">CVT.1</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei2">CVT.2</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei3">CVT.3</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei4">CVT.4</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei5">CVT.5</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei6">CVT.6</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei7">CVT.7</th>
												<th colspan="3" style="min-width:300px;" class="th-cvt" id="blueThWei8">CVT.8</th>
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
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
	
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
	                			<col width="6%">
	                			<col width="11%">
	                			<col width="11%">
	                			<col width="10%">
	                			<col width="5%">
	                			<col width="5%">
	                			<col width="7%">
	                			<col width="7%">
	                			<col width="5%">
	                			<col width="6%">
	                		</colgroup>
		                    <thead class="thead-light">
			                    <tr>
			                    	<th>품목구분</th>
			                    	<th>설비명</th>
			                    	<th>작지번호</th>
			                    	<th>작업자</th>
			                    	<th>품번</th>
			                    	<th>품명</th>
			                    	<th>차종</th>   
			                    	<th>지시수량</th> 
			                    	<th>생산수량</th>
			                    	<th>작업지시일</th>  
			                    	<th>생산일자</th>   
			                    	<th>긴급여부</th>      
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
	<!-- 불량등록 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="baseInfoFtPopUpModal" tabindex="-1" role="dialog" aria-labelledby="baseInfoFtPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
		    	<div class="modal-header pb-0">
		        	<h4>불량유형 조회</h4>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true" style="font-size: xx-large;">&times;</span>
		        	</button>
		      	</div> 
		      	<div class="modal-body">
		      		<hr class="text-secondary">	         
	                	<table id="baseInfoFtPopUpTable" class="table table-bordered" style="width:100%">
	               		<colgroup>
							<col width="25%">
							<col width="40%">
							<col width="35%">
						</colgroup>
	                    <thead class="thead-light">
		                    <tr>
		                    	<th>불량코드</th>
		                    	<th>불량유형명</th>
		                    	<th>비고</th>                                   
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
	<!-- 불량등록 모달 종료-->
	<!-- 츨고조회 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="preOutWhsBarcodePopupModal"tabindex="-1" role="dialog" aria-labelledby="preOutWhsBarcodePopupLabel"aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="preOutWhsBarcodePopupLabel">출고내역 조회</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive" style="height: 600px;">
						<table id="preOutWhsBarcodePopupTable" class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">작업지시번호</th>
									<th class="text-center">BarcodeNo</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">차종</th>
									<th class="text-center">총 소요량</th>
									<th class="text-center">현장입고수량</th>
									<th class="text-center">투입수량</th>
									<th class="text-center">투입여부</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 출고조회 모달 끝-->
	<!-- 퍼징모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="fuzzPopupModal"tabindex="-1" role="dialog" aria-labelledby="fuzzPopupLabel"aria-hidden="true">
		<div class="modal-dialog modal-lg" style="min-width: 60rem;" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="fuzzPopupLabel">퍼징기록일지</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<button type="button" class="btn btn-primary float-right mb-2" id="fileReferenceBtn" style="font-size: 120%; height: 2rem;" onclick="fileReferenceClick();">퍼징기준서</button>
					<div class="table-responsive">
						<table id="fuzzPopupTable" class="table table-bordered">
							<thead>
								<tr>
									<th colspan="10">퍼징기록일지</th>
								</tr>
								<tr>
									<th colspan="2">1차</th>
									<th colspan="2">2차</th>
									<th colspan="2">3차</th>
									<th colspan="2">4차</th>
									<th colspan="2">5차</th>
								</tr>
								<tr>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_01_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_01_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_02_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_02_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_03_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_03_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_04_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_04_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_05_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_05_end')">종료시간</td>
								</tr>
								<tr>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_01_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_01_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_02_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_02_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_03_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_03_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_04_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_04_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_05_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_05_end" ></th>
								</tr>
								<tr>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_01_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_02_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_03_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_04_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_05_value" name="fuzzCnt"></th>
								</tr>
								<tr>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_01_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_02_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_03_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_04_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_05_gubun" name="fuzzGubun"></select></th>
								</tr>
								<tr><td colspan="10" style="height: 5rem;"></td></tr>
								<tr>
									<th colspan="2">6차</th>
									<th colspan="2">7차</th>
									<th colspan="2">8차</th>
									<th colspan="2">9차</th>
									<th colspan="2">10차</th>
								</tr>
								<tr>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_06_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_06_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_07_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_07_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_08_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_08_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_09_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_09_end')">종료시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_10_start')">시작시간</td>
									<td class="text-center td-hover" style="cursor:pointer;" onclick="fuzzTime('fuzz_10_end')">종료시간</td>
								</tr>
								<tr>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_06_start"></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_06_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_07_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_07_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_08_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_08_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_09_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_09_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_10_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz_10_end" ></th> 
								</tr>
								<tr>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_06_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_07_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_08_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_09_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control text-center" onkeyup="numberFormat(this, 'float')" id="fuzz_10_value" name="fuzzCnt"></th>
								</tr>
								<tr>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_06_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_07_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_08_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_09_gubun" name="fuzzGubun"></select></th>
									<th colspan="2" class="p-0"><select class="custom-select" id="fuzz_10_gubun" name="fuzzGubun"></select></th>
								</tr>
								<!-- 
								<tr>
									<th colspan="20">30분 이상 재가동시 퍼징 기록 ( 계획정지 )</th>
								</tr>
								<tr>
									<th colspan="2">1</th>
									<th colspan="2">2</th>
									<th colspan="2">3</th>
									<th colspan="2">4</th>
									<th colspan="2">5</th>
									<th colspan="2">6</th>
									<th colspan="2">7</th>
									<th colspan="2">8</th>
									<th colspan="2">9</th>
									<th colspan="2">10</th>
								</tr>
								<tr>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_01_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_01_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_02_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_02_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_03_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_03_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_04_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_04_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_05_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_05_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_06_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_06_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_07_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_07_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_08_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_08_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_09_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_09_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_10_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz2_10_end')">종료시간</td>
								</tr>
								<tr>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_01_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_01_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_02_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_02_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_03_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_03_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_04_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_04_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_05_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_05_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_06_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_06_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_07_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_07_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_08_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_08_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_09_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_09_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_10_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime"  id="fuzz2_10_end" ></th>
								</tr>
								<tr>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_01_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_02_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_03_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_04_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_05_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_06_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_07_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_08_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_09_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz2_10_value" name="fuzzCnt"></th>
								</tr>
								<tr>
									<th colspan="20">설비이상 및 품질문제 후 재가동시 기록 ( 비계획정지 )</th>
								</tr>
								<tr>
									<th colspan="2">1</th>
									<th colspan="2">2</th>
									<th colspan="2">3</th>
									<th colspan="2">4</th>
									<th colspan="2">5</th>
									<th colspan="2">6</th>
									<th colspan="2">7</th>
									<th colspan="2">8</th>
									<th colspan="2">9</th>
									<th colspan="2">10</th>
								</tr>
								<tr>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_01_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_01_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_02_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_02_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_03_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_03_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_04_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_04_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_05_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_05_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_06_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_06_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_07_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_07_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_08_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_08_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_09_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_09_end')">종료시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_10_start')">시작시간</td>
									<td class="text-center td-hover" onclick="fuzzTime('fuzz3_10_end')">종료시간</td>
								</tr>
								<tr>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_01_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_01_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_02_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_02_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_03_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_03_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_04_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_04_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_05_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_05_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_06_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_06_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_07_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_07_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_08_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_08_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_09_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_09_end" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_10_start" ></th>
									<th class="p-0"><input type="text" class="form-control fuzzTime" id="fuzz3_10_end" ></th>
								</tr>
								<tr>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_01_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_02_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_03_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_04_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_05_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_06_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_07_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_08_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_09_value" name="fuzzCnt"></th>
									<th colspan="2" class="p-0"><input type="text" class="form-control" onkeyup="numberFormat(this, 'float')" id="fuzz3_10_value" name="fuzzCnt"></th>
								</tr>
								-->
							</thead>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="fuzzSave">저장</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- 퍼징,런너 모달 끝-->
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
	<!------------모달full screen------------>
	<div class="modal fade" id="workStandardModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close">       </span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="workStandardImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!------------/모달------------>
<!-- 정보 변환 여부 -->
<div class="modal fade bd-example-modal-lg" id="clockModal" tabindex="-1" role="dialog" aria-labelledby="clockModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width:600px;">
      <div class="modal-header">
        <h5 class="modal-title" id="clockModalLabel">작업일자 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body p-3" style="text-align: center;">
      	<select class="" id="selectYear1" style="width: 80px;"></select>&nbsp;년&nbsp;&nbsp;
      	<select class="" id="selectMon" style="width: 60px;"></select>&nbsp;월&nbsp;&nbsp;
      	<select class="" id="selectDate" style="width: 60px;"></select>&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<select class="" id="selectHour" style="width: 60px;"></select>&nbsp;시&nbsp;&nbsp;
      	<select class="" id="selectMin" style="width: 60px;"></select>&nbsp;분
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="changOk" data-dismiss="modal">적용</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제 모달 -->
<div class="modal modal-alert fade" id="workDeleteModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="workDeleteModal" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width: 40vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 id="exampleModalAlertWarningLabel" class="modal-title" style="font-size: 2vw;">
					<i class="fa fa-bullhorn text-warning mr-1"></i> 작업 종료
				</h5>
			</div>
			<div class="modal-body">
				<p style="font-size: 25px;">작업종료된 데이터는 더 이상 생산실적을 등록 하실 수 없습니다.<br>그래도 작업종료하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnWorkDeleteConfirm" style="font-size: 1vw;">예, 작업종료 하겠습니다.</button>
				<button class="btn btn-danger d-none" id="btnDeleteConfirmLoading" type="button" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
				&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 1vw;">아니요</button>
			</div>
		</div>
	</div>
</div>
<!-- 일상점검 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="equipCheckPopupModal"tabindex="-1" role="dialog" aria-labelledby="equipCheckPopupLabel"aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="equipCheckPopupLabel"><span id="equipModalLabel"></span>일상점검</h5>
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="table-responsive" >
					<table id="equipCheckPopupTable" class="table table-bordered" style="width:100%">
						<colgroup>
							<col width="10%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">점검항목</th>
								<th class="text-center">점검방법</th>
								<th class="text-center">SPEC</th>
								<th class="text-center">점검</th>
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
	<!-- 일상점검 모달 끝-->
	<!-- 통합자료실 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="fileReferencePopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipRestartPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width:1500px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipRestartPopUpLabel"></h5>
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
<%@include file="../layout/bottom.jsp"%>
<style>
.border-gubun {
	border-right:solid 2px #337ab7;
	border-left: solid 2px #337ab7;
	
	border-top: solid 2px #337ab7;
}
.td-hover:hover{
  background-color: lightgray;
} 
.highlight:hover {
	background-color: #ECFFB3;
}

</style>

<script>

	let currentHref = "posc0021";
	//let currentPage = $('.' + currentHref).attr('id');
	
	//$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	//$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","생산실적(레이저)");
	
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
		$('#fixClock').css('font-size','').css('height','');


		$('.th-cvt').css('background-color','#6bbcfb')
	});
	
	
	let saveState = 'add';
	let saveUrl = '';
	let workOrdNoVal = '';
	let workOrdSeqVal = '';
	let ordLotNoVal = '';
	let itemCdVal = '';
	let itemNmVal = '';
	let itemRevVal = '';
	let inspectGubunVal = '';
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
	let partCdVal = '';
	let partRevVal = '';
	let barcodeNoVal = '';
	let itemSeqVal = '';
	let btnWorkStatus = '';
	let selStartDateVal = moment().subtract(6, 'd').format('YYYYMMDD');
	let selEndDateVal = moment().format('YYYYMMDD');
	let workStartTimeVal = '';
	let workEndTimeVal = '';

	
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
	let equipCdVal;
	let moldCdVal;
	let equipCheckCdVal;
	let checkPassVal;
	let fileGubunVal;
	let matrlDateVal;
	var timer;
	var equipListVal;
	var noStartTimeVal='';
	var partReqNo;
	var partReqSeq;
	var reqStatus;
	var equipGubunVal = null;
	var mainGubun = null;
	var itemGubun = "001";
	var workEmerYn = null;
	var workStatusText = null;
	var bgColor = null;
	var workGubunVal = "";
	var mainWorkStatusCd = "";
	//var workGubun2 = "";
	var workStatusCdVal = null;	//작업상태값
	var inLocVal = null;
	var inAreaVal = null;
	var inFloorVal = null;
	var locationNoVal = null;

	var	outLocVal = null;	//설비창고
	var	outAreaVal = null;	//설비구역
	var	outFloorVal = null;	//설비위치
	var	outLocNoVal = null;	//설비창고번호
		
	var boxCount = null;
	var cavityArr = new Array();
	
	//공정검사 데이터 끝
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	let choice = ''; //비가동등록 삭제
	let workChargr = '';
	let workChargrNm = '';
	let workOrderObject = new Object();
	let endDeadlineState = ''; // 종료버튼 혹은 마감버튼 클릭 여부
	let endModalSaveState = ''; // 종료 및 마감 모달에서 종료일 경우 등록버튼을 눌렀는지 여부

	let boxLebelType = ''; // 라벨 프린트할 종류
	
	//공통코드 처리 시작   
	let equipGubunCode = new Array();	// 설비구분 목록
    <c:forEach items = "${equipGubun}" var = "info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
    </c:forEach>
    
    let baseInfoGubunCode = new Array(); // 공정불량 목록
    <c:forEach items="${baseInfoAdmList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseInfoCd}";
	json.baseNm = "${info.baseInfoNm}";
	baseInfoGubunCode.push(json);
	</c:forEach>
		
	let workMethod = new Array();	//작업방식
    <c:forEach items="${workMethod}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workMethod.push(json);
	</c:forEach>
	
	let workGubun = new Array();	//작업구분
    <c:forEach items="${workGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workGubun.push(json);
	</c:forEach>
	
	let noGubunCode = new Array();	//비가동구분
    <c:forEach items="${noGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	noGubunCode.push(json);
	</c:forEach>

	let workEmerYnCode = new Array(); //긴급여부
	<c:forEach items="${workEmerYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	let inspectGubunCode = new Array(); //검사취출
	<c:forEach items="${inspectGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	inspectGubunCode.push(json1);
	</c:forEach>

	let histSeqCode = new Array(); //작업조건차수
	<c:forEach items="${histSeq}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	histSeqCode.push(json1);
	</c:forEach>

	let judgeCode = new Array();	//판정
    <c:forEach items="${judge}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	judgeCode.push(json);
	</c:forEach>

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

	let silhangCode = new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	silhangCode.push(json);
	</c:forEach>

	let fuzzGubunCode = new Array();	//퍼징구분
    <c:forEach items="${fuzzGubun}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	fuzzGubunCode.push(json);
	</c:forEach>
	
	let cavityCntCode = new Array();	//퍼징구분
    <c:forEach items="${cavityCnt}" var="info">
	var json=new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}" + "개";
	cavityCntCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   
	
	selectBoxAppend(workMethod, "workMethod", "", "2");	
	selectBoxAppend(workGubun, "workGubun", "", "2");	
	selectBoxAppend(histSeqCode, "histSeq", "", "");	
	selectBoxAppend(cavityCntCode, "cavityCnt", "001", "");	

	var year = "";
	var month = "";
	var date = "";
	var day = "";
	var hours = "";
	var minutes = "";
	var seconds = "";
	
	//---------작업일자 처리 시작
	function clock(){
		now = new Date();
		year = now.getFullYear();
		month = now.getMonth();
		date = now.getDate();
		day = now.getDay();
		week = ['일','월','화','수','목','금','토'];
		hours = now.getHours();
		minutes = now.getMinutes();
		seconds = now.getSeconds();
		$('#clock').text(year+"-"+((month+1)<10?"0"+(month+1):(month+1))+'-'+(date<10?"0"+date:date)+' '+(hours<10?"0"+hours:hours)+':'+(minutes<10?"0"+minutes:minutes)+':'+(seconds<10?"0"+seconds:seconds));
	}
	function init(){
		clock();
		setInterval(clock,1000);
	}
	var changeOk = true;
	if(changeOk){
		init();
	}

	var clockChange = false;
	var rowVal = "";
	
	//▼ 버튼 클릭시
	//$('#clockChange').on('click',function(){

	function getFixClock(row){

		rowVal = row;
		$('#selectYear1').empty();
		$('#selectMon').empty();
		$('#selectDate').empty();
		$('#selectHour').empty();
		$('#selectMin').empty();

		var inHtml = "";
		//년
		for (var i=year-5; i<=year+5; i++) {
			if(year==i){
				 inHtml += "<option value='" + i + "' selected>" + i + "</option>";
			}else{
				 inHtml += "<option value='" + i + "' >" + i + "</option>";
			}
	    }
		$('#selectYear1').append(inHtml);

		//월
		inHtml = "";
		let m = null;
		for (var i = 1; i <= 12; i++) {
		    if (i >= 1 && i < 10) {
		        m = "0" + i;
		    }else {
		    	m = i;
		    }
		    
		    if(month+1==i){
		    	inHtml += " <option value='" + m + "' selected>" + m + "</option>";
			}else{
				inHtml += " <option value='" + m + "' >" + m + "</option>";
			}
  			
		}
		$('#selectMon').append(inHtml);

		//일
		inHtml = "";
		let d = null;
		var dt2 = new Date(year, month+1, "");
		var lastDay = dt2.getDate();
		
	    for (var i = 1; i <= lastDay; i++) {
	        if (i >= 1 && i < 10) {
	            d = "0" + i;
	        } else {
	        	d = i;
	        }
	        if(date==i){
	        	inHtml += " <option value='" + d + "' selected>" + d + "</option>";
			}else{
				inHtml += " <option value='" + d + "' >" + d + "</option>";
			}
	    }
	    $('#selectDate').append(inHtml);

	    
		//시
		inHtml = "";
		let h = null;
	    for (var i = 1; i <= 24; i++) {
	        if (i >= 1 && i < 10) {
	        	h = "0" + i;
	        } else {
	        	h = i;
	        }
	        if(hours==i){
	        	inHtml += " <option value='" + h + "' selected>" + h + "</option>";
			}else{
				inHtml += " <option value='" + h + "' >" + h + "</option>";
			}
	    }
	    $('#selectHour').append(inHtml);

	  	//분
		inHtml = "";
		let mi = null;
	  	for (var i = 0; i <= 60; i++) {
			
	        if (i >= 0 && i < 10) {
	        	mi = "0" + i;
	        } else {
	        	mi = i;
	        }
	        if(minutes==i){
	        	inHtml += " <option value='" + mi + "' selected>" + mi + "</option>";
			}else{
				inHtml += " <option value='" + mi + "' >" + mi + "</option>";
			}
		}
		    
	    $('#selectMin').append(inHtml);
	    
		$('#clockModal').modal('show');
	}
		
	let changeClockVal = "";
	//적용버튼 클릭시
	$('#changOk').on('click',function(){
		//changeOk = false;
		year = $('#selectYear1 option:selected').val();
		month = $('#selectMon option:selected').val();
		date = $('#selectDate option:selected').val();
		hours = $('#selectHour option:selected').val();
		minutes = $('#selectMin option:selected').val();

		changeClockVal = year+'-'+month+'-'+date+' '+hours+':'+minutes;
		clockChange = true;

		barcodePrint(rowVal);
		
		//$('#clock').text(year+'-'+month+'-'+date+' '+hours+':'+minutes);
	}); 
	
	//---------작업일자 처리 종료
	
	function selectBoxHtmlFaultyType(obj, id, sVal, row, meta)
	{
		//$('#'+ id).empty();
		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select custom-select-sm" id="'+ id +'" name="faultyTypeCd" data-col="' + meta.col + '" style="min-width: 100%;"><option value="">선택</option>';
		//var shtml = '<select class="mySelect" data-col="' + meta.col + '" ><option value="">선택</option>';
		
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

	//셀렉트박스생성
	function selectBoxHtml2(obj, name, sVal, row, meta) {
		var shtml = '';
		if(sVal==null){
			shtml = '<select class="custom-select" name="'+ name +'" data-col="' + meta.col + '">';
		}else{
			shtml = '<select class="custom-select" name="'+ name +'" data-col="' + meta.col + '" disabled style="color:black;">';
		}
		var option ='<option value="">선택</option>';
		
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>" + obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	
	//자재투입탭 클릭시
	$('#tab1Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}

		$('#matrlBarcodeNoScan').attr('disabled',false);
		$('#fuzzPopup').addClass('d-none');
	});

	//생산실적등록탭 클릭시
	$('#tab2Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}

		$('#workOrderPrcssTable button').css('font-size','100%');	//생산실적 테이블안에 버튼크기(100%)

		setTimeout(function(){
			workOrderPrcssTable.draw();
			workOrderPrcssTable.draw();
		},500);

		$('#fuzzPopup').addClass('d-none');
	});


	var lotNoArr = new Array();
	//불량등록 클릭시
	$('#tab3Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}
		
		lotNoArr = [];
		//lotNo 배열 생성
		$.ajax({
			url: '<c:url value="/po/workOrderPrcssList"/>',
         	type : 'GET',
         	data : {
        	 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
        	 'itemSeq' : function(){return itemSeqVal},
         	},
         	success : function(res){
             	let data = res.data;
				for(var i=0; i<data.length; i++){
					if(data[i].ordLotNo!=null){
						if(data[i].workStatus=="001"){
							var json = new Object();
							json.baseCd = data[i].workOrdSeq;
							json.baseNm = data[i].ordLotNo;
							lotNoArr.push(json);
						}
					}
				}
            }
		})
		$('#fuzzPopup').addClass('d-none');
	});

	//비가동등록탭 클릭시
	$('#tab4Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}
		$('#fuzzPopup').addClass('d-none');
	});

	//작업조건탭 클릭시
	$('#tab5Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}
		$('#fuzzPopup').removeClass('d-none');
	});

	//자주검사 클릭시
	$('#tab6Nav').on('click',function(){
		if(!$.trim($('#workOrdNoScan').val())){
			toastr.warning("작업지시번호를 선택해주세요.");
			return false;
		}
		
		if(workStatusVal=='001'){
			toastr.warning("실적등록 하지 않은 LOTNO 입니다.");
			return false;
		}

		if(workStatusVal=='003'){
			toastr.warning("불량 LOTNO 입니다.");
			return false;
		}
			
		if((inspectGubunVal==null || inspectGubunVal=='')){
			toastr.warning("검사취출이 초/중/종물에 해당하지 않은 LOTNO 입니다.");
			return false;
		}
		
		
		$('#fuzzPopup').addClass('d-none');
		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');	
		$('#weightTableDiv').addClass('d-none');
		$('#jajuHd').addClass('d-none');

		$('#btnInspPopup1').trigger('click');
		
		imgPrint();
		
	});


	var equipCheckPopupTable = $('#equipCheckPopupTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : 10, 
		ajax : {
			url : '<c:url value="po/workOrderEquipDailyCheckList"/>',
			type : 'GET',
			data : {
				'workOrdNo'	:	function(){return workOrdNoVal;},
				'mainGubun'	:	function(){return equipGubunVal;},
				'equipCd'	:	function(){return equipCheckCdVal;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				},
				'className' : 'text-center'
			},
			{
				data : 'checkList',
				'className' : 'text-center'
			},
			{
				data : 'checkMethod',
				'className' : 'text-center'
			},
			{
				data : 'checkSpec',
				'className' : 'text-center'
			},
			{
				data : 'checkPass',
				render : function(data, type, row, meta) {
					var html="";
					if(row['inspInputMethod']=="001"){
						if(data!=null && data!=""){
							if(data=="OK"){
								html = '<span class="btn" style="cursor: pointer;font-size: 1.5rem; width: 100%;" id="checkPass_'+row['checkSeq']+'" name="checkPass" value="'+row['checkPass']+'" onclick="equipCheck('+row['checkSeq']+');">●</span>';
								html += '<input type="hidden" id="checkResult_'+row['checkSeq']+'" name="checkResult" value="">';
								
							}else{
								html = '<span class="btn" style="cursor: pointer;color:red; font-size: 1.5rem; width: 100%;" id="checkPass_'+row['checkSeq']+'" value="'+row['checkPass']+'" name="checkPass" onclick="equipCheck('+row['checkSeq']+');">●</span>';
								html += '<input type="hidden" id="checkResult_'+row['checkSeq']+'" name="checkResult" value="">';
							}
						}else{
							html = '<span class="btn" style="cursor: pointer; color:lightgray; font-size: 1.5rem; width: 100%;" id="checkPass_'+row['checkSeq']+'" value="'+row['checkPass']+'" name="checkPass" onclick="equipCheck('+row['checkSeq']+');">●</span>';
							html += '<input type="hidden" id="checkResult_'+row['checkSeq']+'" name="checkResult" value="">';
						}
					}else{
						if(data!=null && data!=""){
							if(data=="OK"){
								html = '<input type="text" class="form-control p-3" onkeyup="numberFormat(this, \'float\')" value="'+row['checkResult']+'" style="color:black; background:white;font-size: 1.3rem;text-align: center;" onchange="equipCheck2('+row['checkSeq']+')" id="checkResult_'+row['checkSeq']+'" name="checkResult">';
								html += '<input type="hidden" id="checkPass_'+row['checkSeq']+'" name="checkPass" value="'+row['checkPass']+'">';
								
							}else{
								html = '<input type="text" class="form-control p-3" onkeyup="numberFormat(this, \'float\')" value="'+row['checkResult']+'" style="color:black; background:red;font-size: 1.3rem;text-align: center;" onchange="equipCheck2('+row['checkSeq']+')" id="checkResult_'+row['checkSeq']+'" name="checkResult">';
								html += '<input type="hidden" id="checkPass_'+row['checkSeq']+'" name="checkPass" value="'+row['checkPass']+'">';
							}
						}else{
							html = '<input type="text" class="form-control p-3" onkeyup="numberFormat(this, \'float\')" value="" style="color:black; background:lightgray;font-size: 1.3rem;text-align: center;" onchange="equipCheck2('+row['checkSeq']+')" id="checkResult_'+row['checkSeq']+'" name="checkResult" placeholder="0">';
							html += '<input type="hidden" id="checkPass_'+row['checkSeq']+'" name="checkPass" value="">';
						}
					}

					return html;
				},
				'className' : 'text-center'
			},
		],
		columnDefs : [],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
	}); 


	var html = '<div class="card-body p-0">';
	html += '<div class="float-left mt-1">';
	html += '<span class="mr-2"><b>범례:</b></span>';
	html += '<label class="input-label mr-1" style="color:lightgray; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="6MonPass" style="background-color:lightgray; width: 60px; font-size: 0.725rem; font-weight: 500;">0</span>';
	html += '<span class="mr-3"><b>미입력</b></span>';
	html += '<label class="input-label mr-1" style="color:black; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="12MonPass" style="background-color:white; border: solid 1px black; width:60px; font-size: 0.725rem; font-weight: 500;">확인값</span>';
	html += '<span class="mr-3"><b>양호</b></span>';
	html += '<label class="input-label mr-1" style="color:red; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="24MonPass" style="background-color:red; width:60px; font-size: 0.725rem;color: black;font-weight: 500;">확인값</span>';
	html += '<span class="mr-3"><b>이상</b></span>';
	html += '</div>';
	html += '<div class="float-right">';
	html += '<button type="button" class="btn btn-primary ml-1" id="fileReferenceBtn" onclick="fileReferenceClick();">점검기준서</button>';
	html += '<button type="button" class="btn btn-primary ml-1" id="btnEquipCheckSave">저장</button>';
	html += '</div>';
	html += '</div>';
	
	$('#equipCheckPopupTable_length').html(html);
	
	//일상점검 팝업창
	function equipDailyCheck(gubun) {
		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			$('#btnWorkOrdNo').focus();
			return false;
		}
		
		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비명을 선택해주세요.");
			check=false;
			return false;
		}
		
		equipGubunVal = gubun;
		if(equipGubunVal=="001"){
			$('#equipModalLabel').text("설비");
			$('#equipRestartPopUpLabel').text('설비 일상점검 기준서 조회');
			equipCheckCdVal = equipCdVal;
			fileGubunVal = "005";
			
		}else{
			$('#equipModalLabel').text("금형");
			$('#equipRestartPopUpLabel').text('금형 일상점검 기준서 조회');
			equipCheckCdVal = moldCdVal;
			fileGubunVal = "006";
		}
		
		$('#equipCheckPopupTable').DataTable().ajax.reload(function() {});
		$('#equipCheckPopupModal').modal('show');
	}


	
	//설비/금형 일상점검
	function equipCheck(data){
		let checkSeqVal = data;

		if($('#checkPass_'+checkSeqVal).val()=="OK"){
			$('#checkPass_'+checkSeqVal).val("NG");
	 		$('#checkPass_'+checkSeqVal).css('color','red');
		}else{
			$('#checkPass_'+checkSeqVal).val("OK");
			$('#checkPass_'+checkSeqVal).css('color','black');
		}
	}

	
	function equipCheck2(seq){
		let checkSeqVal = seq;
		
		var equipStandVal = equipCheckPopupTable.row(seq).data().checkSpec.split(/[a-zA-Z]/)[0].split('~');
		var equipStandLower = parseFloat(equipStandVal[0].replace(/,/g,''));
		var equipStandUpper = parseFloat(equipStandVal[1].replace(/,/g,''));
		var equipVal = parseFloat($('#checkResult_'+seq).val().replace(/,/g,''));
		
		if(!isNaN(equipStandLower) && !isNaN(equipStandUpper)){
			//점검판정
			if((equipStandLower>equipVal) || (equipVal>equipStandUpper)){
				$('#checkPass_'+seq).val("NG");
				$('#checkResult_'+seq).css('background','red');
			}else{
				$('#checkPass_'+seq).val("OK");
				$('#checkResult_'+seq).css('background','white');
			}
		}else{
			toastr.warning("SPEC을 확인해주세요.")
		}
	}

	//설비/금형 저장버튼
	$('#btnEquipCheckSave').on('click',function(){
		
		var dataArray = new Array();
		var check = true;

			
		$('#equipCheckPopupTable tbody tr').each(function(index, item) {
			var rowData = new Object();
			rowData.workOrdNo =  workOrdNoVal;
			rowData.mainGubun = equipGubunVal;
			rowData.equipCd = equipCheckCdVal;
			let seq = equipCheckPopupTable.row(index).data().checkSeq;
			rowData.checkSeq = seq;
			rowData.checkPass = $('#checkPass_'+seq).val();
			rowData.checkResult = $('#checkResult_'+seq).val();
		
			dataArray.push(rowData);
		});

		if(check){
			$.ajax({
				url: '<c:url value="/po/equipCheckChange"/>',
	            type: 'POST',
	            datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
	            success: function (res) {
		            if(res.result=="ok"){
			            if(equipGubunVal=="001"){
			            	toastr.success("설비일상점검 등록되었습니다.");
				        }else{
				        	toastr.success("금형일상점검 등록되었습니다.");
					    }

			          //설비점검/ 금형점검
						$.ajax({
							url: '<c:url value="/po/getTotalPass"/>',
						 	type : 'GET',
						 	data : {
							 'workOrdNo' : function(){return workOrdNoVal;},
						 	},
						 	success : function(res){
							 	if(res.equipTotalPass=="NG"){
							 		$('#equipCheck1').css('background','red');
								}else{
									$('#equipCheck1').css('background','#ffa50085');
								}

							 	if(res.moldTotalPass=="NG"){
							 		$('#equipCheck2').css('background','red');
								}else{
									$('#equipCheck2').css('background','#ffa50085');
								}
							 		
						     	$('#equipCheck1').val(res.equipTotalPass);
						     	$('#equipCheck2').val(res.moldTotalPass);
						    }
						})
			        }else{
			        	toastr.success(res.message);
				    }
		        }
			});
		}
	});

	

	//*******************작업지시 정보******************
	//작업지시번호 목록 조회 팝업
   	var workOrderPopUpTable;
   	function selectWorkOrd() {	   	
		if(workOrderPopUpTable == null || workOrderPopUpTable == undefined)	{
			//작지상세 테이블 
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
			            'mainGubun'		:	'001',
			            'itemGubun'		:	function() { return itemGubun; },
			            'workEmerYn'	:	function() { return workEmerYn; },
			            'value'			:	'',
			            //'workStatusCd'	:	'WE',
					},
				},
				rowId : 'workOrdNo',
				columns : [			
					{//품목구분
						data : 'itemGubunNm'
					},
					{//설비명
						data : 'equipNm'
					},
					{//작지번호
						data : 'workOrdNo'
					},
					{//작지번호
						data : 'subWorkChargrNm'
					},
					{//품번
						data : 'itemCd'
					},
					{//품명
						data : 'itemNm'
					},
					{//차종
						data : 'itemModelNm'
					},
					{//지시수량
						data : 'workOrdQty'
					},
					{//생산수량
						data : 'outputQty'
					},
					{//작업지시일
						data : 'workOrdDate',
						render : function(data,type,row,meta){
							if(data != null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{//생산일자
						data : 'workStartDate',
						render : function(data,type,row,meta){
							if(data != null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{//긴급여부
						data : 'workEmerYnNm',
						render : function(data,type,row,meta){
							if(data == "긴급"){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					},			
					{//작업상태
						data : 'workStatusCd',
						render : function (data, type, row, meta) {
							if (data == "W") {
								return '대기'
							} else if (data == "WS"){
								return '진행중'
							} else if (data == "WE") {
								return '작업종료'
							} else if (data == "NS") {
								return '비가동시작'
							} else if (data == "NE") {
								return '비가동종료'
							} else if (data == "PS") {
								return '가동시작'
							} else if (data == "PE") {
								return '가동종료'
							}
						}
					},			
				],
				columnDefs: [
					{ targets: [7,8], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3,4,5,6,9,10,11,12], className: 'text-center-td' },
		        	{ targets: [7,8], className: 'text-right-td' }
		        ],
			    order: [
			    ],
			    buttons: [],
			    drawCallback: function() {
				    var api = this.api();
				}
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

			html += '	<label class="input-label-sm">긴급여부</label>';
			html += '	<div class="form-group input-sub m-0">';
			html += 		'<select name="workEmerYn" id="workEmerYn" title="" class="select w80 col-12 custom-select">';
			html += '		</select>';
			html += '	</div>&nbsp;&nbsp;&nbsp;';
			html += '	<button type="button" class="btn btn-primary ml-2" id="btnAllRetv">전체조회</button>';
			html += '</div>';
				
			$('#workOrderPopUpTable_length').html(html);
			$('#selStartDate').val(moment(selStartDateVal).format('YYYY-MM-DD'));
			$('#selEndDate').val(moment(selEndDateVal).format('YYYY-MM-DD'));

			selectBoxAppend(workEmerYnCode, "workEmerYn", "", "1");

			$('#selStartDate,#selEndDate,#mainGubun,#itemGubunOption,#workEmerYn').on('change',function() {
				selStartDateVal = moment($('#selStartDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				selEndDateVal = moment($('#selEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				itemGubun =  $('#itemGubunOption option:selected').val();
				workEmerYn =  $('#workEmerYn option:selected').val();
				$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
			});

			//전체조회 버튼
			$('#btnAllRetv').on('click',function(){
				selStartDateVal = ""
				selEndDateVal = moment($('#selEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				itemGubun =  "";
				workEmerYn =  "";
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

   	//기본정보 - 작업지시 목록 선택시
	$(document).on('click', '#workOrderPopUpTable tbody tr', function () {
		
	 	if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        } else {
        	$('#workOrderPopUpTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		$('#formLeft').each(function(){
			this.reset();
		});
		
    	var data = workOrderPopUpTable.row(this).data();

    	$('#workOrdNoScan').val(data.workOrdNo);
    	$('#workOrdDate').val(moment(data.workOrdDate).format('YYYY-MM-DD'));


    	$('#tab1Nav').removeClass('disabled');	//자재투입 탭 활성화
    	$('#tab5Nav').removeClass('disabled');	//작업조건 탭 활성화
    	
    	//작업자
    	$('#workChargr').val(data.mainWorkChargr); 		//작업자
    	$('#workChargrNm').val(data.mainWorkChargrNm);	//작업자명

    	$('#workOrdQty').val(addCommas(data.workOrdQty));		//계획수량
    	$('#workGubun').val(data.workGubun);					//작업구분

    	$('#itemGubun').val(data.itemGubunNm);		//차종
    	$('#itemModel').val(data.itemModelNm);		//차종
		$('#itemCd').val(data.itemCd);				//품번
		$('#itemNm').val(data.itemNm);				//품명
			
    	$('#outputQty').val(addCommas(data.outputQty));	//생산수량
    	$('#2').val('0분');							//생산시간
    	$('#3').val('0%');							//생산효율

    	$('#fairQty').val(addCommas(parseFloat(data.outputQty)-parseFloat(data.faultyQty)));			//생산수량 - 불량수량
    	$('#faultyQty').val(addCommas(data.faultyQty));		//불량수량

    	$('#equipCheck1').attr('disabled',false);	//설비점검
    	$('#equipCd').val(data.equipCd);			//설비코드
    	equipCdVal = data.equipCd;
    	$('#equipNm').val(data.equipNm);			//설비명
    	$('#workMethod').val(data.workMethod);		//작업방식
    	
		$('#moldNo').val(data.moldNo);				//금형코드
		moldCdVal = data.moldCd;
		$('#moldLocation').val(data.moldLocation);	//금형위치
		$('#cavityCnt').val(data.cavityCnt != null ? data.cavityCnt : '001'); //CAVITY수 체크
		$('#cavityCnt').attr('disabled', false);		//CAVITY수 체크
		$('#equipCheck2').attr('disabled',false);	//금형점검
		//$('#fuzzQty').val(data.fuzzQty);			//퍼징
    	//$('#runnerQty').val(data.runnerQty);		//런너
    	
    	$('#btnWorkChargr').attr('disabled', false);	//작업자
    	$('#workGubun').attr('disabled', false);		//작업구분
    	$('#btnEquipNm').attr('disabled', false);		//설비명
    	$('#workMethod').attr('disabled', false);		//작업방식
    	
    	$('#fuzzQty').attr('disabled', false);		//퍼징
    	$('#runnerQty').attr('disabled', false);		//런너
    	
    	$('#histSeq').attr('disabled', false);			//작업조건 차수
    	$('#btnWorkConEdit').attr('disabled', false);	//작업조건 수정버튼
    	$('#btnWorkConSave').attr('disabled', false);	//작업조건 저장버튼
    	$('#fuzzPopup').attr('disabled', false);		//퍼징
    	$('#tab5Nav').trigger('click');
    	
    	boxCount = data.boxCount;
    	workOrdNoVal = data.workOrdNo;
    	itemSeqVal = data.itemSeq;
    	itemCdVal = data.itemCd;
    	itemNmVal = data.itemNm;

    	inLocVal = data.locCd;
    	inAreaVal = data.areaCd;
    	inFloorVal = data.floorNm;
    	locationNoVal = data.locNo;

    	outLocVal = data.outLocCd;
    	outAreaVal = data.outAreaCd;
    	outFloorVal = data.outFloorNm;
    	outLocNoVal = data.outLocNo;

    	mainGubun = data.mainGubun;
    	mainWorkStatusCd = data.workStatusCd;

    	//중물검사 
    	if(data.mdInspectYn=="002"){
    		$('#ckMdInspectNo').prop('checked',true);
    		$('#btnInspPopup2').attr('disabled',true);
        }else{
        	$('#ckMdInspectNo').prop('checked',false);
        	$('#btnInspPopup2').attr('disabled',false);
        }

    	//불량등록 테이블 - cavity
    	cavityArr = [];
    	let cavityCntVal = data.cavityCnt != null ? data.cavityCnt : 1;
    	cavityCntVal *= 1;
    	for (var i = 0; i < cavityCntVal; i++) {
			var json = new Object();
			json.baseCd = i+1;
			json.baseNm = (i+1) + ' CAVITY';
			cavityArr.push(json);
		}

		//불량등록-lotNo리스트
		$.ajax({
			url: '<c:url value="/po/workOrderPrcssList"/>',
		 	type : 'GET',
		 	data : {
			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
			 'itemSeq' : function(){return itemSeqVal},
		 	},
		 	success : function(res){
		     	let data = res.data;
				for(var i=0; i<data.length; i++){
					if(data[i].ordLotNo!=null){
						var json = new Object();
						json.baseCd = data[i].workOrdSeq;
						json.baseNm = data[i].ordLotNo;
						lotNoArr.push(json);
					}
				}
				$('#faultyTypeTable').DataTable().ajax.reload(function(){});			//불량등록 reload
		    }
		})
		
		//초기허용불량
		$.ajax({
			url: '<c:url value="/po/getFaultyTypeSumQty"/>',
		 	type : 'GET',
		 	data : {
			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
			 'faultyTypeCd' : "000026",
		 	},
		 	success : function(res){
		     	$('#initFaultyQty').val(addCommas(res.data));
		    }
		});

		//퍼징량/런너량
		$.ajax({
			url: '<c:url value="/po/frHistAdmRead"/>',
		 	type : 'GET',
		 	data : {
			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
		 	},
		 	success : function(res){
		     	$('#fuzzQty').val(addCommas(res.fuzzQty));
		     	$('#runnerQty').val(addCommas(res.runnerQty));
		    }
		});


		//설비점검/ 금형점검
		$.ajax({
			url: '<c:url value="/po/getTotalPass"/>',
		 	type : 'GET',
		 	data : {
			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
		 	},
		 	success : function(res){
			 	if(res.equipTotalPass=="NG"){
			 		$('#equipCheck1').css('background','red');
				}else{
					$('#equipCheck1').css('background','#ffa50085');
				}

			 	if(res.moldTotalPass=="NG"){
			 		$('#equipCheck2').css('background','red');
				}else{
					$('#equipCheck2').css('background','#ffa50085');
				}
			 		
		     	$('#equipCheck1').val(res.equipTotalPass);
		     	$('#equipCheck2').val(res.moldTotalPass);
		    }
		})
		
		
		$('#workOrderNonOperationTable').DataTable().ajax.reload(function(){});	//비가동등록 reload
		$('#workOrderPrcssTable').DataTable().ajax.reload(function(){
			workOrderPrcssTable.draw();
		});		//생산실적등록 reload
		$('#workOrderMatrlTable').DataTable().ajax.reload( function () {});		//자재투입 reload

		getWorkCond();	//작업표준/조건 read
		getWorkTime();	//생산시간/비가동시간 read
		getTotalFuzzCnt();	//작업표준/조건 read

		$('#workOrderPopUpModal').modal('hide');
		$('#btnNoDel').removeClass('d-none');			//비가동삭제
		$('#btnFaultyDel').removeClass('d-none');		//불량삭제
		$('#workOrderPrcssDel').removeClass('d-none');	//생산실적삭제
		$('#btnMatrlDel').removeClass('d-none');		//자자삭제
		$('#noSave').removeClass('d-none');

		
    	//상태값에 따른 버튼 활성화/비활성화 여부
    	switch(data.workStatusCd){
    	case "W" :	//대기상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색
    		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색
			
        	$('#tab2Nav').addClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').addClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').addClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').addClass('disabled');  //자주검사 탭 활성화
    		
        	workStatusText = "대기";
        	bgColor = "#959595";
        	break;
    	case "WS" : 	//작업시작상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색  
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
			$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색  
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 
        	
    		workStatusText = "작업시작";
    		bgColor = "#285489";

        	break;
    	case "PS" : 	//가동시작상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색  
    		$('#btnWorkStart').css('background','#346cb0'); 	//가동시작 버튼 빨간색  
			$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 

        	$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화
    		
        	
    		workStatusText = "가동시작";
    		bgColor = "#346cb0";

        	break;
    	case "PE" : 	//가동종료상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색  
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
			$('#btnWorkEnd').css('background','#008000'); 		//가동종료 버튼 빨간색  
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 

        	$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화
    		
        	
    		workStatusText = "가동종료";
    		bgColor = "#008000";

        	break;
    	case "NS" :   //비가동상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색  
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
    		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색  
			$('#btnWorkNonStart').css('background','red'); 	//비가동시작 버튼 빨간색 
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 

    		$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화
    		
    		workStatusText = "비가동";
    		bgColor = "red";
        	break;
    	case "NE" :   //비가동상태
    		$('#btnMainWorkEnd').css('background','#959595'); 	//작업종료 버튼 검은색  
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
    		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색  
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
			$('#btnWorkNonEnd').css('background','red'); 	//비가동종료 버튼 빨간색 

    		$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화
    		
    		workStatusText = "비가동";
    		bgColor = "red";	
        	break;
    	case "WE" :   //작업종료상태
    		$('#btnMainWorkEnd').css('background','#333'); 	//작업종료 버튼 빨간색  
    		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
    		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색  
			$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
			$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 
    		$('#matrlBarcodeNoScan').attr('disabled',true);
    		$('#noSave').addClass('d-none');
    		workStatusText = "작업종료";
    		bgColor = "#333";

    		$('#btnNoDel').addClass('d-none');			//비가동삭제
    		$('#btnFaultyDel').addClass('d-none');		//불량삭제
    		$('#workOrderPrcssDel').addClass('d-none');	//생산실적삭제
    		$('#btnMatrlDel').addClass('d-none');		//자자삭제

    		$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
    		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
    		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
    		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화

    		$('#fuzzQty').attr('disabled', true);		//퍼징
        	$('#runnerQty').attr('disabled', true);		//런너
    		
        	break;
    	}
		
    	//작업상태 표시
    	$('#workStatusNm').text(workStatusText);
    	$('.text-bg').css('background', bgColor);
	});

	//기본정보 - 작업방식/작업자/작업구분 수정
   	$('#workMethod, #workGubun').on('change',function(){
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'workMethod' : $('#workMethod').val(),
				'workGubun' : $('#workGubun').val(),
			},
			success : function(res){
				if (res.result == "ok") {
					toastr.success("수정되었습니다.");
				} else {
					toastr.error(res.message);
				}
			}
		}); 
  	});
	
	//기본정보 - 'CAVITY수 체크' 수정
   	$('#cavityCnt').on('change', function(){
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'cavityCnt' : $('#cavityCnt').val(),
			},
			success : function(res){
				if (res.result == "ok") {
					//불량등록 테이블 - cavity
			    	cavityArr = [];
			    	let cavityCntVal = $('#cavityCnt').val();
			    	cavityCntVal *= 1;
			    	for (var i = 0; i < cavityCntVal; i++) {
						var json = new Object();
						json.baseCd = i+1;
						json.baseNm = (i+1) + ' CAVITY';
						cavityArr.push(json);
					}
			    	$('#faultyTypeTable').DataTable().ajax.reload(function(){});
			    	$('#btnInspPopup1').trigger('click');
			    	
					toastr.success("수정되었습니다.");
				} else {
					toastr.error(res.message);
				}
			}
		}); 
  	});
  	
 	//기본정보 - 퍼징/런너 수정
   	function updateFrHist(gubun){
   	   	let frHistGb = gubun;
   	   	let frHistCnt = "";
   	   	console.log('dd');
   	   	
   	   	if(frHistGb=="F"){
   	   		frHistCnt = $('#fuzzQty').val().replace(/,/g,'');
   	   	}else{
   		   	frHistCnt = $('#runnerQty').val().replace(/,/g,'');
   	   	}

   	   	if(frHistCnt=="" || frHistCnt=="0"){
			toastr.warning("퍼징량 또는 런너량을 입력해주세요.");
   	   	}else{

   	   	   	$.ajax({
				url : '<c:url value="po/frHistAdmCreate" />',
				type : 'POST',
				data : {
					'workOrdNo' 	: workOrdNoVal,
					'frHistGb' 		: frHistGb,
					'frHistCnt' 	: frHistCnt,
				},
				success : function(res){
					if(res.result=="ok"){
						toastr.success("수정되었습니다.");
					}else {
						toastr.error(res.message);
					}
				}
			}); 
   	   	}
  	};

	//담당자 팝업 시작
	var workChargrPopupTable;
	function selectWorkChargr() {
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
					url : '/po/selectWorkChargrList',
					type : 'GET',
					data : {
						'workOrdNo' : function(){return workOrdNoVal},
						'empCd' : function(){return '001'},
					}
				},
				columns : [ 
					{
						render : function(data, type, row, meta) {
							return meta.row+1;
						},
						'className' : 'text-center'
					},
					{ data : 'userNm'},
					{ data : 'departmentNm'},
					{ data : 'chargeDutyNm'},
					{ data : 'postNm'},
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
		$('#workChargr').val(data.userNumber);
		$('#workChargrNm').val(data.userNm);	

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


	//설비 팝업 시작
	var prcssEquipPopUpTable;
	function equipNmOnClick() {
		if (prcssEquipPopUpTable == null || prcssEquipPopUpTable == 'undefined') {
			prcssEquipPopUpTable = $('#prcssEquipPopUpTable').DataTable({	
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
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){return '001';},	//설비/금형
						'prcNm' : function(){return '002';},			//봉제/레이저
						'equipGubun' : function(){return '001';},
					},
				},
				columns : [ 
					{
						data : 'equipNo'
					}, 
					{
						data : 'equipNm'
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
		}else {
			$('#prcssEquipPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#prcssEquipPopUpModal').modal('show');
	}

	//기본정보 - 설비목록선택시
	$(document).on('click', '#prcssEquipPopUpTable tbody tr', function() {

		var data = prcssEquipPopUpTable.row(this).data();
		
		$('#equipCd').val(data.equipCd);
		$('#equipNm').val(data.equipNm);
		outLocVal = data.locCd;
    	outAreaVal = data.areaCd;
    	outFloorVal = data.floorNm;
    	outLocNoVal = data.locNo;
    	
		//설비코드 수정
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			data : {
				'workOrdNo' : workOrdNoVal,
				'equipCd' : data.equipCd
			},
			success : function(res){
				if(res.result=="ok"){
					
					toastr.success("수정되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		}); 
		
		$('#prcssEquipPopUpModal').modal('hide');
	});


	//기본정보 - 작업지시번호 스캔
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

        		    	
                    } else if(res.result == 'fail') {
                    	toastr.warning(res.message);
                    } else {
                    	toastr.error(res.message);
                    }
                }
    		});

		}
	});

	
	
	//**********************생산실적등록********************
	//생산실적등록 조회
	let workOrderPrcssTable = $('#workOrderPrcssTable').DataTable({
		dom : "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>",
		language: lang_kor,
	    paging: true,
	    info: false,
	    searching: false,
	    ordering: true,
	    processing: false,
	    autoWidth: false,
	    lengthChange: false,
	    ordering: false,    
	    destroy : true,
	    pageLength:1000,
	    scrollY : "480px",
	    ajax : {
	    	url: '<c:url value="/po/workOrderPrcssList"/>',
	        type : 'GET',
	        data : {
	         'workOrdNo' : function(){return $('#workOrdNoScan').val();},
	         'workGubun' : function(){return workGubunVal;},        	 
	         'itemSeq' : function(){return itemSeqVal},
	        },
	    },
	    rowId : 'workOrdSeq',
	    columns : [
		    	{
					data : 'workStatus',
					render : function(data, type, row, meta) {
						if (data != null) {
	 						if (data=="001") {
	 							return '<label title="진행중" style="color: green; font-size: 21px;">●</label>';
							} else if (data=="002"){
								return '<label title="진행완료" style="color: black; font-size: 21px;">●</label>';
							} else if (data=="003"){
								return '<label title="불량" style="color: red; font-size: 21px;">●</label>';
							}
	 					} else {
	 						return '<label title="진행중" style="color: green; font-size: 21px;">●</label>';
						}
				},
				'className' : 'text-center'
			},
    		 {
				data : 'ordLotNo',
				render : function(data, type, row, meta) {
					if (data != null) {
 						return '<span>'+data+'</span>';
 					} else {
 						return '<span>자동생성</span>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'workGubunNm',
				render : function(data, type, row, meta) {
					if (data != null) {
 						return '<span>'+data+'</span>';
 					} else {
 						return '<span>-</span>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'workChargrNm',
				render : function(data, type, row, meta) {
					if (data != null) {
 						return '<span>'+data+'</span>';
 					} else {
 						return '<span>'+workChargrNm+'</span>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'outputQty',
				render : function(data, type, row, meta) {
					if (row['workStatus'] != "001") {
						return '<input type="text" class="form-control" name="outputQty" value="'+addCommas(data)+'" onkeyup="numberFormat(this, \'float\')" style="min-width:100%; text-align:right; background: white; border:none;" disabled/>';
 					} else {
 	 					if(data!=null){
 	 						return '<input type="text" class="form-control" name="outputQty" onkeyup="numberFormat(this, \'float\')" onchange="workOrdPrcssChange(\''+row['workOrdSeq']+'\',\''+meta.row+'\',\''+data+'\');" value="'+addCommas(data)+'" style="min-width:100%; text-align:right;" />';
 	 	 				}else{
 	 	 					return '<input type="text" class="form-control" name="outputQty" onkeyup="numberFormat(this, \'float\')" onchange="workOrdPrcssChange(\''+row['workOrdSeq']+'\',\''+meta.row+'\',\''+data+'\');" value="0" style="min-width:100%; text-align:right;" />';
 	 	 	 			}
					}
				},
				'className' : 'text-center'
			},
			/* {
					data : 'workStartTime',
				render : function(data, type, row, meta) {
					if (data != null) {
	 						return '<span>'+moment(data).format('YYYY--MM-DD HH:mm')+'</span>';
	 					} else {
	 						return '<span>자동생성</span>';
						}
				},
				'className' : 'text-center'
			}, */
			{
					data : 'workEndTime',
				render : function(data, type, row, meta) {
					if (data != null) {
	 					return '<span>'+moment(data,'YYYYMMDDHHmm').format('YYYY-MM-DD HH:mm')+'</span>';
 					} else {
 						return '<span>자동생성</span>';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'inspectGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml3(inspectGubunCode,"inspectGubun", data, row, meta);
				},
				'className' : 'text-center'
			},
			{
				data : 'fairQty',
				render : function(data, type, row, meta) {
					if(row['ordLotNo'] != null) {
						return '<span style="font-size: 120%;">'+addCommas(data)+'</span>';
	 				}else {
						return '<span style="font-size: 120%;">0</span>';
					}
				},
				'className' : 'text-right'
			},
			{
				data : 'faultyQty',
				render : function(data, type, row, meta) {
					if(row['ordLotNo'] != null) {
						return '<span style="font-size: 120%;">'+addCommas(data)+'</span>';
 					}else {
						return '<span style="font-size: 120%;">0</span>';
					}
				},
				'className' : 'text-right'
			},
			{
				render : function(data, type, row, meta) {
					var btnHtml = '';
					if(row['workStatus']=="001"){
						if(row['faultyQty']=="0"){
							btnHtml = '<button type="button" class="btn btn-primary" name="" onclick="faultyAdd(\''+row['ordLotNo']+'\',\''+row['workOrdSeq']+'\',\''+row['workStatus']+'\')">등록</button>';
						}else{
							btnHtml = '<button type="button" class="btn btn-danger" name="" onclick="faultyAdd(\''+row['ordLotNo']+'\',\''+row['workOrdSeq']+'\',\''+row['workStatus']+'\')">등록</button>';
						}
					}else if(row['workStatus']=="002"){
						if(row['faultyQty']=="0"){
							btnHtml = '<button type="button" class="btn btn-primary" name="" disabled>등록</button>';
						}else{
							btnHtml = '<button type="button" class="btn btn-danger" name="" disabled>등록</button>';
						}
					}
					return btnHtml;
				},
				'className' : 'text-center'
			},
			{
				render : function(data, type, row, meta) {
					var btnHtml = '';
					if(row['workStatus']=="001"){
						btnHtml += '<button type="button" class="btn btn-primary"  name="btnBarcodePrint" onclick="barcodePrint('+meta.row+')">등록</button>';
					}else if(row['workStatus']=="002"){
						btnHtml += '<button type="button" class="btn btn-primary"  name="btnBarcodePrint" onclick="barcodePrint('+meta.row+')" disabled>등록</button>';
					}
					return btnHtml;
				},
				'className' : 'text-center'
			},
			{
				render : function(data, type, row, meta) {
					var btnHtml = '';
					if(row['workStatus']!="001"){
						btnHtml += '<button type="button" class="btn btn-success" name="btnLabelPrint" onclick="barcodeLabelPrint(\''+row['workOrdSeq']+'\',\''+meta.row+'\',\'출력\');">출력</button>';
					}else{
						btnHtml += '<button type="button" class="btn btn-success" name="btnLabelPrint" onclick="barcodeLabelPrint(\''+row['workOrdSeq']+'\',\''+meta.row+'\',\'출력\');" disabled>출력</button>';
					}
					return btnHtml;
				},
				'className' : 'text-center'
			},
			{
				data : 'labelPrintYn',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return 'N';
					}
				},
				'className' : 'text-center'
			},
      	],         
	    order: [
	      	//[ 1, 'desc' ]
	    ],
	    drawCallback: function() {
	    	$('select').css('font-size','120%').css('height','2rem');
	 		$('input').css('font-size','120%').css('height','2rem'); 
	 		$('button').css('font-size','120%');
	 		$('#workOrderPrcssTable button').css('font-size','100%');

	 		var api = this.api();
			let count=0, approvalCho=0, approvalJung=0, approvalJong=0;

			for(var i=0; i<api.data().count(); i++){

				approvalCho = api.row(i).data().approvalCho;
				approvalJung = api.row(i).data().approvalJung;
				approvalJong = api.row(i).data().approvalJong;

		 		//검사취출
				if(api.row(i).data().workStatus=="001"){
					$('select[name=inspectGubun]').eq(i).attr('disabled',false);
				}else{
					$('select[name=inspectGubun]').eq(i).attr('disabled',true);
				}

				if(api.row(i).data().workStatus!="001"){
					
					if(api.row(i).data().inspectGubun=="001"){
						if(approvalCho == "OK"){
							count = 1;
						}else{
							count = 0;
						}
					}else if(api.row(i).data().inspectGubun=="002"){
						if(approvalJung == "OK"){
							count = 1;
						}else{
							count = 0;
						}
					}else if(api.row(i).data().inspectGubun=="003"){
						if(approvalJong == "OK"){
							count = 1;
						}else{
							count = 0;
						}
					}else if(api.row(i).data().inspectGubun==""){
							
					}
					if(count>0){
						$('button[name=btnLabelPrint]').eq(i).attr('disabled',false);
					}else{
						$('button[name=btnLabelPrint]').eq(i).attr('disabled',true);
					}
				}
		 	} 
		},
	}); 

	let prcssIdx = null;
	let workStatusVal = null;
	//실적등록 선택시
	$('#workOrderPrcssTable tbody').on('click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }else {
        	$('#workOrderPrcssTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

      	prcssIdx =  $('#workOrderPrcssTable').DataTable().row(this).index();
      	workOrdSeqVal = workOrderPrcssTable.row(prcssIdx).data().workOrdSeq;
      	ordLotNoVal = workOrderPrcssTable.row(prcssIdx).data().ordLotNo;
      	workStatusVal = workOrderPrcssTable.row(prcssIdx).data().workStatus;
      	workGubunVal = workOrderPrcssTable.row(prcssIdx).data().workGubun;
      	inspectGubunVal = workOrderPrcssTable.row(prcssIdx).data().inspectGubun;
      	
    });



	//생산실적등록 수정(생산수량)
   	function workOrdPrcssChange(seq,index,data){
   	   	let workOrdSeqVal = seq;
   	   	let index2 = index;
   	   	let preOutputQty = data.replace(/,/g,'');
   	   	let nowOutputQty =  $('#workOrderPrcssTable tbody tr').eq(index2).find('td input[name=outputQty]').val().replace(/,/g,'');	//변경된 생산수량
   	   	let diffOutputQty = parseInt(nowOutputQty)-parseInt(preOutputQty);
   	   	
		$.ajax({
			url : '<c:url value="po/workOrdPrcssEdit" />',
			type : 'POST',
			data : {
				'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'outputQty'			:	$('#workOrderPrcssTable tbody tr').eq(index2).find('td input[name=outputQty]').val().replace(/,/g,''),
            	'diffOutputQty'     :   diffOutputQty,
            	//'fairQty'			:	$('#workOrderPrcssTable tbody tr').eq(index2).find('td input[name=outputQty]').val(),
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("수정되었습니다.");
					$('#workOrderPrcssTable').DataTable().ajax.reload();
					$('#outputQty').val(addCommas(res.outputQtyVal));
					$('#fairQty').val(addCommas(res.fairQtyVal));
				}else {
					toastr.error(res.message);
				}
			}
		}); 
	}


	//생산실적등록 수정(검사취출)
   	function workOrdPrcssChange2(seq,index){
   	   	let workOrdSeqVal = seq;
   	   	let index2 = index;
   	   	
		$.ajax({
			url : '<c:url value="po/workOrdPrcssEdit2" />',
			type : 'POST',
			data : {
				'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'inspectGubun'		:	$('#workOrderPrcssTable tbody tr').eq(index2).find('td select[name=inspectGubun]').val(),
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("수정되었습니다.");
					$('#workOrderPrcssTable').DataTable().ajax.reload();
				}else {
					toastr.error(res.message);
				}
			}
		}); 
	}
   	   
	
  	
	//작업구분 수정
   	$('#workGubun').on('change',function(){
   		workGubunVal = $('#workGubun option:selected').val();
   		$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
  	});

  	//생산실적등록 - 새로고침 버튼 클릭
  	$('#btnRefresh').on('click',function(){
  		$('#workOrderPrcssTable').DataTable().ajax.reload();
  	});
  	
	//생산실적등록 - 실적등록버튼 클릭
	function workOrdPrcssAdd(){
		
		
		if(mainWorkStatusCd!="PS"){
			toastr.warning("가동시작 한 후에 생산실적등록을 할 수 있습니다.");
			return false;
		}
		
		if(!$.trim($('#workChargr').val())){
			toastr.warning("작업자를 선택해주세요.");
			$('#btnWorkChargr').focus();
			return false;
		}

		if($('#workGubun').val() == ''){
			toastr.warning("작업구분을 선택해주세요.");
			$('#workGubun').focus();
			return false;
		}
		
		if($('#equipCd').val() == ''){
			toastr.warning("설비를 선택해주세요.");
			$('#btnEquipNm').focus();
			return false;
		}

		//저장 처리
		$.ajax({
			url: '<c:url value="po/workOrdAdd" />',
            type: 'POST',
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'itemSeq'			:	itemSeqVal,
            	'workGubun'			:	$('#workGubun').val(),
            	'equipCd'			:   $('#equipCd').val(),
            	'itemSeq'			:   itemSeqVal,
            	'ordDate'			:	moment($('#workOrdDate').val()).format('YYYYMMDD'),
            	'workStatus'		:	'001',
            	'workChargr'		:	$('#workChargr').val(),
            	'targetQty'			:	$('#workOrdQty').val().replace(/,/g,''),
            	'outputQty'			:	boxCount,
            	'fairQty'			:	boxCount,
            	'faultyQty'			:	'0',
            	'etcQty'			:	'0',
            	'outQty'			:	'0',
            	'remainQty'			:	'0',
            	'packYn'			:	'N',
            	'labelPrintYn'		:	'N',
            	'workStartTime'		:	$('#clock').text(),
            	'ordLotNoDate'		:	$('#clock').text().substring(0,10).replace(/-/g,''),
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	toastr.success('작지를 등록했습니다.');
                	$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
                	$('#outputQty').val(addCommas(res.outputQtyVal));
					$('#fairQty').val(addCommas(res.fairQtyVal));
                	
                } else {
                	toastr.error(res.message);
                }
            }
		});
	};

	//생산실적등록 - 실적삭제 버튼 클릭시
	$('#workOrderPrcssDel').on('click',function(){

		if(prcssIdx==null){
			toastr.warning("삭제할 실적을 선택해주세요.");
			return false;
		}
		
		/* if(workStatusVal!="001"){
			alert('진행완료된 실적LotNo입니다. 삭제하시겠습니까?');
			return false;
		}  */

		$.ajax({
			url : '<c:url value="po/workOrdDel"/>',
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'workOrdSeq' : function(){return workOrdSeqVal;},
				'barcodeNo' : function(){return ordLotNoVal;},
				'workGubun' : function(){return workGubunVal;},
				'workStatus' : function(){return workStatusVal;},
				'faultyQty' : function(){return workOrderPrcssTable.row(prcssIdx).data().faultyQty;},
				'outputQty' : function(){return $('#workOrderPrcssTable tbody tr').find('input[name=outputQty]').eq(prcssIdx).val();}
			},
			success : function(res){
				if(res.result="ok"){
            		//불량수량/양품수량 수정
            		$('#faultyQty').val(addCommas(res.faultyQty));
            		$('#fairQty').val(addCommas(res.fairQty));
            		$('#outputQty').val(addCommas(res.outputQty));
            		
					$('#workOrderPrcssTable').DataTable().ajax.reload(function(){
						setTimeout(function(){
							workOrderPrcssTable.draw();
						},50)
					});		
					//불량등록-lotNo리스트
                	lotNoArr = [];
            		$.ajax({
            			url: '<c:url value="/po/workOrderPrcssList"/>',
            		 	type : 'GET',
            		 	async:false,
            		 	data : {
            			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
            			 'itemSeq' : function(){return itemSeqVal},
            		 	},
            		 	success : function(res){
            		     	let data = res.data;
            			
            				for(var i=0; i<data.length; i++){
            					if(data[i].ordLotNo!=null){
            						var json = new Object();
            						json.baseCd = data[i].workOrdSeq;
            						json.baseNm = data[i].ordLotNo;
            						lotNoArr.push(json);
            					}
            				}
            				
            				$('#faultyTypeTable').DataTable().ajax.reload(function(){});	//불량등록 reload
            			  }
            		}); 
            		toastr.success("실적 삭제되었습니다.");
				}
			}
		});
	});

	
	//생산실적등록 - 불량등록 버튼 클릭시
	function faultyAdd(lotNoData,workOrdSeqData,workStatusData){
		
		$('#tab3Nav').trigger('click');

		//불량등록 행 추가
		setTimeout(function(){
			workOrdSeqVal = workOrdSeqData;
			faultyTypeTable.row.add( {
				"workOrdSeq"		:	workOrdSeqVal,
				"workStatus"		:	workStatusData,
				"faultyTypeSeq"		:	faultyTypeTable.data().count() + 1,
	    		"faultyTypeDate"	:	moment().format('YYYYMMDD'),
	    		"faultyTypeQty"		:	'',
	    		"faultyTypeDesc"	:	''
	    	}).draw(); 
		},500)
	}


	//생산실적등록 - 등록버튼 클릭시
	function barcodePrint(row) {

		var workOrdSeqVal = workOrderPrcssTable.row(row).data().workOrdSeq;
		var ordLotNoVal = workOrderPrcssTable.row(row).data().ordLotNo;
		var outputQtyVal = $('#workOrderPrcssTable tbody tr').eq(row).find('input[name=outputQty]').val().replace(/,/g,'');
		var fairQtyVal = workOrderPrcssTable.row(row).data().fairQty;
		
		//var inspectGubunVal = $('#workOrderPrcssTable tbody tr').eq(row).find('select[name=inspectGubun]').val();

		if(outputQtyVal=="0" || outputQtyVal==""){
			toastr.warning("생산수량을 입력해주세요.");
			return false;
		}

		//작업일자 고정 버튼 클릭시
		/* if($('#fixClock').is(':checked')){
			if(!clockChange){
				getFixClock(row);
				return false;
			}else{
				workEndTimeVal = changeClockVal;
			}
		}else{
			workEndTimeVal = $('#clock').text();
		}  */

		workEndTimeVal = $('#clock').text();
		
		$.ajax({
			url: '<c:url value="/po/workOrdEdit" />',
            type: 'POST',
            async:false,
            data: {
            	'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'ordLotNo'			:	ordLotNoVal,
            	'workStatus'		:	'002',
            	'workEndTime'		:	workEndTimeVal,
            	'fairQty'			:	fairQtyVal,
            	//'workGubun'			:	$('#workGubun').val(),
            	//'ordDate'			:	moment($('#workOrdDate').val()).format('YYYYMMDD'),
            	//'inspectGubun'	:	inspectGubunVal,
            	//'workChargr'		:	$('#workChargr').val(),
            	//'outputQty'		:	outputQtyVal,
            	//'fairQty'			:	fairQtyVal,
            	//'equipCd'			:	$('#equipCd').val(),
            	'itemGubun'			:	itemGubun,
            	'itemSeq'			:	itemSeqVal,
            	'inLoc'				:	inLocVal,
            	'inArea'			:	inAreaVal,
            	'inFloor'			:	inFloorVal,
            	'locationNo'		:	locationNoVal,
            	'ordLotNoDate'		:	$('#clock').text().substring(0,10).replace(/-/g,''),
            	
            },
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
            		//불량등록-lotNo리스트
            		$.ajax({
            			url: '<c:url value="/po/workOrderPrcssList"/>',
            		 	type : 'GET',
            		 	async:false,
            		 	data : {
            			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
            			 'itemSeq' : function(){return itemSeqVal},
            		 	},
            		 	success : function(res){
            		     	let data = res.data;
            			
            				for(var i=0; i<data.length; i++){
            					if(data[i].ordLotNo!=null){
            						var json = new Object();
            						json.baseCd = data[i].workOrdSeq;
            						json.baseNm = data[i].ordLotNo;
            						lotNoArr.push(json);
            					}
            				}
            				$('#faultyTypeTable').DataTable().ajax.reload(function(){});			//불량등록 reload
            		    }
            		}); 
            		
                	$('#workOrderPrcssTable').DataTable().ajax.reload(function(){
                    	
                		setTimeout(function(){
                			workOrderPrcssTable.draw();
                			workOrderPrcssTable.draw();
                		},250);
                		
                		//let rowCount = workOrderPrcssTable.data().count()-1;
                		//barcodeLabelPrint(seq,row,'출력');
                		//clockChange = false;
                    });

                	$('select').css('font-size','120%').css('height','2rem');
        	 		$('input').css('font-size','120%').css('height','2rem'); 
        	 		$('button').css('font-size','120%');
        	 		$('#workOrderPrcssTable button').css('font-size','100%');

                } else {
                	toastr.error(res.message);
                }
            }
		});

		getWorkTime();
		
	};
/* 
	
	//숫자만 입력하게 처리    
	$(document).on('keyup',"input[name=outputQty],input[name=fuzzCnt]", function(event){
		$(document).on('keyup',"input[name=condition]", function(event){
			if(event.which != 229) { // PC일 경우
				if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46
						|| event.which == 110 || event.which == 190)) {
					$('.number-float0').on("blur keyup", function() {
						$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
					});  
					toastr.warning('숫자 및 점(.)만 입력해주세요.');
					$(this).val("");
					$(this).select();
					event.preventDefault();
					return false;
				}
			} else { // mobile일 경우
				if (event.originalEvent.isComposing) { // 숫자열일 경우만 false를 return함
					$('.number-float0').on("blur keyup", function() {
						$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
					});  
					toastr.warning('숫자 및 점(.)만 입력해주세요.');
					$(this).val("");
					$(this).select();
					event.preventDefault();
					return false;
				}
			}
			
			$(this).val($(this).val().replace(/,/g,''));
		});
	}); */

	//숫자만 입력하게 처리    
	/* $(document).on('keyup',"input[name=condition]", function(event){
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46
				|| event.which == 110 || event.which == 190)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			});  
			toastr.warning('숫자 및 점(.)만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val($(this).val().replace(/,/g,''));
	}); */



	//*******************불량등록*******************
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
				'workOrdNo'		:	function() { return workOrdNoVal;},
			},
		},
		columns : [ 
			{
				data : 'faultyTypeSeq',
				render : function(data, type, row, meta) {
					return meta.row+1;
				},
				'className' : 'text-center'
			},
			{ 
				data : 'workOrdSeq',
				render : function(data, type, row, meta) {
					if(row['workStatus']!="001"){
						return selectBoxHtml2(lotNoArr,"workOrdSeq", data, row, meta);
					}else{
						return selectBoxHtml2(lotNoArr,"workOrdSeq", data, row, meta);
					}
				},
				'className' : 'text-center'
			},
			{ data : 'faultyTypeDate',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						if(row['workStatus']!="001"){
							resultHtml += '	<input type="date" name="faultyTypeDate" class="form-control mw-100 text-center" value="'+moment(data,'YYYYMMDD').format('YYYY-MM-DD')+'" disabled>';
						}else{
							resultHtml += '	<input type="date" name="faultyTypeDate" class="form-control mw-100 text-center" value="'+moment(data,'YYYYMMDD').format('YYYY-MM-DD')+'">';
						}
					} else {
		           		resultHtml += '	<input type="date" name="faultyTypeDate" class="form-control mw-100 text-center" value="'+moment().format('YYYY-MM-DD')+'" >';
			        }
	           		return resultHtml;	
				}
			},
			{ data : 'faultyTypeCd',
				render : function(data, type, row, meta) {
					var tempSeq = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var html2 = "";
						if(row['workStatus']!="001"){
							html2 = '<button type="button" id="btnBaseInfoNm'+tempSeq+'" name="btnBaseInfoNm" class="btn btn-primary input-sub-search" style="min-height : 100%" onClick="baseInfoFtOnClick('+meta.row+')" disabled>';
						}else{
							html2 = '<button type="button" id="btnBaseInfoNm'+tempSeq+'" name="btnBaseInfoNm" class="btn btn-primary input-sub-search" style="min-height : 100%" onClick="baseInfoFtOnClick('+meta.row+')">';
						}
						
						var html = '<div class="input-sub m-0">';
						html += '<input type="hidden" id="baseInfoCd'+tempSeq+'" name="baseInfoCd" value="'+data+'">';
						html += '<input type="text" class="form-control text-left" id="baseInfoNm'+tempSeq+'" name="baseInfoNm" value="'+row['faultyTypeNm']+'" disabled>';
						html += html2;
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					} else {
						var html = '<div class="input-sub m-0">';
						html += '<input type="hidden" id="baseInfoCd'+tempSeq+'" name="baseInfoCd" value="">';
						html += '<input type="text" class="form-control text-left" id="baseInfoNm'+tempSeq+'" name="baseInfoNm" value="" disabled>';
						html += '<button type="button" id="btnBaseInfoNm'+tempSeq+'" name="btnBaseInfoNm" class="btn btn-primary input-sub-search" style="min-height : 100%" onClick="baseInfoFtOnClick('+meta.row+')">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				}
			},
			{ 
				data : 'faultyCavity',
				render : function(data, type, row, meta) {
					if(row['workStatus']!="001"){
						return selectBoxHtml2(cavityArr,"faultyCavity", data, row, meta);
					}else{
						return selectBoxHtml2(cavityArr,"faultyCavity", data, row, meta);
					}
				},
				'className' : 'text-center'
			},
			{ data : 'faultyTypeQty',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						if(row['workStatus']!="001"){
							resultHtml += '	<input type="text" name="faultyTypeQty" class="form-control mw-100 text-right" onkeyup="numberFormat(this, \'float\')" value="'+data+'" disabled>';
						}else{
							resultHtml += '	<input type="text" name="faultyTypeQty" class="form-control mw-100 text-right" onkeyup="numberFormat(this, \'float\')" value="'+data+'">';
						}
				 	} else {
		           		resultHtml += '	<input type="text" name="faultyTypeQty" class="form-control mw-100 text-right" onkeyup="numberFormat(this, \'float\')" value="" >';
			        }
	           		return resultHtml;	
				}
			},
			{ data : 'faultyTypeDesc',
				render : function(data, type, row, meta) {
					var resultHtml='';
					if(data!=null) {
						if(row['workStatus']!="001"){
							resultHtml += '	<input type="text" name="faultyTypeDesc" class="form-control mw-100" value="'+data+'" disabled>';
						}else{
							resultHtml += '	<input type="text" name="faultyTypeDesc" class="form-control mw-100" value="'+data+'">';
						}
						
		           	} else {
		           		resultHtml += '	<input type="text" name="faultyTypeDesc" class="form-control mw-100" value="" >';
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
	    		/* var faultyTypeQtyNum = $(this).val().replace(/[^0-9]/g,'');
	    		let outputQtySum = 0;
				let faultyQtySum = 0;
				
	    	  	let index = $(this).parents().parents().index();
	    	  	let workOrdNo = $('#faultyTypeTable tbody tr').eq(index).find('select[name=workOrdSeq] option:selected').text();
	    	  	
	    	  	//lot별 생산수량
	    	  	for(let i=0; i<workOrderPrcssTable.data().count(); i++){
					if(workOrderPrcssTable.row(i).data().ordLotNo==workOrdNo){
						outputQtySum = parseInt(workOrderPrcssTable.row(i).data().outputQty.replace(/,/g,''));
						break;
					}
			   	}

	    	  	//lot별 총 불량수량
	    	  	for(var i=0;i<faultyTypeTable.data().count();i++) {
		    	  	if($('#faultyTypeTable tbody tr').eq(i).find('select[name=workOrdSeq] option:selected').text()==workOrdNo){
		    	  		faultyQtySum += parseInt($('input[name=faultyTypeQty]:eq('+i+')').val().replace(/,/g,''));
				    }
	    		}
 				*/
	    		/* if(outputQtySum-faultyQtySum < 0){
					toastr.warning("불량수량이 생산수량을 초과하였습니다.");
					$(this).val("0");
		    	}else{
		    		$(this).val(addCommas(faultyTypeQtyNum));
			    } */
			    
	    		faultyQtySum=0;
				for(var i=0;i<faultyTypeTable.data().count();i++) {
	    	  		faultyQtySum += parseInt($('input[name=faultyTypeQty]:eq('+i+')').val().replace(/,/g,''));
	    		}

	    		$('#faultyQty').val(addCommas(faultyQtySum));	//불량수량
	    	  	$('#outputQty').val(addCommas(parseInt($('#fairQty').val().replace(/,/g,'')) + faultyQtySum));	//양품수량 = 생산수량 - 불량수량
	    	});
	    	
	    	$('input').css('font-size','120%').css('height','2rem');
	    	$('button').css('font-size','120%').css('height','2rem');
	    	$('select').css('font-size','120%').css('height','2rem');
		}
	});

	let bulIdx = null;
	let faultyTypeSeqVal = null;
	let faultyTypeCdVal = null;
	let faultyTypeQtyVal = null;
	
	//불량등록 - 데이터 클릭 시
	$('#faultyTypeTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#faultyTypeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		bulIdx = $('#faultyTypeTable').DataTable().row(this).index();

		workOrdSeqVal = faultyTypeTable.row(bulIdx).data().workOrdSeq;
		if(workOrdSeqVal==null || workOrdSeqVal==""){
			workOrdSeqVal = $('select[name=workOrdSeq]').eq(bulIdx).val();
		}
		
		faultyTypeSeqVal = faultyTypeTable.row(bulIdx).data().faultyTypeSeq;
		/* if(faultyTypeSeqVal==null || faultyTypeSeqVal==""){
			faultyTypeSeqVal = "0";
		} */
		
		faultyTypeCdVal = faultyTypeTable.row(bulIdx).data().faultyTypeCd;
		if(faultyTypeCdVal==null || faultyTypeCdVal==""){
			faultyTypeCdVal = $('input[name=baseInfoCd]').val();
		}
		
		faultyTypeQtyVal = $('input[name=faultyTypeQty]').eq(bulIdx).val();
	});


	//불량유형 - 등록버튼 클릭시
	$('#btnFaultyAdd').on('click',function() {
		if(lotNoArr.length!=0){
			
			faultyTypeTable.row.add( {
				"workStatus"		:	"001",
				"faultyTypeSeq"		:	faultyTypeTable.data().count() + 1,
	    		"faultyTypeDate"	:	moment().format('YYYYMMDD'),
	    		"faultyTypeQty"		:	'',
	    		"faultyTypeDesc"	:	''
	    	}).draw();

			$('select[name=workOrdSeq]').eq(faultyTypeTable.data().count()-1).attr('disabled',false);
			
		}else{
			toastr.warning("불량등록할 생산LOTNO가 없습니다.");
		}
		
	});

	//불량유형 - 삭제버튼 클릭시
	$('#btnFaultyDel').on('click',function() {
		
		if(faultyTypeTable.data().count() == 0) {
			toastr.warning("삭제할 불량유형이 없습니다.");
			return false;
		}

		if(bulIdx==null){
			toastr.warning("삭제할 불량항목을 선택해주세요.");
			return false;
		}
		
		if(faultyTypeTable.row(bulIdx).data().workStatus=="002"){
			toastr.warning("진행완료된 생산LOT는 삭제 하실 수 없습니다.");
			return false;
		}

		if(workOrdSeqVal!=""){
			$.ajax({
				url : '<c:url value="po/workOrdFaultyDelete"/>',
				type : 'POST',
				data : {
					'workOrdNo' : function(){return workOrdNoVal;},
					'workOrdSeq' : function(){return workOrdSeqVal;},
					'faultyTypeSeq' : function(){return faultyTypeSeqVal;},
					'faultyTypeCd' : function(){return faultyTypeCdVal;},
					'faultyTypeQty' : function(){return faultyTypeQtyVal.replace(/,/g,'');},
					'faultyQty' : function(){return $('#faultyQty').val().replace(/,/g,'');},
					
				},
				success : function(res){
					if(res.result="ok"){
						$('#faultyTypeTable').DataTable().row(bulIdx).remove().draw();
						$('#workOrderPrcssTable').DataTable().ajax.reload();
						
						toastr.success("불량 삭제되었습니다.");
						let fairTotal = parseInt($('#fairQty').val().replace(/,/g,''));
						let faultyTotal = parseInt($('#faultyQty').val().replace(/,/g,''));
						let faultyQty =  parseInt(faultyTypeQtyVal.replace(/,/g,''));
						
						$('#faultyQty').val(addCommas(faultyTotal-faultyQty));
						$('#fairQty').val(addCommas(fairTotal+faultyQty));
					}
				}
			});
		}else{
			toastr.success("불량 삭제되었습니다.");
			$('#faultyTypeTable').DataTable().row(bulIdx).remove().draw();
		}
			
	});


	//불량등록 - 저장버튼 클릭시
	$('#btnInsertQty').on('click',function() {
		var dataArray = new Array();
		var check = true;

		if(faultyTypeTable.data().count()>0){
			//처리중..
			$('#my-spinner').show();
			
			$('#faultyTypeTable tbody tr').each(function(index, item) {
				if($(this).find('select[name=ordLotNo]').val()==""){
					toastr.warning("LOT NO를 선택해주세요.");
					//처리완료..
					$('#my-spinner').hide();
					check = false;
					return false;
				}
				if($(this).find('input[name=baseInfoNm]').val()==""){
					toastr.warning("불량유형을 선택해주세요.");
					//처리완료..
					$('#my-spinner').hide();
					check = false;
					return false;
				}
				if($(this).find('input[name=faultyCavity]').val()==""){
					toastr.warning("불량CAVITY구분을 선택해주세요.");
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
				rowData.workOrdSeq = $(this).find('select[name=workOrdSeq]').val();
				rowData.faultyQty = $(this).find('input[name=faultyTypeQty]').val().replace(/,/g,'');
				rowData.faultyTypeCd = $(this).find('input[name=baseInfoCd]').val();
				rowData.faultyCavity = $(this).find('select[name=faultyCavity]').val();
				rowData.faultyTypeDate = $(this).find('input[name=faultyTypeDate]').val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find('input[name=faultyTypeDesc]').val();
				rowData.faultyQtySum = $('#faultyQty').val().replace(/,/g,'');
				rowData.outputQty = $('#outputQty').val().replace(/,/g,'');

				dataArray.push(rowData);
				console.log(dataArray)
			});
		}else{
			toastr.warning("우선 불량등록을 해주세요.");
			check=false;
			return false;
		}
		
		if(check){
			$.ajax({
				url: '<c:url value="/po/workOrdInsertQty"/>',
	            type: 'POST',
	            datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
	            success: function (res) {
	                var data = res.data;
	                if(res.result == 'ok') {
	                	toastr.success('불량등록 되었습니다.');
	                	$('#workOrderDTLTable').DataTable().ajax.reload( function () {});
	                	$('#workOrderPrcssTable').DataTable().ajax.reload( function () {});

	                	//불량등록-lotNo리스트
	                	lotNoArr = [];
	            		$.ajax({
	            			url: '<c:url value="/po/workOrderPrcssList"/>',
	            		 	type : 'GET',
	            		 	async:false,
	            		 	data : {
	            			 'workOrdNo' : function(){return $('#workOrdNoScan').val();},
	            			 'itemSeq' : function(){return itemSeqVal},
	            		 	},
	            		 	success : function(res){
	            		     	let data = res.data;
	            			
	            				for(var i=0; i<data.length; i++){
	            					if(data[i].ordLotNo!=null){
	            						var json = new Object();
	            						json.baseCd = data[i].workOrdSeq;
	            						json.baseNm = data[i].ordLotNo;
	            						lotNoArr.push(json);
	            					}
	            				}
	            				$('#faultyTypeTable').DataTable().ajax.reload(function(){});			//불량등록 reload
	            		    }
	            		}); 

						//초기허용불량
	            		$('#initFaultyQty').val(res.faultyTypeSumQty);
	                	//처리완료..
						$('#my-spinner').hide();
	                } else {
	                	toastr.error(res.message);
	                }
	            }
			});
		} 
		
	});


	//불량등록 - 불량유형 팝업 시작
	var baseInfoFtPopUpTable = null;
	function baseInfoFtOnClick(row) {
		var check = true;
		
		if($('select[name=workOrdSeq]:eq('+row+')').val()==""){
			toastr.warning("우선 LotNo를 선택해주세요.");
			check==false;
			return false;
		}
		if(check){
			if (baseInfoFtPopUpTable == null || baseInfoFtPopUpTable == 'undefined') {
				baseInfoFtPopUpTable = $('#baseInfoFtPopUpTable').DataTable({	
					dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
							+ "<'row'<'col-sm-12'tr>>"
							+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
					language : lang_kor,
					paging : true,
					info : false,
					ordering : true,
					processing : true,
					autoWidth : false,
					scrollX : false,
					lengthChange : true,
					pageLength : 100000,
					scrollY:"400px",
					ajax : {
						url : '/bm/baseInfoFtList',
						type : 'GET',
						data : {
							'baseInfoGubun' : function(){return '003'},
						},
					},
					columns : [ 
						{
							data : 'baseInfoCd'
						}, 
						{
							data : 'baseInfoNm'
						}, 
						/* {
							data : 'etc1Nm'
						},  */
						{
							data : 'baseInfoDesc'
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
			}else{
				$('#baseInfoFtPopUpTable').DataTable().ajax.reload(function(){});
			}

			$('#baseInfoFtPopUpModal').modal('show');

			setTimeout(function(){
				$('#baseInfoFtPopUpTable').DataTable().ajax.reload(function(){});
				baseInfoFtPopUpTable.draw();
			},150);
		}
	}

	//불량유형 - 목록선택시
	$(document).on('click', '#baseInfoFtPopUpTable tbody tr', function() {
		
		var data = baseInfoFtPopUpTable.row(this).data();
		var workOrdSeqVal = $('select[name=workOrdSeq]').eq(0).val();	
		var count = 0;
		/* //LOT번호별 불량유형 중복체크
		$('#faultyTypeTable tbody tr').each(function(index, item) {
			
			if($(this).find('select[name=workOrdSeq]').val()==workOrdSeqVal){
				if($(this).find('input[name=baseInfoCd]').val()==data.baseInfoCd){
					toastr.warning("등록되어있는 불량유형입니다. 확인해주세요.");
					$('#faultyTypeTable').DataTable().row(tableIdx).remove().draw();
					$('#baseInfoFtPopUpModal').modal('hide');
					count++;
					return false;
				}
			}
		}); */

		if(count==0){
			$('input[name=baseInfoCd]').eq(bulIdx).val(data.baseInfoCd);
			$('input[name=baseInfoNm]').eq(bulIdx).val(data.baseInfoNm);
		}
		count=0;
		$('#baseInfoFtPopUpModal').modal('hide');
	});

	
	
	//**********************비가동등록********************
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
	        	'workOrdSeq'	:	"0",
	        	'minorPrcssCd'	:	"0",
	        	'middlePrcssCd'	:	"0",
	        },
	    },
	    columns: [
		    { data: 'noGubun',
		    	render : function(data, type, row, meta) {
		    		tempNum = meta.row + meta.settings._iDisplayStart + 1;
		    	/* 	var resultHtml='';
	           		if(data!=null) {
		           		resultHtml += '<select class="custom-select" id="noGubun'+tempNum+'" name="'+data+'" style="min-width:100%"></select>';
		           	} else {
			           	resultHtml += '<select class="custom-select" id="noGubun'+tempNum+'" name="noGubun" style="min-width:100%"></select>';
			        }
	           		return resultHtml; */

	           		return selectBoxHtml2(noGubunCode,"noGubun", data, row, meta);
              	} 
	        },
	        { data: 'noReason',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '	<input type="text" name="noReason" class="form-control" value="'+data+'" style="max-width:100%" disabled>';
		           	} else {
			           	resultHtml += '	<input type="text" name="noReason" class="form-control" style="max-width:100%">';
			        }
	           		return resultHtml;
           		}
	        },
	        { data: 'noStartDate',
           		render : function(data, type, row, meta) {
           			var resultHtml='<div class="row" style="min-width : 100%">';
	           		if(data!=null) {
		           		
	           			resultHtml += '<input type="date" class="form-control float-left mr-1" name="noStartDate" style="max-width:165px;" value="' + moment(data,"YYYY-MM-DD").format("YYYY-MM-DD") + '" disabled>';
	           			resultHtml += '<input type="time" class="form-control float-left" name="noStartTime" style="max-width:140px;" value="' + moment(row['noStartTime'],"HH:mm").format("HH:mm") + '" disabled>';

		 		    } else {
		           		resultHtml += '<input type="date" class="form-control float-left mr-1" name="noStartDate" style="max-width:165px;" value="'+noStartDateVal+'">';
		           		resultHtml += '<input type="time" class="form-control float-left" name="noStartTime" style="max-width:140px;" value="'+noStartTimeVal+'">';
			        }
	           		return resultHtml;
           		}
	        },
	       /*  { data: 'noStartTime',
           		render : function(data, type, row, meta) {
           			var resultHtml='';
	           		if(data!=null) {
	           			resultHtml += '<input type="time" class="form-control" name="noStartTime"  value="' + moment(data,"HH:mm").format("HH:mm") + '" disabled>';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noStartTime" value="'+noStartTimeVal+'">';
			        }
	           		return resultHtml;
           		}
	        }, */
	        {data : 'noEndDate',
				render: function(data, type, row, meta) {		
					var resultHtml='<div class="row" style="min-width : 100%">';
	           		if(data!=null && data!="")  {
	           			resultHtml += '<input type="date" class="form-control float-left mr-1" name="noEndDate" style="max-width:165px;" value="' + moment(data,"YYYY-MM-DD").format("YYYY-MM-DD") + '" disabled>';
	           			resultHtml += '<input type="time" class="form-control float-left" name="noEndTime" style="max-width:140px;" value="' + moment(row['noEndTime'],"HH:mm").format("HH:mm") + '" disabled>';
		           	} else {
		           		resultHtml += '<input type="date" class="form-control float-left mr-1" name="noEndDate" style="max-width:165px;" value="">';
		           		resultHtml += '<input type="time" class="form-control float-left" name="noEndTime" style="max-width:140px;" value="">';
			        }
	           		return resultHtml;
				}
			},
	       /*  {data : 'noEndTime',
				render: function(data, type, row, meta) {		
					var resultHtml='';
					if(data!=null && data!="")  {
						resultHtml += '<input type="time" class="form-control" name="noEndTime" value="' + moment(data,"HH:mm").format("HH:mm") + '" disabled>';
		           	} else {
		           		resultHtml += '<input type="time" class="form-control" name="noEndTime" value="">';
			        }
	           		return resultHtml;	
				}
			}, */
			{data : 'noTime',
				render: function(data, type, row, meta) {	
					return '<div class="noTime">'+data+'분</div>';
					
				}
			},
	    ],
	    columnDefs: [
		    { targets: [4], className: 'text-center-td' }
	    ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [],
	    drawCallback: function() {
	    	
			/* for(var i = 1; i<=tempNum; i++){
				var tempNameData = $("#noGubun"+i).attr('name');
				selectBoxAppend(noGubun, "noGubun"+i, tempNameData, "");
				$("#noGubun"+i).attr('name', 'noGubun');
			} */

			$('input').css('font-size','120%').css('height','2rem');
	    	$('button').css('font-size','120%').css('height','2rem');
	    	$('select').css('font-size','120%').css('height','2rem');
			
        },
	});


	let noIdx = null;
	//비가동등록 - 목록 선택시
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
		noIdx = $('#workOrderNonOperationTable').DataTable().row(this).index();	
		workOrdSeqVal = workOrderNonOperationTable.row(noIdx).data().workOrdSeq;
		
	});

	//비가동등록 - 등록버튼 클릭시
	$('#noAdd').on('click', function() {
		var check = true;

		
		//작업상태가 대기/시작일 경우
		if($('.btnWorkStatus').parents().find('.active').find('input').attr('class')=="form-control work-st"
				|| $('.btnWorkStatus').parents().find('.active').find('input').attr('class')=='WS'
				|| $('.btnWorkStatus').parents().find('.active').find('input').attr('class')=='NE'){
			toastr.warning("작업상태를 비가동시작으로 변경해주세요.");
			check=false;
			return false;
		}
		if($('.btnWorkStatus').parents().find('.active').find('input').attr('class')=='WE' ){
			toastr.warning("이미 종료된 작업지시입니다.");
			check=false;
			return false;
		}

		if(check){
			var time = new Date();
			
			$('#workOrderNonOperationTable').DataTable().row.add({
				'noReason'		:	'',
				'noStartTime'	:	time.getHours()+":"+time.getMinutes(),
				'noStartDate'	:	selEndDateVal,
				'noTime'		:	0,
				'noDesc'		:	''
			}).draw(true);
		}
		
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
		var row = workOrderNonOperationTable.row(this).index();
		var result = 0;
		
		if($('.selected #endTime').val() != "") {
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
				workOrderNonOperationTable.cell(row,4).data(noTime);
			}
		}
	});


	//비가동등록 - 삭제버튼 클릭시
	$('#btnNoDel').on('click', function() {
		if(noIdx==null){
			toastr.warning("삭제할 비가동을 선택해주세요.");
			return false;
		}

		if(workOrderNonOperationTable.row(noIdx).data().workOrdNo!=null 
			&& workOrderNonOperationTable.row(noIdx).data().workOrdNo!=""){
			
			$.ajax({
				url : '<c:url value="po/workOrderNonOperationDelete"/>',
				type : 'POST',
				data : {
					'workOrdNo' : function(){return workOrdNoVal;},
					'workOrdSeq' : function(){return workOrdSeqVal;},
				},
				success : function(res){
					if(res.result=="ok"){
						toastr.success("비가동 삭제되었습니다.");
						$('#workOrderNonOperationTable').DataTable().ajax.reload();
						
					}else{
						toastr.success(res.message);
					}
				}
			});
		}else{
			$('#workOrderNonOperationTable').DataTable().row(noIdx).remove().draw();
		}
	});
	
	//비가동등록 - 저장버튼 클릭시
	$('#noSave').on('click', function() {
		var dataArray = new Array();
		var check = true;
		
		if(workOrderNonOperationTable.data().count()>0){
			//처리시작..
			$('#my-spinner').show();
			
			$('#workOrderNonOperationTable tbody tr').each(function(index, item) {
				if ($(this).find('td select[name=noGubun]').val() == "") {
					toastr.warning('비가동 구분을 입력해주세요.');
					$(this).find('td input[name=noGubun]').focus();
					$('#my-spinner').hide();
					check = false;
					return false;
				}

				if ($(this).find('td input[name=noReason]').val() == "") {
					toastr.warning('사유를 입력해주세요.');
					$(this).find('td input[name=noReason]').focus();
					$('#my-spinner').hide();
					check = false;
					return false;
				}

				if ($(this).find('td input[name=noStartDate]').val() == "") {
					toastr.warning('시작일자를 입력해주세요.');
					$(this).find('td input[name=noStartDate]').focus();
					$('#my-spinner').hide();
					check = false;
					return false;
				}

				if ($(this).find('td input[name=noStartTime]').val() == "") {
					toastr.warning('시작시간을 입력해주세요.');
					$(this).find('td input[name=noStartTime]').focus();
					$('#my-spinner').hide();
					check = false;
					return false;
				}

				//*********			
				if(workStatusCdVal=="NE"){
					if ($(this).find('td input[name=noEndDate]').val() == "") {
						toastr.warning('종료일자를 입력해주세요.');
						$(this).find('td input[name=noEndDate]').focus();
						$('#my-spinner').hide();
						check = false;
						return false;
					}

					if ($(this).find('td input[name=noEndTime]').val() == "") {
						toastr.warning('종료시간을 입력해주세요.');
						$(this).find('td input[name=noEndTime]').focus();
						$('#my-spinner').hide();
						check = false;
						return false;
					}
				}	
				
				
				var rowData = new Object();
				rowData.workOrdNo = workOrdNoVal;
				//rowData.workOrdSeq = workOrdSeqVal;
				//rowData.middlePrcssCd = middlePrcssCdVal;
				//rowData.minorPrcssCd = minorPrcssCdVal;
				
				rowData.noGubun = $(this).find('td select[name=noGubun]').val();
				rowData.noReason = $(this).find('td input[name=noReason]').val();
				rowData.noStartTime = $(this).find('td input[name="noStartTime"]').val();
				rowData.noEndTime = $(this).find('td input[name="noEndTime"]').val();
				rowData.noStartDate = $(this).find('td input[name="noStartDate"]').val().replace(/-/g,'');
				rowData.noEndDate = $(this).find('td input[name="noEndDate"]').val().replace(/-/g,'');
				rowData.noTime = workOrderNonOperationTable.row(this).data().noTime;
				//rowData.noDesc = $(this).find('td input[name=noDesc]').val();
				dataArray.push(rowData);
			});
		}else{
			toastr.warning("우선 비가동등록을 해주세요.");
			check=false;
			return false;
		}
		

		var url = '<c:url value="/po/workOrderNonOperationCreate"/>';

		if(check==true) {
			$.ajax({
				url : url,
				type : 'POST',
				async:false,
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
						$('#workOrderNonOperationTable').DataTable().ajax.reload(function(){});
						$('#my-spinner').hide();
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//$('#workOrderPrcssTable').DataTable().ajax.reload( function () {});
				}
			});
		}

		getWorkTime();
	});


	//*******************작업조건******************
	function getWorkCond(){

		//1차작업조건시에만 생성
		if($('#histSeq option:selected').val()!="001"){
			$('.1cha').addClass('d-none');

			$('#inFixTemp1').val("");
			$('#inFixTemp2').val("");
			$('#inFixTemp3').val("");
			$('#inMoveTemp1').val("");
			$('#inMoveTemp2').val("");
			$('#inMoveTemp3').val("");
			
		}else{
			$('.1cha').removeClass('d-none');
		}
		
		//작업조건 등록유무
		$.ajax({
			url : '<c:url value="po/eqWorkHisAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'histSeq' : function(){return $('#histSeq option:selected').val()},
				'itemSeq' : function(){return itemSeqVal;},
			},
			success : function(res) {
				var data = res.data;
				var standData = res.standData;
				var condData = res.condData;
				
				if(data!=null){
					$('#stNzTemperature').val(data.stNzTemperature);	//NZ 온도
					$('#stH1Temperature').val(data.stH1Temperature);	//H1 온도
					$('#stH2Temperature').val(data.stH2Temperature);	//H2 온도
					$('#stH3Temperature').val(data.stH3Temperature);	//H3 온도
					$('#stH4Temperature').val(data.stH4Temperature);	//H4온도
					$('#stChgPosition1').val(data.stChgPosition1);		//계량거리 1차
					$('#stChgPosition2').val(data.stChgPosition2);		//계량거리 2차
					$('#stChgPosition3').val(data.stChgPosition3);		//계량거리 3차
					$('#stChgPosition4').val(data.stChgPosition4);		//계량거리 4차
					$('#stSuckBack').val(data.stSuckBack);				//계량완료
					$('#stInjPressure1').val(data.stInjPressure1);		//레이저압력 1차
					$('#stInjPressure2').val(data.stInjPressure2);		//레이저압력 2차
					$('#stInjPressure3').val(data.stInjPressure3);		//레이저압력 3차
					$('#stInjVelocity1').val(data.stInjVelocity1);		//레이저속도 1차
					$('#stInjVelocity2').val(data.stInjVelocity2);		//레이저속도 2차
					$('#stInjVelocity3').val(data.stInjVelocity3);		//레이저속도 3차
					$('#stInjPosition1').val(data.stInjPosition1);		//레이저거리 1차
					$('#stInjPosition2').val(data.stInjPosition2);		//레이저거리 2차
					$('#stInjPosition3').val(data.stInjPosition3);		//레이저거리 3차
					$('#stBackPressure1').val(data.stBackPressure1);	//배압 1차
					$('#stBackPressure2').val(data.stBackPressure2);	//배압 2차
					$('#stBackPressure3').val(data.stBackPressure3);	//배압 3차
					$('#stBackPressure4').val(data.stBackPressure4);	//배압 4차
					$('#stHldPressure1').val(data.stHldPressure1);		//보압 1차
					$('#stHldPressure2').val(data.stHldPressure2);		//보압 2차
					$('#stHldPressure3').val(data.stHldPressure3);		//보압 3차
					$('#stHldVel1').val(data.stHldVel1);				//보압속도 1차
					$('#stHldVel2').val(data.stHldVel2);				//보압속도 2차
					$('#stHldVel3').val(data.stHldVel3);				//보압속도 3차
					$('#stThermostat').val(data.stThermostat);			//온도조절기
					$('#stHydraulicOil').val(data.stHydraulicOil);		//작동유
					$('#stCoolwaterIn').val(data.stCoolwaterIn);		//냉각수IN
					$('#stCoolwaterOut').val(data.stCoolwaterOut);		//냉각수OUT
					
					//$('#stCoolwaterIn').val("±"+data.stCoolwaterIn+"℃");		//냉각수IN
					//$('#stCoolwaterOut').val("±"+data.stCoolwaterOut+"℃");		//냉각수OUT
					$('#stMoldFixed').val(data.stMoldFixed);			//금형(고정측)
					$('#stMoldMoving').val(data.stMoldMoving);			//금형(이동측)

					$('#inFixedOne').val(data.inFixedOne);				//내측 고정측 온도 1 표준
					$('#inFixedTwo').val(data.inFixedTwo);				//내측 고정측 온도 2 표준
					$('#inFixedThree').val(data.inFixedThree);			//내측 고정측 온도 3 표준
					$('#inMovingOne').val(data.inMovingOne);			//내측 이동측 온도 1 표준
					$('#inMovingTwo').val(data.inMovingTwo);			//내측 이동측 온도 2 표준
					$('#inMovingThree').val(data.inMovingThree);		//내측 이동측 온도 3 표준

					$('#cdNzTemperature').val(data.cdNzTemperature);	//NZ 온도
					$('#cdH1Temperature').val(data.cdH1Temperature);	//H1 온도
					$('#cdH2Temperature').val(data.cdH2Temperature);	//H2 온도
					$('#cdH3Temperature').val(data.cdH3Temperature);	//H3 온도
					$('#cdH4Temperature').val(data.cdH4Temperature);	//H4온도
					$('#cdChgPosition1').val(data.cdChgPosition1);		//계량거리 1차
					$('#cdChgPosition2').val(data.cdChgPosition2);		//계량거리 2차
					$('#cdChgPosition3').val(data.cdChgPosition3);		//계량거리 3차
					$('#cdChgPosition4').val(data.cdChgPosition4);		//계량거리 4차
					$('#cdSuckBack').val(data.cdSuckBack);				//계량완료
					$('#cdInjPressure1').val(data.cdInjPressure1);		//레이저압력 1차
					$('#cdInjPressure2').val(data.cdInjPressure2);		//레이저압력 2차
					$('#cdInjPressure3').val(data.cdInjPressure3);		//레이저압력 3차
					$('#cdInjVelocity1').val(data.cdInjVelocity1);		//레이저속도 1차
					$('#cdInjVelocity2').val(data.cdInjVelocity2);		//레이저속도 2차
					$('#cdInjVelocity3').val(data.cdInjVelocity3);		//레이저속도 3차
					$('#cdInjPosition1').val(data.cdInjPosition1);		//레이저거리 1차
					$('#cdInjPosition2').val(data.cdInjPosition2);		//레이저거리 2차
					$('#cdInjPosition3').val(data.cdInjPosition3);		//레이저거리 3차
					$('#cdBackPressure1').val(data.cdBackPressure1);	//배압 1차
					$('#cdBackPressure2').val(data.cdBackPressure2);	//배압 2차
					$('#cdBackPressure3').val(data.cdBackPressure3);	//배압 3차
					$('#cdBackPressure4').val(data.cdBackPressure4);	//배압 4차
					$('#cdHldPressure1').val(data.cdHldPressure1);		//보압 1차
					$('#cdHldPressure2').val(data.cdHldPressure2);		//보압 2차
					$('#cdHldPressure3').val(data.cdHldPressure3);		//보압 3차
					$('#cdHldVel1').val(data.cdHldVel1);				//보압속도 1차
					$('#cdHldVel2').val(data.cdHldVel2);				//보압속도 2차
					//$('#cdHldVel3').val(data.cdHldVel3);				//보압속도 3차
					$('#cdHldVel3').val("CMS 참조");						//쿠션량
					$('#cdThermostat').val(data.cdThermostat);			//온도조절기
					$('#cdHydraulicOil').val(data.cdHydraulicOil);		//작동유
					$('#cdCoolwaterIn').val(data.cdCoolwaterIn);		//냉각수IN
					$('#cdCoolwaterOut').val(data.cdCoolwaterOut);		//냉각수OUT
					$('#cdMoldFixed').val(data.cdMoldFixed);			//금형(고정측)
					$('#cdMoldMoving').val(data.cdMoldMoving);			//금형(이동측)


					$('#inFixTemp1').val(data.inFixTemp1);				//내측 고정측 온도1 조건
					$('#inFixTemp2').val(data.inFixTemp2);				//내측 고정측 온도2 조건
					$('#inFixTemp3').val(data.inFixTemp3);				//내측 고정측 온도3 조건
					$('#inMoveTemp1').val(data.inMoveTemp1);			//내측 이동측 온도1 조건
					$('#inMoveTemp2').val(data.inMoveTemp2);			//내측 이동측 온도2 조건
					$('#inMoveTemp3').val(data.inMoveTemp3);			//내측 이동측 온도3 조건

				}else{
					if(standData!=null){
						$('#stNzTemperature').val(standData.nzTemperature);		//NZ 온도
						$('#stH1Temperature').val(standData.h1Temperature);		//H1 온도
						$('#stH2Temperature').val(standData.h2Temperature);		//H2 온도
						$('#stH3Temperature').val(standData.h3Temperature);		//H3 온도
						$('#stH4Temperature').val(standData.h4Temperature);		//H4온도
						$('#stChgPosition1').val(standData.chgPosition1);		//계량거리 1차
						$('#stChgPosition2').val(standData.chgPosition2);		//계량거리 2차
						$('#stChgPosition3').val(standData.chgPosition3);		//계량거리 3차
						$('#stChgPosition4').val(standData.chgPosition4);		//계량거리 4차
						$('#stSuckBack').val(standData.suckBack);				//계량완료
						$('#stInjPressure1').val(standData.injPressure1);		//레이저압력 1차
						$('#stInjPressure2').val(standData.injPressure2);		//레이저압력 2차
						$('#stInjPressure3').val(standData.injPressure3);		//레이저압력 3차
						$('#stInjVelocity1').val(standData.injVelocity1);		//레이저속도 1차
						$('#stInjVelocity2').val(standData.injVelocity2);		//레이저속도 2차
						$('#stInjVelocity3').val(standData.injVelocity3);		//레이저속도 3차
						$('#stInjPosition1').val(standData.injPosition1);		//레이저거리 1차
						$('#stInjPosition2').val(standData.injPosition2);		//레이저거리 2차
						$('#stInjPosition3').val(standData.injPosition3);		//레이저거리 3차
						$('#stBackPressure1').val(standData.backPressure1);		//배압 1차
						$('#stBackPressure2').val(standData.backPressure2);		//배압 2차
						$('#stBackPressure3').val(standData.backPressure3);		//배압 3차
						$('#stBackPressure4').val(standData.backPressure4);		//배압 4차
						$('#stHldPressure1').val(standData.hldPressure1);		//보압 1차
						$('#stHldPressure2').val(standData.hldPressure2);		//보압 2차
						$('#stHldPressure3').val(standData.hldPressure3);		//보압 3차
						$('#stHldVel1').val(standData.hldVel1);					//보압속도 1차
						$('#stHldVel2').val(standData.hldVel2);					//보압속도 2차
						$('#stHldVel3').val(standData.hldVel3);					//보압속도 3차
						$('#stThermostat').val(standData.thermostat);			//온도조절기
						$('#stHydraulicOil').val(standData.hydraulicOil);		//작동유

						$('#stCoolwaterIn').val(standData.coolwaterIn);			//냉각수IN
						$('#stCoolwaterOut').val(standData.coolwaterOut);		//냉각수OUT
						
						//$('#stCoolwaterIn').val("±"+standData.coolwaterIn+"℃");			//냉각수IN
						//$('#stCoolwaterOut').val("±"+standData.coolwaterOut+"℃");		//냉각수OUT
						$('#stMoldFixed').val(standData.moldFixed);				//금형(고정측)
						$('#stMoldMoving').val(standData.moldMoving);			//금형(이동측)

						$('#inFixedOne').val(standData.inFixedOne);				//내측 고정측 온도 1 표준
						$('#inFixedTwo').val(standData.inFixedTwo);				//내측 고정측 온도 2 표준
						$('#inFixedThree').val(standData.inFixedThree);			//내측 고정측 온도 3 표준
						$('#inMovingOne').val(standData.inMovingOne);			//내측 이동측 온도 1 표준
						$('#inMovingTwo').val(standData.inMovingTwo);			//내측 이동측 온도 2 표준
						$('#inMovingThree').val(standData.inMovingThree);		//내측 이동측 온도 3 표준
						
					}else{
						$('.work-st').val('');
					}
					$('.work-cd').val('');
					$('#cdHldVel3').val("CMS 참조");						//쿠션량
					
					/* if(condData!=null){
						$('#cdNzTemperature').val(condData.nzTemperature);		//NZ 온도
						$('#cdH1Temperature').val(condData.h1Temperature);		//H1 온도
						$('#cdH2Temperature').val(condData.h2Temperature);		//H2 온도
						$('#cdH3Temperature').val(condData.h3Temperature);		//H3 온도
						$('#cdH4Temperature').val(condData.h4Temperature);		//H4온도
						$('#cdChgPosition1').val(condData.chgPosition1);		//계량거리 1차
						$('#cdChgPosition2').val(condData.chgPosition2);		//계량거리 2차
						$('#cdChgPosition3').val(condData.chgPosition3);		//계량거리 3차
						$('#cdChgPosition4').val(condData.chgPosition4);		//계량거리 4차
						$('#cdSuckBack').val(condData.suckBack);				//계량완료
						$('#cdInjPressure1').val(condData.injPressure1);		//레이저압력 1차
						$('#cdInjPressure2').val(condData.injPressure2);		//레이저압력 2차
						$('#cdInjPressure3').val(condData.injPressure3);		//레이저압력 3차
						$('#cdInjVelocity1').val(condData.injVelocity1);		//레이저속도 1차
						$('#cdInjVelocity2').val(condData.injVelocity2);		//레이저속도 2차
						$('#cdInjVelocity3').val(condData.injVelocity3);		//레이저속도 3차
						$('#cdInjPosition1').val(condData.injPosition1);		//레이저거리 1차
						$('#cdInjPosition2').val(condData.injPosition2);		//레이저거리 2차
						$('#cdInjPosition3').val(condData.injPosition3);		//레이저거리 3차
						$('#cdBackPressure1').val(condData.backPressure1);		//배압 1차
						$('#cdBackPressure2').val(condData.backPressure2);		//배압 2차
						$('#cdBackPressure3').val(condData.backPressure3);		//배압 3차
						$('#cdBackPressure4').val(condData.backPressure4);		//배압 4차
						$('#cdHldPressure1').val(condData.hldPressure1);		//보압 1차
						$('#cdHldPressure2').val(condData.hldPressure2);		//보압 2차
						$('#cdHldPressure3').val(condData.hldPressure3);		//보압 3차
						$('#cdHldVel1').val(condData.hldVel1);					//보압속도 1차
						$('#cdHldVel2').val(condData.hldVel2);					//보압속도 2차
						$('#cdHldVel3').val(condData.hldVel3);					//보압속도 3차
						$('#cdThermostat').val(condData.thermostat);			//온도조절기
						$('#cdHydraulicOil').val(condData.hydraulicOil);		//작동유
						$('#cdCoolwaterIn').val(condData.coolwaterIn);			//냉각수IN
						$('#cdCoolwaterOut').val(condData.coolwaterOut);		//냉각수OUT
						$('#cdMoldFixed').val(condData.moldFixed);				//금형(고정측)
						$('#cdMoldMoving').val(condData.moldMoving);			//금형(이동측)

						$('#inFixTemp1').val("");			//내측 고정측 온도1 조건
						$('#inFixTemp2').val("");			//내측 고정측 온도2 조건
						$('#inFixTemp3').val("");			//내측 고정측 온도3 조건
						$('#inMoveTemp1').val("");			//내측 이동측 온도1 조건
						$('#inMoveTemp2').val("");			//내측 이동측 온도2 조건
						$('#inMoveTemp3').val("");			//내측 이동측 온도3 조건

					}else{
						$('.work-cd').val('');
					} */
				}

				for(var i=0; i<40; i++){
					if(i=='30' || i=='31'){
						//냉각수IN/OUT인경우 상한/하한 별도
						var standVal = parseFloat($('#stCoolwaterOut').val().replace(/,/g,''));	
						var inVal = parseFloat($('#cdCoolwaterIn').val().replace(/,/g,''));		
						
						var outVal = parseFloat($('#cdCoolwaterOut').val().replace(/,/g,''));		
						if(!isNaN(standVal) && !isNaN(inVal)){
							var standLower = inVal-standVal;	//하한
							var standUpper = inVal+standVal;	//상한값

							if((standLower>outVal) || (outVal>standUpper)){
								$('#cdCoolwaterIn').css('background','red');
								$('#cdCoolwaterOut').css('background','red');
							}else{
								$('#cdCoolwaterIn').css('background','white');
								$('#cdCoolwaterOut').css('background','white');
							}
						}else{
							$('#cdCoolwaterIn').attr('disabled',true);
							$('#cdCoolwaterIn').css('background','#eeeeee');
							$('#cdCoolwaterOut').attr('disabled',true);
							$('#cdCoolwaterOut').css('background','#eeeeee');
						}
						
					}else{
						var standVal = $('input[name=stand]').eq(i).val().split('~');
						var standLower = parseFloat(standVal[0].replace(/,/g,''));
						var standUpper = parseFloat(standVal[1].replace(/,/g,''));
						var condVal = parseFloat($('input[name=condition]').eq(i).val().replace(/,/g,''));
						
						if(!isNaN(standLower) && !isNaN(standUpper)){
							if((standLower>condVal) || (condVal>standUpper)){
								$('input[name=condition]').eq(i).css('background','red');
							}else{
								$('input[name=condition]').eq(i).css('background','#eeeeee');
							}
						}else{
							$('input[name=condition]').eq(i).attr('disabled',true);
							$('input[name=condition]').eq(i).css('background','#eeeeee');
						}
					}
				}
			}
		});
		
	}


	//작업조건 조건변경시
	function changeCond(idx){
		
		if(idx!='30'){
			var standVal = $('input[name=stand]').eq(idx).val().split('~');
			
			if(isNull(standVal)){
				toastr.warning("표준을 입력해주세요.");
				return false;
			}
			
			var standLower = parseFloat(standVal[0].replace(/,/g,''));
			var standUpper = parseFloat(standVal[1].replace(/,/g,''));
			var condVal = parseFloat($('input[name=condition]').eq(idx).val().replace(/,/g,''));

			console.log("standLower:"+standLower)
			console.log("standUpper:"+standUpper)
			
			if(!isNaN(standLower) && !isNaN(standUpper)){
				if((standLower>condVal) || (condVal>standUpper)){
					$('input[name=condition]').eq(idx).css('background','red');
				}else{
					$('input[name=condition]').eq(idx).css('background','white');
				}
			}else{
				if(condVal!=""){
					$('input[name=condition]').eq(idx).css('background','red');
				}
			}
		}else{
			var standVal = parseFloat($('input[name=stand]').eq(idx).val().replace(/,/g,''));	//3
			var inVal = parseFloat($('#cdCoolwaterIn').val().replace(/,/g,''));		//10
			var outVal = parseFloat($('#cdCoolwaterOut').val().replace(/,/g,''));		//10
			console.log("standVal:"+standVal)
			console.log("inVal:"+inVal)
			console.log("outVal:"+outVal)
			
			if(isNaN(standVal)){
				toastr.warning("냉각수 IN/OUT 표준을 입력해주세요.");
				return false;
			}

			if(isNaN(inVal)){
				toastr.warning("냉각수IN 조건을 입력해주세요.");
				return false;
			}


			var standLower = inVal-standVal;	//하한
			var standUpper = inVal+standVal;	//상한값
			console.log("standLower:"+standLower)
			console.log("standUpper:"+standUpper)

			if((standLower>outVal) || (outVal>standUpper)){
				$('#cdCoolwaterIn').css('background','red');
				$('#cdCoolwaterOut').css('background','red');
			}else{
				$('#cdCoolwaterIn').css('background','white');
				$('#cdCoolwaterOut').css('background','white');
			}
		}
		
	}

	
	
	//작업조건 - 수정버튼 클릭시
	$('#btnWorkConEdit').on('click',function(){

		if($('#histSeq option:selected').val()==""){
			toastr.warning("작업조건 차수를 선택해주세요");
			return false;
		}
		
		
		//작업조건 수정시 onchage
		for(var i=2; i<=14 ; i+=4){
			for(var j=0; j<=11; j++){
				if($('#workConPopUpTable > thead > tr ').eq(i).find('td input').eq(j).val()!=null){
					if($('#workConPopUpTable > thead > tr ').eq(i).find('td input').eq(j).attr('style').indexOf('red')==-1){
						$('#workConPopUpTable > thead > tr ').eq(i).find('td input').eq(j).css('background','white').css('border','1px solid lightgray');
					}
				}
			}
		}

		$('input[name=condition]').attr('disabled',false);
		//쿠션량
		$('#cdHldVel3').attr('disabled',true);
		$('#cdHldVel3').css('border','none');
	});

	//작업조건 - 저장버튼 클릭시
	$('#btnWorkConSave').on('click',function(){

		//처리중...
		$('#my-spinner').show();

		$.ajax({
			url : '<c:url value="po/eqWorkHisAdmCreate" />',
			type : 'POST',
			data : {
				'workOrdNo' : workOrdNoVal,
				'histSeq' : function(){return $('#histSeq option:selected').val()}, 
				
				'stNzTemperature' : $('#stNzTemperature').val(),
				'stH1Temperature' : $('#stH1Temperature').val(),
				'stH2Temperature' : $('#stH2Temperature').val(),
				'stH3Temperature' : $('#stH3Temperature').val(),
				'stH4Temperature' : $('#stH4Temperature').val(),
				'stChgPosition1'  : $('#stChgPosition1').val(),
				'stChgPosition2'  : $('#stChgPosition2').val(),
				'stChgPosition3'  : $('#stChgPosition3').val(),
				'stChgPosition4'  : $('#stChgPosition4').val(),
				'stSuckBack'      : $('#stSuckBack').val(),
				'stInjPressure1'  : $('#stInjPressure1').val(),
				'stInjPressure2'  : $('#stInjPressure2').val(),
				'stInjPressure3'  : $('#stInjPressure3').val(),
				'stInjVelocity1'  : $('#stInjVelocity1').val(),
				'stInjVelocity2'  : $('#stInjVelocity2').val(),
				'stInjVelocity3'  : $('#stInjVelocity3').val(),
				'stInjPosition1'  : $('#stInjPosition1').val(),
				'stInjPosition2'  : $('#stInjPosition2').val(),
				'stInjPosition3'  : $('#stInjPosition3').val(),
				'stBackPressure1' : $('#stBackPressure1').val(),
				'stBackPressure2' : $('#stBackPressure2').val(),
				'stBackPressure3' : $('#stBackPressure3').val(),
				'stBackPressure4' : $('#stBackPressure4').val(),
				'stHldPressure1'  : $('#stHldPressure1').val(),
				'stHldPressure2'  : $('#stHldPressure2').val(),
				'stHldPressure3'  : $('#stHldPressure3').val(),
				'stHldVel1'       : $('#stHldVel1').val(),
				'stHldVel2'       : $('#stHldVel2').val(),
				'stHldVel3'       : $('#stHldVel3').val(),
				'stThermostat'    : $('#stThermostat').val(),
				'stHydraulicOil'  : $('#stHydraulicOil').val(),
				'stCoolwaterIn'   : $('#stCoolwaterIn').val(),
				'stCoolwaterOut'  : $('#stCoolwaterOut').val(),
				'stMoldFixed'     : $('#stMoldFixed').val(),
				'stMoldMoving'    : $('#stMoldMoving').val(),
				'inFixedOne'      : $('#inFixedOne').val()==null||$('#inFixedOne').val()==""?"":$('#inFixedOne').val(),   
				'inFixedTwo' 	  : $('#inFixedTwo').val()==null||$('#inFixedTwo').val()==""?"":$('#inFixedTwo').val(),    
				'inFixedThree'    : $('#inFixedThree').val()==null||$('#inFixedThree').val()==""?"":$('#inFixedThree').val(),   
				'inMovingOne'     : $('#inMovingOne').val()==null||$('#inMovingOne').val()==""?"":$('#inMovingOne').val(),    
				'inMovingTwo'     : $('#inMovingTwo').val()==null||$('#inMovingTwo').val()==""?"":$('#inMovingTwo').val(),    
				'inMovingThree'   : $('#inMovingThree').val()==null||$('#inMovingThree').val()==""?"":$('#inMovingThree').val(),    
		
				'cdNzTemperature' : $('#cdNzTemperature').val(),
				'cdH1Temperature' : $('#cdH1Temperature').val(),
				'cdH2Temperature' : $('#cdH2Temperature').val(),
				'cdH3Temperature' : $('#cdH3Temperature').val(),
				'cdH4Temperature' : $('#cdH4Temperature').val(),
				'cdChgPosition1'  : $('#cdChgPosition1').val(), 
				'cdChgPosition2'  : $('#cdChgPosition2').val(), 
				'cdChgPosition3'  : $('#cdChgPosition3').val(), 
				'cdChgPosition4'  : $('#cdChgPosition4').val(), 
				'cdSuckBack'      : $('#cdSuckBack').val(),     
				'cdInjPressure1'  : $('#cdInjPressure1').val(), 
				'cdInjPressure2'  : $('#cdInjPressure2').val(), 
				'cdInjPressure3'  : $('#cdInjPressure3').val(), 
				'cdInjVelocity1'  : $('#cdInjVelocity1').val(), 
				'cdInjVelocity2'  : $('#cdInjVelocity2').val(), 
				'cdInjVelocity3'  : $('#cdInjVelocity3').val(), 
				'cdInjPosition1'  : $('#cdInjPosition1').val(), 
				'cdInjPosition2'  : $('#cdInjPosition2').val(), 
				'cdInjPosition3'  : $('#cdInjPosition3').val(), 
				'cdBackPressure1' : $('#cdBackPressure1').val(),
				'cdBackPressure2' : $('#cdBackPressure2').val(),
				'cdBackPressure3' : $('#cdBackPressure3').val(),
				'cdBackPressure4' : $('#cdBackPressure4').val(),
				'cdHldPressure1'  : $('#cdHldPressure1').val(), 
				'cdHldPressure2'  : $('#cdHldPressure2').val(), 
				'cdHldPressure3'  : $('#cdHldPressure3').val(), 
				'cdHldVel1'       : $('#cdHldVel1').val(),      
				'cdHldVel2'       : $('#cdHldVel2').val(),      
				'cdHldVel3'       : $('#cdHldVel3').val(),      
				'cdThermostat'    : $('#cdThermostat').val(),   
				'cdHydraulicOil'  : $('#cdHydraulicOil').val(), 
				'cdCoolwaterIn'   : $('#cdCoolwaterIn').val(),  
				'cdCoolwaterOut'  : $('#cdCoolwaterOut').val(), 
				'cdMoldFixed'     : $('#cdMoldFixed').val(),    
				'cdMoldMoving'    : $('#cdMoldMoving').val(),  

				'inFixTemp1'      : $('#inFixTemp1').val()==null||$('#inFixTemp1').val()==""?"":$('#inFixTemp1').val(),   
				'inFixTemp2' 	  : $('#inFixTemp2').val()==null||$('#inFixTemp2').val()==""?"":$('#inFixTemp2').val(),    
				'inFixTemp3'      : $('#inFixTemp3').val()==null||$('#inFixTemp3').val()==""?"":$('#inFixTemp3').val(),   
				'inMoveTemp1'     : $('#inMoveTemp1').val()==null||$('#inMoveTemp1').val()==""?"":$('#inMoveTemp1').val(),    
				'inMoveTemp2'     : $('#inMoveTemp2').val()==null||$('#inMoveTemp2').val()==""?"":$('#inMoveTemp2').val(),    
				'inMoveTemp3'     : $('#inMoveTemp3').val()==null||$('#inMoveTemp3').val()==""?"":$('#inMoveTemp3').val(),    
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("작업조건 수정되었습니다.");
					$('input[name=condition]').attr('disabled',true);
					$('input[name=condition]').css('border','white');

					//처리완료...
					$('#my-spinner').hide();
				}
			}
		});
		
	});


	
	// 자재투입 - 내역
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
			{ data : 'barcodeNo'},
			/* { data : 'itemCd' }, */
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
			{ data : 'totalConsumpt' },
			{ data : 'useQty' },
			{ data : 'realQty' },
			{ data : 'itemCel'},
			{ data : 'itemHr'},
			{ data : 'matrlCel',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control" name="matrlCel" value="'+data+'" style="background:#ffa50085; text-align:center;" onkeyup="numberFormat(this, \'float\')" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtCel']+'\',\''+row['lowerAmtCel']+'\',\'matrlCel\');"/>';
					}else{
						return '<input type="text" class="form-control" name="matrlCel" value="" style="background:#ffa50085;text-align:center;" onkeyup="numberFormat(this, \'float\')" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtCel']+'\',\''+row['lowerAmtCel']+'\',\'matrlCel\');"/>';
					}
					/* if(mainWorkStatusCd!="WE"){
						if(data!=null){
							return '<input type="text" class="form-control" name="matrlCel" value="'+data+'" style="background:#ffa50085; text-align:center;" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtCel']+'\',\''+row['lowerAmtCel']+'\',\'matrlCel\');"/>';
						}else{
							return '<input type="text" class="form-control" name="matrlCel" value="" style="background:#ffa50085;text-align:center;" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtCel']+'\',\''+row['lowerAmtCel']+'\',\'matrlCel\');"/>';
						}
					}else{
						return '<input type="text" class="form-control" name="matrlCel" value="" style="background:#ffa50085;text-align:center;" disabled/>';
					} */
				}
			},
			{ data : 'matrlHr',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control" name="matrlHr" value="'+data+'" style="background:#ffa50085;text-align:center;" onkeyup="numberFormat(this, \'float\')" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtHr']+'\',\''+row['lowerAmtHr']+'\',\'matrlHr\');"/>';
					}else{
						return '<input type="text" class="form-control" name="matrlHr" value="" style="background:#ffa50085;text-align:center;" onkeyup="numberFormat(this, \'float\')" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtHr']+'\',\''+row['lowerAmtHr']+'\',\'matrlHr\');"/>';
					}
					/* if(mainWorkStatusCd!="WE"){
						if(data!=null){
							return '<input type="text" class="form-control" name="matrlHr" value="'+data+'" style="background:#ffa50085;text-align:center;" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtHr']+'\',\''+row['lowerAmtHr']+'\',\'matrlHr\');"/>';
						}else{
							return '<input type="text" class="form-control" name="matrlHr" value="" style="background:#ffa50085;text-align:center;" onchange="matrlCondUpdate(\''+row['barcodeNo']+'\',\''+meta.row+'\',\''+row['upperAmtHr']+'\',\''+row['lowerAmtHr']+'\',\'matrlHr\');"/>';
						}
					}else{
						return '<input type="text" class="form-control" name="matrlHr" value="" style="background:#ffa50085;text-align:center;" disabled/>';
					} */
				}
			},
			{
				data : 'moisPass', 
				render : function(data, type, row, meta) {
					if(data!=null){
						if(data=="001"){
							return '<input type="text" class="form-control" style="color:white;background: blue;text-align: center;" value="합격" disabled>';
						}else if(data=="002"){
							return '<input type="text" class="form-control" style="color:white;background: red;text-align: center;" value="불합격" disabled>';
						}else{
							return '<input type="text" class="form-control" style="color:white;background: #959595;text-align: center;" value="미판정" disabled>';
						}
					}else{
						return '<input type="text" class="form-control" style="color:white;background: #959595;text-align: center;" value="미판정" disabled>';
					}
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		columnDefs: [
			{ targets: [4,5,6], render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
			{ targets: [0,1,2,3,7,8,9,10,11], className: 'text-center-td' },
	    ],
	    drawCallback : function(set){
	    	$('input').css('font-size','120%').css('height','2rem');

	    	var api = this.api();
	    	
	    	for(var i=0; i<api.data().count(); i++){

				//건조조건(CEL)
		    	if(api.row(i).data().matrlCel!=null){
		    		if((parseFloat(api.row(i).data().lowerAmtCel) <= parseFloat(api.row(i).data().matrlCel)) && (parseFloat(api.row(i).data().matrlCel) <= parseFloat(api.row(i).data().upperAmtCel))){
		    			$('input[name=matrlCel]').eq(i).css('background','#92d050');
			    	}else{
			    		$('input[name=matrlCel]').eq(i).css('background','#ff0000');
				    }
			    }

	    		//건조조건(HR)
		    	if(api.row(i).data().matrlHr!=null){
		    		if((parseFloat(api.row(i).data().lowerAmtHr) <= parseFloat(api.row(i).data().matrlHr)) && (parseFloat(api.row(i).data().matrlHr) <= parseFloat(api.row(i).data().upperAmtHr))){
		    			$('input[name=matrlHr]').eq(i).css('background','#92d050');
			    	}else{
			    		$('input[name=matrlHr]').eq(i).css('background','#ff0000');
				    }
		    	}
		    }
	    	
		},
	    buttons: []
	});


	let matrlIdx = null;
	//자재투입 - 자재투입 목록 선택시
	$('#workOrderMatrlTable tbody').on('click','tr', function () {
		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
 			return false;
		} else {
			$('#workOrderMatrlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		} 

		matrlIdx = $('#workOrderMatrlTable').DataTable().row(this).index();
		matrlDateVal = workOrderMatrlTable.row(matrlIdx).data().matrlDate;

		var tr = $(this).closest('tr');
        var row = workOrderMatrlTable.row( tr );
        var idx = $.inArray( tr.attr('id'), detailRows );

        if ( row.child.isShown() ) {
            tr.removeClass( 'details' );
            row.child.hide();
 
            // Remove from the 'open' array
            detailRows.splice( idx, 1 );
        } else {
            tr.addClass( 'details' );
            row.child( format( row.data() ) ).show();
 
            // Add to the 'open' array
            if ( idx === -1 ) {
                detailRows.push( tr.attr('id') );
            }
        }
	});

	workOrderMatrlTable.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } ); 

	//수분측정 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var workOrderMatrlHtml = '';

		$.ajax({
			url: '<c:url value="qm/itemMoisMeasureDtlList"/>',
            type: 'GET',
            data: {
            	'workOrdNo' : function() {return workOrdNoVal;},
				'matrlDate' : function() { return matrlDateVal;},		
            },
            async: false,
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                	workOrderMatrlHtml	 = '<table class="table table-bordered">';
                	workOrderMatrlHtml	+= '	<thead class="thead-light">';
                	workOrderMatrlHtml	+= '		<tr>';
        			workOrderMatrlHtml	+= '			<th style="">차수</th>';
        			workOrderMatrlHtml	+= '			<th style="">측정일자</th>';
        			workOrderMatrlHtml	+= '			<th style="">측정시간</th>';
        			workOrderMatrlHtml	+= '			<th style="">측정자</th>';
        			workOrderMatrlHtml	+= '			<th style="">건조온도</th>';
        			workOrderMatrlHtml	+= '			<th style="">수분함유량</th>';
        			workOrderMatrlHtml	+= '			<th style="">판정</th>';
        			workOrderMatrlHtml	+= '		</tr>';
        			workOrderMatrlHtml	+= '	</thead>';
        			workOrderMatrlHtml	+= '	<tbody>';
                    for(var i=0;i<data.length;i++) {
                    	workOrderMatrlHtml	+= '		<tr>';
                    	workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].moisSeq+'</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+moment(data[i].moisDate).format('YYYY-MM-DD')+'</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].moisTime+'</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].moisChargrNm+'</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].moisTempNm+'℃</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].inspX1+'</td>';
            			workOrderMatrlHtml	+= '			<td class="text-center-td">'+data[i].moisPassNm+'</td>';
            			workOrderMatrlHtml	+= '		</tr>';
                    }
                    workOrderMatrlHtml	+= '	</tbody>';
                    workOrderMatrlHtml	+= '</table>';
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return workOrderMatrlHtml;
	}
	//수분측정 상세내역 끝
	
	//자재투입 - 자재바코드스캔
	$('#matrlBarcodeNoScan').keypress(function (e) {

		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시에는 자재투입 할 수 없습니다.");
			return false;
		}

		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비명을 선택해주세요.");
			$('#btnEquipNm').focus();
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
				url : '<c:url value="po/matrlBarcodeNoScan"/>',
				type : 'POST',
				data : {					     
		            'menuAuth'			:	'posc0010',
		            'workOrdNo' 		:	workOrdNoVal,
		            'workOrdSeq' 		:	'0',
		            'minorPrcssCd'		:	'0',
	            	'middlePrcssCd'		:	'0',
	            	'barcodeNo'			:	barcodeNoVal,
	            	'matrlDate'			:	$('#clock').text().substring(0,10).replace(/-/g,''),
	            	'locationNo' 		: 	outLocNoVal,
	            	'locationCd' 		: 	outLocVal,
	            	'areaCd' 			: 	outAreaVal,
	            	'floorCd' 			: 	outFloorVal,
	            	'itemSeq'			:	itemSeqVal,
				},				
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success(res.message);
						$('#workOrderMatrlTable').DataTable().ajax.reload( function () {
							$('#matrlBarcodeNoScan').val('');
							$('#matrlBarcodeNoScan').focus();
						}); // 자재투입내역 새로고침
						
					} else if(res.result == 'fifo') {
						$('#fifoBtnModal').modal('show');
						
					} else if(res.result == 'popup') {
						$('#message').text(res.message);
						$('#locChangeBtnModal').modal('show');
						
					} else if(res.result == 'fail') {
						toastr.warning(res.message)
						$('#matrlBarcodeNoScan').select();
						
					}  else  {
						toastr.error(res.message);
						$('#matrlBarcodeNoScan').select();
					}
				}
			});
		}
	});

	//자재투입-새로고침 버튼
	$('#btnMatrlRefresh').on('click',function(){
		$('#workOrderMatrlTable').DataTable().ajax.reload( function () {});
	});


	//다른 창고로 자재이동
	$('#locChangeY').on('click',function(){
		$.ajax({
			url : '<c:url value="po/moveMatrlList"/>',
			type : 'POST',
			data : {					     
	            'menuAuth'			:	'posc0010',
	            'workOrdNo' 		:	workOrdNoVal,
	            'workOrdSeq' 		:	'0',
	            'minorPrcssCd'		:	'0',
            	'middlePrcssCd'		:	'0',
            	'barcodeNo'			:	barcodeNoVal,
            	'matrlDate'			:	$('#clock').text().substring(0,10).replace(/-/g,''),
            	'locationNo' 		: 	outLocNoVal,
            	'locationCd' 		: 	outLocVal,
            	'areaCd' 			: 	outAreaVal,
            	'floorCd' 			: 	outFloorVal,
            	'itemSeq'			:	itemSeqVal,
			},				
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
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
	});
	

	//자재투입 - 건조기준 수정
	function matrlCondUpdate(barcode,row,upper,lower,name){
		barcodeNoVal = barcode;
		let matrlCondVal = $('input[name='+name+']').eq(row).val();
		
		if((parseFloat(lower) <= parseFloat(matrlCondVal)) && (parseFloat(matrlCondVal) <= parseFloat(upper))  ){
			$('input[name='+name+']').eq(row).css('background','#92d050');
			
		}else{
			$('input[name='+name+']').eq(row).css('background','#ff0000');
			toastr.warning("건조기준값을 초과했습니다.")
		}

		$.ajax({
			url : '<c:url value="po/workOrdMatrlEdit"/>',
			type : 'POST',
			data : {					     
	            'menuAuth'			:	'posc0021',
	            'workOrdNo' 		:	workOrdNoVal,
	            'workOrdSeq' 		:	"0",
	            'minorPrcssCd'		:	"0",
            	'middlePrcssCd'		:	"0",
            	'barcodeNo'			:	barcodeNoVal,
            	'matrlCel'			:	function(){return $('#'+barcodeNoVal).find('input[name=matrlCel]').val()},
            	'matrlHr'			:	function(){return $('#'+barcodeNoVal).find('input[name=matrlHr]').val()},
			},				
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
				}else  {
					toastr.error(res.message);
				}
			}
		}); 
	};
			

	//자재투입 - 삭제 버튼 클릭시
	$('#btnMatrlDel').on('click',function(){
		if(matrlIdx==null){
			toastr.warning("삭제할 자재를 선택해주세요.");
			return false;
		}
	});

	

	//자재투입 - 출고내역 버튼 클릭시
	var preOutWhsBarcodePopupTable=null;
	function workOutWhsList(){
		
		if (preOutWhsBarcodePopupTable == null || preOutWhsBarcodePopupTable == undefined) {
			preOutWhsBarcodePopupTable = $('#preOutWhsBarcodePopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : false,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="io/preOutWhsAdmRead"/>',
					type : 'GET',
					data : {
						 'locationNo'  : function(){return outLocNoVal;},
					}
				},
				rowId : 'contNo',
				columns : [ 
					{data : 'workOrdNo'}, 
					{data : 'barcodeNo'}, 
					{data : 'itemCd'}, 
					{data : 'itemNm'}, 
					{data : 'itemModelNm'}, 
					{data : 'totalConsumpt',
						render: function(data, type, row, meta) {
							if(data!=null){
								return addCommas(data);
							}else{
								return '0';
							}
							
						},
						"className": "text-right",
					},
					{data : 'preOutQty' ,
						render: function(data, type, row, meta) {
							if(data != null){
								return addCommas(data);
							}else{
								return '0';
							}
						},
						"className": "text-right",
					},
					{data : 'outQty',
						render: function(data, type, row, meta) {
							if(data!=null){
								return addCommas(data);
							}else{
								return '0';
							}
						},
						"className": "text-right",
					}, 
					{data : 'statusCd',
						render: function(data, type, row, meta) {
							if(data=="P"){
								return '<span>투입완료</span>';
							}else if(data=="O"){
								return '<span style="color:red;"><b>미투입</b></span>';
							}else{
								return '<span>-</span>';
							}
						}
					}, 
				],
				columnDefs : [
					{targets : [4,5,6],render : $.fn.dataTable.render.number(','),className : 'text-right'} ,
					{"targets" : '_all' , "className" : "text-center"},
				],
				drawCallback : function(){
					var api = this.api();
					for(var i=0; i<api.data().count(); i++){
						if(api.row(i).data().statusCd=="O"){
							$('#preOutWhsBarcodePopupTable tbody tr').eq(i).css('background','yellow');
						}
					}
				},
				order : [ [ 0, 'asc' ] ],
			});

		}else{
			$('#preOutWhsBarcodePopupTable').DataTable().ajax.reload(function() {});
		}
		$('#preOutWhsBarcodePopupModal').modal('show');		
	};

	

	//가동시작 버튼 클릭시
	$('#btnWorkStart').on('click',function(){

		//작업상태가 작업종료 일 경우
		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시입니다.");
			return false;
		}
		//작업상태가 비가동시작 일 경우
		if(mainWorkStatusCd=="NS"){
			toastr.warning("가동종료 또는 비가동종료 한 후에 가동시작 할 수 있습니다.");
			return false;
		}

		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			$('#btnWorkOrdNo').focus();
			return false;
		}

		if(!$.trim($('#workChargr').val())){
			toastr.warning("작업자를 선택해주세요.");
			$('#workChargr').focus();
			check=false;
			return false;
		}
		
		if(!$.trim($('#workGubun').val())){
			toastr.warning("작업구분을 선택해주세요.");
			$('#workGubun').focus();
			check=false;
			return false;
		}
		
		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비를 등록 해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#workMethod').val())){
			toastr.warning("작업방식을 선택해주세요.");
			$('#workMethod').focus();
			check=false;
			return false;
		}


		if(!$.trim($('#equipCheck1').val())){
			toastr.warning("설비점검을 등록해주세요.");
			$('#equipCheck1').focus();
			check=false;
			return false;
		}

		if(!$.trim($('#moldNo').val())){
			toastr.warning("해당 제품의 금형코드를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#moldLocation').val())){
			toastr.warning("해당 제품의 금형위치를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#cavityCnt').val())){
			toastr.warning("해당 제품의 Cavity를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#equipCheck2').val())){
			toastr.warning("금형점검을 등록해주세요.");
			$('#equipCheck2').focus();
			check=false;
			return false;
		}
		

		let emptyCount=0;
		//작업조건 예외처리
		
		$('input[name=condition]').each(function(index, item) {
			if($(this).val()==null || $(this).val()==""){
				if($('input[name=stand]').eq(index).val()!=""){
					emptyCount++;
				}
			}
		});

		if(emptyCount>0){
			toastr.warning("작업조건을 등록해주세요.");
			emptyCount=0;
			$('#tab5Nav').trigger('click');
			check=false;
			return false;
		}

		//자재투입 예외처리
		if(workOrderMatrlTable.data().count()==0){
			toastr.warning("자재투입 해주세요.");
			$('#tab1Nav').trigger('click');
			check=false;
			return false;
		}else{
			for(var i=0; i<workOrderMatrlTable.data().count(); i++){
				if(workOrderMatrlTable.row(i).data().moisPass!="001"){
					emptyCount++;
				}
			}
			if(emptyCount>0){
				toastr.warning("수분측정이 미판정이거나 불합격입니다.");
				emptyCount=0;
				check=false;
				return false;
			}
		}

		$('#tab2Nav').removeClass('disabled');	//생산실적등록 탭 활성화
		$('#tab3Nav').removeClass('disabled');	//불량등록 탭 활성화
		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
		$('#tab6Nav').removeClass('disabled');  //자주검사 탭 활성화
		
		
		//비가동 등록
		$.ajax({
			url : '<c:url value="/po/workOrderNonOperationUpdate"/>',
			type : 'POST',
			async : true,
			data : {
				'workOrdNo' : workOrdNoVal,
				'workOrdSeq' : "0",
				'minorPrcssCd' : "0",
				'middlePrcssCd' : "0",
				'noGubun' : "009",	//가동
				'noReason' : "",
				'noStartDate' : $('#clock').text().substring(0,10).replace(/-/g,''),
				'noStartTime' : $('#clock').text().substring(11,16).replace(/-/g,''),
				'noEndDate' : "",
				'noEndTime' : "",
				'noTime' : "",
				'itemSeq'	 : itemSeqVal,
				'workStatusCd' : "PS",
				'mainWorkChargr' : $('#workChargr').val(),
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.warning("가동시작 되었습니다.");
					$('#btnWorkStart').css('background','#346cb0'); 	//가동시작 버튼 녹색
					$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 회색
					$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 회색
					$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 회색
					$('#btnMainWorkEnd').css('background','#959595');	//작업종료 버튼 회색

					$('#workStatusNm').text("가동시작");
			    	$('.text-bg').css('background',"#346cb0");
			    	mainWorkStatusCd='PS';
				}else if(res.result=="noRespon"){
					toastr.warning("가동종료 한 후에 가동시작 할 수 있습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		});
	});


	//가동종료 버튼 클릭시
	$('#btnWorkEnd').on('click',function(){
		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			return false;
		}

		//작업상태가 작업종료 일 경우
		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시입니다.");
			return false;
		}

		if(mainWorkStatusCd!="PS"){
			toastr.warning("가동시작 한 후에 가동종료 할 수 있습니다.");
			return false;
		}

		if($('#fuzzQty').val()==""){
			toastr.warning("퍼징량(g)을 입력해주세요.");
			$('#fuzzQty').focus();
			return false;
		}

		if($('#runnerQty').val()==""){
			toastr.warning("런너량(g)을 입력해주세요.");
			$('#runnerQty').focus();
			return false;
		}

		//비가동 등록 
    	$.ajax({
			url : '<c:url value="/po/workOrderNonOperationUpdate"/>',
			type : 'POST',
			async : true,
			data : {
				'workOrdNo' : workOrdNoVal,
				'workOrdSeq' : "0",
				'minorPrcssCd' : "0",
				'middlePrcssCd' : "0",
				'noGubun' : "009",	//가동
				'noReason' : "",
				'noStartDate' : "",
				'noStartTime' : "",
				'noEndDate' : $('#clock').text().substring(0,10).replace(/-/g,''),
				'noEndTime' : $('#clock').text().substring(11,16).replace(/-/g,''),
				'noTime' : "",
				'itemSeq'	 : itemSeqVal,
				'workStatusCd' : "PE",
				'locationCd' : outLocVal,
				'fuzzQty'	: $('#fuzzQty').val().replace(/,/g,''),
				'runnerQty'	: $('#runnerQty').val().replace(/,/g,'')
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.warning("가동종료 되었습니다.");
					$('#workOrderMatrlTable').DataTable().ajax.reload();
					$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 회색
					$('#btnWorkEnd').css('background','#008000'); 		//가동종료 버튼 녹색
					$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 회색
					$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 회색
					$('#btnMainWorkEnd').css('background','#959595');	//작업종료 버튼 회색

					$('#workStatusNm').text("가동종료");
			    	$('.text-bg').css('background',"#008000");
			    	mainWorkStatusCd='PE';
				}else if(res.result=="noRespon"){
					toastr.warning("가동시작 한 후에 가동종료 할 수 있습니다.");
				}else if(res.result=="fail"){
					toastr.warning(res.message);
				}else if(res.result=="lack"){
					$('#workOrderMatrlTable').DataTable().ajax.reload();
					$('#btnWorkStart').css('background','#346cb0'); 	//가동시작 버튼 회색
					$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 녹색
					$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 회색
					$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 회색
					$('#btnMainWorkEnd').css('background','#959595');	//작업종료 버튼 회색

					$('#workStatusNm').text("가동시작");
			    	$('.text-bg').css('background',"#346cb0");
			    	mainWorkStatusCd='PS';
					toastr.warning(res.message);
				}else {
					toastr.error(res.message);
				}
			}
		});
    
	});

	//비가동시작 버튼 클릭시
	$('#btnWorkNonStart').on('click',function(){

		//작업상태가 작업종료 일 경우
		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시입니다.");
			return false;
		}

		if(mainWorkStatusCd=="PS"){
			toastr.warning("가동종료 한 후에 비가동시작 할 수 있습니다.");
			return false;
		}

		if(mainWorkStatusCd=="NS"){
			toastr.warning("비가동종료 한 후에 비가동시작 할 수 있습니다.");
			return false;
		}

		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			$('#btnWorkOrdNo').focus();
			return false;
		}

		if(!$.trim($('#workChargr').val())){
			toastr.warning("작업자를 선택해주세요.");
			$('#workChargr').focus();
			check=false;
			return false;
		}
		
		if(!$.trim($('#workGubun').val())){
			toastr.warning("작업구분을 선택해주세요.");
			$('#workGubun').focus();
			check=false;
			return false;
		}
		
		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비를 등록 해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#workMethod').val())){
			toastr.warning("작업방식을 선택해주세요.");
			$('#workMethod').focus();
			check=false;
			return false;
		}


		if(!$.trim($('#equipCheck1').val())){
			toastr.warning("설비점검을 등록해주세요.");
			$('#equipCheck1').focus();
			check=false;
			return false;
		}

		if(!$.trim($('#moldNo').val())){
			toastr.warning("해당 제품의 금형코드를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#moldLocation').val())){
			toastr.warning("해당 제품의 금형위치를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#cavityCnt').val())){
			toastr.warning("해당 제품의 Cavity를 등록해주세요.");
			check=false;
			return false;
		}

		if(!$.trim($('#equipCheck2').val())){
			toastr.warning("금형점검을 등록해주세요.");
			$('#equipCheck2').focus();
			check=false;
			return false;
		}
		

		/* let emptyCount=0;
		//작업조건 예외처리
		$('input[name=condition]').each(function(index, item) {
			if($(this).val()==null || $(this).val()==""){
				if($('input[name=stand]').eq(index).val()!=""){
					emptyCount++;
				}
			}
		});

		if(emptyCount>0){
			toastr.warning("작업조건을 등록해주세요.");
			emptyCount=0;
			check=false;
			return false;
		}

		//자재투입 예외처리
		if(workOrderMatrlTable.data().count()==0){
			toastr.warning("자재투입 해주세요.");
			check=false;
			return false;
		}else{
			for(var i=0; i<workOrderMatrlTable.data().count(); i++){
				if(workOrderMatrlTable.row(i).data().moisPass!="001"){
					emptyCount++;
				}
			}
			if(emptyCount>0){
				toastr.warning("수분측정이 미판정이거나 불합격입니다.");
				emptyCount=0;
				check=false;
				return false;
			}
		} */
		
		$('#tab4Nav').removeClass('disabled');  //비가동등록 탭 활성화
		$('#tab4Nav').trigger('click');
		
		var time = new Date();
		$('#workOrderNonOperationTable').DataTable().row.add({
			'noStartDate'   : $('#clock').text().substring(0,10),
			'noStartTime'   : $('#clock').text().substring(11,16),
			'noTime'		: 0,
		}).draw(false);
		
		$('select[name=noGubun]').eq(workOrderNonOperationTable.data().count()-1).attr('disabled',false);

		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 회색
		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 녹색
		$('#btnWorkNonStart').css('background','red'); 	//비가동시작 버튼 회색
		$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 회색
		$('#btnMainWorkEnd').css('background','#959595');	//작업종료 버튼 회색

		$('#workStatusNm').text("비가동");
    	$('.text-bg').css('background',"red");
		updateWorkStatus("NS");
		mainWorkStatusCd='NS';
	});

	//비가동종료 버튼 클릭시
	$('#btnWorkNonEnd').on('click',function(){
		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			return false;
		}

		//작업상태가 작업종료 일 경우
		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시입니다.");
			return false;
		}

		if(mainWorkStatusCd!="NS"){
			toastr.warning("비가동시작 한 후에 비가동종료 할 수 있습니다.");
			return false;
		}

		$('input[name=noEndDate]').eq(workOrderNonOperationTable.data().count()-1).val($('#clock').text().substring(0,10));
		$('input[name=noEndTime]').eq(workOrderNonOperationTable.data().count()-1).val($('#clock').text().substring(11,16));
		

    	$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 회색
		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 녹색
		$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 회색
		$('#btnWorkNonEnd').css('background','red'); 	//비가동종료 버튼 회색
		$('#btnMainWorkEnd').css('background','#959595');	//작업종료 버튼 회색

		$('#workStatusNm').text("비가동");
    	$('.text-bg').css('background',"red");

		updateWorkStatus("NE");
		mainWorkStatusCd='NE';
	});

	//작업종료 버튼 클릭시
	$('#btnMainWorkEnd').on('click',function(){
		//예외처리
		if($('#workOrdNoScan').val()==""){
			toastr.warning('작업지시번호를 선택해주세요.');
			return false;
		}

		//작업상태가 작업종료 일 경우
		if(mainWorkStatusCd=="WE"){
			toastr.warning("이미 종료된 작업지시입니다.");
			return false;
		}
		
		if(mainWorkStatusCd=="PS"){
			toastr.warning("가동종료 한 후에 작업종료 할 수 있습니다.");
			return false;
		}

		if(mainWorkStatusCd=="NS"){
			toastr.warning("비가동종료 한 후에 작업종료 할 수 있습니다.");
			return false;
		}

		if($('#totalFuzz').val()==""){
			toastr.warning('퍼징기록을 등록해주세요.');
			return false;
		}

		if($('#fuzzQty').val()==""){
			toastr.warning('퍼징량(g)을 입력해주세요.');
			return false;
		}

		if($('#runnerQty').val()==""){
			toastr.warning('런너량(g)을 입력해주세요.');
			return false;
		}

		//초/중/종물 공정검사 유무 확인
		$.ajax({
			url : '<c:url value="po/workOrdInspectYnList" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal}
			},
			success : function(res){
				if(res.result=="ok"){
					$('#workDeleteModal').modal('show');
				}else if(res.result=="fail"){
					toastr.warning("생산실적 초/중/종물 공정검사 진행 후 작업종료 해주세요.");
				}else{
					toastr.error(res.message);
				}
			}
		})
	});

	//작업 종료 팝업창 
	$('#btnWorkDeleteConfirm').on('click',function(){

    	$('#btnMainWorkEnd').css('background','#333'); 		//작업종료 버튼 빨간색  
		$('#btnWorkStart').css('background','#959595'); 	//가동시작 버튼 검은색  
		$('#btnWorkEnd').css('background','#959595'); 		//가동종료 버튼 검은색  
		$('#btnWorkNonStart').css('background','#959595'); 	//비가동시작 버튼 검은색 
		$('#btnWorkNonEnd').css('background','#959595'); 	//비가동종료 버튼 검은색 
		$('#matrlBarcodeNoScan').attr('disabled',true);
		$('#noSave').addClass('d-none');
		$('#workStatusNm').text("작업종료");
    	$('.text-bg').css('background',"#333");
    	mainWorkStatusCd='WE';
    	updateWorkStatus('WE');
    	
    	
		$('#btnNoDel').addClass('d-none');			//비가동삭제
		$('#btnFaultyDel').addClass('d-none');		//불량삭제
		$('#workOrderPrcssDel').addClass('d-none');	//생산실적삭제
		$('#btnMatrlDel').addClass('d-none');		//자자삭제
		
		if($('#faultyQty').val().replace(/,/g,'')!="0" && $('#faultyQty').val().replace(/,/g,'')!=""){
			//불량수량 합계 별도 LOTNO생성
			$.ajax({
				url: '<c:url value="po/workOrdAdd" />',
	            type: 'POST',
	            data: {
	            	'workOrdNo'			:	workOrdNoVal,
	            	'itemSeq'			:	itemSeqVal,
	            	'workGubun'			:	$('#workGubun').val(),
	            	'equipCd'			:   $('#equipCd').val(),
	            	'itemSeq'			:   itemSeqVal,
	            	'ordDate'			:	moment($('#workOrdDate').val()).format('YYYYMMDD'),
	            	'workStatus'		:	'003',
	            	'workChargr'		:	$('#workChargr').val(),
	            	'targetQty'			:	$('#workOrdQty').val().replace(/,/g,''),
	            	'outputQty'			:	'0',
	            	'fairQty'			:	'0',
	            	'faultyQty'			:	$('#faultyQty').val().replace(/,/g,''),
	            	'etcQty'			:	'0',
	            	'outQty'			:	'0',
	            	'remainQty'			:	'0',
	            	'packYn'			:	'N',
	            	'inspectGubun'		:	'',
	            	'ordLotNoDate'		:	$('#clock').text().substring(0,10).replace(/-/g,''),
	            	'workEndTime'		:	$('#clock').text(),
	            },
           		success: function (res) {
	                var data = res.data;
	                if(res.result == 'ok') {
	                	toastr.success('불량 LotNo를 등록했습니다.');
	                	$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
	                } else {
	                	toastr.error(res.message);
	                }
	            }
			});
    	}


    	$('#workDeleteModal').modal('hide');
	});

	function updateWorkStatus(value){
		var status = value;
		//작업지시 저장
    	$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			async : true,
			data : {
				'workOrdNo' : workOrdNoVal,
				'workStatusCd' : function(){return status},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("작업상태 수정되었습니다.");
				}else {
					toastr.error(res.message);
				}
			}
		}); 
	}
	

	//생산시간, 비가동시간 값
	function getWorkTime(){
		$.ajax({
			url : '<c:url value="po/getWorkTimeMin" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal}
			},
			success : function(res){
				
				$('#realWorkTime').val(res.realWorkTime);
				$('#nonWorkTime').val(res.nonWorkTime);
			}
		});
	}


	//총 퍼징횟수
	function getTotalFuzzCnt(){

		$.ajax({
			url : '<c:url value="po/getTotalFuzzCnt" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal}
			},
			success : function(res){
				$('#totalFuzz').val(res.data);
			}
		});
	}
	


	// 퍼징
	//---------퍼징 시간 시작
	function fuzzTime(id){
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var date = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();

		if(!$('#'+id).is(':disabled')){
			$('#'+id).val(year+((month+1)<10?"0"+(month+1):(month+1))+(date<10?"0"+date:date)+(hours<10?"0"+hours:hours)+(minutes<10?"0"+minutes:minutes));
		}
	}
	//---------퍼징 시간 종료
	
	//퍼징버튼 클릭시
	$('#fuzzPopup').on('click',function(){
		//퍼징기록일지
		$('.fuzzTime').css('font-size','75%');
		
		$('.fuzzTime').attr('disabled',true);
		$('input[name=fuzzCnt]').attr('disabled',true);
		$('select[name=fuzzGubun]').attr('disabled',true);

		//초기 입력
		$('#fuzz_01_start').attr('disabled',false);
		$('#fuzz_01_end').attr('disabled',false);
		$('#fuzz_01_value').attr('disabled',false);
		$('#fuzz_01_gubun').attr('disabled',false);
		
		$.ajax({
			url : '<c:url value="po/workOrderFuzzList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;}
			},
			success : function(res){
				let data = res.data;
				if(data.length>0){

					for(let i=0; i<data.length; i++){
						
						$('#fuzz_'+data[i].fuzzNum+'_start').val(data[i].fuzzStartTime);
						$('#fuzz_'+data[i].fuzzNum+'_end').val(data[i].fuzzEndTime);
						$('#fuzz_'+data[i].fuzzNum+'_value').val(data[i].fuzzCnt);
						
						selectBoxAppend(fuzzGubunCode, 'fuzz_'+data[i].fuzzNum+'_gubun', data[i].fuzzGubun, "2");
						
						if(data[i].fuzzStartTime!=null && data[i].fuzzStartTime!=""){
							$('#fuzz_'+data[i+1].fuzzNum+'_start').attr('disabled',false);
							$('#fuzz_'+data[i+1].fuzzNum+'_end').attr('disabled',false);
							$('#fuzz_'+data[i+1].fuzzNum+'_value').attr('disabled',false);
							$('#fuzz_'+data[i+1].fuzzNum+'_gubun').attr('disabled',false);
						}
					}
				}else{
					$('.fuzzTime').val("");
					$('input[name=fuzzCnt]').val("");
					$('select[name=fuzzGubun]').val("");
					
					for(var i=0; i<=10; i++){
						selectBoxAppend(fuzzGubunCode, 'fuzz_'+(i<10?"0"+i:i)+'_gubun', '', "2");
					}
				}
				
				fileGubunVal = "004";
				$('#equipRestartPopUpLabel').text('퍼징 기준서 조회');
				$('#fuzzPopupModal').modal('show');
			}
		});
	});

	//퍼징 저장버튼 클릭시
	$('#fuzzSave').on('click',function(){
		var check = true;
		var dataArray = new Array();

		for(let num=1; num<=10; num++){

			let fuzzStartTimeVal = $('#fuzz_'+(num<10?"0"+num:num)+'_start').val();	//시작시간
			let fuzzEndTimeVal = $('#fuzz_'+(num<10?"0"+num:num)+'_end').val();	//종료시간
			let fuzzCntVal = $('#fuzz_'+(num<10?"0"+num:num)+'_value').val();	//횟수
			let fuzzGubunVal  = $('#fuzz_'+(num<10?"0"+num:num)+'_gubun').val(); //구분
			
			//시작시간 예외처리
			if(fuzzStartTimeVal!=null && fuzzStartTimeVal!=""){
				if(fuzzStartTimeVal.length!="12"){
					toastr.warning("시작시간 정확히 입력해주세요.");
					$('#fuzz_'+(num<10?"0"+num:num)+'_start').css('background','red');
					$('#fuzz_'+(num<10?"0"+num:num)+'_start').focus();
					check = false;
					return false;
				}else{
					$('#fuzz_'+(num<10?"0"+num:num)+'_start').css('background','');
				}
			}

			//종료시간 예외처리
			if(fuzzEndTimeVal!=null && fuzzEndTimeVal!=""){
				if(fuzzEndTimeVal.length!="12"){
					toastr.warning("종료시간을 정확히 입력해주세요.");
					$('#fuzz_'+(num<10?"0"+num:num)+'_end').css('background','red');
					$('#fuzz_'+(num<10?"0"+num:num)+'_end').focus();
					check = false;
					return false;
				}else{
					$('#fuzz_'+(num<10?"0"+num:num)+'_end').css('background','');
				}
			}

			/* //퍼징횟수 예외처리
			if(!$('#fuzz_'+(num<10?"0"+num:num)+'_value').is(':disabled')){
				if(fuzzCntVal==null||fuzzCntVal==""){
					toastr.warning("퍼징횟수를 입력해주세요.");
					$('#fuzz_'+(num<10?"0"+num:num)+'_value').focus();
					check = false;
					return false;
				}
			}

			//퍼징구분 예외처리
			if(!$('#fuzz_'+(num<10?"0"+num:num)+'_gubun').is(':disabled')){
				if(fuzzGubunVal==null||fuzzGubunVal==""){
					toastr.warning("퍼징구분을 선택해주세요.");
					$('#fuzz_'+(num<10?"0"+num:num)+'_gubun').focus();
					check = false;
					return false;
				}
			} */

			let rowData = new Object();

			rowData.workOrdNo = workOrdNoVal;
			rowData.fuzzNum = (num<10?"0"+num:num);
			rowData.fuzzStartTime = fuzzStartTimeVal==null||fuzzStartTimeVal==""?"":fuzzStartTimeVal;
			rowData.fuzzEndTime = fuzzEndTimeVal==null||fuzzEndTimeVal==""?"":fuzzEndTimeVal;
			rowData.fuzzCnt = fuzzCntVal==null||fuzzCntVal==""?"":fuzzCntVal.replace(/,/g,'');
			rowData.fuzzGubun = fuzzGubunVal;
			dataArray.push(rowData);
		}

		if (check) {
			$.ajax({
				url : '<c:url value="po/workOrderFuzzCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$('#my-spinner').show();
				},
				success : function(res) {
					if(res.result=="ok"){
						toastr.success("등록되었습니다.");
						$('#fuzzPopupModal').modal('hide');
						$('#my-spinner').hide();

						getTotalFuzzCnt();

						//생산실적등록 탭으로 이동
						setTimeout(function(){
							$('#tab2Nav').trigger('click');
						},50);
						
						
					}else{
						toastr.error(res.message);
					}
				},
			});
		}
	});


	//바코드 라벨프린트
	function barcodeLabelPrint(seq,rowCount,print){

		let workOrdSeqVal = seq;
   	   	
		$.ajax({
			url : '<c:url value="po/workOrdPrcssEdit2" />',
			type : 'POST',
			data : {
				'workOrdNo'			:	workOrdNoVal,
            	'workOrdSeq'		:	workOrdSeqVal,
            	'labelPrintYn'		:	"Y",
			},
			success : function(res){
				if(res.result=="ok"){

					$('#workOrderPrcssTable').DataTable().ajax.reload();

					var obj = new Object();

					let smallPackage = workOrderPrcssTable.row(rowCount).data().smallPackage;
					let boxCount = workOrderPrcssTable.row(rowCount).data().boxCount;
					let qty = 0;
					
					
				    obj.itemCd = $('#itemCd').val();
				    obj.itemNm = $('#itemNm').val();
				    obj.itemModel = $('#itemModel').val(); // 차종
				    obj.print = print	//출력/재출력

					obj.workChargrNm = workOrderPrcssTable.row(rowCount).data().workChargrNm; // 작업자
					obj.workEndTime = workOrderPrcssTable.row(rowCount).data().workEndTime // 생산일

					obj.dealCorpNm = workOrderPrcssTable.row(rowCount).data().dealCorpNm; // 고객사
				    obj.floorNm = workOrderPrcssTable.row(rowCount).data().floorNm; //창고
				    obj.areaCdNm = workOrderPrcssTable.row(rowCount).data().areaCdNm; //창고
				    
				    obj.workStatus = workOrderPrcssTable.row(rowCount).data().workStatus; //상태
				    
					obj.outputQty = $('#outputQty').val(); // 생산수량
					
					if(obj.workStatus == '003') {
					    qty = workOrderPrcssTable.row(rowCount).data().faultyQty; 
					} else {
					    qty = workOrderPrcssTable.row(rowCount).data().fairQty;
					}

				    let tempQty = qty;
				    
				    if(workOrderPrcssTable.row(rowCount).data().inspectGubunNm==null){
				    	obj.inspectGubun = "-";
				    }else{
					   	obj.inspectGubun = workOrderPrcssTable.row(rowCount).data().inspectGubunNm;
					}
					
				    obj.ordLotNo = workOrderPrcssTable.row(rowCount).data().ordLotNo; 

				    if (boxCount != null && boxCount != 0) {
					    for (let i = 0; i < Math.ceil(tempQty / boxCount); i++) {
						    if (qty - boxCount >= 0) {
							    obj.qty = boxCount;
							} else {
								obj.qty = qty;
							}
							qty = qty - boxCount;
							labelPrint(obj, "");
					    }
				    } else {
					    toastr.warning("박스포장수를 등록해주세요!");
					}

				    qty = tempQty;

				    if (smallPackage != null && smallPackage != 0 && obj.workStatus != '003') {
					    for (let i = 0; i < Math.ceil(tempQty / smallPackage); i++) {
						    if (qty - smallPackage >= 0) {
							    obj.qty = smallPackage;
							} else {
								obj.qty = qty;
							}
							qty = qty - smallPackage;
							labelPrint(obj, "");
					    }
				    }
					
				}else {
					toastr.error(res.message);
				}
			}
		}); 
	};


	// 작업표준서 버튼 click
	function workStandardClick() {
		if($('#workOrdNoScan').val() == ''){
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		if(itemSeqVal == '' || itemSeqVal == 'undefined'){
			toastr.warning('작업지시를 선택후 다시 시도해주세요.');
			return false;
		}
		$.ajax({
			url : '<c:url value="po/workStandardDownloadNew" />',
			type : 'GET',
			data : {
					'itemSeq' : function(){return itemSeqVal},
					
			},
			success : function(res){
				if(res.result=="openOk"){
					$('#workStandardModal').modal('show');
					$('#workStandardImg').attr("src","data:image/jpg;base64," + res.data);
					
				}else if(res.result=="downOk"){
					window.location = 'po/downloadFileNew?itemSeq='+itemSeqVal;
				}else if(res.result=="notExist"){
					toastr.warning("등록된 작업표준서가 없습니다.");
				}
			}
		});
	}
	
</script>


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
	
<script>
//Do printing...
	function labelPrint(data, action) {
	   let cmds = {};
	   
	   let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	
	    //행
	      cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	      cmd += "{LC;0659,0184,0980,0380,1,5|}";
			
	      //열
	      cmd += "{LC;0155,0035,0155,0320,0,5|}";

	      cmd += "{LC;0655,0035,0655,0110,0,5|}";
	      cmd += "{LC;0800,0035,0800,0110,0,5|}";
	      
	      cmd += "{LC;0350,0180,0350,0320,0,5|}";
	      cmd += "{LC;0505,0180,0505,0320,0,5|}";
	      cmd += "{LC;0655,0180,0655,0485,0,5|}";
	      cmd += "{LC;0800,0180,0800,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
	      cmd += "{PV23;0165,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
	      cmd += "{PV23;0015,0160,0040,0040,01,0,00,B=품명|}";
	      cmd += "{PV23;0165,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
	      cmd += "{PV23;0015,0230,0040,0040,01,0,00,B=생산일|}";
	      cmd += "{PV23;0165,0230,0040,0040,01,0,00,B="+moment(data.workEndTime).format('YYYY.MM.DD')+"|}"; 
	      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=생산수량|}";
	      cmd += "{PV23;0165,0300,0040,0040,01,0,00,B="+data.qty+"|}";
	      cmd += "{PV23;0360,0230,0040,0040,01,0,00,B=자주검사|}";
	      if (data.workStatus == '003') {
			  cmd += "{PV23;0520,0230,0040,0040,01,0,00,B="+"불합격"+"|}";
		  } else {
		      cmd += "{PV23;0520,0230,0040,0040,01,0,00,B="+"합격"+"|}";
		  }
	      cmd += "{PV23;0360,0300,0040,0040,01,0,00,B=작업자|}";
	      cmd += "{PV23;0520,0300,0040,0040,01,0,00,B="+data.workChargrNm+"|}";
	      cmd += "{PV23;0670,0090,0040,0040,01,0,00,B=차종|}";
	      cmd += "{PV23;0820,0090,0040,0040,01,0,00,B="+data.itemModel+"|}";
	      cmd += "{PV23;0670,0230,0040,0040,01,0,00,B=창고|}";
	      if (data.areaCdNm != null) {
	      	cmd += "{PV23;0820,0230,0040,0040,01,0,00,B="+data.areaCdNm + '/' + data.floorNm+"|}";
	      }
	      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=고객사|}";
	      cmd += "{PV23;0820,0300,0040,0040,01,0,00,B="+data.dealCorpNm+"|}";
	      cmd += "{PV23;0710,0365,0040,0040,01,0,00,B="+"공정검사확인"+"|}";
	      cmd += "{PV23;0770,0450,0040,0040,01,0,00,B="+"합 격"+"|}";
	      cmd += "{XB03;0080,0350,9,3,02,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.ordLotNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
	
	
	let webSocket = new WebSocket("ws://localhost:9998");
	
	// 웹소켓 연결
	function wsConnect() {
	   webSocket = new WebSocket("ws://localhost:9998");
	}
	
	// 웹소켓 상태확인
	function getWsStatus() {
	   return webSocket.readyState;
	}
	
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
	   toastr.success('인쇄 서버에 연결되었습니다.')
	   $('#wsStateView').text('연결됨');
	   $('#wsStateView').css('color','#19FF00');
	   wsState = true;
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
	   toastr.warning('인쇄 서버가 종료되었습니다.')
	   $('#wsStateView').text('연결끊김');
	   $('#wsStateView').css('color','#FF0004');
	   wsState = false;
	};
	// 소켓 통신 중에 에러가 발생되면 호출되는 함수
	webSocket.onerror = function(message){
	   toastr.warning('현재 인쇄프로그램이 종료되어있습니다. 인쇄프로그램을 시작해주세요.')
	};
	// 소켓 서버로 부터 메시지가 오면 호출되는 함수.
	webSocket.onmessage = function(message){
	   // 출력 area에 메시지를 표시한다.
	   console.log(message);
	};
	// 서버로 메시지를 전송하는 함수
	function sendMessage(cmd){
	   if(webSocket.readyState == 1) {
	      webSocket.send(cmd);
	   } else {
	      toastr.warning('인쇄 서버와의 연결을 확인해주세요.');
	   }
	}



	var inspTypeVal = "외관";
	var chojungjong = '001';

	//검사항목등록 - 초물
	$('#btnInspPopup1').on('click',function(){

		if($('#workOrdNoScan').val() == ''){
			toastr.warning("작지를 먼저 선택해주세요.");
			return false;
		}
		
		inspTypeVal="외관";
		chojungjong = '001';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup2').removeClass('btn-danger');
	 	$('#btnInspPopup3').removeClass('btn-danger');
	 	$('#btnInspPopup2').addClass('btn-primary');
	 	$('#btnInspPopup3').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnWeight').removeClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnWeight').addClass('btn-primary');
	 	$('#btnSize').addClass('btn-primary');
	 	
		
		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
	 	setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		}, 500) 
		
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

	
	 	
	});

	let approvalChoVal = null;
	let approvalJungVal = null;

	//검사항목등록
	$('#btnInspPopup2').on('click',function(){		

		if($('#workOrdNoScan').val() == ''){
			toastr.warning("작지를 먼저 선택해주세요.");
			return false;
		}
		
		let data2 = null;
		$.ajax({
				url : '<c:url value="qm/jajuAdmDataList"/>',
				type : 'GET',
				async : false,
				data : {
					'workOrdNo' : function() {return workOrdNoVal;}					
				},
				success : function(res) {
					data2 = res.data[0];
					if(res.data[0]==null || res.data[0]==""){
						approvalChoVal = "미승인";
					}else{
						approvalChoVal = data2.approvalCho;
					}
				}				
		});

		if(approvalChoVal == "미승인"){
			toastr.warning("초물을 먼저 입력해주세요.");
			return false;
		}
		inspTypeVal="외관";
		
		chojungjong = '002';
		
		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup1').removeClass('btn-danger');
	 	$('#btnInspPopup3').removeClass('btn-danger');
	 	$('#btnInspPopup1').addClass('btn-primary');
	 	$('#btnInspPopup3').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnWeight').removeClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnWeight').addClass('btn-primary');
	 	$('#btnSize').addClass('btn-primary');

		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
	 	setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		},500) 
		
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

		
	});

	
	//검사항목등록
	$('#btnInspPopup3').on('click',function(){

		if($('#workOrdNoScan').val() == ''){
			toastr.warning("작지를 먼저 선택해주세요.");
			return false;
		}
		let data2 = null;
		
		
		$.ajax({
			url : '<c:url value="qm/jajuAdmDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'workOrdNo' : function() {return workOrdNoVal;}					
			},
			success : function(res) {
				data2 = res.data[0];
				if(res.data[0]==null || res.data[0]==""){
					approvalChoVal = "미승인";
					approvalJungVal = "미승인";
				}else{
					approvalChoVal = data2.approvalCho;
					approvalJungVal = data2.approvalJung;
				}
			}				
		});

		if(approvalChoVal == "미승인"){
			toastr.warning("초물을 먼저 입력해주세요.");
			return false;
		}

		if(!$('#ckMdInspectNo').is(':checked')){
			if(approvalJungVal == "미승인"){
				toastr.warning("중물을 먼저 입력해주세요.");
				return false;
			}
		}
		
		
		inspTypeVal="외관";
		chojungjong = '003';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup1').removeClass('btn-danger');
	 	$('#btnInspPopup2').removeClass('btn-danger');
	 	$('#btnInspPopup1').addClass('btn-primary');
	 	$('#btnInspPopup2').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnWeight').removeClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnWeight').addClass('btn-primary');
	 	$('#btnSize').addClass('btn-primary');

		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){extDnone();});
	 	setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		},500) 
		
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
				'inspResultGubun' : function(){return "004"},
				'inspSourceNo' : function(){return workOrdNoVal},			
				'inspGubun' : function(){return "004"},
				'inspType' : function(){return "001";},
				'itemSeq' : function(){return itemSeqVal;},
				'inspectGubun'	: function(){return chojungjong},
				
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
						return '<textarea name="inspList" style="font-size:120% !important;height: 5.5rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 5.5rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
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
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX1", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.1 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="002"){
						return selectBoxHtml4(judgeCode,"inspX2", row['inspX2'], row, meta, "2");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX2", row['inspX2'], row, meta, "2");
					}else{
						return selectBoxHtml4(judgeCode,"inspX2", row['inspX2'], row, meta, "2");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.1 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="003"){
						return selectBoxHtml4(judgeCode,"inspX3", row['inspX3'], row, meta, "3");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX3", row['inspX3'], row, meta, "3");
					}else{
						return selectBoxHtml4(judgeCode,"inspX3", row['inspX3'], row, meta, "3");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="004"){
						return selectBoxHtml4(judgeCode,"inspX4", row['inspX4'], row, meta, "4");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX4", row['inspX4'], row, meta, "4");
					}else{
						return selectBoxHtml4(judgeCode,"inspX4", row['inspX4'], row, meta, "4");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="005"){
						return selectBoxHtml4(judgeCode,"inspX5", row['inspX5'], row, meta, "5");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX5", row['inspX5'], row, meta, "5");
					}else{
						return selectBoxHtml4(judgeCode,"inspX5", row['inspX5'], row, meta, "5");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.2 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX6", row['inspX6'], row, meta, "6");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX6", row['inspX6'], row, meta, "6");
					}else{
						return selectBoxHtml4(judgeCode,"inspX6", row['inspX6'], row, meta, "6");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX7", row['inspX7'], row, meta, "7");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX7", row['inspX7'], row, meta, "7");
					}else{
						return selectBoxHtml4(judgeCode,"inspX7", row['inspX7'], row, meta, "7");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX8", row['inspX8'], row, meta, "8");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX8", row['inspX8'], row, meta, "8");
					}else{
						return selectBoxHtml4(judgeCode,"inspX8", row['inspX8'], row, meta, "8");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.3 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX9", row['inspX9'], row, meta, "9");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX9", row['inspX9'], row, meta, "9");
					}else{
						return selectBoxHtml4(judgeCode,"inspX9", row['inspX9'], row, meta, "9");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX10", row['inspX10'], row, meta, "10");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX10", row['inspX10'], row, meta, "10");
					}else{
						return selectBoxHtml4(judgeCode,"inspX10", row['inspX10'], row, meta, "10");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX11", row['inspX11'], row, meta, "11");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX11", row['inspX11'], row, meta, "11");
					}else{
						return selectBoxHtml4(judgeCode,"inspX11", row['inspX11'], row, meta, "11");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.4 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX12", row['inspX12'], row, meta, "12");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX12", row['inspX12'], row, meta, "12");
					}else{
						return selectBoxHtml4(judgeCode,"inspX12", row['inspX12'], row, meta, "12");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX13", row['inspX13'], row, meta, "13");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX13", row['inspX13'], row, meta, "13");
					}else{
						return selectBoxHtml4(judgeCode,"inspX13", row['inspX13'], row, meta, "13");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX14", row['inspX14'], row, meta, "14");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX14", row['inspX14'], row, meta, "14");
					}else{
						return selectBoxHtml4(judgeCode,"inspX14", row['inspX14'], row, meta, "14");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.5 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX15", row['inspX15'], row, meta, "15");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX15", row['inspX15'], row, meta, "15");
					}else{
						return selectBoxHtml4(judgeCode,"inspX15", row['inspX15'], row, meta, "15");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX16", row['inspX16'], row, meta, "16");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX16", row['inspX16'], row, meta, "16");
					}else{
						return selectBoxHtml4(judgeCode,"inspX16", row['inspX16'], row, meta, "16");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX17", row['inspX17'], row, meta, "17");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX17", row['inspX17'], row, meta, "17");
					}else{
						return selectBoxHtml4(judgeCode,"inspX17", row['inspX17'], row, meta, "17");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.6 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX18", row['inspX18'], row, meta, "18");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX18", row['inspX18'], row, meta, "18");
					}else{
						return selectBoxHtml4(judgeCode,"inspX18", row['inspX18'], row, meta, "18");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX19", row['inspX19'], row, meta, "19");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX19", row['inspX19'], row, meta, "19");
					}else{
						return selectBoxHtml4(judgeCode,"inspX19", row['inspX19'], row, meta, "19");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX20", row['inspX20'], row, meta, "20");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX20", row['inspX20'], row, meta, "20");
					}else{
						return selectBoxHtml4(judgeCode,"inspX20", row['inspX20'], row, meta, "20");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.7 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX21", row['inspX21'], row, meta, "21");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX21", row['inspX21'], row, meta, "21");
					}else{
						return selectBoxHtml4(judgeCode,"inspX21", row['inspX21'], row, meta, "21");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX22", row['inspX22'], row, meta, "22");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX22", row['inspX22'], row, meta, "22");
					}else{
						return selectBoxHtml4(judgeCode,"inspX22", row['inspX22'], row, meta, "22");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX23", row['inspX23'], row, meta, "23");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX23", row['inspX23'], row, meta, "23");
					}else{
						return selectBoxHtml4(judgeCode,"inspX23", row['inspX23'], row, meta, "23");
					}
				},
				'className' : 'text-center'
			},
			{//CVT.8 - X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX24", row['inspX24'], row, meta, "24");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX24", row['inspX24'], row, meta, "24");
					}else{
						return selectBoxHtml4(judgeCode,"inspX24", row['inspX24'], row, meta, "24");
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
				'inspResultGubun' : function(){return "004"},
				'inspSourceNo' : function(){return workOrdNoVal;},			
				'inspGubun' : function(){return "004"},
				'inspType' : function(){return "002";},
				'itemSeq' : function(){return itemSeqVal;},
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
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%" />';
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
							return '<input type="text" class="form-control" name="inspStandLower" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}

				}
			}, 
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {

					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s2-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s2-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s2-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s2-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.2 - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s2-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s2-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s2-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s2-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s2-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s2-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s2-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s2-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s2-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s2-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s2-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s2-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s2-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s2-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s2-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s2-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s2-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s2-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s2-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s2-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s2-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s2-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s2-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s2-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s2-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s2-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s2-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s2-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s2-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s2-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s2-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s2-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s2-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s2-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s2-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s2-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s2-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s2-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s2\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
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
				'inspResultGubun' : function(){return "004"},
				'inspSourceNo' : function(){return workOrdNoVal;},			
				'inspGubun' : function(){return "004"},
				'inspType' : function(){return "002";},
				'itemSeq' : function(){return itemSeqVal;},
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
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%" />';
// 					} else if (data == '001') {
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" checked disabled/>';
// 					} else {
// 						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" disabled/>';
// 					}
// 				}
// 			}, 
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%" />';
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
							return '<input type="text" class="form-control" name="inspStandLower" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			},
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			},  
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT. - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
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
				'inspResultGubun' : function(){return "004"},
				'inspSourceNo' : function(){return workOrdNoVal;},			
				'inspGubun' : function(){return "004"},
				'inspType' : function(){return "003";},
				'itemSeq' : function(){return itemSeqVal;},
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
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%" />';
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
				className : 'text-center',
				name: 'rowspanW'
			},
			{//기준 - 하한
				data : 'inspStandLower',
				render : function(data, type, row, meta) {

					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {

					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="w-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',1,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="w-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',2,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="w-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',2,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="w-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',3,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="w-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',3,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="w-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',4,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="w-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',4,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.2 - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="w-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',5,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="w-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',5,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.2 - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="w-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',6,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="w-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',6,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="w-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',7,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="w-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',7,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="w-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',8,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="w-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',8,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="w-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',9,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="w-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',9,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="w-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',10,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="w-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',10,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="w-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',11,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="w-inspX11-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',11,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="w-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',12,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="w-inspX12-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',12,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="w-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',13,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="w-inspX13-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',13,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="w-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',14,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="w-inspX14-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',14,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="w-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',15,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="w-inspX15-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',15,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="w-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',16,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="w-inspX16-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',16,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="w-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',17,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="w-inspX17-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',17,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="w-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',18,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="w-inspX18-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',18,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="w-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',19,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="w-inspX19-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',19,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="w-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',20,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="w-inspX20-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',20,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="w-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',21,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="w-inspX21-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',21,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="w-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',22,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="w-inspX22-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',22,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="w-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',23,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="w-inspX23-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',23,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="w-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',24,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="w-inspX24-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'w\',24,'+meta.row+')" onChange="sizeCheck2('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
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
	/* $(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5],input[name=inspX6]", function(event){

		if(inspTypeVal=="치수"){
			var _pattern3 = /^\d*[.]\d{4}$/;	//셋째자리
			if (_pattern3.test( $(this).val())) {
	        	toastr.warning("소수점 셋째 자리까지 입력 가능합니다.");
	        	$(this).val(parseFloat($(this).val()).toFixed(3));
	            return false;
			}
		}else{
			var _pattern3 = /^\d*[.]\d{3}$/;	//둘째자리
			if (_pattern3.test( $(this).val())) {
	        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
	        	$(this).val(parseFloat($(this).val()).toFixed(2));
	            return false;
			}
		}
	}); */

	//x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){

		let inspResult = $('input[name='+result+']').eq(row).val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('input[name='+result+']').eq(row).css('background','#ff0000');
		}else{
			$('input[name='+result+']').eq(row).css('background','#92d050');
		}

	} 	

	//x1~x5 결과값 onchage시
	function sizeCheck2(min,max,result,row){

		let inspResult = $('#weightTable tbody tr').eq(row).find('input[name='+result+']').val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('#weightTable tbody tr').eq(row).find('input[name='+result+']').css('background','#ff0000');
		}else{
			$('#weightTable tbody tr').eq(row).find('input[name='+result+']').css('background','#92d050');
		}
	} 	


	//커서이동
	function moveFocus(type,value,row){
		if(event.keyCode == 13){

			if(type=="w"){
				rowCount = weightTable.data().count()-1;	//행수
			}else if(type=="s"){
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="s2"){
				rowCount = sizeAdmTable2.data().count()-1;	//행수
			}else if(type=="e"){
				rowCount = extAdmTable.data().count()-1;	//행수
			}

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




	//셀렉트박스생성(검사취출)
	function selectBoxHtml3(obj, name, sVal, row, meta) {

		var shtml = '<select style="font-size: 120%; height: 2rem; min-width : 100%" class="custom-select" name="'+ name +'" data-col="' + meta.col + '" onchange="workOrdPrcssChange2(\''+row['workOrdSeq']+'\',\''+meta.row+'\');" disabled>';
		
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
	

   //저장버튼 클릭시
   $('#btnInspSave').on('click',function(){
      var check = true;
      var dataArray = new Array();
      
      if (inspTypeVal == "외관") {
         $('#extAdmTable tbody tr').each(function(index, item) {

            var rowData = new Object();

            rowData.inspResultGubun = "004";
            rowData.inspSourceNo = workOrdNoVal;
            rowData.inspSourceSubNo = '';
            rowData.inspCd = extAdmTable.row(index).data().inspCd;
            rowData.inspType = extAdmTable.row(index).data().inspType;
            rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
            rowData.inspectGubun = chojungjong;
            
            var resultYCnt = 0;
            let cavityCntVal = $('#cavityCnt').val();
			cavityCntVal *= 3;
			
			//최종판정
			for(var i = 1; i <= cavityCntVal; i++){
				if($(this).find('td select[name=inspX'+i+']').val()=="001"){
					resultYCnt++;
				}
				if($(this).find('td select[name=inspX'+i+']').val()==""){
					resultYCnt=-1;
					break;
				}
			}
			if (resultYCnt == cavityCntVal) {
				rowData.inspResult = "001";	//합격
			} else if (resultYCnt == -1){
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
					rowData.inspX22 = $(this).find('td select[name=inspX22]').val();
					rowData.inspX23 = $(this).find('td select[name=inspX23]').val();
					rowData.inspX24 = $(this).find('td select[name=inspX24]').val();
				case 7:
					rowData.inspX19 = $(this).find('td select[name=inspX19]').val();
					rowData.inspX20 = $(this).find('td select[name=inspX20]').val();
					rowData.inspX21 = $(this).find('td select[name=inspX21]').val();
				case 6:
					rowData.inspX16 = $(this).find('td select[name=inspX16]').val();
					rowData.inspX17 = $(this).find('td select[name=inspX17]').val();
					rowData.inspX18 = $(this).find('td select[name=inspX18]').val();
				case 5:
					rowData.inspX13 = $(this).find('td select[name=inspX13]').val();
					rowData.inspX14 = $(this).find('td select[name=inspX14]').val();
					rowData.inspX15 = $(this).find('td select[name=inspX15]').val();
				case 4:
					rowData.inspX10 = $(this).find('td select[name=inspX10]').val();
					rowData.inspX11 = $(this).find('td select[name=inspX11]').val();
					rowData.inspX12 = $(this).find('td select[name=inspX12]').val();
				case 3:
					rowData.inspX7 = $(this).find('td select[name=inspX7]').val();
					rowData.inspX8 = $(this).find('td select[name=inspX8]').val();
					rowData.inspX9 = $(this).find('td select[name=inspX9]').val();
				case 2:
					rowData.inspX4 = $(this).find('td select[name=inspX4]').val();
					rowData.inspX5 = $(this).find('td select[name=inspX5]').val();
					rowData.inspX6 = $(this).find('td select[name=inspX6]').val();
				case 1:
					rowData.inspX1 = $(this).find('td select[name=inspX1]').val();
					rowData.inspX2 = $(this).find('td select[name=inspX2]').val();
					rowData.inspX3 = $(this).find('td select[name=inspX3]').val();
			}

            rowData.inspPass = $(this).find('td select[name=inspResult]').val();
            
            dataArray.push(rowData);
         });
      } else if (inspTypeVal == "치수") {
         if (mainGubun == "001") {
            $('#sizeAdmTable2 tbody tr').each(function(index, item) {

               var rowData = new Object();
               let pass = true;
               let passCheck = true;
               rowData.inspResultGubun = "004";
               rowData.inspSourceNo = workOrdNoVal;
               rowData.inspSourceSubNo = '';
               rowData.inspCd = sizeAdmTable2.row(index).data().inspCd;
               rowData.inspType = sizeAdmTable2.row(index).data().inspType;
               rowData.inspSeq = sizeAdmTable2.row(index).data().inspSeq;
               rowData.inspectGubun = chojungjong;

               let min = sizeAdmTable2.row(index).data().inspStandLower;
			   let max = sizeAdmTable2.row(index).data().inspStandUpper;
				
				var resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for(var i = 1; i <= cavityCntVal; i++){
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
            });
         } else {
            $('#sizeAdmTable tbody tr').each(function(index, item) {

               var rowData = new Object();
               let pass = true;
               let passCheck = true;
               rowData.inspResultGubun = "004";
               rowData.inspSourceNo = workOrdNoVal;
               rowData.inspSourceSubNo = '';
               rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
               rowData.inspType = sizeAdmTable.row(index).data().inspType;
               rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
               rowData.inspectGubun = chojungjong;
               
               let min = sizeAdmTable.row(index).data().inspStandLower;
			   let max = sizeAdmTable.row(index).data().inspStandUpper;
				
				var resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val();
				cavityCntVal *= 3;
				
				for(var i = 1; i <= cavityCntVal; i++){
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
				} else if (resultYCnt == -1){
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
            });
         }
      } else if (inspTypeVal == "중량") {
         $('#weightTable tbody tr').each(function(index, item) {

            var rowData = new Object();
            let pass = true;
            let passCheck = true;
            rowData.inspResultGubun = "004";
            rowData.inspSourceNo = workOrdNoVal;
            rowData.inspSourceSubNo = '';
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

                  $('select[name=inspResult]').attr('disabled', true);
                    $('input[name=inspX1]').attr('disabled', true);
					$('input[name=inspX2]').attr('disabled', true);
					$('input[name=inspX3]').attr('disabled', true);
					$('input[name=inspX4]').attr('disabled', true);
					$('input[name=inspX5]').attr('disabled', true);
					$('input[name=inspX6]').attr('disabled', true);
					$('input[name=inspX7]').attr('disabled', true);
					$('input[name=inspX8]').attr('disabled', true);
					$('input[name=inspX9]').attr('disabled', true);
					$('input[name=inspX10]').attr('disabled', true);
					$('input[name=inspX11]').attr('disabled', true);
					$('input[name=inspX12]').attr('disabled', true);
					$('input[name=inspX13]').attr('disabled', true);
					$('input[name=inspX14]').attr('disabled', true);
					$('input[name=inspX15]').attr('disabled', true);
					$('input[name=inspX16]').attr('disabled', true);
					$('input[name=inspX17]').attr('disabled', true);
					$('input[name=inspX18]').attr('disabled', true);
					$('input[name=inspX19]').attr('disabled', true);
					$('input[name=inspX20]').attr('disabled', true);
					$('input[name=inspX21]').attr('disabled', true);
					$('input[name=inspX22]').attr('disabled', true);
					$('input[name=inspX23]').attr('disabled', true);
					$('input[name=inspX24]').attr('disabled', true);

					$('select[name=inspX1]').attr('disabled',true);
					$('select[name=inspX2]').attr('disabled',true);
					$('select[name=inspX3]').attr('disabled',true);
					$('select[name=inspX4]').attr('disabled',true);
					$('select[name=inspX5]').attr('disabled',true);
					$('select[name=inspX6]').attr('disabled',true);
					$('select[name=inspX7]').attr('disabled',true);
					$('select[name=inspX8]').attr('disabled',true);
					$('select[name=inspX9]').attr('disabled',true);
					$('select[name=inspX10]').attr('disabled',true);
					$('select[name=inspX11]').attr('disabled',true);
					$('select[name=inspX12]').attr('disabled',true);
					$('select[name=inspX13]').attr('disabled',true);
					$('select[name=inspX14]').attr('disabled',true);
					$('select[name=inspX15]').attr('disabled',true);
					$('select[name=inspX16]').attr('disabled',true);
					$('select[name=inspX17]').attr('disabled',true);
					$('select[name=inspX18]').attr('disabled',true);
					$('select[name=inspX19]').attr('disabled',true);
					$('select[name=inspX20]').attr('disabled',true);
					$('select[name=inspX21]').attr('disabled',true);
					$('select[name=inspX22]').attr('disabled',true);
					$('select[name=inspX23]').attr('disabled',true);
					$('select[name=inspX24]').attr('disabled',true);

        		  $('#btnInspSave').addClass('d-none');
               } else {
                  toastr.error(res.message);
               }
            }
         });
      }
   });
   
 	//외관 버튼 클릭시
	$('#btnExt').on('click',function(){
		inspTypeVal = '외관';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnWeight').removeClass('btn-danger');
	 	$('#btnSize').addClass('btn-primary');
	 	$('#btnWeight').addClass('btn-primary');

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		$('#weightTableDiv').addClass('d-none');
		
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		 setTimeout(function(){
			extAdmTable.draw();
		},500); 
	});

	//치수 버튼 클릭시
	$('#btnSize').on('click',function(){
		inspTypeVal = '치수';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnExt').removeClass('btn-danger');
	 	$('#btnWeight').removeClass('btn-danger');
	 	$('#btnExt').addClass('btn-primary');
	 	$('#btnWeight').addClass('btn-primary');

		if (mainGubun == '001') {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){sizeDnone2();});
			
			setTimeout(function(){
				sizeAdmTable2.draw();
				sizeAdmTable2.draw();
			},500); 
			
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
			
		} else if(mainGubun == '002') {
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#weightTableDiv').addClass('d-none');
			$('#sizeAdmTable').DataTable().ajax.reload(function(){sizeDnone();});
			
			setTimeout(function(){
				sizeAdmTable.draw();
				sizeAdmTable.draw();
			},500); 
			
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
		
		$('#btnInspSave').addClass('d-none');
		
	});

	//중량 버튼 클릭시
	$('#btnWeight').on('click',function(){
		inspTypeVal = '중량';		

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnExt').removeClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnExt').addClass('btn-primary');
	 	$('#btnSize').addClass('btn-primary');
		

		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');	
		$('#weightTableDiv').removeClass('d-none');
		
		$('#btnInspSave').addClass('d-none');
		
		$('#weightTable').DataTable().ajax.reload(function(){weightDnone();});
		setTimeout(function(){
			 weightTable.draw();
			 weightTable.draw();
		}, 500);  
		   
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
		//예외처리
		$.ajax({
			url : '<c:url value="po/workOrdInspectDone" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal},
				'inspectGubun' : function(){return chojungjong},
			},
			success : function(res){
				if (res.result == "ok") {
					$('input[name=inspX1]').attr('disabled', false);
					$('input[name=inspX2]').attr('disabled', false);
					$('input[name=inspX3]').attr('disabled', false);
					$('input[name=inspX4]').attr('disabled', false);
					$('input[name=inspX5]').attr('disabled', false);
					$('input[name=inspX6]').attr('disabled', false);
					$('input[name=inspX7]').attr('disabled', false);
					$('input[name=inspX8]').attr('disabled', false);
					$('input[name=inspX9]').attr('disabled', false);
					$('input[name=inspX10]').attr('disabled', false);
					$('input[name=inspX11]').attr('disabled', false);
					$('input[name=inspX12]').attr('disabled', false);
					$('input[name=inspX13]').attr('disabled', false);
					$('input[name=inspX14]').attr('disabled', false);
					$('input[name=inspX15]').attr('disabled', false);
					$('input[name=inspX16]').attr('disabled', false);
					$('input[name=inspX17]').attr('disabled', false);
					$('input[name=inspX18]').attr('disabled', false);
					$('input[name=inspX19]').attr('disabled', false);
					$('input[name=inspX20]').attr('disabled', false);
					$('input[name=inspX21]').attr('disabled', false);
					$('input[name=inspX22]').attr('disabled', false);
					$('input[name=inspX23]').attr('disabled', false);
					$('input[name=inspX24]').attr('disabled', false);

					$('select[name=inspX1]').attr('disabled', false);
					$('select[name=inspX2]').attr('disabled', false);
					$('select[name=inspX3]').attr('disabled', false);
					$('select[name=inspX4]').attr('disabled', false);
					$('select[name=inspX5]').attr('disabled', false);
					$('select[name=inspX6]').attr('disabled', false);
					$('select[name=inspX7]').attr('disabled', false);
					$('select[name=inspX8]').attr('disabled', false);
					$('select[name=inspX9]').attr('disabled', false);
					$('select[name=inspX10]').attr('disabled', false);
					$('select[name=inspX11]').attr('disabled', false);
					$('select[name=inspX12]').attr('disabled', false);
					$('select[name=inspX13]').attr('disabled', false);
					$('select[name=inspX14]').attr('disabled', false);
					$('select[name=inspX15]').attr('disabled', false);
					$('select[name=inspX16]').attr('disabled', false);
					$('select[name=inspX17]').attr('disabled', false);
					$('select[name=inspX18]').attr('disabled', false);
					$('select[name=inspX19]').attr('disabled', false);
					$('select[name=inspX20]').attr('disabled', false);
					$('select[name=inspX21]').attr('disabled', false);
					$('select[name=inspX22]').attr('disabled', false);
					$('select[name=inspX23]').attr('disabled', false);
					$('select[name=inspX24]').attr('disabled', false);

					if (inspTypeVal == "외관") {
						$('#e-inspX1-0').focus();
						$('#e-inspX1-0').select();
					} else if (inspTypeVal == "중량") {
						$('#w-inspX1-0').focus();
						$('#w-inspX1-0').select();
					} else {
						$('#s-inspX1-0').focus();
						$('#s-inspX1-0').select();

						$('#s2-inspX1-0').focus();
						$('#s2-inspX1-0').select();
					}

					$('#btnInspSave').removeClass('d-none');
				
				} else if (res.result == "fail") {
					if(chojungjong=="001"){
						toastr.warning("초물등록 후 자주검사 등록해주세요.");
					}else if(chojungjong=="002"){
						toastr.warning("중물등록 후 자주검사 등록해주세요.");
					}else if(chojungjong=="003"){
						toastr.warning("종물등록 후 자주검사 등록해주세요.");
					}
					$('#btnInspSave').addClass('d-none');
					
				} else {
					$('#btnInspSave').addClass('d-none');	
					toastr.error(res.message);
				}
				
		    }
			
		});
		
	});


	
	//중물검사안함 체크 
	$('#ckMdInspectNo').on('change',function(){

		var checkMd = null;
		//중물검사 체크시
		if($('#ckMdInspectNo').is(':checked')){
			checkMd = '002'		//중물검사 안함 : 002
			//중물검사 버튼 비활성화
			$('#btnInspPopup2').attr('disabled',true);

			//중물일경우 - approvalChoVal이 승인일경우 종물로 바로가기
			if($('#btnInspPopup2').attr('class').indexOf("btn-danger")!=-1){
				if(approvalChoVal=="승인"){
					$('#btnInspPopup3').trigger('click');
				}else{
					$('#btnInspPopup1').trigger('click');
				}
			}
			
		}else{
			checkMd = '001'		//중물검사 함 : 001
			//중물검사 버튼 비활성화
			$('#btnInspPopup2').attr('disabled',false);
			
			//초물일경우 
			if($('#btnInspPopup1').attr('class').indexOf("btn-danger")!=-1){
				console.log("변화없음");
			}

			//중물일경우 - approvalChoVal이 승인일경우 종물로 바로가기
			if($('#btnInspPopup2').attr('class').indexOf("btn-danger")!=-1){
				if(approvalJungVal=="미승인"){
					$('#btnInspPopup2').trigger('click');
				}
			}
			
			//종물일경우 - approvalJungVal이 미승인일경우 중물로 바로가기
			if($('#btnInspPopup3').attr('class').indexOf("btn-danger")!=-1){
				if(approvalJungVal=="미승인"){
					$('#btnInspPopup2').trigger('click');
				}
			}
		}
		
		//중물검사 데이터 수정
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpdate" />',
			type : 'POST',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'mdInspectYn' : function(){return checkMd;}
			},
			success : function(res){
				if(res.result=="ok"){
				}else{
					toastr.error(res.message);
				}
			}
		});
	});
	

	
	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeqVal;},
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


	//******************통합자료실***********************
	
	var fileReferencePopUpTable = $('#fileReferencePopUpTable').DataTable({
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
				'fileGubun'	:	function(){return fileGubunVal;},
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
	
	//통합자료실 모달
	function fileReferenceClick() {
		$('#fileReferencePopUpTable').DataTable().ajax.reload(function(){});
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
	
	//이미지 모달 활성화
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
	//자주검사 - 외관 d-none 처리
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
	
	//자주검사 - 치수 레이저 d-none 처리
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
	
	//자주검사 - 치수 봉제 d-none 처리
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
	
	//자주검사 - 중량 d-none 처리
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