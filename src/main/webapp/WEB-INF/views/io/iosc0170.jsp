<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">요청출고</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<!-- .table-responsive -->
				<div class="table-responsive">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<table id="partReqTable" class="table table-bordered">
						<colgroup>
							<col width="7%">
							<col width="3%">
							<col width="7%">
							<col width="4%">
							<col width="7%">
							<col width="4%">
							<col width="15%">
							<col width="3%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="4%">
							<col width="7%">
							<col width="4%">
							<col width="17%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>요청번호</th>
								<th>시퀀스</th>
								<th>요청자</th>
								<th>구분</th>
								<th>CODE</th>
								<th>REV</th>
								<th>ITEM</th>
								<th>단위</th>
								<th class="text-center">요청수량</th>
								<th class="text-center">출고량</th>
								<th class="text-center">미출고량</th>
								<th>긴급여부</th>
								<th>출고예정일</th>
								<th>요청상태</th>
								<th>사유</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix" id="rfSidenav" style="width: 43%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
							<i class="mdi mdi-close"></i></a>
					</div>
				</div>
				<!--/오른쪽 등록 부분 상단 버튼 영역-->
				<form id="form">
					<div class="table-responsive">
						<table class="table table-sm table-bordered mb-2"
							id="bizOrderOutDtlTable">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tr>
								<th>출고일</th>
								<td>
									<div class="form-group input-sub m-0 row">
										<input class="form-control" type="date" id="preOutWhsDate" name="preOutWhsDate" style="max-width: 100%" disabled />
