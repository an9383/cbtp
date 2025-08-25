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
	<!-- 교정이력 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="corrDataPopUpModal" tabindex="-1" role="dialog" aria-labelledby="corrDataPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content" style="width: 1000px; position: absolute; left: 50%; transform: translateX(-50%);">
	        	<div class="modal-header">
		           	<h5 class="modal-title" id="corrDataPopUpLabel">교정이력사항</h5>
		           	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            	<span aria-hidden="true">&times;</span>
		           	</button>
		        </div> 
		        <div class="modal-body">
		        	<label class="float-left" id="mitNmLabel" style="font-size: 20px;">계측기명</label>
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
									<th>*교정일자</th>
									<th>실행일자</th>
									<th>작성자</th>
									<th>근거 성적서 번호</th>
									<th>첨부파일</th>
									<th>차기 예정 교정일자</th>
								</tr>
							</thead>
						</table> 수입검사관리대장(후가공)
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
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">계측기 정기점검계획대비실적(후가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="measureInstrmtTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="9%">
								<col width="9%">
								<col width="7%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="5%">
								<col width="5%">
								<col width="4%">
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
									<th rowspan="2" style="vertical-align: middle;">관리번호</th>
									<th rowspan="2" style="vertical-align: middle;">계측기명</th>
									<th rowspan="2" style="vertical-align: middle;">규격</th>
									<th rowspan="2" style="vertical-align: middle;">기기번호</th>
									<th rowspan="2" style="vertical-align: middle;">제작회사</th>
									<th rowspan="2" style="vertical-align: middle;">사용팀</th>
									<th rowspan="2" style="vertical-align: middle;">검교정주기</th>
									<th rowspan="2" style="vertical-align: middle;">최근교정일</th>
									<th rowspan="2" style="vertical-align: middle;">차기교정일</th>
									<th rowspan="2" style="vertical-align: middle;">계획/실적</th>
									<th colspan="12">검교정 계획 대비 실적</th>
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
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">계측기 엑셀조회</h5>
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
								<th>관리번호</th>
								<th>기기번호</th>
								<th>계측기명</th>
								<th>규격</th>
								<th>교정주기</th>
								<th>교정횟수</th>
								<th>제작회사</th>
								<th>위치</th>
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
	<!-- /.page-wrapper -->
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	let menuAuth = 'qmsc0180';
	let currentHref = "qmsc0180";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","계측기 정기점검계획대비실적(후가공)"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';

	
	var serverDate =  "${serverDateTo}";
	var year = serverDate.substring(0,3);
	$('#YEAR [value="'+year+'"]').attr('selected',true);		//교정이력사항 년도
    
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";
	var urlData = null;
	var mitCd = null;
	var mitCdVal = null;
	var tableIdx = null;
	var corrSeqVal = null;
	var tempCorrWillDate = serverDate;
	
	var dt = new Date();
	var com_year = dt.getFullYear();
	var corrYear = com_year;
	
	var mainGubunList = '';
	var corrDateVal = null;
	var corrWillDate = '';
	var corrCheck = '';
   
	
	//공통코드 처리 시작      
	var mitGubunCode = new Array();
	<c:forEach items="${mitGubun}" var="info"> //계측기구분
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitGubunCode.push(json);
	</c:forEach>

	var mitUnitCode = new Array();
	<c:forEach items="${mitUnit}" var="info">	//단위
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitUnitCode.push(json);
	</c:forEach>

	var mitLocCode = new Array();
	<c:forEach items="${mitLoc}" var="info">	//장비위치
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitLocCode.push(json);
	</c:forEach>

	var useFqyCode = new Array();
	<c:forEach items="${useFqy}" var="info">	//사용빈도
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useFqyCode.push(json);
	</c:forEach>

	var admDeptCode = new Array();
	<c:forEach items="${admDept}" var="info">	//부서
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	admDeptCode.push(json);
	</c:forEach>

	var mitKind = new Array();
	<c:forEach items="${mitKind}" var="info">	//기기종류
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mitKind.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">	//사용여부
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	var corrCycleCode = new Array();
	<c:forEach items="${corrCycle}" var="info">	//교정주기
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	corrCycleCode.push(json);
	</c:forEach>
	
	var mainGubunArray = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
	var userListCode = new Array(); // 작성자
	<c:forEach items="${userList}" var="info">
	var json = new Object();
	json.baseCd = "${info.userNumber}";
	json.baseNm = "${info.userNm}";
	userListCode.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth() + 1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	var day = now.getDate();
	if (day < 10) { day = "0" + day; }
	let nowDate = year + "" + mon + day;
	
	//선택박스 처리
	selectBoxAppend(mitGubunCode, "mitGubun", "", "2");
	selectBoxAppend(mitUnitCode, "mitUnit", "", "2");
	selectBoxAppend(mitLocCode, "mitLoc", "", "2");
	selectBoxAppend(useFqyCode, "useFqy", "", "2");
	selectBoxAppend(admDeptCode, "admDept", "", "2");
	selectBoxAppend(mitKind, "mitKind", "", "2");	
	selectBoxAppend(useYnCode, "useYn", "", "");	
	selectBoxAppend(corrCycleCode, "corrCycle", "", "2");	
	selectBoxAppend(mainGubunArray, "mainGubun", "", "2");

 
	// 목록
	let measureInstrmtTable = $('#measureInstrmtTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
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
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/measureInstrmtAdmList"/>',
			type : 'GET',
			data : {
				'corrYear' : function(){return corrYear;},
				'corrGubun' : function(){return '001';},
				'mainGubun' : '002'
			},
		},
		rowId : 'mitCd',
		columns : [ 
			{//관리번호
				data : 'admNo'
			}, 
			{//계측기명
				data : 'mitNm'
			}, 
			{//규격
				data : 'modelNm'
			}, 
			{//기기번호
				data : 'mitNo'
			}, 
			{//제작회사
				data : 'mfcCorpNm'
			}, 
			{//사용팀
				data : 'admDeptNm'
			}, 
			{//검교정주기
				render: function(data, type, row, meta) {
					return row['corrCount'] + '회 / ' + row['corrCycleNm'];
				}
			}, 
			{//최근교정일
				data : 'corrDate',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
			{//차기교정일
				data : 'corrWillDate',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
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
		],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '계측기 정기점검계획대비실적'
		}, 'print' ],
