<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

	<!-- 교정이력 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="corrDataPopUpModal" tabindex="-1" role="dialog" aria-labelledby="corrDataPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content" style="width: 1000px; position: absolute; left: 50%; transform: translateX(-50%);">
	        	<div class="modal-header">
		           	<h5 class="modal-title" id="corrDataPopUpLabel">점검이력사항</h5>
		           	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            	<span aria-hidden="true">&times;</span>
		           	</button>
		        </div> 
		        <div class="modal-body">
		        	<label class="float-left" id="equipNmLabel" style="font-size: 20px;">공구명</label>
		        	<button type="button" class="btn btn-danger float-right mb-2" id="btnCorrDataDel">삭제</button>
		        	<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="btnCorrDataEdit">수정</button>
		        	<div class="table-responsive">
		            	<table id="corrDataPopUpTable" class="table table-bordered">
	<%-- 						<colgroup> --%>
	<%-- 							<col width="10%"> --%>
	<%-- 							<col width="25%"> --%>
	<%-- 							<col width="20%"> --%>
	<%-- 							<col width="20%"> --%>
	<%-- 							<col width="25%"> --%>
	<%-- 						</colgroup>										 --%>
							<thead class="thead-light">
								<tr>
									<th>*점검일자</th>
									<th>실행일자</th>
									<th>작성자</th>
									<th>점검 자료</th>
									<th>첨부파일</th>
									<th>차기 예정</th>
								</tr>
							</thead>
						</table>
					</div>
					<button type="button" class="btn btn-danger float-right mb-2" id="btnFileDel" disabled>첨부파일 삭제</button>
	        		<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="btnFileAdd" disabled>첨부파일 추가</button>
					<div class="table-responsive">
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
	         	<div class="modal-footer">
		       		<button type="button" class="btn btn-primary float-right" id="btnCorrDataSave" disabled>저장</button>
		           	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        	</div>
	    	</div>
		</div>
	</div>
	<!-- 교정이력 모달 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">공구관리</a></li>
				<li class="breadcrumb-item active">공구관리대장</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="equipCodeTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="3%">
								<col width="6%">
								<col width="8%">
								<col width="9%">
								<col width="9%">
								<col width="6%">
								<col width="6%">
								<col width="5%">
								<col width="5%">
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
<%-- 								<col width="9%"> --%>
<%-- 								<col width="8%"> --%>
<%-- 								<col width="8%"> --%>
<%-- 								<col width="6%"> --%>
<%-- 								<col width="6%"> --%>
<%-- 								<col width="5%"> --%>
<%-- 								<col width="5%"> --%>
<%-- 								<col width="5%"> --%>
<%-- 								<col width="7%"> --%>
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th rowspan="2" style="vertical-align: middle;">NO</th>
									<th rowspan="2" style="vertical-align: middle;">구분</th>
									<th rowspan="2" style="vertical-align: middle;">공구관리번호</th>
									<th rowspan="2" style="vertical-align: middle;">공구명</th>
									<th rowspan="2" style="vertical-align: middle;">공구규격</th>
									<th rowspan="2" style="vertical-align: middle;">최근점검일</th>
									<th rowspan="2" style="vertical-align: middle;">차기점검일</th>
									<th rowspan="2" style="vertical-align: middle;">점검주기</th>
									<th rowspan="2" style="vertical-align: middle;">계획/실적</th>
									<th colspan="12">공구 점검 계획대비 실적 현황</th>
