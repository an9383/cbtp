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
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">현재고현황(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 50%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="inventoryTable">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">구분</th>
									<th class="text-center">창고</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">CUT SIZE</th>
									<th class="text-center">PNL SIZE</th>
									<th class="text-center">단위</th>
									<th class="text-center">현재고</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="7" style="text-align: center !important; background-color:#aed3ec">합계</td>
									<td id="sumRealQty" style="text-align: right; background-color:#aed3ec">0</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 49%;">
				<div class="card" id="formBox">
					<div class="table-responsive">
						<table class="table table-lg table-bordered mb-2" id="barcodeListTable">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center-th"><input class="checkbox_lg" type="checkbox" name="printAll" id="printAll"/></th>
									<th class="text-center-th">입고일자</th>
									<th class="text-center-th">수량</th>
									<th class="text-center-th">바코드</th>
									<th class="text-center-th">창고</th>
									<th class="text-center-th">구역</th>
								</tr>
							</thead>
						</table>
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

<style>
	.bg-1 {
	  background-color: #F5DDAD !important;
	}
	.bg-2 {
	  background-color: #F1BCAE !important;
	}
	.bg-3 {
	  background-color: #C9DECF !important;
	}
	.bg-4 {
	  background-color: #A9CBD7 !important;
	}
</style>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "55%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "tmsc0050";
	let currentPage = $('.' + currentHref).attr('id');
	$(document).attr("title", "현재고현황(레이저)");
	
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	let serverDateTo = "${serverDateTo}";
	let serverDate = "${serverDateTo}";
	let serverMonthTo = serverDate.substring(0, 7);

	let sideView="";
	let spCd=null;
	let spType="";
	let locationCd='';
	let dateRangeVal="";
	let itemCd="";
	let itemNm="";
	let itemCus="";
	let spUnit="";
	
	//공통코드 처리 시작
	let itemGubunList = new Array(); 
	<c:forEach items="${itemGubunList}" var="info">
	if ( "${info.baseCd}" != '002' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		itemGubunList.push(json);
	}
	</c:forEach>
	
	let locCdCode = new Array(); // 창고코드
	<c:forEach items="${locCd}" var="info">
	if ( "${info.etc1}" == '레이저' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		locCdCode.push(json);
	}
	</c:forEach>
	//공통코드 처리 끝

	//재고현황 목록조회
	let inventoryTable = $('#inventoryTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row mt-2'<'col-sm-12 col-md-9'i><'col-sm-12 col-md-3'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "65vh",
		rowId : 'poNo',
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmLocList"/>',
			type : 'GET',
			data : {
				'tmMon' : function(){ return serverMonthTo.replace(/-/g, ''); },
				'mainGubun' : function(){ return '001'; },
				'realQtyOption' : function(){ return "Y"; },
				'itemGubun' : function(){ return spType; },
				'locationCd' : function(){ return locationCd; },
			}
		},
		rowId : 'partCd',
		columns : [ 
			{//구분
				data : 'spTypeNm'
			},
			{//구분
				data : 'locationNm'
			},
			{//품번
				data : 'spCd'
			},
			{//품명
				data : 'spNm'
			},
			{//CUT SIZE
				data : 'cutSize'
			},
			{//PNL SIZE
				data : 'itemColor'
			},
			{//단위
				data : 'spUnit'
			},
			{//현재고
				data : 'realQty',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				"className" : "text-right"
			},
		],
		drawCallback: function() {
			index = 0;
			
			$('#inventoryTable tfoot').remove();
			let sumRealQty = $('#inventoryTable').DataTable().column(7,{ page: 'current'} ).data().sum();
			
			$('#sumRealQty').text(addCommas(sumRealQty));
		},
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	// 세부 목록 보기
	$('#inventoryTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
 			return false;
		} else {
			$('#inventoryTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		spCd = inventoryTable.row(this).data().itemSeq;
		itemCd = inventoryTable.row(this).data().spCd;
		itemNm = inventoryTable.row(this).data().spNm;
		itemCus = inventoryTable.row(this).data().itemCus;
		spUnit = inventoryTable.row(this).data().spUnit;
		locationCd = inventoryTable.row(this).data().locationCd;
		
		sideView = "edit";
		$('#barcodeListTable').DataTable().ajax.reload(function(){});

		if ( inventoryTable.row(this).data().spType == "004" || inventoryTable.row(this).data().spType == "005" ) {
			$('#topDiv').removeClass('d-none');	//입고일자 범례표시
		} else {
			$('#topDiv').addClass('d-none');	//입고일자 범례표시
		}
	});

	let html1 = '<div class="row">&nbsp;<label class="input-label-sm">기간 조회</label>';
	html1 += '<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-2" style="max-width:70px;">';
	html1 += '&nbsp;&nbsp&nbsp;&nbsp<label class="input-label-sm">구분</label>';
    html1 += '<select id="itemGubunSelect" class="custom-select custom-select-sm" style="max-width:70px;"></select>';
    html1 += '&nbsp;&nbsp&nbsp;&nbsp<label class="input-label-sm">창고</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select mr-1" id="locCdSelect">';
	html1 += '</select></div>&nbsp;&nbsp;';
    html1 += '<button type="button" class="btn btn-primary" id="btnRefresh">새로고침</button>'
	html1 += '</div>';

	$('#inventoryTable_length').html(html1);
	$('#demo-2').val(serverMonthTo);
	
	selectBoxAppend(itemGubunList, "itemGubunSelect", "", "1");
	selectBoxAppend(locCdCode, "locCdSelect", "", "1");
	
	//기간 조회 설정
	let nowYear = serverDate.substr(0,4) * 1;
	$('#demo-2').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : nowYear,
		startYear : nowYear - 100,
		finalYear : nowYear + 100,
	});
	
	//기간조회 선택조건
	$('#demo-2').on('change', function() {
		serverMonthTo = $('#demo-2').val();
		spCd = "";
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		$('#barcodeListTable').DataTable().clear().draw();
	});

	//구분,품목구분 선택조건
	$('#itemGubunSelect, #locCdSelect').on('change', function() {
		spType = $('#itemGubunSelect option:selected').val();
		locationCd = $('#locCdSelect option:selected').val();
		spCd = "";
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		$('#barcodeListTable').DataTable().clear().draw();
    });

	//새로고침 버튼
	$('#btnRefresh').on('click',function(){
		spType='';
		locationCd='';
		$('#inventoryTable').DataTable().ajax.reload(function() {});
		$('#barcodeListTable').DataTable().clear().draw();
	});

	//우측 상단 목록조회
	let barcodeListTable = $('#barcodeListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row mt-2'<'col-sm-12 col-md-9'i><'col-sm-12 col-md-3'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "70vh",
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmBarcodeList"/>',
			type : 'GET',
			data : {
				'realQtyOption' : "Y",
				'mainGubun' : function(){ return '001'; },
				'tmMon' : function(){ return serverMonthTo.replace(/-/g, ''); },
				'itemSeq' : function(){ return spCd; },
				'locationCd' : function(){ return locationCd; },
				'dateRange' : function(){ return dateRangeVal; }
			},
		},
		rowId : 'rowId',
		columns : [
			{//체크박스
				render : function(data, type, row, meta) {
					return '<input class="checkbox_lg" type="checkbox" name="printList" id="'+meta.row+'"/>';
				}
			},
			{//입고일자
				data : 'inDate',
				render : function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
			{//수량
				data : 'realQty',
				render : function (data, type, row, meta) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				"className" : "text-right"
			},
			{//바코드
				data : 'barcodeNo'
			}, 
			{//창고
				data : 'locationNm',
			}, 
			{//구역
				data : 'areaNm',
				render : function (data, type, row, meta) {
					if ( data != null && data != '' ) {
						return data + " / " + row['floorNm'];
					} else {
						return '';
					}
				}
			},
		],
			columnDefs : [
			{ targets : '_all', className : 'text-center'} 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback : function(){
	    	let api = this.api();

	    	//자재일경우 해당
    		for ( var i = 0; i < api.data().count(); i++ ) {
    			if ( api.row(i).data().spType == "004" || api.row(i).data().spType == "005" ) {
			    	if ( api.row(i).data().inDate != null ) {
				    	
				    	let inDateVal = api.row(i).data().inDate;
				    	console.log(inDateVal);
				    	
			    		if(moment().subtract('6','M').format('YYYYMMDD')<inDateVal){
			    			$('#barcodeListTable tbody tr').eq(i).find('td').eq(1).css('background','#346cb06e');
						}else if(moment().subtract('12','M').format('YYYYMMDD')<inDateVal){
							$('#barcodeListTable tbody tr').eq(i).find('td').eq(1).css('background','#00a28a91');
						}else if(moment().subtract('24','M').format('YYYYMMDD')<inDateVal){
							$('#barcodeListTable tbody tr').eq(i).find('td').eq(1).css('background','#d9534fad');
						}else{
							$('#barcodeListTable tbody tr').eq(i).find('td').eq(1).css('background','#346CB0');
						}   
			    	}
		    	}//if문 끝
		    }//for문 끝
		}//drawCallback 끝
	});

	let html2 = '<div class="float-left mt-1" id="rightTopLabel" style="display: inline;">';
	html2 += '<div class="float-left" id="topDiv"><span class="mr-1">입고일자 범례</span>';
	html2 += '<span class="badge mr-1 btn btn-outline-primary" id="6MonPass" style="width: 50px; font-size: 0.725rem; font-weight: 500;">6개월</span>';
	html2 += '<span class="oi oi-arrow-right mr-1"></span>';
	html2 += '<span class="badge mr-1 btn btn-outline-success" id="12MonPass" style="width:50px; font-size: 0.725rem; font-weight: 500;">12개월</span>';
	html2 += '<span class="oi oi-arrow-right mr-1"></span>';
	html2 += '<span class="badge mr-1 btn btn-outline-danger" id="24MonPass" style="width:50px; font-size: 0.725rem; font-weight: 500;">24개월</span>';
	html2 += '<button type="button" class="btn btn-primary" id="btnRefresh2">새로고침</button>';
	html2 += '</div>';
	html2 += '<button type="button" class="btn btn-success ml-1" id="printBarcode">바코드출력</button>';
	$('#barcodeListTable_length').html(html2);


	//전체선택시
	$('#printAll').on('click',function(){
		if($(this).is(':checked')){
			$('input[name=printList]').prop('checked',true);
		}else{
			$('input[name=printList]').prop('checked',false);
		}
	});
	
	//새로고침 선택시
	$('#btnRefresh2').on('click', function() {
		if ( sideView != "edit" ) {
			toastr.warning("품목을 선택해주세요.");
			return false;
		}
		dateRangeVal = "";
		$('#barcodeListTable').DataTable().ajax.reload();
	});

	//6개월 범례 클릭시
	$('#6MonPass').on('click', function() {
		if ( sideView != "edit" ) {
			toastr.warning("품목을 선택해주세요.");
			return false;
		}
		dateRangeVal = "6";
		$('#barcodeListTable').DataTable().ajax.reload();
	});

	//12개월 범례 클릭시
	$('#12MonPass').on('click', function() {
		if ( sideView != "edit" ) {
			toastr.warning("품목을 선택해주세요.");
			return false;
		}
		dateRangeVal = "12";
		$('#barcodeListTable').DataTable().ajax.reload();
	});

	//24개월 범례 클릭시
	$('#24MonPass').on('click', function() {
		if ( sideView != "edit" ) {
			toastr.warning("품목을 선택해주세요.");
			return false;
		}
		dateRangeVal = "24";
		$('#barcodeListTable').DataTable().ajax.reload();
	});
	

	$('#printBarcode').on('click', function() {
		//예외처리
		if ( !$('input[name=printList]').is(':checked') ) {
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		}

		$('input[name=printList]').each(function(index, item) {

			if ( $('input[name=printList]').eq(index).is(':checked') ) {
				
				let obj = new Object();
				let idx  = $(this).attr("id");
				console.log(idx)
				
			    obj.itemCd = itemCd; //품번
			    obj.itemNm = itemNm; //품명
			    obj.dealCorpNm = itemCus; //공급처
			    obj.itemUnitNm = spUnit; //단위
			    
			    obj.locationNm = barcodeListTable.row(idx).data().locationNm //창고
			    obj.areaCdNm = barcodeListTable.row(idx).data().areaNm; //창고
			    obj.floorNm = barcodeListTable.row(idx).data().floorNm; //창고
			    
			    obj.preInWhsDate = barcodeListTable.row(idx).data().inDate; //입고일자
			    obj.preInWhsQty = parseFloat(barcodeListTable.row(idx).data().realQty); //입고수량
			    obj.barcodeNo = barcodeListTable.row(idx).data().barcodeNo;  //바코드번호
			    obj.lotNo = barcodeListTable.row(idx).data().lotNo;  //lot번호

			    obj.rePackDate = serverDate.replaceAll('-','.');  //재포장일자

			    if ( barcodeListTable.row(idx).data().qaEval == "001" ) {
			    	obj.qaEval = "합 격"; //합불 판정
				} else if ( barcodeListTable.row(idx).data().qaEval == "002" ) {
					obj.qaEval = "불합격"; //합불 판정
				} else if ( barcodeListTable.row(idx).data().qaEval == null ){
					obj.qaEval = "미판정"; //합불 판정
				}

			    if ( parseInt( barcodeListTable.row(idx).data().initQty ) == parseInt( barcodeListTable.row(idx).data().realQty ) ) {
			    	obj.html = "입고수량"; 
				} else {
					obj.html = " 잔 량 "; 
				}

				console.log(obj);
				
			    labelPrint(obj, "")
			}
		});
	});

	function labelPrint(data, action) {
		
	    console.log("data: " + data.itemCd);
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
        cmd += "{LC;0335,0180,0335,0320,0,5|}";
        cmd += "{LC;0490,0180,0490,0320,0,5|}";
        cmd += "{LC;0640,0180,0640,0320,0,5|}";
        cmd += "{LC;0795,0180,0795,0320,0,5|}";
        
        //데이터
        cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
        cmd += "{PV23;0170,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
        cmd += "{PV23;0045,0160,0040,0040,01,0,00,B=품명|}";
        cmd += "{PV23;0170,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
        cmd += "{PV23;0030,0230,0040,0040,01,0,00,B=입고일|}";
        cmd += "{PV23;0170,0230,0035,0035,01,0,00,B="+moment(data.preInWhsDate).format('YYYY.MM.DD')+"|}"; 
        cmd += "{PV23;0015,0300,0040,0040,01,0,00,B="+data.html+"|}";
        cmd += "{PV23;0170,0300,0035,0035,01,0,00,B="+data.preInWhsQty+" "+data.itemUnitNm+"|}";
        cmd += "{PV23;0345,0230,0040,0040,01,0,00,B=합부판정|}";
        cmd += "{PV23;0517,0230,0040,0040,01,0,00,B="+data.qaEval+"|}";
        cmd += "{PV23;0345,0300,0040,0040,01,0,00,B=업체로트|}";
        if ( data.lotNo != null ) {
        	cmd += "{PV23;0505,0300,0035,0035,01,0,00,B="+data.lotNo+"|}";
        }
        cmd += "{PV23;0650,0230,0032,0032,01,0,00,B=재포장일자|}";
        cmd += "{PV23;0810,0230,0035,0035,01,0,00,B="+data.rePackDate+"|}";
        
        let tempRpd = data.rePackDate;
        let tempRpdArr = tempRpd.split('.');
        let dataRePackDate = new Date(tempRpdArr[0], tempRpdArr[1]-1, tempRpdArr[2]);
        let tempRePackDate = moment(dataRePackDate.setMonth(dataRePackDate.getMonth() + 3)).format('YYYY.MM.DD');
        cmd += "{PV23;0650,0300,0040,0040,01,0,00,B=유효기간|}";
        cmd += "{PV23;0810,0300,0035,0035,01,0,00,B="+tempRePackDate+"|}";
        cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
        cmd += "{RB03;"+data.barcodeNo+"|}";
        cmd += "{XS;I,0001,0002C4001|}";
	    
	    cmds.cmd = cmd; // 인쇄 명령어
	    cmds.action = action; // 동작
	    
	    sendMessage(JSON.stringify(cmds)); // 전송
	}
	
</script>
<script>
	
	//웹 서버를 접속한다.
	var webSocket = new WebSocket("ws://localhost:9998");
	// 웹 서버와의 통신을 주고 받은 결과를 출력할 오브젝트를 가져옵니다.
	var messageTextArea = document.getElementById("installedPrinterName");
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
		toastr.success('인쇄 서버에 연결되었습니다.')
		$('#wsStateView').text('연결됨');
		$('#wsStateView').css('color','#19FF00');
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
		toastr.error('인쇄 서버가 종료되었습니다.')
		$('#wsStateView').text('연결끊김');
		$('#wsStateView').css('color','#FF0004');
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
			//webSocket = new WebSocket("ws://localhost:9998");
		}
	}

</script>

</body>
</html>
