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
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">제품출고현황(정밀가공)</li>
			</ol>
		</nav> 
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="deliveryOrderAdmTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th>출고일자</th>
									<th>고객사</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">수주수량</th>
									<th class="text-center">출고수량</th>
									<th class="text-center">출고단가</th>
									<th class="text-center">공급가액</th>
									<th class="text-center">부가세</th>
									<th class="text-center">합계</th>
									<th>수주상세번호</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th class="text-right" colspan="4">합 계</th>
									<th class="text-left sujuTotal" id="sujuTotal"></th>
									<th class="text-right salesTotal" id="salesTotal"></th>
									<th></th>
									<th class="text-right storeTotal" id="storeTotal"></th>
									<th class="text-right ratio" id="ratio"></th>
									<th class="text-right sumTo" id="sumTo"></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0300";
	let currentPage = $('.' + currentHref).attr('id');
	

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","제품출고현황(정밀가공)"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var lhrhOption = '';
	var ordCorpCdVal = '';
	let itemSeqVal = '';
	let mainGubunVal='';

	var ordCorpCdCode = new Array();
	<c:forEach items="${ordCorpCdList}" var="info">
	var json = new Object();
	json.baseCd = "${info.dealCorpCd}";
	json.baseNm = "${info.dealCorpNm}";
	ordCorpCdCode.push(json);
	</c:forEach>
	
	var lhrhCode = new Array();
	<c:forEach items="${lhrhList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	lhrhCode.push(json);
	</c:forEach>

	//제품출고현황 목록조회
	let deliveryOrderAdmTable = $('#deliveryOrderAdmTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,	
		destroy : true,	
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: "550px",
		pageLength : 100000,
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				'doStatus2' : function(){return '001'},
				'mainGubun' : function(){return '002'},
				'startDate' : function(){return serverDateFrom.replace(/-/g,'')},
				'endDate' : function(){return serverDateTo.replace(/-/g,'')},
			},
		},
		rowId : '',
		columns : [ 
			{
				data : 'doDate',
				render : function(data, type, row, meta) {
					return data!=null?moment(data).format('YYYY-MM-DD'):'';
				},
			},
			{data : 'ordCorpNm'},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				}, "className": "text-right" 	
			},
			{
				data : 'dpQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				}, "className": "text-right" 	
			},	
			{
				data :'exportCost',
				render: function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}, "className": "text-right" 	
			},
			{
				data :'supplyPrice',
				render: function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}, "className": "text-right" 	
			},
			{
				data :'vat',
				render: function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}, "className": "text-right" 	
			},
			{
				data :'total',
				render: function(data, type, row, meta) {
					if(data != null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}, "className": "text-right" 	
			},
			{data : 'contDtlNo'},
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    drawCallback: function(){
	    	$('#deliveryOrderAdmTable tfoot').remove();
	    	
	    	let sum1 = $('#deliveryOrderAdmTable').DataTable().column(4,{ page: 'all'} ).data().sum();
	    	let sum2 = $('#deliveryOrderAdmTable').DataTable().column(5,{ page: 'all'} ).data().sum();
	    	let sum3 = $('#deliveryOrderAdmTable').DataTable().column(7,{ page: 'all'} ).data().sum();
	    	let sum4 = $('#deliveryOrderAdmTable').DataTable().column(8,{ page: 'all'} ).data().sum();
	    	let sum5 = $('#deliveryOrderAdmTable').DataTable().column(9,{ page: 'all'} ).data().sum();

	    	$('#sujuTotal').text(addCommas(sum1));
	    	$('#salesTotal').text(addCommas(sum2));
	    	$('#storeTotal').text(addCommas(sum3));
	    	$('#ratio').text(addCommas(sum4));
	    	$('#sumTo').text(addCommas(sum5));
		}
	});

    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">출고일자</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="outDateFrom" name="outDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(outDateFrom,outDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="outDateTo" name="outDateTo" disabled />';
    html1 += '<button onclick="fnPopUpCalendar(outDateTo,outDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outDateToToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">고객사</label><div class="form-group input-sub m-0 row">';  
    html1 += '<input type="text" class="form-control" id="ordCorpNm" name="ordCorpNm" disabled>';
    html1 += '<input type="hidden" class="form-control" id="ordCorpCd" name="ordCorpCd" disabled>';
  	html1 += '<button type="button" id="btnOrdCorpCd" class="btn btn-primary input-sub-search" onClick="ordCorpCdSelectInCorpCd()">';
  	html1 += '<span class="oi oi-magnifying-glass"></span>';
  	html1 += '</button></div>&nbsp;&nbsp;&nbsp;';
  	html1 += '<div>';
	html1 += '<a href="javascript:void(0)" id="cancelSearchOrdCorp" class="closebtn"><i class="mdi mdi-close"></i></a>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">품목</label><div class="form-group input-sub m-0 row">';  
    html1 += '<input type="text" class="form-control" id="itemNm" name="itemNm" disabled>';
    html1 += '<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" disabled>';
  	html1 += '<button type="button" id="btnordCorpCd" class="btn btn-primary input-sub-search" onClick="selectItemCd()">';
  	html1 += '<span class="oi oi-magnifying-glass"></span>';
  	html1 += '</button></div>&nbsp;&nbsp;&nbsp;';
  	html1 += '<div>';
	html1 += '<a href="javascript:void(0)" id="cancelSearchItemCd" class="closebtn"><i class="mdi mdi-close"></i></a>';
	html1 += '</div>';
    html1 += '<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;'
    html1 += '</div>';
    
	$('#deliveryOrderAdmTable_length').html(html1);
	$('#outDateFrom').val(serverDateFrom);
	$('#outDateTo').val(serverDateTo);
	
	selectBoxAppend(ordCorpCdCode, "ordCorpCdVal", "", "1");
	selectBoxAppend(lhrhCode, "lhrhOption", "", "1");
	
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#outDateFrom').val();
		serverDateTo =  $('#outDateTo').val();
		ordCorpCdVal =  $('#ordCorpCd').val();
		itemSeqVal =  $('#itemSeq').val();
		
		$('#deliveryOrderAdmTable').DataTable().ajax.reload( function () {});
    });	

	$('#cancelSearchOrdCorp').on('click',function(){
		$('#ordCorpNm').val('');
		$('#ordCorpCd').val('');		
	});

	$('#cancelSearchItemCd').on('click',function(){
		$('#itemSeq').val('');
		$('#itemNm').val('');		
	});
	
	$('#deliveryOrderAdmTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#deliveryOrderAdmTable').DataTable().$('.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	//공급사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function ordCorpCdSelectInCorpCd() {
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
						'mainGubun' : function(){return '002';},
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
