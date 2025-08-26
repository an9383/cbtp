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
				<li class="breadcrumb-item active">출고요청관리</li>
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
											<th>출고요청</th>
											<th>출고상태</th>
											<th>출고요청번호</th>
											<th>수주구분</th>
											<th>발주처</th>
											<th>품번</th>
											<th>품명</th>
											<th>출고요청일</th>
											<th>출고요청량</th>
											<th>출고일</th>
											<th>출고량</th>
											<th>현재고</th>
											<th>지시량</th>
											<th>생산량</th>
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

<!-- 요청등록 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="doModal" tabindex="-1" aria-labelledby="doModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-lg" style="width:100%;">
		<div class="modal-content">
			<div class="modal-header">
		        <h5 class="modal-title" id="doModalLabel">출고요청관리</h5>
            </div>
            <div class="card-body p-0 pr-3">
				<button type="button" class="btn btn-primary float-right mb-1 mr-1" id="btnReqSave">요청</button>
			</div>
			<div class="modal-body" style="padding-top:0px;">
				<hr class="text-secondary m-2">	         
				<table id="" class="table table-bordered m-0">
					<thead>
						<tr>
							<th>수주상세번호</th>
							<td style="min-width:100%; text-align:center;"><span id="contDtlNo"></span></td>
							<th>출고요청번호</th>
							<td><input type="text" class="form-control" id="doNo" name="doNo" placeholder="자동생성" style="min-width:100%; text-align:center; font-size:13px;" disabled></td>
						</tr>
						<tr>
							<th>출고요청일</th>
							<td><input type="date" class="form-control" id="doDate" name="doDate" style="min-width:100%; text-align:center; font-size:13px;"></td>
							<th>출고요청량</th>
							<td><input type="text" class="form-control" id="doQty" name="doQty" style="min-width:100%; text-align:right; font-size:13px;"></td>
						</tr>
						<tr>
							<th>출고담당자</th>
							<td>
								<div class="input-sub m-0" style="max-width: 100%">
									<input type="text" class="form-control" id="doChargrNm" name="doChargrNm" style="min-width:100%; text-align:center; font-size:13px;" disabled>
									<input type="hidden" id="doChargr" name="doChargr">
									<button type="button" class="btn btn-primary input-sub-search" id="btndoChargr" onclick="btndoChargrPopup();">
										<span class="oi oi-magnifying-glass"></span>
									</button>
								</div>
							</td>
							<th>출고처</th>
							<td>
								<div class="input-sub m-0" style="min-width:100%">
									<input type="text" class="form-control" id="outCorpNm" name="outCorpNm" style="min-width:100%; text-align:center; font-size:13px;" disabled>
									<input type="hidden" class="form-control" id="outCorpCd" name="outCorpCd">
									<button type="button" id="btnOutCorpCd" class="btn btn-primary input-sub-search"
										onClick="btnOutCorpCdPopup()">
										<span class="oi oi-magnifying-glass"></span>
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3"><input type="text" class="form-control" id="doDesc" name="doDesc" style="min-width:100%; font-size:13px;"></td>
						</tr>
					</thead>
				</table>
	      	</div>
		  	<div class="modal-footer p-0 pr-3">
				<button type="button" class="btn btn-secondary float-right mb-1 mr-1" data-dismiss="modal">닫기</button>	
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	let currentHref = "bssc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "출고요청관리");	

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
				'startDate' : function(){return startDateVal.replace(/-/g,''); },
				'endDate' : function(){return endDateVal.replace(/-/g,''); },
				'doStatus' : function(){return doStatus;},
				'mainGubun' : function(){return mainGubun;}
			},
		},
		columns : [
			{data : 'mainGubunNm'},
			{
				data : 'doDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<button type="button" class="btn btn-danger" name="btnReqCancle" onclick="btnReqCanclePopup('+meta.row+');">취소</button>';
					}else{
						return '<button type="button" class="btn btn-primary" name="btnReq" onclick="btnReqPopup('+meta.row+');">요청</button>';
					}
				},
			},	
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
					return data!=null?data:'';
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
			},
			{
				data : 'totalInQty',
				render : function(data, type, row, meta) {
					return data!=null?rmDecimal(data):'';
				},
			},	//생산량
			{data : 'outCorpNm'},
			{data : 'doChargrNm'},
			{data : 'contDtlNo'},
		],
		columnDefs : [ 
			{targets : [9,11,12,13,14],render : $.fn.dataTable.render.number(','),className : 'text-right'},
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
	
	//요청버튼 클릭시
	function btnReqPopup(index){
		var data = deliveryOrderAdmTable.row(index).data();
		doNoVal = data.doNo;
		itemSeqVal = data.itemSeq;
		$('#contDtlNo').text(data.contDtlNo);
		$('#doNo').val(data.doNo==null?"":data.doNo);
		$('#doQty').val(data.doQty==null?rmDecimal(data.dtlOrdCnt):rmDecimal(data.doQty));
		$('#doDate').val(data.doDate==null?serverDateVal:moment(data.doDate).format('YYYY-MM-DD'));
		$('#outCorpNm').val(data.outCorpNm==null?data.ordCorpNm:data.outCorpNm);
		$('#outCorpCd').val(data.outCorpCd==null?data.ordCorpCd:data.outCorpCd);
		$('#doChargr').val(data.doChargr==null?userNumber:data.doChargr);
		$('#doChargrNm').val(data.doChargrNm==null?userNm:data.doChargrNm);
		$('#doDesc').val(data.doDesc==null?"":data.doDesc);
		$('#doModal').modal('show');
	};

	//요청버튼 클릭시(팝업창 내부)
	$('#btnReqSave').on('click',function(){

		//예외처리
		if($('#doDate').val()==""){
			toastr.warning("출고요청일을 입력해주세요.");
			return false;
		}

		if($('#doQty').val()=="" || $('#doQty').val()=="0"){
			toastr.warning("출고요청량을 입력해주세요.");
			return false;
		}

		if($('#doChargr').val()==""){
			toastr.warning("출고담당자를 입력해주세요.");
			return false;
		}

		if($('#outCorpCd').val()==""){
			toastr.warning("출고처를 입력해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="bs/deliveryOrderAdmIns" />',
			type : 'POST',
			data : {
				'contDtlNo' : $('#contDtlNo').text(),
				'doQty' 	: $('#doQty').val().replace(/,/g,''),
				'doChargr' 	: $('#doChargr').val(),
				'doDate' 	: $('#doDate').val().replace(/-/g,''),
				'outCorpCd' : $('#outCorpCd').val(),
				'itemSeq' 	: itemSeqVal,
				'doStatus' 	: '002',
				'doDesc' 	: $('#doDesc').val(),
			},
			success : function(res){
				if(res.result=="ok"){
					$('#doModal').modal('hide');
					toastr.success('출고요청 되었습니다.');
					$('#deliveryOrderAdmTable').DataTable().ajax.reload();
				}else{
					toastr.error(res.message);
				}
			}
		});
	});

	
	//요청취소버튼 클릭시
	function btnReqCanclePopup(index){
		var data = deliveryOrderAdmTable.row(index).data();
		
		$.ajax({
			url : '<c:url value="bs/deliveryOrderAdmDel" />',
			type : 'POST',
			data : {
				'doNo' 	:  function(){return data.doNo},
			},
			success : function(res){
				if(res.result=="ok"){
					$('#doModal').modal('hide');
					toastr.success('요청취소 되었습니다.');
					$('#deliveryOrderAdmTable').DataTable().ajax.reload();
				}else{
					toastr.error(res.message);
				}
			}
		});
	}


	//고객사 팝업 시작
	var dealCorpPopUpTable4;
	function btnOutCorpCdPopup() {
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealGubun' : function(){return '001';}
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ 
				{//거래처
					data : 'dealCorpNm'
				},
				{//거래처코드
					data : 'dealCorpCd'
				},
				{//대표자
					data : 'presidentNm'
				},
				{//대표품목
					data : 'repreItem'
				},
				{//사업자번호
					data : 'corpNo'
				} 
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			$('#outCorpCd').val(data.dealCorpCd);
			$('#outCorpNm').val(data.dealCorpNm);
			$('#dealCorpPopUpModal4').modal('hide');
		});
		$('#dealCorpPopUpModal4').modal('show');
	}


	//담당자 팝업 시작
	let userPopUpTable;
	function btndoChargrPopup() {
		if (userPopUpTable != null && userPopUpTable != 'undefined') {
			userPopUpTable.destroy();
		}
		userPopUpTable = $('#userPopUpTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			pageLength : 20,
			ajax : {
				url : '/sm/matrlUserDataList',
				type : 'GET',
				data : {
					'departmentCd' : '003',
				}
			},
			rowId : 'userNumber',
			columns : [
				{//성명
					data : 'userNm'
				}, 
				{//부서
					data : 'departmentNm'
				}, 
				{//직위
					data : 'postNm'
				}, 
				{//담당
					data : 'chargeDutyNm'
				},
				{//비고
					data : 'userDesc'
				}, 
			],
			columnDefs : [ {
				"targets" : '_all', "className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});
	
		$('#userPopUpTable tbody').on('click', 'tr', function() {
			var data = userPopUpTable.row(this).data();
	
			$('#doChargr').val(data.userNumber);
			$('#doChargrNm').val(data.userNm);
			$('#userPopUpModal').modal('hide');
		});
		$('#userPopUpModal').modal('show');
	}

	//출고요청 체인지
	function reqDtlRegCntChange(){
		reqDtlRegCntList = $('#reqDtlRegCnt').val();

	}
	//출고상태 체인지
	function reqStatusChange(){
		reqStatusList = $('#reqStatus').val();
	}

 	//품번,품명 모달창 팝업 시작
   	var itemInfoAdmPopUpTable;
   	function selectBtnItem()
   	{	   	
		if(itemInfoAdmPopUpTable == null || itemInfoAdmPopUpTable == undefined)	{
			itemInfoAdmPopUpTable = $('#itemInfoAdmPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-6 mt-3 text-left'B><'col-sm-12 col-md-3 mt-2 text-center'p><'col-sm-12 col-md-3 text-right'i>>",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				searching : true,
				scrollX : true,
				scrollY : '60vh',
				serverSide : true,
				pageLength : 18,
				ajax : {
					url : '<c:url value="/bm/itemPartAdmMainList"/>',
					type : 'GET',
					data : {
					},
				},
				rowId : 'itemCdRev',
				columns : [ 
				{
					data : 'itemCd'
				}, 
				{
					data : 'itemNm'
				}, 
				{
					data : 'itemCusNm'
				}, 
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
			success : function(){
				itemInfoAdmPopUpTable= '';
				
			}
		    });

		    $('#itemInfoAdmPopUpTable tbody').on('click', 'tr', function () {
			    
		    	var data = itemInfoAdmPopUpTable.row( this ).data();
		    	$('#itemSeq').val(data.itemSeq);
				$('#itemNm').val(data.itemNm);
				$('#itemCd').val(data.itemCd);
                $('#itemInfoAdmPopUpModal').modal('hide');
	
			});
		}else{
			$('#itemInfoAdmPopUpTable').DataTable().ajax.reload(function(){});
		}
		$('#itemInfoAdmPopUpModal').modal('show');		
   	}

  	//고객사(발주처) 모달창 팝업 시작
   	var dealCorpPopUpTable2;
   	function selectBtnOrdCorp()
   	{	   	
		if(dealCorpPopUpTable2 == null || dealCorpPopUpTable2 == undefined)	{
			dealCorpPopUpTable2 = $('#dealCorpPopUpTable2').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-6 mt-3 text-left'B><'col-sm-12 col-md-3 mt-2 text-center'p><'col-sm-12 col-md-3 text-right'i>>",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : true,
				lengthChange : true,
				searching : true,
				scrollY : '60vh',
				serverSide : true,
				pageLength : 18,
				ajax : {
					url : '<c:url value="/bm/dealCorpDataList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'dealCorpCd',
				columns : [{
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
				}
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    })
		    $('#dealCorpPopUpTable2 tbody').on('click', 'tr', function () {
			    
		    	var data = dealCorpPopUpTable2.row( this ).data();
		    	$('#ordCorpCd').val(data.dealCorpCd);
				$('#ordCorpNm').val(data.dealCorpNm);
                $('#dealCorpPopUpModal2').modal('hide');
	
			});
		}else{
			$('#dealCorpPopUpTable2').DataTable().ajax.reload(function(){});
		}
		$('#dealCorpPopUpModal2').modal('show');		
   	}

   	
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