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
		<a href="<c:url value="tmsc0200"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0060"><p class="mo_main_title">자재입고</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">입고일</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input class="form-control-md" type="text" id="inWhsDate" disabled />
						<button onclick="fnPopUpCalendar(inWhsDate,inWhsDate,'yyyy-mm-dd');" class="btn btn-secondary input-sub-search-md" type="button" id="btnCalendar">
							<span class="oi oi-calendar" style="font-size: 13px;"></span>
						</button>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">Location No</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="locationNo" style="min-width:100%;"  placeholder="스캐너만 입력">
					</div>
				</div>
				<div class="row">
					<div class="col-12 row p-1">
						<div class="col-3 mo_sort_title">구역</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="hidden" class="form-control" id="locationCd" style="min-width:100%;">
							<input type="hidden" class="form-control" id="areaCd" style="min-width:100%;">
							<input type="text" class="form-control-md" id="areaNm" readonly>
						</div>
						<div class="col-1 mo_sort_title" style="text-align:center;">위치</div>
						<div class="form-group input-sub col-4 m-0 p-0">
							<input type="hidden" class="form-control" id="floorCd" style="min-width:100%;">
							<input type="text" class="form-control-md" id="floorNm" readonly>
						</div>
					</div>
					<div class="col-12 row p-1">
						<div class="col-3 mo_sort_title">Barcode NO</div>
						<div class="form-group input-sub col-9 m-0 p-0">
							<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
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
					<table id="barcodeDtlTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th style="min-width: 20px">순번</th>
								<th style="min-width: 90px">Barcode NO</th>
								<th style="min-width: 80px">CODE</th>
								<th style="min-width: 40px">REV</th>
								<th style="min-width: 100px">ITEM</th>
								<th style="min-width: 220px">SPEC</th>
								<th style="min-width: 40px">단위</th>
								<th style="min-width: 40px">입고량</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--==end==card-->
			<!--==end==table-->
		</div>
		<!-- 창고정보 모달 시작-->
		<div class="modal fade" id="locationPopupModal" tabindex="-1" role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>	
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="table-responsive" style="height:490px">
							<table class="table table-sm table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>창고</th>
									<td>
										<select class="custom-select" id="selectLocationCd" style="max-width:100%;" onchange="changeAreaCd()"></select>
									</td>
									<th>구역</th>
									<td>
										<select class="custom-select" id="selectAreaCd" style="max-width:100%;" onchange="changeFloorCd()">
											<option value="">창고를 선택해주세요.</option>
										</select>
									</td>
								</tr>
							</table>
							<table id="locationPopupTable" class="table table-sm table-bordered">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>창고명</th>
										<th>구역명</th>
										<th>위치명</th>
										<th>비고</th>
										<th>사용여부</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 창고정보 모달 종료-->
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
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>

