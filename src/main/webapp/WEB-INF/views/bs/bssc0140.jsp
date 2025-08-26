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
				<li class="breadcrumb-item active">일판매계획</li>
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
	<!-- Modal Start-->
	<div class="modal fade" id="daySalesPlanDayPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="daySalesPlanDayPopupLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="daySalesPlanDayPopupLabel">일별 계획수량
						등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table table-sm table-bordered">
							<colgroup>
								<col width="10%">
								<col width="25%">
								<col width="10%">
								<col width="25%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<tr>
								<th>품번</th>
								<td><input type="text" class="form-control" id="itemCd"
									style="min-width: 100%; text-align: center;" disabled /> <input
									type="hidden" id="itemSeq" /></td>
								<th>품번</th>
								<td><input type="text" class="form-control" id="itemNm"
									style="min-width: 100%; text-align: center;" disabled /></td>
							</tr>
							<tr>
								<th>년/월</th>
								<td><input type="text" class="form-control"
									id="planYearMon" style="min-width: 100%; text-align: center;"
									disabled /></td>
								<th>월계획</th>
								<td><input type="text" class="form-control"
									id="salesMonQty" style="min-width: 100%; text-align: right;"
									disabled /></td>
								<th>일 계획 합계</th>
								<td><input type="text" class="form-control" id="sumDayQty"
									value="0" style="min-width: 100%; text-align: right;" disabled /></td>
							</tr>
						</table>


						<table id="daySalesPlanDayPopupTable"
							class="table table-sm table-bordered">
							<colgroup>
							</colgroup>
							<tbody>
								<tr>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th>10</th>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="day1"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day2"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day3"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day4"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day5"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day6"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day7"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day8"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day9"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day10"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
								</tr>
								<tr>
									<td colspan="10"></td>
								</tr>
								<tr>
									<th>11</th>
									<th>12</th>
									<th>13</th>
									<th>14</th>
									<th>15</th>
									<th>16</th>
									<th>17</th>
									<th>18</th>
									<th>19</th>
									<th>20</th>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="day11"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day12"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day13"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day14"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day15"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day16"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day17"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day18"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day19"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day20"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
								</tr>
								<tr>
									<td colspan="10"></td>
								</tr>
								<tr>
									<th>21</th>
									<th>22</th>
									<th>23</th>
									<th>24</th>
									<th>25</th>
									<th>26</th>
									<th>27</th>
									<th>28</th>
									<th>29</th>
									<th>30</th>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="day21"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day22"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day23"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day24"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day25"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day26"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day27"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day28"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day29"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td><input type="text" class="form-control" id="day30"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
								</tr>
								<tr>
									<td colspan="10"></td>
								</tr>
								<tr>
									<th>31</th>
									<th colspan="10"></th>
								</tr>
								<tr>
									<td><input type="text" class="form-control" id="day31"
										name="day" value="0" onclick="this.select()"
										style="text-align: right;" /></td>
									<td colspan="10"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary float-right"
							id="btnSave">저장</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
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
	let currentHref = "bssc0140";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "일판매계획");

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
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12 col-md-1 mr-6 mt-3'f><'col-sm-12 col-md-8 mt-3'B>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
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
			$('#daySalesPlanAdmTable > tbody > tr').each(function(index, item) {
				var tIdx = index;
			
				$('#daySalesPlanAdmTable tbody tr').eq(tIdx).eq(0).find('td').eq(6).attr('style','background:yellow;');
				$('#daySalesPlanAdmTable tbody tr').eq(tIdx).eq(0).find('td').eq(7).attr('style','background:yellow;');
				
		
			});
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

	/* $('#btnRetv').on('click',function(){
		salesYear =  $('#YEAR option:selected').val();
		salesMon =  $('#MONTH option:selected').val();
		confirmYn =  $('#selectView option:selected').val();
		urlData ='';
		mainGubun =  $('#mainGubun option:selected').val();
		excelTitle = salesYear+'년'+salesMon+'월 일 판매계획';
		
		$('#daySalesPlanAdmTable').DataTable().ajax.reload( function () {});
	}) */

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

	//일판매계획 보기
	/* $('#daySalesPlanAdmTable tbody').on('click','tr td',function() {
		$(this).css('background-color','pink');
	});  */

	//일판매계획 더블 클릭 시
	$('#daySalesPlanAdmTable tbody').on('dblclick','tr',function() {
		var rowId = $(this).attr('id');

		console.log("rowId:" + rowId);

		if (rowId != null && rowId != "") { //일계획 수량을 더블클릭할 경우

			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				$('#daySalesPlanAdmTable').DataTable().$(
						'tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}

			$.ajax({
				url : '<c:url value="bs/daySalesPlanAdmRead2" />',
				type : 'GET',
				data : {
					'salesYear' : function() {
						return salesYear;
					},
					'salesMon' : function() {
						return salesMon;
					},
					'itemSeq' : function() {
						return rowId;
					},
				},
				success : function(res) {
					var data = res.data;

					//월판매계획 값
					$('#salesMonQty').val(res.salesMonQty == null ? "0": rmDecimal(res.salesMonQty));
					//년/월
					$('#planYearMon').val($('#YEAR').val()+ " / "+ $('#MONTH').val());

					//일계획이 등록된 경우
					if (data.length > 0) {

						//계획 확정된 건은 일자별 수량과 저장버튼 비활성화
						// 						if(data[0].confirmYn=="001"){
						// 							$('input[name=day]').attr('disabled',true);
						// 							$('#btnSave').attr('disabled',true);
						// 						}else{
						// 							$('input[name=day]').attr('disabled',false);	
						// 							$('#btnSave').attr('disabled',false);
						// 						}

						//월판매계획 값
						$('#salesMonQty').val(data[0].salesMonQty == null ? "0": rmDecimal(data[0].salesMonQty));

						//일계획 합계
						$('#sumDayQty').val(data[0].salesSumQty == null ? "0": rmDecimal(data[0].salesSumQty));

						//일계획 값
						for (var i = 0; i < data.length; i++) {
							$('#day' + (i + 1)).val(rmDecimal(data[i].salesDayQty));
						}

						//일계획이 등록되지 않은 경우
					} else {
						//계획 확정되지 않은 건 일자별수량과 저장버튼 활성화
						$('input[name=day]').attr('disabled', false);
						$('#btnSave').attr('disabled',false);

						//일계획 합계
						$('#sumDayQty').val("0");

						//일계획 값
						$('input[name=day]').val('0');
					}

				}
			});

			$.ajax({
				url : '<c:url value="bm/itemPartDtlList" />',
				type : 'GET',
				data : {
					'itemSeq' : function() {
						return rowId;
					},
				},
				success : function(res) {
					var data = res.data;

					$('#itemCd').val(data.itemCd);
					$('#itemNm').val(data.itemNm);
					$('#itemSeq').val(data.itemSeq);
					$('#itemModel').val(data.itemModelNm);

					$('#daySalesPlanDayPopupModal').modal('show');

				}
			});

		} else { //일계획 수량을 더블클릭하지 않았을 경우
			toastr.warning("일계획 수량을 더블클릭해주세요.");
		}
	});

	//저장처리
	$('#btnSave').on('click',function() {
		var dataArray = new Array();
		var check = true;

		//처리중..
		$('#my-spinner').show();

		for (var i = 0; i < 31; i++) {
			//입력값 검사
			if ($('#day' + (i + 1)).val() == "") {
				toastr.warning('일계획수량을 입력해주세요');
				check = false;
				//처리완료..
				$('#my-spinner').hide();
				return false;
			}

			var rowData = new Object();

			rowData.salesYear = salesYear;
			rowData.salesMon = salesMon;
			rowData.itemSeq = $('#itemSeq').val();
			//var salesMonQtyValue =  $(this).find("td input[name=salesMonQty_"+rowId+"]").val().replace(/,/g,'');
			//rowData.salesMonQty = salesMonQtyValue==null?"0":salesMonQtyValue;

			rowData.salesDay = i < 9 ? "0" + (i + 1) : (i + 1);
			rowData.salesDayQty = $('#day' + (i + 1)).val().replace(/,/g, '');
			rowData.salesSumQty = $('#sumDayQty').val().replace(/,/g,'');

			dataArray.push(rowData);
			console.log(rowData);
		}

		if (check == true) {
			$.ajax({
				url : '<c:url value="bs/daySalesPlanAdmCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if (res.result == 'ok') {
						urlData = '';

						$('#my-spinner').hide();
						$('#daySalesPlanAdmTable').DataTable().ajax
								.reload(function() {
								});

						$('#daySalesPlanDayPopupModal').modal('hide');
						// 						$('input[name=day]').attr('disabled',true);
						toastr.success('저장되었습니다.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
				}
			});
		}

	});


	//계획확정 버튼 클릭
	$('#confirmSaveModalY').on('click', function() {
		confirmUpdate();
	});

	//계획확정 버튼 클릭
	$('#btnConfirm').on('click',function() {
		if ($('#daySalesPlanAdmTable_filter').find('input[type=search]').val() != '') {
			toastr.warning("검색란에 값을 지워주세요.");
		} else {
			$('#confirmSaveModal').modal('show');
		}
	});

	function confirmUpdate() {

		var dataArray = new Array();
		var check = true;

		//처리중..
		$('#my-spinner').show();

		$('#daySalesPlanAdmTable tbody tr').each(function(index, item) {

			var rowId = $(this).attr('id');

			if (daySalesPlanAdmTable.row(index).data().dayConfirmYn == "002") { //저장후 계획확정이 안된 항목

				var rowData = new Object();

				rowData.salesYear = $('#YEAR option:selected').val();
				rowData.salesMon = $('#MONTH option:selected').val();
				rowData.itemSeq = rowId;
				rowData.confirmYn = '001';
				rowData.salesDay = '' //i<9?"0"+(i+1):(i+1);
				dataArray.push(rowData);
			}
		});

		if (check) {
			$.ajax({
				url : '<c:url value="bs/daySalesPlanAdmUpdate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if (res.result == 'ok') {
						// 보기					
						$('#daySalesPlanAdmTable').DataTable().ajax.reload(function() {});
						toastr.success('계획확정되었습니다.');

						//처리완료..
						$('#my-spinner').hide();
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}
	}

	//***************엑셀 업로드***************

	//엑셀업로드 버튼 클릭
	$('#btnExcelUpload').change(function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);
		formData.append('case', 'day');

		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bs/salesPlanAdmExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;

					$('#daySalesPlanAdmTable').DataTable().clear().draw();
					$('#daySalesPlanAdmTable').DataTable().ajax.reload(function() {});

					$('#btnExcelUpload').val("");
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});

	//숫자만 입력하게 처리 & 합계
	$(document).on('keyup',"input[name=day]",function(event) {
		var preInWhsQtyData = $(this).val();

		if (!((event.which >= 96 && event.which <= 105)
				|| (event.which >= 48 && event.which <= 57)
				|| event.which == 110 || event.which == 188
				|| event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup",function() {
				$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
			});

			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}

		$(this).val(rmDecimal($(this).val().replace(/,/g, '')));

		var sumQty = 0;
		//var rowId = $(this).parent().parent().attr('id');

		for (var i = 1; i <= 31; i++) {
			var dayQty = $('#day' + i).val() == "" ? 0 : $('#day' + i).val().replace(/,/g, '');
			sumQty += parseFloat(dayQty);
			console.log(sumQty);
		}
		console.log(sumQty);
		$('#sumDayQty').val(rmDecimal(sumQty));

		sumQty = 0;

	});
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
			$("#YEAR").append('<option value="' + y + '"'+ (y == com_year ? 'selected' : '') + '>' + y + '년'+ '</option>');
		}

		// 월 뿌려주기(1월부터 12월)
		var month;
		$("#MONTH").append("<option value=''>월</option>");
		for (var i = 1; i <= 12; i++) {
			$("#MONTH").append('<option value="' + (i < 10 ? '0' + i : i) + '" '+ (i == mon ? 'selected' : '') + '>' + i + '월'	+ '</option>');
		}
	}
</script>

</body>
</html>