<!-- 									<th>공구크기 (W*L*H)<br>단위:미터</th> -->
<!-- 									<th>제작사</th> -->
<!-- 									<th>모델명</th> -->
<!-- 									<th>제작일자</th> -->
<!-- 									<th>구입일자</th> -->
<!-- 									<th>공구등급</th> -->
<!-- 									<th>설치장소</th> -->
<!-- 									<th>공구상태</th> -->
<!-- 									<th class="text-center">구입가격</th> -->
									<th rowspan="2" style="vertical-align: middle;">비고</th>
								</tr>
								<tr>
									<th>1월</th>
									<th>2월</th>
									<th>3월</th>
									<th>4월</th>
									<th>5월</th>
									<th>6월</th>
									<th>7월</th>
									<th>8월</th>
									<th>9월</th>
									<th>10월</th>
									<th>11월</th>
									<th>12월</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFF;
}
</style>
<script>
	let currentHref = "tosc0010";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공구관리대장"); 
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	
	var rcvDateInFromCal = serverDateFrom;
	var rcvDateInToCal = serverDateTo;
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	var status = "part";
	var cmd = new Array();
	var i = 0;

	var mainGubunVal = '';
	var itemGubunVal = '';
	var equipGubunVal = '';
	
	//교정이력
	var dt = new Date();
	var com_year = dt.getFullYear();
	var corrYear = com_year;
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	var day = now.getDate();
	if (day < 10) { day = "0" + day; }
	let nowDate = year + "" + mon + day;
	
	var mitCdVal = null;
	var corrDateVal = null;
	let btnView = '';
	var corrWillDate = '';
	var corrCheck = '';
	////

	let partPrintArray = new Array();
	let itemPrintArray = new Array();
	
	$("input[name=rcvDate]").val(serverDateTo);
	$("input[name=shipReqDate]").val(serverDateTo);
	
	//공통코드 처리 시작
	var itemGubunArray = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunArray.push(json);
	</c:forEach>
	
	var mainGubunArray = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
	var equipGubunCode = new Array();
	<c:forEach items = "${equipGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>
    
	var userListCode = new Array(); // 작성자
	<c:forEach items="${userList}" var="info">
	var json = new Object();
	json.baseCd = "${info.userNumber}";
	json.baseNm = "${info.userNm}";
	userListCode.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
    //목록 조회
	let equipCodeTable = $('#equipCodeTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '60vh',
		pageLength : 2000000,
		//ordering: false,
		ajax : {
			url : '<c:url value="bm/toolCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return '002';},
				'corrYear' : function(){return corrYear;},
				'corrGubun' : function(){return '002';},
			},
		},
		columns : [ 
			{//NO
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{//구분
				data : 'equipGubunNm'
			}, 
			{//공구관리번호
				data : 'equipNo'
			}, 
			{//공구명
				data : 'equipNm'
			}, 
			{//공구규격
				data : 'equipType'
			},
			{//최근점검일
				data : 'corrDate',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
					
				}
			},
			{//차기점검일
				data : 'corrWillDate',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
					
				}
			},
			{//점검주기
				render: function(data, type, row, meta) {
					if(row['checkCount'] != null && row['checkCycleNm'] != null){
						return row['checkCount'] + '회 / ' + row['checkCycleNm'];
					} else {
						return '-';
					}
				}
			}, 
			{//계획/실적
				data : 'corrCheck',
				render: function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return '실적';
					}
					
				}
			}, 
			{//1월
				data : 'monthOne',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 1)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 1)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 1)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//2월
				data : 'monthTwo',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 2)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 2)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 2)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//3월
				data : 'monthThree',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 3)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 3)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 3)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//4월
				data : 'monthFour',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 4)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 4)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 4)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//5월
				data : 'monthFive',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 5)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 5)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 5)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//6월
				data : 'monthSix',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 6)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 6)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 6)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//7월
				data : 'monthSeven',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 7)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 7)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 7)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//8월
				data : 'monthEight',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 8)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 8)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 8)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//9월
				data : 'monthNine',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 9)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 9)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 9)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//10월
				data : 'monthTen',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 10)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 10)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 10)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//11월
				data : 'monthEleven',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 11)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 11)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 11)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{//12월 
				data : 'monthTwelve',
				render: function(data, type, row, meta) {
					if(data != null){
						if(data == 'result'){
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 12)">●</span>';
						} else if(data >= nowDate) {
							return '<span style="cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 12)">○</span>';
						} else {
							return '<span style="color : red; cursor: pointer;" onclick="corrOnclick('+row['mitCd']+', 12)">●</span>';
						}
					}else {
						return '';
					}
				}
			},
			{
				data: 'equipDesc'	 	
			},
		],
		columnDefs : [],
		buttons : [ {
			extend : 'copy',
			title : '공구관리대장',
		}, {
			extend : 'excel',
			title : '공구관리대장',
		}, {
			extend : 'print',
			title : '공구관리대장',
		}, ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
    
	// 테이블 행 선택
	$('#equipCodeTable tbody').on('dblclick','tr',function() {
		var equipCd = equipCodeTable.row(this).data().equipCd;
		var equipGubun = equipCodeTable.row(this).data().equipGubun;
		window.location.href = "emsc0090?equipCd=" + equipCd + '&equipGubun=' + equipGubun;
	});
    
	//자재(일자)
	var html1 = '<div class="col-sm-10">';
		html1 += '<label class="float-left input-label-sm">년도</label>';
		html1 += '<select id="YEAR" name="YEAR" class="select w80 col-12 custom-select">';
		html1 += '</select>&nbsp;&nbsp;&nbsp;';
		html1 += '<label class="input-label-sm">구분</label>';
		html1 += '<select id="equipGubun" name="equipGubun" class="select w80 col-12 custom-select">';
		html1 += '</select>&nbsp;&nbsp;&nbsp;';
		html1 += '<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
		html1 += '<button type="button" class="btn btn-primary d-none" id="btnAllRetv">전체조회</button>';
		html1 += '<label style="font-size:14px; color: red;" class="float-right input-label-sm">●</label>';
		html1 += '<label style="font-size:14px;" class="float-right input-label-sm mr-0">*범례&nbsp;-&nbsp;계획○&nbsp;&nbsp;실적●&nbsp;&nbsp;기간초과</label>';
	    html1 += '</div>';
    
   
	$('#equipCodeTable_length').html(html1);
	setDateBox();
	
	selectBoxAppend(equipGubunCode, "equipGubun", "", "1");
	
	// select box 년도 표시
	function setDateBox(){
	   // 발행 뿌려주기
	   $("#YEAR").append("<option value=''>년도</option>");
	   // 올해 기준으로 -100년부터 +100년을 보여준다.
	   for(var y = (com_year-100); y <= (com_year+100); y++){
	       $("#YEAR").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '년' +'</option>');
	   }
	}
	
	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		corrYear = $("#YEAR").val();
		equipGubunVal =  $('#equipGubun').val();
		$('#equipCodeTable').DataTable().ajax.reload( function () {});
    });
	
	//전체조회 버튼 클릭시
