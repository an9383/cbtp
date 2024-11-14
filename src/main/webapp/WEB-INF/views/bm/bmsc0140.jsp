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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">바코드정보관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card-header card-tab d-none">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">자재</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">제품</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
<!-- 				<br> -->
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
<!-- 					<div id="table1"> -->
						<div class="table-responsive">
							<table id="barcodeAdmPartTable" class="table table-bordered">
								<colgroup>
									<col width="4%">
									<col width="8%">
									<col width="8%">
									<col width="10%">
									<col width="10%">
									<col width="16%">
									<col width="14%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>
											<input type="checkbox" class="checkbox" id="checkAll" style="width:20px; height:20px;">
										</th>
										<th>구분</th>
										<th>품목구분</th>
										<th>차종</th>
										<th>품번</th>
										<th>품명</th>
										<th>Barcode No</th>
										<th class="text-center">입고일자</th>
										<th class="text-center">입고수량</th>
									</tr>
								</thead>
							</table>
						</div>
<!-- 					</div> -->
					<div id="table2" class="d-none">
						<div class="table-responsive">
							<table id="barcodeAdmItemTable" class="table table-bordered">
								<colgroup>
									<col width="2%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="7%">
									<col width="10%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th><input type="checkbox" name="checkboxAll2"
											id="checkboxAll2" value="" style="width:20px;height:20px;"></th>
										<th>CODE</th>
										<th>품번</th>
										<th>픔명</th>
										<th>입고일</th>
										<th class="text-center">입고수량</th>
										<th>출고일</th>
										<th class="text-center">출고수량</th>
										<th>바코드번호</th>
									</tr>
									<tr>
										<td colspan="9">작업중입니다.</td>
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
	let currentHref = "bmsc0140";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","바코드정보관리"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	
	var rcvDateInFromCal = serverDateFrom;
	var rcvDateInToCal = serverDateTo;
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	var status = "part";
	var cmd = new Array();
	var i = 0;

	var mainGubunVal = '';
	var itemGubunVal = '';

	let partPrintArray = new Array();
	let itemPrintArray = new Array();
	
	$("input[name=rcvDate]").val(serverDateTo);
	$("input[name=shipReqDate]").val(serverDateTo);
	
	var itemGubunArray = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunArray.push(json);
	</c:forEach>
	
	var mainGubunArray = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	//자재 탭 클릭시
	$('#tab1Nav').on('click',function(){
		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');
        $("input[type=checkbox]").prop("checked",false);
// 		$('#barcodeAdmPartTable').DataTable().ajax.reload( function () {});
		status = "part";

		partPrintArray = [];
	});

	//제품 탭 클릭시
	$('#tab2Nav').on('click',function(){		
		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');
        $("input[type=checkbox]").prop("checked",false);
// 		$('#barcodeAdmItemTable').DataTable().ajax.reload( function () {});
		status = "item";

		itemPrintArray = [];
	});

	//자재 탭 전체체크
    $('#checkboxAll1').on('click', function(){
        if($("#checkboxAll1").prop("checked")) { 
           $("input[type=checkbox]").prop("checked",true); 
        } else { 
           $("input[type=checkbox]").prop("checked",false);
        }        
    });
    
    //목록 조회
	let barcodeAdmPartTable = $('#barcodeAdmPartTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
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
		scrollY: '60vh',
		pageLength : 20000,
		//ordering: false,
		ajax : {
			url : '<c:url value="bm/barcodeAdmPartList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function() {return mainGubunVal;},
				'itemGubun' : function() {return itemGubunVal;}
			},
		},
		columns : [ 
			{
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="checkbox" id="checkLal-'+meta.row+'" name="printList" value="" style="width:20px;height:20px;">';
				},
				'className' : 'text-center p-0'
			},
			{
				data: 'mainGubunNm'	 	
			},
			{
				data: 'itemGubunNm'	 	
			},
			{
				data: 'itemModelNm'	 	
			},
			{
				data: 'itemCd'	 	
			},
			{
				data: 'itemNm'	 	
			},
			{
				data: 'barcodeNo'
			},
			{data: 'inDate',
				render: function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}, "className": "text-center" 	
			},
			{data: 'inQty',
				render: function(data, type, row, meta) {
					return addCommas(data);
				}, "className": "text-right" 	
			},
		],
		columnDefs : [],
		buttons : [],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
    
	// 테이블 행 선택
	$('#barcodeAdmPartTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#barcodeAdmPartTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
    
	//자재(일자)
	var html1 = '<div class="row">';
		html1 += '&nbsp;&nbsp;<input type="number" class="form-control text-right" id="partPrintCnt" placeholder="매수" style="width:40px;" value="1">';
		html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-warning mr-2" id="printPartLargeBarcode" onclick="printPartBarcode(1);">라벨인쇄</button>';
		html1 += '<label class="input-label-sm">구분</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<select id="mainGubun" name="mainGubun" class="select w80 col-12 custom-select">';
		html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
		html1 += '<label class="input-label-sm">품목구분</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<select id="itemGubun" name="itemGubun" class="select w80 col-12 custom-select">';
		html1 += '</select></div>&nbsp;&nbsp;&nbsp;'; 
		html1 += '<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
		html1 += '<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>';
	    html1 += '</div>';
    
   
	$('#barcodeAdmPartTable_length').html(html1);
	
	selectBoxAppend(mainGubunArray, "mainGubun", "", "1");
	selectBoxAppend(itemGubunArray, "itemGubun", "", "1");
	
	$('#btnRetv').on('click', function() {
		mainGubunVal =  $('#mainGubun option:selected').val();
		itemGubunVal =  $('#itemGubun option:selected').val();
		$('#barcodeAdmPartTable').DataTable().ajax.reload( function () {});
    });
	
	//전체조회 버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		mainGubunVal = "";
		itemGubunVal = "";
		selectBoxAppend(mainGubunArray, "mainGubun", "", "1");
		selectBoxAppend(itemGubunArray, "itemGubun", "", "1");
		$('#barcodeAdmPartTable').DataTable().ajax.reload( function () {});  
	});
	
