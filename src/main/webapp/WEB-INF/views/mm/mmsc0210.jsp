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
				<li class="breadcrumb-item active">생산 공정 불량율 현황</li>
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
						<label class="input-label-sm mr-2">생산일자</label>
						<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-2" style="max-width:70px;">
						<button type="button"  class="btn btn-primary ml-2" id="btnRetv">조회</button>
					</div>
				
					<div class="table-responsive">
						<table id="table" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>작업지시번호</th>
									<th>품명</th>
									<th>품목구분</th>
									<th>칼라</th>
									<th class="text-center">생산수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
								<c:forEach items="${baseInfoAdmList}" var="info">
									<th class="text-center">${info.baseInfoNm}</th>
								</c:forEach>
									<th class="text-center">품목별 불량율</th>
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
	let currentHref = "mmsc0210";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산 공정 불량율 현황"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";

	var workStartTimeVal = serverDateTo.substring(0, 7);

	
    //목록 조회
	let table = $('#table').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 100000,
		scrollY : "68vh",
		ajax : {
			url : '<c:url value="mm/workPrcssFaultyRateList"/>',
			type : 'GET',
			data : {
				'workStartTime' : function() {return workStartTimeVal.replace(/-/g,'')},
			},
		},
		columns : [ 
			{
				data: 'mainGubun'	 	
			},
			{
				data: 'workOrdNo'	 	
			},
			{
				data: 'itemCd'	 	
			},
			{
				data: 'itemGubun'	 	
			},
			{
				data: 'itemColor'	 	
			},
			{
				data: 'outputQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, "className": "text-right" 	 	
			},
			{
				data: 'fairQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, "className": "text-right" 	 	
			},
			{
				data: 'faultyQty',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, "className": "text-right" 	 	
			},

		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			{
				data: 'f${info.baseInfoCd}',
				render: function(data, type, row, meta) {
					if(data!=null){
						return addCommas(data);
					}else{
						return '';
					}
				}, "className": "text-right" 	 	
			},
		</c:forEach>
			{
				data: 'faultyRate'
			},
		],
		columnDefs : [],
		drawCallback : function(){
			
		},
		buttons : ['copy','excel','print'],
	    order: [
	         
	    ],
	    drawCallback: function() {

	    	let api = this.api();
			let data = api.data();
			
	    	let totalOutputQty = 0;
			let totalFairQty = 0;
			let totalFaultyQty = 0;
			let totalFaultyRate = 0;
			
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let f${info.baseInfoCd} = 0;
		</c:forEach>

			for(var i=0;i<data.length;i++) {
				totalOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				totalFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				totalFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				f${info.baseInfoCd} += parseFloat(data[i].f${info.baseInfoCd}==null?0:data[i].f${info.baseInfoCd});
			</c:forEach>

				totalFaultyRate = Math.round((totalFaultyQty/totalOutputQty)*100,2)
				
				console.log("data.length:"+data.length)
				console.log("i:"+i)
				if(i+1 == data.length) { // 마지막 데이터일 경우
					let html1 = '';
					html1 += '<tr style="background-color: #92c2e9f7; color: #222230;">';
					html1 += '<th colspan="7" style="background-color: #92c2e9f7; color: #222230; text-align:center;">유형별 불량율</th>';
					html1 += '<th colspan="1" style="background-color: #96e1a7; color: #222230; text-align:center;">'+addCommas(totalFaultyRate)+'%'+'</th>';
				<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
					html1 += '<th class="text-right" style="background-color:white; color: #222230;">'+ addCommas(Math.round((f${info.baseInfoCd}/totalFaultyQty)*100,2))+'%'+'</th>';
				 </c:forEach>
					html1 += '<th style="background-color:white; color: #222230;"></th>';

					$(table.row(i).node()).after(html1);


					let html2 = '';
					html2 += '<tr style="background-color: #f7c46c; color: #222230;">';
					html2 += '<th colspan="4" style="background-color: #f7c46c; color: #222230; text-align:center;">총 합계</th>';
					html2 += '<th colspan="" style="background-color: #f7c46c; color: #222230;"></th>';
					html2 += '<th class="totalOutputQty text-right" style="background-color: #f7c46c; color: #222230;">'+addCommas(totalOutputQty)+'</th>';
					html2 += '<th class="totalFairQty text-right" style="background-color: #f7c46c; color: #222230;">'+addCommas(totalFairQty)+'</th>';
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #f7c46c; color: #222230;">'+addCommas(totalFaultyQty)+'</th>';

				<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
					html2 += '<th class="text-right" style="background-color: #f7c46c; color: #222230;">'+ addCommas(f${info.baseInfoCd})+'</th>';
				 </c:forEach>
					html2 += '<th class="text-center" style="background-color: #f7c46c; color: #222230;">'+ addCommas(totalFaultyRate)+'%'+'</th>';

					$(table.row(i).node()).after(html2);

				}

			}
	    }
	});
    

	$('#demo-2').val(serverDateTo.substring(0, 7));
	
	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		workStartTimeVal = $('#demo-2').val();
		$('#table').DataTable().ajax.reload( function () {});
    });
	
	//전체조회 버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		workStartTimeVal = "";
		$('#table').DataTable().ajax.reload( function () {});  
	});

	
	$('#demo-2').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : 2020,
		startYear : 1900,
		finalYear : 2212
	});
	
</script>

</body>
</html>
