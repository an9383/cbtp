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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">입고라벨출력(레이저)</li>
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
						<table id="inOutWhsAdmTable" class="table table-bordered tr_highlight_row">
							<%-- <colgroup>
								<col width="2%">
								<col width="3%">
								<col width="7%">
								<col width="8%">
								<col width="6%">
								<col width="10%">
								<col width="15%">
								<col width="3%">
								<col width="6%">
								<col width="6%">
								<col width="4%">
								<col width="4%">
								<col width="10%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
							</colgroup> --%>
							<thead class="thead-light">
								<tr>
									<th>
										<input type="checkbox" class="" id="checkAll" name="checkAll" >
									</th>
									<th>품목구분</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th>발주번호</th>
									<th>입고일자</th>
									<th class="text-center">입고수량</th>
									<th>입고처</th>
									<th>승인여부</th>
									<th>판정</th>
									<th>BarcodeNo</th>
									<th>창고</th>
									<th>구역/위치</th>
									<th>출력여부</th>
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

	let currentHref = "iosc0230";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","입고라벨출력(레이저)"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate =  "${serverDateTo}";	
	var searchOption = '003';
	var searchOption2 = null;
	var approvalYnOption = "";
	var inWhsYnOption = "";

	let inOutWhsAdmTable = $('#inOutWhsAdmTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000,
		scrollY : "620px",
		ajax : {
			url : '<c:url value="io/inOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : '001',
				'startDate' : function(){return serverDateFrom.replace(/-/g,'');},
				'endDate' : function(){return serverDateTo.replace(/-/g,'');},
				'searchOption'  : function(){return searchOption;},
				'approvalYn'  : function(){return approvalYnOption;},
				'inWhsYn'  : function(){return inWhsYnOption;},
			}	
		},	
		rowId : '',
		columns : [
			{
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="printList" value="">';
				},
				'className' : 'text-center'
			},
			{data :	'itemGubunNm'},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{data : 'itemUnit'},
			{data : 'poNo'},
			{data : 'inWhsDate', 
				render : function(data, type, row, meta){
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				}
			}, 
			{data : 'inWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					return rmDecimal(data);
				}
			},
			{data : 'dealCorpNm'},
			{data : 'approvalNm',
				render : function(data, type, row, meta){
					if(data!=null){
						if(data=="승인"){
							return data;
						}else{
							return '<span style="color: red">'+data+'</span>';
						}
					}else{
						return '미승인';	//미승인 시(승인 처리 안하는 값 )
					}
				}
			}, 
			{data : 'qaEval',
				render : function(data, type, row, meta){
					if(data!=null){
						if(row['approvalYn']=="001"){
							if(data=="001"){
								return "합격";
							}else if(data=="002"){
								return '<span style="color:red;">불합격</span>';
							}
						}else{
							return '<span>판정중</span>';
						}
					}else{
						return '';
					}
				}
			}, 
			{data : 'barcodeNo'},
			{data : 'locationNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else{
						return '';
					}
				}
			},
			{data : 'areaNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data+" / "+row['floorCd'];
					}else{
						return '-';
					}
				}
			},
			{data : 'outputDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return '<span id="print-'+meta.row+'"style="text-align: center; color:black;">출력</span>';
					}else{
						return '<span id="print-'+meta.row+'"style="text-align: center; color:blue;">미출력</span>';
					}
				}
			},
		],
		order  :[6,'asc'],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [ 
		    //{ targets : [8, 9, 10, 11, 12,13], render : $.fn.dataTable.render.number(','),className : 'text-right'} 
		],
	});
	
	
	var sysdate = "${serverTime}";
   
    var html1 = '<div class="row">';
    html1 += '<input type="number" class="form-control text-right float-left mr-1" id="printCnt" placeholder="매수" style="width:40px;" value="1" >';
    html1 += '<button type="button" class="btn btn-warning float-left mr-1" id="printLargeBarcode">라벨인쇄</button>';
	html1 += '<select class="custom-select" id="searchOption"></select>';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateFrom" name="inWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateFrom,inWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateTo" name="inWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateTo,inWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  

   /*  html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="mainGubun" name="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">레이저</option>';
	html1 += '<option value="002">봉제</option>';
	html1 += '</select></div>&nbsp;&nbsp;'; */
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
	html1 += '<select class="custom-select" id="approvalYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">입고여부</label>'; 
	html1 += '<select class="custom-select" id="inWhsYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">입고</option>';
	html1 += '<option value="002">미입고</option>';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
	
	$('#inOutWhsAdmTable_length').html(html1);
	$('#inWhsDateFrom').val(serverDateFrom);
	$('#inWhsDateTo').val(serverDateTo);

	// 조회버튼
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#inWhsDateFrom').val();
		serverDateTo =  $('#inWhsDateTo').val();
		approvalYnOption = $('#approvalYnOption').val();
		inWhsYnOption = $('#inWhsYnOption').val();
		$('#inOutWhsAdmTable').DataTable().ajax.reload( function () {});
    });

	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		approvalYnOption ='';
		inWhsYnOption = '';
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function () {});
    });


	$('#searchOption').append($("<option value='001' selected>"+ "가입고일" +"</option>"));
	$('#searchOption').append($("<option value='002'>"+ "검사일" +"</option>"));
	$('#searchOption').append($("<option value='003'>"+ "입고일" +"</option>"));
	
	// 테이블 행 선택