<script>

	$(document).attr("title","자재입고");
	let menuAuth = 'tmsc0060';
	var serverDate = "${serverDate}"
	var barcodeNo = null;
	var partCd = null;
	var partRev = null;
	var partNm = null;
	var partSpec = null;
	var inWhsQty = null;
	var baseInfoCd = null;
	var etc3 = null;
	var areaCd = null;
	var count = 0;
	
	$('#inWhsDate').val(serverDate);
	$('#btnSelEquipCode').focus();

	//공통코드 처리 시작	
 	var locationCdCode = new Array(); 
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.locationCd}";
	json.baseNm = "${info.locationNm}";
	locationCdCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝

	selectBoxAppend(locationCdCode , "selectLocationCd",'', "2");
	
	$.fn.dataTable.ext.errMode = 'none';
	let barcodeDtlTable = $('#barcodeDtlTable').on( 'error.dt', function ( e, settings, techNote, message ) {
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
			url : '<c:url value="io/inOutWhsAdmRead"/>',
			type : 'GET',
			data : {
				'menuAuth'	: menuAuth,
				'barcodeNo' : function(){ return barcodeNo; },
			},
		},
	    rowId: '',
	    columns: [
	    	{
	    		render: function(data, type, row, meta) {
	    			var rowNo = meta.row + meta.settings._iDisplayStart + 1;
	    			if(rowNo == 1) {
	    				$('#btnSave').attr('disabled', false);
			    	}
					return meta.row + meta.settings._iDisplayStart + 1 ;
				}
	    	},
	    	{data : 'barcodeNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="max-width:100%;text-align:center;" disabled>';	
					} else{
						return '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="max-width:100%;text-align:center;" disabled>' ;	
					}		    			
	    		}
			}, {data : 'partCd',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" name="partCd" value="'+data+'" style="max-width:100%;text-align:center;" disabled>';		
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+partCd+'" disabled>';	
					}		    			
	    		}
			}, {data : 'partRev',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partRev" value="'+data+'" disabled>';		
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partRev" value="'+partRev+'" disabled>';	
					}		
    			}
			}, {data : 'partNm',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partNm" value="'+data+'" disabled>';			
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partNm" value="'+partNm+'" disabled>';	
					}			    			
	    		}
			}, {data : 'partSpec',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partSpec" value="'+data+'" disabled>';			
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partSpec" value="'+partSpec+'" disabled>';	
					}		
				},
			}, {data : 'partUnit',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partUnit" value="'+data+'" disabled>';			
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partUnit" value="'+partUnit+'" disabled>';	
					}		
				},
			}, {data : 'inWhsQty',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="inWhsQty" value="'+addCommas(data)+'" disabled>';			
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="inWhsQty" value="'+addCommas(inWhsQty)+'" disabled>';	
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
    $('#barcodeDtlTable tbody').on('click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            lineCheck = false;
        }	
        else {
        	$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            lineCheck = true;
        }
    });

 	// 창고바코드입력
	$('#locationNo').keypress(function(e){
		var check2=true;  	
		if(e.keyCode == 13){
			if(!$.trim($('#locationNo').val())){
				toastr.warning('창고 바코드를 스캔해주세요.');
				$('#locationNo').focus();
				check2 = false;
				return false;
			}

			if($('#locationNo').val().length != 12) {
				toastr.warning('잘못된 창고 바코드 입니다. 확인해주세요.');
				$('#locationNo').focus();
				$('#locationNo').select();
				check=false;
				return false;
			}
			
			if(check2 == true){
			 	$.ajax({
	            	url: '/io/getLocInfo',
	                type: 'GET',
	                data: {
	                	'locationNo'  :  $('#locationNo').val(),
	                	'status' 		: 'part'             
	                },
	                success: function (res) {
	                    let data = res.data;
	                    
	                    if (res.result == 'ok') {
		                    
		                   $('#locationCd').val(data.locationCd);
		                   $('#locationNm').val(data.locationNm);
		                   $('#areaCd').val(data.areaCd);
		                   $('#areaNm').val(data.areaNm);
		                   $('#floorNm').val(data.floorNm);

		                   $('#barcodeNo').focus();
		                   toastr.success("창고정보 추가되었습니다.");
		                   
	                    }else if(res.result == 'empty') {	
	                    	toastr.warning("등록되지 않은 창고 바코드입니다. 확인해주세요.");
	                    	$('#locationNo').select();
	                    }else if(res.result == 'notPartLocCd') {
	                    	toastr.warning("원자재 창고 바코드가 아닙니다. 확인해주세요.");
	                    }else if(res.result == 'error') {
	                    	toastr.error(res.message, '', {timeOut: 5000});
	                    }    
		             },
		             complete:function(){
		                    //$('#btnAddConfirm').removeClass('d-none');
		                    //$('#btnAddConfirmLoading').addClass('d-none');
		             }
		        });
			}
		}
	});

	
	//바코드 스캔시
	$("#barcodeNo").keypress(function (e) {
		
	    if (e.which == 13){
	    	
	    	if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
			}

			/* if($('#barcodeNo').val().length != 21) {
				toastr.warning('잘못된 바코드 입니다. 확인해주세요.');
				$('#barcodeNo').focus()
				$('#barcodeNo').select();
				check=false;
				return false;
			} */
			
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').focus();
					$('#barcodeNo').select();
					check2 = false;
					return false;
				}

			});

	    	var check2 = true;  	
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					$('#barcodeNo').focus();
					$('#barcodeNo').select();
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					check2 = false;
					return false;
				}
			});
			
	        if(check2 == true){
			 	$.ajax({
	            	url: '/io/inOutWhsAdmRead',
	                type: 'GET',
	                data: {
	                	'menuAuth'	 	: 	menuAuth,
	                	'barcodeNo'  	:  	$('#barcodeNo').val(),
	                },
	                success: function (res) {
	                    let data = res.data;
	                    if (res.result == 'ok') {
		                    barcodeNo = data.barcodeNo;
		                    partCd = data.partCd;
		                    partNm = data.partNm;
		                    partRev = data.partRev;
		                    partSpec = data.partSpec;
		                    partUnit = data.partUnit;
		                    inWhsQty = data.inspectYn=='001'?Math.floor(data.pairCnt):Math.floor(data.preInWhsQty);
		                    areaCd = data.areaCd==null?"-":data.areaCd;
	                    	$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
	                    	$('#btnLocationCd').attr('disabled', true);
							$('#btnCalendar').attr('disabled', true);
							$('#btnAllClear').attr('disabled', false);
							$('#btnLineClear').attr('disabled', false);
							$('#btnSave').attr('disabled', false);
							$('#barcodeNo').select();
							$('#btnSave').removeClass('d-none');
							count += 1;
							$('#count').text(count);
	                        toastr.success("추가되었습니다.");
	                    } else{
	                    	if(res.result == 'empty') {
		                    	toastr.warning("등록되지 않은 바코드입니다. 확인해주세요.");
		                    } else if(res.result == 'notApproval') {
		                    	toastr.warning("승인된 바코드가 아닙니다. 확인해주세요.");
		                    } else if(res.result == 'notInspect') {
		                    	toastr.warning("수입검사된 바코드가 아닙니다. 확인해주세요.");
		                    } else if(res.result == 'notRemain') {
		                    	toastr.warning("남은수량이 없습니다. 확인해주세요.");
		                    } else if(res.result == 'error') {
		                    	toastr.warning(res.message, '', {timeOut: 5000});
		                    }    

	                    	$('#barcodeNo').select();
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

		if(!$.trim($('#locationNo').val())){
			toastr.warning('창고 바코드를 스캔해주세요.');
			$('#locationNo').focus();
			return false;
		}
		//처리중..
		$('#my-spinner').show();
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
			var rowData = new Object();
			rowData.inWhsDate= $('#inWhsDate').val().replace(/-/g,'');
			
			rowData.barcodeNo= $(this).find('td input[name=barcodeNo]').val();	
			rowData.inWhsQty= $(this).find('td input[name=inWhsQty]').val().replace(/,/g,'');	
			
			rowData.partCd= $(this).find('td input[name=partCd]').val();	
			rowData.partRev= $(this).find('td input[name=partRev]').val();	
			
			rowData.locationNo = $('#locationNo').val();
			rowData.locationCd = $('#locationCd').val();
			rowData.areaCd = $('#areaCd').val();
			rowData.floorNm = $('#floorNm').val();
			//rowData.floorCd = $('#floorCd option:selected').val();
	        dataArray.push(rowData);
		});
		
		if(check == true){
			$.ajax({
				url : '<c:url value="io/inOutWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#btnAllClear').attr('disabled', true);
	                	$('#btnLineClear').attr('disabled', true);
	                	$('#btnSave').attr('disabled', true);                    
	                    $('#barcodeNo').attr('disabled', true);
						$('#btnCancel').addClass('d-none');
						$('#btnNew').removeClass('d-none');
						
						/* $('#locationCd').val("");
						$('#locationNm').val("");
						$('#areaCd').val("");
						$('#areaNm').val("");
						$('#floorCd').val("");
						$('#floorNm').val("");
						$('#locationNo').val(""); */
						//$('#barcodeNo').val("");
						//$('#barcodeNo').focus();
						
						//$('#barcodeDtlTable').DataTable().clear().draw();
						
						toastr.success('자재입고 저장되었습니다.');
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
				}
			});
		}
	});

	var barcodeNoList;
	function createBarcodeNo() {
		barcodeNoList = new Array();
		var idx = 0;
		$('#barcodeDtlTable tbody tr').each(function(){
		 	var barcodeNo= $(this).find('td').eq(1).html();
		 	var equipCd = $("#equipCd").val();
			var goodsCd = $("#goodsCd").val();
		 	var inWhsDate = $("#inWhsDate").val().replace(/-/g, '');
		 	var rowData = new Object();
		 	rowData.menuAuth = menuAuth;
			rowData.barcodeNo = barcodeNo;
			rowData.preOutGoodsCd = goodsCd;
			rowData.preOutEquipCd = equipCd;
			rowData.preOutWhsDate = inWhsDate;
			rowData.preOutQty = preOutQty;
			barcodeNoList.push(rowData);
		});
		console.log(barcodeNoList);
		return idx;
	}
	
	//전체 삭제
	$('#btnAllClear').on('click', function() {
		$('#barcodeDtlTable').DataTable().clear().draw();
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
	    	$('#barcodeDtlTable').DataTable().rows('.selected').remove().draw();
	    	$("#barcodeNo").val("");
	    	$("#barcodeNo").focus();
	    	var rowCnt = $('#barcodeDtlTable').DataTable().data().count(); 
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
		$('#btnLocationCd').attr('disabled', false);
		$('#btnSave').attr('disabled', true);
		$('#btnAllClear').attr('disabled', true);
		$('#btnLineClear').attr('disabled', true);
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#locationNo').val('');
		$('#locationCd').val('');
		$('#locationNm').val('');
		$('#areaCd').val('');
		$('#areaNm').val('');
		$('#floorNm').val('');
		$('#floorCd').val('');
		$('#barcodeNo').val('');
		$('#btnSelEquipCode').focus();
		$('#inWhsDate').val(serverDate);
		count = 0;
		$('#count').text(count);
	});

	//저장 완료 후 새로등록
	$('#btnNew').on('click', function() {
		$('#btnCalendar').attr('disabled', false);
		$('#barcodeNo').attr('disabled', false);
		$('#btnLocationCd').attr('disabled', false);
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#inWhsDate').val(serverDate);
		$('#btnNew').addClass('d-none');
		$('#btnCancel').removeClass('d-none');

		$('#locationCd').val("");
		$('#locationNm').val("");
		$('#areaCd').val("");
		$('#areaNm').val("");
		$('#floorCd').val("");
		$('#floorNm').val("");
		$('#locationNo').val("");
		$('#barcodeNo').val("");
		$('#barcodeNo').focus();
		
		count = 0;
		$('#count').text(count);
	});
	
	//창고정보조회 팝업 시작
	var locationPopupTable;
	function selectLocationCd() {
		if (locationPopupTable == null || locationPopupTable == undefined) {
			locationPopupTable = $('#locationPopupTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				searching:false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 13,
				ajax : {
					url : 'bm/baseInfoWhList',
					type : 'GET',
					data : {
						'baseInfoCd' : function(){return baseInfoCd;},
						'etc3' : function(){return etc3;}
					}
				},
				columns : [ {
					data : 'baseInfoNm'
				}, {
					data : 'areaNm'
				}, {
					data : 'etc2'
				}, {
					data : 'baseInfoDesc'
				}, {
					data : 'useYnNm'
				},  ],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#locationPopupTable tbody').on('click', 'tr', function() {
				var data = locationPopupTable.row(this).data();

				//창고정보
				$('#locationNm').val(data.baseInfoNm);
				$('#locationCd').val(data.baseInfoCd);
				//구역정보
				$('#areaNm').val(data.areaNm);
				$('#areaCd').val(data.areaCd);
				//위치정보
				$('#floorCd').val(data.etc2);
				$('#barcodeNo').focus();
				$('#locationPopupModal').modal('hide');
			});
		} else {
			$('#locationPopupTable').DataTable().ajax.reload(function() {});
		}

		$('#locationPopupModal').modal('show');
		selectBoxAppend(locationCdCode , "locationCd",'', "2");
	}

	// 구역목록
	function changeAreaCd(){
		$.ajax({
			url : '<c:url value="io/getAreaCd" />',
			type : 'GET',
			data : {
				'locationCd' : $('#selectLocationCd option:selected').val()
			},
			success : function(res){
				if(res.result == "ok"){
				 	var areaCdCode = new Array(); 
				 	for(var i=0; i<res.data.length; i++){
				 		var json = new Object();
						json.baseCd = res.data[i].areaCd;
						json.baseNm = res.data[i].areaNm;
						areaCdCode.push(json);
					 }
				}
				selectBoxAppend(areaCdCode , 'selectAreaCd','', '2');
				baseInfoCd = $('#selectLocationCd option:selected').val();
				$('#locationPopupTable').DataTable().ajax.reload( function () {});
			}
		})
	}

	// 위치목록
	function changeFloorCd(){
		etc3 = $('#selectAreaCd option:selected').val()
		$('#locationPopupTable').DataTable().ajax.reload( function () {});
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
	
</script>

</body>
<

/html>