// 	function outRetvOn(){
// 		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
// 		rcvDateOutToCal = $('#rcvDateOutTo').val();
// 		$('#barcodeAdmPartTable').DataTable().ajax.reload();
// 	}
	
// 	//제품 목록 조회
// 	let barcodeAdmItemTable = $('#barcodeAdmItemTable').DataTable({
// 		language : lang_kor,		
// 		paging : true,
// 		searching : true,
// 		info : true,
// 		ordering : true,
// 		processing : true,
// 		autoWidth : false,
// 		lengthChange : true,
// 		pageLength : 20000,
// 		scrollY: '60vh',
// 		//ordering: false,
// 		ajax : {
// 			url : '<c:url value="bm/barcodeAdmItemList"/>',
// 			type : 'GET',
// 			data : {
// 				'startDate' : function(){return rcvDateInFromCal.replace(/-/g,'');},
// 				'endDate' : function(){return rcvDateInToCal.replace(/-/g,'');}
// 			},
// 		},
// 		rowId : '',
// 		columns : [ 
// 			{
// 				render: function(data, type, row, meta) {
// 					return '<input type="checkbox" name="itemCheckbox" id="checkLal-'+meta.row+'" value="" style="width:20px;height:20px;">';
// 				},
// 				'className' : 'text-center p-0 pt-1'
// 			},
// 			{data: 'itemCd'	 	},
// 			{data: 'itemCd'	 	},
// 			{data: 'itemNm'	 	},
// 			{data: 'inDate',
// 				render : function(data, type, row, meta){
// 					if(data!=null){
// 						return moment(data).format('YYYY-MM-DD');
// 					}else{
// 						return '-';
// 					}
// 				}
// 			},
// 			{data: 'inQty'	},
// 			{data: 'outDate',
// 				render : function(data, type, row, meta){
// 					if(data!=null){
// 						return moment(data).format('YYYY-MM-DD');
// 					}else{
// 						return '-';
// 					}
// 				}
// 			},
// 			{data: 'outQty'	},
// 			{data: 'barcodeNo'	}
// 		],
// 		columnDefs : [ { targets : [5,7], render : $.fn.dataTable.render.number(','), className : 'text-right'} ],
// 		buttons : [],
// 	    order: [
// 	        [ 0, 'asc' ]
// 	    ],
// 	});



	// 제품 전체체크 event
	$('#checkboxAll2').change(function() {
		itemPrintArray = [];
		if($(this).is(':checked')) {
			$("input[name=itemCheckbox]").prop("checked",true); 
			for(var i=0;i<barcodeAdmItemTable.data().count();i++) {
				var obj = new Object();
		    	obj.code = barcodeAdmItemTable.row(i).data().itemCd;
		    	obj.rev = barcodeAdmItemTable.row(i).data().itemRev;
		    	obj.item = barcodeAdmItemTable.row(i).data().itemNm;
		    	obj.spec = barcodeAdmItemTable.row(i).data().serialNo;
		    	obj.date = barcodeAdmItemTable.row(i).data().inDate;
		    	obj.cnt = barcodeAdmItemTable.row(i).data().inQty;
		    	obj.date = barcodeAdmItemTable.row(i).data().inDate;
		    	obj.barcodeNo = barcodeAdmItemTable.row(i).data().barcodeNo;
		    	itemPrintArray.push(obj);
			}
		} else {
			$("input[name=itemCheckbox]").prop("checked",false);
			itemPrintArray = [];
		}
	})

	 //제품(일자)
	 var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInFrom" name="rcvDateInFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateInFrom,rcvDateInFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInTo" name="rcvDateInTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateInTo,rcvDateInTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnInRetv" onclick="inRetvOn();">조회</button>';
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right" id="itemPrintCnt" placeholder="매수" style="width:40px;" value="1">';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning" id="printItemLargeBarcode" onclick="printItemBarcode(1);" disabled>기본인쇄</button>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning d-none" id="printItemSmallBarcode" onclick="printItemBarcode(2);">개별인쇄</button>';
	    html1 += '</div>';
   
  
	$('#barcodeAdmItemTable_length').html(html1);
	$('#rcvDateInFrom').val(serverDateFrom);
	$('#rcvDateInTo').val(serverDateTo);

	function inRetvOn(){
		rcvDateInFromCal = $('#rcvDateInFrom').val();
		rcvDateInToCal = $('#rcvDateInTo').val();
		$('#barcodeAdmItemTable').DataTable().ajax.reload();
	}
	
	//전체선택 체크
	$('#checkAll').change(function() {
		if($(this).is(':checked')) {
			$("input[name=printList]").prop("checked",true);
			printArray = [];
			$('input[name=printList]').each(function() {
				var obj = new Object();
		    	obj.locNo = $(this).parents().parents().attr('id');
		    	obj.floorNm = locationAdmTable.row($(this).parents().parents()).data().areaNm + '-' + locationAdmTable.row($(this).parents().parents()).data().floorNm;
	    		printArray.push(obj);
			});
		} else {
			$("input[name=printList]").prop("checked",false);
			printArray = [];
		}
	})
	let printCnt = 0;
    //라벨인쇄 버튼 클릭
	$('#printPartLargeBarcode').on('click',function(){
		printCnt = $('#partPrintCnt').val();
		//예외처리
		if($('#partPrintCnt').val()=="" || $('#partPrintCnt').val()==0){
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

		    obj.itemCd = barcodeAdmPartTable.row(idx[1]).data().itemCd; //품번
		    obj.itemNm = barcodeAdmPartTable.row(idx[1]).data().itemNm; //품명
		    obj.inQty = barcodeAdmPartTable.row(idx[1]).data().inQty; //입고수량
		    obj.outQty = barcodeAdmPartTable.row(idx[1]).data().outQty; //출고수량
		    obj.itemModelNm = barcodeAdmPartTable.row(idx[1]).data().itemModelNm; // 차종
		    obj.inWhsDate = barcodeAdmPartTable.row(idx[1]).data().inDate; // 생산일
		    obj.inWhsDate = barcodeAdmPartTable.row(idx[1]).data().inDate; // 생산일
		    obj.areaCdNm = barcodeAdmPartTable.row(idx[1]).data().areaCdNm; // 창고
		    obj.floorNm = barcodeAdmPartTable.row(idx[1]).data().floorNm; // 창고
		    obj.dealCorpNm = barcodeAdmPartTable.row(idx[1]).data().dealCorpNm; // 고객사
		    obj.itemGubun = barcodeAdmPartTable.row(idx[1]).data().itemGubun; // 고객사
		    obj.lotNo = barcodeAdmPartTable.row(idx[1]).data().lotNo; // lotNo
		    obj.barcodeNo = barcodeAdmPartTable.row(idx[1]).data().barcodeNo; // barcodeNo
		    obj.workChargrNm = barcodeAdmPartTable.row(idx[1]).data().workChargrNm; // 작업자
			for( let i = 1; i <= printCnt; i++){
				labelPrint(obj,"")
			}
		});
	});
