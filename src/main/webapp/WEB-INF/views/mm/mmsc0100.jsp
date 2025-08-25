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
				<li class="breadcrumb-item active">생산일보관리(구분)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 58.5%;">
			<div class="open-arrow" id="arrowLeft">
				<button id="left-width-btn2" onclick="openrNav2()"
					class="btn btn-primary input-sub-search" type="button">
					<i class="mdi mdi-arrow-left"></i>
				</button>
			</div>
			
			<div class="row">&nbsp;&nbsp;
					<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">
					<input class="form-control" style="width:97px;" type="text" id="prodDateTo" name="prodDateTo" disabled/>
					<button onclick="fnPopUpCalendar(prodDateTo,prodDateTo,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="prodDateToCalendar" type="button">
						<span class="oi oi-calendar"></span>
					</button>
				</div>&nbsp;&nbsp;&nbsp;
					<label class="input-label-sm">구분</label>
					<select class="custom-select" id="searchOption" style="max-width: 80px;"></select>&nbsp;
				  	<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>
			</div>
			<br>
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1, #tab3">인원현황</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">공정현황</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<br>
				<div class="card">
					<div id="table1">
					
						<div class="table-responsive">
							<label style="font-size: 15px;">인원현황</label>
							<table id="" class="table table-bordered mt-1" style="margin-bottom: 56px;">
								<colgroup>
									<col width="15%">
									<col width="17%">
									<col width="17%">
									<col width="17%">
									<col width="17%">
									<col width="17%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>구분</th>
										<th>보유인원</th>
										<th>현재인원</th>
										<th>휴가/결근</th>
										<th>조퇴</th>
										<th>외출/지각</th>
									</tr>
									<tr>
										<th>직접인원</th>
										<td><span id="totalUser"></span></td>
										<td><span id="nowUser"></span></td>
										<td><span id="personStatValue1"></span></td>
										<td><span id="personStatValue2"></span></td>
										<td><span id="personStatValue3"></span></td>
									</tr>
									<tr>
										<th>간접인원</th>
										<td><span id="indirectTotalUser"></span></td>
										<td><span id="indirectNowUser"></span></td>
										<td><span id="indirectPersonStatValue1"></span></td>
										<td><span id="indirectPersonStatValue2"></span></td>
										<td><span id="indirectPersonStatValue3"></span></td>
									</tr>
								</thead>
							</table>
							<div class="table-responsive">
								<label style="font-size: 15px;">유실공수[무작업시간] 현황(Top3)</label>
								<table id="manHourTop3Table" class="table table-bordered mt-1">
									<colgroup>
										<col width="3%">
										<col width="15%">
										<col width="4%">
										<col width="15%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>No.</th>
											<th>항목</th>
											<th>(분)</th>
											<th>세부내용</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<!-- 공정현황테이블 시작 -->
					<div id="table2" style="height: 350px; margin-bottom: 15px;"class="d-none">
						<div class="table-responsive">
							<label style="font-size: 15px;">계획달성율/계획진행사항</label>
							<table id="" class="table table-bordered mt-1" style="margin-bottom: 40px;">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>생산목표</th>
										<th>생산실적</th>
										<th>계획달성율</th>
										<th>비고</th>
									</tr>
									<tr style="height: 25px;">
										<td><span id="workOrdQty"></span></td>
										<td><span id="sumQty"></span></td>
										<td><span id="achvRate"></span></td>
										<td><span>생산실적/생산목표</span></td>
									</tr>
									<tr>
										<th colspan="4">계획(명일) 진행사항</th>
									</tr>
									<tr>
										<td colspan="4">KXNZ-O4DT4NX 외 1종 10EA</td>
									</tr>
								</thead>
							</table>
							<div class="table-responsive">
								<label style="font-size: 15px;">생산 실적현황</label>
								<table id="prodResultStatTable" class="table table-bordered mt-1">
									<colgroup>
										<col width="3%">
										<col width="15%">
										<col width="4%">
										<col width="15%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>No.</th>
											<th>Model</th>
											<th>수량</th>
											<th>비고</th>
										</tr></thead>
								</table>
							</div>
						</div>
					</div>
					<!-- 공정현황 테이블 끝 -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix" id="rfSidenav" style="width: 37%;">
				<div class="card-body col-sm-12">
