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
				<li class="breadcrumb-item active">제품출고관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row p-0 mb-2" style="height:50vh;">
			<div class="ml-1 p-1" style="background-color:#ffffff; flex: 0 0 100%; max-width: 100%; border-radius: 5px;">
				<div id="myTabContent" class="tab-content" style="border-right: 1px solid rgba(34, 34, 48, 0.1);
																  border-left: 1px solid rgba(34, 34, 48, 0.1);
																  border-bottom: 1px solid rgba(34, 34, 48, 0.1);">
					<div class="tab-pane fade active show" id="tab1">
						<div class="container-fluid p-0">
							<div class="row ml-2 mt-2 mr-2 mb-0">
								<div class="col-md-8 p-0">
									<!-- 조회영역 -->
									<div class="row">
										<label class="input-label-sm">출고요청일</label>
										<div class="form-group input-sub mr-1 row">
											<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled="">
											<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="doDateFromCalendar" type="button">
												<span class="oi oi-calendar"></span>
											</button>
										</div>&nbsp;~ &nbsp;
										<div class="form-group input-sub mr-1 row">
											<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled="">
											<button onclick="fnPopUpCalendar(doDateTo,doDateTo,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="doDateToCalendar" type="button">
												<span class="oi oi-calendar"></span>
											</button>
										</div>&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="input-label-sm">구분</label>
										<select class="custom-select" id="mainGubunOption" style="width: 80px;">
											<option value="">전체</option><option value="001">레이저</option><option value="002">후가공</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										<label class="input-label-sm">출고상태</label>
										<select class="custom-select" id="doStatusOption" style="width: 80px;">
											<option value="002">출고진행</option><option value="003">출고완료</option>
										</select>&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>
										<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>
									</div>
								</div>
								<div class="col-md-4 p-0">
									<!-- 버튼영역 -->
									<div class="row" style="display:block;">
										<input class="form-control-lg float-right mr-4" type="text" id="dtlTextSearch" placeholder="통합검색" style="height: 3vh;">
									</div>
								</div>
							</div>
							<div class="row ml-2 mt-0 mr-2 mb-1">
								<div class="col-md-12 p-0">
									<table id="deliveryOrderAdmTable" class="table table-bordered m-0">
										<thead class="thead-light">
											<tr>
												<th>No.</th>
												<th>구분</th>
												<th>출고상태</th>
												<th>출고요청번호</th>
												<th>수주구분</th>
												<th>발주처</th>
												<th>품번</th>
												<th>품명</th>
												<th>출고요청일</th>
												<th>수주량</th>
												<th>출고요청량</th>
												<th>출고량</th>
												<th>현재고</th>
												<th>지시량</th>
												<th>생산량</th>
												<th>출고처</th>
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
		<div class="row p-0 mb-2" style="height:36vh;">
			<div class="ml-1 p-1" style="background-color:#ffffff; flex: 0 0 100%; max-width: 100%; border-radius: 5px;">
				<div id="myTabContent" class="tab-content" style="border-right: 1px solid rgba(34, 34, 48, 0.1);
																  border-left: 1px solid rgba(34, 34, 48, 0.1);
																  border-bottom: 1px solid rgba(34, 34, 48, 0.1);">
					<div class="tab-pane fade active show" id="tab2">
						<div class="container-fluid p-0">
							<div class="row mt-2">
							 	<div class="card-body p-0">
									<button type="button" class="btn btn-primary float-left mb-1 mr-1" id="btnItemAdd" onclick="itemAddPopup();">품목추가</button>
									<!-- <button type="button" class="btn btn-warning float-left mb-1 mr-1" id="btnEdit">수정</button> -->
									<button type="button" class="btn btn-primary float-right mb-1" id="btnSave">저장</button>
									<button type="button" class="btn btn-danger float-right mb-1 mr-1" id="btnDel">삭제</button>
									<label class="input-label-sm float-left mb-1 ml-1 mr-1">라벨바코드 : </label>
									<input type="text" placeholder="스캔해 주세요." id="barcodeNo" class="form-control float-left mb-1">
									
								</div>
								<div class="col-md-12 p-0">
									<table id="deliveryProcDtlTable" class="table table-bordered m-0">
										<colgroup>	
											<col width="3%">
											<col width="13%">
											<col width="12%">
											<col width="11%">
											<col width="11%">
											<col width="11%">
											<col width="11%">
											<col width="11%">
											<col width="17%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th class="text-center">
													<input type="checkbox" id="checkAll" name="checkAll">
												</th>
												<th class="text-center">수주상세번호</th>
												<th class="text-center">출고요청번호</th>
												<th class="text-center">출고번호</th>
												<th class="text-center">품번</th>
												<th class="text-center">LOT NO</th>
												<th class="text-center">출고수량</th>
												<th class="text-center">출고일자</th>
												<th class="text-center">비고</th>
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
</div>

