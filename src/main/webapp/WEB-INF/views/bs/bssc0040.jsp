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
				<li class="breadcrumb-item active">수주현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div id="table1">
						<div class="table-responsive">
							<table id="bizOrderTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>구분</th>
										<th>수주구분</th>
										<th>국내/국외</th>
										<th>수주일</th>
										<th>고객사</th>
										<th>품번</th>
										<th>품명(Type)</th>
										<th>MAKER</th>
										<th>단위</th>
										<th>수량</th>
										<th>단가</th>
										<th>금액</th>
										<th>납기일</th>
										<th>접수자</th>
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

<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0040";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","수주현황"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";

	var bizGubun = null;
	var contNo = null;
	var ordCorpCd = null;
	var inexGubun = null;
	var contGubun = null;
	var itemCd = null;
	var contDtlNo = null;
	var dtlOrdCnt = null;
	var lotNo = null;
	var ordDtlDesc = null;
	var activeTab = "신규등록";
	var rcvDateFromCal = serverDateFrom;
	var rcvDateToCal = serverDateTo;
	var contGubunVal = null;
	var contGubunVal = null;

	
	$("input[name=rcvDate]").val(serverDateTo);
	$("input[name=shipReqDate]").val(serverDateTo);
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});

	// 공통코드
	
	//수주구분
	var bizGubunCode = new Array();
	<c:forEach items="${bizGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	bizGubunCode.push(json1);
	</c:forEach>
	
	var mainGubunCode = new Array(); // 레이저/후가공
	<c:forEach items="${mainGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	mainGubunCode.push(json1);
	</c:forEach>
	
	//영업주문관리 목록조회(외부)
	let bizOrderTable = $('#bizOrderTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderAdmStatusList"/>',
			type : 'GET',
			data : {
				'bizGubun': function(){return bizGubun;},
				'startDate' : function(){return rcvDateFromCal.replace(/-/g,'');},
				'endDate' : function(){return rcvDateToCal.replace(/-/g,'');},
				'contGubun' : function(){return contGubunVal},
				'ordCorpCd'  : function(){return ordCorpCd;},
			},
		},
		rowId : 'contDtlNo',
		columns : [ 
				{data : 'contGubunNm'},
				{data : 'bizGubunNm'},
				{data : 'inexGubunNm'},
				{data : 'rcvDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{data : 'ordCorpNm'},
				{data : 'itemSeq'},
				{data : 'itemNm'},
				{data : 'itemMaker'},
				{data : 'itemUnitNm'},
				{data : 'dtlOrdCnt'},
				{data : 'unitCost'},			
				//{data : 'lotNo'},
				{data : 'totalAmt',
					render: function(data, type, row, meta) {
						return addCommas(row['dtlOrdCnt']*row['unitCost']);
					}
				},
				{data : 'shipReqDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{data : 'rcvChargrNm'},
				{data : 'contDtlNo'},
		],
		columnDefs: [
			{ "targets": [9,10,11] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        	{"className": "text-center", "targets": "_all"},
        	
        ],
	    order: [
	        [ 0, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    drawCallback: function() {
		    var api = this.api();
		    for(var i=0;i<api.data().count();i++) {
			    if(api.row(i).data().rcvDate == serverDateTo.replace(/-/g,'')) {
			    	$('#'+api.row(i).data().contDtlNo).addClass('bg-warning');
				} else {
					$('#'+api.row(i).data().contDtlNo).removeClass('bg-warning');
				}
			}
		}
	    
	});

	//영업주문관리(외부 일자)
	var sysdate = "${serverTime}";
	   
	 var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">수주일</label>';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateFrom" name="rcvDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateFrom,rcvDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateTo" name="rcvDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateTo,rcvDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">고객사</label>'; 
		html1 += '<div class="input-sub m-0">';
		html1 += '<input type="text" class="form-control" style="max-width: 100%" id="ordCorpNm" name="ordCorpNm" disabled>';
		html1 += '<input type="hidden" id="ordCorpCd" name="ordCorpCd">';
		html1 += '<button type="button" class="btn btn-primary input-sub-search" name="btnOrdCorp" id="btnOrdCorp" onClick="selectOrdCorp();">';
		html1 += '<span class="oi oi-magnifying-glass"></span>';
		html1 += '</button>';
		html1 += '</div>';
		html1 += '<div>';
		html1 += '<a href="javascript:void(0)" id="cancelSearchOrdCorp" class="closebtn"><i class="mdi mdi-close"></i></a>';
		html1 += '</div>';
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label>'; 
		html1 += '<select class="custom-select" id="contGubunOption">';
		html1 += '</select>';
		html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">수주구분</label>'; 
		html1 += '<select class="custom-select" id="bizGubunOption">';
		html1 += '</select>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '</div>';
    
   
	$('#bizOrderTable_length').html(html1);
	$('#rcvDateFrom').val(serverDateFrom);
	$('#rcvDateTo').val(serverDateTo);
	
	selectBoxAppend(mainGubunCode, "contGubunOption", "", "1");  //레이저/후가공
	selectBoxAppend(bizGubunCode, "bizGubunOption", "", "1");  //수주구분

	$('#cancelSearchOrdCorp').on('click',function(){
		$('#ordCorpNm').val('');
		$('#ordCorpCd').val('');		
	});
	
	$('#btnRetv').on('click',function(){
		rcvDateFromCal = $('#rcvDateFrom').val();
		rcvDateToCal = $('#rcvDateTo').val();
		ordCorpCd = $("#ordCorpCd").val();
		contGubunVal = $('#contGubunOption option:selected').val();
		bizGubun = $('#bizGubunOption option:selected').val();
		
		$('#bizOrderTable').DataTable().ajax.reload(function() {});      
	});
	
   	
	function uiProc(flag) {

	}

	//거래처명 팝업 시작
   	var dealCorpPopUpTable4;
   	function selectOrdCorp()
   	{	   	
   		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			pageLength : 20,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealArr' :  function(){return ['001'];},
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ {
				data : 'dealCorpNm'
			}, {
				data : 'dealCorpCd'
			}, {
				data : 'presidentNm'
			}, {
				data : 'repreItem'
			}, {
				data : 'corpNo'
			} ],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row( this ).data();
		    $('#ordCorpCd').val(data.dealCorpCd);
		    $('#ordCorpNm').val(data.dealCorpNm);
		    
			$('#dealCorpPopUpModal4').modal('hide');
		});
		
		$('#dealCorpPopUpModal4').modal('show');
   	}
</script>
</body>
</html>
