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
				<li class="breadcrumb-item active">생산지시현황(정밀가공)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">수주지시별</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">작업지시별</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<br>
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div id="table1">
						<div class="table-responsive" >
							<table id="contNoListTable" class="table table-bordered tr_highlight_row" style="width:100%">
								<thead class="thead-light">
									<tr>
										<th class="text-center">고객사</th>
										<th class="text-center">수주구분</th>
										<th class="text-center">품번</th>
										<th class="text-center">품명</th>
										<th class="text-center">충진중량</th>
										<th class="text-center">지시수량</th>
										<th class="text-center">생산수량</th>
										<th class="text-center">불량수량</th>
										<th class="text-center">접수자</th>
										<th class="text-center">수주상세번호</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div id="table2" class="d-none">
						<div class="table-responsive" >
							<table id="workOrdListTable" class="table table-bordered tr_highlight_row" style="width:100%">
								<thead class="thead-light">
									<tr>
										<th class="text-center">고객사</th>
										<th class="text-center">수주구분</th>
										<th class="text-center">품번</th>
										<th class="text-center">품명</th>
										<th class="text-center">충진중량</th>
										<th class="text-center">작업지시번호</th>
										<th class="text-center">작업지시일</th>
										<th class="text-center">설비명</th>
										<th class="text-center">작업자</th>
										<th class="text-center">지시수량</th>
										<th class="text-center">생산수량</th>
										<th class="text-center">불량수량</th>
										<th class="text-center">수주상세번호</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>

<style>
	.tr_highlight_row tr:hover {
		background-color: #ECFFB3;
	}
</style>