// 		drawCallback : function() {
//         	var api = this.api();
//         	for(var i = 0; i < api.data().count(); i++) {
//         		if (api.row(i).data().useYn == '002'){
//         			$('#'+api.row(i).data().admNo).find("td").eq(0).css("color", "red");
//             	}
//         	}
//         }
	});


	var html1 = '<div class="col-sm-10">';
	html1 += '<label class="float-left input-label-sm">년도</label>';
// 	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="YEAR" name="YEAR" class="select w80 col-12 custom-select" onChange="yearOnchange()">';
	html1 += '</select>&nbsp;&nbsp;&nbsp;';
	html1 += '<label style="font-size:14px; color: red;" class="float-right input-label-sm">●</label>';
	html1 += '<label style="font-size:14px;" class="float-right input-label-sm mr-0">*범례&nbsp;-&nbsp;계획○&nbsp;&nbsp;실적●&nbsp;&nbsp;기간초과</label>';
    html1 += '</div>';

	$('#measureInstrmtTable_length').html(html1);
	setDateBox();
	
	function yearOnchange(){
		corrYear = $("#YEAR").val();
		
		$('#measureInstrmtTable').DataTable().ajax.reload();
		
	}
	
	// select box 년도 표시
	function setDateBox(){
	   // 발행 뿌려주기
	   $("#YEAR").append("<option value=''>년도</option>");
	   // 올해 기준으로 -100년부터 +100년을 보여준다.
	   for(var y = (com_year-100); y <= (com_year+100); y++){
	       $("#YEAR").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '년' +'</option>');
	   }
	}
	
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
	 				'corrGubun' : function() {return '001';},
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
							return '<input type="text" class="form-control" id="corrNo" style="min-width:100%"/>';
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
	
	//교정이력사항 수정 버튼
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
	
	//교정이력사항 삭제 버튼
	$('#btnCorrDataDel').on('click', function() {
		$('#deleteModal').modal('show');
	});
	
	//삭제 모달 버튼
	$('#btnDeleteConfirm').on('click', function() {
		btnView = 'add';
// 		if(tableIdx==null){
// 			toastr.warning("수정할 항목을 선택해주세요.");
// 			return false;
// 		}

		$.ajax({
			url : '<c:url value="bm/corrDataListDelete" />',
			type : 'GET',
			data : {
				'mitCd' : function(){return mitCdVal;},
				'corrDateVal' : function() {return corrDateVal;},
				'corrGubun' : function() {return '001';},
				'attachGubun' : function() {return 'CD';},
				'attachCd' : function() {return mitCdVal;},
				'attachType' : function() {return '001';},
				'etc1' : function() {return $('#corrSeq').val();},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("삭제되었습니다.");
					$('#measureInstrmtTable').DataTable().ajax.reload(function(){});
					$('#deleteModal').modal('hide');
					$('#corrDataPopUpModal').modal('hide');
				}else {
					toastr.error(res.message);
				}
			}
		});
	});
	
	//교정이력사항 저장 버튼
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
				//교정일자 중복 체크
				var corrCheck = false;
				$.ajax({
					url : '<c:url value="bm/attachCorreDataList"/>',
					type : 'GET',
					async : false,
					data : {
		 				'mitCd' : function() {return mitCdVal;},
		 				'corrDateCheck' : function() {return $('#corrDate').val().replace(/-/g, '').substr(0, 6);},
		 				'corrGubun' : function() {return '001';},
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
				
				//차기 예정 교정일자 중복 체크
				var nextCorrCheck = false;
				$.ajax({
					url : '<c:url value="bm/attachCorreDataList"/>',
					type : 'GET',
					async : false,
					data : {
		 				'mitCd' : function() {return mitCdVal;},
		 				'corrDateCheck' : function() {return $('#nextCorrDate').val().replace(/-/g, '').substr(0, 6);},
		 				'corrGubun' : function() {return '001';},
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
					'corrGubun' 	: 		'001',
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
	
	let mitNm = '';
	
	// 계측기관리 기본정보 보기
	$('#measureInstrmtTable tbody').on('click', 'tr',function() {
		corrWillDate = measureInstrmtTable.row(this).data().corrWillDate;
		if(corrWillDate != null){
			corrWillDate = corrWillDate.replace(/-/g, '');
		}
		corrCheck = measureInstrmtTable.row(this).data().corrCheck;
		mitNm = measureInstrmtTable.row(this).data().mitNm;
		$('#mitNmLabel').text("계측기명: " + mitNm);
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
