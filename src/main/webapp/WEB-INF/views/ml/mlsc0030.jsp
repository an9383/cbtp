<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">금형관리</a></li>
				<li class="breadcrumb-item active">금형 SHOT 이력</li>
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
								<col width="15%">
								<col width="10%">
								<col width="16%">
								<col width="16%">
								<col width="13%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>금형관리번호</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>보증SHOT</th>
									<th>누적SHOT</th>
									<th>잔여SHOT</th>
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
							<a class="nav-link active disabled" data-toggle="tab" href="#tab1" id="headTab1">일</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="headTab2">월</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="headTab3">년</a>
						</li>
					</ul> 
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						
						<div class="tab-pane fade active show" id="tab1">
							<form id="form3" enctype="multipart/form-data">
								<table class="table table-bordered" id="dayTable">
									<colgroup>
										<col width="20%"> 
										<col width="40%">
										<col width="40%">
									</colgroup>
									<thead>
										<tr>
											<th>일</th>
											<th>SHOT 수</th>
											<th>누적 SHOT</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<table class="table table-bordered" id="monthTable">
									<colgroup>
										<col width="20%"> 
										<col width="40%">
										<col width="40%">
									</colgroup>
									<thead>
										<tr>
											<th>월</th>
											<th>SHOT 수</th>
											<th>누적 SHOT</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						
						<div class="tab-pane fade" id="tab3">
							<form id="form">
								<table class="table table-bordered" id="yearTable">
									<colgroup>
										<col width="20%">
										<col width="40%">
										<col width="40%">
									</colgroup>
									<thead>
										<tr>
											<th>년</th>
											<th>SHOT 수</th>
											<th>누적 SHOT</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						
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
					<h5 class="modal-title" id="inLabel">금형 SHOT 이력 엑셀조회</h5>
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
								<th>설비관리번호</th>
								<th>설비명</th>
								<th>공정코드</th>
								<th>설비규격</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>소모품</th>
								<th>설비규격</th>
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

	let menuAuth = 'mlsc0030';
	let currentHref = "mlsc0030";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "금형 SHOT 이력"); 
	
	let stateCdVal = '';
	let equipCd = ' ';
	
	let dt = new Date();
	let com_year = dt.getFullYear();
	let selectYearVal = com_year;
    
	let mon = dt.getMonth() + 1;
	let finalMon = mon < 10 ? "0" + mon : mon;
	let selectMonthVal = com_year + finalMon;

	//공통코드 처리 시작
	let stateCdCode = new Array();
	<c:forEach items="${stateCd}" var="info">
	var json = new Object();
	if ( "${info.baseCd}" == '001' || "${info.baseCd}" == '004' ) { //AS, 양산
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		stateCdCode.push(json);
	}
	</c:forEach>
	//공통코드 처리 끝

	//메인 테이블
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
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/equipShotList"/>',
			type : 'GET',
			data : {
				'stateCd' : function(){ return stateCdVal; },
			},
		},
		columns : [
			{//금형관리번호
				data : 'equipNo'
			},
			{//차종
				data : 'itemModelNm'
			}, 
			{//품번
				data : 'itemCd'
			}, 
			{//품명
				data : 'itemNm'
			}, 
			{//보증SHOT
				data : 'warrantyLife',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
			{//누적SHOT
				data : 'accPunch',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
			{//잔여SHOT
				data : 'remainPunch',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
		],
		order : [
			[ 0, 'asc' ],
		],
		buttons : [ {
			extend : 'copy',
			title : '금형 SHOT 이력',
		}, {
			extend : 'excel',
			title : '금형 SHOT 이력',
		}, {
			extend : 'print',
			title : '금형 SHOT 이력',
		}, ],
		
	});
	
	//일 테이블
	let dayTable = $('#dayTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: '60vh',
		ajax : {
			url : '<c:url value="bm/moldDayList"/>',
			type : 'GET',
			data : {
				'equipCd' : function(){ return equipCd; },
				'selectMonth' : function(){ return selectMonthVal; },
			},
		},
		columns : [
			{
				data : 'workYear',
				render : function(data, type, row, meta) {
					if (data != null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'shotCount',
				render : function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				render : function(data, type, row, meta) {
					return '<span name="totalShot"></span>';
				},
				'className' : 'text-center'
			},
		],
		order : [],
		buttons : [],
		drawCallback: function() {
		    let api = this.api();
		    let totalShot = 0;
		    
		    for ( var i = 0; i < api.data().count(); i++ ) {
		    	totalShot += parseInt( api.row(i).data().shotCount );
				$('span[name=totalShot]').eq(i).text( addCommas(totalShot) );
			}
		    
		},
	});
	
	//월 테이블
	let monthTable = $('#monthTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: '60vh',
		ajax : {
			url : '<c:url value="bm/moldMonthList"/>',
			type : 'GET',
			data : {
				'equipCd' : function(){ return equipCd; },
				'selectMonth' : function(){ return selectYearVal; },
			},
		},
		columns : [
			{
				data : 'workYear',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data.substr(0, 4) + "-" + data.substr(4, 6);
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'shotCount',
				render : function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				render : function(data, type, row, meta) {
					return '<span name="totalShot2"></span>';
				},
				'className' : 'text-center'
			},
		],
		order : [  ],
		buttons : [],
		drawCallback: function() {
		    let api = this.api();
		    let totalShot = 0;
		    
		    for ( var i = 0; i < api.data().count(); i++ ) {
		    	totalShot += parseInt( api.row(i).data().shotCount );
				$('span[name=totalShot2]').eq(i).text( addCommas(totalShot) );
			}
		    
		},
	});
	
	//년 테이블
	let yearTable = $('#yearTable').DataTable({
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
		pageLength : -1,
		scrollY: '60vh',
		ajax : {
			url : '<c:url value="bm/moldYearList"/>',
			type : 'GET',
			data : {
				'equipCd' : function(){ return equipCd; },
			},
		},
		columns : [
			{
				data : 'workYear',
				render : function(data, type, row, meta) {
					if (data != null) {
						return moment(data).format('YYYY');
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'shotCount',
				render : function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-center'
			},
			{
				render : function(data, type, row, meta) {
					return '<span name="totalShot3"></span>';
				},
				'className' : 'text-center'
			},
		],
		order : [  ],
		buttons : [],
		drawCallback: function() {
		    let api = this.api();
		    let totalShot = 0;
		    
		    for ( var i = 0; i < api.data().count(); i++ ) {
		    	totalShot += parseInt( api.row(i).data().shotCount );
				$('span[name=totalShot3]').eq(i).text( addCommas(totalShot) );
			}
		    
		},
	});
	
	//메인 테이블 length 변경
	let html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">구분</label>'; 
	html1 += '<select class="custom-select" id="stateCd"></select>';
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/equipBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html1 += '</div>';

	$('#equipCodeTable_length').html(html1);
	selectBoxAppend(stateCdCode, "stateCd", "", "1");
	
	//일 테이블 length 변경
	let html2 = '<div class="row">&nbsp;<label class="input-label-sm">년월</label>';
	html2 += '<div class="form-group input-sub m-0 row">';
	html2 += '<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="yearMonth" disabled>';
	html2 += '</div>';
	html2 += '</div>';

	$('#dayTable_length').html(html2);
	$('#yearMonth').val(com_year + "-" + finalMon);
	
	//월 테이블 length 변경
	let html3 = '<div class="card-body p-0">';
	html3 += '<div class="row float-left">&nbsp;';
	html3 += '<label class="input-label-sm">년도</label>';
	html3 += '<div class="form-group input-sub m-0">';
	html3 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
	html3 += '</div>';
	html3 += '</div>';
	html3 += '</div>';

	$('#monthTable_length').html(html3);

	//구분 선택시
	$('#stateCd').on('change', function() {
		stateCdVal = $('#stateCd').val();
		$('#equipCodeTable').DataTable().ajax.reload(function(){});
    });
	
	//메인 테이블 행 클릭 시
	$('#equipCodeTable tbody').on('click', 'tr', function() {

		$('#headTab1').tab('show'); //일 탭
		
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		equipCd = equipCodeTable.row(this).data().equipCd;

		$.ajax({
			url : '<c:url value="bm/equipCodeAdmRead"/>',
			type : 'GET',
			data : {
				'equipCd' : function(){ return equipCd; },
			},
			success : function(res) {
				let data = res.data;
				
				$('#equipNo').val(data.equipNo);
				
				$('#headTab1').removeClass('disabled'); //일 탭
				$('#headTab2').removeClass('disabled'); //월 탭
				$('#headTab3').removeClass('disabled'); //년 탭
				
				$('#yearMonth').attr('disabled', false);
				
				selectMonthVal = $('#yearMonth').val().replace(/-/g, "");
				$('#dayTable').DataTable().ajax.reload();
				
				setTimeout(function(){
					dayTable.draw();
					dayTable.draw();
				}, 300);
			}
			
		});

	});
	
	//일 탭 클릭시
	$('#headTab1').on('click', function() {
		selectMonthVal = $('#yearMonth').val().replace(/-/g, "");
		$('#dayTable').DataTable().ajax.reload();
		
		setTimeout(function() {
			dayTable.draw();
			dayTable.draw();
		}, 300);
	});
	
	//월 탭 클릭시
	$('#headTab2').on('click', function() {
		$("#YEAR").empty();
		selectYearVal = $('#YEAR').val();
		setDateBox();
		$('#monthTable').DataTable().ajax.reload();
		
		setTimeout(function() {
			monthTable.draw();
			monthTable.draw();
		}, 300);
	});

	//년 탭 클릭시
	$('#headTab3').on('click', function() {
		$('#yearTable').DataTable().ajax.reload();
		setTimeout(function() {
			yearTable.draw();
			yearTable.draw();
		}, 300);
	});
	
	//년도 변경 시 
	$('#YEAR').on('change', function() {
		selectYearVal = $('#YEAR').val();
		$('#monthTable').DataTable().ajax.reload(function(){});
    });
	
	//년월 변경 시
	$('#yearMonth').on('change', function() {
		selectMonthVal = $('#yearMonth').val().replace(/-/g, "");
		$('#dayTable').DataTable().ajax.reload(function(){});
	});
	
	//년월 설정
	$('#yearMonth').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : com_year,
		startYear : com_year - 100,
		finalYear : com_year + 100
	});
	
	$(document).ready(function() {
       setDateBox();
    });
	
	// selectbox 연도/월 표시
	function setDateBox(){
	    // 발행 뿌려주기
	    $("#YEAR").append("<option value=''>전체</option>");
	    // 올해 기준으로 -1년부터 +5년을 보여준다.
	    for ( var y = (com_year-1); y <= (com_year+5); y++ ) {
	        $("#YEAR").append('<option value="'+ y +'"'+(y == com_year ? 'selected' : '')+'>'+ y + '년' +'</option>');
	    }
	}

</script>
</body>
</html>
