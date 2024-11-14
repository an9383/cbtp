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
				<li class="breadcrumb-item active">기간별 비가동 현황(레이저)</li>
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
									<th class="text-center align-middle">품번</th>
									<th class="text-center align-middle">품명</th>
									<th class="text-center align-middle">생산수량</th>
									<th class="text-center align-middle">양품수량</th>
									<th class="text-center align-middle">불량수량</th>
									<th class="text-center align-middle">비가동일자</th>
									<th class="text-center align-middle">비가동시간(합)/분</th>
									<th class="text-center align-middle">비가동구분</th>
									<th class="text-center align-middle">사유</th>
									<th class="text-center align-middle">시작일시</th>
									<th class="text-center align-middle">종료일시</th>
									<th class="text-center align-middle">비가동시간/분</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='4' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalNoTimeSum" style="background-color: #edacb1; color: #ff0000;"></th>
									<th colspan='5' style="background-color: #edacb1; color: #ff0000;"></th>
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
	let currentHref = "wmsc0240";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 비가동 현황(레이저)");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemListVal = '';
	let equipListVal = '';
	
	let mainGubunVal = '001';
	let equipCdVal = '';
	
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
		dom : "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>"
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
		pageLength : -1,
		scrollY: '65vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		rowGroup: false,
		ajax : {
			url : '<c:url value="wm/downtimeList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return startDateVal;},
				'endDate'	:	function(){ return endDateVal;},
				'equipCd'	:	function(){ return equipCdVal;},
				'mainGubun'	:	function(){ return mainGubunVal;},
			},
		},
		columns : [
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' },	//작업지시번호
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' },		//설비명
			{ data : 'itemSeq', className : 'text-center align-top', name: 'rowspan' },		//품번
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },		//품명
			{ data : 'outputQty', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},	//생산수량
			{ data : 'fairQty', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},	//양품수량
			{ data : 'faultyQty', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},	//불량수량
			{ data : 'noStartDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},	//비가동일자
			{ data : 'noTimeSum', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},	//비가동시간(합) / 분
			{ data : 'noGubunNm', className : 'text-center' },	//비가동구분
			{ data : 'noReason', className : 'text-center' },	//사유
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
			},	//시작일시
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
			},	//종료일시
			{ data : 'noTime', className : 'text-right',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},	//비가동시간 /분
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		order: [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let equipOutputQty = 0;
			let equipFairQty = 0;
			let equipFaultyQty = 0;
			let equipNoTimeSum = 0;
			
			let workOrdObj = []; // 작업지시별 수량 목록
			for(var i=0;i<data.length;i++) {
				console.log(equipOutputQty);
				console.log(equipFairQty);
				console.log(equipFaultyQty);
				console.log(equipNoTimeSum);
				if(workOrdObj.findIndex( d => d.workOrdNo == data[i].workOrdNo) == -1) { // 작업지시별 수량 목록에 해당 작업지시가 존재하지 않을 경우
					let obj = new Object();
					obj.workOrdNo = data[i].workOrdNo;
					obj.totalOutputQty = parseFloat(data[i].outputQty);
					obj.totalFairQty = parseFloat(data[i].fairQty);
					obj.totalFaultyQty = parseFloat(data[i].faultyQty);
					obj.totalNoTimeSum = parseFloat(data[i].noTimeSum);
					workOrdObj.push(obj);
					equipOutputQty += parseFloat(data[i].fairQty==null?0:data[i].outputQty);
					equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
					equipFaultyQty += parseFloat(data[i].fairQty==null?0:data[i].faultyQty);
					equipNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);
				}
				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(data[i].equipNm != data[i+1].equipNm) { // 설비명이 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
							html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec">설비별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec"></th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);
						
						equipOutputQty = 0;
						equipFairQty = 0;
						equipFaultyQty = 0;
						equipNoTimeSum = 0;
					}
				} else {
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
						html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec">설비별소계</th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
						html += '	<th class="text-center" colspan="5" style="background-color:#aed3ec"></th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);
				}
			}

			totalOutputQty = workOrdObj.map(item => item.totalOutputQty).reduce((prev, curr) => prev + curr, 0);
			totalFairQty = workOrdObj.map(item => item.totalFairQty).reduce((prev, curr) => prev + curr, 0);
			totalFaultyQty = workOrdObj.map(item => item.totalFaultyQty).reduce((prev, curr) => prev + curr, 0);

			totalNoTimeSum = workOrdObj.map(item => item.totalNoTimeSum).reduce((prev, curr) => prev + curr, 0);

			$('.totalOutputQty').text(addCommas(totalOutputQty));
			$('.totalFairQty').text(addCommas(totalFairQty));
			$('.totalFaultyQty').text(addCommas(totalFaultyQty));
			$('.totalNoTimeSum').text(addCommas(totalNoTimeSum));
			$('.totalNoTime').text(addCommas(totalNoTimeSum));
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">비가동일자</label>';
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
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		equipCdVal =  $('#equipCd').val();
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
	
</script>
</body>
</html>