<!-- 품목추가 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="itemAddModal" tabindex="-1" aria-labelledby="itemAddModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%;">
		<div class="modal-content">
			<div class="modal-header">
		        <h5 class="modal-title" id="itemAddModalLabel">품목 조회 및 추가</h5>
            </div>
            <div class="card-body p-0 pr-3">
				<button type="button" class="btn btn-primary float-right mb-1 mr-1" id="btnItemAddPopup">품목추가</button>
			</div>
			<div class="modal-body" style="padding-top:0px;">
				<hr class="text-secondary m-2">	         
				<table id="itemAddTable" class="table table-bordered m-0" style="width:100%!important; min-width: 100px;">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="checkAll" name="checkAll">
							</th>
							<th>품목구분</th>
							<th>품번</th>
							<th>품명</th>
							<th>LOT NO</th>
							<th>수량</th>
							<th>재고창고</th>
						</tr>
					</thead>
				</table>
				<hr class="text-secondary m-2"> 
	      	</div>
		  	<div class="modal-footer p-0 pr-3">
				<button type="button" class="btn btn-secondary float-right mb-1 mr-1" data-dismiss="modal">닫기</button>	
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	let currentHref = "bssc0100";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "제품출고관리");	

	let startDateVal = moment().subtract('1','w').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let serverDateVal = moment().format('YYYY-MM-DD');
	let serverMonVal = moment().format('YYYYMM');
	let userNm = "${userNm}"
	let userNumber = "${userNumber}"

