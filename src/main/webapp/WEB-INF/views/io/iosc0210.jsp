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
				<li class="breadcrumb-item active">개별입고등록</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive" style="height: 400px;">
						<table id="individualAdmTable" class="table table-bordered">
							<colgroup>
								<col width="2%">
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="8%">
								<col width="5%">
								<col width="12%">
								<col width="30%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th><input type="checkbox" class="checkbox_sm" id="checkAll"></th>
									<th>발주번호</th>
									<th>개별입고일자</th>
									<th>거래처명</th>
									<th>CODE</th>
									<th>REV</th>
									<th>ITEM</th>
									<th>SPEC</th>
									<th>단위</th>
									<th class="text-center">개별입고수량</th>
									<th>수입검사여부</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table-responsive" style="height: 300px">
						<div class="card-body col-sm-12 pb-1">
						<button type="button" class="btn btn-primary d-none float-right"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
							<button type="button" class="btn btn-warning float-right mr-1"
								id="btnDel">삭제</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnEdit">수정</button>
							<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnAdd">추가</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-success float-left"
								id="btnReset">초기화</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
						<table class="table table-lg table-bordered mb-2" id="individualDtlTable">
							<colgroup>
								<col width="2%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="4%">
								<col width="9%">
								<col width="17%">
								<col width="4%">
								<col width="4%">
								<col width="5%">
								<col width="4%">
								<col width="10%">
								<col width="10%">
								<col width="7%">
								
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>개별입고일자</th>
									<th>거래처</th>
									<th>CODE</th>
									<th>REV</th>
									<th>ITEM</th>
									<th>SPEC</th>
									<th>단위</th>
									<th>무료/유료</th>
									<th class="text-center">개별입고수량</th>
									<th>수입검사여부</th>
									<th>locationNo</th>
									<th>LOT 번호 / 바코드번호</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>

			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
