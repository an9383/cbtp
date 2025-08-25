<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<li class="breadcrumb-item active">발주현황</li>
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
					<table id="purchaseOrderAdmTable" class="table table-bordered">
						<colgroup>
							<col width="6%">
							<col width="8%">
							<col width="8%">
							<col width="10%">
							<col width="10%">
							<col width="11%">
							<col width="7%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>구분</th>
								<th>발주번호</th>
								<th>공급사</th>
								<th>품번</th>
								<th>차종</th>
								<th>품명</th>
								<th class="text-center">발주수량</th>
								<th class="text-center">가입고수량</th>
								<th>가입고일자</th>
								<th class="text-center">미가입고수량</th>
								<th>납기일자</th>
								<th>저장위치</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row --> 
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "iosc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","발주현황"); 
	let viewIdx;
	let sideView = 'add';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var searchOption = '001';
	var index=0;

	var poStatusOption = '001';	
	var mainGubun = "";
	
	// 발주현황 목록조회
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : true,
		fixedHeader: true,
		pageLength : 100000000, 
		scrollY: "640px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="io/purchaseOrderStatusList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function() {return mainGubun;},
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() { return serverDateTo.replace(/-/g, '');},
				'searchOption' : function() { return searchOption; },
				'poStatusOption' : function() { return poStatusOption; },
			},
		}, 
		rowId : 'poNo',
		columns : [ 
			{ data : 'mainGubunNm' }, 
			{ data : 'poNo' }, 
			{ data : 'dealCorpNm' }, 
			{ data : 'itemCd' }, 
			{ data : 'itemModel' }, 
			{ data : 'itemNm' }, 
			{
				data : 'ordQty',
				render : function(data, type, row, meta){
					if(row['inWhsDate']==null){
						return '<input type="text" class="form-control" id="ordQty_'+meta.row+'" name="ordQty" value="'+addCommas(data)+'" onchange="ordQtyChange(\''+row['poNo']+'\',\''+row['poSeq']+'\','+meta.row+')" style="text-align:right" />';
					}else{
						return data;
					}
				}
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
				data : 'diffCnt',
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
				data : 'dlvDate',
				render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
				}
			}, 
			{ data : 'savelocNm' }, 
		],
		columnDefs : [ {
			targets : [6,7,9],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		} ],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});
	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="mainGubun" name="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">사출</option>';
	html1 += '<option value="002">봉제</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">일자</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="searchOption"></select>';
	html1 += '</div>&nbsp;';
	html1 += '&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
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
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">보기</label>';
	html1 += '&nbsp;<select class="custom-select" id="poStatusOption">';
	html1 += '<option value="">전체</option>';
	html1 += '<option value="001" selected>미입고항목</option>';
	html1 += '<option value="002">입고완료항목</option>';
	html1 += '<option value="003">입고마감항목</option></select>';	
	html1 += '</div>';

	$('#purchaseOrderAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(moment(serverDateFrom).format('YYYY-MM-DD'));
	$('#preInWhsDateTo').val(moment(serverDateTo).format('YYYY-MM-DD'));


	//조회버튼 클릭
	$('#btnRetv').on('click', function() {
		mainGubun =  $('#mainGubun option:selected').val();
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		searchOption = $("#searchOption :selected").val();
		poStatusOption = $("#poStatusOption :selected").val();
		
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
	});

	//전체조회버튼 클릭
	$('#btnAllList').on('click', function() {
		mainGubun = "";
		serverDateFrom =  "";
		serverDateTo =  "";
		searchOption = "";
		poStatusOption = "";
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
    });

	//보기조건 click
	$('#poStatusOption').on('change', function() {
		poStatusOption =  $('#poStatusOption :selected').val();
		$('#purchaseOrderAdmTable').DataTable().ajax.reload( function () {});
    });	
    
	//변경납기일 click
    function dlvChange(poNo, poSeq, index){
		
        $.ajax({
			url : '<c:url value="io/purchaseOrderDtlUpdate" />',
		 	type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'dlvChangeDate' : $('#dlvChangeDate_'+index).val().replace(/-/g,'')
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("변경납기일 수정되었습니다.");
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
				}else{
					toastr.error(res.message);
				}
			}
        });
    };

  	//확정수량 click
    function ordQtyChange(poNo, poSeq, index){
		
        $.ajax({
			url : '<c:url value="io/purchaseOrderDtlUpdate" />',
		 	type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'ordQty' : $('#ordQty_'+index).val().replace(/,/g,'')
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("발주수량 수정되었습니다.");
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
				}else{
					toastr.error(res.message);
				}
			}
        });
    };

	//발주종료버튼 click
	function btnPDead(index) {

		var poNo = purchaseOrderAdmTable.row(index).data().poNo;
		var partCd = purchaseOrderAdmTable.row(index).data().partCd;

		$.ajax({
			url : '<c:url value="io/poEndDateUpdate" />',
			type : 'GET',
			data : {
				'poNo' : poNo,
				'partCd' : partCd,
				'poEndDate' : '001'
			},
			success : function(res) {
				if (res.result == "ok") {
					toastr.success("발주종료 되었습니다.");
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
				} 
			}
		}); 
	}

	//가입고마감버튼 click
	function btnIDead(index) {

		var poNo = purchaseOrderAdmTable.row(index).data().poNo;
		var partCd = purchaseOrderAdmTable.row(index).data().partCd;

		$.ajax({
			url : '<c:url value="io/poEndDateUpdate" />',
			type : 'GET',
			data : {
				'poNo' : poNo,
				'partCd' : partCd,
				'poEndDate' : '002'
			},
			success : function(res) {
				if (res.result == "ok") {
					toastr.success("가입고마감 되었습니다.");
					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
				} 
			}
		}); 
	}

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=ordQty]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace(",", ""));
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas($(this).val().replace(",", "")));
	});
	
	$('#searchOption').append($("<option value='001' selected>"+ "발주일" +"</option>"));
	$('#searchOption').append($("<option value='002'>"+ "납기일" +"</option>"));
	$('#searchOption').append($("<option value='003'>"+ "변경납기일" +"</option>"));

	
</script>

</body>
</html>
