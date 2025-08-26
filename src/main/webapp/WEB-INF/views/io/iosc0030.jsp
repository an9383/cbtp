<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">발주마감</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<!-- .table-responsive -->
				<div class="table-responsive">
					<table id="purchaseOrderTable" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<%-- <col width="5%"> --%>
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="3%">
							<col width="9%">
							<col width="16%">
							<col width="3%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<%-- <col width="4%">
							<col width="4%" --%>
							<col width="5%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>발주번호</th>
								<!-- <th>발주일</th> -->
								<th>거래처명</th>
								<th>납기요청일</th>
								<th>CODE</th>
								<th>REV</th>
								<th>ITEM</th>
								<th>SPEC</th>
								<th>단위</th>
								<th class="text-center">발주수량</th>
								<th class="text-center">미입고량</th>
								<th class="text-center">가입고일</th>
								<th class="text-center">가입고수량</th>
								<th class="text-center">입고수량</th>
								<th class="text-center">단가</th>
								<th class="text-center">발주금액</th>
								<!-- <th>상태</th>
								<th>입고구분</th> -->
								<th>비고</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "iosc0030";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","발주마감"); 
	let viewIdx;
	let sideView = 'add';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var searchOption = '001';

	// 목록
	let purchaseOrderTable = $('#purchaseOrderTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 15,
		ajax : {
			url : '<c:url value="io/purchaseOrderStatusList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {
					return serverDateFrom.replace(/-/g, '');
				},
				'endDate' : function() {
					return serverDateTo.replace(/-/g, '');
				},
				'value'  : '발주종료',
				'searchOption' : function() { 
					return searchOption; 
				} 
			},
		},
		rowId : 'poNo',
		columns : [
			{ data : 'poNo' }, 
			/* {
				data : 'poDate',
				render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
				}
			}, */
			{ data : 'dealCorpNm' }, 
			{
				data : 'dlvDate',
				render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
				}
			}, 
			{ data : 'partCd' }, 
			{ data : 'partRev' },
		 	{ data : 'partNm' },
			{ data : 'partSpec' }, 
			{ data : 'partUnitNm' }, 
			{
				data : 'partQty',
				render : function(data, type, row, meta){
					return addCommas(data);
				},
				className : 'text-right',
			}, 
			/* {
				data : 'safyStockCnt',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			}, 
			{
				data : 'addQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			}, */
			{ data : 'diffCnt',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{   
				data : 'preInWhsDate',
				render : function(data, type, row, meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
					
				},
				className : 'text-center'
			},
			{
				data : 'preInWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{
				data : 'inWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{
				data : 'partUnitCost',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				}
			},
			{
				data : 'partAmt',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				}
			}, 
			/* { data : 'poStatusNm' }, 
			{ data : 'receiptGubunNm' },  */
			/* {
				render : function(data, type, row, meta) {
					if (row['poStatus'] == '003') {
						return '<button type="button" class="btn btn-primary" id="btnComplete" disabled>완료</button>';
					} else {
						if (row['poStatus'] == '002') {
							return '<button type="button" class="btn btn-primary" disabled>마감</button>';
						} else {
							return '<button type="button" class="btn btn-primary" id="btnDead-'
									+ meta.row
									+ '" name="btnDead" onclick="btnDead('
									+ meta.row
									+ ');">마감</button>';
						}
					}
	
				}
			} */
			{ data : 'poDesc' }
				
		],
		columnDefs : [ {
			
		} ],
		order : [ [ 1, 'desc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],

	});

	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<select class="custom-select" id="searchOption"><option value="001" selected>발주일</option><option value="002">납기요청일</option></select>';
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
	html1 += '</div>';

	$('#purchaseOrderTable_length').html(html1);
	$('#preInWhsDateFrom').val(moment(serverDateFrom).format('YYYY-MM-DD'));
	$('#preInWhsDateTo').val(moment(serverDateTo).format('YYYY-MM-DD'));

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		searchOption = $("#searchOption").val();
		$('#purchaseOrderTable').DataTable().ajax.reload(function() {
		});
	});

	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		searchOption = $("#searchOption").val();
		$('#purchaseOrderTable').DataTable().ajax.reload(function() {});
    });

</script>

</body>
</html>
