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
				<li class="breadcrumb-item active">생산실적(후가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="background-color: #ffffff;flex-direction: column;">
			<!------------ top ----------->
			<div class="m-2" id="" style="min-height: 4vh;max-height: 4vh;background-color: #125edc;border-radius: 10px;">
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;" id="btnWorkList">실적 현황</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkList">생산 현황</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkBoxLabelList">박스라벨 현황</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkFaultyList">불량 현황</button>
				<button type="button" class="btn btn_status mr-3" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;" id="btnWorkNonList">비가동 현황</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #170504;;background: #fc403a;color: white;font-size: 1.2rem;" id="btnWorkEnd">가공 종료</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #000000;background: #ffc107;color: black;font-size: 1.2rem;" id="btnWorkNonAdd">비가동등록</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #000000;background: #61b61c;color: white;font-size: 1.2rem;" id="btnWorkAdd">실적등록</button>
				<button type="button" class="btn float-right" style="border-radius: 0%;height: 100%;border-color: #030b10;background: #2196f3;color: white;font-size: 1.2rem;" id="btnWorkStart">가공 시작</button>
			</div>
			<!------------ info table ----------->
			<div class="row m-2" style="background-color: #ffffff;">
				<div class="col-sm-11">
					<div class="table-responsive" style="height: 100%;">
						<table id="topTable" class="table table-bordered m-0 table_top">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
		                    <thead class="thead-light">
			                   <tr>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">생산라인</th>
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
			                     	<th style="vertical-align: middle;font-size: 1.3rem;">충진 셋팅 중량</th>
			                    	<td>
			                    		<input type="text" class="" id="fillingWt" name="fillingWt" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">비닐포장 수량(EA)</th>
			                    	<td>
		                    			<input type="text" class="" id="fillingCount" name="fillingCount" style="border:none;" readonly>
			                    	</td>
			                    	<th style="vertical-align: middle;font-size: 1.3rem;">박스당 비닐포장 수량(EA)</th>
			                    	<td>
		                    			<input type="text" class="" id="boxCount" name="boxCount" style="border:none;" readonly>
			                    	</td>
			                    </tr>
		                    </thead>
						</table>
					</div>
				</div>
				<div class="col-sm-1">
					<div style="height: 100%;">
						<table id="" class="table table-bordered m-0 table_top" style="height: 100%;">
							<colgroup>
								<col width="100%">
							</colgroup>
		                    <thead class="thead-light">
			                    <tr>
			                     	<th style="vertical-align: middle;font-size: 1.3rem;">가공 상태</th>
			                    </tr>
			                    <tr>
			                    	<td>
		                    			<input type="text" class="" id="workStatus" name="workStatus" style="border:none;" readonly>
			                    	</td>
			                    </tr>
		                    </thead>
						</table>
					</div>
				</div>
			</div>
			<div class="m-2" id="" style="min-height: 4vh;max-height: 4vh;background-color: #125edc;border-radius: 10px;display: grid;grid-template-columns: 1fr 1.5fr 1.5fr 1.5fr;">
				<button type="button" class="btn" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;">충진 현황</button>
				<button type="button" class="btn" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.3rem;">충진 공정</button>
				<button type="button" class="btn float-right" style="height: 100%;border-color: #124082;background: #124082;color: white;font-size: 1.2rem;">비닐포장 공정</button>
				<button type="button" class="btn float-right" style="height: 100%;border-color: #125edc;background: #125edc;color: white;font-size: 1.2rem;">박스포장 공정</button>
			</div>
			<!------------ graf table ----------->
			<div class="ml-2 mr-2 mb-2" id="" style="min-height: 55vh;max-height: 55vh;display: grid;grid-template-columns: 1fr 1.5fr 1.5fr 1.5fr;">
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 mb-2 pl-1" style="height: 165px;display: flex;">
						<div class="" style="width: 100%;border-radius:10px;height: 100%;background: #c3e1fd;">
							<h5 class="mnt_card_tit" style="height: 20%;color: #124082;">온도</h5>
							<div class="" style=" height: 80%;">
								<div class="p-0 div_border" style="height: 70%;">
				        			<div style="min-width: 100%;height: 100%;">
				        				<div style="position: relative;" id="finishTempStatusDiv">
				        					<canvas id="finishTempStatus"></canvas>
				        				</div>
				        			</div>
				        		</div>
								<div class="card-body p-0 div_value" id="finishTempStatusText" style="
															    color: #124082;
															    font-size: 1.3rem;
															    font-weight: bold;
															    width: 100%;
															    text-align: center;
															    height: 30%;
															    "><span>-</span></div>
							 </div>
						</div>
					</div>
					<div class="row mr-2 mb-2 pl-1" style="height: 165px;display: flex;">
						<div class="" style="width: 100%;border-radius:10px;height: 100%;background: #c3e1fd;">
							<h5 class="mnt_card_tit" style="height: 20%;color: #124082;">압력</h5>
							<div class="" style=" height: 80%;">
								<div class="p-0 div_border" style="height: 70%;">
				        			<div style="min-width: 100%;height: 100%;">
				        				<div style="position: relative;" id="finishPressStatusDiv">
				        					<canvas id="finishPressStatus"></canvas>
				        				</div>
				        			</div>
				        		</div>
								<div class="card-body p-0 div_value" id="finishPressStatusText" style="
															    color: #124082;
															    font-size: 1.3rem;
															    font-weight: bold;
															    width: 100%;
															    text-align: center;
															    height: 30%;
															    "><span>-</span></div>
							 </div>
						</div>
					</div>
					<div class="row mr-2 mb-2 pl-1" style="height: 165px;display: flex;">
						<div class="" style="width: 100%;border-radius:10px;height: 100%;background: #c3e1fd;">
							<h5 class="mnt_card_tit" style="height: 20%;color: #124082;">시간</h5>
							<div class="" style=" height: 80%;">
								<div class="p-0 div_border" style="height: 70%;">
				        			<div style="min-width: 100%;height: 100%;">
				        				<div style="position: relative;" id="finishTimeStatusDiv">
				        					<canvas id="finishTimeStatus"></canvas>
				        				</div>
				        			</div>
				        		</div>
								<div class="card-body p-0 div_value" id="finishTimeStatusText" style="
															    color: #124082;
															    font-size: 1.3rem;
															    font-weight: bold;
															    width: 100%;
															    text-align: center;
															    height: 30%;
															    "><span>-</span></div>
							 </div>
						</div>
					</div>
				</div>
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">지 시 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capOrdCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">실 적 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capInputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">양 품 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capOutputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">불 량 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capFaultyCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">진 척 률</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capRate" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">비 가 동</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="capOperStatus" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 100%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">실 적 / 지 시 수량</h5>
								<div class="" style="margin-top: 42px;">
									<h2 class="text-green" style="text-align:center;"><span id="packCalCount" style="color: #124082;">-</span></h2>
								</div>
							</div>
						</div>
						<!-- <div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">실적 수량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="packInputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div> -->
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">양 품 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="packOutputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">불 량 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="packFaultyCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">진 척 률</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="packRate" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #12408236;">
								<h5 class="mnt_card_tit" style="color: #124082;">비 가 동</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="packOperStatus" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="" style="height: 100%;background: #ffffff;">
					<div class="row mt-3 mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 100%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">실 적 / 지 시 수량</h5>
								<div class="" style="margin-top: 35px;">
									<h2 class="text-green" style="text-align:center;"><span id="boxCalCount" style="color: #124082;">-</span></h2>
								</div>
							</div>
						</div>
						<!-- <div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">실적 수량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="boxInputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div> -->
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">양 품 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="boxOutputCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">불 량 수 량</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="boxFaultyCount" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="row mr-2 ml-2 mb-2" style="height: 165px;display: flex;justify-content: space-between;">
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">진 척 률</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="boxRate" style="color: #124082;">-</span></h1>
								</div>
							</div>
						</div>
						<div class="" style="width: 49%;height: 100%;">
							<div class="" style="border-radius:10px;height: 100%;background: #c3e1fd;">
								<h5 class="mnt_card_tit" style="color: #124082;">비 가 동</h5>
								<div class="" style="margin-top: 35px;">
									<h1 class="text-green" style="text-align:center;"><span id="boxOperStatus" style="color: #124082;">-</span></h1>
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

<!-- 경고 팝업창 시작 -->
<div class="modal fade bd-example-modal-lg" id="alertModal2" tabindex="-1" role="dialog" aria-labelledby="alertLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f44336; color:white;">
        <h5 class="modal-title" id="alertLabel2">경고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	
      	 	 <h6 class="modal-title" id="alertMessage2"></h6>
		<hr class="text-secondary"> 
      </div>
      <div class="modal-footer p-0">
      	<button type="button" class="btn" id="btnWorkEndY" style="height: 100%;font-size: 1.2rem; background: #ef333c; color: white; border: 1px solid black;">가공종료</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal" style="height: 100%;font-size: 1.2rem;">닫기</button>
      </div>
   	</div>
  </div>
</div>
<!-- 경고 팝업창  종료 -->

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
	<div class="modal-dialog modal-xl" style="max-width: 1830px;">
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
                  	<thead class="thead-light">
                   		<tr>
                   			<th rowspan="2"> NO.</th>
                   			<th rowspan="2">작업지시일</th>
                   			<th rowspan="2">설비</th>
                   			<th rowspan="2">작업지시번호</th>
                   			<th rowspan="2" >품번</th>
                   			<th rowspan="2" >품명</th>
							<th rowspan="2" >가공 상태</th>
							<th rowspan="1" colspan="3">충 진 공 정</th>
							<th rowspan="1" colspan="4">비 닐 포 장</th>
							<th rowspan="1" colspan="2">박 스 포 장</th>
							<th rowspan="2" >가공 시작시간</th>
							<th rowspan="2" >가공 종료시간</th>
                   		</tr>
                   		<tr>
                   			<th >지시</th>
                   			<th >실적</th>
                   			<th >양품</th>
                   			
                   			<th >지시</th>
                   			<th >실적</th>
                   			<th >양품</th>
                   			<th >불량</th>
                   			
                   			<th >지시</th>
                   			<th >실적</th>
                   		</tr>
                  		</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 생산현황 모달창 종료 -->
<!-- 박스라벨현황 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workBoxListModal" tabindex="-1" role="dialog" aria-labelledby="workBoxListLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1530px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workBoxListLabel">박스라벨 현황</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="workBoxListTable" class="table table-bordered tr_highlight_row">
       				<colgroup>
       					<col width="5%">
       					<col width="20%">
       					<col width="10%">
       					<col width="16%"> 
       					<col width="18%">
       					<col width="15%">
       					<col width="10%">
       					<col width="6%">
       				</colgroup>
                  	<thead class="thead-light">
                   		<tr>
                   			<th>NO.</th>
                   			<th>작업지시번호</th>
                   			<th>설비</th>
                   			<th>품명</th>
							<th>박스 라벨</th>
							<th>발행 일자</th>
							<th>발행 담당자</th>
							<th>출력</th>
                   		</tr>
                  		</thead>
				</table>
      		</div>
    	</div>
  	</div>
</div>
<!-- 박스라벨현황 모달창 종료 -->
<!--실적등록 모달창 시작 -->
<div class="modal fade bd-example-modal-xl" id="workAddModal" tabindex="-1" role="dialog" aria-labelledby="workAddLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1280px;">
		<div class="modal-content">
      		<div class="modal-header" style="background-color:#125edc; color:white;">
        		<h5 class="modal-title" id="workAddLabel">실적 등록</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary m-3" style="border: none;">
      			<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-8 p-0">
						
      			
			       			<table id="" class="table table-bordered m-0">
			                  	<thead class="thead-light">
			                   		<tr>
			                   			<th>공정 구분</th>
			                   			<th colspan="2">실적수량</th>
			                   			<th colspan="2">양품수량</th>
			                   			<th colspan="2">불량수량</th>
			                   		</tr>
			                   		<tr>
			                   			<th>충진</th>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupCapInputCount" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupCapOutputCount" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupCapFaultyCount" value="-" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   		</tr>
			                   		<tr>
			                   			<th>비닐포장</th>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupPackInputCount" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupPackOutputCount" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupPackFaultyCount" value="-" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   		</tr>
			                   		<tr>
			                   			<th>박스</th>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupBoxLoadCount" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupBoxOutputCount" value="-" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   			<td colspan="2"><input type="text" class="form-control popupData" id="popupBoxFaultyCount" value="-" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   		</tr>
			                  	</thead>
							</table>
							<hr class="text-secondary m-3" style="border: none;">
							<table id="" class="table table-bordered m-0">
			                  	<thead class="thead-light">
			                  		<tr>
			                   			<th colspan="4">충진 공정</th>
			                   		</tr>
			                   		<tr>
			                   			<th>충진 중량</th>
			                   			<td><input type="text" class="form-control popupData" id="popupWeight" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   		</tr>
			                   		<tr>
			                   			<th>충진 속도</th>
			                   			<td><input type="text" class="form-control popupData" id="popupSpeed" style="min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;" disabled></td>
			                   		</tr>
			                  	</thead>
							</table>
							<hr class="text-secondary m-3" style="border: none;">
							<table id="" class="table table-bordered m-0">
			                  	<thead class="thead-light">
			                  		<tr>
			                   			<th colspan="6">충진 설비연동</th>
			                   		</tr>
			                   		<tr>
			                   			<th>온도</th>
			                   			<td><input type="text" class="form-control popupData" id="popupTemperature" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   			<th>압력</th>
			                   			<td><input type="text" class="form-control popupData" id="popupPressure" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   			<th>시간</th>
			                   			<td><input type="text" class="form-control popupData" id="popupTime" style="background-color:#00ffbd38;min-width:100%;height: 100%;width: 100%;font-size: 1.0rem;"></td>
			                   		</tr>
			                  	</thead>
							</table>
						</div>
						<div class="col-md-4 p-0 pl-3">
							<table id="workFaultyAddTable" class="table table-bordered m-0" style="margin-top:0px!important;">
			       				<colgroup>
			       					<col width="75%">
			       					<col width="25%">
			       				</colgroup>
			                  	<thead class="thead-light">
			                   		<tr>
			                   			<th>불량유형</th>
			                   			<th>불량수량</th>
			                   		</tr>
			                  	</thead>
							</table>
						</div>
					</div>
				</div>
      		</div>
      		<div class="modal-footer p-0">
      			<button type="button" class="btn btn-primary" id="btnWorkGet" style="height: 100%;font-size: 1.2rem; background: #e91e63;">실적수집</button>
      			<button type="button" class="btn btn-primary" id="btnWorkSave" style="height: 100%;font-size: 1.2rem; background: #125edc;">실적저장</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal" style="height: 100%;font-size: 1.2rem;">닫기</button>
		    </div>
    	</div>
  	</div>
</div>
<!-- 실적등록 모달창 종료 -->

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
       					<col width="35%">
       					<col width="20%">
       					<col width="20%">
       					<col width="15%">
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

	let currentHref = "wmsc0271";
	$(document).attr("title","생산실적(후가공)");

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
	let barcodeScanFlag = false;
	let workEndStatus = false;
	let startDate = "${serverDateTo}";
	let endDate = "${serverDateTo}";
	let workStatusOptionVal = "S";
	let equipOptionVal = "100005";

	let fillingWtVal;
	let processTimeVal;
	let noReasonVal = '';
	let nonStartDate = "${serverDateFrom}";
	let nonEndDate = "${serverDateTo}";

	let capUnitVal = ''; 	//캡핑 수량
	
	var now = new Date();
	var hours = now.getHours();
	hours = hours<10?"0"+hours:hours;
	var min = now.getMinutes();
	min = min<10?"0"+min:min;
	

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

	var workNonCode = new Array(); // 상태유무
	<c:forEach items="${workNonList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workNonCode.push(json);
	</c:forEach> 
	//공통코드 처리 종료
	
	selectBoxAppend(workNonCode, "noReason", '', "2"); 

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
		}else if(id=="btnWorkNonList"){
			workNonPopup();
			setTimeout(function(){
				workOrderNonOperationTable.draw();
			},150)
		}else if(id=="btnWorkList"){
			workListPopup();
			setTimeout(function(){
				workListTable.draw();
			},150)
		}else if(id=="btnWorkFaultyList"){
			workFaultyListPopup();
		}else if(id=="btnWorkBoxLabelList"){
			workBoxLabelListPopup();
		}
	});

	
	//생산 현황 모달창
 	let workListTable;
	function workListPopup(){
		if (workListTable != null && workListTable != 'undefined') {
			workListTable.destroy();
		}
		
		workListTable = $('#workListTable').DataTable({	
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
				url : '<c:url value="po/workOrderOperFinishList"/>',
				type : 'GET',
				data : {
					'contDtlNo' : function(){return ""},
					'startDate' : function(){return startDate.replace(/-/g,'');},
					'endDate' : function(){return endDate.replace(/-/g,'');},
					'equipCd' : function(){return equipOptionVal},
					'workStatus' : function(){return workStatusOptionVal},
					
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

				{
					data : 'dtlOrdCnt',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'capInputCount',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'capOutputCount',render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray" style="color:blue;">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'dtlOrdCnt',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span style="">'+rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount']==null?"1":row['fillingCount'])).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'packInputCount',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span style="">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'packOutputCount',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span style="color:blue;">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'packFaultyCount',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray" style="color:red;">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{
					data : 'dtlOrdCnt',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray">'+rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount']==null?"1":row['fillingCount'])/parseInt(row['boxCount']==null?"1":row['boxCount'])).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{data : 'boxLoadCount',
					render : function(data,type,row,meta){
						if(data!=null){
							return '<span class="bg_Gray" style="color:blue;">'+rmDecimal(parseFloat(data).toFixed(0))+'</span>';
						}else{
							return '0';
						}
					},
					'className' : 'text-right'
				}, 
				{data : 'workStartDate',
					render : function(data,type,row,meta){
						if(data!=null){
							return data.substring(0,16);
						}else{
							return '-';
						}
					}
				}, 
				{
					data : 'workEndDate',
					render : function(data,type,row,meta){
						if(data!=null){
							return data.substring(0,16);
						}else{
							return '-';
						}
					}
				}, 
			],
			drawCallback : function() {
				$('.bg_Gray').parents('td').css('background-color','#80808026')
			},
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
		    html1 += '</div>';
		    
			$('#workListTable_length').html(html1);
			$('#workOrdDateFrom').val(serverDateTo);
			$('#workOrdDateTo').val(serverDateTo);

			selectBoxAppend(equipCdCode, "equipOption", '100005', "1"); 
			selectBoxAppend(workStatusCode, "workStatusOption", 'S', "1"); 

			$(document).on('click','#btnRetv',function(){
				startDate = $('#workOrdDateFrom').val();
				endDate = $('#workOrdDateTo').val();
				workStatusOptionVal = $('#workStatusOption option:selected').val();
				equipOptionVal = $('#equipOption option:selected').val();

				$('#workListTable').DataTable().ajax.reload();
			});

		$('#workListModal').modal('show');
	}


	//박스라벨 현황 모달창
	let workBoxListTable;
	function workBoxLabelListPopup(){
		if (workBoxListTable != null && workBoxListTable != 'undefined') {
			workBoxListTable.destroy();
		}
		
		workBoxListTable = $('#workBoxListTable').DataTable({	
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
				url : '<c:url value="po/boxLabelAdmList"/>',
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
				{data : 'workOrdNo'}, 
				{data : 'equipNm'}, 
				{data : 'itemNm'}, 
				{data : 'boxLabelNo'}, 
				{data : 'boxLabelDate',
					render : function(data,type,row,meta){
						return moment(data).format('YYYY-MM-DD');
					}
				}, 
				{data : 'boxLabelChargrNm'}, 
				{
					render : function(data,type,row,meta){
						return '<button type="button" class="btn btn-outline-success" style="font-size: 1.2rem;" id="btnBoxLabelPrint">출력</button>'
					}
				}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#workBoxListModal').modal('show');
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
					'etc1' : function(){return '002'},
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
				{
					data : 'faultyTypeQty',
					render : function(data,type,row,meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '0';
						}
						
					},
					'className':'text-right'}, 
				{
					data : 'faultyTypeDate',
					render : function(data,type,row,meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');;
						}else{
							return '-';
						}
					}
				}, 
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
					'prcNm' : function(){return "002"},
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
			$('#equipCdModal').modal('hide');
		});
		$('#equipCdModal').modal('show');
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
						workOrdNoVal = $('#workOrdNo').val();
						workOrdOperList();
						setFinishOperInfo(workOrdNoVal);

						barcodeScanFlag = true;

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
			url : '<c:url value="po/workOrderOperFinishRead" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){return workOrdNoVal;},
			},
			success : function(res){
				if(res.result=="ok"){
					//실적정보 데이터
					let data = res.data;
						$('#workOrdDate').val(data.workOrdDate!=null?moment(data.workOrdDate).format('YYYY-MM-DD'):moment(serverDate).format('YYYY-MM-DD'));
						$('#workChargrNm').val(userNm);
						$('#itemCd').val(data.itemCd);
						$('#itemNm').val(data.itemNm);
						$('#fillingWt').val(rmDecimal(data.fillingWt));
						$('#fillingCount').val(data.fillingCount+'EA');
						$('#boxCount').val(data.boxCount+'EA');

						//충진 공정
						$('#capOrdCount').text(addCommas(parseInt(data.dtlOrdCnt)));
						$('#capInputCount').text(addCommas(data.capInputCount==null?"0":data.capInputCount));
						$('#capRate').text(addCommas(((parseFloat(data.capOutputCount==null?"0":data.capOutputCount)/parseFloat(data.dtlOrdCnt))*100).toFixed(0))+"%");
						$('#capOutputCount').text(addCommas(data.capOutputCount==null?"0":data.capOutputCount));
						$('#capFaultyCount').text('-');
						$('#capOperStatus').text(data.capOperStatus==null?"가 동":data.capOperStatus);

						//가동일경우 녹색/ 비가동일경우 빨간색
						if(data.capOperStatus==null){
							$('#capOperStatus').css('color','green');
						}else{
							$('#capOperStatus').css('color','red');
						}
						
						
						//비닐포장 공정
						let fillingCountValue = data.fillingCount==null?"1":data.fillingCount;
						let packInputCountValue = data.packInputCount==null?"0":data.packInputCount;
						let packOutputCountValue = data.packOutputCount==null?"0":data.packOutputCount;
						let packOperStatusValue = data.packOperStatus==null?"가 동":data.packOperStatus;

						let ordCapQty = parseFloat(parseFloat(data.dtlOrdCnt)/parseFloat(fillingCountValue)).toFixed(0);
						let inCapQty = parseFloat(packInputCountValue);
						
						$('#packCalCount').text(addCommas(inCapQty)+"EA / "+addCommas(ordCapQty)+"EA ("+addCommas(data.fillingCount)+"EA)");
						$('#packRate').text(addCommas(((parseFloat(packOutputCountValue)/parseFloat(ordCapQty))*100).toFixed(0))+"%");
						$('#packOutputCount').text(addCommas(packOutputCountValue));
						$('#packFaultyCount').text(addCommas(data.packFaultyCount==null?"0":data.packFaultyCount));
						$('#packOperStatus').text(packOperStatusValue);

						//가동일경우 녹색/ 비가동일경우 빨간색
						if(data.packOperStatus==null){
							$('#packOperStatus').css('color','green');
						}else{
							$('#packOperStatus').css('color','red');
						}
						
						//박스포장 공정
						let boxCountValue = data.boxCount==null?"1":data.boxCount;
						let boxLoadCountValue = data.boxLoadCount==null?"0":data.boxLoadCount;
						
						let ordBoxQty = parseFloat(parseFloat(data.dtlOrdCnt)/parseFloat(fillingCountValue)/parseFloat(boxCountValue)).toFixed(0);
						let inBoxQty = parseFloat(boxLoadCountValue);
						$('#boxCalCount').text(addCommas(inBoxQty)+"Box / "+addCommas(ordBoxQty)+"Box ("+addCommas(data.boxCount)+"EA)");
						$('#boxRate').text(addCommas((parseFloat(parseFloat(boxLoadCountValue)/parseFloat(ordBoxQty))*100).toFixed(0))+"%");
						$('#boxOutputCount').text(addCommas(boxLoadCountValue));
						$('#boxFaultyCount').text('-');
						$('#boxOperStatus').text('가 동');

						//가동일경우 녹색/ 비가동일경우 빨간색
						if(data.packOperStatus==null){
							$('#boxOperStatus').css('color','green');
						}else{
							$('#boxOperStatus').css('color','red');
						}
						
						$('#capWeight').val(data.weight==null?"0":data.weight);
						$('#capSpeed').val(data.speed==null?"0":data.speed);
						
						equipDataVal = data.equipCd;
						
						let workStatusVal = '';
						let font_color ='';
						let bg_color ='';

						
						if(data.workStatus=='S'){
							workStatusVal = "가공시작"; font_color ='#ffffff'; bg_color ='#125edc';
							$('#btnWorkStart').attr('disabled',true);
							$('#btnWorkAdd').attr('disabled',false);
							$('#btnWorkEnd').attr('disabled',false);
							
						}else if(data.workStatus=='E'){
							workStatusVal = "가공종료"; font_color ='#ffffff'; bg_color ='#ee110a';
							$('#btnWorkStart').attr('disabled',true);
							$('#btnWorkAdd').attr('disabled',true);
							$('#btnWorkEnd').attr('disabled',true);
						}else{
							workStatusVal = "가공대기"; font_color ='#ffffff'; bg_color ='#ff7500';
							$('#btnWorkStart').attr('disabled',false);
							$('#btnWorkAdd').attr('disabled',true);
							$('#btnWorkEnd').attr('disabled',true);
						}
						
						$('#workStatus').val(workStatusVal);
						$('#workStatus').css('color',font_color);
						$('#workStatus').css('background-color',bg_color);

						fillingWtVal = data.fillingWt;
						processTimeVal = data.processTime;

						capUnitVal = data.fillingCount==null?"1":data.fillingCount; 
					
				}else if(res.result=="fail"){
					$('#alertModal').modal('show');
					$('#alertMessage').text(res.message);
					
				}else if(res.result=="error"){
					toastr.error(res.message);
				}
			}
		});
	}



	//실적등록 버튼 클릭시
	$('#btnWorkAdd').on('click',function(){
		if(!$.trim($('#equipCd').val())){
			toastr.warning("생산라인을 선택해주세요.");
			return false;
		}

		if(!$.trim($('#workOrdNo').val())){
			toastr.warning("작업지시번호를 스캔해주세요.");
			return false;
		}

		if(!barcodeScanFlag){
			toastr.warning("작업지시번호를 스캔을 다시 해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="mt/finishOperInfoRead" />',
			type : 'GET',
			data : {
				'workOrdNo' 		: $('#workOrdNo').val(),
			},
			success : function(res){
				let data = res.data;
				if(res.result=="ok"){
					
					if(data!=null && data.capInputCount!=null){
						$('#popupWeight').val(addCommas(data.capInputCount*parseFloat(fillingWtVal==null?'1':fillingWtVal)));   //기준정보(초)*충진실적수량     
						$('#popupSpeed').val(addCommas(data.packInputCount*parseFloat(processTimeVal==null?'1':processTimeVal)));  //기준정보(초)*비닐포장수량     

						$('#popupCapInputCount').val(addCommas(data.capInputCount==null?'0':data.capInputCount));  
						$('#popupCapOutputCount').val(addCommas(data.capOutputCount==null?'0':data.capOutputCount)); 
						//$('#popupCapFaultyCount').val(addCommas(data.capFaultyCount==null?'0':data.capFaultyCount)); 
						$('#popupPackInputCount').val(addCommas(data.packInputCount==null?'0':data.packInputCount)); 
						$('#popupPackOutputCount').val(addCommas(data.packOutputCount==null?'0':data.packOutputCount));
						$('#popupPackFaultyCount').val(addCommas(data.packFaultyCount==null?'0':data.packFaultyCount));
						$('#popupBoxLoadCount').val(addCommas(data.boxLoadCount==null?'0':data.boxLoadCount));   
						$('#popupTemperature').val(data.temperature==null?'0':data.temperature);    
						$('#popupPressure').val(data.pressure==null?'0':data.pressure);       
						$('#popupTime').val(data.time==null?'0':data.time);
						
					}else{
						$('#popupWeight').val("0");   
						$('#popupSpeed').val("0"); 

						$('#popupCapInputCount').val("0");  
						$('#popupCapOutputCount').val("0"); 
						//$('#popupCapFaultyCount').val(""); 
						$('#popupPackInputCount').val("0"); 
						$('#popupPackOutputCount').val("0");
						$('#popupPackFaultyCount').val("0");
						$('#popupBoxLoadCount').val("0");   
						$('#popupTemperature').val("0");    
						$('#popupPressure').val("0");       
						$('#popupTime').val("0");
					}
					

					console.log("fillingWtVal"+fillingWtVal)
					console.log("processTimeVal"+processTimeVal)
					
					
				}else{
					toastr.error(res.message);
				}
			}
		});

		//불량
		workOrdOperFaultyAdd();
		
		$('#workAddModal').modal('show');
	});

	
	//충진 실적수량 입력시
	$(document).on('keyup',"#popupCapInputCount", function(event){

		$('#popupCapOutputCount').val($(this).val());
	}); 

	//비닐포장 불량수량 입력시
	$(document).on('keyup',"#popupPackInputCount", function(event){

		let outputQty = parseInt($('#popupPackInputCount').val().replace(/,/g,''));

		if(isNaN(outputQty)){
			toastr.warning("실적수량을 우선 입력해주세요.");
			return false;
		}
		
		let faultyQty = parseInt($('#popupPackFaultyCount').val().replace(/,/g,''));
		if(isNaN(faultyQty)){
			faultyQty = 0;
			$('#popupPackFaultyCount').val(faultyQty);
		}
		
		$('#popupPackOutputCount').val(addCommas(outputQty-faultyQty));
	}); 

	
	


	//실적저장 버튼 클릭시
	$('#btnWorkSave').on('click',function(){

		$.ajax({
			url : '<c:url value="mt/finishOperInfoCreate" />',
			type : 'POST',
			data : {
				'workOrdNo' 		: $('#workOrdNo').val(),
				'equipCd' 			: $('#equipCd').val(),
				'weight' 			: $('#popupWeight').val(),
				'speed' 			: $('#popupSpeed').val(),
				'capInputCount' 	: $('#popupCapInputCount').val().replace(/,/g,''),
				'capOutputCount'	: $('#popupCapOutputCount').val().replace(/,/g,''),
				//'capFaultyCount' 	: $('#popupCapFaultyCount').val().replace(/,/g,''),
				'packInputCount' 	: $('#popupPackInputCount').val().replace(/,/g,''),
				'packOutputCount' 	: $('#popupPackOutputCount').val().replace(/,/g,''),
				'packFaultyCount' 	: $('#popupPackFaultyCount').val().replace(/,/g,''),
				'boxLoadCount' 		: $('#popupBoxLoadCount').val().replace(/,/g,''),
				'temperature' 		: $('#popupTemperature').val().replace(/,/g,''),
				'pressure' 			: $('#popupPressure').val().replace(/,/g,''),
				'time' 				: $('#popupTime').val().replace(/,/g,''),
				'capUnit' 			: capUnitVal
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res){
				console.log(res.result);
				if(res.result=="ok"){
					
					//불량등록 
					if(!isNaN($('#popupPackOutputCount').val().replace(/,/g,''))
							&& $('#popupPackOutputCount').val().replace(/,/g,'')!='0'){
						var dataArray = new Array();		
						var check=true;  		
						
						$('#workFaultyAddTable tbody tr').each(function(index, item){

							var rowData = new Object();
							rowData.workOrdNo = workOrdNoVal;
							rowData.faultyTypeCd = $(this).find('td input[name=faultyTypeCd]').val();
							rowData.faultyTypeQty = $(this).find('td input[name=faultyTypeQty]').val().replace(/,/g,'');
							rowData.faultyTypeDate = serverDateTo.replace(/-/g,'');
							rowData.faultyTypeDesc = '';

							dataArray.push(rowData);
					        console.log(rowData);
						});
						
						if(check){
							$.ajax({
								url : '<c:url value="po/workOrdFaultyFinishIns"/>',
								type : 'POST',
								datatype: 'json',
								data: JSON.stringify(dataArray),
								contentType : "application/json; charset=UTF-8",
								success : function(res) {		
									if (res.result == 'ok') {
										//toastr.success("실적등록 되었습니다.");
									}else {
										toastr.error(res.message);
									}

									//$('#my-spinner').hide();
								}
							});
						}

					}else{
						//$('#my-spinner').hide();
						//toastr.success("실적등록 되었습니다.");
					}

					
					//박스수량 있을경우
					if(!isNaN($('#popupBoxLoadCount').val().replace(/,/g,''))
							&& $('#popupBoxLoadCount').val().replace(/,/g,'')!='0'){
						boxLabelAdd();
					}else{
						$('#my-spinner').hide();
						toastr.success("실적등록 되었습니다.");
					}
					workOrdOperList();
				}else{
					toastr.error(res.message);
				}
				
			}
		});
	});


	//실적수집 버튼 클릭시
	$('#btnWorkGet').on('click',function(){
		$.ajax({
			url: '<c:url value="mt/packingOperInfoTodayData"/>',
            type: 'POST',
            data: {
			},
			beforeSend: function() {
				$('#my-spinner').show();
			},
			success : function(res) {
				if(res.result == 'ok') {
					let startData = res.data[0];
					let recentData = JSON.parse(res.packing);
					let RT_data = {};
					RT_data.workOrdNo = startData.workOrdNo;
					RT_data.equipNm = startData.equipNm;
					RT_data.itemNm = startData.itemNm;

					// 충진
					RT_data.fillOutputCount = parseInt(recentData.FillOutputCount) - parseInt(startData.fillOutputCount); // 충진 실적수량

					// 중량
					RT_data.wchkUnderCount = parseInt(recentData.WchkUnderCount) - parseInt(startData.wchkUnderCount); // 중량 경량개수
					RT_data.wchkOverCount = parseInt(recentData.WchkOverCount) - parseInt(startData.wchkOverCount); // 중량 과량개수
					RT_data.wchkExNgCount = parseInt(recentData.WchkExNgCount) - parseInt(startData.wchkExNgCount); // 중량 금속검출 및 이중진입개수
					RT_data.wchkNgCount = parseInt(recentData.WchkNgCount) - parseInt(startData.wchkNgCount); // 중량 NG개수

					// 캡핑
					RT_data.capOutputCount = parseInt(recentData.CapOutputCount) - parseInt(startData.capOutputCount); // 캡핑 실적수량
					RT_data.capUnit = parseInt(recentData.CapUnit); // 캡핑 포장단위
					
					// 로봇
					RT_data.boxOutputCount = parseInt(recentData.ArticulRobotOutputCount) - parseInt(startData.articulRobotOutputCount); // 로봇 적재 실적수량

					
					// 충진
					let fillOutputCount = RT_data.fillOutputCount;
					let fillFaultyCount = 0;
					let fillFairCount = fillOutputCount - fillFaultyCount;
					let fillOperStatus = recentData.FillOperStatus;

					$('#popupCapInputCount').val(addCommas(Math.abs(fillOutputCount))); // 충진 실적수량
					
					

					

					// 캡핑
					let capOutputCount = RT_data.capOutputCount;
					let capFaultyCount = RT_data.wchkExNgCount + RT_data.wchkNgCount;
					let capFairCount = capOutputCount - capFaultyCount;
					let capOperStatus = recentData.CapOperStatus;
					
					let wchkUnderCount = RT_data.wchkUnderCount;
					let wchkOverCount = RT_data.wchkOverCount;
					let wchkExNgCount = RT_data.wchkExNgCount;

					$('#popupPackInputCount').val(addCommas(Math.abs(capOutputCount))); // 비닐포장 실적수량
					$('#popupPackOutputCount').val(addCommas(Math.abs(capFairCount))); // 비닐포장 양품수량
					$('#popupPackFaultyCount').val(addCommas(Math.abs(capFaultyCount))); // 비닐포장 불량수량
					$('input[name=faultyTypeQty]').eq(0).val(addCommas(Math.abs(wchkOverCount))); // 중량검사 과량수량
					$('input[name=faultyTypeQty]').eq(1).val(addCommas(Math.abs(wchkUnderCount))); // 중량검사 경량수량
					$('input[name=faultyTypeQty]').eq(2).val(addCommas(Math.abs(wchkExNgCount))); // 중량검사 금속검출 및 이중진입수량


					
					// 박스
					let boxOutputCount = RT_data.boxOutputCount;
					let boxFaultyCount = 0;
					let boxFairCount = boxOutputCount - boxFaultyCount;
					let boxOperStatus = recentData.BoxMoldOperStatus;

					capUnitVal = parseInt(recentData.CapUnit); //캡핑 수량
					
					$('#popupBoxLoadCount').val(addCommas(Math.abs(boxOutputCount))); // 박스 실적수량
					
					$('#my-spinner').hide();
					toastr.success('수집 완료');
				} else {
					toastr.error(res.message);
				}
			}
		});
	});
	

	let workFaultyAddTable;
	
	//불량등록 팝업창
	function workOrdOperFaultyAdd(){
		console.log('불량등록 팝업창!')
		
		if (workFaultyAddTable != null && workFaultyAddTable != 'undefined') {
			workFaultyAddTable.destroy();
		}
		workFaultyAddTable = $('#workFaultyAddTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
					+ "<'row'<'col-sm-12 p-0'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			scrollY : '45vh',
			pageLength : -1,
			ajax : {
				url : '<c:url value="po/workOrderFaultyList"/>',
				type : 'GET',
				data : {
					'workOrdNo' : function(){return workOrdNoVal},
					'etc1' : function(){return "002"},
				},
			},
			columns : [ 
				{
					data : 'faultyTypeNm',
					render : function(data, type, row, meta){
						var html="";
						html += '<input type="hidden" class="form-control" name="faultyTypeCd" value="'+row['faultyTypeCd']+'" disabled/>'
						html += '<input type="text" class="form-control" name="faultyTypeNm" value="'+data+'" style="font-size: 1.0rem;min-width: 100%;height: 100%;"  disabled/>'
						return html;
					}
				}, 
				{
					data : 'faultyTypeQty',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="text" class="form-control faultyTypeQty" name="faultyTypeQty" value="'+addCommas(data)+'" style="background-color: #00ffbd38;font-size: 1.0rem;min-width: 100%;height: 100%;" />'
						}else{
							return '<input type="text" class="form-control faultyTypeQty" name="faultyTypeQty" value="'+0+'" style="background-color: #00ffbd38;font-size: 1.0rem;min-width: 100%;height: 100%;" />'
						}
					}
				}, 
			],
			columnDefs : [ 
				{"defaultContent" : "-","targets" : "_all","className" : "text-center"} 
			],
			drawCallback: function() {
		    	// 불량수량 입력 keyup
				$('.faultyTypeQty').off('keyup');
				$('.faultyTypeQty').on('keyup', function() {
					let faultyTypeQtySum = 0;
					for ( var i=0; i < $('.faultyTypeQty').length; i++ ) {
						faultyTypeQtySum += parseFloat($('.faultyTypeQty').eq(i).val().trim() == '' ? 0 : $('.faultyTypeQty').eq(i).val().replaceAll(/,/g,''));
					}
					console.log($(this).val());
					$(this).val(rmDecimal($(this).val()))
					$('#popupPackFaultyCount').val(rmDecimal(faultyTypeQtySum));

					let outputQty = parseInt($('#popupPackOutputCount').val().replace(/,/g,''));
					$('#popupPackInputCount').val(rmDecimal(outputQty+faultyTypeQtySum));
				});

				
				
			},
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		setTimeout(function(){
			workFaultyAddTable.draw();
		},200)
	}


	function boxLabelAdd(){
		$.ajax({
			url : '<c:url value="po/boxLabelAdmIns" />',
			type : 'POST',
			data : {
				'workOrdNo' : workOrdNoVal,
				'equipCd' : $('#equipCd').val(),
				'packOutputCount' : $('#popupPackOutputCount').val().replace(/,/g,''),
				'boxLoadCount' : $('#popupBoxLoadCount').val().replace(/,/g,'')
			},
			beforeSend : function(){
			},
			success : function(res){
				$('#my-spinner').hide();
				toastr.success("실적등록 되었습니다.");
			}
	
		})
	}


	//가동시작 버튼 클릭시
	$('#btnWorkStart').on('click',function(){

		if(!$.trim($('#equipCd').val())){
			toastr.warning("생산라인을 선택해주세요.");
			return false;
		}

		if(!$.trim($('#workOrdNo').val())){
			toastr.warning("작업지시번호를 스캔해주세요.");
			return false;
		}

		if(!barcodeScanFlag){
			toastr.warning("작업지시번호를 스캔을 다시 해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="po/workOrderAdmFinishUpd" />',
			type : 'POST',
			data : {
				'workOrdNo' 		: $('#workOrdNo').val(),
				'equipCd' 			: $('#equipCd').val(),
				'workStatus' 		: "S",
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("가공시작 되었습니다.");
					workOrdOperList();
					$('#btnWorkStart').attr('disabled',true);
					$('#btnWorkAdd').attr('disabled',false);
					$('#btnWorkEnd').attr('disabled',false);
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	});


	//가동종료 버튼 클릭시
	$('#btnWorkEnd').on('click',function(){

		if(!$.trim($('#equipCd').val())){
			toastr.warning("생산라인을 선택해주세요.");
			return false;
		}

		if(!$.trim($('#workOrdNo').val())){
			toastr.warning("작업지시번호를 스캔해주세요.");
			return false;
		}

		if(!barcodeScanFlag){
			toastr.warning("작업지시번호를 스캔을 다시 해주세요.");
			return false;
		}

		if(workEndStatus==false && $('#capRate').text()!="100%"){
			$('#alertMessage2').text('미생산량이 있습니다. 그래도 가동종료 하시겠습니까?');
			$('#alertModal2').modal('show');
			return false;
		}else{
			workEndStatus = true;
		}

		if(workEndStatus){
			$.ajax({
				url : '<c:url value="po/workOrderAdmFinishUpd" />',
				type : 'POST',
				data : {
					'workOrdNo' 		: $('#workOrdNo').val(),
					'equipCd' 			: $('#equipCd').val(),
					'workStatus' 		: "E",
					'outputQty' 		: $('#capInputCount').val(),
					'fairQty' 			: $('#capOutputCount').val(),
					'faultyQty' 		: $('#packFaultyCount').val(),
				},
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res){
					if(res.result=="ok"){
						toastr.success("가공종료 되었습니다.");
						$('#btnWorkStart').attr('disabled',true);
						$('#btnWorkAdd').attr('disabled',true);
						$('#btnWorkEnd').attr('disabled',true);
						workOrdOperList();
					}else{
						//toastr.error(res.message);
					}

					$('#my-spinner').hide();
				}
			});
		}
	});

	$('#btnWorkEndY').on('click',function(){
		console.log('팝업 가동종료 버튼 클릭')
		workEndStatus= true;
		$('#btnWorkEnd').trigger('click');
		$('#alertModal2').modal('hide');
	});
	
	

	//입고수량 숫자만 입력하게 처리
	$(document).on('keyup',".popupData", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || 
				(event.which >= 37 && event.which <= 40) 
				|| event.which == 8 
				|| event.which == 9 
				|| event.which == 13 
				|| event.which == 16 
				|| event.which == 46)
			){
				$('.number-float0').on("blur keyup", function() {
					$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
				}); 
				toastr.warning('숫자만 입력해주세요.');
				$(this).val("");
				$(this).select();
				event.preventDefault();
				return false;
		}
		
		$(this).val(addCommas(uncomma($(this).val())));
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
			toastr.warning("생산라인을 선택해주세요.");
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

	//온도/압력/시간 그래프현환********************************************************************************
	let finishTempData;			// 후가공 온도 데이터
	let finishPressData;		// 후가공 압력 데이터
	let finishTimeData;			// 레이저 시간 데이터

	let finishTempDataArr = new Array();    // 후가공 온도 데이터 배열 
	let finishPressDataArr = new Array();   // 후가공 압력 데이터 배열 
	let finishTimeDataArr = new Array();	// 후가공 시간 데이터 배열 
	let finishLabelArr = new Array();		// 후가골 라벨 배열
	
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

	function setFinishOperInfo(activeWorkOrdNo) {
	  	let stageCount = 0;
	  	let tempPressTimeVal;
	
	  	$.ajax({
			url: '<c:url value="mt/finishOperInfoDtlList"/>',
            type: 'POST',
            async: false,
            data: {
				'workOrdNo' : function() {return activeWorkOrdNo;},
			},
			success : function(res) {
				tempPressTimeVal = res.data;
				stageCount = tempPressTimeVal.length;
			}
		});
		
		finishTempDataArr = new Array(stageCount).fill(null);
		finishPressDataArr = new Array(stageCount).fill(null);
		finishTimeDataArr = new Array(stageCount).fill(null);
		finishLabelArr = new Array(stageCount).fill(null);
		
		$.each(tempPressTimeVal, function(index, item) {
			finishTempDataArr[index] = (item.temperature == undefined) ? null : item.temperature;
			finishPressDataArr[index] = (item.pressure == undefined) ? null : item.pressure;
			finishTimeDataArr[index] = (item.time == undefined) ? null : item.time;
			finishLabelArr[index] = '';
		})
		
		//차트 초기화
		$('#finishTimeStatusText').addClass("");
		$('#finishTempStatus').remove();
		$('#finishTempStatusDiv').append('<canvas id="finishTempStatus"><canvas>');
		$('#finishPressStatusText').addClass("d-none");
		$('#finishPressStatus').remove();
	 	$('#finishPressStatusDiv').append('<canvas id="finishPressStatus"><canvas>');
		$('#finishTempStatusText').addClass("d-none");
		$('#finishTimeStatus').remove();
	 	$('#finishTimeStatusDiv').append('<canvas id="finishTimeStatus"><canvas>');
	
	 	makeFinishTempStatus(finishLabelArr, finishTempDataArr);
	 	makeFinishPressStatus(finishLabelArr, finishPressDataArr);
	 	makeFinishTimeStatus(finishLabelArr, finishTimeDataArr);
	}

	// 후가공 설비(온도)
	function makeFinishTempStatus() { 
		finishTempStatus = new Chart(
			document.getElementById('finishTempStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(5, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#ff3f3f',
						borderColor: '#f24055',
						data: finishTempDataArr,
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

	// 후가공 설비(압력)
	function makeFinishPressStatus() { 
		finishPressStatus = new Chart(
			document.getElementById('finishPressStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(5, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#2196f3',
						borderColor: '#2196f3',
						data: finishPressDataArr,
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
							        borderColor: '#2196f3',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[2].max,
							        yMax: rangeArr[2].max,
							        borderColor: '#2196f3',
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

	// 후가공 설비(시간)
	function makeFinishTimeStatus() { 
		finishTimeStatus = new Chart(
			document.getElementById('finishTimeStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(5, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#8bc34a',
						borderColor: '#8bc34a',
						data: finishTimeDataArr,
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
							        borderColor: '#8bc34a',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[2].max,
							        yMax: rangeArr[2].max,
							        borderColor: '#8bc34a',
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
	

	//온도/압력/시간 그래프현환********************************************************************************

	

</script>

</body>
</html>