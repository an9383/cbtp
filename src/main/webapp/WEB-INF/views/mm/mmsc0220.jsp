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
				<li class="breadcrumb-item active">제조리드타임(봉제)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card">
				
					<div class="row mb-2">
						<label class="input-label-sm mr-2">수주일시</label>
						<input class="form-control mr-2" type="date" id="regDateFrom" style="width:125px;"/>
						<label class="input-label-sm mr-2">~</label>
						<input class="form-control mr-2" type="date" id="regDateTo" style="width:125px;" />
						<button type="button"  class="btn btn-primary mr-1" id="btnRetv">조회</button>
						<button type="button"  class="btn btn-primary" id="btnAllRetv">전체조회</button>
					</div>
				    
				
					<div class="table-responsive">
						<table id="subTotalTable" class="table table-bordered mb-1">
							<colgroup>
								<col width="52%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<tbody class="thead-light">
								<tr>
									<td></td>
									<th>총 주문 건수</th>
									<td id="leadCount"></td>
									<th>총 준비시간</th>
									<td id="totalLeadTime"></td>
									<th>평균 준비시간</th>
									<td id="avgLeadTime"></td>
								</tr>
							</tbody>
						</table>
						<table id="mainTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
							</colgroup> 
							<thead class="thead-light">
								<tr>
									<th>생산실적번호</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>수주일시</th>
									<th>생산준비 완료일시</th>
									<th>제조리드타임</th>
									<th>납기일</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0220";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","제조리드타임(봉제)"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";

	var regDateFromVal = serverDateFrom;
	var regDateToVal = serverDateTo;
	/* var workStartTimeFromVal = serverDateFrom;
	var workStartTimeToVal = serverDateTo;
	var workEndTimeFromVal = serverDateFrom;
	var workEndTimeToVal = serverDateTo; */

	subTotalData(); //집계표
	
    //목록 조회
	let mainTable = $('#mainTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 100000,
		scrollY : "65vh",
		ajax : {
			url : '<c:url value="mm/leadTimeSewingList"/>',
			type : 'GET',
			data : {
				'regDateFrom' : function() {return regDateFromVal;},
				'regDateTo' : function() {return regDateToVal;},
			/* 	'workStartTimeFrom' : function() {return workStartTimeFromVal;},
				'workStartTimeTo' : function() {return workStartTimeToVal;},
				'workEndTimeFrom' : function() {return workEndTimeFromVal;},
				'workEndTimeTo' : function() {return workEndTimeToVal;} */
			},
		},
		columns : [ 
			{//생산실적번호
				data: 'workOrdNo'
			},
			{//차종
				data: 'itemModel'
			},
			{//품번
				data: 'itemCd'
			},
			{//품명
				data: 'itemNm'
			},
			{//수주일시
				data: 'regDate',
				render: function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				},
				"className": "text-center" 	
			},
			{//생산준비 완료일시
				data: 'workStartTime',
				render: function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				},
				"className": "text-center" 	
			},
			{//제조리드타임
				render: function(data, type, row, meta) {
					return row['hourTime']+":"+row['minTime']+":"+row['secTime'];
				},
				"className": "text-center"
			},
			{//납기일
				data: 'workEndTime',
				render: function(data, type, row, meta) {
					if (data != null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				},
				"className": "text-center" 	
			},
		],
		columnDefs : [],
		drawCallback : function(){
			
		},
		buttons : ['copy', 'excel', 'print'],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
    
    
	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">수주일시</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="regDateFrom" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="regDateTo" style="width:125px;" />';
	    html1 += '	<button type="button"  class="btn btn-primary mr-1" id="btnRetv">조회</button>';
	    html1 += '	<button type="button"  class="btn btn-primary" id="btnAllRetv">전체조회</button>';
	 	html1 += '</div>';
    

	$('#regDateFrom').val(serverDateFrom);
	$('#regDateTo').val(serverDateTo);
	/* $('#workStartDateFrom').val(serverDateFrom);
	$('#workStartDateTo').val(serverDateTo);
	$('#workEndDateFrom').val(serverDateFrom);
	$('#workEndDateTo').val(serverDateTo); */
	
	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		regDateFromVal = $('#regDateFrom').val();
		regDateToVal = $('#regDateTo').val();
		/* workStartTimeFromVal = $('#workStartDateFrom').val();
		workStartTimeToVal = $('#workStartDateTo').val();
		workEndTimeFromVal = $('#workEndDateFrom').val();
		workEndTimeToVal = $('#workEndDateTo').val(); */
		subTotalData();
		$('#mainTable').DataTable().ajax.reload( function () {});
    });
	
	//전체조회 버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		regDateFromVal = "";
		regDateToVal = "";
		/* workStartTimeFromVal = "";
		workStartTimeToVal = "";
		workEndTimeFromVal = "";
		workEndTimeToVal = ""; */
		subTotalData();
		$('#mainTable').DataTable().ajax.reload( function () {});  
	});


	function subTotalData(){

		$.ajax({
			url :  '<c:url value="mm/leadTimeSubTotalList" />',
			type : 'GET',
			data : {
				'regDateFrom' : function() {return regDateFromVal;},
				'regDateTo' : function() {return regDateToVal;},
			},
			success : function(res){
				$('#leadCount').text(res.leadCountData+"건");
				$('#totalLeadTime').text(res.totalLeadTimeData=="::"?"":res.totalLeadTimeData);
				$('#avgLeadTime').text(res.avgLeadTimeData=="::"?"":res.avgLeadTimeData);
			}
			
		})
	}

	
</script>

</body>
</html>
