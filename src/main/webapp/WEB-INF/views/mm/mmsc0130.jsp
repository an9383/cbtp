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
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">생산일보관리(전체)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
			<div class="open-arrow" id="arrowLeft">
				<button id="left-width-btn2" onclick="openrNav2()"
					class="btn btn-primary input-sub-search" type="button">
					<i class="mdi mdi-arrow-left"></i>
				</button>
			</div>
			<!-- 날짜 -->
			<div class="row mr-0">
				&nbsp;<div class="form-group input-sub m-0 row">
					<input class="form-control" style="width:97px;" type="text" id="prodDateTo" name="prodDateTo" disabled/>
					<button onclick="fnPopUpCalendar(prodDateTo,prodDateTo,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="prodDateToCalendar" type="button">
					<span class="oi oi-calendar"></span>
					</button>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>
				</div>
			</div>
			<!-- 날짜 -->
			<br>
			<div class="card-header card-tab">
				<!-- .nav-tabs tablist -->
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link active show"
						id="tab1Nav" data-toggle="tab" href="#tab1, #tab3">인원현황</a></li>
					<li class="nav-item"><a class="nav-link" id="tab2Nav"
						data-toggle="tab" href="#tab2">공수생산성</a></li>
				</ul>
				<!-- /.nav-tabs -->
			</div>
			<br>
			<div class="card">
				<div id="table1">
					<div class="table-responsive">
						<label style="font-size: 15px;">인원현황</label>
								<table id="personnelTable" class="table table-bordered mt-1" style="margin-bottom: 56px;">
									<colgroup>
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th></th>
											<th>소형</th>
											<th>중형</th>
											<th>지각/외출</th>
											<th>조퇴</th>
											<th>휴가 및 훈련</th>
											<th colspan='2'>비고</th>
										</tr>
										<tr>
											<th>직접인원</th>
											<td><span id="totalUser"></span></td>
											<td><span id="totalUser2"></span></td>
											<td><span id="mhValue1"></span></td>
											<td><span id="mhValue2"></span></td>
											<td><span id="mhValue3"></span></td>
											<td colspan='2'><span id=""></span></td>
										</tr>
										<tr>
											<th>간접인원</th>
											<td><span id="indirectTotalUser"></span></td>
											<td><span id="indirectTotalUser2"></span></td>
											<td><span id="indirectMhValue1"></span></td>
											<td><span id="indirectMhValue2"></span></td>
											<td><span id="indirectMhValue3"></span></td>
											<td colspan='2'><span id=""></span></td>
										</tr>
										<tr>
											<th>용역인원</th>
											<td><span id="serviceTotalUser"></span></td>
											<td><span id="serviceTotalUser2"></span></td>
											<td><span id="serviceMhValue1"></span></td>
											<td><span id="serviceMhValue2"></span></td>
											<td><span id="serviceMhValue3"></span></td>
											<td colspan='2'><span id=""></span></td>
										</tr>
										<tr>
											<th>계</th>
											<td><span id="smallSum"></span></td>
											<td><span id="mediumSum"></span></td>
											<td><span id="tardySum"></span></td>
											<td><span id="earlySum"></span></td>
											<td><span id="vacationSum"></span></td>
											<th>총원 : </th>
											<td><span id="nowUser"></span></td>
										</tr>
									</thead>
								</table>
								<div class="table-responsive">
									<label style="font-size: 15px;">팀별 공수가동현황</label>
									<table id="" class="table table-bordered mt-1">
										<colgroup>
											<col width="17%">
											<col width="2%">
											<col width="13%">
											<col width="13%">
											<col width="10%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>항목</th>
												<th>단위</th>
												<th>소형</th>
												<th>중형</th>
												<th>계</th>
											</tr>
											<tr >
												<td>재적공수((480분-휴식시간)*보유인원)</td>
												<td>(분)</td>
												<td><span id="mhValueS1"></span></td>
												<td><span id="mhValueM1"></span></td>
												<td><span id="mhSum1"></span></td>
											</tr>
											<tr >
												<td>취업공수(재적공수-휴업공수)</td>
												<td>(분)</td>
												<td><span id="mhValueS2"></span></td>
												<td><span id="mhValueM2"></span></td>
												<td><span id="mhSum2"></span></td>
											</tr>
											<tr >
												<td>작업공수(취업공수+추가공수)</td>
												<td>(분)</td>
												<td><span id="mhValueS3"></span></td>
												<td><span id="mhValueM3"></span></td>
												<td><span id="mhSum3"></span></td>
											</tr>
											<tr >
												<td>추가공수(잔업, 타부서지원받음, 간접인원지원)</td>
												<td>(분)</td>
												<td><span id="mhValueS4"></span></td>
												<td><span id="mhValueM4"></span></td>
												<td><span id="mhSum4"></span></td>
											</tr>
											<tr >
												<td>휴업공수(휴가, 조퇴, 외부교육, 출장, 타부서지원)</td>
												<td>(분)</td>
												<td><span id="mhValueS5"></span></td>
												<td><span id="mhValueM5"></span></td>
												<td><span id="mhSum5"></span></td>
											</tr>
											<tr >
												<td>유실공수(무작업시간)</td>
												<td>(분)</td>
												<td><span id="mhValueS6"></span></td>
												<td><span id="mhValueM6"></span></td>
												<td><span id="mhSum6"></span></td>
											</tr>
											<tr >
												<td>실동공수(작업공수-유실공수)</td>
												<td>(분)</td>
												<td><span id="mhValueS7"></span></td>
												<td><span id="mhValueM7"></span></td>
												<td><span id="mhSum7"></span></td>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<!-- 공수생산성 테이블 시작 -->
						<div id="table2" style="margin-bottom: 15px;"class="d-none">
							<div class="table-responsive">
								<label style="font-size: 15px;">공수생산성</label>
								<table id="" class="table table-bordered mt-1" style="margin-bottom: 30px;">
									<colgroup>
										<col width="25%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th rowspan="2" style="vertical-align: middle;">항목</th>
											<th colspan="2">소형</th>
											<th colspan="2">중형</th>
											<th rowspan="2"><label style="padding-bottom:12px;">비고</label></th>
										</tr>
										<tr>
											<th>당일</th>
											<th>전년 평균</th>
											<th>당일</th>
											<th>전년평균</th>
										</tr>
										<tr>
											<td>인원가동율<br>(라인 및 공정의 가동상태)</td>
											<td><span id="mhValueS9"></span></td>
											<td><span id="mhAvgS1"></span></td>
											<td><span id="mhValueM9"></span></td>
											<td><span id="mhAvgM1"></span></td>
											<td>실동공수/작업공수</td>
										</tr>
										<tr>
											<td>작업능률<br>(제품별생산성, 작업자 숙련, 노력, 관리정도지표)</td>
											<td><span id="mhValueS10"></span></td>
											<td><span id="mhAvgS2"></span></td>
											<td><span id="mhValueM10"></span></td>
											<td><span id="mhAvgM2"></span></td>
											<td>실동공수/작업공수</td>
										</tr>
										<tr>
											<td>종합능률<br>(전체의 종합적 능률지표)</td>
											<td><span id="mhValueS11"></span></td>
											<td><span id="mhAvgS3"></span></td>
											<td><span id="mhValueM11"></span></td>
											<td><span id="mhAvgM3"></span></td>
											<td>실동공수/작업공수</td>
										</tr>
									</thead>
								</table>
								<div class="table-responsive">
									<label style="font-size: 15px;">생산량/불량율</label>
									<table id="" class="table table-bordered mt-1" style="margin-bottom: 70px;">
										<thead class="thead-light">
											<tr>
												<th></th>
												<th>일일생산량</th>
												<th>월 누적생산량</th>
												<th>일일 공정작업수</th>
												<th>불량수량</th>
												<th>불량율(PPM)</th>
												<th>월 누적 불량율(PPM)</th>
												<th>불량목표</th>
												<th>전월불량율(PPM)</th>
											</tr>
											<tr>
												<th>소형</th>
												<td><span id="sumQty1"></span></td>
												<td><span id="monCumProdQty"></span></td>
												<td><span id="dayProcWorkQty"></span></td>
												<td><span id="dayFaultyQty"></span></td>
												<td><span id="faultyRate"></span></td>
												<td>·</td>
												<td>·</td>
												<td>·</td>
											</tr>
											<tr>
												<th>중형</th >
												<td><span id="sumQty2"></span></td>
												<td><span id="monCumProdQty2"></span></td>
												<td><span id="dayProcWorkQty2"></span></td>
												<td><span id="dayFaultyQty2"></span></td>
												<td><span id="faultyRate2"></span></td>
												<td>·</td>
												<td>·</td>
												<td>·</td>
											</tr>
										</thead>
									</table>
								</div>
								<hr>
								<label style="font-size: 15px;margin-right: 44.5%;">주요 업무 및 이슈</label>
								<label style="font-size: 15px;">Servo Motor 생산 잔량</label>
								<div class="row" style="margin-left:40%">
									<button type="button" class="btn btn-primary float-right mr-1"
										id="btnAdd">등록</button>
									<button class="btn btn-warning d-none" id="btnAddConfirmLoading"
										type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-primary float-right mr-1"
										id="btnEdit">수정</button>
									<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
										type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-primary float-right d-none"
										id="btnSave">저장</button>
									<button class="btn btn-warning d-none" id="btnSaveConfirmLoading"
										type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
								</div>
								<div class="row">
									<textarea id="issueContents" class="mt-1" disabled style="height: 120px; width: 50%; resize: none;margin-right: 1%; 
										border: 1px solid #dee2e6; border-radius: 10px; font-size: 12px;" ></textarea>
		<!-- 						<div class="table-responsive"> -->
									<table id="" class="table table-bordered mt-1" style="width: 49%;">
										<colgroup>
											<col width="5%">
											<col width="15%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th></th>
												<th>SerVo</th>
											</tr>
											<tr>
												<td>소형</td>
												<td><span id="smallServoMotor"></span></td>
											</tr>
											<tr>
												<td>중형</td>
												<td><span id="mediumServoMotor"></span></td>
											</tr>
											<tr>
												<td>계</td>
												<td><span id="totalServoMotor"></span></td>
											</tr>
										</thead>
									</table>
