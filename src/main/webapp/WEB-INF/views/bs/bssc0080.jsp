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
				<li class="breadcrumb-item active">출고마감</li>
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
							<colgroup>
								<col width="8%">
								<col width="7%">
								<col width="7%">
								<col width="11%">
								<col width="11%">
								<col width="5%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>출고지시일</th>
									<th>발주처</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>LH/RH</th>
									<th>색상</th>
									<th class="text-center">포장수량</th>
									<th>단위</th>
									<th class="text-center">출고지시량</th>
									<th class="text-center">출고량</th>
									<th class="text-center">미출고량</th>
									<th>납품장소</th>
									<th>상태</th>
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
	let currentHref = "bssc0080";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","출고마감"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var doStatus = '';
	var doCorpCd = '';
	
	var doStatusGubun = new Array();
	<c:forEach items="${doStatusGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	doStatusGubun.push(json);
	</c:forEach>
	
	var doCorpNmgubun = new Array();
	<c:forEach items="${doCorpNmgubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.dealCorpCd}";
	json.baseNm = "${info.dealCorpNm}";
	doCorpNmgubun.push(json);
	</c:forEach>

	//출고처리 목록조회
	let deliveryOrderAdmTable = $('#deliveryOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
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
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function() {return serverDateFrom.replace(/-/g, '');},
				'endDate' : function() {return serverDateTo.replace(/-/g, '');},
				'doCorpCd': function() {return doCorpCd;},
				'doStatus' : function() {return doStatus;},
			}
		},
		rowId : '',
		columns : [
				{data :'doDate',
					render : function(data, type, row, meata){
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{data :'poCorpNm'},
				{data :'itemModelNm'},
				{data :'itemCd'},
				{data :'itemNm'},
				{data :'lhrhCdNm'},
				{data :'itemColor'},
				{data: 'boxCount',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} 
					}, "className": "text-right" 	
				},
				{data :'itemUnitNm'},
				{data: 'targetQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} 
					}, "className": "text-right" 	
				},
				{data: 'outputQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} 
					}, "className": "text-right" 	
				},
				{data: 'remainQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} 
					}, "className": "text-right" 	
				},
				{data :'doCorpNm'},
				{
					render : function(data, type, row, meta) {
						if (row['doStatus'] == '003') {
							return '<button type="button" class="btn btn-primary" id="btnComplete" disabled >출고완료</button>';
						} else {
							if (row['doStatus'] == '004') {
								return '<button type="button" class="btn btn-primary" disabled >출고마감</button>';
							} else {
								return '<button type="button" class="btn btn-primary" id="btnDead-'
										+ meta.row
										+ '" name="btnDead" onclick="btnDead('
										+ meta.row
										+ ');">출고마감</button>';
							}
						}
					}
				}, ],
		order : [ [ 0, 'desc' ]
		],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	//마감버튼 클릭시 
	function btnDead(index) {
		var tempPoCorpCd = deliveryOrderAdmTable.row(index).data().poCorpCd;
		var tempItemSeq = deliveryOrderAdmTable.row(index).data().itemSeq;
		var tempDoNo;
		var tempDoSeq;
		$.ajax({
			url : '<c:url value="bs/deliveryOrderAdmRead"/>',
			type : 'GET',
			async : false,
			data :{
				'poCorpCd' : function(){return tempPoCorpCd;},
				'itemSeq' : function(){return tempItemSeq;},
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					tempDoNo = data[0].doNo;
					tempDoSeq = data[0].doSeq;
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		$.ajax({
			url : '<c:url value="bs/doStatusUpdate" />',
			type : 'GET',
			async : false,
			data : {
				'doNo' : tempDoNo,
				'doSeq' : tempDoSeq,

			},
			success : function() {
				toastr.success("출고가 마감되었습니다.");
				$('#deliveryOrderAdmTable').DataTable().ajax.reload(function(){});
			}
		});

	}

	var sysdate = "${serverTime}";

    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">출고지시일</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled />';
    html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>&nbsp;&nbsp;&nbsp;';   
    
    html1 += '<label class="input-label-sm">납품장소</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="doCorpNmgubun" name="doCorpNmgubun" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm">상태</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="doStatusGubun" name="doStatusGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
    html1 += '&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;'
    html1 += '</div>';
    
	$('#deliveryOrderAdmTable_length').html(html1);
	$('#doDateFrom').val(serverDateFrom);
	$('#doDateTo').val(serverDateTo);
	
	selectBoxAppend(doCorpNmgubun, "doCorpNmgubun", "", "1");
	selectBoxAppend(doStatusGubun, "doStatusGubun", "", "1");
	
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#doDateFrom').val();
		serverDateTo =  $('#doDateTo').val();
		doCorpCd =  $('#doCorpNmgubun').val();
		doStatus =  $('#doStatusGubun').val();
		$('#deliveryOrderAdmTable').DataTable().ajax.reload( function () {});
    });	
	
	$('#deliveryOrderAdmTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#deliveryOrderAdmTable').DataTable().$('.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	
</script>

</body>
</html>
