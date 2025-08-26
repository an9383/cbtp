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
				<li class="breadcrumb-item active">일판매현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="height: 850px;">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="daySalesPlanAdmTable"
							class="table table-bordered tr_highlight_row">
							<colgroup>
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="min-width: 25px">No.</th>
									<th style="min-width: 70px">품목코드</th>
									<th style="min-width: 40px">구분</th>
									<th style="min-width: 45px">확정여부</th>
									<th style="min-width: 70px">업체코드</th>
									<th style="min-width: 100px">업체명</th>
									<th style="min-width: 100px">품번</th>
									<th style="min-width: 250px">품명</th>
									<!-- <th style="min-width: 70px">실칼라</th> -->
									<th class="text-center" style="min-width: 60px">월계획</th>
									<th class="text-center" style="min-width: 60px">합계</th>
									<th class="text-center" style="min-width: 50px">1</th>
									<th class="text-center" style="min-width: 50px">2</th>
									<th class="text-center" style="min-width: 50px">3</th>
									<th class="text-center" style="min-width: 50px">4</th>
									<th class="text-center" style="min-width: 50px">5</th>
									<th class="text-center" style="min-width: 50px">6</th>
									<th class="text-center" style="min-width: 50px">7</th>
									<th class="text-center" style="min-width: 50px">8</th>
									<th class="text-center" style="min-width: 50px">9</th>
									<th class="text-center" style="min-width: 50px">10</th>
									<th class="text-center" style="min-width: 50px">11</th>
									<th class="text-center" style="min-width: 50px">12</th>
									<th class="text-center" style="min-width: 50px">13</th>
									<th class="text-center" style="min-width: 50px">14</th>
									<th class="text-center" style="min-width: 50px">15</th>
									<th class="text-center" style="min-width: 50px">16</th>
									<th class="text-center" style="min-width: 50px">17</th>
									<th class="text-center" style="min-width: 50px">18</th>
									<th class="text-center" style="min-width: 50px">19</th>
									<th class="text-center" style="min-width: 50px">20</th>
									<th class="text-center" style="min-width: 50px">21</th>
									<th class="text-center" style="min-width: 50px">22</th>
									<th class="text-center" style="min-width: 50px">23</th>
									<th class="text-center" style="min-width: 50px">24</th>
									<th class="text-center" style="min-width: 50px">25</th>
									<th class="text-center" style="min-width: 50px">26</th>
									<th class="text-center" style="min-width: 50px">27</th>
									<th class="text-center" style="min-width: 50px">28</th>
									<th class="text-center" style="min-width: 50px">29</th>
									<th class="text-center" style="min-width: 50px">30</th>
									<th class="text-center" style="min-width: 50px">31</th>
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
#th {
	padding-bottom: 12px;
}

