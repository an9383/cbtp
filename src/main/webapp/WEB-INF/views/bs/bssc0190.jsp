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
				<li class="breadcrumb-item active">일자재입고현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar overflow-hidden" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="col-sm-12">
						<select class="custom-select mb-1" id="sales" style="max-width:fit-content; display:inline" onchange="reloadList"></select>
						<input type="month" class="form-control ml-2" id="month" style="max-width:fit-content; display:inline" onchange="changeMonth()"/>
						<label class="ml-2" style="font-size: 16px; display:inline">월 계획</label>
						<input type="text" class="form-control ml-2" id="monthPlan" style="display:inline; text-align:right" disabled/>
						<label class="ml-2" style="font-size: 16px; display:inline">매입</label>
						<input type="text" class="form-control ml-2" id="monthSales" style="display:inline; text-align:right" disabled/>
						<label class="float-right ml-2" id="achievement" style="font-size: 16px; display:inline">100%</label>
						<label class="float-right ml-2" style="font-size: 16px; display:inline">달성율</label>
					</div>
					<div class="card-body p-0 mt-2">
						<!-- .table-responsive -->
						<div class="table-responsive" style="overflow:auto; width: 99%;">
							<table class="table table-bordered m-0">
								<colgroup>
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
								</colgroup>
								<thead class="thead-light" id="tableTr1">
								</thead>
							</table>
						</div>
						<div class="table-responsive" id="scrollDiv1" style="overflow:auto; height:30em">
							<table id="sell1Table" class="table table-bordered">
								<colgroup>
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
									<col width="4%">
								</colgroup>
								<tbody>
								</tbody>
							</table>
						</div>
						<div class="table-responsive mt-2" style="overflow:auto; width: 99%;">
							<table class="table table-bordered m-0">
								<colgroup>
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
								</colgroup>
								<thead class="thead-light" id="tableTr2">
								</thead>
							</table>
						</div>
						<div class="table-responsive" id="scrollDiv2" style="overflow:auto; height:30em">
							<table id="sell2Table" class="table table-bordered">
								<colgroup>
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
									<col width="5%">
								</colgroup>
								<tbody>
								</tbody>
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

	let currentHref = "bssc0190";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","일자재입고현황"); 

	let monthArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	let month = 0;
	let day = 0;
	let beforeDay = 0
	let sumArr = new Array();

	$("#month").val(moment().format("YYYY-MM"));

	$("#sales").append($("<option value='001'>합계</option>"));
	$("#sales").append($("<option value='002'>원부자재</option>"));
	$("#sales").append($("<option value='003'>상품</option>"));

	changeMonth();
	
	function changeMonth() {
		month = moment($("#month").val()).format("MM");
		day = parseInt(monthArr[month-1]);
		beforeDay = parseInt(monthArr[month-2]);
		$("#tableTr1").empty();
		$("#tableTr2").empty();
		
		$("#tableTr1").append("<th>거래처</th>");
		$("#tableTr1").append("<th>이월</th>");
		for(var i = 5; i >= 0; i--) {
			$("#tableTr1").append("<th>["+(beforeDay - i)+"]</th>");
		}
		for(var i = 1; i <= 13; i++) {
			$("#tableTr1").append("<th>["+i+"]</th>");
		}

		$("#tableTr2").append("<th>거래처</th>");
		for(var i = 14; i <= day; i++) {
			$("#tableTr2").append("<th>["+i+"]</th>");
		}
		$("#tableTr2").append("<th>TOTAL</th>");
// 		reloadList();
	}
	
	function reloadList() {
		var sum = 0;
		var html = '';
		$("#sell1Table").find("tbody").empty();
		$("#sell2Table").find("tbody").empty();
		$("#sell1Table").find("tbody").append("<tr id='total1'></tr>")
		$("#sell2Table").find("tbody").append("<tr id='total2'></tr>")
		for (var i = 0; i <= (day + 7); i++) {
			sumArr[i] = 0;
		}
		for (var i = 0; i < 25; i++) {
			$("#sell1Table").find("tbody").append("<tr id='"+i+"'></tr>")
			$("#sell2Table").find("tbody").append("<tr id='"+i+"'></tr>")
			html = '';
			html += '<td>'+i+'기업</td>';
			sum = 0;
			for (var j = 1; j <= 20; j++) {
				html += '<td style="text-align:right">'+numberComma(j * 10000)+'</td>';
				sumArr[j] += (j * 10000);
				sum += (j * 10000);
				sumArr[0] += sum;
			}
			$("#sell1Table").find("tbody").find("tr#"+i).append(html);
			html = '';
			html += '<td>'+i+'기업</td>';
			for (var j = 21; j <= (day + 7); j++) {
				html += '<td style="text-align:right">'+numberComma(j * 10000)+'</td>';
				sumArr[j] += (j * 10000);
				sum += j;
				sumArr[0] += sum;
			}
			html += '<td style="text-align:right">'+numberComma(sum)+'</td>';
			$("#sell2Table").find("tbody").find("tr#"+i).append(html);
		}
		$("#total1").append("<td>total</td>");
		$("#total2").append("<td>total</td>");
		for (var i = 1; i <= 20; i++) {
			$("#total1").append("<td style='text-align:right'>"+numberComma(sumArr[i])+"</td>");
		}
		for (var i = 21; i <= (day + 7); i++) {
			$("#total2").append("<td style='text-align:right'>"+numberComma(sumArr[i])+"</td>");
		}
		$("#monthPlan").val("800,000,000");
		$("#monthSales").val(numberComma(sumArr[0]));
		$("#total2").append("<td style='text-align:right'>"+numberComma(sumArr[0])+"</td>");
	}
	
	window.GV = { sync1 : null, sync2 : null }

	$("#scrollDiv1").scroll(function () {
		if(GV.sync1 && GV.sync1.id != this.id) return false; 
	    $("#scrollDiv2").scrollTop($("#scrollDiv1").scrollTop());
		GV.sync1 = this; 
		if(GV.sync2) clearTimeout(GV.sync2); 
		GV.sync2 = setTimeout(function(){ 
			GV.sync1 = null;
			GV.sync2 = null; 
		}, 100);

	});
	
	$("#scrollDiv2").scroll(function () {
		if(GV.sync1 && GV.sync1.id != this.id) return false; 
	    $("#scrollDiv1").scrollTop($("#scrollDiv2").scrollTop());
		GV.sync1 = this; 
		if(GV.sync2) clearTimeout(GV.sync2); 
		GV.sync2 = setTimeout(function(){ 
			GV.sync1 = null; 
			GV.sync2 = null; 
		}, 100);
	});

	function numberComma(a) { 
	    return a.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</body>
</html>
