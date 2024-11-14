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
				<li class="breadcrumb-item active">재공창고 현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="inventoryTable">
							<colgroup>
								<col width="10%">
								<col width="5%">
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								
							</colgroup>
							<thead class="thead-light" style="font-size: 11px;">
								<tr>
									<th class="text-center">CODE</th>
									<th class="text-center">REV</th>
									<th class="text-center">구분</th>
									<th class="text-center">ITEM</th>
									<th class="text-center">SPEC</th>
									<th class="text-center">단위</th>
									<th class="text-center">재공입고수량</th>
									<th class="text-center">재공출고수량</th>
									<th class="text-center">재공수량</th>
									
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
				style="width: 40%;">
				<div class="card" id="formBox">

					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-lg table-bordered mb-2"
							id="inventoryDtlTable">
							<colgroup>
								<col width="5%">
								<col width="25%">
								<col width="5%">
								<col width="13%">
								<col width="13%">
								<col width="14%">
								<col width="14%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light" style="font-size: 11px;">
								<tr>
									<th class="text-center-th">No.</th>
									<th class="text-center-th">BarcodeNo</th>
									<th class="text-center-th">출고경로</th>
									<th class="text-center-th">재공입고수량</th>
									<th class="text-center-th">재공출고수량</th>
									<th class="text-center-th">재공입고일</th>
									<th class="text-center-th">재공출고일</th>
									<th class="text-center-th">재공수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>

			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->

		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "tmsc0240";
	let currentPage = $('.' + currentHref).attr('id');
	$(document).attr("title", "재공창고현황");
	
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";

	var serverMonth = "${serverMonthFrom}";
	var serverMonthTo = serverDate.substring(0, 7);
	var serverMonthFrom = serverMonth.substring(0, 7);

	
	var partCd = null;
	var partRev = null;
	var realQtyOption ='001';
	
	//공통코드 처리 시작
	var spTypeCode = new Array(); 
	<c:forEach items="${spGubunVal}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	spTypeCode.push(json);
	</c:forEach> 


	//재고현황 목록조회
	let inventoryTable = $('#inventoryTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		rowId : 'poNo',
		ajax : {
			url : '<c:url value="io/wareHouseList"/>',
			type : 'GET',
			data : {
				'realQtyOption' : function(){return realQtyOption;}
			}
		},
		rowId : 'partCd',
		columns : [ {
			data : 'partCd'
		}, {
			data : 'partRev'
		}, {
			data : 'partGubun'
		}, {
			data : 'partNm'
		}, {
			data : 'partSpec'
		}, {
			data : 'partUnitNm'
		}, {
			data : 'preOutQty',
			/* render : function(data, type, row, meta){
				return addCommas(data);
			}, */
			"className" : "text-right"
		}, {
			data : 'outQty',
			/* render : function(data, type, row, meta){
				return addCommas(data);
			}, */
			"className" : "text-right"
		}, {
			data : 'realQty',
			/* render : function(data, type, row, meta){
				return addCommas(data);
			}, */
			"className" : "text-right"
		} ],
		columnDefs: [
        	{ targets: [6,7,8], className:'text-right', render: $.fn.dataTable.render.number( ',' ) },
        	{ targets: '_all', className: 'text-center' },
        ],
		order : [ [ 0, 'desc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		
	}); 

	// 세부 목록 보기
	$('#inventoryTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#inventoryTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		partCd = inventoryTable.row(this).data().partCd;
		partRev = inventoryTable.row(this).data().partRev;

		sideView = "edit";
		$('#realQty').text(addCommas(inventoryTable.row(this).data().realQty));
		$('#inventoryDtlTable').DataTable().ajax.reload(function() {});

	});

	let inventoryDtlTable = $('#inventoryDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : 500,
		ajax : {
			url : '<c:url value="io/wareHouseRead"/>',
			type : 'GET',
			data : {
				'partCd' : function() {return partCd;},
				'partRev' : function() {return partRev;},
			},
		},
		rowId : 'rowId',
		columns : [ 
			{ 
				render : function(data, type, row, meta) {
				return meta.row+1;
				}
			}, {
				data : 'barcodeNo'
			}, {
				data : 'outCase',
				render : function(data, type, row, meta){
					if(data=="001"){
						return "작지"
					}else if(data=="002"){
						return "개별";
					}else if(data=="003"){
						return "요청";
					}else{
						return "-";
					}
				}
			}, {
				data : 'preOutQty'
			}, {
				data : 'outQty'
			}, {
				data : 'preOutWhsDate',
				render : function(data, type, row, meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			}, {
				data : 'outWhsDate',
				render : function(data, type, row, meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			}, {
				data : 'realQty'
			}, 
			],
			columnDefs : [
			{ targets : '_all', className : 'text-center'} 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs: [
        	{ targets: [3,4,7], className:'text-right', render: $.fn.dataTable.render.number( ',' ) },
        	{ targets: '_all', className: 'text-center' },
        ],
		drawCallback : function(){
			var api = this.api();
			for(var i=0; i<api.data().count(); i++){
				if(api.row(i).data().spGubun == "001"){
					$('#'+api.row(i).data().rowId).addClass('bg-1');
					
				}else if(api.row(i).data().spGubun == "002"){
					$('#'+api.row(i).data().rowId).addClass('bg-2');
					
				}else if(api.row(i).data().spGubun == "003"){
					$('#'+api.row(i).data().rowId).addClass('bg-3');
				}else if(api.row(i).data().spGubun == "004"){
					$('#'+api.row(i).data().rowId).addClass('bg-4');
				}
			}


			
			/*
			var realQty = 0;
			
			for(var i=0; i<api.data().count(); i++){
				realQty += parseInt(api.row(i).data().spQty);
			};

			$('#realQty').text(realQty);
			console.log("realQty:"+realQty)
			//inventoryDtlTable.row(0).data().spQty;
			*/
		}
	});


	var html1 = '&nbsp;&nbsp&nbsp;&nbsp<label class="input-label-sm">보기</label>';
    html1 += '<select id="realQtyOption" class="custom-select custom-select-sm"  style="max-width:px;">';
    html1 += '<option value="" >전체보기</option>'
    html1 += '<option value="001" selected>현재고 보기</option>'
   	html1 += '</select>';
    html1 += '&nbsp;&nbsp&nbsp;&nbsp<button type="button" class="btn btn-primary" id="btnRefresh">새로고침</button>'
	html1 += '</div>';

	
	$('#inventoryTable_length').html(html1);
	
	$('#realQtyOption').on('change', function() {
		realQtyOption =  $('#realQtyOption option:selected').val();
		$('#inventoryTable').DataTable().ajax.reload(function() {});
		$('#inventoryDtlTable').DataTable().clear().draw();
	});
	
</script>
<style>
.bg-1 {
  background-color: #F5DDAD !important;
}
.bg-2 {
  background-color: #F1BCAE !important;
}
.bg-3 {
  background-color: #C9DECF !important;
}
.bg-4 {
  background-color: #A9CBD7 !important;
}
</style>
</body>
</html>