<!-- 					<div class="rightsidebar-close"> -->
<!-- 						<a href="javascript:void(0)" id="left-expand2" -->
<!-- 							class="closebtn float-right" onclick="closerNav2()"><i -->
<!-- 							class="mdi mdi-close"></i></a> -->
<!-- 					</div> -->
				</div>
				<!--/오른쪽 인원현황 등록 부분 상단 버튼 영역-->
				<div id="form1">
					<form id="formOut">
						<div class="table-responsive">
							<!-- 생산가동율 -->
							<label style="font-size: 15px; margin-top: 65px;">생산가동율</label>
							<table id="" class="table table-bordered mt-1">
								<colgroup>
									<col width="3%">
									<col width="10%">
									<col width="5%">
									<col width="20%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>No.</th>
										<th>항목</th>
										<th>분%</th>
										<th>참고</th>
										<th>비고</th>
									</tr>
									<tr>
										<td class="text-center">1</td>
										<td class="text-center">재적공수</td>
										<td class="text-center"><span id="mhValue1"></span></td>
										<td>((480분-휴식시간)*보유인원)</td>
										<td>
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center">취업공수</td>
										<td class="text-center"><span id="mhValue2"></span></td>
										<td>(재적공수-휴업공수)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">3</td>
										<td class="text-center">작업공수</td>
										<td class="text-center"><span id="mhValue3"></span></td>
										<td>(취업공수+추가공수)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">4</td>
										<td class="text-center">추가공수</td>
										<td class="text-center"><span id="mhValue4"></span></td>
										<td>(잔업, 타부서지원받음, 간접인원지원)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">5</td>
										<td class="text-center">휴업공수</td>
										<td class="text-center"><span id="mhValue5"></span></td>
										<td>(휴가, 조퇴, 외부교육, 출장, 타부서지원)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">6</td>
										<td class="text-center">유실공수</td>
										<td class="text-center"><span id="mhValue6"></span></td>
										<td>(무작업시간)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">7</td>
										<td class="text-center">실동공수</td>
										<td class="text-center"><span id="mhValue7"></span></td>
										<td>(작업공수-유실공수)</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">8</td>
										<td class="text-center">준비작업시간</td>
										<td class="text-center"><span id="mhValue8"></span></td>
										<td>공정내준비공정시간</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">9</td>
										<td class="text-center">인원가동율</td>
										<td class="text-center"><span id="mhValue9"></span></td>
										<td>라인 및 공정의 가동상태</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">10</td>
										<td class="text-center">작업능률</td>
										<td class="text-center"><span id="mhValue10"></span></td>
										<td>제품별생산성, 작업자 숙련, 노력, 관리정도지표</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">11</td>
										<td class="text-center">종합능률</td>
										<td class="text-center"><span id="mhValue11"></span></td>
										<td>전체의 종합적 능률지표</td>
										<td></td>
									</tr>
									<tr>
										<td class="text-center">12</td>
										<td class="text-center">표준공수</td>
										<td class="text-center"><span id="mhValue12"></span></td>
										<td>∑(모델별 표준시간 ∗ 모델별생산수량)</td>
										<td></td>
									</tr>
								</thead>
							</table>
						</div>
					</form>
				</div>
				<!--/오른쪽 공정현황 등록 부분 상단 버튼 영역-->
				<div id="form2" class="d-none">
					<form id="formIn">
						<div class="table-responsive">
							<!-- 생산공정현황 -->
							<label style="font-size: 15px; margin-top: 65px;">생산 공정현황</label>
							<table id="prodProcStatTable" class="table table-bordered mt-1">
								<thead class="thead-light">
									<tr>
										<th>공정코드</th>
										<th>공정명</th>
										<th>작업수량</th>
										<th>투입시간(분)</th>
										<th>시간당 생산량</th>
										<th>표준시간당 생산량</th>
									</tr>
								</thead>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>