</script>
<script>
	//Do printing...
	function labelPrint(data, action) {
		console.log("data:"+data.inWhsDate);
	   let cmds = {};
	   
	   let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	      
	   if (data.itemGubun == '001' || data.itemGubun == '002' || data.itemGubun == '003') {
	
	      //행
	      cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	      cmd += "{LC;0659,0184,0980,0380,1,5|}";
			
	      //열
	      cmd += "{LC;0155,0035,0155,0320,0,5|}";

	      cmd += "{LC;0655,0035,0655,0110,0,5|}";
	      cmd += "{LC;0800,0035,0800,0110,0,5|}";
	      
	      cmd += "{LC;0350,0180,0350,0320,0,5|}";
	      cmd += "{LC;0505,0180,0505,0320,0,5|}";
	      cmd += "{LC;0655,0180,0655,0485,0,5|}";
	      cmd += "{LC;0800,0180,0800,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
	      cmd += "{PV23;0165,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
	      cmd += "{PV23;0015,0160,0040,0040,01,0,00,B=품명|}";
	      cmd += "{PV23;0165,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
	      cmd += "{PV23;0015,0230,0040,0040,01,0,00,B=생산일|}";
	      cmd += "{PV23;0165,0230,0040,0040,01,0,00,B="+moment(data.workEndTime).format('YYYY.MM.DD')+"|}"; 
	      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=생산수량|}";
	      cmd += "{PV23;0165,0300,0040,0040,01,0,00,B="+(data.inQty - data.outQty)+"|}";
	      cmd += "{PV23;0360,0230,0040,0040,01,0,00,B=자주검사|}";
		  cmd += "{PV23;0520,0230,0040,0040,01,0,00,B=합격|}";
	      cmd += "{PV23;0360,0300,0040,0040,01,0,00,B=작업자|}";
	      if (data.workChargrNm != null) {
		      cmd += "{PV23;0520,0300,0040,0040,01,0,00,B="+data.workChargrNm+"|}";
		  }
	      cmd += "{PV23;0670,0090,0040,0040,01,0,00,B=차종|}";
	      cmd += "{PV23;0820,0090,0040,0040,01,0,00,B="+data.itemModelNm+"|}";
	      cmd += "{PV23;0670,0230,0040,0040,01,0,00,B=창고|}";
	      if (data.areaCdNm != null) {
	      	cmd += "{PV23;0820,0230,0040,0040,01,0,00,B="+data.areaCdNm + '/' + data.floorNm+"|}";
	      }
	      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=고객사|}";
	      if (data.dealCorpNm != null) {
		      cmd += "{PV23;0820,0300,0040,0040,01,0,00,B="+data.dealCorpNm+"|}";
		  }
	      cmd += "{PV23;0710,0365,0040,0040,01,0,00,B="+"공정검사확인"+"|}";
	      cmd += "{XB03;0080,0350,9,3,02,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.barcodeNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	   } else if (data.itemGubun == '004' || data.itemGubun == '005') {
		
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
		      cmd += "{PV23;0165,0230,0040,0040,01,0,00,B="+moment(data.preInWhsDate).format('YYYY.MM.DD')+"|}"; 
		      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=입고수량|}";
		      cmd += "{PV23;0165,0300,0040,0040,01,0,00,B="+data.inQty+"|}";
		      cmd += "{PV23;0360,0230,0040,0040,01,0,00,B=합부판정|}";
		      cmd += "{PV23;0520,0230,0040,0040,01,0,00,B=합격|}";
		      cmd += "{PV23;0360,0300,0040,0040,01,0,00,B=업체로트|}";
		      if (data.lotNo != null) {
		      	cmd += "{PV23;0520,0300,0040,0040,01,0,00,B="+data.lotNo+"|}";
		      }
		      cmd += "{PV23;0670,0230,0040,0040,01,0,00,B=창고|}";
		      if (data.areaCdNm != null) {
		      	cmd += "{PV23;0820,0230,0040,0040,01,0,00,B="+data.areaCdNm + '/' + data.floorNm+"|}";
		      }
		      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=업체명|}";
		      cmd += "{PV23;0820,0300,0040,0040,01,0,00,B="+data.dealCorpNm+"|}";
		      cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
		      cmd += "{RB03;"+data.barcodeNo+"|}";
		      cmd += "{XS;I,0001,0002C4001|}";
		   }

	  
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
