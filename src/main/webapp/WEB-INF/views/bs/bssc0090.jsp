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
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">미출고현황</li>
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
						<table id="deliveryOrderAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>출고요청일</th>
									<th>오더구분</th>
									<th>발주처</th>
									<th>품명(Type)</th>
									<th class="text-center">출고지시량</th>
									<th class="text-center">출하량</th>
									<th class="text-center">미출하량</th>
									<th>납기일</th>
									<th>출고처</th>
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
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0090";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","미출고현황"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";

	//출고처리 목록조회
	let deliveryOrderAdmTable = $('#deliveryOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bs/undeliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() {return serverDateTo.replace(/-/g, '');},
			}
		},
		rowId : '',
		columns : [ {
			data : 'doDate',
			render : function(data, type, row, meata) {
				return moment(data).format("YYYY-MM-DD");
			}
		}, {
			data : 'ordGubunNm'
		}, {
			data : 'poCorpNm'
		}, {
			data : 'itemNm'
		}, {
			data : 'targetQty'
		}, {
			data : 'outputQty'
		}, {
			data : 'remainQty'
		}, {
			data : 'dlvDate',
			render : function(data, type, row, meata) {
				return moment(data).format("YYYY-MM-DD");
			}
		}, {
			data : 'doCorpNm'
		}, ],
		order : [ [ 0, 'desc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs: [
			{ "targets": [4,5,6] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
    	],
	});

	var sysdate = "${serverTime}";

	var html1 = '<div class="row">';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '</div>';

	$('#deliveryOrderAdmTable_length').html(html1);
	$('#doDateFrom').val(serverDateFrom);
	$('#doDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#doDateFrom').val();
		serverDateTo = $('#doDateTo').val();
		$('#deliveryOrderAdmTable').DataTable().ajax.reload(function() {
		});
	});
</script>

</body>
</html>
