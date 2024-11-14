<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>
<style>
 body{
  overflow:hidden;
 }
</style>
<!-- .app -->
<div class="app pda_mo_wrap" style="display: flex;flex-direction: column;height: 100%;">
	<header class="pda_mo_hd">
		<a href="tmsc0190" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0070"><p class="mo_main_title">제품출하</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-2 mo_sort_title">발주처</div>
					<div class="form-group input-sub col-10 m-0 p-0">
						<input type="hidden" class="form-control" id="poCorpCd" name="poCorpCd" disabled> 
						<input type="text" class="form-control-md" id="poCorpNm" name="poCorpNm" disabled> 
						<button type="button" class="btn btn-primary input-sub-search-md" id="btnPoCorpCd" onclick="selectPoCorpCd()">
							<span class="oi oi-magnifying-glass"style="font-size: 15px;"></span>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12 row p-1">
						<div class="col-2 mo_sort_title">출고요청일</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="text" class="form-control-md" id="doDate" disabled>
						</div>
						<div class="col-2 mo_sort_title" style="text-align:center;">&nbsp;오더구분</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="text" class="form-control-md" id="ordGubun" disabled>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 row p-1">
						<div class="col-2 mo_sort_title">품명(Type)</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="hidden" id="itemCd">
							<input type="hidden" id="itemRev">
							<input type="text" class="form-control-md" id="itemNm" disabled>
						</div>
						<div class="col-2 mo_sort_title" style="text-align:center;">출고지시량</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="text" class="form-control-md" id="targetQty" style="text-align:right;"disabled>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 row p-1">
						<div class="col-2 mo_sort_title">미출하량</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="text" class="form-control-md" id="remainQty" style="text-align:right;" disabled>
						</div>
						<div class="col-2 mo_sort_title" style="text-align:center;">&nbsp;출고처</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="hidden" class="form-control" id="doCorpCd" name="doCorpCd" disabled>
							<input type="text" class="form-control-md" id="doCorpNm" disabled>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 row p-1">
						<div class="col-3 mo_sort_title">Barcode No</div>
						<div class="form-group input-sub col-9 m-0 p-0">
							<input type="text" class="form-control-md" id="barcodeNo" inputmode="none"  placeholder="스캐너만 입력">
						</div>
					</div>
				</div>
	</div>
	<!--==버튼영역-->
	<div class="mo_btnbox pl-2 pr-2">
				<div class="float-left">
					<button type="button" class="btn btn-danger float-right" id="btnLineClear" disabled>라인삭제</button>
					<button type="button" class="btn btn-danger float-right mr-2" id="btnAllClear" disabled>전체삭제</button>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-secondary float-right" id="btnCancel">취소</button>
					<button type="button" class="btn btn-secondary float-right d-none" id="btnNew">새로 등록</button>
					<button type="button" class="btn btn-primary float-right mr-2" id="btnSave" disabled>저장</button>
				</div>
			</div>
			<br>
	<!--==end==버튼영역-->
	<!--==end==-sortbox-->
	<main style="height: calc(100vh - 50px);overflow:auto;">
		<div class="container-fluid bg_wh" id="main" style="height: 100%;display: flex;flex-direction: column;">
			<!--table-->
			<!-- .table-responsive -->
			<div class="card mo_card" style="OVERFLOW-Y:auto; width:100%;">
				<div class="table-responsive">
					<table id="deliveryProcDtlTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th style="min-width: 90px">Barcode No</th>
								<th style="min-width: 90px">출고일</th>
								<th style="min-width: 100px">품명(Type)</th>
								<th style="min-width: 50px">REV</th>
								<th style="min-width: 50px">구분</th>
								<th style="min-width: 55px">출고량</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--==end==card-->
			<!--==end==table-->

		</div>
	</main>
	<footer class="p-2" style="margin-top: auto;">
			<div class="mo_sumbox">
				<button type="button" class="btn btn-warning float-left" id="btnKeyboard">자판 Off</button>
				<div class="row float-right">
					<div class="mo_roll mr-4">
						<!-- <label>합계</label><span class="mo_sum_font_lg" id="rowCount">0</span> <label>Roll</label> -->
					</div>
					<div class="mo_kg">
						<span class="mo_sum_font_lg" id="count">0</span> <label>개수</label>
					</div>
				</div>
			</div>
	</footer>