//	let doDateFrom = '';
//	let doDateTo = '';

	let itemSeqVal = '';	//출고요청관리IDX
	let doNoVal = '';
	let mainGubun =	'';
	let locationCdVal = '';
	let tableIdx = '';
	let doStatus = '';

	$('#doDateFrom').val(startDateVal);
	$('#doDateTo').val(endDateVal);

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
		paging : false,
		searching: true,
		pageLength : 100000000, 
		scrollY: "37.1vh",
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				'doStatus' : function(){return $('#doStatusOption').val()},
				'doStatus2' : function(){return '001'},
				'mainGubun' : function(){return mainGubun;},
				'startDate' : function(){return $('#doDateFrom').val().replace(/-/g, ''); },
				'endDate' : function(){return $('#doDateTo').val().replace(/-/g, '');},
			},
		},
		rowId : 'contDtlNo',
		columns : [
			{ 
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				},'className' : 'text-center'
			},
			{data : 'mainGubunNm'},
			{data : 'doStatusNm'},
			
			{data : 'doNo'},
			{data : 'bizGubunNm'},
			{data : 'ordCorpNm'},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{
				data : 'doDate',
				render : function(data, type, row, meta) {
					if(data != null){
						if(row['doStatus'] == '002' && serverDateVal.replace(/-/g, '') >= data){
							return '<span style="color:red;">' + moment(data).format('YYYY-MM-DD'); + '</span>';
						} else return moment(data).format('YYYY-MM-DD');
					} else return '';
				},
			},
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},
			{
				data : 'doQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	
			{
				data : 'dpQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	//현재고
			{
				data : 'dtlOrdCnt',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	//지시량
			{
				data : 'totalInQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	//생산량
			{data : 'outCorpNm'},
			{data : 'contDtlNo'},
		],
		columnDefs : [ 
			{targets : [9,10,11,12,13,14],render : $.fn.dataTable.render.number(','),className : 'text-right'},
			{targets : '_all',className : 'text-center'} 
 		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		createdRow : function(row,data,dataIndex){
			if(data['doStatus'] != null){
				if(data['doStatus']=="001"){	//요청대기
					$(row).find('td').eq(2).css('backgroundColor', '#FFFFFF');
					$(row).find('td').eq(2).css('color', 'black');
				}else if(data['doStatus']=="002"){	//요청완료
					$(row).find('td').eq(2).css('backgroundColor', '#ebf3ff');
					$(row).find('td').eq(2).css('color', 'black');
				}else if(data['doStatus']=="003"){	//출고진행
					$(row).find('td').eq(2).css('backgroundColor', '#fdebdd');
					$(row).find('td').eq(2).css('color', 'black');
				}else if(data['doStatus']=="004"){	//출고완료
					$(row).find('td').eq(2).css('backgroundColor', '#ddfdf4');
					$(row).find('td').eq(2).css('color', 'black');
				}
			}else{
				$(row).find('td').eq(2).css('backgroundColor', '#FFFFFF');	//요청대기
				$(row).find('td').eq(2).css('color', 'black');
			}
		},
		drawCallback: function() {
			$('#deliveryOrderAdmTable_filter').addClass('d-none');
		}
	});

	//조회 버튼 클릭
	$('#btnRetv').on('click',function(){
		doStatus = $('#doStatusOption option:selected').val();
		mainGubun = $('#mainGubunOption option:selected').val();
		startDate = $('#doDateFrom').val();
		endDate = $('#doDateTo').val();
		$('#deliveryOrderAdmTable').DataTable().ajax.reload(function(){});
	});

	//전체조회 버튼 클릭
	$('#btnAllRetv').on('click',function(){
		doStatus = '';
		mainGubun = '';
		startDate = '';
		endDate = '';
		$('#deliveryOrderAdmTable').DataTable().ajax.reload(function(){});
	});

	// 통합검색
	$('#dtlTextSearch').on('keyup',function() {
		$('#deliveryOrderAdmTable_filter').find('input').val($(this).val());
		$('#deliveryOrderAdmTable_filter').find('input').trigger('keyup');
	});
	
	//출고요청 목록 선택시
	$('#deliveryOrderAdmTable tbody').on('click','tr',function(){
		if($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		}else{
			$('#deliveryOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = deliveryOrderAdmTable.row(this).index();
		itemSeqVal = deliveryOrderAdmTable.row(this).data().itemSeq;
		doNoVal = deliveryOrderAdmTable.row(this).data().doNo;
		mainGubunVal = deliveryOrderAdmTable.row(this).data().mainGubun;
		locationCdVal = mainGubunVal=="001"?"002":"007";
		
		$('#deliveryProcDtlTable').DataTable().ajax.reload(function(){});
	});

	
	//출고요청 상세 목록조회
	let deliveryProcDtlTable = $('#deliveryProcDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 col-md-5 mt-2 text-left'B><'col-sm-12 col-md-2 mt-2 text-center'><'col-sm-12 col-md-5 text-right'i>>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "23.1vh",
		ajax : {
			url : '<c:url value="bs/deliveryProcDtlList"/>',
			type : 'GET',
			data : {
				'doNo' : function(){return doNoVal},
			},
		},
		rowId : 'contDtlNo',
		columns : [
			{ 
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check" />';
				},'className' : 'text-center'
			},
			{data : 'contDtlNo'},
			{data : 'doNo'},
			{data : 'dpNo'},
			{data : 'itemCd'},
			{data : 'barcodeNo'},
			{
				data : 'dpQty',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<input type="text" class="form-control" name="dpQty" value="'+rmDecimal(data)+'" style="text-align:right;font-size: 13px;"/>';
					}else{
						return '<input type="text" class="form-control" name="dpQty" value="'+row['inQty']+'" style="text-align:right;font-size: 13px;"/>';
					}
				},
			},	
			{
				data : 'dpDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<input type="date" class="form-control" name="dpDate" value="'+moment(data).format('YYYY-MM-DD')+'" style="text-align:center;font-size: 13px;"/>';
					}else{
						return '<input type="date" class="form-control" name="dpDate" value="'+serverDateVal+'" style="text-align:center;font-size: 13px;"/>';
					}
				},
			},
			{
				data : 'dpDesc',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<input type="text" class="form-control" name="dpDesc" value="'+data+'" style="font-size: 13px; min-width:100%"/>';
					}else{
						return '<input type="text" class="form-control" name="dpDesc" value="" style="font-size: 13px; min-width:100%"/>';
					}
				},
			},
			
		],
		columnDefs : [ 
			{targets : [6],render : $.fn.dataTable.render.number(','),className : 'text-right'},
			{targets : '_all',className : 'text-center'} 
 		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});


	//품목추가 목록조회
	let itemAddTable;
	function itemAddPopup() {
		//예외처리
		if(!$('#deliveryOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("출고할 항목을 선택해주세요.");
			return false;
		}

		if(itemAddTable == null || itemAddTable == undefined)	{
			itemAddTable = $('#itemAddTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'>>"
					+ "<'row'<'col-sm-12 p-0'tr>>"
					+ "<'row'<'col-sm-12 col-md-5 mt-2 text-left'B><'col-sm-12 col-md-2 mt-2 text-center'><'col-sm-12 col-md-5 text-right'i>>",
				language : lang_kor,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : true,
				paging : false,
				searching: false,
				pageLength : 100000000, 
				ajax : {
					url : '<c:url value="tm/stockPaymentAdmBarcodeList"/>',
					type : 'GET',
	 				data : {
	 					'tmMon' : function(){return serverMonVal;},
						'itemSeq' : function(){return itemSeqVal;},
						'locationCd' : function(){return locationCdVal;},
						'realQtyOption' : 'Y'
					},
				},
				columns : [
					{ 
						render : function(data, type, row, meta) {
							return '<input type="checkbox" name="popupCheck" />';
						},'className' : 'text-center'
					},
					{data : 'spTypeNm'},
					{data : 'spCd'},
					{data : 'spNm'},
					{data : 'barcodeNo'},
					{
						data : 'realQty',
						render : function(data, type, row, meta) {
							return data!=null?rmDecimal(data):'';
						},
					},	
					{data : 'locationNm'},
				],
				columnDefs : [ 
					{targets : [5],render : $.fn.dataTable.render.number(','),className : 'text-right'},
					{targets : '_all',className : 'text-center'} 
		 		],
				order : [ [ 0, 'asc' ] ],
				buttons : [ 'copy', 'excel', 'print' ],
				drawCallback: function() {
				}
			});
		}else {
			$('#checkAll2').prop('checked',false);
			$('#itemAddTable').DataTable().ajax.reload(function(){});
		}

		$('#itemAddModal').modal('show');
	}


	//품목추가 버튼 클릭시(팝업창 내부)
	$('#btnItemAddPopup').on('click',function(){
		var data = deliveryOrderAdmTable.row(tableIdx).data();
		
		$('#itemAddTable tbody tr').each(function(index,item){
			if($('input[name=popupCheck]').eq(index).is(':checked')){

				$('#deliveryProcDtlTable').DataTable().row.add({
					'contDtlNo' : data.contDtlNo,
					'doNo' 	: data.doNo,
					'dpNo' 	: '',
					'barcodeNo' : itemAddTable.row(index).data().barcodeNo,
					'itemCd' 	: itemAddTable.row(index).data().spCd,
					'itemGubun' 	: itemAddTable.row(index).data().spType,
					'locationCd' 	: itemAddTable.row(index).data().locationCd,
					'locationNm': itemAddTable.row(index).data().locationNm,
					'locationNo' 	: itemAddTable.row(index).data().locationNo,
					'dpQty' 	: rmDecimal(itemAddTable.row(index).data().realQty),
				}).draw(false);	
			}
		});

		$('#itemAddModal').modal('hide');
	});


	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		var check=true;

		if(!$('input[name=check]').is(':checked')){
			check=false;
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		$('#deliveryProcDtlTable tbody tr').each(function(index,item){
			if($('input[name=check]').eq(index).is(':checked')){
				let idxVal = deliveryProcDtlTable.row(index).data().idx;
				$('input[name=dpDate]').eq(index).attr('disabled',false);
				$('input[name=dpDesc]').eq(index).attr('disabled',false);
			}
		});
	});


	
	
	//삭제버튼 클릭시
	$('#btnDel').on('click',function(){
		var rowIndexArr = new Array();
		var rowDataArr = new Array();
		var rowDataArr2 = new Array();
		var check=true;
		let messageCheck = true;
		var i = 0;
		
		if(!$('input[name=check]').is(':checked')){
			check=false;
			toastr.warning("삭제할 항목을 선택해주세요.");
			messageCheck = false;
			return false;
		}
		
		$('#deliveryProcDtlTable tbody tr').each(function(index,item){
			var data = deliveryProcDtlTable.row(index).data();
			
			if($('input[name=check]').eq(index).is(':checked')){
				if(data.dpNo!="") {
					rowIndexArr.push(i);
					rowDataArr.push(data.dpNo);

					rowDataArr2.push(data.dpQty);
					i++;
				}
			}
		});

		let deleteIndexArray = new Array();
		$('#deliveryProcDtlTable tbody tr').each(function(index, item){
			if($(this).find('input[name=check]').is(':checked')) {
				deleteIndexArray.push(index);
			}
		});

		deliveryProcDtlTable.rows(deleteIndexArray).remove().draw();
		console.log(rowDataArr)
		$('#checkAll').prop('checked',false);

		if(rowDataArr.length>0){
			console.log('rowDataArr:'+rowDataArr);
			$.ajax({
				url : '<c:url value="bs/deliveryProcDtlDel" />',
				type : 'POST',
				data : {
					'doNo' : function(){return doNoVal},
					'dpNoArr' : function(){return rowDataArr},
					'dpQtyArr' : function(){return rowDataArr2}
				},
				success : function(res){
					if(res.result=="ok"){
						$('#deliveryOrderAdmTable').DataTable().ajax.reload();
						messageCheck2 = true;
					}else{
						messageCheck2 = false;
						toastr.error(res.message);
					}
				}
			})
		}else{
			messageCheck2 = false;
		}

		setTimeout(function(){
			if(messageCheck || messageCheck2) toastr.success("출고삭제 되었습니다.");
		},100)
	});

	//저장 버튼 클릭시
	$('#btnSave').on('click',function(){
		var dataArray = new Array();		
		var check=true;  		
		var data = deliveryOrderAdmTable.row(tableIdx).data();

		if(!$('input[name=check]').is(':checked')){
			check=false;
			toastr.warning("저장할 항목을 선택해주세요.");
			return false;
		}
		
		$('#deliveryProcDtlTable tbody tr').each(function(index,item){
			if($('input[name=check]').eq(index).is(':checked')){

				//예외처리
				if ($(this).find('td input[name=dpQty]').val()=="" || $(this).find('td input[name=dpQty]').val()=="0") {
					toastr.warning('실제출고량을 입력해주세요.');
					$(this).find('td input[name=dpQty]').focus();
					check = false;
					return false;
				}

				if ($(this).find('td input[name=dpDate]').val()=="") {
					toastr.warning('실제출고일을 입력해주세요.');
					$(this).find('td input[name=dpDate]').focus();
					check = false;
					return false;
				}

				var dtlData = deliveryProcDtlTable.row(index).data();
				var rowData = new Object();

				rowData.dpNo = dtlData.dpNo==null?"":dtlData.dpNo;
				rowData.doNo = dtlData.doNo;
				rowData.itemSeq = data.itemSeq;
				rowData.spType = dtlData.itemGubun;
				rowData.barcodeNo = dtlData.barcodeNo;
				rowData.locationCd = dtlData.locationCd;
				rowData.locationNo = dtlData.locationNo;
				rowData.dpQty = $(this).find('input[name=dpQty]').val().replace(/,/g,'');
				rowData.dpDate = $(this).find('input[name=dpDate]').val().replace(/-/g,'');
				rowData.dpDesc = $(this).find('input[name=dpDesc]').val().replace(/-/g,'');
				rowData.targetQty = data.dtlOrdCnt;
				dataArray.push(rowData);
			    console.log(rowData);
			}
		});

		if(check){
			$.ajax({
				url : '<c:url value="bs/deliveryProcDtlIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {		
					if (res.result == 'ok') {
						$('#deliveryOrderAdmTable').DataTable().ajax.reload();
						$('#deliveryProcDtlTable').DataTable().ajax.reload();
						$('#checkAll').prop('checked',false);
						$('input[name=check]').prop('checked',false);
						
						toastr.success("저장 되었습니다.");
					}else{
						toastr.error(res.message);
					}
				}
			});
		}
	});

	
	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		if(e.keyCode == 13){
			$.ajax({
				url : '<c:url value="tm/stockPaymentAdmBarcodeScan"/>',
				type : 'GET',
 				data : {
 					'tmMon' : function(){return serverMonVal;},
					'barcodeNo' : $('#barcodeNo').val(),
					'locationCd' : function(){return locationCdVal;},
					'realQtyOption' : 'Y'
				},
				success : function(res) {		
					if (res.result == 'ok') {
						console.log(res.data)
						console.log(res.data.length)
						if(res.data.length==0) {
							toastr.warning("해당 바코드가 존재하지 않습니다.");
						} else {
							let data = res.data[0];
							let baseData = deliveryOrderAdmTable.row(tableIdx).data();
							if(itemSeqVal==data.itemSeq) {
								$('#deliveryProcDtlTable').DataTable().row.add({
									'contDtlNo' : baseData.contDtlNo,
									'doNo' 	: baseData.doNo,
									'dpNo' 	: '',
									'barcodeNo' : data.barcodeNo,
									'itemCd' 	: data.spCd,
									'itemGubun' 	: data.spType,
									'locationCd' 	: data.locationCd,
									'locationNm': data.locationNm,
									'locationNo' 	: data.locationNo,
									'dpQty' 	: rmDecimal(data.realQty),
								}).draw(false);	
								
								$('input[name=check]').eq((deliveryProcDtlTable.data().count()-1)).prop('checked',true);
								
								toastr.success("추가되었습니다.");
								$('#barcodeNo').val('');
							} else {
								toastr.warning("출고 데이터에 맞지 않는 제품입니다.");	
							}
							
						}
					}else{
						toastr.error(res.message);
					}
				}
			});
			
		}
	});

	//전체 선택 클릭
	$('#checkAll').on('click',function(){
		if($(this).is(':checked')){
			$('input[name=check]').prop('checked',true);
		}else{
			$('input[name=check]').prop('checked',false);
		}
	});
	
	//전체 선택 클릭
	$('#checkAll2').on('click',function(){
		if($(this).is(':checked')){
			$('input[name=popupCheck]').prop('checked',true);
		}else{
			$('input[name=popupCheck]').prop('checked',false);
		}
	});
	

	//숫자만 입력하게 처리itemConsumpt
	$(document).on('keyup',"input[name=dpQty]", function(event){
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}

		if($(this).val()=="") $(this).val("");
		
		$(this).val(addCommas($(this).val().replace(/,/g,'')));
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