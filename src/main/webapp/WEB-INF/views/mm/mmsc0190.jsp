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
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">원단위 관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<!-- 상단 sorting part -->
       	<div class="card top_sortbox p-2">
           	<div class="row">
           		<div class="form-group row">
					<label class="input-label-sm">검색일자</label>
					<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-s" style="max-width:5.7rem;">
					<label class="input-label-sm ml-2">~</label>
					<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-e" style="max-width:5.7rem;">
				</div>
				<div class="form-group row pl-6">
					<label class="col-form-label">품번/품명/재료명</label>
					<div class="input-sub m-0 ml-2">
						<input type="text" class="form-control" id="itemInfo" placeholder="사용자 입력" style="font-size: 120%; height: 2rem;">
					</div>
				</div>
          	</div> 
        </div>
	    <!-- / end 상단 sorting part -->
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list">
				<div class="card">
					<div class="row">
						<h6 style="font-size: 15px;">▶ 기준 정보</h6>
						<div class="table-responsive mb-3" style="overflow: hidden;">
							<table id="baseTable" class="table table-bordered tr_highlight_row">
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>고객사</th>
										<th>차종</th>
										<th>품번</th>
										<th>품명</th>
										<th>재료명</th>
										<th>Grade명</th>
										<th>C/V</th>
										<th>제품중량(g)</th>
										<th>S/R중량(g)</th>
										<th>SHOT중량(g)</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row">
						<h6 style="font-size: 15px;">▶ 원단위 정보</h6>
						<div class="table-responsive">
							<table id="wonUnitTable" class="table table-bordered tr_highlight_row">
								<thead class="thead-light">
									<tr>
										<th>년/월</th>
										<th>입고량(Kg)</th>
										<th>입고금액(원)</th>
										<th>생산량(ea)</th>
										<th>생산량(Kg)</th>
										<th>생산금액(원)</th>
										<th>초기허용불량(ea)</th>
										<th>불량(ea)</th>
										<th>불량(Kg)</th>
										<th>불량금액(원)</th>
										<th>Loss량(Kg)</th>
										<th>Loss금액(원)</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / #main  -->
</div>
<!-- Modal1 End-->
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "mmsc0190";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","원단위 관리"); 


	$(document).ready(function() {
		
		$('body').css('font-size','15px');
		$('input').css('font-size','120%').css('height','2.3rem');
		$('th').css('vertical-align','middle')
				.css('background-color','#f6f7f9')
				.css('text-align','center')
				.css('width','100px');
	});
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	let itemSeqVal = null;
	let itemInfoVal = null;

	var serverMonthFrom = moment(serverDateFrom).format('YYYY-MM-DD').substring(0,7);
	var serverMonthTo = moment(serverDateTo).format('YYYY-MM-DD').substring(0,7)
	
	
	$('#demo-s').val(serverMonthFrom);
	$('#demo-e').val(serverMonthTo);
	
	// 기준 정보
	let baseTable = $('#baseTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-'>B>",
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		scrollY : '300px',
		pageLength : 100,
		ajax : {
			url : '<c:url value="bm/basicInfoList"/>',
			type : 'GET',
			data : {
				'itemInfo' : function() {return itemInfoVal;},
			},
		},
		columns : [ 
			{data : 'itemCusNm'},
			{data : 'itemModelNm'},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{data : 'lowerItemNm'},
			{data : 'itemGrade'},
			{data : 'equipCavity'},
			{
				data : 'prodWt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'srWt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'shotWt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			}
		],
		columnDefs : [ 
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [
			{
			   "extend" : 'excel',
			   'title': '원단위 관리'
			}
		]
	});

	//기준정보 목록 클릭시
	$('#baseTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			return false;
		} else {
			$('#baseTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#baseTable').DataTable().row(this).index();
		itemSeqVal = baseTable.row(tableIdx).data().itemSeq;

		$('#wonUnitTable').DataTable().ajax.reload();
	});
	

	// 원단위 정보
	let wonUnitTable = $('#wonUnitTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '200px',
		pageLength : 100,
		ajax : {
			url : '<c:url value="bm/wonUnitList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function() {return itemSeqVal;},
				'startDate' : function() {return serverMonthFrom.replace(/-/g,'');},
				'endDate' : function() {return serverMonthTo.replace(/-/g,'');},
			},
		},
		columns : [ 
			{
				data : 'mon',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data+'01').format('YYYY-MM');
					}else{
						return '-';
					}
				}
			},
			{
				data : 'inQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'inCost',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'outputQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'convOutputQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'outputCost',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'initFaultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'faultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'convFaultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'faultyCost',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'frHistCnt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'frHistCost',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data))
					}else{
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [
			{
			   "extend" : 'excel',
			   'title': '원단위 정보'
			}
		]
	});

 
	$('#demo-s, #demo-e').on('change', function() {
		serverMonthFrom = $('#demo-s').val();
		serverMonthTo = $('#demo-e').val();
		$('#wonUnitTable').DataTable().ajax.reload();
	});


	$('#demo-s').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : 2020,
		startYear : 1900,
		finalYear : 2212
	});

	$('#demo-e').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : 2020,
		startYear : 1900,
		finalYear : 2212
	});


	//원재료 품번/품명 사용자 키인
	$('#itemInfo').keypress(function (e) {
		if (e.which == 13) {
			itemInfoVal = $('#itemInfo').val();
			$('#baseTable').DataTable().ajax.reload();
			$('#wonUnitTable').DataTable().clear().draw();
		}
	});
</script>
</body>
</html>