</div>
<!-- 출고의뢰현황 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="deliveryOrderPopupModal" tabindex="-1" role="dialog" aria-labelledby="deliveryOrderPopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deliveryOrderPopupLabel">출고의뢰현황 조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive">
				<table id="deliveryOrderPopupTable" class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
                            <th style="min-width: 70px">출고요청일</th>
                            <th style="min-width: 50px">오더구분</th>
                            <th style="min-width: 80px">발주처</th>
                            <th style="min-width: 100px">품명(Type)</th>
                            <th style="min-width: 50px" class="text-center">출고<br>지시량</th>
                            <th style="min-width: 50px" class="text-center">출하량</th>
                            <th style="min-width: 50px" class="text-center">미출하량</th>
                            <th style="min-width: 70px">납기일</th>
                            <th style="min-width: 70px">출고처</th>
                        </tr>
                    </thead>
				</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetPartCnt">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- 출고의뢰현황 모달 끝-->
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>

<script>

	$(document).attr("title","제품출하");
	let menuAuth = 'tmsc0070';
	var serverDate = "${serverDate}"
	var doNo;
	var doSeq;
	var itemCd;
	var itemRev;
	var itemNm;
	var itemGubunNm;
	var barcodeNo;
	var outputDtlQty;
	var sum = 0;
	var index = 0;
	var tableIdx;
		
	var approvalCd = null;
	var barcodeNo = null;
	var locationCd = null;
	var statusCd = 'O';
	var createOrUpdate = 'create';
	var checkPreOutWhsDate = null;
	var checkPreWorkCharger = null;
	var itemNm = '';
	var count = 0;
	
	$('#preOutWhsDate').val(serverDate);
	$('#btnWorkOrdNo').focus();
	
	$.fn.dataTable.ext.errMode = 'none';
	let deliveryProcDtlTable = $('#deliveryProcDtlTable').on( 'error.dt', function ( e, settings, techNote, message ) {
		if(techNote == 7) {
			toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.", '', {timeOut: 5000});
			location.href = "/";
		}
	}).DataTable({
	    language: lang_kor,
	    paging: false,
	    info: false,
	    ordering: false,
	    processing: true,
	    autoWidth: false,
	    scrollX : false,
	    lengthChange: false,
	    searching: false,
	    pageLength: 20,            
		ajax : {
			url : '<c:url value="bs/deliveryProcDtlRead"/>',
			type : 'GET',
			data : {
				'menuAuth'	: menuAuth,
				'doNo' : function() {return doNo;},
				'doSeq' : function() {return doSeq;}
			},
		},
	    rowId: '',
	    columns: [
	    	{data : 'barcodeNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>';	
					} else{
						var html = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>' ;	

						return html;
					}		    			
	    		}
			},{
				data : 'doDtlDate',
				render : function(data, type, row, meta) {
					var value = "";
					if (data != null) {
						value = '<input class="form-control" type="text" id="doDtlDate'
								+ index
								+ '" value="'
								+ moment(data).format(
										"YYYY-MM-DD")
								+ '" name="doDtlDate" disabled>';
						value2 = '<button onclick="fnPopUpCalendar(doDtlDate'
								+ index
								+ ',doDtlDate'
								+ index
								+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="doDtlDateCalendar'
								+ index
								+ '" name="dlvDateCalendar" type="button" disabled>';
					} else {
						value = '<input class="form-control" type="text" id="doDtlDate'+index+'" value="'+serverDate+'" name="doDtlDate" disabled>';
						value2 = '<button onclick="fnPopUpCalendar(doDtlDate'
								+ index
								+ ',doDtlDate'
								+ index
								+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="doDtlDateCalendar'
								+ index
								+ '" name="dlvDateCalendar" type="button">';
					}
					var html = '<div class="form-group input-sub m-0">';
					html += value;
					html += value2;
					html += '<span class="oi oi-calendar"></span></button>';
					html += '</div>';

					index++;
					return html;
				}
			}, {
				data : 'itemNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" style="text-align:center;" name="itemNm" value="'+data+'" disabled>';

					} else {
						return '<input type="text" class="form-control" style="text-align:center;" name="itemNm" value="'+itemNm+'" disabled>';
					}
				}
			}, {data : 'itemRev',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemRev" value="'+data+'" disabled>';		
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemRev" value="'+itemRev+'" disabled>';	
					}		
    			}
			}, {data : 'itemGubunNm',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="'+data+'" disabled>';			
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="'+itemGubunNm+'" disabled>';	
					}			    			
	    		}
			}, {
				data : 'outputDtlQty',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" style="text-align:center;" name="outputDtlQty" value="'+data+'" disabled>';

					} else {
						return '<input type="text" class="form-control" style="text-align:center;" name="outputDtlQty" value="'+outputDtlQty+'">';
					}
				}
			},
	    ],
	    columnDefs: [
	    	{"className": "text-center", "targets": "_all"}
	    ],
	    order: [
	        [ 0, 'desc' ]
	    ],
	    buttons: [
	    ],
		drawCallback: function () {
			 $('.mo_card tbody').css('font-size','10px');
		},
	});
	
	var lineCheck = false;
    $('#deliveryProcDtlTable tbody').on('click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            lineCheck = false;
        }
        else {
        	$('#deliveryProcDtlTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            lineCheck = true;
        }
    });
    
	//바코드 스캔시
	$("#barcodeNo").keypress(function (e) {
		var check2 = true;  	
		
	    if (e.which == 13){
	    	if(!$.trim($('#poCorpNm').val())){
				toastr.warning('발주처를 선택해주세요.');
				$('#btnPoCorpCd').focus();
				$('#barcodeNo').val('');
				check2 = false;
				return false;
			}

			
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
			}

			if($('#barcodeNo').val().length != 13) {
				toastr.warning('잘못된 바코드 입니다. 확인해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').select();
				check=false;
				return false;
			}
			
	    	
			/* $('#deliveryProcDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					check2 = false;
					return false;
				}
			}); */

	        if(check2 == true){
			 	$.ajax({
			 		url: '<c:url value="wm/barcodeNoScanOutList"/>',
	                type: 'GET',
	                data: {
	                	'menuAuth'	 	: 	menuAuth,
	                	'barcodeNo'  :  $('#barcodeNo').val(),  
	                	'itemCd'  :  $('#itemCd').val(),  
	                	'itemRev'  :  $('#itemRev').val()      
	                },
	                success: function (res) {
	                    let data = res.data;
	                    $('#barcodeNo').select();
	                    if (res.result == 'ok') {
	                    	barcodeNo = data.barcodeNo;
		                    workOrdNo = data.workOrdNo;
		                    itemCd = data.itemCd;
		                    itemNm = data.itemNm;
		                    itemRev = data.itemRev;
		                    itemGubunNm = data.itemGubunNm;
		                    outputDtlQty =  Math.floor(data.remainQty);
			                
	                    	$('#deliveryProcDtlTable').DataTable().row.add({}).draw(false);
	                    	$('#btnWorkOrdNo').attr('disabled', true);
	                    	$('#btnItemChargr').attr('disabled', true);
							$('#btnCalendar').attr('disabled', true);
							$('#btnAllClear').attr('disabled', false);
							$('#btnLineClear').attr('disabled', false);
							$('#btnSave').attr('disabled', false);
							$('#barcodeNo').val("");
							$('#barcodeNo').focus();
							$('#btnSave').removeClass('d-none');
							$('#count').text(count);
	                        toastr.success("추가되었습니다.");
	                        
	                    }else if(res.result == 'empty') {
	                    	toastr.warning("등록되지 않은 바코드입니다. 확인해주세요.");
	                    }else if(res.result == 'notIn') {
	                    	toastr.warning("제품입고되지 않은 바코드입니다. 확인해주세요.");
	                    }else if(res.result == 'notCorrect') {
	                    	toastr.warning("품명이 불일치한 바코드입니다. 확인해주세요.");
	                    }else if(res.result == 'notRemain') {
	                    	toastr.warning("남은수량이 없는 바코드입니다. 확인해주세요.");
	                    }else if(res.result == 'error') {
	                    	toastr.error(res.message, '', {timeOut: 5000});
	                    }    
		             },
		             complete:function(){
		                    //$('#btnAddConfirmLoading').addClass('d-none');
		             }
		        });
	        }
	    }
	});

	// 저장 처리
	$('#btnSave').on('click',function() {
		var dataArray = new Array();
		var check=true;
		
		if ($('#poCorpNm').val() == "") {
			toastr.warning("발주처를 선택해주세요.");
			check = false;
			return false;
		}
		
		$('#deliveryProcDtlTable tbody tr').each(function(index, item){
			if (deliveryProcDtlTable.data().count() != 0) {

				if ($(this).find('td input[name=outputDtlQty]').val() == "") {
					toastr.warning('출고량을 입력해주세요.');
					$('input [name=outputDtlQty]').focus();
					check = false;
					return false;
				}
				
			} else {
				toastr.warning('출고량 항목을 추가해주세요.');
				check = false;
				return false;
			}
			
			var rowData = new Object();
			rowData.doNo = doNo;
			rowData.doSeq = doSeq;
			rowData.itemCd = itemCd;
			rowData.itemRev = itemRev;
			rowData.targetQty = $('#targetQty').val().replace(/,/g,'');

			var outputDtlQtyValue = $(this).find('td input[name=outputDtlQty]').val().replace(/,/g,'');
			rowData.outputDtlQty = outputDtlQtyValue == null ? "": outputDtlQtyValue;
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.doDtlDate = $(this).find('td input[name=doDtlDate]').val().replace(/-/g, '');

			$('#deliveryProcDtlTable tbody tr').each(function(index,item) {
				sum += parseInt($(this).find("td input[name=outputDtlQty]").val().replace(/,/g,''));
			});

			rowData.sum = sum;

			dataArray.push(rowData);
			console.log(rowData);
			sum = 0;
			
	        dataArray.push(rowData);
		});

		//$('#my-spinner').show();
		
		if(check == true){
			$.ajax({
				url : '<c:url value="/bs/deliveryProcDtlCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#deliveryOrderAdmTable').DataTable().ajax.reload(function() {});

						$('#btnAllClear').attr('disabled', true);
	                	$('#btnLineClear').attr('disabled', true);
	                	$('#btnSave').attr('disabled', true);                    
	                    $('#barcodeNo').attr('disabled', true);
	                    $('#inWhsDesc').attr('disabled', true);
	                    $('#btnWorkOrdNo').attr('disabled', true);
	                    $('#btnItemChargr').attr('disabled', true);
						$('#btnCancel').addClass('d-none');
						$('#btnNew').removeClass('d-none');

						uiProc(true);
						uiProc2(true);
						
						toastr.success('자재출고 저장되었습니다.');
					} 
					else if (res.result == "excess") {
						toastr.warning('출고량을 초과하였습니다. 확인해주세요.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
	});
	
	//전체 삭제
	$('#btnAllClear').on('click', function() {
		$('#deliveryProcDtlTable').DataTable().clear().draw();
		$('#btnAllClear').attr('disabled', true);
		$('#btnLineClear').attr('disabled', true);
		$('#btnSave').attr('disabled', true);
		$('#barcodeNo').val('');
		$('#barcodeNo').focus();
		count = 0;
		$('#count').text(count);
	});

	//라인 삭제
	$('#btnLineClear').on('click', function() {
		if ( lineCheck == true) {
	    	$('#deliveryProcDtlTable').DataTable().rows('.selected').remove().draw();
	    	$("#barcodeNo").val("");
	    	$("#barcodeNo").focus();
	    	var rowCnt = $('#deliveryProcDtlTable').DataTable().data().count(); 
	    	if(rowCnt == 0) {
	    		$('#btnSave').attr('disabled', true);
	    		$('#btnAllClear').attr('disabled', true);
	    		$('#btnLineClear').attr('disabled', true);
	    	}
    		count -= 1;
    		$('#count').text(count);
		} else {
	    	toastr.warning('삭제할 라인을 선택하세요.');
		}
	});
	
	//취소 버튼
	$('#btnCancel').on('click', function() {
		$('#btnCalendar').attr('disabled', false);
		$('#barcodeNo').attr('disabled', false);
		$('#btnWorkOrdNo').attr('disabled', false);
		$('#btnItemChargr').attr('disabled', false);
		$('#inWhsDesc').attr('disabled', false);
		$('#btnSave').attr('disabled', true);
		$('#btnAllClear').attr('disabled', true);
		$('#btnLineClear').attr('disabled', true);
		$('#deliveryProcDtlTable').DataTable().clear().draw();
		$('#locationCd').val('');
		$('#locationNm').val('');
		$('#areaCd').val('');
		$('#areaNm').val('');
		$('#floorCd').val('');
		$('#barcodeNo').val('');
		$('#barcodeNo').val('');
		$('#btnSelEquipCode').focus();
		$('#preOutWhsDate').val(serverDate);
		count = 0;
		$('#count').text(count);
	});

	//저장 완료 후 새로등록
	$('#btnNew').on('click', function() {
		$('#barcodeNo').attr('disabled', false);
		$('#deliveryProcDtlTable').DataTable().clear().draw();

		$('#poCorpNm').val('');
		$('#doDate').val('');
		$('#ordGubun').val('');
		$('#itemRev').val('');
		$('#itemCd').val('');
		$('#itemNm').val('');
		$('#targetQty').val('');
		$('#remainQty').val('');
		$('#doCorpCd').val('');
		$('#doCorpNm').val('');
		$('#barcodeNo').val('');
		
		$('#btnNew').addClass('d-none');
		$('#btnCancel').removeClass('d-none');
		
	});

	// 발주처 팝업창 
   	var deliveryOrderPopupTable;
   	function selectPoCorpCd(){
   		deliveryOrderPopupTable = $('#deliveryOrderPopupTable').DataTable({		        
   			language : lang_kor,
			lengthChange : false,
			destroy : true,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			pageLength : 10,
	        ajax: {
	            url: '<c:url value="bs/deliveryOrderAdmList"/>',
	            type: 'GET',
	            data: {
					'doStatus' : '001'
		            }
	        },
	        rowId: '',
	        columns: [
	            { data: 'doDate',
		            render : function(data, type, row, meta){
			            return moment(data).format("YYYY-MM-DD");
			        }
	           	},
	            { data: 'ordGubunNm'},
	            { data: 'poCorpNm'},
	            { data: 'itemNm'},
	            { data: 'targetQty'},
	            { data: 'outputQty'},
	            { data: 'remainQty'},
	            { data: 'dlvDate',
	            	 render : function(data, type, row, meta){
				            return moment(data).format("YYYY-MM-DD");
				     }
		        },
	            { data: 'doCorpNm'},
	        ],
	        columnDefs: [
	        	 {
	     			targets : [4,5,6],
	     			render : $.fn.dataTable.render.number(','),
	     			className : 'text-right'
	     		} ,
	        	{ targets: [4,5,6], className : 'text-right'},
	       	 	{ targets: '_all', className : 'text-center'},
	       	 	
	   		],
	        order: [
	            [ 0, 'asc' ]
	        ],
	        
		});
		$('#deliveryOrderPopupTable tbody').on('click', 'tr', function () {
	    	var data = deliveryOrderPopupTable.row( this ).data();	
	    	$('#poCorpCd').val(data.poCorpCd);
	    	$('#poCorpNm').val(data.poCorpNm);
	    	$('#doDate').val(moment(data.doDate).format('YYYY-MM-DD'));
	    	$('#ordGubun').val(data.ordGubunNm);
	    	$('#itemCd').val(data.itemCd);
			$('#itemRev').val(data.itemRev);
	    	$('#itemNm').val(data.itemNm);
	    	$('#targetQty').val(addCommas(data.targetQty));
	    	$('#remainQty').val(addCommas(data.remainQty));
	    	$('#doCorpCd').val(data.doCorpCd);
	    	$('#doCorpNm').val(data.doCorpNm);

	    	itemCd = data.itemCd;
	    	itemRev = data.itemRev;
	    	itemNm = data.itemNm;
			doNo = data.doNo;
			doSeq = data.doSeq;

			$('#deliveryProcDtlTable').DataTable().clear().draw();
			
	    	$('#deliveryOrderPopupModal').modal('hide');
	    	
	    });
		$('#deliveryOrderPopupModal').modal('show');
   	}

  	//모바일 자판 On/Off
	$('#btnKeyboard').on('click', function() {
		var inputmode = $('#barcodeNo').attr('inputmode');
		if ( inputmode == 'none') {
			$('#btnKeyboard').text("자판 On");
			$('#barcodeNo').attr('inputmode', 'text');
		} else if ( inputmode == 'text' ) {
			$('#btnKeyboard').text("자판 Off");
			$('#barcodeNo').attr('inputmode', 'none');
		}
	});


	function uiProc(flag) {
		$('#doDateCalendar').attr('disabled', flag);
		$('#btnPoCorpCd').attr('disabled', flag);
		$('#btnDoCorpCd').attr('disabled', flag);
		$('#barcodeNo').attr('disabled', flag);
	}

	function uiProc2(flag) {
		$('input[name=outputDtlQty]').attr('disabled', flag);
		$('button[name=dlvDateCalendar]').attr('disabled', flag);
		$('input[name=doDtlDesc]').attr('disabled', flag);
	}
	
</script>

</body>
</html>