</div>
<%@include file="../layout/bottom.jsp" %>
<script>

	let currentHref = "iosc0210";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","개별입고등록"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	
	var tableIdx=null;
	var tableIdx2=null;
	var spplyCorpCdVal=null;
	var poNo;
	var poSeq;	
	var inSeq;
	var partCd;
	
	var partQty;
	var index = 0;
	var sum=0;

	var cmd = new Array();
	var i = 0;

	let printArray = new Array();
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	
	$('input[name=preInWhsDate]').val(serverDateTo);
	
	//공통코드 처리 시작		
 	var inspectYnCode = new Array(); // 상태유무
	<c:forEach items="${inspectYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspectYnCode.push(json);
	</c:forEach> 

	var payYnCode = new Array(); // 상태유무
	<c:forEach items="${payYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	payYnCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝		

	uiProc(true);
	
	//목록조회
    let individualAdmTable = $('#individualAdmTable').DataTable({
    	dom:  "<'row'<'col-sm-5 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        lengthChange : true,
        pageLength : 10,
        ajax: {
            url: '<c:url value="io/individualAdmList"/>',
            type: 'GET',
            data: {
	          	'startDate': function() { return serverDateFrom.replace(/-/g,'');},
	            'endDate': function() { return serverDateTo.replace(/-/g,''); }
            },          
        },
        rowId: 'poNo',
        columns : [ 
        	{
        		render: function(data, type, row, meta) {
					return '<input type="checkbox" class="checkbox_sm" id="checkLal-'+meta.row+'" name="printList" value="">';
				},
				'className' : 'text-center'
            },
			{data :'poNo'},
			{data :'preInWhsDate',
				render : function(data, type, row, meta){
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{data : 'spplyCorpNm'}, 
			{data : 'partCd'},
			{data : 'partRev'},
			{data : 'partNm'},				
			{data : 'partSpec'},
			{data : 'partUnit'},
			{data : 'preInWhsQty',
				className : 'text-right',
				render : function(data, type, row, meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				}
			},
			{data : 'inspectYn',
				render : function(data, type, row, meta){
					if(data=="001"){
						return 'Y';
					}else{
						return 'N';
					}
				}
			},
			{data : 'inWhsDesc'},
			
		],
		columnDefs: [
			
		],   
        order: [
            [1,'desc']
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    drawCallback: function() {
		    if(tableIdx2!=null){
		    	$('#purchaseOrderTable tbody tr').eq(tableIdx2).addClass('selected');
		  		printArray = [];
			}
		}
	  
    });


	//목록조회 행 선택
	$('#individualAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#individualAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');		
		}

		sideView = 'edit';
		btnView = '';
		console.log("index:"+individualAdmTable.row('tr.selected').index())
		
		poNo =  individualAdmTable.row(this).data().poNo; 
		partCd =  individualAdmTable.row(this).data().partCd; 
		poSeq =  individualAdmTable.row(this).data().poSeq; 
		inSeq =  individualAdmTable.row(this).data().inSeq; 

		for(var i=0; i<$('#individualDtlTable tbody tr').length; i++){
			if(individualDtlTable.data()[0] != null){
				if(individualAdmTable.row(this).data().poNo == individualDtlTable.data()[i].poNo){
					toastr.warning("이미 하단에 추가된 항목입니다. 확인해주세요");
					return false;
				}
			}
		}

		$('#individualDtlTable').DataTable().row.add({
			'poNo' 			:	individualAdmTable.row(this).data().poNo, 
			'poSeq' 		:	individualAdmTable.row(this).data().poSeq, 
			'inSeq' 		:	individualAdmTable.row(this).data().inSeq, 
			'preInWhsDate' 	:	individualAdmTable.row(this).data().preInWhsDate, 
			'spplyCorpNm' 	:	individualAdmTable.row(this).data().spplyCorpNm, 
			'spplyCorpCd' 	:	individualAdmTable.row(this).data().spplyCorpCd, 
			'partCd' 		:	individualAdmTable.row(this).data().partCd, 
			'partRev' 		:	individualAdmTable.row(this).data().partRev, 
			'partNm' 		:	individualAdmTable.row(this).data().partNm, 
			'partSpec' 		:	individualAdmTable.row(this).data().partSpec, 
			'partUnit' 		:	individualAdmTable.row(this).data().partUnit, 
			'payYn' 		:	individualAdmTable.row(this).data().payYn, 
			'preInWhsQty' 	:	individualAdmTable.row(this).data().preInWhsQty, 
			'inspectYn' 	:	individualAdmTable.row(this).data().inspectYn, 
			'lotNo' 		:	individualAdmTable.row(this).data().lotNo, 
			'barcodeNo' 	: 	individualAdmTable.row(this).data().barcodeNo, 
			'inWhsDesc' 	:	individualAdmTable.row(this).data().inWhsDesc,
			'locationNo'	:	individualAdmTable.row(this).data().locationNo
		}).draw(true);		
		

		//$('#individualDtlTable').DataTable().ajax.reload();
	});
	

	// 세부목록
	let individualDtlTable = $('#individualDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching: false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		ajax : {
			url : '<c:url value="io/preInOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'poNo' :  function(){return poNo;},
				'partCd' :  function(){return partCd;},
			},
		},
		columns : [
				{
					render: function(data, type, row, meta) {
						return meta.row+1;
					},
					'className' : 'text-center'
				}, {data : 'preInWhsDate',
					render: function(data, type, row, meta) {	
						if(data!=null){
							
							html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control"  type="text" id="preInWhsDate'+index+'" name="preInWhsDate" value="'+moment(data).format("YYYY-MM-DD")+'" disabled/>'  
		    				html += '<button onclick="fnPopUpCalendar(preInWhsDate'+index+',preInWhsDate'+index+',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="preInWhsDateFromCalendar" type="button" disabled>';	
							html += '<span class="oi oi-calendar"></span></buton></div>';

							index++;
							
							return html;
						} else{
							html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control"  type="text" id="preInWhsDate'+index+'" name="preInWhsDate" value="'+serverDateTo+'" disabled/>' 
		    				html += '<button onclick="fnPopUpCalendar(preInWhsDate'+index+',preInWhsDate'+index+',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="preInWhsDateFromCalendar" type="button">';	
							html += '<span class="oi oi-calendar"></span></buton></div>';

							index++;
							
							return html;
						}
					}		   
				}, {
					data : 'spplyCorpNm',
					render : function(data, type, row, meta) {
						var value = "";
						var value2 = "";
						if (data != null) {
							value = '<input type="text" class="form-control" style="max-width:100%;" name="spplyCorpNm" value="'+ data + '" disabled>';
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnSpplyCorp" onClick="selectSpplyCorp('+meta.row+');" disabled>';
						} else {
							value = '<input type="text" class="form-control" name="spplyCorpNm" value=""  style="max-width:100%;" disabled>';
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnSpplyCorp" onClick="selectSpplyCorp('+meta.row+');">';
						}
		
						var html = '<div class="input-sub m-0">';
						html += value;
						html += '<input type="hidden" name="spplyCorpCd" value="'+row['spplyCorpCd']+'">';
						html += '<input type="hidden" name="poNo" value="'+row['poNo']+'">';
						html += '<input type="hidden" name="poSeq" value="'+row['poSeq']+'">';
						html += '<input type="hidden" name="inSeq" value="'+row['inSeq']+'">';
						html += value2
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				}, {
					data : 'partCd',
					render : function(data, type, row, meta) {
						var value = "";
						var value2 = "";
						
						if (data != null) {
							value = '<input type="text" class="form-control" style="max-width:100%;" name="partCd" value="'+ data + '" disabled>';
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectPartCd('+meta.row+');" disabled>';
						} else {
							value = '<input type="text" class="form-control" name="partCd" value=""  style="max-width:100%;" disabled>';
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnPartCd" onClick="selectPartCd('+meta.row+');">';
						}
		
						var html = '<div class="input-sub m-0">';
						html += value;
						html += value2;
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
					}
				}, {data : 'partRev',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="partRev" value="'+addCommas(data)+'" style="text-align:center;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="partRev" value="" style="text-align:center;" disabled>';	
						}		    			
		    		}
				}, {data : 'partNm',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="partNm" value="'+addCommas(data)+'" style="text-align:center;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="partNm" value="" style="text-align:center;" disabled>';	
						}		    			
		    		}
				}, {data : 'partSpec',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="partSpec" value="'+addCommas(data)+'" style="text-align:center; min-width:100%;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="partSpec" value="" style="text-align:center; min-width:100%;" disabled>';	
						}		    			
		    		}
				}, {data : 'partUnit',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="partUnit" value="'+addCommas(data)+'" style="text-align:center; min-width:100%;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="partUnit" value="" style="text-align:center; min-width:100%;" disabled>';	
						}		    			
		    		}
				},{data : 'payYn',
					render: function(data, type, row, meta) {	
						var html ="";
						html = selectBoxHtml2(payYnCode, "payYn", "002", row, meta, "2");
						return html; 			
		    		}
				},{data : 'preInWhsQty',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="preInWhsQty" value="'+addCommas(data)+'" style="text-align:right;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="preInWhsQty" value="0" style="text-align:right;">';	
						}		    			
		    		}
				},{data : 'inspectYn',
					render: function(data, type, row, meta) {	
						var html ="";
						html = selectBoxHtml2(inspectYnCode, "inspectYn", data, row, meta, "2");
						return html; 			
		    		}
				},{data : 'locationNo',
					render: function(data, type, row, meta) {
							
						var value = "";
						var value2 = "";

						if (data != null) {
							value = '<input type="text" class="form-control" style="max-width:100%;" name="locationNo" value="'+ data + '" disabled>';
							value += '<input type="hidden" name="locationCd"  disabled>';
							value += '<input type="hidden" name="areaCd"  disabled>';
							value += '<input type="hidden" name="floorNm"  disabled>';
							
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnLocationNo" onClick="selectLocationNo('+meta.row+');" disabled>';
						} else {
							value = '<input type="text" class="form-control" name="locationNo" value=""  style="max-width:100%;" disabled>';
							value += '<input type="hidden" name="locationCd"  disabled>';
							value += '<input type="hidden" name="areaCd"  disabled>';
							value += '<input type="hidden" name="floorNm"  disabled>';
							
							value2 += '<button type="button" class="btn btn-primary input-sub-search" name="btnLocationNo" onClick="selectLocationNo('+meta.row+');">';
						}
		
						var html = '<div class="input-sub m-0">';
						html += value;
						html += value2;
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;		
		    		}
				},{data : 'lotNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
							var html;
		    				html =  '<input type="text" class="form-control" name="lotNo" value="'+data+'" style="text-align:center;" disabled>' ;	
		    				html +=  '<input type="hidden" class="form-control" name="barcodeNo" value="'+row['barcodeNo']+'" style="text-align:center;" disabled>' ;	
		    				return html;
						} else{
							var html;
		    				html =   '<input type="text" class="form-control" name="lotNo" value="" placeholder="처리중..." style="text-align:center;" disabled>';	
		    				html +=  '<input type="hidden" class="form-control" name="barcodeNo" value="" style="text-align:center;" disabled>' ;	
		    				return html;
						}	
					},
				},{data : 'inWhsDesc',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="inWhsDesc" value="'+data+'" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="inWhsDesc" value="">';	
						}		    			
		    		}
				}

		],  
		columnDefs: [
			//{ targets: [2,3] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' }
		],
        order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	}); 

	
	$('#individualDtlTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			
		} else {
			$('#individualDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');		
		}
		if(btnView == "update"){
			$("#btnDel").attr("disabled", false);
			$("#btnAllDel").attr("disabled", false);
		}
		
		tableIdx = individualDtlTable.row(this).index();
		
		poNo =  individualDtlTable.row(this).data().poNo; 
		poSeq =  individualDtlTable.row(this).data().poSeq; 
		inSeq =  individualDtlTable.row(this).data().inSeq; 

		console.log("poNo:"+poNo);

		 
		btnView='edit';
	});

	//인쇄항목 선택
	$(document).on('change','input:checkbox[name=printList]',function() {
		if($(this).is(':checked')) {
	    	var obj = new Object();
	    	obj.code = individualAdmTable.row('.selected').data().partCd;
	    	obj.rev = individualAdmTable.row('.selected').data().partRev;
	    	obj.item = individualAdmTable.row('.selected').data().partNm;
	    	obj.spec = individualAdmTable.row('.selected').data().partSpec;
	    	obj.date = individualAdmTable.row('.selected').data().preInWhsDate;
	    	obj.cnt = individualAdmTable.row('.selected').data().preInWhsQty;
	    	obj.barcodeNo = individualAdmTable.row('.selected').data().barcodeNo;
    		printArray.push(obj);
	    } else {
		    var barcodeNo = individualAdmTable.row('selected').data().barcodeNo;
		    if(printArray.findIndex(i => i.barcodeNo == barcodeNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.barcodeNo == barcodeNo),1);
			}
		    
		}
	});
	

	
	var sysdate = "${serverTime}";
    
    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';   
   
    html1 += '&nbsp;<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right float-right mr-1" id="partPrintCnt" placeholder="매수" style="width:40px;" value="1">';
    html1 += '<button type="button" class="btn btn-warning float-right mr-1" id="printLargeBarcode" onclick="printPartBarcode(1);">기본인쇄</button>';
    html1 += '<button type="button" class="btn btn-warning float-right mr-1" id="printSmallBarcode" onclick="printPartBarcode(2);">개별인쇄</button>';
    
    html1 += '</div>';
  
    
	$('#individualAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);
	
	$('#btnRetv').on('click', function() {
    	serverDateFrom =  $('#preInWhsDateFrom').val();
    	serverDateTo =  $('#preInWhsDateTo').val();
		$('#individualAdmTable').DataTable().ajax.reload( function () {});
    });

	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		$('#individualAdmTable').DataTable().ajax.reload(function() {});
    });


	//자재 탭 전체체크
    $('#checkAll').on('click', function(){
        if($("#checkAll").prop("checked")) { 
           $("input[type=checkbox]").prop("checked",true); 
        } else { 
           $("input[type=checkbox]").prop("checked",false);
        }        
    });
		
	// 추가폼
	$('#btnAdd').on('click', function() {
	/* 	if(sideView != "edit"){
			toastr.warning("가입고등록 항목을 선택해주세요.");
			return false;
		} */
		btnView = "add";
	
		$('#individualDtlTable').DataTable().row.add({
			'poNo' : '',
			'poSeq' : '',
			'inSeq' : '',
		}).draw(false);
		$('#btnSave').removeClass('d-none');
	});
	
	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("개별입고등록 항목을 선택해주세요.");
			return false;
		}
		if (btnView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		//수입검사여부 판단
		$.ajax({
			url : '<c:url value="io/statusCdCheck"/>',
			type : 'GET',
			data : {
				poNo : function(){return poNo},
				poSeq : function(){return poSeq},
				inSeq : function(){return inSeq}
			},
			success : function(res){
				if(res.result == "ok"){
					//$('input[name=addQty]').eq(tableIdx).attr('disabled',false);
					$('select[name=payYn]').eq(tableIdx).attr('disabled',false);
					$('input[name=preInWhsQty]').eq(tableIdx).attr('disabled',false);
					$('input[name=inWhsDesc]').eq(tableIdx).attr('disabled',false);
					$('select[name=inspectYn]').eq(tableIdx).attr('disabled',false);
					$('button[name=preInWhsDateFromCalendar]').eq(tableIdx).attr('disabled',false);
					$('button[name=btnSpplyCorp]').eq(tableIdx).attr('disabled',false);
					$('button[name=btnPartCd]').eq(tableIdx).attr('disabled',false);
					$('button[name=btnLocationNo]').eq(tableIdx).attr('disabled',false);
					
					$('#btnSave').removeClass('d-none');
				}else if(res.result == "noEdit"){
					toastr.warning("이미 수입검사되어 수정할 수 없습니다.");
				}
			}			
		});
		
	});

	//삭제 버튼 클릭
	$('#btnDel').on('click', function() {
		if(btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if(poNo!=""){
			//수입검사여부 판단
			$.ajax({
				url : '<c:url value="io/preInOutWhsAdmDelete"/>',
				type : 'GET',
				data : {
					poNo : function(){return poNo},
					poSeq : function(){return poSeq},
					inSeq : function(){return inSeq}
				},
				success : function(res){
					if(res.result == "ok"){
						toastr.success("삭제되었습니다.");
						$('#individualDtlTable').DataTable().rows(tableIdx).remove().draw();
						$('#individualAdmTable').DataTable().ajax.reload(function() {});
					}else if(res.result == "noDel"){
						toastr.warning("이미 수입검사되어 삭제할 수 없습니다.");
					}
				}			
			});
			
		}else{
			$('#individualDtlTable').DataTable().rows(tableIdx).remove().draw();
			$('#individualAdmTable').DataTable().ajax.reload(function() {});
		}

		
		//btnView = "update";
	});

	$('#btnReset').on('click',function(){
		$('#individualDtlTable').DataTable().clear().draw();
		$('#btnSave').addClass('d-none');
		toastr.success('초기화되었습니다.');
	});

	
	//수입검사여부에 따른 창고코드 입력
/* 	$('select[name=inspectYn]').on('change', function(){

		if($('select[name=inspectYn] option:selected').val("001")){
			$('button[name=btnLocationNo]').attr('disabled',true);
		}else{
			$('button[name=btnLocationNo]').attr('disabled',false);
		}
	});
 */
	
	// 저장 처리
	$('#btnSave').on('click',function() {

		var dataArray = new Array();		
		var check=true;  		
		
		$('#individualDtlTable tbody tr').each(function(index, item){

			if(individualDtlTable.data().count()!=0){

				//입력값 검사
				if ($(this).find("td input[name=spplyCorpNm]").val() == "") {		
					toastr.warning('거래처를 선택해주세요.');	
					$(this).find("td button[name=btnSpplyCorp]").focus();
					check=false;
					return false;
				} 

				if ($(this).find("td input[name=partNm]").val() == "") {		
					toastr.warning('코드를 선택해주세요.');	
					$(this).find("td button[name=btnPartCd]").focus();
					check=false;
					return false;
				} 
				
				if ($(this).find("td input[name=preInWhsQty]").val() == "0") {		
					toastr.warning('개별입고수량을 입력해주세요.');	
					$(this).find("td input[name=preInWhsQty]").focus();
					check=false;
					return false;
				} 

				if (!$.trim($(this).find("td input[name=locationNo]").val())) {		
					toastr.warning('창고를 입력해주세요.');	
					$(this).find("td button[name=btnLocationNo]").focus();
					check=false;
					return false;
				} 

				var rowData = new Object();

				rowData.poNo = $(this).find("td input[name=poNo]").val()==null?"":$(this).find("td input[name=poNo]").val();
				rowData.poSeq = $(this).find("td input[name=poSeq]").val()==null?"":$(this).find("td input[name=poSeq]").val();
				rowData.inSeq = $(this).find("td input[name=inSeq]").val()==null?"":$(this).find("td input[name=inSeq]").val();
				
				rowData.preInWhsDate = $(this).find("td input[name=preInWhsDate]").val().replace(/-/g,'');
				spplyCorpCdVal = ($(this).find("td input[name=spplyCorpNm]").val()==null||$(this).find("td input[name=spplyCorpNm]").val()=="")?"":$(this).find("td input[name=spplyCorpCd]").val();
				console.log('거래처명 : '+$(this).find("td input[name=spplyCorpNm]").val())
				rowData.spplyCorpCd = spplyCorpCdVal;
				rowData.partCd= $(this).find("td input[name=partCd]").val();
				rowData.partRev = $(this).find("td input[name=partRev]").val();
				rowData.payYn = $('select[name="payYn"] option:selected').val();
				rowData.preInWhsQty = $(this).find("td input[name=preInWhsQty]").val().replace(/,/g,'');
				rowData.inWhsDesc = $(this).find("td input[name=inWhsDesc]").val();

				rowData.inspectYn = $('select[name="inspectYn"] option:selected').val();
				rowData.barcodeNo = $(this).find("td input[name=barcodeNo]").val()==null?"":$(this).find("td input[name=barcodeNo]").val();

				rowData.locationNo = $(this).find("td input[name=locationNo]").val();
				rowData.locationCd = $(this).find("td input[name=locationCd]").val();
				rowData.areaCd = $(this).find("td input[name=areaCd]").val();
				rowData.floorNm = $(this).find("td input[name=floorNm]").val();
				
				
		        dataArray.push(rowData);
		        console.log(rowData);
			}else{
			}
		});
	
		
		if(check == true){
			$.ajax({
				url : '<c:url value="io/individualAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if (res.result == 'ok') {
						
						btnView = "";
						// 보기					
						$('#individualAdmTable').DataTable().ajax.reload(function() {});
						$('#individualDtlTable').DataTable().clear().draw();
						$('#btnSave').addClass('d-none');
						
						toastr.success('저장되었습니다.');
						
						sideView = 'edit';
					} else{
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


	//입고처 팝업 시작
	var dealCorpPopUpTable;
	var index2;
	function selectSpplyCorp(index) {
		index2 = index;
		if (dealCorpPopUpTable == null || dealCorpPopUpTable == undefined) {
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				serverSide : true,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/bm/dealCorpDataList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'dealCorpCd',
				columns : [ {
					data : 'dealCorpCd'
				}, {
					data : 'dealCorpNm'
				}, {
					data : 'initial'
				}, {
					data : 'presidentNm'
				}, {
					data : 'country'
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

			$('#dealCorpPopUpTable tbody').on('click', 'tr', function() {

				var data = dealCorpPopUpTable.row(this).data();
				$('input[name=spplyCorpCd]').eq(index2).val(data.dealCorpCd);
				$('input[name=spplyCorpNm]').eq(index2).val(data.dealCorpNm);
				$('#dealCorpPopUpModal').modal('hide');

			});
		}
		$('#dealCorpPopUpModal').modal('show');
	}

	var itemPartPopUpTable;
	var index3;
	function selectPartCd(index) {
		index3 = index;
		if (itemPartPopUpTable == null || itemPartPopUpTable == undefined) {
			itemPartPopUpTable = $('#itemPartPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : false,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				searching : true,
				serverSide : true,
				pageLength : 15,
				ajax : {
					url : '<c:url value="bm/itemPartAdmList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'partCd',
				columns : [
						{
							render : function(data, type, row,
									meta) {
								return meta.row+ meta.settings._iDisplayStart+ 1;
							}
						}, {
							data : 'partCd',
							'className' : 'text-center'
						}, {
							data : 'partNm'
						}, {
							data : 'partGubunNm',
							'className' : 'text-center'
						}, {
							data : 'partTypeNm',
							'className' : 'text-center'
						}, {
							data : 'partRev',
							'className' : 'text-center'
						}, {
							data : 'partSpec'
						} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 1, 'asc' ] ],
				buttons : [],
			});

			$('#itemPartPopUpTable tbody').on('click', 'tr', function() {

				var data = itemPartPopUpTable.row(this).data();
			
				$('input[name=partCd]').eq(index3).val(data.partCd);
				$('input[name=partRev]').eq(index3).val(data.partRev);
				$('input[name=partNm]').eq(index3).val(data.partNm);
				$('input[name=partSpec]').eq(index3).val(data.partSpec);
				$('input[name=partUnit]').eq(index3).val(data.partUnitNm);
				$('select[name=inspectYn]').eq(index3).val(data.inspectYn);

				/* if(data.inspectYn == '001'){
					$('button[name=btnLocationNo]').attr('disabled',true);
				}else{
					$('button[name=btnLocationNo]').attr('disabled',false);
				} */
				
				$('#itemPartPopUpModal').modal('hide');
			});
		} else {
			$('#itemPartPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#itemPartPopUpModal').modal('show');
	};

	//창고정보조회 팝업 시작
	var locationPopupTable;
	function selectLocationNo(index) {
		index3 = index;
		locationPopupTable = $('#locationPopupTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			searching:true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy : true,
			pageLength : 15,
			ajax : {
				url : 'bm/locationAdmList',
				type : 'GET',
				data : {
					'useYn' : '001',
					'locCd' : $('#locationCd option:selected').val()
					}
			},
			columns : [ 
			{
				render : function(data, type, row,meta) {
					return meta.row+1;
				}
			}, {
				data : 'locNm'
			}, {
				data : 'areaNm'
			}, {
				data : 'floorNm'
			}, {
				data : 'locDesc'
			}, {
				data : 'locNo'
			},  ],
			columnDefs : [ {
				"targets" : '_all',"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});
		
		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();
			console.log('팝업data:'+data)

			$('input[name=locationNo]').eq(index3).val(data.locNo);
			$('input[name=locationCd]').eq(index3).val(data.locCd);
			$('input[name=areaNm]').eq(index3).val(data.areaNm);
			$('input[name=areaCd]').eq(index3).val(data.areaCd);
			$('input[name=floorNm]').eq(index3).val(data.floorNm);
			
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	} 
	

	function uiProc(flag) {
		$('input[name=lotNo]').attr('disabled',flag);
		$('input[name=srLot]').attr('disabled',flag);
		$('input[name=custItemCd]').attr('disabled',flag);
		$('input[name=custItemNm]').attr('disabled',flag);
		$('input[name=preInWhsQty]').attr('disabled',flag);
		$('input[name=inWhsDesc]').attr('disabled',flag);
		$("select[name=preInStatus]").attr("disabled", flag);
		$("button[name=inWhsDateFromCalendar]").attr("disabled",flag);
	}


	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta, flag){

		var shtml="";
		if(btnView == ""){
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		}else if(btnView == "add" || btnView == "edit"){
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		
		var option2="";
		if(flag == '1') {
			option2 = "<option value='' selected>"+ "전체" +"</option>";
	   	} else if(flag == '2') {
	   		option2 = "<option value=''>"+ "선택" +"</option>";
	   	}

	   	
		var option;
		for(key in obj) {
			var tmp; 
			if(obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option2 +option + ehtml;
		
	}	

 	$(document).on('keyup',"input[name=preInWhsQty]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if ( !(	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)	) {
			/* $('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); */
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
 			$(this).select();
			event.preventDefault();
			return false;
		}
 		$(this).val(addCommas(uncomma($(this).val())));
	}); 

	
    //콤마(,) 생성
    function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	}


	var temp = 0; 	// 출력 함수를 실행한 횟수
	var count = 0; 	// 3개씩 출력해야 되는 횟수
	var last = 0;	// 마지막 한번 출력할때의 라벨 갯수
	

	
	// 자재 바코드 인쇄
	function printPartBarcode(gubun){
		if(printArray.length == 0) {
			toastr.warning('인쇄할 자재를 체크하고 인쇄해주세요.');
			return false;
		}

		var item = '';
		var spec = '';
		var date = '';
		var cnt = '';

		var codeArray = new Array();
		var revArray = new Array();
		var barcodeNoArray = new Array();
		var printList = new Array();
		
		for(var i=0;i<printArray.length;i++) {
			for(var j=0;j<parseInt($('#partPrintCnt').val());j++) {
				printList.push(printArray[i]);
			}
		}
		
		if(gubun == 1) { // 기본인쇄
			var type = 'single';
			console.log("printList:"+printList.length)
			for(var i=0;i<printList.length;i++) {
				labelPrint(type,
						printList[i].code,
						printList[i].rev,
						printList[i].item,
						printList[i].spec,
						printList[i].date,
						printList[i].cnt,
						printList[i].barcodeNo);
			}
		} else if(gubun == 2) { // 개별인쇄
			var type = 'multi';
			for(var i=0;i<printList.length;i++) {
				if(printList.length == i+1 || i%3 == 2) {
					codeArray.push(printList[i].code);
					revArray.push(printList[i].rev);
					barcodeNoArray.push(printList[i].barcodeNo);
					labelPrint(type, codeArray, revArray, item, spec, date, cnt, barcodeNoArray);
					codeArray = [];
					revArray = [];
					barcodeNoArray = [];
				} else {
					codeArray.push(printList[i].code);
					revArray.push(printList[i].rev);
					barcodeNoArray.push(printList[i].barcodeNo);
				}
			}
		}
	}


</script>
<script>

//Do printing...
function labelPrint(type, code, rev, item, spec, date, cnt, barcodeNo) {

	if(type == 'single') { // 기본인쇄
		var cmds =  "1";
	 		cmds += "34#$";
	 		cmds += "^XA";
	 		cmds += "^PRD";
	 		cmds += "^SEE:UHANGUL.DAT^FS";
	 		cmds += "^CW1,E:KFONT3.FNT^CI26^FS";		
	 		cmds += "^FO70,10^GB200,73,3^FS";
	 	    cmds += "^FO100,35^A1N,30,30^FDCODE NO^FS";		    
	 		cmds += "^FO70,80^GB200,73,3^FS";
	 	    cmds += "^FO110,105^A1N,30,30^FDI T E M^FS";		    
	 		cmds += "^FO70,150^GB200,73,3^FS";
	 	    cmds += "^FO110,175^A1N,30,30^FDS P E C^FS";		    
	 		cmds += "^FO70,220^GB200,73,3^FS";
	 	    cmds += "^FO85,245^A1N,25,25^FD입고일자/수량^FS";		    
	 		cmds += "^FO70,290^GB700,73,3^FS";
	 	if(barcodeNo.length > 13) {
	 		cmds += "^FO150,297^BY2,3^BCN,40,Y,N,Y^FD" + barcodeNo + "^FS";
		} else {
			cmds += "^FO250,297^BY2,3^BCN,40,Y,N,Y^FD" + barcodeNo + "^FS";
		}
	 		cmds += "^FO267,10^GB503,73,3^FS";
	 	    cmds += "^FO282,35^A1N,30,30^FD" + code + "^FS";			
	 		cmds += "^FO267,80^GB503,73,3^FS";
	 	    cmds += "^FO282,105^A1N,30,30^FD" + item + "^FS";			
	 		cmds += "^FO267,150^GB503,73,3^FS";
	 	    cmds += "^FO282,175^A1N,30,30^FD" + spec + "^FS";		
	 		cmds += "^FO267,220^GB503,73,3^FS";
	 	    cmds += "^FO282,245^A1N,30,30^FD" + moment(date).format('YYYY.MM.DD') + "    /    " + cnt + "^FS";		
	 		cmds += "^XZ";
 		sendMessage(cmds);
	} else if(type == 'multi') { // 개별인쇄
		
		var cmds =  "";
			cmds += "2";
			cmds += "34#$";
			cmds += "^XA";
			cmds += "^PRD";
			cmds += "^SEE:UHANGUL.DAT^FS";
			cmds += "^CW1,E:KFONT3.FNT^CI26^FS";
		for(var i=0;i<code.length;i++) {
			if(i==0) {
				cmds += "^FO152,12^GB153,192,2^FS";
				cmds += "^FO152,12^GB153,25,2^FS";
				cmds += "^FO152,57^GB153,25,2^FS";
				cmds += "^FO152,57^GB70,25,2^FS";
				cmds += "^FO198,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO165,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO167,60^A1N,20,20^FDREV^FS";
				cmds += "^FO225,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO180,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			} else if(i==1) {
				cmds += "^FO335,12^GB153,192,2^FS";
				cmds += "^FO335,12^GB153,25,2^FS";
				cmds += "^FO335,57^GB153,25,2^FS";
				cmds += "^FO335,57^GB70,25,2^FS";
				cmds += "^FO381,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO348,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO350,60^A1N,20,20^FDREV^FS";
				cmds += "^FO408,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO363,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			} else {
				cmds += "^FO520,12^GB153,192,2^FS";
				cmds += "^FO520,12^GB153,25,2^FS";
				cmds += "^FO520,57^GB153,25,2^FS";
				cmds += "^FO520,57^GB70,25,2^FS";
				cmds += "^FO566,16^A1N,20,20^FDCODE^FS";
				cmds += "^FO533,38^A1N,20,20^FD"+code[i]+"^FS";
				cmds += "^FO535,60^A1N,20,20^FDREV^FS";
				cmds += "^FO593,60^A1N,20,20^FD"+rev[i]+"^FS";
				cmds += "^FO548,85^BQN,2,4^FD123"+barcodeNo[i]+"^FS";
			}
		}
			cmds += "^XZ";
			
			sendMessage(cmds);
			console.log('라벨인쇄');
	}
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