// 	$('#inOutWhsAdmTable tbody').on('click','tr',function() {
// 		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
// 		} else {
// 			$('#inOutWhsAdmTable').DataTable().$('tr.selected').removeClass('selected');
// 			$(this).addClass('selected');
// 		}
// 	});
	
	//전체선택 체크
	$('#checkAll').change(function() {
		if($(this).is(':checked')) {
			$("input[name=printList]").prop("checked",true);
// 			printArray = [];
			$('input[name=printList]').each(function() {
// 				var obj = new Object();
// 		    	obj.locNo = $(this).parents().parents().attr('id');
// 		    	obj.floorNm = locationAdmTable.row($(this).parents().parents()).data().areaNm + '-' + locationAdmTable.row($(this).parents().parents()).data().floorNm;
// 	    		printArray.push(obj);
			});
		} else {
			$("input[name=printList]").prop("checked",false);
// 			printArray = [];
		}
	})
	
	
	
	let printCnt = 0;
	//라벨인쇄 버튼 클릭
	$('#printLargeBarcode').on('click',function(){
		printCnt = $('#printCnt').val();
		//예외처리
		if($('#printCnt').val()=="" || $('#printCnt').val()==0){
			toastr.warning("인쇄할 매수를 입력해주세요.");
			return false;
		}

		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		}

		$('input[name=printList]:checked').each(function() {
			
			var obj = new Object();
		    let idx  = $(this).attr("id").split('-');

		    obj.itemCd = inOutWhsAdmTable.row(idx[1]).data().itemCd;
		    obj.itemNm = inOutWhsAdmTable.row(idx[1]).data().itemNm;
		    obj.itemModel = inOutWhsAdmTable.row(idx[1]).data().itemModel;
		    obj.inWhsDate = inOutWhsAdmTable.row(idx[1]).data().inWhsDate;
		    obj.inWhsQty = parseFloat(inOutWhsAdmTable.row(idx[1]).data().inWhsQty);
		    obj.barcodeNo = inOutWhsAdmTable.row(idx[1]).data().barcodeNo;
		    obj.location = inOutWhsAdmTable.row(idx[1]).data().locationNm;
		    obj.area = inOutWhsAdmTable.row(idx[1]).data().areaNm;
		    obj.floor = inOutWhsAdmTable.row(idx[1]).data().floorCd;
		    obj.dealCorpNm = inOutWhsAdmTable.row(idx[1]).data().dealCorpNm;
		    obj.itemUnit = inOutWhsAdmTable.row(idx[1]).data().itemUnit;
		    obj.qaEval = inOutWhsAdmTable.row(idx[1]).data().qaEval;
		    obj.lotNo = inOutWhsAdmTable.row(idx[1]).data().lotNo;

		    for( let i = 1; i <= printCnt; i++){
				labelPrint(obj,"")
			}

	    	$.ajax({
				url : '<c:url value="/io/preInOutWhsAdmLabelPrint"/>',
				type : 'GET',
				data : {
					'inSlipNo' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipNo; },
					'inSlipSeq' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipSeq; }
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if ($("#print-"+idx[1]).text() == "미출력") {
							$("#print-"+idx[1]).text("출력");
							$("#print-"+idx[1]).css('color', 'black');
						}
					} else {
						toastr.error(res.message);
					}
				}
			});
	    	
		});
	});
	