<!-- 										<button -->
<!-- 											onclick="fnPopUpCalendar(shipReqDate,shipReqDate,'yyyy-mm-dd')" -->
<!-- 											class="btn btn-secondary input-sub-search" -->
<!-- 											name="shipReqDateCalendar" type="button" disabled> -->
<!-- 											<span class="oi oi-calendar"></span> -->
<!-- 										</button> -->
									</div>
								</td>
								<th>담당</th>
								<td>
									<div class="input-sub m-0" style="max-width: 100%">
										<input type="hidden" class="form-control" style="max-width: 100%" id="preWorkCharger" name="preWorkCharger" disabled> 
										<input type="text"class="form-control" style="max-width: 100%" id="preWorkChargerNm" name="preWorkChargerNm" disabled>
										<button type="button" class="btn btn-primary input-sub-search" id="btnPreWorkCharger" onClick="selectPartReqChargr();" disabled>
											<span class="oi oi-magnifying-glass"></span>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th>창고</th>
								<td>
									<input type="text"style="max-width: 100%; text-align:center;" class="form-control" value="재공창고" disabled>
									<input type="hidden"style="max-width: 100%;" class="form-control" id="locationNo" value="20210825-001">
									<input type="hidden"style="max-width: 100%;" class="form-control" id="locationCd" value="003">
									<input type="hidden"style="max-width: 100%;" class="form-control" id="areaCd" value="001">
									<input type="hidden"style="max-width: 100%;" class="form-control" id="floorCd" value="재공창고">
								</td>
								<th>요청번호</th>
								<td><input class="form-control" type="text" id="partReqNo" name="partReqNo" style="max-width: 100%; text-align:center;" disabled /></td>
							</tr>
							<tr>
								<th>요청자</th>
								<td>
									<input type="text"style="max-width: 100%; text-align:center;" class="form-control" id="partReqChargr" name="partReqChargr" disabled>
								</td>
								<th>출고예정일</th>
								<td><input class="form-control" type="text" id="outReqDate" name="outReqDate" style="max-width: 100%; text-align:center;" disabled /></td>
							</tr>
								<tr>
								<th>요청수량</th>
								<td>
									<input type="text" class="form-control" id="reqQty" name="reqQty" style="max-width: 100%; text-align:right;" disabled>
								</td>
								<th>미출고수량</th>
								<td><input class="form-control" type="text" id="unPreOutQty" name="unPreOutQty" style="max-width: 100%; text-align:right;" disabled /></td>
							</tr>
							<tr>
								<th>사유</th>
								<td colspan="3"><input class="form-control" type="text" 
									style="max-width: 100%;" id="reqReason" name="reqReason" disabled></td>
							</tr>
							<tr>
								<th>바코드</th>
								<td colspan="3"><input class="form-control" type="text" 
									style="max-width: 100%;" id="barcodeNo" name="barcodeNo" placeholder="스캐너만 입력" autocomplete="off" disabled></td>
							</tr>
							<tr>
								<th>비고</th>
								<td colspan="3"><input class="form-control" type="text" 
									style="max-width: 100%;" id="inWhsDesc" name="inWhsDesc" disabled></td>
							</tr>
						</table>
					</div>
				</form>
				<div class="card-body col-sm-12 p-2">
					<button type="button" class="btn btn-primary float-right mr-1" id="btnSave" disabled>저장</button>
					<button type="button" class="btn btn-warning float-right mr-1" id="btnDel" disabled>삭제</button>
					<button class="btn btn-primary d-none" id="btnDelConfirmLoading" type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
					</button>
				</div>
				<div class="table-responsive">
					<table id="barcodeDtlTable" class="table table-bordered">
						<colgroup>
							<col width="22%">
							<col width="14%">
							<col width="18%">
							<col width="6%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>바코드</th>
								<th>CODE</th>
								<th>ITEM</th>
								<th>단위</th>
								<th>남은 출고량</th>
								<th>출고량</th>
								<th>창고</th>
								<th>구역/위치</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "iosc0170";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","요청출고"); 
	let viewIdx;
	let sideView = 'add';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";

	$('#saveBtnModalY').on('click', function(){
		uiProc(true);
		$('#btnSave').attr('disabled', true);
    	barcodeDtlTable.clear().draw();
		$('#form').each(function() {
			this.reset();
		});
		$('#partReqTable').DataTable().$('tr.selected').removeClass('selected');
		$('#partReqTable').DataTable().ajax.reload(function(){});
	});

	var userNm = "${userNm}";
	var userNumber = "${userNumber}";
	
	var partReqNo='';
	var partReqSeq='';
	var partCd='';
	var workOrdNo='';
	var partReqGubun='';
	var reqStatus='';
	var reqQty='';
	var preOutQty='';
	var remnantQty='';	//요청 수량 - 출고 수량(남은 수량)
	
	var barcodeNo='';
	var partCd='';
	var partRev='';
	var partUnitNm='';
	var remainQty='';
	var preOutQty='';
	var poNo='';
	var poSeq='';
	var inSeq='';
	var partNm='';
	var reqStatusVal = '001';

	uiProc(true);
	

	// 부품요청 목록 조회
	let partReqTable = $('#partReqTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/partReqDtlOutList"/>',
			type : 'GET',
			data : {
				'startDate'	 	: function(){return serverDateFrom.replace(/-/g,'');},
				'endDate'	 	: function(){return serverDateTo.replace(/-/g,'')+1;},
				'approvalCd' 	: '001',
				'reqStatus' 	:  function(){return reqStatusVal;},
			},
		},
		rowId : 'partReqKey',
		columns : [
			{ data : 'partReqNo'		},	//요청번호
			{ data : 'partReqSeq'		},	//시퀀스
			{ data : 'partReqChargrNm'		},	//요청자
			{ data : 'partReqGubun',
				render : function(data, type, row, meta){
					if(data==001){
						return "작지"
					}else{
						return "일반" 
					}
				}
			},	
			{ data : 'partCd'			},	//CODE
			{ data : 'partRev'			},	//REV
			{ data : 'partNm'			},	//ITEM
			{ data : 'partUnitNm'		},	//단위
			{ data : 'reqQty'			},	//요청수량
			{ data : 'reqOutQty'		,
				render : function(data, type, row, meta){
					if(data!=null){
						return data;
					}else{
						return '0';
					}
				}
			},	//출고량
			{ data : 'unPreOutQty',},		//미출고량
			{ data : 'emerYnNm'			},	//긴급여부
			{ data : 'outReqDate',
				render : function(data, type, row, meta){
					return moment(data).format('YYYY-MM-DD');
				}
			},	//출고 예정일
			{ data : 'reqStatus',
				render : function(data, type, row, meta){
					if(data=="001"){
						return '대기';
					}else if(data=="002"){
						return '진행';
					}else if(data=="003"){
						return '완료';
					}
				}
			},
			{ data : 'reqReason'		},	//사유
		],
		order : [ [ 0, 'desc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs : [ 
			{targets : [8,9,10],render : $.fn.dataTable.render.number(','),className : 'text-right'} 
		],
		drawCallback: function() {
		    var api = this.api();
		    for(var i=0;i<api.data().count();i++) {
			    if(api.row(i).data().emerYn == "001" && api.row(i).data().reqStatus == "001"){
			    	$('#'+api.row(i).data().partReqKey).addClass('bg-warning');
				}else{
					$('#'+api.row(i).data().partReqKey).removeClass('bg-warning');
				}
			}
		}
	});

	//요청출고 상세보기 클릭 시
	$('#partReqTable tbody').on('click', 'tr', function() {
		console.log('요청출고 테이블이 클릭 됐어');

		if ($('#btnSave').attr('disabled') != 'disabled') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if (!$(this).hasClass('selected')) {
			$('#partReqTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		partReqNo = partReqTable.row(this).data().partReqNo;		//요청번호
		partReqSeq = partReqTable.row(this).data().partReqSeq;		//시퀀스
		partCd = partReqTable.row(this).data().partCd;				//CODE
		workOrdNo = partReqTable.row(this).data().workOrdNo;		//작지번호
		partReqGubun = partReqTable.row(this).data().partReqGubun;	//001작지(요청상태)
		reqStatus = partReqTable.row(this).data().reqStatus;		//002완료(구분자)
		partReqChargr = partReqTable.row(this).data().partReqChargrNm;	//요청자 
		outReqDate = moment(partReqTable.row(this).data().outReqDate).format('YYYY-MM-DD');		//출고예정일 
		reqQty = partReqTable.row(this).data().reqQty;				//요청수량 
		reqOutQty = partReqTable.row(this).data().reqOutQty;				//요청수량 
		reqReason = partReqTable.row(this).data().reqReason;	//사유 

		//출고수량
		/* if(partReqTable.row(this).data().preOutQty == null){
			preOutQty=0;
		}else{
			preOutQty = partReqTable.row(this).data().preOutQty;		
		}
		console.log(preOutQty);

		remnantQty = reqQty - preOutQty;
		console.log("remnantQty>>>>>>>>>>>> " +remnantQty);  */

		$('#btnSave').attr('disabled', true);
		
		//구분자가 완료가 아닐때
		if(reqStatus != 003){
			$('#partReqNo').val(partReqNo);
			$('#preOutWhsDate').val(moment().format('YYYY-MM-DD'));
			$('#preWorkCharger').val(userNumber);
			$('#preWorkChargerNm').val(userNm);

			$('#partReqChargr').val(partReqChargr);
			$('#outReqDate').val(outReqDate);

			$('#reqQty').val(addCommas(reqQty));
			$('#unPreOutQty').val(parseInt(reqQty)-parseInt(reqOutQty));
			$('#reqReason').val(reqReason);
			uiProc(false);
		}else{
			uiProc(true);
		}
	});


	//요청출고 바코드 입력  조회
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		dom : "<'row'<'col-sm-12'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="io/partReqBarcodeList"/>',
			type : 'GET',
			data : {
				 'partReqNo' : function(){return $('#partReqNo').val();}
			},
		},
		rowId : 'idx',
		columns : [
			
			{ data: 'barcodeNo',
				render : function(data, type, row, meta) {
					if(data != ''){
						var html1='<td><input type="hidden" class="form-control text-center" name="poNo" value="'+poNo+'" disabled></td>';
						html1+='<td><input type="hidden" class="form-control text-center" name="poSeq" value="'+poSeq+'" disabled></td>';
						html1+='<td><input type="hidden" class="form-control text-center" name="inSeq" value="'+inSeq+'" disabled></td>';
						html1+='<td><input type="text" class="form-control text-center" name="barcodeNo" value="'+barcodeNo+'" disabled></td>';
						return html1;
					}else{
						return '<td><input type="text" class="form-control text-center" name="barcodeNo" value="'+data+'" disabled></td>';
					}
				}
			},
			{ data: 'partCd',
				render : function(data, type, row, meta) {
					if(data != ''){
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+partCd+'" disabled>';	
						html += '<input type="hidden" name="partRev" value="'+partRev+'">';
						html += '<input type="hidden" name="partGubun" value="'+partGubun+'">';
						return html;
						
					} else{
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="partRev" value="'+row['partRev']+'">';
						html += '<input type="hidden" name="partGubun" value="'+row['partGubun']+'">';
						return html;
					}		    		
				}
			},
			{ data: 'partNm',
				render : function(data, type, row, meta) {
					if(data != ''){
						return '<td><input type="text" class="form-control text-center" name="partNm" value="'+partNm+'" disabled></td>';
					}else{
						return '<td><input type="text" class="form-control text-center" name="partNm" value="'+data+'" disabled></td>';
					}
				}
			},
			{ data: 'partUnit',
				render : function(data, type, row, meta) {
					if(data != ''){
						return '<td><input type="text" class="form-control text-center" name="partUnitNm" value="'+partUnitNm+'" disabled></td>';
					}else{
						return '<td><input type="text" class="form-control text-center" name="partUnitNm" value="'+data+'" disabled></td>';
					}
				}
			},
			{ name: 'remainQty',
				render : function(data, type, row, meta) {
					if(data != ''){
						return '<td><input type="text" class="form-control text-right" name="remainQty" value="'+remainQty+'" disabled></td>';
					}else{
						return '<td><input type="text" class="form-control text-right" name="" value="'+data+'" disabled></td>';
					}
				}
			},
			{ data: 'preOutQty',
				render : function(data, type, row, meta) {
					if(data != ''){
						return '<td><input type="text" class="form-control text-right number-float0" name="preOutQty" value="" autocomplete="off"></td>';
					}else{
						return '<td><input type="text" class="form-control text-right number-float0" name="preOutQty" value="'+data+'" autocomplete="off" disabled></td>';
					}
				}
			},
			{data : 'locationCd',
				render: function(data, type, row, meta) {
					var html;
					
					if(data!=null){
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="'+row['locationNm']+'" disabled>';
						html += '<input type="hidden" name="locationCd" value="'+data+'" disabled>';

						return html;
					} else{
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="'+locationNm+'" disabled>';
						html += '<input type="hidden" name="locationCd" value="'+locationCd+'" disabled>';
						html += '<input type="hidden" name="locationNo" value="'+locationNo+'" disabled>';
						return html;
					}
	    		}
			},
			{data : 'areaCd',
				render: function(data, type, row, meta) {
					var html;
					if(data!=null){
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="areaNm" value="'+row['areaNm']+'" disabled>';
						html += '<input type="hidden" name="areaCd" value="'+data+'" disabled>';

						return html;
					} else{
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="areaNm" value="'+areaNm+'" disabled>';
						html += '<input type="hidden" name="areaCd" value="'+areaCd+'" disabled>';
						html += '<input type="hidden" name="floorCd" value="'+floorCd+'" disabled>';

						return 	html;		
					}
					
	    		}
			},
		],
		columnDefs : [
			 {  targets : [0], className: 'text-center-td' }
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});

	//요청출고 바코드 목록 클릭 시
	$('#barcodeDtlTable tbody').on('click', 'tr', function(){
		if($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	$('#btnDel').on('click', function(){
		if ($('#barcodeDtlTable  tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 목록을 선택해 주세요");
			return false;
		}
		
		barcodeDtlTable.row('.selected').remove().draw();
	});

	
	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check = true;
		
		if(e.keyCode == 13){
			
			if(!$.trim($('#partReqNo').val())){
				toastr.warning('요청출고를 선택해주세요.');
				check=false;
				return false;
			}
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').val().select();
				check=false;
				return false;
			}
			if(partCd != $('#barcodeNo').val().substring($('#barcodeNo').val().length-11,0)){
				console.log($('#barcodeNo').val().substring($('#barcodeNo').val().length-11,0));
				toastr.warning('해당하지 않은 바코드 입니다.');
				$('#barcodeNo').focus();
				check=false;
				return false;
			}
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').focus();
					check=false;
					return false;
				}
			});

			if(check==true){
				console.log('통과');
				
				$.ajax({
					url : '<c:url value="io/barcodeCommonList"/>',
					type : 'GET',
					data : {
						'barcodeNo' : function(){return $('#barcodeNo').val();},
					},
					success : function(res) {
						let data = res.data;
						console.log(data)
						if (res.result == 'ok') {
							toastr.success('추가 되었습니다.');

							poNo = data.poNo;
							poSeq = data.poSeq;
							inSeq = data.inSeq;
							
							barcodeNo = data.barcodeNo;
							partCd = data.partCd;
							partNm = data.partNm;
							partRev = data.partRev;
							partUnitNm = data.partUnit;
							partGubun = data.partGubun;
							remainQty = data.remainQty;
							locationNo= data.locationNo;
			                locationCd = data.locationCd;
			                locationNm = data.locationNm;
			                areaCd = data.areaCd;
			                floorCd = data.floorCd;
			                areaNm = data.areaNm+" / "+data.floorCd;
			                
							$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
							$('#btnSave').attr('disabled',false);
						} else {
							
							if(res.result == 'empty') {
		                    	toastr.warning("등록된 바코드가 아닙니다. 확인해주세요.");
		                    }else if(res.result == 'notInWhs') {
		                    	toastr.warning("입고된 바코드가 아닙니다. 확인해주세요.");  //현재까지 입고만 예외처리함
		                    }else if(res.result == 'notRemainQty') {
		                    	toastr.warning("남은 수량이 없는 바코드입니다. 확인해주세요.");
		                    }else if(res.result == 'already') {
		                    	toastr.warning("이미 생산 투입된 바코드입니다. 확인해주세요.");
		                    }/* else if(res.result == 'notCommonGubun') {
		                    	toastr.warning("공통부품 바코드가 이닙니다. 자채출고(작업지시)에서 출고해주세요.");
		                    } */else if(res.result == 'error') {
		                    	toastr.error(res.message, '', {timeOut: 5000});
		                    }
		                    
						 	$('#barcodeNo').select();
						}
					}
				});
				
			}
		}
	});

	//출고량 숫자만 입력하게 처리
	$(document).on('keyup',"input[name=preOutQty]", function(event){
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
		$(this).val(addCommas(uncomma($(this).val())));
	});


	//저장버튼 클릭 시
	$('#btnSave').on('click', function(){
		console.log('저장버튼이 클릭 됐어.');

		if(!$.trim($('#preOutWhsDate').val())){
			toastr.warning('출고일을 선택해주세요.');
			$('#preOutWhsDate').focus();
			return false;
		}
		if(!$.trim($('#preWorkChargerNm').val())){
			toastr.warning('담당자를 선택해주세요.');
			$('#btnPreWorkCharger').focus();
			return false;
		}
		
		var totalQty = 0;
		for(var i=0; i<$('#barcodeDtlTable tbody tr').length; i++){
			var X = parseInt($('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').val());
			
			totalQty=totalQty+parseInt(X);
			if(!$.trim(X)){
				toastr.warning('출고량을 입력해주세요.');
				$('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').focus();
				return false;
			}
			if($('#barcodeDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=remainQty]').val()<X){
				toastr.warning('남은 출고량을 넘게 입력했습니다.');
				$('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').focus();
				return false;
			}
			if(parseInt($('#unPreOutQty').val()) < totalQty){
				toastr.warning('미출고수량을 넘게입력했습니다.(현재 요청수량 '+$('#unPreOutQty').val()+')');
				$('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').focus();
				return false;
			}
		}

		var array = new Array();
		//저장처리
		for(var i=0; i<$('#barcodeDtlTable tbody tr').length; i++){
// 			$('#my-spinner').show();
			var obj = new Object();

			//001 작지, 002일반
			if(partReqGubun == "001"){
				obj.workOrdNo = workOrdNo;
			}

			obj.reqQty = reqQty;	//요청수량
			obj.totalQty = parseInt(totalQty) + parseInt(reqOutQty);	//현재 출고 수량 + 목록에 있는 출고 수량
			obj.partReqGubun = partReqGubun;
			
			obj.preOutWhsDate = $('#preOutWhsDate').val().replace(/-/g,'');
			obj.preWorkCharger = $('#preWorkCharger').val();
			
			obj.locationNo = $('#locationNo').val();
			obj.locationCd = $('#locationCd').val();
			obj.areaCd = $('#areaCd').val();
			obj.floorCd = $('#floorCd').val();
			
			obj.partReqNo = $('#partReqNo').val();
			obj.partReqSeq = partReqSeq;
			obj.inWhsDesc = $('#inWhsDesc').val();

			obj.poNo = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(0).find('input[name=poNo]').val();	//hidden값
			obj.poSeq = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(0).find('input[name=poSeq]').val();	//hidden값
			obj.inSeq = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(0).find('input[name=inSeq]').val();	//hidden값

			obj.workOrdNo = workOrdNo;
			
			obj.barcodeNo = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(0).find('input[name=barcodeNo]').val();
			obj.partCd = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(1).find('input[name=partCd]').val();
			obj.partRev = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(1).find('input[name=partRev]').val();
			obj.remainQty = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=remainQty]').val().replace(/,/g,'') - $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').val().replace(/,/g,'');	//남은 출고량
			obj.preOutQty = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').val().replace(/,/g,'');		//출고량

			obj.outCase = "003";
			
			array.push(obj);
		}
		console.log(array);
		var data = JSON.stringify(array);

		//등록
		$.ajax({
			url : '<c:url value="io/partReqBarcodeCreate"/>',
			type : 'POST',
			data : {
				'arrayData' : 	function(){return data;}
			},
			success: function (res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('등록되었습니다.');
				} else {
					toastr.error(res.message);
				}
            },
            complete : function() {
            	$('#btnSave').attr('disabled', true);
            	uiProc(true);
            	barcodeDtlTable.clear().draw();
        		$('#form').each(function() {
        			this.reset();
        		});
        		$('#partReqTable').DataTable().ajax.reload(function(){});
        		$('#my-spinner').hide();
			}
		});
	});

	
	//담당 팝업버튼 클릭 시
	function selectPartReqChargr(){
		console.log('요청자 팝업 시작');
		$('#userPopUpLabel').text("요청자 조회")
		userPopUpTable = $('#userPopUpTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy : true,
			pageLength : 15,
			ajax : {
				url : '/sm/matrlUserDataList',
				type : 'GET',
				data : {}
			},
			rowId : 'userNumber',
			columns : [ 
				{ data : 'userNm'		},
				{ data : 'departmentNm'	},
				{ data : 'postNm'		},
				{ data : 'chargrDutyNm'	},
				{ data : 'workplaceNm'	},
				{ data : 'userDesc'		},
			],
			columnDefs : [ {
				"targets" : [ 0, 1, 2, 3, 4, 5 ],
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});
		$('#userPopUpTable tbody').on('click', 'tr', function() {
			var data = userPopUpTable.row(this).data();
			$('#preWorkCharger').val(data.userNumber);
			$('#preWorkChargerNm').val(data.userNm);
			$('#userPopUpModal').modal('hide');
		});
		$('#userPopUpModal').modal('show');
	}
	
	//inputBox
	function uiProc(flag) {
		$('#btnDel').attr('disabled', flag);
		$('#preOutWhsDate').attr('disabled',flag);
		$('#btnPreWorkCharger').attr('disabled',flag);
		$('#barcodeNo').attr('disabled',flag);
		$('#inWhsDesc').attr('disabled',flag);
	}

	
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
	html1 += '&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">요청상태</label>';
	html1 += '<select id="reqStatusOption" class="custom-select custom-select-sm"  style="max-width:px;">';
	html1 += '<option value="" >전체</option>';
	html1 += '<option value="001" selected>대기</option>';
	html1 += '<option value="002">진행</option>';
	html1 += '<option value="003">완료</option>';
	html1 += '</select>';
	html1 += '</div>';

	$('#partReqTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		$('#partReqTable').DataTable().ajax.reload(function(){});
	});
	

	$('#reqStatusOption').on('change', function() {
		reqStatusVal = $('#reqStatusOption option:selected').val();
		$('#partReqTable').DataTable().ajax.reload(function() {});
	});

    
	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		$('#partReqTable').DataTable().ajax.reload(function (){});
    });
</script>

</body>
</html>
