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
				<li class="breadcrumb-item active">기간별 생산 현황(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row" style="width:<c:out value="${1500+(baseInfoAdmListLength*60)+(noGubunLength*60)}" />px;">
							<thead class="thead-light">
								<tr>
									<th rowspan="2">작업지시번호</th>
									<th rowspan="2">고객사</th>
									<th rowspan="2">품번</th>
									<th rowspan="2">품명</th>
									<th rowspan="2" class="text-center">충진중량</th>
									<th rowspan="2">지시일자</th>
									<th rowspan="2" class="text-center">지시수량</th>
									<th rowspan="2">생산일자</th>  
									<th rowspan="2">설비명</th>
									<th rowspan="2">작업자</th>
									<th colspan="3">충진공정</th>
									<th colspan="3">비닐포장공정</th>
									<th colspan="3">박스공정</th>
									<th rowspan="2" class="text-center">불량유형</th>
									<th rowspan="2" class="text-center">작업시간</th>
									<th rowspan="2" class="text-center">비가동시간</th>							
								</tr>
								<tr>
									<th class="text-center">생산수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">생산수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">생산수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
								</tr>
							</thead>
							<tbody class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='9' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalWorkTime" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalNoTime" style="background-color: #edacb1; color: #ff0000;"></th>
								</tr>
							</tbody>
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
	let currentHref = "wmsc0440";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 생산 현황(정밀가공)");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemListVal = '';
	let equipListVal = '';

	let mainGubunVal = '002';
	let equipCdVal = '';
	let ordCorpCdVal = '';
	let itemSeqVal = '';
	
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

	
	
	
	// 기간별 생산 현황(후가공) 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>"
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
		pageLength : 2000000000,
		scrollY: '70vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/workList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return moment(startDateVal).format('YYYYMMDD');},
				'endDate'	:	function(){ return moment(endDateVal).format('YYYYMMDD');},
				'equipCd'	:	function(){ return equipCdVal;},
				'ordCorpCd'	: 	function() {return ordCorpCdVal;},
				'itemSeq'	:	function(){ return itemSeqVal;},
				'mainGubun'	:	function(){ return mainGubunVal;},
			},
		},
		columns : [
			{ data : 'workOrdNo', className : 'text-center' },  //작업지시번호
			{ data : 'ordCorpNm', className : 'text-center' }, //고객사
			{ data : 'itemSeq', className : 'text-center' }, //품번
			{ data : 'itemNm', className : 'text-center' }, //품명
			{ data : 'fillingWt', className : 'text-right',
				render : function ( data, type, row, meta ) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '';
					}
				}
			}, //충진중량
			{ data : 'regDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			}, //지시일자1
			{ data : 'dtlOrdCnt', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
			}, //지시수량
			{ data : 'workStartDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			}, //생산일자
			{ data : 'equipNm', className : 'text-center' }, //설비명
			{ data : 'workChargrNm', className : 'text-center' }, //작업자
			
			
			{ data : 'outputQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
			}, //생산수량
			{ data : 'fairQty', className : 'text-right', 
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
			}, //양품수량
			{ data : 'faultyQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
			}, //불량수량

			{ data : 'outputQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //생산수량
			{ data : 'fairQty', className : 'text-right', 
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //양품수량
			{ data : 'faultyQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //불량수량

			{ data : 'outputQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])/parseInt(row['boxCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //생산수량
			{ data : 'fairQty', className : 'text-right', 
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])/parseInt(row['boxCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //양품수량
			{ data : 'faultyQty', className : 'text-right',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(parseInt(parseInt(data)/parseInt(row['fillingCount'])/parseInt(row['boxCount'])).toFixed(0));
					} else {
						return '';
					}
				},
			}, //불량수량

			
			{ data : 'faultyTypeNm', className : 'text-right' }, //불량유형 
			{ data : 'workTime', className : 'text-right' }, //작업시간
			{ data : 'noTime', className : 'text-right' }, //비가동시간
		],
		columnDefs : [
			//{'targets' : 0, 'visible':false}
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let equipCount = 0;
			let equipOutputQty = 0;
			let equipFairQty = 0;
			let equipFaultyQty = 0;
			let equipWorkTime = 0;
			let equipNoTime = 0;
			let equipNoTimeSum = 0;

			let dateCount = 0;
			let dateOutputQty = 0;
			let dateFairQty = 0;
			let dateFaultyQty = 0;
			let dateWorkTime = 0;
			let dateNoTime = 0;
			let dateNoTimeSum = 0;

			
			let totalOutputQty = 0;
			let totalFairQty = 0;
			let totalFaultyQty = 0;
			let totalWorkTime = 0;
			let totalNoTime = 0;
			let totalNoTimeSum = 0;

			let fillingCount=0;
			let boxCount=0;

			let lastEquipNm = ''; // 기준 설비명
			let lastWorkOrdDate = ''; // 기준 지시일자
			for(var i=0;i<data.length;i++) {
				equipCount += 1;
				equipOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				equipFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				equipWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				equipNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				equipNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				dateCount += 1;
				dateOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				dateFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				dateFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				dateWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				dateNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				dateNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				totalOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				totalFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				totalFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				totalWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				totalNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				totalNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				fillingCount += parseFloat(data[i].fillingCount==null?0:data[i].fillingCount);
				boxCount += parseFloat(data[i].boxCount==null?0:data[i].boxCount);

				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(moment(data[i].workStartDate).format('YYYYMMDD') != moment(data[i+1].workStartDate).format('YYYYMMDD')) { // 지시일자가 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" colspan="7" style="background-color:#aed3ec">생산일별소계</th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+moment(data[i].workStartDate).format('YYYY-MM-DD')+'</th>';
							html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec"></th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';

							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateOutputQty/fillingCount).toFixed(0))+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFairQty/fillingCount).toFixed(0))+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFaultyQty/fillingCount).toFixed(0))+'</td>';

							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateOutputQty/fillingCount/boxCount).toFixed(0))+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFairQty/fillingCount/boxCount).toFixed(0))+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFaultyQty/fillingCount/boxCount).toFixed(0))+'</td>';
							html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateWorkTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);

						dateCount = 0;
						dateOutputQty = 0;
						dateFairQty = 0;
						dateFaultyQty = 0;
						dateWorkTime = 0;
						dateNoTime = 0;
						dateNoTimeSum = 0;

						if(equipCount != 0) {
							/* html = '';
								html += '<tr>';
								html += '	<th class="text-center" colspan="7" style="background-color:#bcecae">설비별소계</th>';
								html += '	<th class="text-center" style="background-color:#bcecae"></th>';
								html += '	<th class="text-center" style="background-color:#bcecae">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
								html += '	<th class="text-center" style="background-color:#bcecae"></th>';
								html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipOutputQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipFairQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipFaultyQty)+'</td>';
								html += '	<th class="text-center" style="background-color:#bcecae"></th>';
								html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipWorkTime)+'</td>';
								html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipNoTime)+'</td>';
								html += '</tr>';
							$(workStatusTable.row(i).node()).after(html);
	
							equipCount = 0;
							equipOutputQty = 0;
							equipFairQty = 0;
							equipFaultyQty = 0;
							equipWorkTime = 0;
							equipNoTime = 0;
							equipFuzzCnt = 0;
							equipFuzzQty = 0;
							equipRunnerQty = 0;
							equipNoTimeSum = 0; */
						}
					} else if(data[i].equipNm != data[i+1].equipNm) { // 설비명이 다를 경우
						/* let html = '';
							html += '<tr>';
							html += '	<th class="text-center" colspan="4" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
							html += '	<th class="text-center" colspan="4" style="background-color:#aed3ec">설비별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipWorkTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);
						
						equipOutputQty = 0;
						equipFairQty = 0;
						equipFaultyQty = 0;
						equipWorkTime = 0;
						equipNoTime = 0;
						equipNoTimeSum = 0; */
					}
				} else { // 마지막에 소계 전체 출력

					let html2 = '';
					html2 += '<tr style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th colspan="7" style="background-color: #edacb1; color: #ff0000;">전체합계</th>';
					html2 += '<th colspan="3" style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th class="totalOutputQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalOutputQty)+'</th>';
					html2 += '<th class="totalFairQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFairQty)+'</th>';
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyQty)+'</th>';


					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateOutputQty/fillingCount).toFixed(0))+'</th>';
					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateFairQty/fillingCount).toFixed(0))+'</th>';
					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateFaultyQty/fillingCount).toFixed(0))+'</th>';

					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateOutputQty/fillingCount/boxCount).toFixed(0))+'</th>';
					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateFairQty/fillingCount/boxCount).toFixed(0))+'</th>';
					html2 += '	<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas((dateFaultyQty/fillingCount/boxCount).toFixed(0))+'</th>';
					
					
					html2 += '<th style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th class="totalWorkTime text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalWorkTime)+'</th>';
					html2 += '<th class="totalNoTime text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalNoTime)+'</th>';
					html2 += '</tr>';
					$(workStatusTable.row(i).node()).after(html2);
					//$($('#workStatusTable').DataTable().row($('#workStatusTable').DataTable().data().count()-1).node()).after(html2);
					
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" colspan="7" style="background-color:#aed3ec">생산일별소계</th>';
						html += '	<th class="text-center" style="background-color:#aed3ec">'+moment(data[i].workStartDate).format('YYYY-MM-DD')+'</th>';
						html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec"></th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';

						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateOutputQty/fillingCount).toFixed(0))+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFairQty/fillingCount).toFixed(0))+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFaultyQty/fillingCount).toFixed(0))+'</td>';

						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateOutputQty/fillingCount/boxCount).toFixed(0))+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFairQty/fillingCount/boxCount).toFixed(0))+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas((dateFaultyQty/fillingCount/boxCount).toFixed(0))+'</td>';
						
						html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateWorkTime)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

				/* 	html = '';
						html += '<tr>';
						html += '	<th class="text-center" colspan="7" style="background-color:#bcecae">설비별소계</th>';
						html += '	<th class="text-center" style="background-color:#bcecae"></th>';
						html += '	<th class="text-center" style="background-color:#bcecae">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
						html += '	<th class="text-center" style="background-color:#bcecae"></th>';
						html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipOutputQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipFaultyQty)+'</td>';
						html += '	<th class="text-center" style="background-color:#bcecae"></th>';
						html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipWorkTime)+'</td>';
						html += '	<td class="text-right" style="background-color:#bcecae">'+addCommas(equipNoTime)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html); */

				
				}

			
			}

			
		
		
