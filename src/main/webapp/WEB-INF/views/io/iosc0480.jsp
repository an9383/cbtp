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
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">입출고원장(정밀가공)</li>
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
						<table id="stockPaymentStatusTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th class="text-center" rowspan='2' style="min-width: 70px;" name="itemCusTh">고객사</th>
									<th class="text-center" rowspan='2' style="min-width: 100px;">품번</th>
									<th class="text-center" rowspan='2' style="min-width: 130px;">품명</th>
									<th class="text-center" rowspan='2' style="min-width: 60px;">충진중량</th>
									<th class="text-center" rowspan='2' style="min-width: 60px;">단위</th>
									<th class="text-center" rowspan='2' style="min-width: 60px;">기초재고</th>
									<th class="text-center" colspan='3'>1월</th>
									<th class="text-center" colspan='3'>2월</th>
									<th class="text-center" colspan='3'>3월</th>
									<th class="text-center" colspan='3'>4월</th>
									<th class="text-center" colspan='3'>5월</th>
									<th class="text-center" colspan='3'>6월</th>
									<th class="text-center" colspan='3'>7월</th>
									<th class="text-center" colspan='3'>8월</th>
									<th class="text-center" colspan='3'>9월</th>
									<th class="text-center" colspan='3'>10월</th>
									<th class="text-center" colspan='3'>11월</th>
									<th class="text-center" colspan='3'>12월</th>
									<th class="text-center" colspan='3'>합계</th>
								</tr>
								<tr>
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 1월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 2월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 3월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 4월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 5월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 6월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 7월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 8월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 9월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 10월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 11월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 12월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th><!-- 합계 -->
								</tr>
							</thead>
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

	const currentHref = "iosc0480";
	const currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title", "입출고원장(정밀가공)");
	
	const serverDate =  "${serverDate}";
	let stockYear = serverDate.substr(0,4);
	
	let mainGubunVal = '002';
	let itemGubunVal = '001';
	
	let sumImQty = 0;
	let sumImCost = 0;
	let sumExQty = 0;
	let sumExCost = 0;
	let sumStockQty = 0;
	let sumStockCost = 0;
	
	let monthStart = 1;
	let monthLast = 12;
	
	//공통코드 처리 시작
	let mainGubunArray = new Array(); //구분
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
	let itemGubunArray = new Array(); //품목
	<c:forEach items="${itemGubun}" var="info">
	if ( "${info.baseCd}" == '001' || "${info.baseCd}" == '004' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		itemGubunArray.push(json);
	}
	</c:forEach>
	//공통코드 처리 종료

	let stockPaymentStatusTable = $('#stockPaymentStatusTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollX : true,
		fixedColumns : {
			leftColumns: 6
		},
		scrollY : "65vh",
		ajax : {
			url : '<c:url value="tm/stockPaymentStatusList"/>',
			type : 'GET',
			data : {
				'stockYear' : function(){return stockYear;},
				'mainGubun' : function(){return mainGubunVal;},
				'itemGubun' : function(){return itemGubunVal;},
			}
		},	
		rowId : '',
		columns : [ 
			{//공급사
				data : 'itemCus',
				render : function ( data, type, row, meta ) {
					sumImQty = 0;
					sumImCost = 0;
					sumExQty = 0;
					sumExCost = 0;
					sumStockQty = 0;
					sumStockCost = 0;
					
					if ( data != null ) {
						return data;
					} else {
						return '';
					}
				},
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//충진중량
				data : 'fillingWt',
				render : function ( data, type, row, meta ) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//단위
				data : 'itemUnitNm'
			},
			{//기초재고
				data : 'initStockQty',
				render : function ( data, type, row, meta ) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			<c:forEach begin="1" end="12" step="1" varStatus="status">
		    {//생산수량(입고수량)
				data : 'spImQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumImQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//출고수량
				data : 'spExQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumExQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//재고수량
				data : 'spStockQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumStockQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			</c:forEach>
			{//생산수량(입고수량)
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumImQty);
				},
				'className' : 'text-right'
			},
			{//출고수량
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumExQty);
				},
				'className' : 'text-right'
			},
			{//재고수량(이건 누적이 아님)
				data : 'spStockQty' + '12', 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
		],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [ 
		    
		],
	});
	
    let html1 = '<div class="row">';
	
	html1 += '<label class="input-label-sm m-1">품목</label>';
	html1 += '<select class="custom-select" id="itemGubunBox"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm m-1">일자</label>';
    html1 += '<input class="form-control" type="month" id="stockDateStart" style="width:100px;"/>';
    html1 += '&nbsp; ~ &nbsp;';
    html1 += '<input class="form-control" type="month" id="stockDateLast" style="width:100px;"/>&nbsp;&nbsp;&nbsp;&nbsp;';
	
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	
    html1 += '</div>';
	
	$('#stockPaymentStatusTable_length').html(html1);
	$('#stockDateStart').val(stockYear + '-01');
	$('#stockDateLast').val(stockYear + '-12');
	selectBoxAppend(itemGubunArray, "itemGubunBox", "", "");

	// 조회버튼
	$('#btnRetv').on('click', function() {
		if ( $('#stockDateStart').val().substr(0, 4) != $('#stockDateLast').val().substr(0, 4) ) {
			toastr.warning('같은 연도 내에서만 조회 가능합니다.');
			$('#stockDateLast').focus();
			return false;
		}
		if ( $('#stockDateLast').val().replace(/-/g, '') - $('#stockDateStart').val().replace(/-/g, '') < 0 ) {
			toastr.warning("기간을 잘못 선택하였습니다.<br>다시 선택해 주세요.");
			$('#stockDateLast').focus();
			return false;
		}
		
		stockYear =  $('#stockDateStart').val().substr(0, 4);
		itemGubunVal =  $('#itemGubunBox').val();
		
		monthStart = $('#stockDateStart').val().substr(5, 2) * 1;
		monthLast = $('#stockDateLast').val().substr(5, 2) * 1;
		
		$('#stockPaymentStatusTable').DataTable().ajax.reload(function(){
			$('#my-spinner').show(function(){
				// 1. 테이블의 모든 열을 보이게 한다.
				spsTableVisible1(true);
				spsTableVisible2(true);
				spsTableVisible3(true);
				spsTableVisible4(true);
				spsTableVisible5(true);
				spsTableVisible6(true);
				spsTableVisible7(true);
				spsTableVisible8(true);
				spsTableVisible9(true);
				spsTableVisible10(true);
				spsTableVisible11(true);
				spsTableVisible12(true);
				
				// 2. stockDateStart의 값에 따라 열을 숨김 처리한다.
				switch (monthStart){
					case 12:
						spsTableVisible11(false);
					case 11:
						spsTableVisible10(false);
					case 10:
						spsTableVisible9(false);
					case 09:
						spsTableVisible8(false);
					case 08:
						spsTableVisible7(false);
					case 07:
						spsTableVisible6(false);
					case 06:
						spsTableVisible5(false);
					case 05:
						spsTableVisible4(false);
					case 04:
						spsTableVisible3(false);
					case 03:
						spsTableVisible2(false);
					case 02:
						spsTableVisible1(false);
				}
				
				// 3. stockDateLast의 값에 따라 열을 숨김 처리한다.
				switch (monthLast){
					case 01:
						spsTableVisible2(false);
					case 02:
						spsTableVisible3(false);
					case 03:
						spsTableVisible4(false);
					case 04:
						spsTableVisible5(false);
					case 05:
						spsTableVisible6(false);
					case 06:
						spsTableVisible7(false);
					case 07:
						spsTableVisible8(false);
					case 08:
						spsTableVisible9(false);
					case 09:
						spsTableVisible10(false);
					case 10:
						spsTableVisible11(false);
					case 11:
						spsTableVisible12(false);
				}
				$('#my-spinner').hide();
			});
		});
		
		// 테이블 th 명칭 변경
		if ( itemGubunVal == '001' ) { //제품
			$('th[name=itemCusTh]').text('고객사');
			$('th[name=spImQtyTh]').text('생산수량');
		} else if ( itemGubunVal == '004' ) { //자재
			$('th[name=itemCusTh]').text('공급사');
			$('th[name=spImQtyTh]').text('입고수량');
		} else {
			console.log("예상치 못한 오류가 발생했습니다.");
		}
		
    });
	
	//테이블 행 visible 변경
	function spsTableVisible1 (flag) { // 1월
		stockPaymentStatusTable.column(6).visible(flag);
		stockPaymentStatusTable.column(7).visible(flag);
		stockPaymentStatusTable.column(8).visible(flag);
	}
	function spsTableVisible2 (flag) { // 2월
		stockPaymentStatusTable.column(9).visible(flag);
		stockPaymentStatusTable.column(10).visible(flag);
		stockPaymentStatusTable.column(11).visible(flag);
	}
	function spsTableVisible3 (flag) { // 3월
		stockPaymentStatusTable.column(12).visible(flag);
		stockPaymentStatusTable.column(13).visible(flag);
		stockPaymentStatusTable.column(14).visible(flag);
	}
	function spsTableVisible4 (flag) { // 4월
		stockPaymentStatusTable.column(15).visible(flag);
		stockPaymentStatusTable.column(16).visible(flag);
		stockPaymentStatusTable.column(17).visible(flag);
	}
	function spsTableVisible5 (flag) { // 5월
		stockPaymentStatusTable.column(18).visible(flag);
		stockPaymentStatusTable.column(19).visible(flag);
		stockPaymentStatusTable.column(20).visible(flag);
	}
	function spsTableVisible6 (flag) { // 6월
		stockPaymentStatusTable.column(21).visible(flag);
		stockPaymentStatusTable.column(22).visible(flag);
		stockPaymentStatusTable.column(23).visible(flag);
	}
	function spsTableVisible7 (flag) { // 7월
		stockPaymentStatusTable.column(24).visible(flag);
		stockPaymentStatusTable.column(25).visible(flag);
		stockPaymentStatusTable.column(26).visible(flag);
	}
	function spsTableVisible8 (flag) { // 8월
		stockPaymentStatusTable.column(27).visible(flag);
		stockPaymentStatusTable.column(28).visible(flag);
		stockPaymentStatusTable.column(29).visible(flag);
	}
	function spsTableVisible9 (flag) { // 9월
		stockPaymentStatusTable.column(30).visible(flag);
		stockPaymentStatusTable.column(31).visible(flag);
		stockPaymentStatusTable.column(32).visible(flag);
	}
	function spsTableVisible10 (flag) { // 10월
		stockPaymentStatusTable.column(33).visible(flag);
		stockPaymentStatusTable.column(34).visible(flag);
		stockPaymentStatusTable.column(35).visible(flag);
	}
	function spsTableVisible11 (flag) { // 11월
		stockPaymentStatusTable.column(36).visible(flag);
		stockPaymentStatusTable.column(37).visible(flag);
		stockPaymentStatusTable.column(38).visible(flag);
	}
	function spsTableVisible12 (flag) { // 12월
		stockPaymentStatusTable.column(39).visible(flag);
		stockPaymentStatusTable.column(40).visible(flag);
		stockPaymentStatusTable.column(41).visible(flag);
	}
	////테이블 행 visible 변경
	
</script>

</body>
</html>