.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp"%>
<script>
	let currentHref = "bssc0160";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "일판매현황");

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = null;

	var dt = new Date();
	var year = "";
	var com_year = dt.getFullYear();
	var mon = dt.getMonth() + 1;

	var salesYear = com_year;
	var salesMon = mon < 10 ? "0" + mon : mon;
	var confirmYn = '';
	var urlData = '';
	var mainGubun = '';
	var excelTitle = salesYear + '년' + salesMon + '월 일 판매계획';

	// 목록조회
	let daySalesPlanAdmTable = $('#daySalesPlanAdmTable').DataTable({
		dom :  "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 100000000,
		scrollX : true,
		scrollCollapse : true,
		fixedColumns : {
			leftColumns : 10
		},
		scrollY : "640px",
		ajax : {
			url : '<c:url value="bs/daySalesPlanAdmList" />',
			type : 'GET',
			data : {
				'salesYear' : function() {
					return salesYear;
				},
				'salesMon' : function() {
					return salesMon;
				},
				'confirmYn' : function() {
					return confirmYn;
				},
				'urlData' : function() {
					return urlData;
				},
				'mainGubun' : function() {
					return mainGubun;
				},
			},
		},
		rowId : 'itemSeq',
		columns : [ {
			render : function(data, type, row, meta) {
				return meta.row + 1;
			}
		}, {
			data : 'itemSeq'
		}, {
			data : 'mainGubunNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return data;
				} else {
					return '-';
				}
			}
		}, {
			data : 'dayConfirmYnNm',
			render : function(data, type, row, meta) {
				if (data != null) {
					return data;
				} else {
					return '미확정';
				}
			}
		}, {
			data : 'itemCus'
		}, {
			data : 'itemCusNm'
		}, {
			data : 'itemCd'
		}, {
			data : 'itemNm'
		}, /* {
										data : 'itemColor'
									}, */{
			data : 'salesMonQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
	
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesMonQty_'+row['itemSeq']+'" value="'+data+'" style="text-align:right; border:none;" readonly/>';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesMonQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
				} */
	
			},
			'className' : 'text-right'
		}, {
			data : 'salesSumQty',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="sumDayQty_'+row['itemSeq']+'" value="'+data+'" style="text-align:right; border:none;" readonly/>';
				}else{
					return '<input type="text" class="form-control number-float0" name="sumDayQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
				} */
			},
		}, {
			data : 'd01',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" onchange="javascript:sumDayQty();" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd02',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd03',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd04',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd05',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd06',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd07',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd08',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd09',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd10',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd11',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd12',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd13',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd14',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd15',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd16',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd17',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd18',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd19',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd20',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd21',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd22',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd23',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd24',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					 return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				}*/
			}
		}, {
			data : 'd25',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd26',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd27',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd28',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd29',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd30',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		}, {
			data : 'd31',
			render : function(data, type, row, meta) {
				if (data != null) {
					return rmDecimal(data);
				} else {
					return '0';
				}
				/* if(data!=null){
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
				}else{
					return '<input type="text" class="form-control number-float0" name="salesDayQty" style="text-align:right" value="'+0+'" />';
				} */
			}
		},
		/* {data : 'salesMonQty',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'salesSumQty',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		}, 
		{data : 'd01',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd02',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd03',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd04',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd05',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd06',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd07',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd08',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd09',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd10',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd11',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd12',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd13',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd14',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd15',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd16',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd17',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd18',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd19',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd20',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		ghk						},
		{data : 'd21',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd22',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd23',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd24',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd25',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd26',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd27',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd28',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd29',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd30',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		},
		{data : 'd31',
			render : function(data,type,row,meta){
				if(data!=null){
					return rmDecimal(data);
				}else{
					return '0';
				}
			},
		}, */
		],
		columnDefs : [ {
			"targets" : "_all",
			"className" : "text-center"
		}, {
			"visible" : false,
			"targets" : [ 1, 3 ]
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [
				'copy',
				{
					extend : 'excel',
					title : '일 판매계획',
					filename : function() {
						var year = $('#YEAR').val();
						var mon = $('#MONTH').val();
						return year + '년 ' + mon + '일 일 판매계획';
					},
					exportOptions : {
						columns : [ 0, 1, 2, 4, 5, 7, 8, 9, 10,
								11, 12, 13, 14, 15, 16, 17, 18,
								19, 20, 21, 22, 23, 24, 25, 26,
								27, 28, 29, 30, 31, 32, 33, 34,
								35, 36, 37, 38, 39, 40 ],
					},
					customize : function(xlsx) {
						var sheet = xlsx.xl.worksheets['sheet1.xml'];
						var col = $('col', sheet);
	
						col.each(function() {
							$(this).attr('width', 7);
						});
	
						$(col[0]).attr('width', 5);
						$(col[2]).attr('width', 10);
						$(col[3]).attr('width', 15);
						$(col[4]).attr('width', 15);
						$(col[5]).attr('width', 20);
						$(col[7]).attr('width', 30);
						$(col[8]).attr('width', 10);
						$(col[9]).attr('width', 10);
						$(col[10]).attr('width', 10);
					}
				}, 'print' ],
		drawCallback : function() {
		}
	});

	//daySalesPlanAdmTable의 dataTables_length 추가
	var html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">년도</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';

	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="mainGubun" id="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">레이저</option>';
	html1 += '<option value="002">후가공</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';

	//html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;';

	/* html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>'; */

	html1 += '</div>';
	html1 += '<button type="button" class="btn btn-primary float-right d-none" id="btnConfirm">계획확정</button>';
	//html1 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnSave">저장</button>';
	html1 += '</div>';

	$('#daySalesPlanAdmTable_length').html(html1);

	// 년도/월/구분/확정여부 클릭 시 
	$('#YEAR,#MONTH,#mainGubun,#selectView').on('change', function() {
		salesYear = $('#YEAR option:selected').val();
		salesMon = $('#MONTH option:selected').val();
		//confirmYn = $('#selectView option:selected').val();
		mainGubun = $('#mainGubun option:selected').val();
		urlData = '';
		excelTitle = salesYear + '년' + salesMon + '월 일 판매계획';

		$('#daySalesPlanAdmTable').DataTable().ajax.reload(function() {
		});
	})

</script>
<script>
	$(document).ready(function() {
		setDateBox();
	});
	// select box 연도 , 월 표시
	function setDateBox() {
		// 발행 뿌려주기
		$("#YEAR").append("<option value=''>년도</option>");
		// 올해 기준으로 -1년부터 +5년을 보여준다.
		for (var y = (com_year - 1); y <= (com_year + 5); y++) {
			$("#YEAR").append(
					'<option value="' + y + '"'
							+ (y == com_year ? 'selected' : '') + '>' + y + '년'
							+ '</option>');
		}

		// 월 뿌려주기(1월부터 12월)
		var month;
		$("#MONTH").append("<option value=''>월</option>");
		for (var i = 1; i <= 12; i++) {
			$("#MONTH").append(
					'<option value="' + (i < 10 ? '0' + i : i) + '" '
							+ (i == mon ? 'selected' : '') + '>' + i + '월'
							+ '</option>');
		}
	}
</script>

</body>
</html>
