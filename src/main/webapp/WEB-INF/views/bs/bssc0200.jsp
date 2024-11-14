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
				<li class="breadcrumb-item active">자재 거래처별 월 입고현황</li>
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
						<input type="number" min="1900" max="2099" step="1" class="form-control ml-2" id="year" style="max-width:fit-content; display:inline" onchange="changeYear()"/>
						<label class="float-right ml-2" id="yearSales" style="font-size: 16px; display:inline">0</label>
						<label class="float-right ml-2" style="font-size: 16px; display:inline">총매출</label>
					</div>
					<div class="card-body p-0 mt-2">
						<!-- .table-responsive -->
						<div class="table-responsive" style="overflow:auto; width: 99%;">
							<table class="table table-bordered m-0">
								<colgroup>
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>거래처</th>
										<th>1월</th>
										<th>2월</th>
										<th>3월</th>
										<th>4월</th>
										<th>5월</th>
										<th>6월</th>
										<th>7월</th>
										<th>8월</th>
										<th>9월</th>
										<th>10월</th>
										<th>11월</th>
										<th>12월</th>
										<th>TOTAL</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive" id="scrollDiv1" style="overflow:auto; height:60em">
							<table id="sell1Table" class="table table-bordered">
								<colgroup>
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
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

	let currentHref = "bssc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","자재 거래처별 월 입고현황"); 

	let day = 0;
	let sumArr = new Array();

	$("#sales").append($("<option value='001'>매출</option>"));
	$("#year").val(moment().format("YYYY"));
	
// 	reloadList()
	
	function changeYear() {
// 		reloadList();
	}
	
	function reloadList() {
		var sum = 0;
		var html = '';
		$("#sell1Table").find("tbody").empty();
		$("#sell1Table").find("tbody").append("<tr id='total1'></tr>")
		for (var i = 0; i <= 12; i++) {
			sumArr[i] = 0;
		}
		for (var i = 0; i < 25; i++) {
			$("#sell1Table").find("tbody").append("<tr id='"+i+"'></tr>")
			html = '';
			html += '<td>'+i+'기업</td>';
			sum = 0;
			for (var j = 1; j <= 12; j++) {
				html += '<td style="text-align:right">'+numberComma(j * 10000)+'</td>';
				sumArr[j] += (j * 10000);
				sum += (j * 10000);
				sumArr[0] += sum;
			}
			html += '<td style="text-align:right">'+numberComma(sum)+'</td>';
			$("#sell1Table").find("tbody").find("tr#"+i).append(html);
		}
		$("#total1").append("<td>TOTAL</td>");
		for (var i = 1; i <= 12; i++) {
			$("#total1").append("<td style='text-align:right'>"+numberComma(sumArr[i])+"</td>");
		}
		$("#yearSales").text(numberComma(sumArr[0]));
		$("#total1").append("<td style='text-align:right'>"+numberComma(sumArr[0])+"</td>");
	}

	function numberComma(a) { 
	    return a.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</body>
</html>
