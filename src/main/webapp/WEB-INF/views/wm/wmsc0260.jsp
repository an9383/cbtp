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
				<li class="breadcrumb-item active">설비 가동율 관리</li>
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
									<th rowspan='2' class="text-center align-middle">작업지시번호</th>
									<th rowspan='2' class="text-center align-middle">설비명</th>
									<th rowspan='2' class="text-center align-middle">차종</th>
									<th rowspan='2' class="text-center align-middle">품번</th>
									<th rowspan='2' class="text-center align-middle">품명</th>
									<th colspan='2' class="text-center align-middle">금형정보</th>
									<th rowspan='2' class="text-center align-middle">양품수량</th>
									<th rowspan='2' class="text-center align-middle">가동시간(합)/분</th>
									<th rowspan='2' class="text-center align-middle">가동율(%)</th>
									<th rowspan='2' class="text-center align-middle">가동일자</th>
									<!-- <th rowspan='2' class="text-center align-middle">가동구분</th>
									<th rowspan='2' class="text-center align-middle">사유</th> -->
									<th rowspan='2' class="text-center align-middle">시작일시</th>
									<th rowspan='2' class="text-center align-middle">종료일시</th>
									<th rowspan='2' class="text-center align-middle">가동시간/분</th>
								</tr>
								<tr>
									<th class="text-center align-middle">금형코드</th>
									<th class="text-center align-middle">Cavity</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='7' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalNoTimeSum" style="background-color: #edacb1; color: #ff0000;"></th>
									<th colspan='4' style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalNoTime" style="background-color: #edacb1; color: #ff0000;"></th>
								</tr>
							</tfoot>
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
	let currentHref = "wmsc0260";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "설비가동율관리");

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
		scrollY: '65vh',
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
			{ data : 'itemCd', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'equipNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'cavity', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'fairQty', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
			{ data : 'noTimeSum', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
			{ data : 'noTimeRate', className : 'text-center',	//가동률
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{ data : 'noStartDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			//{ data : 'noGubunNm', className : 'text-center' },
			//{ data : 'noReason', className : 'text-center' },
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
			{ data : 'noTime', className : 'text-right',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		order: [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let equipFairQty = 0;
			let equipNoTimeSum = 0;
			
			let workOrdObj = []; // 작업지시별 수량 목록
			for(var i=0;i<data.length;i++) {
				console.log(equipFairQty);
				console.log(equipNoTimeSum);
				if(workOrdObj.findIndex( d => d.workOrdNo == data[i].workOrdNo) == -1) { // 작업지시별 수량 목록에 해당 작업지시가 존재하지 않을 경우
					let obj = new Object();
					obj.workOrdNo = data[i].workOrdNo;
					obj.totalFairQty = parseFloat(data[i].fairQty);
					obj.totalNoTimeSum = parseFloat(data[i].noTimeSum);
					workOrdObj.push(obj);
					equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
					equipNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);
				}
				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(data[i].equipNm != data[i+1].equipNm) { // 설비명이 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
							html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec">설비별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '	<th class="text-center" colspan="4" style="background-color:#aed3ec"></th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);
						
						equipFairQty = 0;
						equipNoTimeSum = 0;
					}
				} else {
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
						html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec">설비별소계</th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
						html += '	<th class="text-center" colspan="4" style="background-color:#aed3ec"></th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);
				}
			}

			totalFairQty = workOrdObj.map(item => item.totalFairQty).reduce((prev, curr) => prev + curr, 0);
			totalNoTimeSum = workOrdObj.map(item => item.totalNoTimeSum).reduce((prev, curr) => prev + curr, 0);

			$('.totalFairQty').text(addCommas(totalFairQty));
			$('.totalNoTimeSum').text(addCommas(totalNoTimeSum));
			$('.totalNoTime').text(addCommas(totalNoTimeSum));
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
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