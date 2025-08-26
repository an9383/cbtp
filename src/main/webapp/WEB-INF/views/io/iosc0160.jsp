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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">품목단가이력관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 44%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="itemInfoAdmTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="20%">
								<col width="38%">
								<col width="15%">
								<col width="7%">
								<col width="13%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>품번</th>
									<th>품명</th>
									<th>차종</th>
									<th>단위</th>
									<th>최종 변경일자</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 55%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"> <i
								class="mdi mdi-close"></i></a>
						</div>
						<h5>품목 <span id="unitCostText" style="color: blue;">출고</span>단가 이력항목</h5>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card">
						<div class="table-responsive">
							<table class="table table-bordered" id="itemCostLIstHisTable">
								<colgroup>
									<col width="15%">
									<col width="26%">
									<col width="10%">
									<col width="10%">
									<col width="5%">
									<col width="12%">
									<col width="12%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th>품번</th>
										<th>품명</th>
										<th>차종</th>
										<th>단가</th>
										<th>단위</th>
										<th>적용일자</th>
										<th>변경일자</th>
										<th>변경사유</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	//열기,닫기 버튼클릭시 itemInfoAdmTable 테이블 header 사이즈변경
	$('#left-expand').click(function(){
		$('#itemInfoAdmTable').DataTable().ajax.reload();
	});

	$('#left-width-btn').on('click',function(){
		$('#itemInfoAdmTable').DataTable().ajax.reload();
	});

	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "44%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "iosc0160";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "품목단가이력관리");

	var tableIdx = null;
	var itemSeq = null;
	var itemRev = null;
	var itemGubunTake = "001";
	var importExportCheck = "export";

	var hisDateFromCal = "${serverDateFrom}";
	var hisDateToCal = "${serverDateTo}";
	var hisDateCal = "${serverDateTo}";

	uiProc(true);

	//공통코드시작
	var itemGubun = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubun.push(json);
	</c:forEach>
	//공통코드끝
	
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnEdit').attr('disabled', false);
		$('#btnSave').addClass('d-none');
	});

	
	let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		fixedHeader: true,
		pageLength : 100000000, 
		scrollY: "610px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : function(){return itemGubunTake;},
			},
		},
		rowId : 'contNo',
		columns : [
			{
				data : 'itemGubunNm',
				'className' : 'text-center'
			}, {
				data : 'itemCd',
				'className' : 'text-center'
			}, {
				data : 'itemNm',
				'className' : 'text-center'
			}, {
				data : 'itemModelNm',
				'className' : 'text-center'
			}, {
				data : 'itemUnitNm',
				'className' : 'text-center'
			}, {
				data : 'changeDate',
				render : function(data, type, row, meta) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
					
				}
			}, 
		],
		buttons : [ 'copy', 'excel', 'print' ],
	});


	var html1 = '<select class="custom-select mr-1" id="itemGubun" onChange="itemOnchange()"></select>'
	$('#itemInfoAdmTable_length').html(html1);
	
	selectBoxAppend(itemGubun, "itemGubun", "", "");
	
	function itemOnchange(){
		var itemGubunList = $("#itemGubun option:selected").val();
		if(itemGubunList == '001'){
			itemGubunTake = '001';
			importExportCheck = 'export';
		}else if(itemGubunList == '002'){
			itemGubunTake = '002';
			importExportCheck = 'export';
		}else if(itemGubunList == '003'){
			itemGubunTake = '003';
			importExportCheck = 'export';
		}else if(itemGubunList == '004'){
			itemGubunTake = '004';
			importExportCheck = 'import';
		}else if(itemGubunList == '005'){
			itemGubunTake = '005';
			importExportCheck = 'import';
		}

		if(importExportCheck == 'export'){
			$('#unitCostText').text('출고');
		}else{
			$('#unitCostText').text('입고');
		}
		
		$('#itemInfoAdmTable').DataTable().ajax.reload();
		
	}
	
	//품목 클릭시 
	$('#itemInfoAdmTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemInfoAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		itemSeq = itemInfoAdmTable.row(this).data().itemSeq;
		itemRev = itemInfoAdmTable.row(this).data().itemRev;

		$('#itemCostLIstHisTable').DataTable().ajax.reload();
	});

	//자재단가 이력항목 상세조회
	let itemCostLIstHisTable = $('#itemCostLIstHisTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		fixedHeader: true,
		pageLength : 100000000, 
		scrollY: "550px",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="bm/itemInformationList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return itemSeq;},
				'exportCost'	: function() {return 'exportCost';},
			} 
		},
		columns : [
			{
				data : 'itemCd',
				'className' : 'text-center'
			}, {
				data : 'itemNm',
				'className' : 'text-center'
			}, {
				data : 'itemModel',
				'className' : 'text-center'
			}, 
			{
				render : function(data, type, row) {
					if(importExportCheck=="export"){
						return addCommas(row['exportCost']);
					}else{
						return addCommas(row['importCost']);
					}
				},
				'className' : 'text-right'
			},
			{
				data : 'itemUnitNm',
				'className' : 'text-center'
			}, 
			{
				render : function(data, type, row) {
					if(importExportCheck=="export"){
						return moment(row['exportDate']).format('YYYY-MM-DD');
					}else{
						return moment(row['importDate']).format('YYYY-MM-DD');
					}
				}
			},
			{
				data : 'changeDate',
				render : function(data, type, row) {
					return moment(data).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			}, 
			{ 	data : 'itemReason',	
				render : function(data, type, row, meta) {
					return data;
				}
			}
		],
		drawCallback : function(){
		},
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs : [ 
			{targets : "_all", className : "text-center"}, 
		]
	});

	
	function uiProc(flag) {
		$("#finspectYn").attr("disabled", flag);
		$("#confirmYn").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#receiptGubun").attr("disabled", flag);
		$("#poDesc").attr("disabled", flag);

		$('#btnDealCorp').attr('disabled', flag);
		$('#btnPoRegChargr').attr('disabled', flag);
		$('#poDateCalendar').attr('disabled', flag);
	}

</script>
</body>
</html>