// 	$('#btnAllRetv').on('click',function(){
// 		equipGubunVal = "";
// 		selectBoxAppend(equipGubunCode, "equipGubun", "", "1");
// 		$('#equipCodeTable').DataTable().ajax.reload( function () {});  
// 	});
	
	let corrDataPopUpTable;
	let corrDataFileTable;
	function corrOnclick(mitCd, month) {
		$('#corrDataPopUpModal').modal('show');
		mitCdVal = mitCd;
		if(month < 10){
			month = "0" + month;
		}
		corrDateVal = corrYear + '' + month;
		if (corrDataPopUpTable != null && corrDataPopUpTable != 'undefined') {
			corrDataPopUpTable.destroy();
		}
		corrDataPopUpTable = $('#corrDataPopUpTable').DataTable({	
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
	 				'mitCd' : function() {return mitCdVal;},
	 				'corrDateVal' : function() {return corrDateVal;},
	 				'corrGubun' : function() {return '002';},
				},
			},
			columns : [ 
				{
					data : 'corrDate',
					render : function(data, type, row, meta) {
						if(data == null){
							var html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control" type="date" id="corrDate" value="'+tempCorrWillDate+'" name="corrDate"/>';
							html += '</div>';

							return html;
						}else{
							var html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control" type="date" id="corrDate" value="'+moment(data).format('YYYY-MM-DD')+'" name="corrDate" disabled/>';
							html += '<input class="form-control" type="hidden" id="corrRealDate" value="'+moment(data).format('YYYY-MM-DD')+'" name="corrRealDate"/>';
							html += '<input class="form-control" type="hidden" id="corrSeq" value="'+row['corrSeq']+'" name="corrSeq"/>';
							html += '<input class="form-control" type="hidden" id="corrGubun" value="'+row['corrGubun']+'" name="corrGubun"/>';
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
					data : 'regId',
					render : function(data, type, row, meta) {
						if(data == null){
							var html = "";
							html = selectBoxHtml(userListCode, "userSelect", userNumber, row, meta, meta.row);
							return html;
// 							 var html = '<input type="text" class="form-control" id="userNm"  value="'+userNm+'" style="min-width:100%; text-align:center;" disabled/>';
// 							 html += '<input type="hidden" class="form-control" id="userNumber"  value="'+userNumber+'" style="min-width:100%" disabled/>';
// 							return html;
						} else {
							var html = "";
							html = selectBoxHtml(userListCode, "userSelect", data, row, meta, meta.row);
							return html;
// 							var html = '<input type="text" class="form-control" id="userNm" value="'+data+'" style="min-width:100%; text-align:center;" disabled/>';
// 							html += '<input type="hidden" class="form-control" id="userNumber" value="'+row['regId']+'" style="min-width:100%" disabled/>';
// 							return html;
						}
					},
					'className' : 'text-center'
				}, 
				{
					data : 'corrNo',
					render : function(data, type, row, meta) {
						if(data == null){
							return '<input type="text" class="form-control" id="corrNo" style="min-width:100%" disabled/>';
						}else{
							return '<input type="text" class="form-control" id="corrNo" value="'+data+'" style="min-width:100%" disabled/>';
						}
					},
					'className' : 'text-center'
				}, 
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {
						
						if(data == null){
							var html = '<form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">';
							html += '<input type="file" class="custom-file-input" id="fileNm" name="fileNm">';
							html += '<label class="custom-file-label" for="fileNm"></label></div></form>';
							return html;
						} else {
							var html = '<a id="fileA" href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+mitCdVal+'&corrSeq='+row['corrSeq']+'&corrGubun='+row['corrGubun']+'">'+data+'</a>';
							html += '<form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file d-none" id="fileDiv">';
							html += '<input type="file" class="custom-file-input" id="fileNm" name="fileNm">';
							html += '<label class="custom-file-label" id="fileLabel" for="fileNm">'+data+'</label></div></form>';
							return html;
						}
		            }
				},
				{
// 					data : 'corrWillDate',
					render : function(data, type, row, meta) {
						if(data == null){
							var html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control" type="date" id="nextCorrDate" value="" name="nextCorrDate" disabled/>';
							html += '</div>';

							return html;
						}else{
// 							tempCorrWillDate = moment(data).format('YYYY-MM-DD');
							var html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control" type="date" id="nextCorrDate" value="" name="nextCorrDate" disabled/>';
							html += '</div>';

							return html;
						}
					},
					'className' : 'text-center'
				}, 
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
			columnDefs : [
				{ 'visible' : false, 'targets' : 4},
// 				{
// 				"defaultContent" : "-",
// 				"targets" : "_all",
// 				"className" : "text-center"
// 			} 
			],
			drawCallback : function(){
				
			}
		});
		
		var tempNum = '';
		var tempCorrGubun = $("#corrGubun").val();
		var tempCorrSeq = $("#corrSeq").val();
		if (corrDataFileTable != null && corrDataFileTable != 'undefined') {
			corrDataFileTable.destroy();
		}
		corrDataFileTable = $('#corrDataFileTable').DataTable({
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
			scrollY: '40vh',
			pageLength : 100000000,
			ajax : {
				url : '<c:url value="/bm/attachDataList"/>',
				type : 'GET',
				async : false,
				data : {
					'attachCd' : function(){return mitCdVal;},
					'attachGubun' : function(){return 'CD';},
					'attachType' : function(){return tempCorrGubun;},
					'etc1' : function(){return tempCorrSeq;},
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
					data : 'attachFn',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+mitCdVal+'&attachType='+tempCorrGubun+'&etc1='+tempCorrSeq+'&attachGubun=CD">'+data+'</a>';
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
		
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		},400);
		
		$('#corrDataFileTable tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
				tempView1 = "add";
			} else {
				$('#corrDataFileTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
			tableIdx = $('#corrDataFileTable').DataTable().row(this).index();
			baseInfoSeq = corrDataFileTable.row(tableIdx).data().attachSeq;
			tempView1 = "edit";
		});
		
		$('#btnFileAdd').attr('disabled', true);
		$('#btnFileDel').attr('disabled', true);
		$('#btnCorrDataSave').attr('disabled', true);
	}
	
	var tempView1 = 'add';
	var baseInfoSeq = null;
	
	//첨부파일 추가
	$('#btnFileAdd').on('click', function() {
// 		sideView = 'add';
		$('#corrDataFileTable').DataTable().row.add({}).draw(false);
		
// 		if (corrDataFileTable.data().count() > 0) {
// 			$('#btnSave4').removeClass('d-none'); // 등록버튼
// 		}
		
// 		$('#btnFileAdd').attr('disabled', true);
// 		$('#btnFileDel').attr('disabled', true);
		//btnView = '';
	});
	
	//첨부파일 삭제
	$('#btnFileDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 첨부파일 항목을 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'CD';},
					'attachCd' : function(){return mitCdVal;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#corrDataFileTable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#corrDataFileTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});
	
	//점검이력사항 수정 버튼
	$('#btnCorrDataEdit').on('click', function() {
		btnView = 'edit';

		$('#btnFileAdd').attr('disabled', false);
		$('#btnFileDel').attr('disabled', false);
		$('#btnCorrDataSave').attr('disabled', false);
// 		if($('#corrWillDate').val() == ''){
// 			$('#corrWillDate').val($('#corrDate').val());
// 		}
		
		
		$('#corrDate').attr('disabled', false);
		$('#corrWillDate').attr('disabled', false);
		$('#nextCorrDate').attr('disabled', false);
		$('#userSelect').attr('disabled', false);
		$('#corrNo').attr('disabled', false);
		$('#fileA').addClass('d-none');
		$('#fileDiv').removeClass('d-none');
		$('#fileNm').attr('disabled', false);
			
	});
	
	//점검이력사항 삭제 버튼
	$('#btnCorrDataDel').on('click', function() {
		$('#deleteModal').modal('show');
	});
	
	//삭제 모달 버튼
	$('#btnDeleteConfirm').on('click', function() {
		btnView = 'add';

		$.ajax({
			url : '<c:url value="bm/corrDataListDelete" />',
			type : 'GET',
			data : {
				'mitCd' : function(){return mitCdVal;},
				'corrDateVal' : function() {return corrDateVal;},
				'corrGubun' : function() {return '002';},
				'attachGubun' : function() {return 'CD';},
				'attachCd' : function() {return mitCdVal;},
				'attachType' : function() {return '002';},
				'etc1' : function() {return $('#corrSeq').val();},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("삭제되었습니다.");
					$('#equipCodeTable').DataTable().ajax.reload(function(){});
					$('#deleteModal').modal('hide');
					$('#corrDataPopUpModal').modal('hide');
				}else {
					toastr.error(res.message);
				}
			}
		});
	});
	
	//점검이력사항 저장 버튼
	$('#btnCorrDataSave').on('click', function() {
		var check = true;
		var check2 = true;
		var dataArray = new Array();
	
		$('#corrDataPopUpTable tbody tr').each(function(index, item) {
			
			if ($("#corrDate").val() == "") {
				toastr.warning('교정일자를 입력해 주세요.');
				$("#corrDate").focus();
				check = false;
				return false;
			}
			
			if($('#corrDate').val().replace(/-/g, '').substr(0, 6) != $('#corrRealDate').val().replace(/-/g, '').substr(0, 6)){//다른 달로 수정하는지 체크
				//점검일자 중복 체크
				var corrCheck = false;
				$.ajax({
					url : '<c:url value="bm/attachCorreDataList"/>',
					type : 'GET',
					async : false,
					data : {
		 				'mitCd' : function() {return mitCdVal;},
		 				'corrDateCheck' : function() {return $('#corrDate').val().replace(/-/g, '').substr(0, 6);},
		 				'corrGubun' : function() {return '002';},
					},
					success : function(res) {
						let data = res.data;
						
						if(data.length != 0){
							corrCheck = true;
						}
					}
					
				});
				
				if(corrCheck){
					toastr.warning($('#corrDate').val().replace(/-/g, '').substr(0, 4) + '년 ' + $('#corrDate').val().replace(/-/g, '').substr(4, 2) +'월의 교정이력이 이미 있습니다.');
					$("#corrDate").focus();
					check = false;
					return false;
				}
			}
			
// 			if(corrCheck == '계획' && corrWillDate != $("#corrDate").val().replace(/-/g,'')){
// 				if ($(this).find("td input[name=corrWillDate]").val() == "") {
// 					toastr.warning('계획 중인 교정이력이 있습니다. 실행일자를 입력해 주세요.');
// 					$(this).find("td input[name=corrWillDate]").focus();
// 					check = false;
// 					return false;
// 				}
// 			}
			
			
			if ($("#nextCorrDate").val() != "") {
// 				if ($("#corrWillDate").val() == "") {
// 					toastr.warning('실행일자를 입력해 주세요.');
// 					$("#corrWillDate").focus();
// 					check = false;
// 					return false;
// 				}
				
				//차기 예정 중복 체크
				var nextCorrCheck = false;
				$.ajax({
					url : '<c:url value="bm/attachCorreDataList"/>',
					type : 'GET',
					async : false,
					data : {
		 				'mitCd' : function() {return mitCdVal;},
		 				'corrDateCheck' : function() {return $('#nextCorrDate').val().replace(/-/g, '').substr(0, 6);},
		 				'corrGubun' : function() {return '002';},
					},
					success : function(res) {
						let data = res.data;
						
						if(data.length != 0){
							nextCorrCheck = true;
						}
					}
					
				});
				
				if(nextCorrCheck){
					toastr.warning($('#nextCorrDate').val().replace(/-/g, '').substr(0, 4) + '년 ' + $('#nextCorrDate').val().replace(/-/g, '').substr(4, 2) +'월의 교정이력이 이미 있습니다.');
					$("#nextCorrDate").focus();
					check = false;
					return false;
				}
			}
			
			
			
		});
		
		$('#corrDataPopUpTable tbody tr').each(function(index, item) {
			
// 			check2 = true;
// 			if ($("#fileDiv").attr('class') == 'custom-file d-none') {
// 				check2 = false;
// 			}
			
			if(check && check2){
// 				var formData = new FormData(document.getElementById("formFile"));
				
// 				formData.append('mitCd', mitCdVal);
// 				formData.append('attachFn', $('#fileLabel').text());
// 				formData.append('corrSeq', $("#corrSeq").val());
// 				formData.append('corrGubun', $("#corrGubun").val());
// 				formData.append('corrNo', $("#corrNo").val());
// 				formData.append('corrDate', $("#corrDate").val().replace(/-/g, ''));
// 				formData.append('corrWillDate', $("#corrWillDate").val().replace(/-/g, ''));
// 				formData.append('regId', $("#userSelect").val());
				
				$.ajax({
					url : '<c:url value="/bm/corrDataListUpdate"/>',
					type : 'POST',
					async : false,
					data : {
						'mainGubun' : $('input:radio[name=mainGubun]:checked').val(),
						'mitCd' : mitCdVal,
						'attachFn' : $('#fileLabel').text(),
						'corrSeq' : $("#corrSeq").val(),
						'corrGubun' : $("#corrGubun").val(),
						'corrNo' : $("#corrNo").val(),
						'corrDate' : $("#corrDate").val().replace(/-/g, ''),
						'corrWillDate' : $("#corrWillDate").val().replace(/-/g, ''),
						'regId' : $("#userSelect").val(),
					},
// 					data : formData,
// 				    processData: false,
// 			        contentType: false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							$('#btnCorrAdd').attr('disabled', false);
							$('#btnCorrEdit').attr('disabled', false);
							$('#btnCorrDel').attr('disabled', false);
							$('#btnCorrSave').addClass('d-none');
							$('#equipCodeTable').DataTable().ajax.reload(function(){});
							$('#fileNm').attr('disabled', true);
							$('#corrDate').attr('disabled', true);
							$('#corrWillDate').attr('disabled', true);
							$('#userSelect').attr('disabled', true);

							tableIdx = null;
						} else {
							toastr.error(res.message);
						}
					}
				});
				
			}
			
		});
		
		if(check && $("#nextCorrDate").val() != ""){
			url = '<c:url value="/bm/corrWillDataListCreate"/>';
			
			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'mitCd' 		: 		mitCdVal,
					'corrGubun' 	: 		'002',
					'corrDate' 		: 		$('#nextCorrDate').val().replace(/-/g, ''),
					'corrWillDate' 	: 		'',
					'corrNo' 		: 		'',
					'attachFn' 		: 		'',
					'attachPath' 	: 		'',
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
	
			});
			
		}
		
		$('#corrDataFileTable tbody tr').each(function(index, item) {
			index++;
			if($("#fileCdNm"+index).val() != null && $("#fileCdNm"+index).val() != 'undefined' && $("#fileCdNm"+index).val() != ''){
				//값 있나없나 검사
				if (corrDataFileTable.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				formData.append('attachGubun', 'CD');
				formData.append('attachCd', mitCdVal);
				formData.append('attachSeq', '');
				formData.append('attachType', $("#corrGubun").val());
				formData.append('contents', "");
				formData.append('attchPath', fileDate);
				formData.append('attachRegDate', '');
				formData.append('etc1', $("#corrSeq").val());
				
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
		
		if(check && check2){
			if(btnView == "add"){
				toastr.success('등록되었습니다.');
			}else{
				toastr.success('수정되었습니다.');
			}
			btnView = '';
			$('#corrDataPopUpModal').modal('hide');
			$('#measureInstrmtTable').DataTable().ajax.reload(function(){});
		}
		
		
	});
	
	let equipNm = '';
	
	// 공구관리대장 데이터 가져오기
	$('#equipCodeTable tbody').on('click', 'tr',function() {
		corrWillDate = equipCodeTable.row(this).data().corrWillDate;
		if(corrWillDate != null){
			corrWillDate = corrWillDate.replace(/-/g, '');
		}
		corrCheck = equipCodeTable.row(this).data().corrCheck;
		equipNm = equipCodeTable.row(this).data().equipNm;
		$('#equipNmLabel').text("공구명: " + equipNm);
	});
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta, idx) {

		var shtml = "";

// 		if (btnDailyCheck == "") {
// 			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
// 		} else if (btnDailyCheck == "add" || btnDailyCheck == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" id="'+ id +'" name="'+ id +'" data-col="' + meta.col + '" disabled>';
// 		}
		var option;
// 		option = "<option value=''>-</option>";
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