</script>
<script>
//Do printing...
	function labelPrint(data, action) {
		console.log("data:"+data.itemCd);
	   let cmds = {};
	   
	   let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	
	    //행
	      cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	
	    //열
	      cmd += "{LC;0155,0035,0155,0320,0,5|}";
	      cmd += "{LC;0350,0180,0350,0320,0,5|}";
	      cmd += "{LC;0505,0180,0505,0320,0,5|}";
	      cmd += "{LC;0655,0180,0655,0320,0,5|}";
	      cmd += "{LC;0800,0180,0800,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
	      cmd += "{PV23;0165,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
	      cmd += "{PV23;0015,0160,0040,0040,01,0,00,B=품명|}";
	      cmd += "{PV23;0165,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
	      cmd += "{PV23;0015,0230,0040,0040,01,0,00,B=입고일|}";
	      cmd += "{PV23;0165,0230,0040,0040,01,0,00,B="+moment(data.inWhsDate).format('YYYY.MM.DD')+"|}"; 
	      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=입고수량|}";
	      cmd += "{PV23;0165,0300,0040,0040,01,0,00,B="+data.inWhsQty+data.itemUnit+"|}";
	      cmd += "{PV23;0360,0230,0040,0040,01,0,00,B=합부판정|}";
	      cmd += "{PV23;0520,0230,0040,0040,01,0,00,B="+((data.qaEval == '001') ? '합격' : '불합격')+"|}";
	      cmd += "{PV23;0360,0300,0040,0040,01,0,00,B=업체로트|}";
	      if (data.lotNo != null) {
	      cmd += "{PV23;0520,0300,0040,0040,01,0,00,B="+data.lotNo+"|}";
	      }
	      cmd += "{PV23;0670,0230,0040,0040,01,0,00,B=창고|}";
	      if (data.area != null) {
	      	cmd += "{PV23;0820,0230,0040,0040,01,0,00,B="+data.area + '/' + data.floor+"|}";
	      }
	      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=업체명|}";
	      cmd += "{PV23;0820,0300,0040,0040,01,0,00,B="+data.dealCorpNm+"|}";
	      cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.barcodeNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
	
	
	let webSocket = new WebSocket("ws://localhost:9998");
	
	// 웹소켓 연결
	function wsConnect() {
	   webSocket = new WebSocket("ws://localhost:9998");
	}
	
	// 웹소켓 상태확인
	function getWsStatus() {
	   return webSocket.readyState;
	}
	
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
	   toastr.success('인쇄 서버에 연결되었습니다.')
	   $('#wsStateView').text('연결됨');
	   $('#wsStateView').css('color','#19FF00');
	   wsState = true;
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
	   toastr.error('인쇄 서버가 종료되었습니다.')
	   $('#wsStateView').text('연결끊김');
	   $('#wsStateView').css('color','#FF0004');
	   wsState = false;
	};
	// 소켓 통신 중에 에러가 발생되면 호출되는 함수
	webSocket.onerror = function(message){
	   toastr.warning('현재 인쇄프로그램이 종료되어있습니다. 인쇄프로그램을 시작해주세요.')
	};
	// 소켓 서버로 부터 메시지가 오면 호출되는 함수.
	webSocket.onmessage = function(message){
	   // 출력 area에 메시지를 표시한다.
	   console.log(message);
	};
	// 서버로 메시지를 전송하는 함수
	function sendMessage(cmd){
	   if(webSocket.readyState == 1) {
	      webSocket.send(cmd);
	   } else {
	      toastr.error('인쇄 서버와의 연결을 확인해주세요.');
	   }
	}

</script>

</body>
</html>
