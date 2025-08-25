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
				<li class="breadcrumb-item active">기간별 자재사용 현황(레이저)</li>
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
									<th class="text-center align-middle">구분</th>
									<th class="text-center align-middle">작업지시번호</th>
									<th class="text-center align-middle">지시일</th>
									<th class="text-center align-middle">제품명</th>
									<th class="text-center align-middle">설비명</th>
									<th class="text-center align-middle">단위</th>
									<th class="text-center align-middle">자재코드</th>
									<th class="text-center align-middle">자재명</th>
									<th class="text-center align-middle">사용수량</th>
									<th class="text-center align-middle">자재LOTNO</th>
									<th class="text-center align-middle">담당자</th>
								</tr>
	
							</thead>
							<tfoot class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='8' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<!-- <th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th> -->
									<th class="totalUseQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<!-- <th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th> -->
									<th colspan='2' style="background-color: #edacb1; color: #ff0000;"></th>
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
	let currentHref = "wmsc0230";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 자재사용 현황(레이저)");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemListVal = '';
	let equipListVal = '';
	let mainGubunVal = '001';

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
			url : '<c:url value="wm/materialList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return moment(startDateVal).format('YYYYMMDD');},
				'endDate'	:	function(){ return moment(endDateVal).format('YYYYMMDD');},
				'mainGubun'	:	function(){ return mainGubunVal;},
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{ data : 'itemGubunNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'workOrdDate', className : 'text-center align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
		    },
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemUnitNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'partCd', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'partNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'useQty', className : 'text-right align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			}, //
			{ data : 'barcodeNo', className : 'text-center align-top' },
			{ data : 'workChargrNm', className : 'text-center align-top' },
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalOutputQty = 0;
			let totalUseQty = $('#workStatusTable').DataTable().column(8,{ page: 'current'} ).data().sum();
			let totalFaultyQty = 0;
			let totalTotalConsumpt = 0;

			$('.totalOutputQty').text(addCommas(totalOutputQty));
			$('.totalUseQty').text(addCommas(totalUseQty));
			$('.totalFaultyQty').text(addCommas(totalFaultyQty));
			$('.totalTotalConsumpt').text(addCommas(totalTotalConsumpt));
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">사용일</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
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

	//품목조회 취소
	$('#cancelSearchItemCd').on('click',function(){
		$('#itemSeq').val('');
		$('#itemNm').val('');		
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		itemSeqVal =  $('#itemSeq').val();
		workStatusTable.ajax.reload(function() {});
	})
	
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