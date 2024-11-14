<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">매입 계획 대비 실적 현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar overflow-hidden" id="left-list" style="width: 50%;">
				<div class="card">
					<div class="col-sm-12">
						<input type="number" min="1900" max="2099" step="1" class="form-control m-0" id="year" style="max-width:fit-content; display:inline" onchange="changeYear()"/>
					</div>
					<div class="card-body p-0 mt-2">
						<!-- .table-responsive -->
						<div class="table-responsive">
							<table id="salesRatioTable" class="table table-bordered m-0">
								<colgroup>
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>월</th>
										<th>계획</th>
										<th>실적</th>
										<th>비율</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th class="text-left">TOTAL</th>
										<th class="text-right salesTotal"></th>
										<th class="text-right storeTotal"></th>
										<th class="text-right ratio"></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--===========================================-->
			<!-- /.card -->
			<!--===========================================-->
			
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width: 49%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 pr-0 pb-2 pt-0 pl-0">
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body p-0 mt-4">
						<!-- .table-responsive -->
						<div class="table-responsive">
							<table id="salesRatioTable" class="table table-bordered m-0 mt-2">
								<colgroup>
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>월</th>
										<th>계획</th>
										<th>실적</th>
										<th>비율</th>
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

	let currentHref = "bssc0220";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","매입 계획 대비 실적 현황"); 

	let day = 0;
	let sumArr = new Array();
	let salesTotal = 0;
	let storeTotal = 0;

	let arrtemp=[1125914, 1001685,1312513]
	let arrtemp2=[429153, 403609, 547111]

	$("#sales").append($("<option value='001'>매출</option>"));
	$("#year").val(moment().format("YYYY"));
	
	// 목록
	let salesRatioTable = $('#salesRatioTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : true,
		searching : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: true,
        pageLength: 20000,
        scrollY: '60vh',
        select: {
            style: 'single',
            toggleable: false,
            item: 'row',
            info: false  
        },
		ajax : {
			url : '<c:url value="/bs/custSatisAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() { return "2021-01-01"; },
				'endDate' 	: function() { return "2021-12-31"; } 
			}
		},
		columns : [
		    	{	className: "text-left",
		    		render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1;
	    			}
		    	},
		    	{	className: "text-right",
		    		render: function(data, type, row, meta) {	
						return numberComma(arrtemp[meta.row + 1]);
	    			}
		    	},
		    	{	className: "text-right",
		    		render: function(data, type, row, meta) {			
						return numberComma(arrtemp2[meta.row + 1]);
	    			}
		    	},
		    	{	className: "text-right",
		    		render: function(data, type, row, meta) {	
			    		var per = arrtemp2[meta.row + 1] / arrtemp[meta.row + 1]	
						return (per * 100).toFixed(1) + "%";
	    			}
		    	},
		],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all"
		}],
		order : [ [ 0, 'asc' ] ],
        buttons: [ ],
	    drawCallback: function() {
		    $('#salesRatioTable_filter').addClass('d-none');
		    salesTotal = 0;
		    storeTotal = 0;
		    salesTotal += arrtemp[1];
		    salesTotal += arrtemp[2];
		    storeTotal += arrtemp2[1];
		    storeTotal += arrtemp2[2];
		    $(".salesTotal").empty();
		    $(".salesTotal").append(numberComma(salesTotal));
		    $(".storeTotal").empty();
		    $(".storeTotal").append(numberComma(storeTotal));
		    $(".ratio").empty();
		    $(".ratio").append((storeTotal / salesTotal * 100).toFixed(1) + "%")
		    $('#salesRatioTable').find('tfoot').empty();
		}
	});

	function numberComma(a) { 
	    return a.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</body>
</html>
