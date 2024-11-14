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
				<li class="breadcrumb-item active">설비 가동율 현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th class="text-center align-middle">작업지시번호</th>
									<th class="text-center align-middle">설비명</th>
									<th class="text-center align-middle">차종</th>
									<th class="text-center align-middle">품명</th>
									<th class="text-center align-middle">작업시작일자</th>
									<th class="text-center align-middle">작업종료일자</th>
									<th class="text-center align-middle">가동시간/분</th>
									<th class="text-center align-middle">비가동시간/분</th>
									<th class="text-center align-middle">가동율(%)</th>
									<th class="text-center align-middle">비가동율(%)</th>
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
	let currentHref = "mmsc0230";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비가동율현황");

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
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 2000000000,
		scrollY: '70vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		rowGroup: false,
		ajax : {
			url : '<c:url value="wm/uptimeList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return startDateVal;},
				'endDate'	:	function(){ return endDateVal;},
				'itemSeq'	:	function(){ return itemListVal;},
				'equipCd'	:	function(){ return equipListVal;}
			},
		},
		columns : [
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemModelNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },
			{ className : 'text-center',
				render : function(data, type, row, meta) {
					if(row['noStartDate'] != '' && row['noStartDate'] != null) {
						if(row['noStartTime'] != '' && row['noStartTime'] != null) {
							return moment(row['noStartDate'],'YYYYMMDD').format('YYYY-MM-DD') + ' ' + row['noStartTime'];
						} else {
							return '';
						}
					} else {
						return '';
					}
				}
			},
			{ className : 'text-center',
				render : function(data, type, row, meta) {
					if(row['noEndDate'] != '' && row['noEndDate'] != null) {
						if(row['noEndTime'] != '' && row['noEndTime'] != null) {
							return moment(row['noEndDate'],'YYYYMMDD').format('YYYY-MM-DD') + ' ' + row['noEndTime'];
						} else {
							return '';
						}
					} else {
						return '';
					}
					
				}
			},
			{ data : 'noTimeSum', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data==null?"0":data));
				}
			},
			{ data : 'biTimeSum', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data==null?"0":data));
				}
			},
			{ data : 'noTimeRate', className : 'text-center',	//가동률
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{ data : 'biTimeRate', className : 'text-center',	//가동률
				render : function(data, type, row, meta) {
					return data;
				}
			},
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		order: [],
		drawCallback: function() {
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">가동일자</label>';
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