/* 			
			$('.totalOutputQty').text(addCommas(totalOutputQty));
			$('.totalFairQty').text(addCommas(totalFairQty));
			$('.totalFaultyQty').text(addCommas(totalFaultyQty));
			$('.totalWorkTime').text(addCommas(totalWorkTime));
			$('.totalNoTime').text(addCommas(totalNoTime));
			$('.totalFuzzCnt').text(addCommas(totalFuzzCnt));
			$('.totalFuzzQty').text(addCommas(totalFuzzQty));
			$('.totalRunnerQty').text(addCommas(totalRunnerQty));
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			$('.totalFaultyTypeQty${status.index}').text(addCommas(totalFaultyTypeQty${status.index}));
		</c:forEach>
			$('.totalFaultyTypeQtySum').text(addCommas(totalFaultyTypeQtySum));
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			$('.totalNoTime${status.index}').text(addCommas(totalNoTime${status.index}));
		</c:forEach>
			$('.totalNoTimeSum').text(addCommas(totalNoTimeSum)); */


			
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">지시일자</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
	    html1 += '&nbsp;<label class="input-label-sm">설비</label><div class="form-group input-sub m-0 row" style="max-width: 10%;">';  
	    html1 += '<input type="text" class="form-control" id="equipNm" name="equipNm" disabled>';
	    html1 += '<input type="hidden" class="form-control" id="equipCd" name="equipCd" disabled>';
	  	html1 += '<button type="button" id="btnordCorpCd" class="btn btn-primary input-sub-search" onClick="selectEquipCd()">';
	  	html1 += '<span class="oi oi-magnifying-glass"></span>';
	  	html1 += '</button></div>&nbsp;&nbsp;&nbsp;';
	  	html1 += '<div>';
		html1 += '<a href="javascript:void(0)" id="cancelSearchEquipCd" class="closebtn"><i class="mdi mdi-close"></i></a>';
		html1 += '</div>';
	    html1 += '&nbsp;<label class="input-label-sm">고객사</label><div class="form-group input-sub m-0 row" style="max-width: 10%;">';  
	    html1 += '<input type="text" class="form-control" id="ordCorpNm" name="ordCorpNm" disabled>';
	    html1 += '<input type="hidden" class="form-control" id="ordCorpCd" name="ordCorpCd" disabled>';
	  	html1 += '<button type="button" id="btnOrdCorpCd" class="btn btn-primary input-sub-search" onClick="selectOrdCorpCd()">';
	  	html1 += '<span class="oi oi-magnifying-glass"></span>';
	  	html1 += '</button></div>&nbsp;&nbsp;&nbsp;';
	  	html1 += '<div>';
		html1 += '<a href="javascript:void(0)" id="cancelSearchOrdCorpCd" class="closebtn"><i class="mdi mdi-close"></i></a>';
		html1 += '</div>';
		html1 += '&nbsp;<label class="input-label-sm">품목</label><div class="form-group input-sub m-0 row" style="max-width: 10%;">';  
	    html1 += '<input type="text" class="form-control" id="itemNm" name="itemNm" disabled>';
	    html1 += '<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" disabled>';
	  	html1 += '<button type="button" id="btnordCorpCd" class="btn btn-primary input-sub-search" onClick="selectItemCd()">';
	  	html1 += '<span class="oi oi-magnifying-glass"></span>';
	  	html1 += '</button></div>&nbsp;&nbsp;&nbsp;';
	  	html1 += '<div>';
		html1 += '<a href="javascript:void(0)" id="cancelSearchItemCd" class="closebtn"><i class="mdi mdi-close"></i></a>';
		html1 += '</div>';
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

	//설비조회 취소
	$('#cancelSearchEquipCd').on('click',function(){
		$('#equipNm').val('');
		$('#equipCd').val('');		
	});

	//고객사조회 취소
	$('#cancelSearchOrdCorpCd').on('click',function(){
		$('#ordCorpNm').val('');
		$('#ordCorpCd').val('');		
	});

	//품목조회 취소
	$('#cancelSearchItemCd').on('click',function(){
		$('#itemSeq').val('');
		$('#itemNm').val('');		
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		equipCdVal =  $('#equipCd').val();
		ordCorpCdVal =  $('#ordCorpCd').val();
		itemSeqVal =  $('#itemSeq').val();
		
		workStatusTable.ajax.reload(function() {});
	})
	
	//설비코드 팝업 시작
	let prcssEquipPopUpTable;
	function selectEquipCd() {
		if (prcssEquipPopUpTable == null || prcssEquipPopUpTable == 'undefined') {
			prcssEquipPopUpTable = $('#prcssEquipPopUpTable').DataTable({
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
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'prcNm' : function(){return mainGubunVal;},
					},
				},
				columns : [
					{
						data : 'equipNo',
						"className" : "text-center"
					},
					{
						data : 'equipNm',
						"className" : "text-center"
					}  
				],
				columnDefs : [],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
			
			$('#prcssEquipPopUpTable tbody').on('click', 'tr', function() {
				let data = prcssEquipPopUpTable.row(this).data();
				
				$('#equipNm').val(data.equipNm);
				$('#equipCd').val(data.equipCd);
				$('#prcssEquipPopUpModal').modal('hide');

			});
		} else {
			$('#prcssEquipPopUpTable').DataTable().ajax.reload();
		}
		$('#prcssEquipPopUpModal').modal('show');
	}
	
	//고객사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function selectOrdCorpCd() {
		popUpCheck = '고객사';
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({	
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
			pageLength : 20,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealArr' :  function(){return ['001'];},
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ {
				data : 'dealCorpNm'
			}, {
				data : 'dealCorpCd'
			}, {
				data : 'presidentNm'
			}, {
				data : 'repreItem'
			}, {
				data : 'corpNo'
			} ],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			if(popUpCheck == '고객사'){
				var data = dealCorpPopUpTable4.row(this).data();
				
				$('#ordCorpCd').val(data.dealCorpCd);
				$('#ordCorpNm').val(data.dealCorpNm);
				
				$('#dealCorpPopUpModal4').modal('hide');
			}
		});
		
		$('#dealCorpPopUpModal4').modal('show');
	}

	//품명 팝업 시작
	let itemPartPopUpTable4;
	function selectItemCd() {
		let itemGubunList = ['001','002','003']
		if(itemPartPopUpTable4 == null || itemPartPopUpTable4 == undefined)	{
			itemPartPopUpTable4 = $('#itemPartPopUpTable4').DataTable({
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
					url : '<c:url value="bm/itemPartAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : function(){return mainGubunVal;},
						'itemGubunList' : function(){return itemGubunList}
					},
				},
				rowId : '',
				columns : [ 
					{
						render : function(data,type,row,meta){
							return meta.row+1;
						}
					}, {
						data : 'itemCd'
					}, {
						data : 'itemNm'
					}, {
						data : 'itemGubunNm'
					}, {
						data : 'lhrhCdNm'
					} 
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
	
	
			$('#itemPartPopUpTable4 tbody').on('click', 'tr', function() {
				var data = itemPartPopUpTable4.row(this).data();

				$('#itemNm').val(data.itemNm);
				$('#itemSeq').val(data.itemSeq);

			 	$('#itemPartPopUpModal4').modal('hide');	
			});
		}else{
			$('#itemPartPopUpTable4').DataTable().ajax.reload(function() {});
		}
		$('#itemPartPopUpModal4').modal('show');
	} 
</script>
</body>
</html>