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
				<li class="breadcrumb-item active">출고요청현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="ml-1 p-1" style="background-color:#ffffff; flex: 0 0 100%; max-width: 100%; border-radius: 5px;">
				<div class="tab-pane fade active show" id="tab1">
					<div class="container-fluid p-0">
						<div class="row ml-2 mt-0 mr-2 mb-1">
							<div class="col-md-12 p-0">
								<table id="deliveryOrderAdmTable" class="table table-bordered m-0">
									<thead class="thead-light">
										<tr>
											<th>구분</th>
											<th>출고상태</th>
											<th>출고요청번호</th>
											<th>수주구분</th>
											<th>고객사</th>
											<th>품번</th>
											<th>품명</th>
											<th>수주량</th>
											<th>출고요청일</th>
											<th>출고요청량</th>
											<th>출고일</th>
											<th>출고량</th>
											<th>미출고수량</th>
											<th>현재고</th>
											<th>출고처</th>
											<th>출고담당자</th>
											<th>수주상세번호</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	let currentHref = "bssc0060";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "출고요청현황");	

	let startDateVal = moment().subtract('1','w').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let serverDateVal = moment().format('YYYY-MM-DD');
	let userNm = "${userNm}"
	let userNumber = "${userNumber}"
	let doStatus='001';
	let itemSeqVal='';
	let doNoVal=''
	let mainGubun=''
			
	//공통코드 처리 시작
	//출고상태
	var doStatusCode = new Array();
	<c:forEach items = "${doStatus}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	doStatusCode.push(json);
	</c:forEach>
	
	//구분
	var mainGubunCode = new Array();
	<c:forEach items = "${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 종료

	//출고요청 목록조회
	let deliveryOrderAdmTable = $('#deliveryOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 col-md-5 mt-2 text-left'B><'col-sm-12 col-md-2 mt-2 text-center'><'col-sm-12 col-md-5 text-right'i>>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		paging : true,
		searching: true,
		pageLength : -1, 
		scrollY: "75vh",
		scrollX: true,
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return startDateVal.replace(/-/g,'') ;},
				'endDate' : function(){return endDateVal.replace(/-/g,'') ;},
				'doStatus' : function(){return doStatus ;},
				'mainGubun' : function(){return mainGubun;}
			},
		},
		columns : [
			{data : 'mainGubunNm'},
			{data : 'doStatusNm'},
			{data : 'doNo'},
			{data : 'bizGubunNm'},
			{data : 'ordCorpNm'},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},
			{
				data : 'doDate',
				render : function(data, type, row, meta) {
					if(data != null){
						if(row['doStatus'] == '002' && serverDateVal.replace(/-/g, '') >= data){
							return '<span style="color:red;">' + moment(data).format('YYYY-MM-DD') + '</span>';
						} else return moment(data).format('YYYY-MM-DD');
					} else return '';
				},
			},
			{
				data : 'doQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},
			{
				data : 'dpDate',
				render : function(data, type, row, meta) {
					let dpDateString = '';

					if(data!=null) {
						let dpDateList = data.split(',');
						
						dpDateList.forEach(function(value) {
							dpDateString += moment(value).format('YYYY-MM-DD') + '<br>';
						});
					}
					
					return dpDateString;
				},
			}, //출고일
			{
				data : 'dpQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	
			{
				render : function(data, type, row, meta) {
					return row['dtlOrdCnt'] - row['dpQty'];
				},
			},
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	//현재고
			{data : 'outCorpNm'},
			{data : 'doChargrNm'},
// 			{
// 				data : 'totalInQty',
// 				render : function(data, type, row, meta) {
// 					return data!=null?rmDecimal(data):'';
// 				},
// 			},	//생산량
			{data : 'contDtlNo'},
		],
		columnDefs : [ 
			{targets : [7,9,11,12,13],render : $.fn.dataTable.render.number(','),className : 'text-right'},
			{targets : '_all',className : 'text-center'} 
 		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		createdRow : function(row,data,dataIndex){
			if(data['doStatus'] != null){
				if(data['doStatus']=="001"){	//요청대기
					$(row).css('backgroundColor', '#FFFFFF');
				}else if(data['doStatus']=="002"){	//요청완료
					$(row).css('backgroundColor', '#ebf3ff');
				}else if(data['doStatus']=="003"){	//출고진행
					$(row).css('backgroundColor', '#fdebdd');
				}else if(data['doStatus']=="004"){	//출고완료
					$(row).css('backgroundColor', '#ddfdf4');
				}
			}else{
				$(row).css('backgroundColor', '#FFFFFF');	//요청대기
			}
		}
	});

	var html1 = '<div class="row">';
	    html1 += '<label class="input-label-sm">출고요청일</label><div class="form-group input-sub mr-1 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub mr-1 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label>'; 
		html1 += '<select class="custom-select" id="mainGubunOption"></select>';
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">출고상태</label>'; 
		html1 += '<select class="custom-select" id="doStatusOption"></select>';
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  class="btn btn-primary mr-1" id="btnRetv">조회</button>'
	    html1 += '<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>'
	    html1 += '</div>';
		
	$('#deliveryOrderAdmTable_length').html(html1);

	selectBoxAppend(doStatusCode, "doStatusOption", "1" , "");
	selectBoxAppend(mainGubunCode, "mainGubunOption", "" , "1");
	
	$('#doDateFrom').val(startDateVal);
	$('#doDateTo').val(endDateVal);

	//조회버튼 눌렀을때
	$('#btnRetv').on('click',function(){
		startDateVal = $('#doDateFrom').val();
		endDateVal = $('#doDateTo').val();
		doStatus = $('#doStatusOption option:selected').val();
		mainGubun = $('#mainGubunOption option:selected').val();

		$('#deliveryOrderAdmTable').DataTable().ajax.reload(function() {});
	});

	//전체조회버튼 눌렀을때
	$('#btnAllRetv').on('click',function(){
		startDateVal = '';
		endDateVal = '';
		doStatus = '';
		mainGubun = '';

		$('#deliveryOrderAdmTable').DataTable().ajax.reload(function() {});
	});
	
</script>

<style>
  .dataTable > thead > tr > th[class*="sort"]:after{ 
       content: "" !important; 
   } 
   .dataTable > thead > tr > th[class*="sort"]:before{ 
       content: "" !important; 
   } 

   table.dataTable thead > tr > th.sorting_asc,  
   table.dataTable thead > tr > th.sorting_desc,  
   table.dataTable thead > tr > th.sorting,  
   table.dataTable thead > tr > td.sorting_asc,  
   table.dataTable thead > tr > td.sorting_desc,  
   table.dataTable thead > tr > td.sorting { 
          padding-right: 5px; 
          vertical-align: middle; 
   } 
</style>
</body>
</html>