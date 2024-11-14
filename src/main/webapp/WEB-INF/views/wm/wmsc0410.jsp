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
				<li class="breadcrumb-item active">일생산계획(정밀가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="height:850px;">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="dayProdPlanAdmTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th colspan="8" style="text-align:left;"><span style="font-weight: 500;">체크(✔)한 항목만 반영됩니다.</span></th>
									<th><input type="checkbox" id="dayAllCheck" onclick="rowAllCheck()" name="dayAllCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day1Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day2Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day3Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day4Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day5Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day6Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day7Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day8Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day9Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day10Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day11Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th> 
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day12Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day13Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day14Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day15Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day16Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day17Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day18Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day19Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day20Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day21Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day22Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day23Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day24Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day25Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day26Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day27Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day28Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day29Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day30Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day31Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th>월계획</th>
									<th>합계</th>
									<th colspan="31">1</th>
								</tr>
								<tr>
									<th style="min-width: 25px">선택</th>
									<th style="min-width: 70px">품목코드</th>
									<th style="min-width: 50px">품목구분</th>
	 								<th style="min-width: 60px">업체코드</th>
									<th style="min-width: 100px">업체명</th>
									<th style="min-width: 100px">품번</th>
									<th style="min-width: 180px">품명</th>
									<th class="text-center" style="min-width: 70px">월계획</th>
									<th class="text-center" style="min-width: 70px">합계</th>
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
									<th>월계획</th>
									<th>합계</th>
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
									<th>31</th>
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
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "wmsc0410";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "일생산계획(정밀가공)"); 
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let serverDate = null;

	let userNumber = "${userNumber}";
	
	let dt = new Date();
	let year = "";
	let com_year = dt.getFullYear();
	let mon = dt.getMonth()+1;
    
	let prodYear = com_year;
	let prodMon = mon < 10 ? "0" + mon : mon;
    let confirmYn = '';
    let urlData = '';
    let mainGubun = '001';
    let mainGubun2 = '';
    let itemGubun = "001";
    let workEmerYn = "";
	let workOrdDateFrom = serverDateFrom;
	let workOrdDateTo = serverDateTo;
	let itemSeqPopupVal="";
	let ordQtyPopupVal="";
	let itemSeqPopupArr = [];	  //배열생성
	
	//공통코드 처리 시작      
	let mainGubunCode = new Array(); //구분
	<c:forEach items="${mainGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	mainGubunCode.push(json1);
	</c:forEach>

	let itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode.push(json1);
	</c:forEach>

	let workEmerYnCode = new Array(); //긴근여부
	<c:forEach items="${workEmerYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	let userListCode = new Array(); //부작업자
	<c:forEach items="${userList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.userNumber}";
	json1.baseNm = "${info.userNm}";
	userListCode.push(json1);
	</c:forEach>

	let equipListCode = new Array(); //설비명
	<c:forEach items="${equipList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.equipCd}";
	json1.baseNm = "${info.equipNm}";
	equipListCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료   
	
  	//전체선택(가로) 버튼 클릭
    function rowAllCheck() {
		if ( $('input[name=dayAllCheck]').is(":checked") ) {
			$('input[name=dayCheck]').prop('checked', true);
		} else {
			$('input[name=dayCheck]').prop('checked',false);
		}
    }

	// 목록조회
	let dayProdPlanAdmTable = $('#dayProdPlanAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12 col-md-1 mr-6 mt-3'f><'col-sm-12 col-md-8 mt-3'B>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "63vh",
		scrollX: true, 
		scrollCollapse: true,
		fixedColumns: {
			 leftColumns: 9
	    },
		ajax : {
			url : '<c:url value="wm/dayProdPlanAdmList"/>',
			type : 'GET',
			data : {
				'prodYear' 	: function(){ return prodYear; },
				'prodMon' 	: function(){ return prodMon; },
				'prodDay' 	: function(){ return '01'; },
				'urlData' 	: function(){ return urlData; },
				'mainGubun' : function(){ return '002'; },
				'itemGubun' : function(){ return itemGubun; },
			},
		},
		rowId : 'itemSeq',
		columns : [ 
			{//선택
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" id="check_'+meta.row+'" name="itemCheck" style="min-width: 17px; min-height: 17px;"/>';
				}
			},
			{//품목코드 (숨김)
				data : 'itemSeq'
			}, 
			{//구분
				data : 'itemGubunNm',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//업체코드
				data : 'itemCus'
			},
			{//업체명
				data : 'itemCusNm'
			},
			{//품번
				data : 'itemCd'
			}, 
			{//품명
				data : 'itemNm'
			},
			{//월계획
				data : 'prodMonQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" name="prodMonQty_'+row['itemSeq']+'" value="'+rmDecimal(data)+'" style="text-align:right; border:none;" readonly/>';
					} else {
						return '<input type="text" class="form-control" name="prodMonQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
					}
					
				},
				'className' : 'text-right'
			}, 
			{//합계
				data : 'prodSumQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control number-sum" name="prodSumQty_'+row['itemSeq']+'" value="'+rmDecimal(data)+'" style="text-align:right; border:none;" readonly/>';
					} else {
						return '<input type="text" class="form-control number-sum" name="prodSumQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
					}
					
				},
			}, 
			{//1
				data : 'd01',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//2
				data : 'd02',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//3
				data : 'd03',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			},
			{//4
				data : 'd04',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//5
				data : 'd05',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//6
				data : 'd06',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//7
				data : 'd07',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//8
				data : 'd08',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//9
				data : 'd09',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//10
				data : 'd10',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//11
				data : 'd11',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//12
				data : 'd12',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//13
				data : 'd13',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//14
				data : 'd14',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//15
				data : 'd15',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//16
				data : 'd16',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//17
				data : 'd17',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//18
				data : 'd18',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//19
				data : 'd19',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//20
				data : 'd20',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//21
				data : 'd21',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//22
				data : 'd22',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//23
				data : 'd23',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//24
				data : 'd24',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//25
				data : 'd25',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//26
				data : 'd26',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//27
				data : 'd27',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//28
				data : 'd28',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//29
				data : 'd29',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//30
				data : 'd30',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//31
				data : 'd31',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31"  name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			},
			{//월계획 (숨김)
				data : 'prodMonQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			}, 
			{//합계 (숨김)
				data : 'prodSumQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//1 (숨김)
				data : 'd01',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//2 (숨김)
				data : 'd02',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//3 (숨김)
				data : 'd03',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//4 (숨김)
				data : 'd04',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//5 (숨김)
				data : 'd05',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//6 (숨김)
				data : 'd06',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//7 (숨김)
				data : 'd07',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//8 (숨김)
				data : 'd08',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//9 (숨김)
				data : 'd09',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//10 (숨김)
				data : 'd10',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//11 (숨김)
				data : 'd11',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//12 (숨김)
				data : 'd12',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//13 (숨김)
				data : 'd13',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//14 (숨김)
				data : 'd14',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//15 (숨김)
				data : 'd15',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//16 (숨김)
				data : 'd16',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//17 (숨김)
				data : 'd17',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//18 (숨김)
				data : 'd18',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//19 (숨김)
				data : 'd19',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//20 (숨김)
				data : 'd20',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//21 (숨김)
				data : 'd21',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//22 (숨김)
				data : 'd22',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//23 (숨김)
				data : 'd23',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//24 (숨김)
				data : 'd24',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//25 (숨김)
				data : 'd25',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//26 (숨김)
				data : 'd26',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//27 (숨김)
				data : 'd27',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//28 (숨김)
				data : 'd28',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//29 (숨김)
				data : 'd29',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//30 (숨김)
				data : 'd30',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//31 (숨김)
				data : 'd31',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
		],
		columnDefs: [
			{ "targets": "_all" , "className" : "text-center" },
			{ "visible": false, "targets": [1,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72] }
        ],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '일 생산계획(정밀가공)',
			filename : function(){
				let year = $('#YEAR').val();
				let mon = $('#MONTH').val();
				return year + '년 ' + mon + '월 일 생산계획';
			},
			exportOptions: {
				columns  : [2,1,3,4,5,6,7,41,42,43,44,45,46,47,48,49,50,
							51,52,53,54,55,56,57,58,59,60,
							61,62,63,64,65,66,67,68,69,70,71,72],
            },
		 	customize : function(xlsx){
		 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
		 		let col = $('col', sheet);

		 		col.each(function () {
		 	    	$(this).attr('width', 10);
		 	    });

		 		$(col[2]).attr('width', 15);
		 		$(col[3]).attr('width', 15);
		 		$(col[4]).attr('width', 15);
		 		$(col[5]).attr('width', 40);
			} 
		}, 'print' ],
		drawCallback : function() {
        	let api = this.api();
        	
        	for ( var i = 0; i < api.data().count(); i++ ) {
        		let sumQty = 0;
        		for ( var j = 0; j < 31; j++ ) {
        			sumQty += parseFloat( $('#dayProdPlanAdmTable tbody tr').eq(i).find('input[name=prodDayQty]').eq(j).val() );
        		}
        		$('input[name=prodSumQty_'+i+']').val( rmDecimal(sumQty) );
        		sumQty = 0;
        	}
    	
        }
	});

	//dayProdPlanAdmTable의 dataTables_length 변경
	let html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">년도</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select" ></select>&nbsp;&nbsp;&nbsp;&nbsp;';
    html1 += '</div>';
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select" ></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm" >품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select" ></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;'; 

	html1 += '&nbsp;&nbsp;&nbsp;<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info" >엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>';
	html1 += '</div>';
	
	html1 += '<button type="button" class="btn btn-primary float-right mr-1" id="btnSave" >저장</button>';
	html1 += '</div>';

	$('#dayProdPlanAdmTable_length').html(html1);

	selectBoxAppend(itemGubunCode, "itemGubun", "", "");

	//년도, 월, 구분 변경 시
	$('#YEAR, #MONTH, #itemGubun').on('change', function() {
		prodYear 	= $('#YEAR option:selected').val();
		prodMon 	= $('#MONTH option:selected').val();
		confirmYn 	= $('#selectView option:selected').val();
		urlData 	= '';
		mainGubun 	= $('#mainGubun option:selected').val();
		mainGubun2 	= mainGubun;
		itemGubun 	= $('#itemGubun option:selected').val();
		$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
    });

	//저장처리
	$('#btnSave').on('click', function() {
		let dataArray = new Array();		
		let check = true;  		

		$('#my-spinner').show(); //처리중 모달 시작
		
		$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
			let rowId = $(this).attr('id');
			
			for ( var i = 0; i < 31; i++ ) {
				//입력값 검사
				if ( $(this).find(".number-float0").eq(i).val() == "" || $(this).find(".number-float0").eq(i).val() == undefined ) {
					toastr.warning('일계획수량을 입력해주세요');	
					check = false;
					$('#my-spinner').hide(); //처리중 모달 종료
					
					return false;
				} 
				
				let rowData = new Object();
				
				rowData.prodYear = $('#YEAR option:selected').val();
				rowData.prodMon = $('#MONTH option:selected').val();
				rowData.itemSeq = rowId;
				
				let prodMonQtyValue = $(this).find("td input[name=prodMonQty_"+rowId+"]").val().replace(/,/g, '');
				rowData.prodMonQty = prodMonQtyValue == null ? "0" : prodMonQtyValue;
				rowData.prodDay = i < 9 ? "0" + (i+1) : (i+1);
				
				rowData.prodDayQty = $(this).find("td input[name=prodDayQty_"+rowId+"]").eq(i).val().replace(/,/g, '');
				rowData.prodSumQty = $(this).find("td input[name=prodSumQty_"+rowId+"]").val().replace(/,/g, '');
				
		        dataArray.push(rowData);
		        console.log(rowData);
			}
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="wm/dayProdPlanAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if ( res.result == 'ok' ) {
						urlData = '';
						$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
						toastr.success('저장되었습니다.');

						$('#my-spinner').hide(); //처리중 모달 종료
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
	});
	
	//계획확정 버튼 클릭
	$('#btnConfirm').on('click',function(){
		$('#confirmSaveModal').modal('show');
	});

	//계획확정 버튼 클릭
	$('#confirmSaveModalY').on('click',function(){
		confirmUpdate();
	});
	
	//계획확정
	function confirmUpdate() {
		let dataArray = new Array();
		let check = true;  		

		$('#my-spinner').show(); //처리중 모달 시작
		
		$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
			let day = 1;
			if ( dayProdPlanAdmTable.row(index).data().dayConfirmYn == "002" ) {
				let rowData = new Object();
				rowData.prodYear = $('#YEAR option:selected').val();
				rowData.prodMon = $('#MONTH option:selected').val();
				rowData.prodDay = day < 10 ? '0' + day : day;
				rowData.itemSeq = dayProdPlanAdmTable.row(index).data().itemSeq;
				rowData.confirmYn = '001';
				dataArray.push(rowData);
			}
			day++;
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="wm/dayProdPlanAdmUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if ( res.result == 'ok' ) {
						$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
						toastr.success('계획확정되었습니다.');

						$('#my-spinner').hide(); //처리중 모달 종료
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
	
	//확정취소 버튼 클릭
	$('#btnCancel').on('click', function(){
		if ( !$('input[name=itemCheck]').is(':checked') ) {
			toastr.warning("확정취소할 항목을 선택해주세요.");
			return false;
		}

		$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
			if ( $('input[id=check_'+index+']').is(':checked') ) {
				let day = 1;
				$(this).find('input[name=prodDayQty]').eq(day-1).attr('disabled', false);
			}
		});
		
	});
	
	//***************엑셀 업로드 시작***************
	//엑셀업로드 버튼 클릭
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);
		formData.append('case', 'day');
		
		var str = $('#btnExcelUpload').val();
		let index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="wm/prodPlanAdmExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;

					$('#dayProdPlanAdmTable').DataTable().clear().draw();
					$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});

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
	//***************엑셀 업로드 종료***************

	
	//숫자만 입력하게 처리
	$(document).on('keyup', ".number-float0", function(event){
		let preInWhsQtyData = $(this).val();
		   
		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}

		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
		console.log( $(this).parents().parents().attr('id') );
		let rowId = $(this).parents().parents().attr('id');

		let sumQty = 0;
		for ( var j = 0; j < 31; j++ ) {
			sumQty += parseFloat( $('input[name=prodDayQty_'+rowId+']').eq(j).val().replace(/,/g,'') );
			console.log("sumQty: " + sumQty);
		}

		$('input[name=prodSumQty_'+rowId+']').val(rmDecimal(sumQty));
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
        for ( var y = (com_year-1); y <= (com_year+5); y++ ) {
            $("#YEAR").append('<option value="'+ y +'"'+(y == com_year ? 'selected' : '')+'>'+ y + '년' +'</option>');
        }

        // 월 뿌려주기(1월부터 12월)
        let month;
        $("#MONTH").append("<option value=''>월</option>");
        for ( var i = 1; i <= 12; i++ ) {
        	$("#MONTH").append('<option value="'+(i < 10 ? '0' + i : i)+'" '+(i==mon?'selected':'')+'>'+i+'월'+'</option>'); 
        }
        
    }
</script>

</body>
</html>