// $("#left-width-btn2").click(function() {
// 	{
// 		$("#left-list").animate({
// 			width : "40%"
// 		}, 200);
// 		$("#arrow-left").animate({
// 			display : "none"
// 		}, 200);
// 	}
// 	state = !state;
// });

	let currentHref = "mmsc0100";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산일보관리(구분)"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var prodDate =  "${serverDateTo}";
	var prodGubun=null;
	//var serverDateTo =  "${serverDateTo}";
	
	$('#prodDateTo').val(prodDate);
	//$('#prodDate').val(serverDateFrom);
	
	$('#saveBtnModalY').on('click', function() {
	});

	//공통코드 처리 시작
	var prodGubunCode = new Array(); 
	<c:forEach items="${prodGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	prodGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료
	
	//선택박스 처리
	selectBoxAppend(prodGubunCode, "searchOption", "", "");
	

	//인원현황 탭 클릭시
	$('#tab1Nav').on('click',function(){
		$('#formOut').each(function(){
        	this.reset();
    	});
    	sideView = 'add';
		$('#btnSave').addClass('d-none');
		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');
		$('#form1').removeClass('d-none');
		$('#form2').addClass('d-none');

	});

	//공정현황 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#formIn').each(function(){
        	this.reset();
    	});
		sideView = 'add';
		$('#btnSave').addClass('d-none');
		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');
		$('#form1').addClass('d-none');
		$('#form2').removeClass('d-none');

	});

	//dom 생성시 실행
	$(document).ready(function(){
		prodGubun = $('#searchOption :selected').val();
		prodDate = $('#prodDateTo').val();
		
		personStatEvent();
		personStatEvent2();
		manHourTop3Event();
		prodUtilEvent();
		planAchvRateEvent();
		prodResultStatEvent();
		prodProcStatEvent();
		
		
		$('#btnRetv').on('click',function(){
			prodGubun = $('#searchOption :selected').val();
			prodDate = $('#prodDateTo').val();
			
			personStatEvent();
			personStatEvent2();
			manHourTop3Event();
			prodUtilEvent();
			planAchvRateEvent();
			prodResultStatEvent();
			prodProcStatEvent();
		})

	});

	//***************************************인원현황 탭******************************
	//생산일보관리 인원현황 목록조회
	
	//직접인원
	function personStatEvent(){
		$.ajax({
			url: '<c:url value="mm/personStatList"/>',
		    type : 'GET',
		    data : {
		    	'prodGubun' : function(){return prodGubun},
		    	'personalGubun' : '001',	//사용자관리에 공수인원구분이 001일때만 (001 = 직접 )
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				var data = res.data;
				$('#totalUser').text(data.totalUser);
				$('#nowUser').text(data.nowUser);
				$('#personStatValue1').text(data.mhValue1);
				$('#personStatValue2').text(data.mhValue2);
				$('#personStatValue3').text(data.mhValue3);
		    }
		});
	}

	//간접인원
	function personStatEvent2(){
		$.ajax({
			url: '<c:url value="mm/personStatList"/>',
		    type : 'GET',
		    data : {
		    	'prodGubun' : function(){return prodGubun},
		    	'personalGubun' : '002',	//사용자관리에 공수인원구분이 002일때만 (002 = 간접)
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
		    },
		    success : function(res){
				var data = res.data;
				$('#indirectTotalUser').text(data.totalUser);
				$('#indirectNowUser').text(data.nowUser);
				$('#indirectPersonStatValue1').text(data.mhValue1);
				$('#indirectPersonStatValue2').text(data.mhValue2);
				$('#indirectPersonStatValue3').text(data.mhValue3);
		    }
		});
	}
	
	//생산일보관리 유실공수현황 TOP(3) 목록조회
	var manHourTop3Table;
	function manHourTop3Event(){
		if(manHourTop3Table == null || manHourTop3Table == undefined){
			manHourTop3Table = $('#manHourTop3Table').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,		
				paging : false,
				searching : false,
				info : false,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
		        ajax : {
		    		url: '<c:url value="mm/manHourTop3List"/>',
		        	type : 'GET',
		        	data : {
		        		'prodGubun' : function(){return prodGubun},
						'prodDate' : function(){return prodDate.replace(/-/g,'')},
						//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
			         },
		      	},
		      	rowId : 'userNm',
			    columns : [ 
			    	{
			    		render  : function(data,type,row,meta){
							return meta.row+1;
						}  
					},
					{ data : 'mhNm' },
					{ data : 'prodData' },
					{ 
						render  : function(data,type,row,meta){
							return '-';
						}  
					 },
				],
		       	order: [
		      	],
		      	buttons : [ 'copy', 'excel', 'print' ],
		        columnDefs: [
		           { "targets": "_all" , "className": "text-center"},
		        ],
			});  
		}else{
			$('#manHourTop3Table').DataTable().ajax.reload(function() {});
		}
	}
	
	//생산일보관리 생산가동율 목록조회
	function prodUtilEvent(){
		$.ajax({
			url: '<c:url value="mm/prodUtilList"/>',
		    type : 'GET',
		    data : {
		    	'prodGubun' : function(){return prodGubun},
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
				//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
		    },
		    success : function(res){
				let data = res.data;
				console.log(data.mhValue1);
				$('#mhValue1').text(data.mhValue1==null?'·':data.mhValue1);
				$('#mhValue2').text(data.mhValue2==null?'·':data.mhValue2);
				$('#mhValue3').text(data.mhValue3==null?'·':data.mhValue3);
				$('#mhValue4').text(data.mhValue4==null?'·':data.mhValue4);
				$('#mhValue5').text(data.mhValue5==null?'·':data.mhValue5);
				$('#mhValue6').text(data.mhValue6==null?'·':data.mhValue6);
				$('#mhValue7').text(data.mhValue7==null?'·':data.mhValue7);
				$('#mhValue8').text(data.mhValue8==null?'·':data.mhValue8);
				$('#mhValue9').text(data.mhValue9==null?'·':data.mhValue9.substring(0,5)+"%");
				$('#mhValue10').text(data.mhValue10==null?'·':data.mhValue10.substring(0,5)+"%");
				$('#mhValue11').text(data.mhValue11==null?'·':data.mhValue11.substring(0,5)+"%");
				$('#mhValue12').text(data.mhValue12==null?'·':data.mhValue12.substring(0,5));
		    }
		});
	}

	//***************************************공정현황 탭******************************
	//계획달성율/계획진행사항
	function planAchvRateEvent(){
		$.ajax({
			url: '<c:url value="mm/planAchvRateList"/>',
		    type : 'GET',
		    data : {
		    	'prodGubun' : function(){return prodGubun},
			    'prodDate' : function(){return prodDate.replace(/-/g,'')},
				//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
		    },
		    success : function(res){

			    
			    if(res.result == "ok"){
			    	$('#workOrdQty').text(res.workOrdQty);
					$('#sumQty').text(res.sumQty);
					$('#achvRate').text(res.achvRate+"%");
				}
		    }
		});
	}
	
	//생산일보관리 생산 실적현황 목록조회
	var prodResultStatTable;
	function prodResultStatEvent(){
		if(prodResultStatTable == null || prodResultStatTable == undefined){
			prodResultStatTable = $('#prodResultStatTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,		
				paging : false,
				searching : false,
				info : false,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
		        ajax : {
		    		url: '<c:url value="mm/prodResultStatList"/>',
		        	type : 'GET',
		        	data : {
		        		'prodGubun' : function(){return prodGubun},
						'prodDate' : function(){return prodDate.replace(/-/g,'')},
						//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
			         },
		      	},
		      	rowId : 'userNm',
			    columns : [ 
			    	{ 
				    	render  : function(data,type,row,meta){
							return meta.row+1;
						}  
					},
					{ data : 'itemNm' },
					{ data : 'outputQty' },
					{ 
						render  : function(data,type,row,meta){
							return '-';
						}  
					},
				],
		       	order: [
		      	],
		      	buttons : [ 'copy', 'excel', 'print' ],
		        columnDefs: [
		           { "targets": "_all" , "className": "text-center"},
		        ],
			});  
		}else{
			$('#prodResultStatTable').DataTable().ajax.reload(function() {});
		}
	}
	
	//생산일보관리 생산 공정현황 목록조회
	var prodProcStatTable;
	function prodProcStatEvent(){
		if(prodProcStatTable == null || prodProcStatTable == undefined){
			prodProcStatTable = $('#prodProcStatTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,		
				paging : false,
				searching : false,
				info : false,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
		        ajax : {
		    		url: '<c:url value="mm/prodProcStatList"/>',
		        	type : 'GET',
		        	data : {
		        		'prodGubun' : function(){return prodGubun},
						'prodDate' : function(){return prodDate.replace(/-/g,'')},
						//'endDate'  : function(){return serverDateTo.replace(/-/g,'')},
			         },
		      	},
		      	rowId : 'userNm',
			    columns : [ 
			    	{ data : 'prcssCd'},
					{ data : 'prcssNm' },
					{ data : 'outputQty' },
					{ data : 'sumTime' },
					{ 
						render  : function(data,type,row,meta){
							return (row['outputQty'] / row['sumTime'])*60
						}  
					},
					{ 
						render  : function(data,type,row,meta){
							return '·';
						}  
					},
				],
		       	order: [
		      	],
		      	buttons : [ 'copy', 'excel', 'print' ],
		        columnDefs: [
		           { "targets": "_all" , "className": "text-center"},
		        ],
			});  
		}else{
			$('#prodProcStatTable').DataTable().ajax.reload(function() {});
		}
	}
	
</script>
</body>
</html>