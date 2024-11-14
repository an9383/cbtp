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
				<li class="breadcrumb-item active">기간별 작업조건 현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row" style="width: 4000px;">
							<thead class="thead-light">
								<tr>
									<th rowspan='2' class="text-center align-middle">작업지시번호</th>
									<th rowspan='2' class="text-center align-middle">생산지시일</th>
									<th rowspan='2' class="text-center align-middle">설비명</th>
									<th rowspan='2' class="text-center align-middle">품번</th>
									<th rowspan='2' class="text-center align-middle">품명</th>
									<th colspan='2' class="text-center align-middle">금형정보</th>
									<th rowspan='2' class="text-center align-middle">차수</th>
									<th colspan='2' class="text-center align-middle">NZ온도</th>
									<th colspan='2' class="text-center align-middle">H1온도</th>
									<th colspan='2' class="text-center align-middle">H2온도</th>
									<th colspan='2' class="text-center align-middle">H3온도</th>
									<th colspan='2' class="text-center align-middle">H4온도</th>
									<th colspan='2' class="text-center align-middle">계량거리 1차</th>
									<th colspan='2' class="text-center align-middle">계량거리 2차</th>
									<th colspan='2' class="text-center align-middle">계량거리 3차</th>
									<th colspan='2' class="text-center align-middle">계량거리 4차</th>
									<th colspan='2' class="text-center align-middle">석백</th>
									<th colspan='2' class="text-center align-middle">사출압력 1차</th>
									<th colspan='2' class="text-center align-middle">사출압력 2차</th>
									<th colspan='2' class="text-center align-middle">사출압력 3차</th>
									<th colspan='2' class="text-center align-middle">사출속도 1차</th>
									<th colspan='2' class="text-center align-middle">사출속도 2차</th>
									<th colspan='2' class="text-center align-middle">사출속도 3차</th>
									<th colspan='2' class="text-center align-middle">사출거리 1차</th>
									<th colspan='2' class="text-center align-middle">사출거리 2차</th>
									<th colspan='2' class="text-center align-middle">사출거리 3차</th>
									<th colspan='2' class="text-center align-middle">배압 1차</th>
									<th colspan='2' class="text-center align-middle">배압 2차</th>
									<th colspan='2' class="text-center align-middle">배압 3차</th>
									<th colspan='2' class="text-center align-middle">배압 4차</th>
									<th colspan='2' class="text-center align-middle">보압 1차</th>
									<th colspan='2' class="text-center align-middle">보압 2차</th>
									<th colspan='2' class="text-center align-middle">보압 3차</th>
									<th colspan='2' class="text-center align-middle">보압속도 1차</th>
									<th colspan='2' class="text-center align-middle">보압속도 2차</th>
									<th colspan='2' class="text-center align-middle">보압속도 3차</th>
									<th colspan='2' class="text-center align-middle">온도조절기</th>
									<th colspan='2' class="text-center align-middle">작동유</th>
									<th colspan='2' class="text-center align-middle">냉각수 IN</th>
									<th colspan='2' class="text-center align-middle">냉각수 OUT</th>
									<th colspan='2' class="text-center align-middle">고정측 온도</th>
									<th colspan='2' class="text-center align-middle">이동측 온도</th>
									<th colspan='3' class="text-center align-middle">내측 고정측 온도</th>
									<th colspan='3' class="text-center align-middle">내축 이동측 온도</th>
								</tr>
								<tr>
									<th class="text-center align-middle">금형코드</th>
									<th class="text-center align-middle">Cavity</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">1</th>
									<th class="text-center align-middle">2</th>
									<th class="text-center align-middle">3</th>
									<th class="text-center align-middle">1</th>
									<th class="text-center align-middle">2</th>
									<th class="text-center align-middle">3</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<script>
	let currentHref = "wmsc0250";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 작업조건 현황");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemListVal = '';
	let equipListVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	let itemList = new Array(); // 제품 목록
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	let equipList = new Array(); // 설비 목록
	<c:forEach items="${equipList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipList.push(json);
	</c:forEach>

	
	
	
	// 기간별 생산 현황 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
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
		pageLength : -1,
		scrollY: '65vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/workConditionList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return startDateVal;},
				'endDate'	:	function(){ return endDateVal;},
				'itemSeq'	:	function(){ return itemListVal;},
				'equipCd'	:	function(){ return equipListVal;}
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'workOrdDate', className : 'text-center align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemCd', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'equipNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'cavity', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'histSeqNm', className : 'text-center' },
			{ data : 'stNzTemperature', className : 'text-center' },
			{ data : 'cdNzTemperature', className : 'text-center' },
			{ data : 'stH1Temperature', className : 'text-center' },
			{ data : 'cdH1Temperature', className : 'text-center' },
			{ data : 'stH2Temperature', className : 'text-center' },
			{ data : 'cdH2Temperature', className : 'text-center' },
			{ data : 'stH3Temperature', className : 'text-center' },
			{ data : 'cdH3Temperature', className : 'text-center' },
			{ data : 'stH4Temperature', className : 'text-center' },
			{ data : 'cdH4Temperature', className : 'text-center' },
			{ data : 'stChgPosition1', className : 'text-center' },
			{ data : 'cdChgPosition1', className : 'text-center' },
			{ data : 'stChgPosition2', className : 'text-center' },
			{ data : 'cdChgPosition2', className : 'text-center' },
			{ data : 'stChgPosition3', className : 'text-center' },
			{ data : 'cdChgPosition3', className : 'text-center' },
			{ data : 'stChgPosition4', className : 'text-center' },
			{ data : 'cdChgPosition4', className : 'text-center' },
			{ data : 'stSuckBack', className : 'text-center' },
			{ data : 'cdSuckBack', className : 'text-center' },
			{ data : 'stInjPressure1', className : 'text-center' },
			{ data : 'cdInjPressure1', className : 'text-center' },
			{ data : 'stInjPressure2', className : 'text-center' },
			{ data : 'cdInjPressure2', className : 'text-center' },
			{ data : 'stInjPressure3', className : 'text-center' },
			{ data : 'cdInjPressure3', className : 'text-center' },
			{ data : 'stInjVelocity1', className : 'text-center' },
			{ data : 'cdInjVelocity1', className : 'text-center' },
			{ data : 'stInjVelocity2', className : 'text-center' },
			{ data : 'cdInjVelocity2', className : 'text-center' },
			{ data : 'stInjVelocity3', className : 'text-center' },
			{ data : 'cdInjVelocity3', className : 'text-center' },
			{ data : 'stInjPosition1', className : 'text-center' },
			{ data : 'cdInjPosition1', className : 'text-center' },
			{ data : 'stInjPosition2', className : 'text-center' },
			{ data : 'cdInjPosition2', className : 'text-center' },
			{ data : 'stInjPosition3', className : 'text-center' },
			{ data : 'cdInjPosition3', className : 'text-center' },
			{ data : 'stBackPressure1', className : 'text-center' },
			{ data : 'cdBackPressure1', className : 'text-center' },
			{ data : 'stBackPressure2', className : 'text-center' },
			{ data : 'cdBackPressure2', className : 'text-center' },
			{ data : 'stBackPressure3', className : 'text-center' },
			{ data : 'cdBackPressure3', className : 'text-center' },
			{ data : 'stBackPressure4', className : 'text-center' },
			{ data : 'cdBackPressure4', className : 'text-center' },
			{ data : 'stHldPressure1', className : 'text-center' },
			{ data : 'cdHldPressure1', className : 'text-center' },
			{ data : 'stHldPressure2', className : 'text-center' },
			{ data : 'cdHldPressure2', className : 'text-center' },
			{ data : 'stHldPressure3', className : 'text-center' },
			{ data : 'cdHldPressure3', className : 'text-center' },
			{ data : 'stHldVel1', className : 'text-center' },
			{ data : 'cdHldVel1', className : 'text-center' },
			{ data : 'stHldVel2', className : 'text-center' },
			{ data : 'cdHldVel2', className : 'text-center' },
			{ data : 'stHldVel3', className : 'text-center' },
			{ data : 'cdHldVel3', className : 'text-center' },
			{ data : 'stThermostat', className : 'text-center' },
			{ data : 'cdThermostat', className : 'text-center' },
			{ data : 'stHydraulicOil', className : 'text-center' },
			{ data : 'cdHydraulicOil', className : 'text-center' },
			{ data : 'stCoolwaterIn', className : 'text-center' },
			{ data : 'cdCoolwaterIn', className : 'text-center' },
			{ data : 'stCoolwaterOut', className : 'text-center' },
			{ data : 'cdCoolwaterOut', className : 'text-center' },
			{ data : 'stMoldFixed', className : 'text-center' },
			{ data : 'cdMoldFixed', className : 'text-center' },
			{ data : 'stMoldMoving', className : 'text-center' },
			{ data : 'cdMoldMoving', className : 'text-center' },
			{ data : 'inFixTemp1', className : 'text-center' },
			{ data : 'inFixTemp2', className : 'text-center' },
			{ data : 'inFixTemp3', className : 'text-center' },
			{ data : 'inMoveTemp1', className : 'text-center' },
			{ data : 'inMoveTemp2', className : 'text-center' },
			{ data : 'inMoveTemp3', className : 'text-center' },
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		orderFixed : [[1, 'asc'],[2, 'desc']],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let workOrdNoChange = -1;
			$('#workStatusTable tbody tr').each(function(index, value) {
			    if(workOrdNoChange == 1) {
			    	$(value).addClass('bg-light');
				}

				if(index+1 != data.length) { // 마지막 데이터가 아닐 경우
					if($(value).attr('id') != $(value).next().attr('id')) {
						workOrdNoChange = workOrdNoChange * -1;
					}
				}
			});
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">생산지시일자</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
	    html1 += '	<label class="input-label-sm mr-2">제품</label>';
	    html1 += '	<select class="custom-select mr-4" id="itemList"></select>';
	    html1 += '	<label class="input-label-sm mr-2">설비</label>';
	    html1 += '	<select class="custom-select mr-2" id="equipList"></select>';
	    html1 += '	<button type="button"  class="btn btn-primary mr-2" id="btnSearch">조회</button>';
	    html1 += '</div>';
	    
	$('#workStatusTable_length').html(html1);
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	selectBoxAppend(itemList, "itemList", "", "1");
	selectBoxAppend(equipList, "equipList", "", "1");

	// 시작일 변경
	$('#startDate').on('change',function() {
		startDateVal = $(this).val();
		//endDateVal = moment($(this).val()).add('1','M').format('YYYY-MM-DD')
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change',function() {
		endDateVal = $(this).val();
		//startDateVal = moment($(this).val()).subtract('1','M').format('YYYY-MM-DD')
		$('#startDate').val(startDateVal);
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		itemListVal = $('#itemList').val();
		equipListVal = $('#equipList').val();
		workStatusTable.ajax.reload(function() {});
	})
	
</script>
</body>
</html>