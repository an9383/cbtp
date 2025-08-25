<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp"%>
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">스페어관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="list-half col-6" style="width: 53%;height: 100%; min-height: 54.1rem;">
				<div class="card">
					<div class="table-responsive">
						<table id="itemPartAdmTable" class="table table-bordered">
							<colgroup>
								<col width="6%">
								<col width="12%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
							</colgroup>
							
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>구분</th>
									<th>위치정보</th>
									<th>바코드번호</th>
									<th>품명</th>
									<th>규격</th>
									<th class="text-center">현재고</th>
									<th class="text-center">안전재고</th>
									<th>적용설비</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<div class="list-half col-6" id="" style="width: 53%;">
				<div class="card" style="height: 70%;">
					<!-- <div class="card-body p-0">
						<span id="realQty" class="float-right ml-3" style="font-size: 1.3rem;border: solid 1px gray;width: 8.3rem;text-align: right;">0</span>
						<label class="float-right" style="font-size: 1.3rem;font-weight: bold;">현재고</label>
					</div> -->
					<div class="row p-1">
						<label class="input-label-sm">일자</label>
                  		<div class="form-group input-sub m-0 row">
                   			<input class="form-control" type="text" style="width:8.3rem;" id="spaIoDateFrom" name="spaIoDateFrom" disabled>
                   			<button onclick="fnPopUpCalendar(spaIoDateFrom,spaIoDateFrom,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="spaIoDateFromCalendar" type="button">
                    			<span class="oi oi-calendar"></span>
                   			</button>
               			</div>&nbsp;~&nbsp;
               			<div class="form-group input-sub m-0 row">
                   			<input class="form-control" type="text" style="width:8.3rem;" id="spaIoDateTo" name="spaIoDateTo" disabled>
                   			<button onclick="fnPopUpCalendar(spaIoDateTo,spaIoDateTo,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="spaIoDateToCalendar" type="button">
                    			<span class="oi oi-calendar"></span>
                   			</button>
                  		</div>
                  		<button type="button" class="btn btn-primary float-left ml-1" id="btnRetv">조회</button>
                  		<!-- <button type="button" class="btn btn-primary float-left ml-1" id="btnSave">저장</button> -->
                  		<button type="button" class="btn btn-danger float-left ml-1" id="btnDel">삭제</button>
                  		<label class="float-right" style="font-weight: bold;margin-left: 11rem;">현재고</label>
                  		<input type="text" id="realQty" class="form-control float-right ml-3" style="border: solid 1px gray;text-align: right;width: 8.3rem;" value="0" readonly>
                  	</div>
					<div class="table-responsive">
						<table id="spareInOutWhsAdmList" class="table table-bordered" style="width:100%;">
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="25%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th><input type="checkbox" class="form-control" id="checkAll" name="checkAll"></th>
									<th>일자</th>
									<th>구분(입고/출고)</th>
									<th class="text-center">수량</th>
									<th>공급사</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<div class="card" style="height: 70%;">
					<div class="card-body col-sm-12 p-1">
	                    <div class="input-sub float-left mr-1">
	                  		<div class="form-group input-sub m-0 row">
	                  			<label class="input-label-sm">입고일자</label>
	                   			<input class="form-control" type="text" style="width:8.3rem;" id="spaInDate" name="spaInDate" disabled>
	                   			<button onclick="fnPopUpCalendar(spaInDate,spaInDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="spaInDateCalendar" type="button">
	                    			<span class="oi oi-calendar"></span>
	                   			</button>
	                  		</div>
	                  	</div>
	                  	<button type="button" class="btn btn-primary float-left mr-1" id="btnBatchApplyIn">일괄적용</button>
	                  	<button type="button" class="btn btn-danger float-left mr-1" id="btnDelIn">삭제</button>
	                  	<button type="button" class="btn btn-success float-left mr-1" id="btnSpaInSave">입고</button>
	                  	<input type="text" class="form-control float-right mr-1" id="btnSpaInBarcodeScan" style="text-align: center;" placeholder="바코드 스캔">
						<label class="input-label-sm float-right">바코드 스캔</label>
					</div>
					<div class="table-responsive">
						<table id="spareInList" class="table table-bordered" style="width:100%;">
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="25%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th><input type="checkbox" class="form-control" id="checkAllIn" name="checkAllIn"></th>
									<th>입고일자</th>
									<th>품번</th>
									<th>품명</th>
									<th>입고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="card" style="height: 70%;">
					<div class="card-body col-sm-12 p-1">
	                    <div class="input-sub float-left mr-1">
	                  		<div class="form-group input-sub m-0 row">
	                  			<label class="input-label-sm">출고일자</label>
	                   			<input class="form-control" type="text" style="width:8.3rem;" id="spaOutDate" name="spaOutDate" disabled>
	                   			<button onclick="fnPopUpCalendar(spaOutDate,spaOutDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="spaOutDateCalendar" type="button">
	                    			<span class="oi oi-calendar"></span>
	                   			</button>
	                  		</div>
	                  	</div>
	                  	<button type="button" class="btn btn-primary float-left mr-1" id="btnBatchApplyOut">일괄적용</button>
	                  	<button type="button" class="btn btn-danger float-left mr-1" id="btnDelOut">삭제</button>
	                  	<button type="button" class="btn btn-success float-left mr-1" id="btnSpaOutSave">출고</button>
	                  	
	                  	<input type="text" class="form-control float-right mr-1" id="btnSpaOutBarcodeScan" style="text-align: center;" placeholder="바코드 스캔">
						<label class="input-label-sm float-right">바코드 스캔</label>
					</div>
					<div class="table-responsive">
						<table id="spareOutList" class="table table-bordered" style="width:100%;">
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="25%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th><input type="checkbox" class="form-control" id="checkAllOut" name="checkAllOut"></th>
									<th>출고일자</th>
									<th>품번</th>
									<th>품명</th>
									<th>출고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "53%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});
	
	let currentHref = "posc0030";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","스페어관리"); 

	$(document).ready(function() {
		$('body').css('font-size','0.9rem');
		$('input').css('font-size','0.9rem');
		$('select').css('font-size','0.9rem');
		$('th').css('vertical-align','middle')
				.css('background-color','#f6f7f9')
				.css('text-align','center')
				.css('width','100px');
		$('button').css('font-size','0.9rem');
	}); 

	let sideView = 'add';
	var activeTab = '기본정보';
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";

	let itemSeqVal = null;
	let itemSeqRow = null;
	let itemCdVal = null;
	let itemNmVal = null;
	let spaBarcodeVal = null;
	let barcodeData = null;
	let barcodeNoVal = null;
	var urlData = null;
	var itemCdArr = [];

	let spaIoNoVal = null;
	let spaIoSeqVal = null;
	let sideView2 = null;
	let tableIdx2 = null;
	
	var mainGubunList = '';

	var startDateVal = serverDateFrom;
	var endDateVal = serverDateTo;

	//일자
	$('#spaIoDateFrom').val(serverDateFrom);
	$('#spaIoDateTo').val(serverDateTo);
	$('#spaInDate').val(serverDate);
	$('#spaOutDate').val(serverDate);
	
	

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	//공통코드 처리 시작
	var itemUnit = new Array();
	<c:forEach items="${itemUnit}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemUnit.push(json);
	</c:forEach>

	var mainGubun = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubun.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	selectBoxAppend(itemUnit, "itemUnit", "", "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#tab1Nav').tab('show');
		$('#btnSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		$('#mainGubun2').attr('disabled', false);
	});
	
	//기본정보 탭
	$('#tab1Nav').on('click', function() {
		uiProc(true);
		$('#mainGubun2').attr('disabled', false);
		$('#itemGubun2').attr('disabled', false);
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
	});

	//스페어사진 탭
	$('#tab2Nav').on('click', function() {
		imgPrint();
	});
	
	//관련자료 탭
	$('#tab3Nav').on('click', function() {
		$('#btnAttachAdd').removeClass('d-none');
		$('#btnAttachDel').removeClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#itemPartAttachDataTable').DataTable().ajax.reload();
	});

	// 목록
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/po/spareItemInfoList"/>',
			type : 'GET',
			data : {
			},
		},
		rowId : 'itemCd',
		columns : [
			{
				data : 'mainGubun',
				'className' : 'text-center'
			},	
			{
				data : 'spaWhse',
				'className' : 'text-center'
			}, 
			{
				data : 'spaBarcode',
				'className' : 'text-center'
			}, 
			{
				data : 'itemNm',
				'className' : 'text-center'
			}, 
			{
				data : 'spaSpec',
				'className' : 'text-center'
			}, 
			{
				data : 'realQty',
				render : function(data, type, row, meta) {
					return rmDecimal(data);
				},
				'className' : 'text-right'
			}, 
			{
				data : 'spaSafyStock',
				render : function(data, type, row, meta) {
					return rmDecimal(data);
				},
				'className' : 'text-right'
			}, 
			{
				data : 'spaEquip',
				'className' : 'text-center'
			}, 
		],
		order : [ [ 1, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		createdRow : function(row,data,dataIndex){
			
			 $.ajax({
				url : '<c:url value="po/getTmQtyRead"/>',
				type : 'GET',
				data : {
					'itemSeq' : function(){return data.itemSeq}
				},
				success : function(res){
					if(res.data!=null){

						var safyQty = parseInt(data.spaSafyStock);
						var realQty = parseInt(res.data.realQty);
						
						if(safyQty>realQty){
							$(row).css('background','red');
						}else{
							$(row).css('background','');
						}
					}
				}
			}); 
		}
	});

	// 보기
	$('#itemPartAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnAttachSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#tab1Nav').tab('show');

		if ($(this).hasClass('selected')) {
		} else {
			$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		itemSeqRow = itemPartAdmTable.row(this).data().itemSeq;
		$('#spareInOutWhsAdmList').DataTable().ajax.reload();
		setTimeout(function(){
			spareInOutWhsAdmList.draw();
		},100)


		realQtyGet(itemSeqRow);	//현재고
	});


	var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="mainGubun2" onChange="mainOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';

	$('#itemPartAdmTable_length').html(html1);
	
	selectBoxAppend(mainGubun, "mainGubun2", "", "1");

	function mainOnchange(){
		mainGubunList = $("#mainGubun2 option:selected").val();
		$("#mainGubun").val(mainGubunList).prop("selected", true);
		$('#itemPartAdmTable').DataTable().ajax.reload();
		
	}


	// 입출고 목록조회
	let spareInOutWhsAdmList = $('#spareInOutWhsAdmList').DataTable({
		dom : "<'row'<'col-sm-12'tr>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000000,
		//scrollY: "10.4rem",
		scrollY: "9rem",
		scrollX: true, 
		scrollCollapse: true, 
		ajax : {
			url : '<c:url value="po/spareInOutWhsList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return startDateVal.replace(/-/g,'');},
				'endDate' : function(){return endDateVal.replace(/-/g,'');},
				'itemSeq' : function(){return itemSeqRow},
			},
		},
		rowId : '',
		columns : [
			{
				render : function(data, type, row, meta) {
					return '<input type="checkbox" class="form-control" name="checkTop"/>';
				},
			}, 
			{
				data : 'spaIoDate',
				render : function(data, type, row, meta) {
					return '<input type="date" class="form-control" name="spaIoDate" value="'+moment(data).format('YYYY-MM-DD')+'" style="text-align:center;max-width:100%;font-size: 15px;border:none;background:white;" disabled/>';
				},
				'className' : 'text-center'
			}, 
			{
				data : 'spaIoGubun',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return '입고';
					}else{
						return '출고';
					}
					
				},
				'className' : 'text-center'
			}, 
			{
				data : 'spaIoQty',
				render : function(data, type, row, meta) {
					return '<input type="text" class="form-control" name="spaIoQty" value="'+rmDecimal(data)+'" style="text-align:center;max-width:100%;font-size: 15px;border:none;background:white;" disabled/>';
				},
				'className' : 'text-right'
			}, 
			{
				data : 'itemCus',
				'className' : 'text-center'
			}, 
		],
		buttons : [ 'copy', 'excel', 'print' ],
	});



	// 보기
	$('#spareInOutWhsAdmList tbody').on('click','tr',function() {

		/* if ($(this).hasClass('selected')) {
		} else {
			$('#spareInOutWhsAdmList').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		} */
		
		tableIdx2 = $('#spareInOutWhsAdmList').DataTable().row(this).index()
		spaIoNoVal = spareInOutWhsAdmList.row(this).data().spaIoNo;
		spaIoSeqVal = spareInOutWhsAdmList.row(this).data().spaIoSeq;

		sideView2 = 'edit';
	});

	
	
	//입출고내역 조회버튼 클릭시
	$('#btnRetv').on('click',function(){
		startDateVal = $('#spaIoDateFrom').val();
		endDateVal = $('#spaIoDateTo').val();
		$('#spareInOutWhsAdmList').DataTable().ajax.reload();
		setTimeout(function(){
			spareInOutWhsAdmList.draw();
		},100)
	});



	//삭제버튼 클릭시
	$('#btnDel').on('click',function(){

		if($('input[name=checkTop]').is(':checked')){
			$('#deleteSmallModal').modal('show');
		}else{
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
	});


	//삭제처리
	$('#btnDeleteY').on('click',function(){
		console.log('dd');
		$('#spareInOutWhsAdmList tbody tr').each(function(index,item){
			if($(this).find('input[name=checkTop]').is(':checked')){
				
				spaIoNoVal = spareInOutWhsAdmList.row(index).data().spaIoNo;
				spaIoSeqVal = spareInOutWhsAdmList.row(index).data().spaIoSeq;
				
				$.ajax({
					url : '<c:url value="po/spareInOutWhsDelete" />',
					type : 'POST',
					data : {
						'spaIoNo' : function(){return spaIoNoVal},
						'spaIoSeq' : function(){return spaIoSeqVal},
					},
					success : function(res){
						if(res.result=="error"){
							toastr.error(res.message);
						}
					}
				});
			}
		});

		setTimeout(function(){
			$('#deleteSmallModal').modal('hide');
			$('#spareInOutWhsAdmList').DataTable().ajax.reload(function(){});
			setTimeout(function(){spareInOutWhsAdmList.draw();},150)
			toastr.success("삭제되었습니다.");
			realQtyGet(itemSeqRow);
		},150)
		
	})
	

	// 입고등록
	let spareInList = $('#spareInList').DataTable({
		dom : "<'row'<'col-sm-12'tr>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000000,
		//scrollY: "10.4rem",
		scrollY: "9rem",
		scrollX: true, 
		scrollCollapse: true, 
		ajax : {
			url : '<c:url value="po/spareInOutWhsList"/>',
			type : 'GET',
			data : {
			},
		},
		rowId : '',
		columns : [
			{
				render : function(data, type, row, meta) {
					return '<input type="checkbox" class="form-control" name="check"/>';
				},
			}, 
			{
				data : 'spaIoDate',
				render : function(data, type, row, meta) {
					return '<input type="date" class="form-control" name="spaIoDate" value="'+serverDate+'" />';
				},
				'className' : 'text-center'
			}, 
			{
				data : 'itemCd',
				render : function(data, type, row, meta) {
					var html = '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'"/>';
					html += '<input type="hidden" name="barcodeNo" value="'+row['barcodeNo']+'"/>';
					html += '<input type="text" class="form-control" name="itemCd" value="'+data+'" style="text-align:center;" disabled/>';
					
					return html;
				},
				'className' : 'text-center'
			}, 
			{
				data : 'itemNm',
				render : function(data, type, row, meta) {
					return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="text-align:center;" disabled/>';
				},
				'className' : 'text-center'
			}, 
			{
				data : 'spaIoQty',
				render : function(data, type, row, meta) {
					return '<input type="text" class="form-control" name="spaIoQty" value="'+data+'" style="text-align:right;"/>';
				},
				'className' : 'text-center'
			}, 
		],
		buttons : [ 'copy', 'excel', 'print' ],
	});


	// 출고등록
	let spareOutList = $('#spareOutList').DataTable({
		dom : "<'row'<'col-sm-12'tr>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 1000000000,
		//scrollY: "10.4rem",
		scrollY: "9rem",
		scrollX: true, 
		scrollCollapse: true, 
		ajax : {
			url : '<c:url value="po/spareInOutWhsList"/>',
			type : 'GET',
			data : {
			},
		},
		rowId : '',
		columns : [
			{
				render : function(data, type, row, meta) {
					return '<input type="checkbox" class="form-control" name="check"/>';
				},
			}, 
			{
				data : 'spaIoDate',
				render : function(data, type, row, meta) {
					return '<input type="date" class="form-control" name="spaIoDate" value="'+serverDate+'" />';
				},
				'className' : 'text-center'
			}, 
			{
				data : 'itemCd',
				render : function(data, type, row, meta) {
					var html = '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'"/>';
					html += '<input type="hidden" name="barcodeNo" value="'+row['barcodeNo']+'"/>';
					html += '<input type="text" class="form-control" name="itemCd" value="'+data+'" style="text-align:center;" disabled/>';
					
					return html;
				},
				'className' : 'text-center'
			}, 
			{
				data : 'itemNm',
				render : function(data, type, row, meta) {
					return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="text-align:center;" disabled/>';
				},
				'className' : 'text-center'
			}, 
			{
				data : 'spaIoQty',
				render : function(data, type, row, meta) {
					return '<input type="text" class="form-control" name="spaIoQty" value="'+data+'" style="text-align:right;"/>';
				},
				'className' : 'text-center'
			}, 
		],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	
	//입/출고 전체선택
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop("checked")){
			$('#spareInOutWhsAdmList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=checkTop]').prop("checked",true);
			});
		}else{
			$('#spareInOutWhsAdmList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=checkTop]').prop("checked",false);
			});
		}
	})


	//입고 전체선택
	$('#checkAllIn').on('click',function(){
		if($('#checkAllIn').prop("checked")){
			$('#spareInList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",true);
			});
		}else{
			$('#spareInList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",false);
			});
		}
	})
	
	//출고 전체선택
	$('#checkAllOut').on('click',function(){
		if($('#checkAllOut').prop("checked")){
			$('#spareOutList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",true);
			});
		}else{
			$('#spareOutList tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",false);
			});
		}
	})
	
	
	//일괄적용 버튼(입고)
	$('#btnBatchApplyIn').on('click',function(){
		let inDate = $('#spaInDate').val();
		
		if($('#spareInList input[name=check]').is(':checked')){
			$('#spareInList tbody tr').each(function(index,item){
				if($(this).find('input[name=check]').is(':checked')){
					$(this).find('input[name=spaIoDate]').val(inDate);
				}
			})
		}else{
			toastr.warning("일괄적용할 항목을 선택해주세요.");
		}
		
	});

	//일괄적용 버튼(출고)
	$('#btnBatchApplyOut').on('click',function(){
		let outDate = $('#spaOutDate').val();
		if($('#spareOutList input[name=check]').is(':checked')){
			$('#spareOutList tbody tr').each(function(index,item){
				if($(this).find('input[name=check]').is(':checked')){
					$(this).find('input[name=spaIoDate]').val(outDate);
				}
			});
		}else{
			toastr.warning("일괄적용할 항목을 선택해주세요.");
		}
	});

	var rowArr = [];
	
	//삭제 버튼(입고)
	$('#btnDelIn').on('click',function(){
		rowArr = [];
		
		if($('#spareInList input[name=check]').is(':checked')){
			$('#spareInList tbody tr').each(function(index,item){
				if($(this).find('td input[name=check]').is(':checked')){
					rowArr.push(index)
				}
			});
		}else{
			toastr.warning("삭제할 항목을 선택해주세요.");
		}

		$('#spareInList').DataTable().rows(rowArr).remove().draw();

	});

	//삭제 버튼(출고)
	$('#btnDelOut').on('click',function(){
		rowArr = [];

		if($('#spareOutList input[name=check]').is(':checked')){
			$('#spareOutList tbody tr').each(function(index,item){
				if($(this).find('td input[name=check]').is(':checked')){
					rowArr.push(index)
				}
			});
		}else{
			toastr.warning("삭제할 항목을 선택해주세요.");
		}

		$('#spareOutList').DataTable().rows(rowArr).remove().draw();
	});
	

	//바코드스캔(입고)
	$('#btnSpaInBarcodeScan').keypress(function (e) {
		if (e.which == 13) {
			if($('#btnSpaInBarcodeScan').val() == "" || $('#btnSpaInBarcodeScan').val() == null) {
				toastr.warning("바코드를 다시 스캔해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#btnSpaInBarcodeScan').select();
				return false;
			}

			barcodeData =  $('#btnSpaInBarcodeScan').val();
			itemInfoRead(barcodeData);

			setTimeout(function(){
				if(itemCdVal!=null && itemCdVal!=""){
					$('#spareInList').DataTable().row.add({
						'barcodeNo' : barcodeNoVal,
						'itemSeq'   : itemSeqVal,
						'itemCd' 	: itemCdVal,
						'itemNm' 	: itemNmVal,
						'spaIoQty' 	: '1',
					}).draw(false);	
				}

				
				
				
				//$('input').css('font-size','120%').css('height','2rem');
			},150);

			$('#btnSpaInBarcodeScan').select();
		}
		
		
	});


	//바코드스캔(출고)
	$('#btnSpaOutBarcodeScan').keypress(function (e) {
		if (e.which == 13) {
			if($('#btnSpaOutBarcodeScan').val() == "" || $('#btnSpaOutBarcodeScan').val() == null) {
				toastr.warning("바코드를 다시 스캔해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#btnSpaOutBarcodeScan').select();
				return false;
			}

			barcodeData =  $('#btnSpaOutBarcodeScan').val();
			itemInfoRead(barcodeData);

			setTimeout(function(){
				if(itemCdVal!=null && itemCdVal!=""){
					$('#spareOutList').DataTable().row.add({
						'barcodeNo' : barcodeNoVal,
						'itemSeq'   : itemSeqVal,
						'itemCd' 	: itemCdVal,
						'itemNm' 	: itemNmVal,
						'spaIoQty' 	: '1',
					}).draw(false);	
				}
				//$('input').css('font-size','120%').css('height','2rem');
			},150);

			$('#btnSpaOutBarcodeScan').select();
		}
		
	});


	//바코드 스캔
	function itemInfoRead(data){
		spaBarcodeVal = data;
		$.ajax({
			url : '<c:url value="bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubun' : '005',
				'spaBarcode' : function(){return spaBarcodeVal}
			},
			success : function(res){
				var data = res.data;
				if(data[0]!=null){
					barcodeNoVal = data[0].spaBarcode;
					itemSeqVal = data[0].itemSeq;
					itemCdVal = data[0].itemCd;
					itemNmVal = data[0].itemNm;
				}else{
					barcodeNoVal = "";
					itemSeqVal = "";
					itemCdVal = "";
					itemNmVal = "";
				}
			}
		});
	}

	
	function realQtyGet(data){
	    let	seqData = data;
		$.ajax({
			url : '<c:url value="po/getTmQtyRead"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return seqData}
			},
			success : function(res){
				var data = res.data;
				if(data!=null){
					$('#realQty').val(rmDecimal(data.realQty));
				}else{
					$('#realQty').val("0");
				}
			}
		});
	}


	//입고버튼 클릭시
	$('#btnSpaInSave').on('click',function(){
		var dataArray = new Array();
		var check=true;

		//예외처리
		if(spareInList.data().count()==0){
			toastr.warning("입고할 바코드를 스캔해주세요.");
			check = false;
			return false;
		}
		
		$('#spareInList tbody tr').each(function(index,item){

			if ($(this).find('td input[name=spaIoQty]').val()=='') {
				toastr.warning('입고수량을 입력헤 주세요.');
				$(this).find('td input[name=spaIoQty]').focus();
				check=false;
				return false;
			} 
			
			var rowData = new Object();
			rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.spaIoGubun = "001";
			rowData.spaIoDate = $(this).find('td input[name=spaIoDate]').val().replace(/-/g,'');
			rowData.spaIoQty = $(this).find('td input[name=spaIoQty]').val().replace(/,/g,'');
	        dataArray.push(rowData);
	        console.log(rowData);
		});

		if(check){
			$.ajax({
				url :'<c:url value="po/spareInOutWhsCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if(res.result=="ok"){
						toastr.success("입고 등록되었습니다.");
						$('#spareInList').DataTable().clear().draw();
						$('#spareInOutWhsAdmList').DataTable().ajax.reload();
						setTimeout(function(){
							spareInOutWhsAdmList.draw();
						},100)
						$('#checkAllIn').prop('checked',false);
						$('#btn paInBarcodeScan').val('');
						realQtyGet(itemSeqRow);
					}else{
						toastr.error(res.message);
					}
				}
			});
		}
	});


	
	//출고버튼 클릭시
	$('#btnSpaOutSave').on('click',function(){
		var dataArray = new Array();
		var check=true;

		//예외처리
		if(spareOutList.data().count()==0){
			toastr.warning("출고할 바코드를 스캔해주세요.");
			check = false;
			return false;
		}
		
		$('#spareOutList tbody tr').each(function(index,item){

			if ($(this).find('td input[name=spaIoQty]').val()=='') {
				toastr.warning('출고수량을 입력헤 주세요.');
				$(this).find('td input[name=spaIoQty]').focus();
				check=false;
				return false;
			} 
			
			var rowData = new Object();
			rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.spaIoGubun = "002";
			rowData.spaIoDate = $(this).find('td input[name=spaIoDate]').val().replace(/-/g,'');
			rowData.spaIoQty = $(this).find('td input[name=spaIoQty]').val().replace(/,/g,'');;
	        dataArray.push(rowData);
	        console.log(rowData);
		});

		if(check){
			$.ajax({
				url :'<c:url value="po/spareInOutWhsCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if(res.result=="ok"){
						toastr.success("출고 등록되었습니다.");
						$('#spareOutList').DataTable().clear().draw();
						$('#spareInOutWhsAdmList').DataTable().ajax.reload();
						setTimeout(function(){
							spareInOutWhsAdmList.draw();
						},100)
						$('#checkAllOut').prop('checked',false);
						$('#btnSpaOutBarcodeScan').val('');

						realQtyGet(itemSeqRow);
					}else{
						toastr.error(res.message);
					}
				}
			});
		}
	});
	


	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=spaIoQty]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(rmDecimal(uncomma($(this).val())));
	});



</script>
</body>
</html>