<script>
	let currentHref = "wmsc0420";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "생산지시현황(정밀가공)"); 
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let contNoDateFrom = serverDateFrom;
    let contNoDateTo = serverDateTo;
    let workOrdDateFrom = serverDateFrom;
    let workOrdDateTo = serverDateTo;

    let contNoItemGubun = null;
    let contNoContGubun = null;
    let itemGubun = null;
    let contGubun = null;
    
	//공통코드 처리 시작
	let itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode.push(json1);
	</c:forEach>

	let contGubunCode = new Array(); //수주구분
	<c:forEach items="${contGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	contGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료  
	
	//수주등록 생성 조회
	let contNoListTable = $('#contNoListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "65vh",
		ajax : {
			url : '<c:url value="po/contNoAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return contNoDateFrom.replace(/-/g,'')},
				'endDate' : function(){return contNoDateTo.replace(/-/g,'')},
				'itemGubun' : function(){return contNoItemGubun;},
				'contGubun' : function(){return contNoContGubun;},
				'mainGubun' : function(){return '002';},
			},
		},
		rowId : '',
		columns : [
			{//고객사
				data : 'ordCorpNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '';
					}
				},
			},
			{
				data : 'contGubunNm',
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//충진중량
				data : 'fillingWt',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//지시수량
				data : 'dtlOrdCnt',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//생산수량
				data : 'outputQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//불량수량
				data : 'faultyQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//접수자
				data : 'rcvChargrNm',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return data;
					} else {
						return '';
					}
				}
			},
			{//수주상세번호
				data : 'contDtlNo'
			},
		],
		createdRow : function( row, data, dataIndex ) {
		},
		columnDefs: [
	           {"targets": "_all", "className": "text-center"},
	    ],
		order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	   
	});

	//수주지시 테이블_length 변경
	let html1 = '';
	html1 +=  '<div class="row">&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">작업지시일자</label>';
	html1 += '<input type="date" class="form-control" id="contNoDateFrom" value="'+serverDateFrom+'" style="max-width:130px;">&nbsp;~ &nbsp;';
	html1 += '<input type="date" class="form-control" id="contNoDateTo" value="'+serverDateTo+'" style="max-width:130px;">&nbsp;&nbsp;&nbsp;&nbsp;';

	html1 += '<label class="input-label-sm">수주구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += 	'<select name="contNoContGubun" id="contNoContGubun" title="" class="select w80 col-12 custom-select">';
	html1 += 	'</select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += 	'<select name="contNoItemGubun" id="contNoItemGubun" title="" class="select w80 col-12 custom-select">';
	html1 += 	'</select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';

	$('#contNoListTable_length').html(html1);
	
	$('#contNoDateFrom').val(serverDateFrom);
    $('#contNoDateTo').val(serverDateTo);
	selectBoxAppend(itemGubunCode, "contNoItemGubun", "", "1");
	selectBoxAppend(contGubunCode, "contNoContGubun", "", "1");
    
	//수주지시 조건 선택시
	$('#contNoDateFrom, #contNoDateTo, #contNoItemGubun, #contNoContGubun').on('change', function() {
		contNoDateFrom =  $('#contNoDateFrom').val().replace(/-/g,'');
		contNoDateTo =  $('#contNoDateTo').val().replace(/-/g,'');
		contNoContGubun =  $('#contNoContGubun option:selected').val();
		contNoItemGubun =  $('#contNoItemGubun option:selected').val();
		$('#contNoListTable').DataTable().ajax.reload(function(){});
    });
    
	//작업지시 생성 조회
	let workOrdListTable = $('#workOrdListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "65vh",
		ajax : {
			url : '<c:url value="po/workOrderAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return workOrdDateFrom.replace(/-/g,'')},
				'endDate' : function(){return workOrdDateTo.replace(/-/g,'')},
				'itemGubun' : function(){return itemGubun;},
				'contGubun' : function(){return contGubun;},
				'mainGubun' : function(){return '002';},
			},
		},
		rowId : '',
		columns : [
			{//고객사
				data : 'ordCorpNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '';
					}
				},
			},
			{
				data : 'contGubunNm',
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//충진중량
				data : 'fillingWt',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//작업지시번호
				data : 'workOrdNo'
			},
			{//작업지시일
				data : 'workOrdDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
			{//설비명
				data : 'equipNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '';
					}
				},
			},
			{
				data : 'workChargrNm',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return data;
					} else {
						return '';
					}
				}
			},
			{//지시수량
				data : 'dtlOrdCnt',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//생산수량
				data : 'outputQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//불량수량
				data : 'faultyQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				'className' : 'text-right'
			},
			{//수주상세번호
				data : 'contDtlNo'
			},
		],
		createdRow : function( row, data, dataIndex ) {
		},
		columnDefs: [
	           {"targets": "_all", "className": "text-center"},
	    ],
		order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	   
	});
	
	//작업지시 테이블_length 변경
	html1 = '';
	html1 +=  '<div class="row">&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">작업지시일자</label>';
	html1 += '<input type="date" class="form-control" id="workOrdDateFrom" value="'+serverDateFrom+'" style="max-width:130px;">&nbsp;~ &nbsp;';
	html1 += '<input type="date" class="form-control" id="workOrdDateTo" value="'+serverDateTo+'" style="max-width:130px;">&nbsp;&nbsp;&nbsp;&nbsp;';

	html1 += '<label class="input-label-sm">수주구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += 	'<select name="contGubun" id="contGubun" title="" class="select w80 col-12 custom-select">';
	html1 += 	'</select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += 	'<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select">';
	html1 += 	'</select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';

	$('#workOrdListTable_length').html(html1);
	
	$('#workOrdDateFrom').val(serverDateFrom);
    $('#workOrdDateTo').val(serverDateTo);
	selectBoxAppend(itemGubunCode, "itemGubun", "", "1");
	selectBoxAppend(contGubunCode, "contGubun", "", "1");
    
	//작업지시 조건 선택시
	$('#workOrdDateFrom, #workOrdDateTo, #itemGubun, #contGubun').on('change', function() {
		workOrdDateFrom =  $('#workOrdDateFrom').val().replace(/-/g,'');
		workOrdDateTo =  $('#workOrdDateTo').val().replace(/-/g,'');
		contGubun =  $('#contGubun option:selected').val();
		itemGubun =  $('#itemGubun option:selected').val();
		$('#workOrdListTable').DataTable().ajax.reload(function(){});
    });

	//수주지시별 탭 클릭시
	$('#tab1Nav').on('click',function(){
		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');
		
		$('#contNoListTable').DataTable().ajax.reload( function () {});
	});

	//작업지시별 탭 클릭시
	$('#tab2Nav').on('click',function(){
		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');

		$('#workOrdListTable').DataTable().ajax.reload( function () {});

		setTimeout(function(){
        	$('#workOrdListTable').DataTable().draw();
      	},150);
	});
</script>

</body>
</html>
