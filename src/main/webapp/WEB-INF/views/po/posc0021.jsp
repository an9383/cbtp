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
				<li class="breadcrumb-item active">생산실적(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="background-color: #ffffff;flex-direction: column;">
			<!------------ top ----------->
			<div class="m-2" id="" style="min-height: 4vh;max-height: 4vh;background-color: #125edc;border-radius: 10px;">
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;" id="btnWorkAdd">실적 등록</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkCheckList">생산/측정검사 현황</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkNonList">비가동 현황</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #000000;background: #ffc107;color: black;font-size: 1.2rem;" id="btnWorkNonAdd">비가동등록</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #000000;background: #fc403a;color: white;font-size: 1.2rem;" id="btnCheckEnd">측정종료</button>
				<!-- <button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkList">생산 현황</button> -->
				<!-- <button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkFaultyList">불량 현황</button> -->
				<!-- 
				<button type="button" class="btn float-right" style="height: 100%;border-color: #d9534f;background: #ee110a;color: white;font-size: 1.2rem;" id="btnWorkEnd">가공 종료</button>
				-->
			</div>
			
			<!------------ info table ----------->
			<div class="row m-2">
				<div class="col-sm-10">
					<div class="table-responsive" style="height: 100%;">
						<table id="topTable" class="table table-bordered m-0 table_top">
							<colgroup>
								<col width="15%">
								<col width="20%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
								<col width="15%">
							</colgroup>
			                   <thead class="thead-light">
			                   <tr>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">설비</th>
			                    	<td>
			                    		<div class="" style="position: relative;width: 100%;">
			                    			<input type="hidden" id="equipCd" name="equipCd" value=""> 
											<input type="text" class="" id="equipNm" name="equipNm" style="font-size: 1.3rem; height: 100%;width: 80%;" disabled="">
											<button type="button" class="btn input-sub-search" id="btnEquipCd" onclick="selectEqiupCd()" style="height: 100%;width: 20%;background-color: #124082;color: white;">
												<span class="oi oi-magnifying-glass"></span>
											</button>
			                    		</div>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">작업지시번호</th>
			                    	<td>
			                   			<input type="text" class="" id="workOrdNo" name="workOrdNo" placeholder="스캔해주세요." style="">
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">작업지시일</th>
			                    	<td>
			                   			<input type="text" class="" id="workOrdDate" name="workOrdDate" style="border:none;" readonly>
			                    	</td>
			                    </tr>
			                     <tr>
			                     	<th style="vertical-align: middle;font-size: 1.3rem;">작업자</th>
			                    	<td>
			                   			<input type="text" class="" id="workChargrNm" name="workChargrNm" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">품번</th> 
			                    	<td>
			                   			<input type="text" class="" id="itemCd" name="itemCd" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">품명</th>
			                    	<td>
			                   			<input type="text" class="" id="itemNm" name="itemNm" style="border:none;" readonly>
			                    	</td>
			                    </tr>
			                     <tr>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">PNL SIZE</th>
			                    	<td>
			                   			<input type="text" class="" id="pnlSize" name="pnlSize" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">CUT SIZE</th>
			                    	<td>
			                   			<input type="text" class="" id="cutSize" name="cutSize" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">홀 갯수</th>
			                    	<td>
			                   			<input type="text" class="" id="hallCount" name="hallCount" style="border:none;" readonly>
			                    	</td>
			                    </tr>
			                   </thead>
						</table>
					</div>
				</div>
				<div class="col-sm-2">
					<div style="height: 100%;">
						<table id="" class="table table-bordered m-0 table_top" style="height: 100%;">
							<colgroup>
								<col width="40%">
								<col width="60%">
							</colgroup>
		                    <thead class="thead-light">
			                     <tr>
			                     	<th style="vertical-align: middle;font-size: 1.3rem;">가공상태</th>
			                    	<td>
			                    		<input type="text" class="" id="workStatus" name="workStatus" style="border: none; font-weight: bold;" readonly="">
			                    	</td>
			                    </tr>
			                     <tr>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">측정상태</th>
			                    	<td>
			                    		<input type="text" class="" id="checkStatus" name="checkStatus" style="border: none; font-weight: bold;" readonly="">
			                    	</td>
			                    </tr>
		                    </thead>
						</table>
					</div>
				</div>
			</div>
			
			
			<div class="m-2" id="" style="min-height: 4vh;max-height: 4vh;background-color: #125edc;border-radius: 10px;display: grid;grid-template-columns: 1fr 2fr 1fr;">
				<button type="button" class="btn" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;">설비 현황</button>
				<button type="button" class="btn" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;border-radius: 10%;">레이저 가공현황</button>
				<button type="button" class="btn float-right" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;">누적 생산현황</button>
			</div>
			<!------------ graf table ----------->
			<div class="ml-2 mr-2 mb-2" id="" style="min-height: 55vh;max-height: 55vh;display: grid;grid-template-columns: 1fr 2fr 1fr;">
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 ml-2 mb-3" style="height: 240px;display: flex;">
						<div class="" style="width: 100%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">출력</h5>
								<div class="" style="">
									<div class="card-body p-0 div_border" style="height: 60%;">
					        			<div style="min-width: 100%;">
					        				<div style="position: relative;" id="laserRaStatusDiv">
					        					<canvas id="laserRaStatus"></canvas>
					        				</div>
					        			</div>
					        		</div>
									<div class="card-body p-0 div_value" id="laserRaText" style="
																    color: #124082;
																    font-size: 1.5rem;
																    font-weight: bold;
																    width: 100%;
																    text-align: center;
																    height: 20%;
																    "><span>-</span></div>
								 </div>
							</div>
						</div>
					</div>
					<div class="row m-2" style="height: 240px;display: flex;">
						<div class="" style="width: 100%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">냉각수 온도</h5>
								<div class="" style="">
									<div class="card-body p-0 div_border" style="height: 80%;">
					        			<div style="min-width: 100%;">
					        				<div style="position: relative;" id="laserTempStatusDiv">
					        					<canvas id="laserTempStatus"></canvas>
					        				</div>
					        			</div>
					        		</div>
									<div class="card-body p-0 div_value" id="laserTempText" style="
																    color: #124082;
																    font-size: 1.5rem;
																    font-weight: bold;
																    width: 100%;
																    text-align: center;
																    height: 20%;
																    "><span>- </span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="" style="background: #ffffff;height: 100%;">
					<div class="mt-3 mr-2 ml-2 mb-3" style="height: 497px;background-color: #c3e1fd;border-radius: 10px;">
						<div id="laser" style="margin-left: 1%;margin-right: 1%;height: 100%;">
						</div>
					</div>
				</div>
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 ml-2 mb-3" style="height: 155px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">지시 수량</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="dtlOrdCnt" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">실적 수량</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="outputQty" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row m-2 mb-3" style="height: 155px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">양품  수량</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="fairQty" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">불량 수량</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="faultyQty" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row m-2 mb-3" style="height: 155px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">진척률</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="workRate" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">비가동 시간</h5>
								<div class="" style="margin-top: 40px;">
									<h1 class="text-green" style="text-align:center;"><span id="nonTime" style="color: #ee110a;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 설비 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="equipCdModal" tabindex="-1" role="dialog" aria-labelledby="equipCdLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="equipCdLabel">설비정보 조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="equipCdTable" class="table table-bordered">
       				<colgroup>
       					<col width="5%">
       					<col width="15%">
       					<col width="20%">
       					<col width="20%">
       					<col width="20%">
       					<col width="20%">
       				</colgroup>
                  		<thead class="thead-light">
                   		<tr>
                   			<th style="width : 10%">NO.</th>
							<th style="width : 10%">설비코드</th>
							<th style="width : 10%">설비명</th>
							<th style="width : 10%">설비관리번호</th>
							<th style="width : 10%">설비규격</th>
							<th style="width : 10%">설비크기 (W*L*H)</th>
                   		</tr>
                  		</thead>
				</table>
				<hr class="text-secondary"> 
      		</div>
    	</div>
  	</div>
</div>
<!-- 설비 모달창 종료 -->
<!-- 작지 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workOrdModal" tabindex="-1" role="dialog" aria-labelledby="workOrdLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#125edc; color:white;">
        <h5 class="modal-title" id="workOrdLabel">작업지시번호 조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	 
      		<div class="table-responsive">
      	         <table id="workOrdTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                      <th> No. </th>
                      <th> 작업지시번호  </th>
                      <th> 품번  </th>
                      <th> 품명  </th>
                      <th> 작업지시일 </th>
                      <th> 가공상태 </th>   
                      <th> 측정상태 </th> 
                      <th> 작업자 </th>                                  
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
<!-- 작지 모달창 종료 -->
<!-- 알림 팝업창 시작 -->
<div class="modal fade bd-example-modal-lg" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f4a419; color:white;">
        <h5 class="modal-title" id="alertLabel">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	
      	 	 <h6 class="modal-title" id="alertMessage"></h6>
		<hr class="text-secondary"> 
      </div>
    </div>
  </div>
</div>
<!-- 알림 팝업창  종료 -->

<!-- 측정검사현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workCheckModal" tabindex="-1" role="dialog" aria-labelledby="workCheckLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1830px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workCheckLabel">생산/측정검사 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
   			<!-- <div class="row">
   				<div class="form-group input-sub m-0 row">
   					<label class="input-label-sm">가공일자</label>
   					<input class="form-control" style="width:97px;" type="text" id="workStartDateFrom" name="workStartDateFrom" disabled="">
   					<button onclick="fnPopUpCalendar(workStartDateFrom,workStartDateFrom,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="Calendar" type="button"><span class="oi oi-calendar"></span></button>
   				</div>&nbsp;~ &nbsp;
   				<div class="form-group input-sub m-0 row">
   					<input class="form-control" style="width:97px;" type="text" id="workStartDateTo" name="workStartDateTo" disabled="">
   					<button onclick="fnPopUpCalendar(workStartDateTo,workStartDateTo,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="workStartDateToCalendar" type="button"><span class="oi oi-calendar"></span></button>
   				</div>
				<label class="input-label-sm">설비</label>
				<select class="custom-select" id="equipCdSelect"></select>
				<button type="button" class="btn btn-primary" id="btnRetv">조회</button>
   			</div> -->
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="workCheckTable" class="table table-bordered tr_highlight_row">
                  	<thead class="thead-light">
                   		<tr>
                   			<th>NO.</th>
                   			<th>작업지시일자</th>
                   			<th>설비</th>
                   			<th>작업지시번호</th>
                   			<th>품명</th>
							<th>가공 상태</th>
							<th>가공 시작시간</th>
							<th>가공 종료시간</th>
							<th>측정 상태</th>
							<th>측정 시작시간</th>
							<th>측정 종료시간</th>
							<th>판정</th>
							<th>불량</th>
                   		</tr>
                  	</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 측정검사현황 모달창 종료 -->

<!--비가동현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workNonModal" tabindex="-1" role="dialog" aria-labelledby="workNonLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1530px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workNonLabel">비가동 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="workNonTable" class="table table-bordered tr_highlight_row">
       				<colgroup>
       					<col width="3%">
       					<col width="12%">
       					<col width="14%">
       					<col width="10%"> 
       					<col width="13%">
       					<col width="11%">
       					<col width="13%">
       					<col width="13%">
       					<col width="8%">
       				</colgroup>
                  	<thead class="thead-light">
                   		<tr>
                   			<th>NO.</th>
                   			<th>품번</th>
                   			<th>품명</th>
                   			<th>설비</th>
							<th>작업지시번호</th>
							<th>비가동 사유</th>
							<th>비가동 시작시간</th>
							<th>비가동 종료시간</th>
							<th>비가동 시간</th>
                   		</tr>
                  	</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 비가동현황 모달창 종료 -->

<!--생산현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workListModal" tabindex="-1" role="dialog" aria-labelledby="workListLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1530px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workListLabel">생산 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="workListTable" class="table table-bordered tr_highlight_row">
       				<colgroup>
       					<col width="3%">
       					<col width="14%">
       					<col width="16%">
       					<col width="10%"> 
       					<col width="16%">
       					<col width="8%">
       					<col width="15%">
       					<col width="15%">
       				</colgroup>
                  	<thead class="thead-light">
                   		<tr>
                   			<th>NO.</th>
                   			<th>품번</th>
                   			<th>품명</th>
                   			<th>설비</th>
							<th>작업지시번호</th>
							<th>가공 상태</th>
							<th>가공 시작시간</th>
							<th>가공 종료시간</th>
                   		</tr>
                  		</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 생산현황 모달창 종료 -->
<!--불량등록 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workFaultyAddModal" tabindex="-1" role="dialog" aria-labelledby="workFaultyAddLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 900px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workFaultyLabel">불량 등록</h5>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary m-3" style="border: none;">
       			<table id="workFaultyAddTable" class="table table-bordered m-0">
       				<colgroup>
       					<col width="5%">
       					<col width="30%">
       					<col width="15%">
       					<col width="25%">
       					<col width="20%">
       				</colgroup>
                  	<thead class="thead-light">
                   		<tr>
                   			<th>No.</th>
                   			<th>불량유형</th>
                   			<th>불량수량</th>
                   			<th>불량등록일</th>
                   			<th>비고</th>
                   		</tr>
                  	</thead>
				</table>
      		</div>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="btnWorkFaultySave" style="height: 100%;font-size: 1.2rem; background: #125edc;">저장</button>
      			<button type="button" class="btn btn-secondary" id="btnWorkFaultyCancel" data-dismiss="modal" style="height: 100%;font-size: 1.2rem;">닫기</button>
		    </div>
    	</div>
  	</div>
</div>
<!-- 불량등록 모달창 종료 -->

<!--불량현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workFaultyListModal" tabindex="-1" role="dialog" aria-labelledby="workFaultyListLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 900px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workFaultyLabel">불량 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary m-3" style="border: none;">
       			<table id="workFaultyListTable" class="table table-bordered m-0">
       				<colgroup>
       					<col width="5%">
       					<col width="20%">
       					<col width="20%">
       					<col width="25%">
       					<col width="25%">
       				</colgroup>
                  	<thead class="thead-light">
                   		<tr>
                   			<th>No.</th>
                   			<th>불량유형</th>
                   			<th class="text-center">불량수량</th>
                   			<th>불량등록일</th>
                   			<th>비고</th>
                   		</tr>
                  	</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 불량현황 모달창 종료 -->
<!-- 비가동등록 모달 시작 -->
<div class="modal fade bd-example-modal-xl" id="workNonAddModal" tabindex="-1" role="dialog" aria-labelledby="workNonAddLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 900px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workNonAddLabel">비가동 등록</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary m-3" style="border: none;">
       			<table id="workNonAddTable" class="table table-bordered m-0">
                  	<thead class="thead-light">
                   		<tr>
                   			<th>비가동 사유</th>
                   			<td><select class="custom-select" id="noReason" name="noReason" style="background-color:#00ffbd38;font-size: 1.3rem;height: 100%;min-width: 100%;"></select></td>
                   		</tr>
                   		<tr>
                   			<th>비가동시작일시</th>
                   			<td>
                   				<input type="datetime-local" id="noStartTime" onchange="getNoTime();" class="form-control mw-100" name="noStartTime" style="background-color:#00ffbd38;font-size: 1.3rem;height: 100%;">
                   			</td>
                   		</tr>
                   		<tr>
                   			<th>비가동종료일시</th>
                   			<td>
                   				<input type="datetime-local" id="noEndTime" onchange="getNoTime();" class="form-control mw-100" name="noEndTime" style="background-color:#00ffbd38;font-size: 1.3rem;height: 100%;">
                   			</td>
                   		</tr>
                   		<tr>
                   			<th>비가동 시간(분)</th>
                   			<td><input class="form-control" type="text" id="noTime" name="noTime" style="font-size: 1.3rem;height: 100%;min-width: 100%;" disabled></td>
                   		</tr>
                   		<tr>
                   			<th>비고</th>
                   			<td><input class="form-control text-left" type="text" id="noDesc" name="noDesc" style="font-size: 1.3rem;height: 100%;min-width: 100%;background-color:#00ffbd38;"></td>
                   		</tr>
                  	</thead>
				</table>
      		</div>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="btnWorkNonSave" style="height: 100%;font-size: 1.2rem; background: #125edc;">저장</button>
		    </div>
    	</div>
  	</div>
</div>
<!-- 비가동등록 모달창 종료 -->
<!--비가동 현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workOrderNonOperationListModal" tabindex="-1" role="dialog" aria-labelledby="workOrderNonOperationListLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1830px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workOrderNonOperationListLabel">비가동 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="workOrderNonOperationTable" class="table table-bordered tr_highlight_row">
                  	<thead class="thead-light">
                   		<tr>
                   			<th> NO.</th>
                   			<th>작업지시일</th>
                   			<th>설비</th>
                   			<th>작업지시번호</th>
                   			<th>품번</th>
                   			<th>품명</th>
							<th>비가동사유</th>
							<th>비가동시작일시</th>
							<th>비가동종료일시</th>
							<th>비가동시간(분)</th>
							<th>비고</th>
                   		</tr>
                  		</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 비가동 현황 모달창 종료 -->
<%@include file="../layout/bottom.jsp"%>
<style>
td input{
	font-size: 1.3rem;
	height: 100%;
	width: 100%;
	text-align: center;
	border: 1px solid #D6DBDF;
    border-radius: 0.25rem;
}
.modal th{
	font-size: 1.3rem;
}
.modal td{
	font-size: 1.3rem;
}
.btn_status:hover{
	border-color: #124082!important;
    background: #124082!important;
}
.tr_highlight_row tr:hover {
	background-color: #c3e1fd;
}
</style>
<script>

	let currentHref = "posc0021";
	$(document).attr("title","생산실적(레이저)");

	let equipCdTable;	//설비 팝업창
	let workOrdTable;	//작지 팝업창
	let workStatusVal;	//가공상태
	let checkStatusVal;	//측정상태
	let workOrdNoVal;
	let equipCdVal='';
	let statusVal='';
	let status = false;
	let equipDataVal='';
	let userNm = "${userNm}";
	let userNumber = "${userNumber}";
	let serverDate = "${serverDate}";
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";

	let startDate = "${serverDateTo}";
	let endDate = "${serverDateTo}";
	let workStatusOptionVal = "S";
	let equipOptionVal = "100001";

	let noReasonVal = '';
	let nonStartDate = "${serverDateFrom}";
	let nonEndDate = "${serverDateTo}";
	
	//실시간 연동
	setInterval(function() {
		
		if(status){
			console.log('start');
			workOrdOperList();	//실적정보조회
			drawEquipData();
// 			makeLaserTempStatus(); //온도현황
// 			makeLaserRaStatus();   //출력현황
			setLaserOperInfo(workOrdNoVal);
		}else{
			console.log('end');
		}
	}, 3000);


	//공통코드 처리 시작		
 	var equipCdCode = new Array(); // 상태유무
	<c:forEach items="${equipList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipCdCode.push(json);
	</c:forEach> 

 	var workStatusCode = new Array(); // 상태유무
	<c:forEach items="${workStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workStatusCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝	
	
	selectBoxAppend(equipCdCode, "equipCdSelect", '', "1"); 

	var workNonCode = new Array(); // 상태유무
	<c:forEach items="${workNonList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workNonCode.push(json);
	</c:forEach> 
	//공통코드 처리 종료
	
	selectBoxAppend(workNonCode, "noReason", '', "2"); 
	
	//설비 선택시
	function selectEqiupCd(){
		if (equipCdTable != null && equipCdTable != 'undefined') {
			equipCdTable.destroy();
		}
		equipCdTable = $('#equipCdTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
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
				url : '<c:url value="/bm/equipCodeAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return "001";},
					'prcNm' : function(){return "001"},
					'equipGubun' : function(){return "001";},
				},
				dataSrc:function(json){
					return json.data;
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{data : 'equipCd'}, 
				{data : 'equipNm'}, 
				{data : 'equipNo'}, 
				{data : 'equipType'}, 
				{data : 'equipWidth'}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#equipCdTable tbody').on('click', 'tr', function() {
			var data = equipCdTable.row(this).data();
			$('input[name=equipCd]').val(data.equipCd);
			$('input[name=equipNm]').val(data.equipNm);

			$.ajax({
				url : '<c:url value="po/workStartGetWorkOrdNo" />',
				type : 'GET',
				data : {
					'equipCd' : function(){return data.equipCd;},
				},
				success : function(res){
					if(res.result=="ok"){
						workOrdNoVal = res.workOrdNo;
						equipCdVal = data.equipCd;
						statusVal = 'S';
						status = true;
					}else if(res.result=="fail"){
						$('#alertModal').modal('show');
						$('#alertMessage').text(res.message);
						status = false;
					}
				}
			});
				
			$('#equipCdModal').modal('hide');
		});
		$('#equipCdModal').modal('show');
	}


	//작업지시번호 선택시
	function selectWorkOrdNo(){
		if (workOrdTable != null && workOrdTable != 'undefined') {
			workOrdTable.destroy();
		}
		
		workOrdTable = $('#workOrdTable').DataTable({	
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
				url : '<c:url value=""/>',
				type : 'GET',
				data : {
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{data : 'equipCd'}, 
				{data : 'equipNm'}, 
				{data : 'equipNo'}, 
				{data : 'equipType'}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#workOrdTable tbody').on('click', 'tr', function() {
			var data = workOrdTable.row(this).data();
			$('input[name=workOrdNo]').val(data.equipCd);
			$('#workOrdModal').modal('hide');
		});

		$('#workOrdModal').modal('show');
	}


	//작업지시번호 스캔
	$('#workOrdNo').keypress(function (e) {
		if (e.which == 13) {
			if($('#workOrdNo').val() == "" || $('#workOrdNo').val() == null) {
				toastr.warning("작업지시번호를 입력 후 다시 시도해주세요.");
				$('#workOrdNo').select();
				return false;
			}

			$.ajax({
				url : '<c:url value="po/workOrdNoExist" />',
				type : 'GET',
				data : {
					'workOrdNo' : function(){return $('#workOrdNo').val();},
				},
				success : function(res){
					if(res.result=="ok"){
						workOrdNoVal = res.workOrdNo;
						equipCdVal = '';
						statusVal = '';
						status = true;
					}else if(res.result=="fail"){
						$('#alertModal').modal('show');
						$('#alertMessage').text(res.message);
						status = false;
					}
				}
			});
			
		}
	});


	//실적 정보 조회
	function workOrdOperList(){
		$.ajax({
			url : '<c:url value="po/workOrderOperRaserList" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
				'equipCd' : function(){return equipCdVal;},
				//'workStatus' : function(){return statusVal;},
			},
			success : function(res){
				if(res.result=="ok"){
					//실적정보 데이터
					let infoData = res.infoData;
						$('#equipCd').val(infoData.equipCd);
						$('#equipNm').val(infoData.equipNm);
						$('#workOrdNo').val(infoData.workOrdNo);
						$('#workOrdDate').val(infoData.workOrdDate!=null?moment(infoData.workOrdDate).format('YYYY-MM-DD'):moment(serverDate).format('YYYY-MM-DD'));
						$('#workGubun').val(infoData.workGubun);
						$('#workChargrNm').val(userNm);
						$('#itemCd').val(infoData.itemCd);
						$('#itemNm').val(infoData.itemNm);
						$('#hallCount').val(infoData.hallCount!=null?rmDecimal(infoData.hallCount):"");
						$('#pnlSize').val(infoData.pnlSize);
						$('#cutSize').val(infoData.cutSize);

						equipDataVal = infoData.equipCd;
						workEndStatusVal = infoData.workStatus;
						checkEndStatusVal = infoData.checkStatus;
						
						let workStatusVal = '';
						let checkStatusVal = '';
						let font_color ='';
						let bg_color ='';
						switch(infoData.workStatus){
							case 'S' : workStatusVal = "가공시작"; font_color ='#ffffff'; bg_color ='#125edc'; break;
							case 'E' : workStatusVal = "가공종료"; font_color ='#ffffff'; bg_color ='#ee110a'; break;
							case 'T' : workStatusVal = "일시정지"; font_color ='#ffffff'; bg_color ='#ee110a'; break;
							case 'R' : workStatusVal = "일시정지해제"; font_color ='#ffffff'; bg_color ='#007fff'; break;
							case 'C' : workStatusVal = "가공취소"; font_color ='#000000'; bg_color ='#fbd20d'; break;
							default : workStatusVal = "가공대기"; font_color ='#ffffff'; bg_color ='#ff7500';
						}
						
						$('#workStatus').val(workStatusVal);
						$('#workStatus').css('color',font_color);
						$('#workStatus').css('background-color',bg_color);

						if(infoData.workStatus=="E"){
							switch(infoData.checkStatus){
							case 'S' : checkStatusVal = "측정시작"; font_color ='#ffffff'; bg_color ='#125edc'; break;
							case 'E' : checkStatusVal = "측정종료"; font_color ='#ffffff'; bg_color ='#ee110a'; break;
							case 'T' : checkStatusVal = "일시정지"; font_color ='#ffffff'; bg_color ='#ee110a'; break;
							case 'R' : checkStatusVal = "일시정지해제"; font_color ='#ffffff'; bg_color ='#007fff'; break;
							case 'C' : checkStatusVal = "측정취소"; font_color ='#000000'; bg_color ='#fbd20d'; break;
							default : checkStatusVal = "측정진행"; font_color ='#ffffff'; bg_color ='#ff7500';

							}
						}else{
							checkStatusVal = "측정진행"; font_color ='#ffffff'; bg_color ='#ff7500';
						}
						
						$('#checkStatus').val(checkStatusVal);
						$('#checkStatus').css('color',font_color);
						$('#checkStatus').css('background-color',bg_color);
											
					//누적수량 데이터
					let accData = res.accData;
					$('#dtlOrdCnt').text(rmDecimal(accData.dtlOrdCnt));
					$('#outputQty').text(rmDecimal(accData.outputQty));
					$('#fairQty').text(rmDecimal(accData.fairQty));
					$('#faultyQty').text(rmDecimal(accData.faultyQty));
					
					$('#workRate').text(parseInt(accData.workRate).toFixed(0)+" %");
					$('#nonTime').text(accData.nonTime+" 분");
					
				}else if(res.result=="fail"){
					status = false;
					$('#alertModal').modal('show');
					$('#alertMessage').text(res.message);
					
				}else if(res.result=="error"){
					status = false;
					toastr.error(res.message);
				}
			}
		});
	}
 

	//실적 등록 버튼 클릭시
	$('.btn_status').on('click',function(){
		var id = $(this).attr('id');
		//상단 버튼 초기화
		$('.btn_status').css('background-color','#125edc');
		$('.btn_status').css('border-color','#125edc');

		//상단 버튼 색상 변경
		$('#'+id+'').css('background-color','#124082');
		$('#'+id+'').css('border-color','#124082');

		//실적등록인경우
		if(id=="btnWorkAdd"){
			console.log('실적등록 선택');
		}else if(id=="btnWorkCheckList"){
			workCheckPopup();
		}else if(id=="btnWorkNonList"){
			workNonPopup();
			setTimeout(function(){
				workOrderNonOperationTable.draw();
			},150)
		}else if(id=="btnWorkList"){
			workListPopup();
		}else if(id=="btnWorkFaultyList"){
			workFaultyListPopup();
		}
		
	});

	//측정검사 현황 모달창
	let workCheckTable;
	function workCheckPopup(){
		if (workCheckTable != null && workCheckTable != 'undefined') {
			workCheckTable.destroy();
		}
		workCheckTable = $('#workCheckTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-12'l>>"
					+ "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'f>>"
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
			pageLength : -1,
			scrollY : '60vh',
			ajax : {
				url : '<c:url value="/po/workOrderStatusList"/>',
				type : 'GET',
				data : {
					'contDtlNo' : function(){return ""},

					'startDate' : function(){return startDate.replace(/-/g,'');},
					'endDate' : function(){return endDate.replace(/-/g,'');},
					'equipCd' : function(){return equipOptionVal},
					'workStatus' : function(){return workStatusOptionVal},
					//'checkYn' : 'Y',
				},
			},
			columns : [ 
				{
					render : function(data, type, row, meta){
						if(row['workStatus']!=null && row['workStatus']=="E" && row['checkStatus']!="E"){
							return '<input type="checkbox" name="checkList" style="width: 1.7rem;height: 1.7rem; vertical-align:middle;" />';
						}else{
							return '<input type="checkbox" name="checkList" style="width: 1.7rem;height: 1.7rem; vertical-align:middle;" disabled/>';
						}
					}
				},
				{data : 'workOrdDate',
					render : function(data,type,row,meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '';
						}
					},
				},
				{data : 'equipNm'}, 
				{data : 'workOrdNo'}, 
				{data : 'itemCd'}, 
				{
					data : 'workStatus',
					render : function(data,type,row,meta){
						if(data=="S"){
							return '가공시작';
						}else if(data=="E"){
							return '가공종료';
						}else if(data=="T"){
							return '일시정지';
						}else if(data=="R"){
							return '일시정지해제';
						}else if(data=="C"){
							return '가공취소';
						}else{
							return '대기'
						}
					}
				}, 
				{data : 'workStartDate'}, 
				{data : 'workEndDate'}, 
				{data : 'checkStatus',
					render : function(data,type,row,meta){
						if(data=="S"){
							return '측정시작';
						}else if(data=="E"){
							return '측정종료';
						}else if(data=="T"){
							return '일시정지';
						}else if(data=="R"){
							return '일시정지해제';
						}else if(data=="C"){
							return '측정취소';
						}else{
							return '대기'
						}
					}
				}, 
				{data : 'checkStartDate'}, 
				{data : 'checkEndDate'}, 
				{
					data : 'checkPass',
					render : function(data,type,row,meta){
						if(data=="OK"){
							return '<span style="color: blue; font-weight: bold;">'+data+'</span>';
						}else if(data=="NG"){
							return '<span style="color: red; font-weight: bold;">'+data+'</span>';
						}else {
							return '<span style="color: black;">-</span>';
						}
					}
				}, 
				{
					render : function(data,type,row,meta){
						return '<button type="button" class="btn btn-outline-success" style="font-size: 1.2rem;" name="btnWorkFaultyAdd" onClick="workOrdOperFaultyAdd(\''+row['workOrdNo']+'\');">등록</button>';
					}
				}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		 
	    var html1 = '<div class="row">';
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label" style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">작업지시일</label>'; 
	    html1 += '<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:160px;font-size: 1.3rem;height: 75%;" type="date" id="workOrdDateFrom" name="workOrdDateFrom"/>';
	    html1 += '</div>';
	    html1 += '&nbsp;&nbsp;<span style="font-size: 1.3rem;height: 100%;margin-top: 4px;">~</span>&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:160px;font-size: 1.3rem;height: 75%;" type="date" id="workOrdDateTo" name="workOrdDateTo"/>';
	    html1 += '</div>';  
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label" style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">가공상태</label>'; 
		html1 += '<select class="custom-select" id="workStatusOption" style="font-size: 1.3rem;height: 100%;"></select>';
		html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label" style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">설비</label>'; 
		html1 += '<select class="custom-select" id="equipOption" style="font-size: 1.3rem;height: 100%;"></select>';
		html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv" style="font-size: 1.2rem;height: 100%;margin-top: 2px;">조회</button>'
		html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">양품</span><div class="form-group input-sub m-0 row">';
		html1 += '<input class="form-control" style="width:100px;font-size: 1.3rem;height: 75%;color: blue;background-color:#c2f9ff;text-align: center;" type="text" id="totalFairQty" name="totalFairQty" disabled/></div>';
		html1 += '&nbsp;&nbsp;&nbsp;<span style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">불량</span><div class="form-group input-sub m-0 row">';
		html1 += '<input class="form-control" style="width:100px;font-size: 1.3rem;height: 75%;color: red;background-color:#c2f9ff;text-align: center;" type="text" id="totalFaultyQty" name="totalFaultyQty" disabled/></div>';
		html1 += '&nbsp;&nbsp;&nbsp;<span style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">실적</span><div class="form-group input-sub m-0 row">';
		html1 += '<input class="form-control" style="width:100px;font-size: 1.3rem;height: 75%;background-color:#c2f9ff;text-align: center;" type="text" id="totalOutputQty" name="totalOutputQty" disabled/></div>';
		html1 += '<button type="button" class="btn btn-danger" id="btnCheckEndList" style="margin-left: 217px;font-size: 1.2rem;height: 100%;margin-top: 2px;">측정종료</button>';
	    html1 += '</div>';
	    
		$('#workCheckTable_length').html(html1);
		$('#workOrdDateFrom').val(serverDateTo);
		$('#workOrdDateTo').val(serverDateTo);

		selectBoxAppend(equipCdCode, "equipOption", '100001', "1"); 
		selectBoxAppend(workStatusCode, "workStatusOption", 'S', "1"); 

		$(document).on('click','#btnRetv',function(){
			startDate = $('#workOrdDateFrom').val();
			endDate = $('#workOrdDateTo').val();
			workStatusOptionVal = $('#workStatusOption option:selected').val();
			equipOptionVal = $('#equipOption option:selected').val();
			$('#workCheckTable').DataTable().ajax.reload();
			//총 수량 조회
			getTotalQty();
		});

		
		$('#workCheckModal').modal('show');

		workReg();
		//총 수량 조회
		getTotalQty();
	}


	function getTotalQty(){
		$.ajax({
			url : '<c:url value="po/getTotalWorkQty"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return startDate.replace(/-/g,'');},
				'endDate' : function(){return endDate.replace(/-/g,'');},
				'equipCd' : function(){return equipOptionVal},
				'workStatus' : function(){return workStatusOptionVal},			
			},
			success : function(res){
				if(res.result=="ok"){
					let totalQtyData = res.data;
					$('#totalOutputQty').val(addCommas(totalQtyData.totalOutputQty)+" PNL");
					$('#totalFairQty').val(addCommas(totalQtyData.totalFairQty)+" PNL");
					$('#totalFaultyQty').val(addCommas(totalQtyData.totalFaultyQty)+" PNL");
				}else{
					toastr.error(res.message);
				}
				
			}
		})
	}

	$(document).on('click', '#workCheckTable tbody tr', function () {
		if (!$(this).find('input[name=checkList]').is(':disabled')) {
			$(this).find('input[name=checkList]').prop('checked', true);
		} else {
			$(this).find('input[name=checkList]').prop('checked',false);
		}
	});
	

	//측정종료버튼 클릭시
	$(document).on('click','#btnCheckEndList',function(){
		console.log('측정종료버튼 클릭시');
		var dataArray = new Array();

		if(!$('input[name=checkList]').is(':checked')){
			toastr.warning("측정종료할 작업지시번호를 선택해주세요.");
			return false;
		}		
		
		$('#workCheckTable tbody tr').each(function(index, item){

			if($(this).find('input[name=checkList]').is(':checked')){
				var rowData = new Object();
				rowData.workOrdNo = workCheckTable.row(index).data().workOrdNo;
				dataArray.push(rowData);
		        console.log(rowData);
			}
		});
	
		$.ajax({
			url : '<c:url value="po/checkEndListUpdate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {		
				$('#workCheckTable').DataTable().ajax.reload();
				$('#my-spinner').hide();
			}
		});
	});


	//측정종료버튼 클릭시
	$('#btnCheckEnd').on('click',function(){
		console.log('측정종료버튼 클릭시222');

		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비를 선택해주세요.");
			return false;
		}

		if(!$.trim($('#workOrdNo').val())){
			toastr.warning("작업지시번호를 스캔해주세요.");
			return false;
		}

		if(workEndStatusVal=="E" && checkEndStatusVal!="E"){
			$.ajax({
				url : '<c:url value="po/checkEndUpdate"/>',
				type : 'POST',
				data: {
					'workOrdNo' : function(){return workOrdNoVal},
				},
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {		
					$('#my-spinner').hide();
					workOrdOperList();
				}
			});
		}else{
			toastr.warning("가공종료 후 측정종료 해주세요.");
		}
		
	});
	

	
	//비가동 현황 모달창
	let workOrderNonOperationTable;
	function workNonPopup(){
		if (workOrderNonOperationTable != null && workOrderNonOperationTable != 'undefined') {
			workOrderNonOperationTable.destroy();
		}
		workOrderNonOperationTable = $('#workOrderNonOperationTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			async : false,
			scrollX: true,
			scrollCollapse: true,
			pageLength : 10,
			ajax : {
				url : '<c:url value="po/workOrderNonOperationList"/>',
				type : 'GET',
				data : {
					'workOrdNo' : function(){return workOrdNoVal;},
					'startDate' : function(){return nonStartDate.replace(/-/g,'');},
					'endDate' : function(){return nonEndDate.replace(/-/g,'');},
					'noReason' : function(){return noReasonVal},
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{
					data : 'workOrdDate',
					render : function(data,type,row,meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					}
				},
				{data : 'equipNm'}, 
				{data : 'workOrdNo'}, 
				{data : 'itemCd'}, 
				{data : 'itemNm'}, 
				{data : 'noReasonNm'},
				{
					render : function(data,type,row,meta){
						return moment(row['noStartDate']).format('YYYY-MM-DD') + ' ' + moment(row['noStartTime'], 'HHmm').format('HH:mm');
					}
				},
				{
					render : function(data,type,row,meta){
						return moment(row['noEndDate']).format('YYYY-MM-DD') + ' ' + moment(row['noEndTime'], 'HHmm').format('HH:mm');
					}
				},
				{data : 'noTime'},
				{data : 'noDesc'},
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		

		 var html1 = '<div class="row">';
		    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label" style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">비가동시작일</label>'; 
		    html1 += '<div class="form-group input-sub m-0 row">';
		    html1 += '<input class="form-control" style="width:160px;font-size: 1.3rem;height: 75%;" type="date" id="workOrdNonDateFrom" name="workOrdNonDateFrom"/>';
		    html1 += '</div>';
		    html1 += '&nbsp;&nbsp;<span style="font-size: 1.3rem;height: 100%;margin-top: 4px;">~</span>&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
		    html1 += '<input class="form-control" style="width:160px;font-size: 1.3rem;height: 75%;" type="date" id="workOrNondDateTo" name="workOrNondDateTo"/>';
		    html1 += '</div>';  
		    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label" style="font-size: 1.3rem;margin-top: 2px;margin-right: 8px;">비가동사유</label>'; 
			html1 += '<select class="custom-select" id="searhNoReason" style="font-size: 1.3rem;height: 100%;"></select>';
		    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnNonRetv" style="font-size: 1.2rem;height: 100%;margin-top: 2px;">조회</button>'
		    html1 += '</div>';
		    
			$('#workOrderNonOperationTable_length').html(html1);
			$('#workOrdNonDateFrom').val(nonStartDate);
			$('#workOrNondDateTo').val(nonEndDate);

			selectBoxAppend(workNonCode, "searhNoReason", '', "1");

			$(document).on('click','#btnNonRetv',function(){
				nonStartDate = $('#workOrdNonDateFrom').val();
				nonEndDate = $('#workOrNondDateTo').val();
				noReasonVal = $('#searhNoReason option:selected').val();
				$('#workOrderNonOperationTable').DataTable().ajax.reload();
			});

		$('#workOrderNonOperationListModal').modal('show');
	}
	

	//비가동등록 클릭시
	$('#btnWorkNonAdd').on('click',function(){

		if(!$.trim($('#equipCd').val())){
			toastr.warning("설비를 선택해주세요.");
			return false;
		}

		if(!$.trim($('#workOrdNo').val())){
			toastr.warning("작업지시번호를 스캔해주세요.");
			return false;
		}
		
		$('#noStartTime').val(moment().format("YYYY-MM-DDTHH:mm"));
		$('#noEndTime').val(moment().format("YYYY-MM-DDTHH:mm"));
		$('#noTime').val(0);
		$('#noDesc').val('');
		selectBoxAppend(workNonCode, "noReason", '', "2");
		$('#workNonAddModal').modal('show');
	});

	//비가동등록 저장 버튼 클릭시
	$('#btnWorkNonSave').on('click',function(){
		if($('#noReason').val()=='') {
			toastr.warning('비가동 사유를 선택해 주세요.');
			$('#noReason').select();
			return false;
		}
		$.ajax({
			url : '<c:url value="po/workOrderNonOperationInsert" />',
			type : 'POST',
			data : {
				'workOrdNo' 		: workOrdNoVal,
				'noReason' 			: $('#noReason').val(),
				'noStartDate'		: moment($('#noStartTime').val()).format('YYYYMMDD'),
				'noStartTime'		: moment($('#noStartTime').val()).format('HHmm'),
				'noEndDate'			: moment($('#noEndTime').val()).format('YYYYMMDD'),
				'noEndTime'			: moment($('#noEndTime').val()).format('HHmm'),
				'noTime' 			: $('#noTime').val(),
				'noDesc' 			: $('#noDesc').val(),
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("저장되었습니다.");
					$('#workNonAddModal').modal('hide');
				}else{
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		 
	});

	//비가동
	function getNoTime() {
		var start = new Date($('#noStartTime').val()); 
		var getStart = start.getTime();
		var end = new Date($('#noEndTime').val()); 
		var getEnd = end.getTime();
		var sum = getEnd - getStart;
		stopTimeVal = sum/60000;
		if(stopTimeVal < 0) {
			toastr.warning('일시를 확인해 주세요.');
			$('#noTime').val('0');
			$('#noEndTime').val($('#noStartTime').val());
			$('#noEndTime').select();
		} else {
			$('#noTime').val(stopTimeVal);
		}
	}


	//생산 현황 모달창
	let workListTable;
	function workListPopup(){
		if (workListTable != null && workListTable != 'undefined') {
			workListTable.destroy();
		}
		
		workListTable = $('#workListTable').DataTable({	
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
				url : '<c:url value="/po/workOrderStatusList"/>',
				type : 'GET',
				data : {
					'contDtlNo' : function(){return ""},
					'workYn' : 'Y',
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{data : 'itemCd'}, 
				{data : 'itemNm'}, 
				{data : 'equipNm'}, 
				{data : 'workOrdNo'}, 
				{
					data : 'workStatus',
					render : function(data,type,row,meta){
						if(data=="S"){
							return '가공시작';
						}else if(data=="E"){
							return '가공종료';
						}else if(data=="T"){
							return '일시정지';
						}else if(data=="R"){
							return '일시정지해제';
						}else if(data=="C"){
							return '가공취소';
						}else{
							return '대기'
						}
					}
				}, 
				{data : 'workStartDate'}, 
				{data : 'workEndDate'}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#workListModal').modal('show');
	}
	

	//불량 현황 모달창
	let workFaultyListTable;
	function workFaultyListPopup(){

		if($('#workOrdNo').val() == "" || $('#workOrdNo').val() == null) {
			toastr.warning("작업지시번호를 입력 후 다시 시도해주세요.");
			$('#workOrdNo').select();
			return false;
		}
		if (workFaultyListTable != null && workFaultyListTable != 'undefined') {
			workFaultyListTable.destroy();
		}
		
		workFaultyListTable = $('#workFaultyListTable').DataTable({	
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
				url : '<c:url value="po/workOrderFaultyList"/>',
				type : 'GET',
				data : {
					'workOrdNo' : function(){return workOrdNoVal},
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{data : 'faultyTypeNm'}, 
				{data : 'faultyTypeQty','className':'text-right'}, 
				{data : 'faultyTypeDate'}, 
				{data : 'faultyTypeDesc'}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#workFaultyListModal').modal('show');
	}

	let workFaultyAddTable;
	let faultyWorkOrdNo;
	//불량등록 팝업창
	function workOrdOperFaultyAdd(workOrdNo){
		faultyWorkOrdNo = workOrdNo;
		console.log('불량등록 팝업창!')
		
		if (workFaultyAddTable != null && workFaultyAddTable != 'undefined') {
			workFaultyAddTable.destroy();
		}
		
		workFaultyAddTable = $('#workFaultyAddTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : true,
			scrollX : false,
			lengthChange : true,
			async : false,
			scrollY : '45vh',
			pageLength : -1,
			ajax : {
				url : '<c:url value="po/workOrderFaultyList"/>',
				type : 'GET',
				data : {
					'workOrdNo' : function(){return faultyWorkOrdNo},
					'etc1' : function(){return "001"},
				},
			},
			columns : [ 
				{
					data : 'No.',
					render : function(data, type, row, meta){
						return meta.row+1;
					}
				},
				{
					data : 'faultyTypeNm',
					render : function(data, type, row, meta){
						var html="";
						html += '<input type="hidden" class="form-control" name="faultyTypeCd" value="'+row['faultyTypeCd']+'" disabled/>'
						html += '<input type="text" class="form-control" name="faultyTypeNm" value="'+data+'" style="font-size: 1.3rem;min-width: 100%;height: 100%;" disabled/>'
						return html;
					}
				}, 
				{
					data : 'faultyTypeQty',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="text" class="form-control" name="faultyTypeQty" value="'+addCommas(data)+'" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}else{
							return '<input type="text" class="form-control" name="faultyTypeQty" value="'+0+'" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}
					}
				}, 
				{
					data : 'faultyTypeDate',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="date" class="form-control" name="faultyTypeDate" value="'+moment(data).format('YYYY-MM-DD')+'" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}else{
							return '<input type="date" class="form-control" name="faultyTypeDate" value="'+moment(serverDate).format('YYYY-MM-DD')+'" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}
					}
				}, 
				{
					data : 'faultyTypeDesc',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="text" class="form-control" name="faultyTypeDesc" value="'+data+'" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}else{
							return '<input type="text" class="form-control" name="faultyTypeDesc" value="" style="background-color:#00ffbd38;font-size: 1.3rem;min-width: 100%;height: 100%;"/>'
						}
					}
				}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#workCheckModal').modal('hide');
		$('#workFaultyAddModal').modal('show');
		setTimeout(function(){
			workFaultyAddTable.draw();
		},150)
	}


	//불량등록 클릭시
	$('#btnWorkFaultySave').on('click',function(){
		console.log('불량등록 저장');
		var dataArray = new Array();		
		var check=true;  		
		
		$('#workFaultyAddTable tbody tr').each(function(index, item){

			var rowData = new Object();
			
			rowData.workOrdNo = faultyWorkOrdNo;
			rowData.faultyTypeCd = $(this).find('td input[name=faultyTypeCd]').val();
			rowData.faultyTypeQty = $(this).find('td input[name=faultyTypeQty]').val().replace(/,/g,'');
			rowData.faultyTypeDate = $(this).find('td input[name=faultyTypeDate]').val().replace(/-/g,'');
			rowData.faultyTypeDesc = $(this).find('td input[name=faultyTypeDesc]').val();

			dataArray.push(rowData);
	        console.log(rowData);
		});
		
		if(check){
			$.ajax({
			url : '<c:url value="po/workOrdFaultyRaserIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {		
					if (res.result == 'ok') {
						toastr.success("불량등록 되었습니다.");
						//총 수량 조회
						getTotalQty();
						$('#workCheckTable').DataTable().ajax.reload();
					}else {
						toastr.error(res.message);
					}

					$('#workCheckModal').modal('show');
					$('#workFaultyAddModal').modal('hide');
					$('#my-spinner').hide();
				}
			});
		}
	});


	//불량등록 닫기 버튼
	$('#btnWorkFaultyCancel').on('click',function(){
		$('#workCheckModal').modal('show');
		$('#workFaultyAddModal').modal('hide');

	});
	
	
	function workReg(){
		$.ajax({
			url : '<c:url value="po/workOrderAdmUpd" />',
			type : 'POST',
			data : {},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res){
				if(res.result=="ok"){
					$('#workCheckTable').DataTable().ajax.reload();
				}else{
					//toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		})
	}








	


	

	//레이저 가공현황***************************************************************************************
	// 가공중인 LASER 설비 가공데이터 조회
	function getLaserData() {
		let result = [];
		$.ajax({
			url: '<c:url value="mt/laserOperInfoLstByWorkOrdNo"/>',
            type: 'POST',
            async: false,
            data: {
                'workOrdNo' : function(){return workOrdNoVal;}
			},
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}
		
	
	// makeHtml
	function makeHtml(recipeData) {
		let pnl_x = '';
		let pnl_y = '';

		// 레시피데이터가 있을 경우 -> 가공중
		if(recipeData.length != 0) {
			pnl_x = _.filter(recipeData, function(v) { return v.recipeNo == '05'; })[0].sizeX;
			pnl_y = _.filter(recipeData, function(v) { return v.recipeNo == '05'; })[0].sizeY;
		}
		
		let html = '';
			html += '<div style="flex: 0 0 auto;width: 100%;height: 100%;">';
			html += '		<div style="border: 1px solid #ccccdc12;margin: 0.25%;padding: 0.25%;height: 100%;">';
			html += '				<table class="table table-bordered m-0">';
			html += '					<colgroup>';
			html += '						<col width="15%">';
			html += '						<col width="35%">';
			html += '						<col width="15%">';
			html += '						<col width="35%">';
			html += '					</colgroup>';
			html += '					<tr>';
			html += '						<th class="text-center align-middle" style="font-size: 1.3rem;">범례</th>';
			html += '						<td class="text-center align-middle" colspan="3">';
			html += '							<div class="progress" style="height: 35px!important;"> ';
			html += '								<div class="progress-bar" style="width: 25%; color: #000000; background-color: #F2E3D5;font-size: 1.3rem;">미가공</div>';
			html += '								<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #3CA6A6;font-size: 1.3rem;">가공대기</div>';
			html += '								<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #026773;font-size: 1.3rem;">가공중</div>';
			html += '								<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #014034;font-size: 1.3rem;">가공완료</div>';
			html += '							</div>';
			html += '						</td>';
			html += '					</tr>';
			html += '					<tr style="height: calc(47vh - 51px);">';
			html += '						<th class="text-center align-middle" style="font-size: 1.3rem;">도면</th>';
			html += '						<td colspan="3" id="equipCanvas" style="text-align: center;">';
			html += '							<canvas id="canvas" width="'+(parseFloat(pnl_x)*10+10)+'" height="'+(parseFloat(pnl_y)*10+10)+'"';
			html += '									style="display: inline; height: 100%;" >';
			html += '							</canvas>';
			html += '						</td>';
			html += '					</tr>';
			html += '					<tr>';
			html += '						<th class="text-center align-middle" style="font-size: 1.3rem;">진척률</th>';
			html += '						<td colspan="3">';
			html += '							<div class="progress" style="background-color: #F2E3D5; margin: 5px; height: 35px!important;font-size: 1.3rem;">';
			html += '								<div class="progress-bar progress-bar-striped progress-bar-animated" id="progressBar"></div>';
			html += '							</div>';
			html += '						</td>';
			html += '					</tr>';
			html += '				</table>';
			html += '		</div>';
			html += '</div>';
			
		return html;
	}

	// 원형홀 생성
	function makeCircle(ctx, x, y, width, height, data) {
		let color = '#F2E3D5';
		if(data.workStatus == 'S') { // 가공완료
			color = '#014034';
		} else if(data.workStatusPrev == 'S') { // 가공중
			color = '#026773';
		} else if(data.workStatusPrev2 == 'S') { // 가공예정
			color = '#3CA6A6';
		} else {
			color = '#F2E3D5';
		}
		
		ctx.beginPath();
		ctx.arc(x*10, y*10, width*10/2, 0, Math.PI*2);
		ctx.stroke();
		ctx.fillStyle = color;
		ctx.fill();
	}

	// 사각형홀 생성
	function makeRectangle(ctx, x, y, width, height, data) {
		let color = '#F2E3D5';
		if(data.workStatus == 'S') { // 가공완료
			color = '#014034';
		} else if(data.workStatusPrev == 'S') { // 가공중
			color = '#026773';
		} else if(data.workStatusPrev2 == 'S') { // 가공예정
			color = '#3CA6A6';
		} else {
			color = '#F2E3D5';
		}

		ctx.fillStyle  = color;
		ctx.fillRect((x-(width)/2)*10, (y-(height)/2)*10, width*10, height*10);
	}

	// 가운데가 비어있는 사각형홀 생성
	function makeEmptyRectangle(ctx, x, y, width, height, data) {
		let color = '#F2E3D5';
		if(data.workStatus == 'S') { // 가공완료
			color = '#014034';
		} else if(data.workStatusPrev == 'S') { // 가공중
			color = '#026773';
		} else if(data.workStatusPrev2 == 'S') { // 가공예정
			color = '#3CA6A6';
		} else {
			color = '#F2E3D5';
		}

		ctx.strokeStyle  = color;
		ctx.strokeRect(10, 10, width*10-10, height*10-10);
	}


	function drawEquipData() {
		$('#laser').empty();
		recipeList = getLaserData(); // 가공중인 데이터 조회
		// 가공중인 데이터가 있을 경우
		if(recipeList.length != 0) {
			let equipData = equipDataVal;
			let recipe = _.filter(recipeList, function(v) { return v.equipCd == equipData; });

			$('#laser').append(makeHtml(recipe));
			
			let pnl_x = '';
			let pnl_y = '';
			console.log('equipData:'+equipData);
			console.log(_.filter(recipeList, function(v) { return v.equipCd == equipData; }))

			// 레시피데이터가 있을 경우 -> 가공중
			if(recipe.length != 0) {
				pnl_x = _.filter(recipe, function(v) { return v.recipeNo == '05'; })[0].sizeX;
				pnl_y = _.filter(recipe, function(v) { return v.recipeNo == '05'; })[0].sizeY;
				
				$('#equipCanvas').empty();
				let html = '';
					html += '<canvas id="canvas" width="'+(parseFloat(pnl_x)*10+10)+'" height="'+(parseFloat(pnl_y)*10+10)+'"';
					html += '		style="display: inline; height: 100%;" >';
					html += '</canvas>';
				$('#equipCanvas').append(html);

				let canvas = $('#canvas')[0];

				for(var j=0;j<recipe.length;j++) {
					let recipeData = recipe[j];
					if(recipeData.recipeNo == '01') { // 1번 레시피일 경우
						makeRectangle(canvas.getContext('2d'),
									parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
									(parseFloat(recipeData.sizeX)*10)+0.6, (parseFloat(recipeData.sizeY)*10)+0.6, recipeData);
					} else if(recipeData.recipeNo == '04') { // 4번 레시피일 경우
						makeRectangle(canvas.getContext('2d'),
									parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
									parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
					} else if(recipeData.recipeNo == '05') { // 5번 레시피일 경우
						makeEmptyRectangle(canvas.getContext('2d'),
											parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
											parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
					} else { // 2 ~ 3번 레시피일 경우
						makeCircle(canvas.getContext('2d'),
								parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
								parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
					}
				}

				let max = recipe.length;
				let now = _.filter(recipe, function(v) { return v.workStatus != null; }).length;
				
				$('#progressBar').css('width',(now/max*100).toFixed(1)+'%').css('background-color','#014034').text((now/max*100).toFixed(1)+'%');
			}
		}
	}
	

	//출력/운도/습도 그래프현환********************************************************************************
   	let laserTempDataArr = new Array();			// 레이저 온도 데이터 배열 
   	let laserRaDataArr = new Array();			// 레이저 출력 데이터 배열
   	let laserTempLabelArr = new Array();		// 레이저 온도 라벨 배열 
   	let laserRaLabelArr = new Array();			// 레이저 출력 라벨 배열

   	let rangeArr = new Array();		// 최댓값 최솟값 배열
	<c:forEach items="${tempHumiRangeCd}" var="info">
	var json = new Object();
	json.min = "${info.etc2}";
	json.max = "${info.etc3}";
	rangeArr.push(json);
	</c:forEach>

   	//현재 시간에서 앞뒤로 2시간
	function getIndexList(cnt, postFix) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			result.push((i+1)+postFix);
		}
		return result;
	}

	//데이터가져오기
	function setLaserOperInfo(activeWorkOrdNo) {
	  	let stageCount = 1;
	  	let powerTempVal;
	
	  	$.ajax({
			url: '<c:url value="mt/laserOperInfoStageCount"/>',
            type: 'POST',
            async: false,
            data: {
				'workOrdNo' : function() {return activeWorkOrdNo;},
			},
			success : function(res) {
				stageCount = res.stageCount;
			}
		});

	  	$.ajax({
			url: '<c:url value="mt/laserOperInfoDtlList"/>',
            type: 'POST',
            async: false,
            data: {
				'workOrdNo' : function() {return activeWorkOrdNo;},
			},
			success : function(res) {
				powerTempVal = res.data;
			}
		});
		
		laserTempDataArr = new Array(stageCount).fill(null);
		laserTempLabelArr = new Array(stageCount).fill(null);
		laserRaDataArr = new Array(stageCount).fill(null);
		laserRaLabelArr = new Array(stageCount).fill(null);

		$.each(powerTempVal, function(index, item) {
			laserTempDataArr[index] = (item.laserTemperature == undefined) ? null : item.laserTemperature
			laserTempLabelArr[index] = '';
			laserRaDataArr[index] = (item.laserRa == undefined) ? null : item.laserRa
			laserRaLabelArr[index] = '';
		})
		
		//차트 초기화
		$("#laserTempText").addClass("d-none");
		$('#laserTempStatus').remove();
	 	$('#laserTempStatusDiv').append('<canvas id="laserTempStatus"><canvas>');
		$("#laserRaText").addClass("d-none");
		$('#laserRaStatus').remove();
		$('#laserRaStatusDiv').append('<canvas id="laserRaStatus"><canvas>');

		makeLaserTempStatus(laserTempLabelArr, laserTempDataArr);
	 	makeLaserRaStatus(laserRaLabelArr, laserRaDataArr);
	}

	// 레이저 설비(온도)
	function makeLaserTempStatus() { 
		laserTempStatus = new Chart(
			document.getElementById('laserTempStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(5, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#ff3f3f',
						borderColor: '#f24055',
						data: laserTempDataArr,
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[2].min,
							        yMax: rangeArr[2].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[2].max,
							        yMax: rangeArr[2].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							position: 'top',
						},
					},
				},
			}
		);
	}


	// 레이저 설비(출력)
	function makeLaserRaStatus() { 
		laserRaStatus = new Chart(
			document.getElementById('laserRaStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(5, ''),
					datasets: [{
						label: '%',
						backgroundColor: '#00a265',
						borderColor: '#40A3A3',
						data: laserRaDataArr,
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[2].min,
							        yMax: rangeArr[2].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[2].max,
							        yMax: rangeArr[2].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							position: 'top',
						},
					},
				},
			}
		);
	}
	

	//출력/운도/습도 그래프현환********************************************************************************
</script>

</body>
</html>