<!-- 								</div> -->
									
								</div>
							</div>
						</div>
				<!-- 공정현황 테이블 끝 -->
					</div>
				</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
<!-- 			<div class="right-list right-sidebar right-sidebar-fix" id="rfSidenav" style="width: 30%;"> -->
<!-- 				<div class="card-body col-sm-12"> -->
			
<!-- 				</div> -->
<!-- 				/오른쪽 인원현황 등록 부분 상단 버튼 영역 -->
<!-- 				<div id="form1"> -->
<!-- 					<form id="formOut"> -->
<!-- 						<div class="table-responsive"> -->
						
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 				/오른쪽 공정현황 등록 부분 상단 버튼 영역 -->
<!-- 				<div id="form2" class="d-none"> -->
<!-- 					<form id="formIn"> -->
<!-- 						<div class="table-responsive"> -->
						
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>

// $("#left-width-btn2").click(function() {
// 	{
// 		$("#left-list").animate({
// 			width : "100%"
// 		}, 200);
// 		$("#arrow-left").animate({
// 			display : "none"
// 		}, 200);
// 	}
// 	state = !state;
// });

	let currentHref = "mmsc0130";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산일보관리(전체)"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var prodDate =  "${serverDateTo}";
	var issueDate=null;

	var nowUse;
	var indirectNowUse;
	var serviceNowUse;
	var totalPersonnel;
	var totalSmallServoMotor;

	$("#prodDateTo").val(prodDate);
	
	$('#saveBtnModalY').on('click', function() {
		$('#formIn').each(function() {
			this.reset();
		});

		$('#formOut').each(function() {
			this.reset();
		});
		
		uiProc(true);
		uiProc2(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
	});
	

	//인원현황 탭 클릭시
	$('#tab1Nav').on('click',function(){
		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');

	});

	//공정현황 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');

	});

	//dom 생성시 실행
	$(document).ready(function(){
		prodGubun = $('#searchOption :selected').val();
		prodDate = $('#prodDateTo').val();
		personStatEvent();
		prodUtilEvent();
		prodFaultyRateList();
		mainIssueList();
		smallServoMotor();

		$('#btnRetv').on('click',function(){
			prodGubun = $('#searchOption :selected').val();
			prodDate = $('#prodDateTo').val();
			personStatEvent();
			prodUtilEvent();
			prodFaultyRateList();
			mainIssueList();
			smallServoMotor();
		})
	});


	//***************************************인원현황 탭******************************
	//인원현황 목록조회
	
	//직접인원
	function personStatEvent(){ 
		$.ajax({
			url: '<c:url value="mm/personStatListAll"/>',
		    type : 'GET',
		    data : {
			    'personalGubun'	:	'001',
			    'prodDate' 		: function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				var data = res.data;
				$('#totalUser').text(data.totalUser);
				$('#totalUser2').text(data.totalUser2);
// 				$('#nowUser').text(data.nowUser);
				nowUse = data.nowUser;
				$('#mhValue1').text(data.mhValue1);
				$('#mhValue2').text(data.mhValue2);
				$('#mhValue3').text(data.mhValue3);
				personStatEvent2();
		    }
		});
	}

	//간접인원
	function personStatEvent2(){ 
		$.ajax({
			url: '<c:url value="mm/personStatListAll"/>',
		    type : 'GET',
		    data : {
			    'personalGubun'	:	'002',
			    'prodDate' 		: function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				var data = res.data;
				$('#indirectTotalUser').text(data.totalUser);
				$('#indirectTotalUser2').text(data.totalUser2);
				indirectNowUse = data.nowUser;
				$('#indirectMhValue1').text(data.mhValue1);
				$('#indirectMhValue2').text(data.mhValue2);
				$('#indirectMhValue3').text(data.mhValue3);
				personStatEvent3();
		    }
		});
	}

	//용역인원
	function personStatEvent3(){
		$.ajax({
			url: '<c:url value="mm/personStatListAll"/>',
		    type : 'GET',
		    data : {
			    'personalGubun'	:	'003',
			    'prodDate' 		: function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				var data = res.data;
				$('#serviceTotalUser').text(data.totalUser);
				$('#serviceTotalUser2').text(data.totalUser2);
				serviceNowUse = data.nowUser;
				$('#serviceMhValue1').text(data.mhValue1);
				$('#serviceMhValue2').text(data.mhValue2);
				$('#serviceMhValue3').text(data.mhValue3);
				var findNum=0;
				var totalNum=0;
				//소형
				for(var i=1; i<=3; i++){
					if($('#personnelTable thead tr').eq(i).find('td').eq(0)){
						console.log('소형 값');
						findNum = parseInt($('#personnelTable thead tr').eq(i).find('td').eq(0).text());
						totalNum = totalNum + findNum; 
						$('#smallSum').text(totalNum);
					}
					i==3?sumA():'';
				}
				//중형
				function sumA(){
					findNum=0;
					totalNum=0;
					for(var i=1; i<=3; i++){
						//소형
						if($('#personnelTable thead tr').eq(i).find('td').eq(1)){
							findNum = parseInt($('#personnelTable thead tr').eq(i).find('td').eq(1).text());
							totalNum = totalNum + findNum; 
							$('#mediumSum').text(totalNum);
						}
						i==3?sumB():'';
					}
				}
				//지각/외출
				function sumB(){
					findNum=0;
					totalNum=0;
					for(var i=1; i<=3; i++){
						//소형
						if($('#personnelTable thead tr').eq(i).find('td').eq(2)){
							findNum = parseInt($('#personnelTable thead tr').eq(i).find('td').eq(2).text());
							totalNum = totalNum + findNum; 
							$('#tardySum').text(totalNum);
						}
						i==3?sumC():'';
					}
				}
				//조퇴
				function sumC(){
					findNum=0;
					totalNum=0;
					for(var i=1; i<=3; i++){
						//소형
						if($('#personnelTable thead tr').eq(i).find('td').eq(3)){
							findNum = parseInt($('#personnelTable thead tr').eq(i).find('td').eq(3).text());
							totalNum = totalNum + findNum; 
							$('#earlySum').text(totalNum);
						}
						i==3?sumD():'';
					}
				}
				//휴가
				function sumD(){
					findNum=0;
					totalNum=0;
					for(var i=1; i<=3; i++){
						//소형
						if($('#personnelTable thead tr').eq(i).find('td').eq(4)){
							findNum = parseInt($('#personnelTable thead tr').eq(i).find('td').eq(4).text());
							totalNum = totalNum + findNum; 
							$('#vacationSum').text(totalNum);
						}
					}
				}
				totalPersonnel = parseInt(nowUse) + parseInt(indirectNowUse) + parseInt(serviceNowUse);
				$('#nowUser').text(totalPersonnel);
		    }
		});
	}

	//팀별 공수가동현황 목록조회
	function prodUtilEvent(){
		$.ajax({
			url: '<c:url value="mm/prodUtilListAll"/>',
		    type : 'GET',
		    data : {
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
				//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
		    },
		    success : function(res){
				let data = res.data;
				let data2 = res.data2;
				let data3 = res.data3;
				let data4 = res.data4;
				console.log(data);
				console.log(data2);
				console.log(data3);
				console.log(data4);
				console.log(data3.mhValue11);
				
				$('#mhValueS1').text(data.mhValue1==null?'·':data.mhValue1);
				$('#mhValueS2').text(data.mhValue2==null?'·':data.mhValue2);
				$('#mhValueS3').text(data.mhValue3==null?'·':data.mhValue3);
				$('#mhValueS4').text(data.mhValue4==null?'·':data.mhValue4);
				$('#mhValueS5').text(data.mhValue5==null?'·':data.mhValue5);
				$('#mhValueS6').text(data.mhValue6==null?'·':data.mhValue6);
				$('#mhValueS7').text(data.mhValue7==null?'·':data.mhValue7);
				$('#mhValueS8').text(data.mhValue8==null?'·':data.mhValue8);
				$('#mhValueS9').text(data.mhValue9==null?'·':data.mhValue9.substring(0,5)+"%");
				$('#mhValueS10').text(data.mhValue10==null?'·':data.mhValue10.substring(0,5)+"%");
				$('#mhValueS11').text(data.mhValue11==null?'·':data.mhValue11.substring(0,5)+"%");
				$('#mhValueS12').text(data.mhValue12==null?'·':data.mhValue12.substring(0,5)); 

				$('#mhValueM1').text(data2.mhValue1==null?'·':data2.mhValue1);
				$('#mhValueM2').text(data2.mhValue2==null?'·':data2.mhValue2);
				$('#mhValueM3').text(data2.mhValue3==null?'·':data2.mhValue3);
				$('#mhValueM4').text(data2.mhValue4==null?'·':data2.mhValue4);
				$('#mhValueM5').text(data2.mhValue5==null?'·':data2.mhValue5);
				$('#mhValueM6').text(data2.mhValue6==null?'·':data2.mhValue6);
				$('#mhValueM7').text(data2.mhValue7==null?'·':data2.mhValue7);
				$('#mhValueM8').text(data2.mhValue8==null?'·':data2.mhValue8);
				$('#mhValueM9').text(data2.mhValue9==null?'·':data2.mhValue9.substring(0,5)+"%");
				$('#mhValueM10').text(data2.mhValue10==null?'·':data2.mhValue10.substring(0,5)+"%");
				$('#mhValueM11').text(data2.mhValue11==null?'·':data2.mhValue11.substring(0,5)+"%");
				$('#mhValueM12').text(data2.mhValue12==null?'·':data2.mhValue12.substring(0,5)); 


				$('#mhSum1').text(parseInt(data.mhValue1==null?0:data.mhValue1) + parseInt(data2.mhValue1==null?0:data2.mhValue1));
				$('#mhSum2').text(parseInt(data.mhValue2==null?0:data.mhValue2) + parseInt(data2.mhValue2==null?0:data2.mhValue2));
				$('#mhSum3').text(parseInt(data.mhValue3==null?0:data.mhValue3) + parseInt(data2.mhValue3==null?0:data2.mhValue3));
				$('#mhSum4').text(parseInt(data.mhValue4==null?0:data.mhValue4) + parseInt(data2.mhValue4==null?0:data2.mhValue4));
				$('#mhSum5').text(parseInt(data.mhValue5==null?0:data.mhValue5) + parseInt(data2.mhValue5==null?0:data2.mhValue5));
				$('#mhSum6').text(parseInt(data.mhValue6==null?0:data.mhValue6) + parseInt(data2.mhValue6==null?0:data2.mhValue6));
				$('#mhSum7').text(parseInt(data.mhValue7==null?0:data.mhValue7) + parseInt(data2.mhValue7==null?0:data2.mhValue7));
				$('#mhSum8').text(parseInt(data.mhValue8==null?0:data.mhValue8) + parseInt(data2.mhValue8==null?0:data2.mhValue8));
				$('#mhSum9').text(parseInt(data.mhValue9==null?0:data.mhValue9) + parseInt(data2.mhValue9==null?0:data2.mhValue9));
				$('#mhSum10').text(parseInt(data.mhValue10==null?0:data.mhValue10) + parseInt(data2.mhValue10==null?0:data2.mhValue10));
				$('#mhSum11').text(parseInt(data.mhValue11==null?0:data.mhValue11) + parseInt(data2.mhValue11==null?0:data2.mhValue11));
				$('#mhSum12').text(parseInt(data.mhValue12==null?0:data.mhValue12) + parseInt(data2.mhValue12==null?0:data2.mhValue12));

				$('#mhAvgS1').text(data3.mhValue9==null?'·':data3.mhValue9.substring(0,6)+"%");
				$('#mhAvgS2').text(data3.mhValue10==null?'·':data3.mhValue10.substring(0,6)+"%");
				$('#mhAvgS3').text(data3.mhValue11==null?'·':data3.mhValue11.substring(0,6)+"%");

				$('#mhAvgM1').text(data4.mhValue9==null?'·':data4.mhValue9.substring(0,6)+"%"); 
				$('#mhAvgM2').text(data4.mhValue10==null?'·':data4.mhValue10.substring(0,6)+"%"); 
				$('#mhAvgM3').text(data4.mhValue11==null?'·':data4.mhValue11.substring(0,6)+"%"); 
		    }
		});
	}


	//***************************************공수생산성 탭******************************
	//생산 불량율 목록조회
	function prodFaultyRateList(){
		$.ajax({
			url: '<c:url value="mm/prodFaultyRateList"/>',
		    type : 'GET',
		    data : {
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				$('#sumQty1').text(res.sumQty1);
				$('#sumQty2').text(res.sumQty2);
				
				$('#monCumProdQty').text(res.monCumProdQty);
				$('#monCumProdQty2').text(res.monCumProdQty2);

				$('#dayProcWorkQty').text(res.dayProcWorkQty);
				$('#dayProcWorkQty2').text(res.dayProcWorkQty2);

				$('#dayFaultyQty').text(res.dayFaultyQty);
				$('#dayFaultyQty2').text(res.dayFaultyQty2);

				$('#faultyRate').text(res.faultyRate);
				$('#faultyRate2').text(res.faultyRate2);
		    }
		});
	}

	function mainIssueList(){
		$.ajax({
			url : '<c:url value="mm/mainIssueAdmList" />',
			type : 'GET',
			data : {
					'issueDate' : function(){return prodDate.replace(/-/g,'')}
			},
			success : function(res){
				let data = res.data;

				if(data.issueDate==null || data.issueDate==""){
					$('#btnAdd').attr('disabled',false);
					$('#btnEdit').attr('disabled',true);
				}else{
					$('#btnAdd').attr('disabled',true);
					$('#btnEdit').attr('disabled',false);
				}
				
				issueDate = data.issueDate;
				$('#issueContents').val(data.issueContents);
			}
	
		});
	}

	//Servo Motor조회(소형)
	function smallServoMotor(){
		$.ajax({
			url : '<c:url value="mm/mainIssueAdmServoMotor"/>',
			type : 'GET',
			data : {
					'itemGubun' : '001'
			},
			success : function(res){
				let data = res.data;
				$('#smallServoMotor').text(data.doNo);
				totalSmallServoMotor = data.doNo;
				mediumServoMotor();
			}
		});
	}

	//Servo Motor조회(중형)
	function mediumServoMotor(){
		$.ajax({
			url : '<c:url value="mm/mainIssueAdmServoMotor"/>',
			type : 'GET',
			data : {
					'itemGubun' : '002'
			},
			success : function(res){
				let data = res.data;
				$('#mediumServoMotor').text(data.doNo);
				var totalNum = parseInt(totalSmallServoMotor) + parseInt(data.doNo);
				$('#totalServoMotor').text(totalNum);
			}
		});
	}
	
	//등록 버튼 click
	$('#btnAdd').on('click',function(){

		$('#issueContents').attr('disabled',false);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').removeClass('d-none');

		sideView = 'add';
	});


	//수정 버튼 click
	$('#btnEdit').on('click',function(){

		$('#issueContents').attr('disabled',false);
		$('#btnAdd').attr('disabled',true);
		$('#btnSave').removeClass('d-none');

		sideView = 'edit';
	});

	//저장 버튼 click
	$('#btnSave').on('click',function(){

		var url;
		
		if(sideView == "add"){
			url = '<c:url value="mm/mainIssueAdmCreate" />';
		}else{
			url = '<c:url value="mm/mainIssueAdmUpdate" />';
		}

		
		//저장처리
		$.ajax({
			url : url,
			type : 'GET',
			data : {
					'issueDate' : function(){return prodDate.replace(/-/g,'')},
					'issueContents' : $('#issueContents').val()
			},
			success : function(res){
				if(res.result=="ok"){

					if(sideView == "add"){
						toastr.success("등록되었습니다.");
					}else{
						toastr.success("수정되었습니다.");
					}

					$('#issueContents').attr('disabled',true);
					$('#btnSave').addClass('d-none');
					$('#btnAdd').attr('disabled',true);
					$('#btnEdit').attr('disabled',false);
					
				}else{
					toastr.error(res.message);
				}
			}

		});

	});
	


</script>
</body>
</html>