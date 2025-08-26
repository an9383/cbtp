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
				<li class="breadcrumb-item active">기간별 생산 현황(봉제)</li>
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
									<th rowspan='2'>작업지시번호</th>
									<th rowspan='2'>생산일자</th>
									<th rowspan='2'>설비명</th>
									<th rowspan='2'>작업자</th>
									<th rowspan='2'>차종</th>
									<th rowspan='2'>품번</th>
									<th rowspan='2'>품명</th>
									<th rowspan='2'>고객사</th>
									<th rowspan='2'>공정</th>
									<th colspan='2'>철형정보</th>
									<th rowspan='2' class="text-center">생산수량</th>
									<th rowspan='2' class="text-center">양품수량</th>
									<th rowspan='2' class="text-center">불량수량</th>
									<th colspan='<c:out value="${baseInfoAdmListLength}" />'>불량유형별</th>
								</tr>
								<tr>
									<th>철형코드</th>
									<th>Cavity</th>
									<c:forEach items="${baseInfoAdmList}" var="info">
										<th class="text-center">${info.baseInfoNm}</th>
									</c:forEach>
									<th class="text-center">합계</th>
								</tr>
							</thead>
							<tbody class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='15' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
										<th class='totalFaultyTypeQty${status.index}' style="background-color: #edacb1; color: #ff0000;"></th>
									</c:forEach>
									<th class="totalFaultyTypeQtySum" style="background-color: #edacb1; color: #ff0000;"></th>
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
	let currentHref = "wmsc0221";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 생산 현황(봉제)");

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
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: '70vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/workListByBongjae"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return moment(startDateVal).format('YYYYMMDD');},
				'endDate'	:	function(){ return moment(endDateVal).format('YYYYMMDD');},
				'itemSeq'	:	function(){ return itemListVal;},
				'equipCd'	:	function(){ return equipListVal;},
				'mainGubun'	:	"002"
			},
		},
		columns : [
			{ data : 'workOrdNo', className : 'text-center' }, 
			{ data : 'workOrdDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data : 'equipNm', className : 'text-center' },
			{ data : 'workChargrNm', className : 'text-center' },
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'itemCd', className : 'text-center' },
			{ data : 'itemNm', className : 'text-center' },
			{ data : 'itemCusNm', className : 'text-center' },
			{ data : 'prcssNm', className : 'text-center' },
			{ data : 'equipNo', className : 'text-center' },
			{ data : 'cavity', className : 'text-center' },
			{ data : 'outputQty', className : 'text-right' },
			{ data : 'fairQty', className : 'text-right' },
			{ data : 'faultyQty', className : 'text-right' },
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			{ data : 'faultyTypeQty${status.index}', className : 'text-right' },
		</c:forEach>
			{ data : 'faultyTypeQtySum', className : 'text-right' },
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
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let equipFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let equipFaultyTypeQtySum = 0;
	

			let dateCount = 0;
			let dateOutputQty = 0;
			let dateFairQty = 0;
			let dateFaultyQty = 0;
			
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let dateFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let dateFaultyTypeQtySum = 0;
		

			
			let totalOutputQty = 0;
			let totalFairQty = 0;
			let totalFaultyQty = 0;
			
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let totalFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let totalFaultyTypeQtySum = 0;

			let lastEquipNm = ''; // 기준 설비명
			let lastWorkOrdDate = ''; // 기준 생산일자
			for(var i=0;i<data.length;i++) {
				equipCount += 1;
				equipOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				equipFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				equipFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				equipFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);

				dateCount += 1;
				dateOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				dateFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				dateFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				dateFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				dateFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);

				totalOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				totalFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				totalFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				totalFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				totalFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);

				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(moment(data[i].workOrdDate).format('YYYYMMDD') != moment(data[i+1].workOrdDate).format('YYYYMMDD')) { // 생산일자가 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" colspan="" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>';
							html += '	<th class="text-center" colspan="9" style="background-color:#aed3ec">생산일별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);

						dateCount = 0;
						dateOutputQty = 0;
						dateFairQty = 0;
						dateFaultyQty = 0;
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						dateFaultyTypeQty${status.index} = 0;
					</c:forEach>
						dateFaultyTypeQtySum = 0;

						if(equipCount != 0) {
							html = '';
								html += '<tr>';
								html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec"></th>';
								html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
								html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
							<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
							</c:forEach>
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
								html += '</tr>';
							$(workStatusTable.row(i).node()).after(html);
	
							equipCount = 0;
							equipOutputQty = 0;
							equipFairQty = 0;
							equipFaultyQty = 0;
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							equipFaultyTypeQty${status.index} = 0;
						</c:forEach>
							equipFaultyTypeQtySum = 0;
						}
					} else if(data[i].equipNm != data[i+1].equipNm) { // 설비명이 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
							html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);
						
						equipOutputQty = 0;
						equipFairQty = 0;
						equipFaultyQty = 0;
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						equipFaultyTypeQty${status.index} = 0;
					</c:forEach>
						equipFaultyTypeQtySum = 0;
					}
				} else { // 마지막에 소계 전체 출력

					let html2 = '';
					html2 += '<tr style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th colspan="11" style="background-color: #edacb1; color: #ff0000;">전체합계</th>';
					html2 += '<th class="totalOutputQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalOutputQty)+'</th>';
					html2 += '<th class="totalFairQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFairQty)+'</th>';
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyQty)+'</th>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
					html2 += '<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+ addCommas(totalFaultyTypeQty${status.index})+'</th>';
					 </c:forEach>
					html2 += '<th class="totalFaultyTypeQtySum text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyTypeQtySum)+'</th>';
					html2 += '</tr>';
					$(workStatusTable.row(i).node()).after(html2);
					//$($('#workStatusTable').DataTable().row($('#workStatusTable').DataTable().data().count()-1).node()).after(html2);
					
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" colspan="" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>';
						html += '	<th class="text-center" colspan="9" style="background-color:#aed3ec">생산일별소계</th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

					html = '';
						html += '<tr>';
						html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
						html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

				}

			}
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">생산일자</label>';
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
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change',function() {
		endDateVal = $(this).val();
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