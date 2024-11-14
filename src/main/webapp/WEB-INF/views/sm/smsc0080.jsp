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
               	<li class="breadcrumb-item"><a href="#">품질관리</a></li>
               	<li class="breadcrumb-item active">변경이력관리(예전)</li>
           	</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">	
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="table-responsive">
						<table class="table table-bordered" id="inventoryTable">
							<colgroup>
	                          	<col width="13%">
	                          	<col width="13%">
	                          	<col width="17%">
	                          	<col width="17%">
	                          	<col width="10%">
	                          	<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<tr>
		                        	<th class="text-center-th">부서</th>
		                        	<th class="text-center-th">성명</th>
		                        	<th class="text-center-th">관리명</th>
		                        	<th class="text-center-th">항목명</th>
		                        	<th class="text-center-th">변경일자</th>				   
									<th class="text-center-th">변경내역</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div> <!-- /.left-list -->
		</div> <!-- /.row -->
	</div> <!-- / #main  -->
</div> <!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	$(document).attr("title", "변경이력관리(예전)");
	let currentHref = "smsc0080";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');


	let preInWhsDateFromCal =  "${serverDateFrom}";
	let preInWhsDateToCal =  "${serverDateTo}";
	let preInWhsDateCal =  "${serverDate}";	
	let matrlGubunCd = null;
	
	let startDate = moment(preInWhsDateFromCal).format('YYYY-MM-DD').replace(/-/g, "");
	let LastDate = moment(preInWhsDateToCal).format('YYYY-MM-DD').replace(/-/g, "");
	let infinityCheck = false;
	
	//변경이력관리 테이블
	let inventoryTable = $('#inventoryTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
	    language: lang_kor,
	    paging: true,
	    info: false,
	    searching: true,
	    ordering: true,
	    processing: false,
	    autoWidth: false,
	    lengthChange: true,
	    pageLength: 20,
	    ajax : {
			url : '<c:url value="/sm/systemChangeLogList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return startDate;},
				'LastDate' : function(){return LastDate;},
			},
		},
		columns : [
  			{//부서
				data: 'departmentNm' 	
			},
  			{//성명
				data: 'userNm' 		
			},
  			{//관리명
				data: 'menuNm' 		
			}, 
  			{//항목명
				data: 'menuDtlNm' 	
			},
  			{//변경일자
				data: 'regDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
					
				}
			},
  			{//변경내역
				data: 'changeHis'		
			},
  		],
	    order: [],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs: [
// 			{ targets: [0,6], visible : false },
	    ],
	    drawCallback : function() {
	    	$("#inventoryTable_filter").find("label").addClass("m-0");
        }
	
	});

	var html1 = '<div class="row">&nbsp;<label class="input-label-sm">조회일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preStartWhsDate" name="preStartWhsDate" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preStartWhsDate,preStartWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preStartWhsDateCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '<label class="input-label-sm">&nbsp;&nbsp;&nbsp;~</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preLastWhsDate" name="preLastWhsDate"disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preLastWhsDate,preLastWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preLastWhsDateCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';

	html1 += '&nbsp;&nbsp;&nbsp;';
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv" onclick="retvOnClick()">조회</button></div>';
	
	
	$('#inventoryTable_length').html(html1);
	
	$('#preStartWhsDate').val(moment(preInWhsDateFromCal).format('YYYY-MM-DD'));
	$('#preLastWhsDate').val(moment(preInWhsDateToCal).format('YYYY-MM-DD'));
	
	startDate = $('#preStartWhsDate').val().replace(/-/g, "");
	LastDate = $('#preLastWhsDate').val().replace(/-/g, "");

	function retvOnClick(){
		startDate = $('#preStartWhsDate').val().replace(/-/g, "");
		LastDate = $('#preLastWhsDate').val().replace(/-/g, "");
		
		$('#inventoryTable').DataTable().ajax.reload(function(){});
	}

</script>
</body>
</html>
