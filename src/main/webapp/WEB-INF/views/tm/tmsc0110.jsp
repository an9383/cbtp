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
		<a href="/tmsc0200" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0070"><p class="mo_main_title">개별출고</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
			<div class="col-12 row p-1">
				<div class="col-3 mo_sort_title">출고일</div>
				<div class="form-group input-sub col-9 m-0 p-0">
				<input class="form-control-md" type="text" id="preOutWhsDate" disabled />
				<button onclick="fnPopUpCalendar(preOutWhsDate,preOutWhsDate,'yyyy-mm-dd');" class="btn btn-secondary input-sub-search-md" type="button" id="btnCalendar">
					<span class="oi oi-calendar" style="font-size: 13px;"></span>
				</button>
				</div>
			</div>
			<div class="col-12 row p-1">
				<div class="col-3 mo_sort_title">담당</div>
				<div class="form-group input-sub col-9 m-0 p-0">
					<input type="hidden" id="preWorkCharger" name="preWorkCharger">
					<input type="text" class="form-control-md" id="preWorkChargerNm" name="preWorkChargerNm" style="min-width:100%" disabled> 
					<button type="button" class="btn btn-primary input-sub-search-md" id="btnItemChargr" onClick="selectItemChargr()">
						<span class="oi oi-magnifying-glass" style="font-size: 15px;"></span>
					</button>
				</div>
			</div>
				<!-- 
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">작지번호</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control" id="workOrdNo" name="workOrdNo" style="min-width:100%" disabled>
						<button type="button" class="btn btn-primary input-sub-search" id="btnWorkOrdNo" onClick="selectWorkOrd()">
							<span class="oi oi-magnifying-glass"></span>
						</button>
					</div>
						<div class="input-sub m-0" style="min-width:100%;">
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">담당</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="hidden" id="preWorkCharger" name="preWorkCharger">
						<input type="text" class="form-control" id="preWorkChargerNm" name="preWorkChargerNm" style="min-width:100%" disabled> 
						<button type="button" class="btn btn-primary input-sub-search" id="btnItemChargr" onClick="selectItemChargr()">
							<span class="oi oi-magnifying-glass"></span>
						</button>
					</div>
						<div class="input-sub m-0" style="min-width:100%;">
					</div>
				</div>
				 -->
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">Barcode NO</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">비고</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="inWhsDesc">
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
								<th style="min-width: 100px">ITEM</th>
								<th style="min-width: 100px">단위</th>
								<th style="min-width: 55px">남은 출고량</th>
								<th style="min-width: 55px">출고량</th>
								<th style="min-width: 70px">창고</th>
								<th style="min-width: 60px">구역/위치</th>
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
<%@include file="../layout/bottom.jsp" %>

<script>

	$(document).attr("title","개별출고");
	let menuAuth = 'tmsc0110';
	var serverDate = "${serverDate}"
	var approvalCd = null;
	var barcodeNo = null;
	var locationCd = null;
	var itemCd=null;
	var itemRev=null;
	var statusCd = 'O';
	var createOrUpdate = 'create';
	var checkPreOutWhsDate = null;
	var checkPreWorkCharger = null;
	var itemNm = '';
	var count = 0;
	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	
	$('#preOutWhsDate').val(serverDate);
	$('#btnWorkOrdNo').focus();
	$('#preWorkCharger').val(userNumber);
	$('#preWorkChargerNm').val(userNm);
	
	
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
			url : '<c:url value="io/barcodeCommonList"/>',
			type : 'GET',
			data : {
				'menuAuth'	: menuAuth,
				'barcodeNo' : function(){return $('#barcodeNo').val()}
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
						var html  = '<input type="text" class="form-control" id="barcodeNo'+meta.row+'" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>' ;
						html += '<input type="hidden" name="lotNo" value="'+row['lotNo']+'">';
						html += '<input type="hidden" name="poNo" value="'+row['poNo']+'">';
						html += '<input type="hidden" name="poSeq" value="'+row['poSeq']+'">';
						html += '<input type="hidden" name="inSeq" value="'+row['inSeq']+'">';
						html += '<input type="hidden" name="outSeq" value="'+row['outSeq']+'">';
						return html;
					} else{
						var html  = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>' ;
						html += '<input type="hidden" name="lotNo" value="'+lotNo+'">';
						html += '<input type="hidden" name="poNo" value="'+poNo+'">';
						html += '<input type="hidden" name="poSeq" value="'+poSeq+'">';
						html += '<input type="hidden" name="inSeq" value="'+inSeq+'">';
						html += '<input type="hidden" name="outSeq" value="">';
						return html;
					}		    			
	    		}
			},
			{data : 'partCd',
				render: function(data, type, row, meta) {	
					if(data!=null){
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="partRev" value="'+row['partRev']+'">';
						html += '<input type="hidden" name="partGubun" value="'+row['partGubun']+'">';
						return html;
					} else{
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+partCd+'" disabled>';	
						html += '<input type="hidden" name="partRev" value="'+partRev+'">';
						html += '<input type="hidden" name="partGubun" value="'+partGubun+'">';
						return html;
					}		    			
	    		}
			},
			{data : 'partNm',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partNm" value="'+data+'" disabled>';
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partNm" value="'+partNm+'" disabled>';
					}		
    			}
			},
			{data : 'partUnit',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partUnit" value="'+data+'" disabled>';
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partUnit" value="'+partUnit+'" disabled>';
					}		
    			}
			},
			{data : 'remainQty',
				render: function(data, type, row, meta) {	
					if(data!=null){
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+addCommas(Math.floor(data))+'" disabled>';	
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+addCommas(remainQty)+'" disabled>';	
					}			    			
	    		}
			},
			{data : 'preOutQty',
				render: function(data, type, row, meta) {	
					if(data!=null){
						if(row['statusCd']=='P') {
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="'+addCommas(Math.floor(data))+'" disabled>';	
						}
						else {
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="'+addCommas(Math.floor(data))+'">';
						}
					} else{
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="">';	
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
    
	//바코드 스캔시
	$("#barcodeNo").keypress(function (e) {
	    if (e.which == 13){
	    	
			if(!$.trim($('#barcodeNo').val())){
				$('#barcodeNo').focus();
				$('#barcodeNo').val('');
				toastr.warning('바코드를 스캔해주세요.');
				check=false;
				return false;
			}
			/* if($('#barcodeNo').val().length != 21) {
				$('#barcodeNo').focus();
				$('#barcodeNo').select();
				toastr.warning('잘못된 바코드 입니다.');
				check=false;
				return false;
			} */

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
			 		url: '<c:url value="io/barcodeCommonList"/>',
	                type: 'GET',
	                data: {
	                	'barcodeNo'  :  $('#barcodeNo').val(),
	                	'itemCd'  :  function(){return itemCd},      
	                	'itemRev'  :  function(){return itemRev},  
	                },
	                success: function (res) {
	                    let data = res.data;
	                    if (res.result == 'ok') {
	                    	poNo = data.poNo;
	                    	poSeq = data.poSeq;
	                    	inSeq = data.inSeq;
	                    	poRev = data.poRev;
	                    	barcodeNo = data.barcodeNo;
	                    	lotNo = data.lotNo;
			                partCd = data.partCd;
			                partRev = data.partRev;
			                partNm = data.partNm;
			                partUnit = data.partUnit;
			                partGubun = data.partGubun;
			                remainQty = data.remainQty;
			                locationNo= data.locationNo;
			                locationCd = data.locationCd;
			                locationNm = data.locationNm;
			                areaCd = data.areaCd;
			                floorCd = data.floorCd;
			                areaNm = data.areaNm+" / "+data.floorCd;
			                
			                
	                    	$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
	                    	//$('#btnWorkOrdNo').attr('disabled', true);
	                    	//$('#btnItemChargr').attr('disabled', true);
							$('#btnCalendar').attr('disabled', true);
							$('#btnAllClear').attr('disabled', false);
							$('#btnLineClear').attr('disabled', false);
							$('#btnSave').attr('disabled', false);
							$('#barcodeNo').select();
							$('#btnSave').removeClass('d-none');
							count += 1;
							$('#count').text(count);
	                        toastr.success("추가되었습니다.");
	                        
	                    }else{
	                    	if(res.result == 'empty') {
		                    	toastr.warning("등록된 바코드가 아닙니다. 확인해주세요.");
		                    }else if(res.result == 'notInWhs') {
		                    	toastr.warning("입고된 바코드가 아닙니다. 확인해주세요.");  //현재까지 입고만 예외처리함
		                    }else if(res.result == 'notRemainQty') {
		                    	toastr.warning("남은 수량이 없는 바코드입니다. 확인해주세요.");
		                    }else if(res.result == 'already') {
		                    	toastr.warning("이미 생산 투입된 바코드입니다. 확인해주세요.");
		                    }else if(res.result == 'error') {
		                    	toastr.error(res.message, '', {timeOut: 5000});
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
		
        if ( !$.trim($('#preOutWhsDate').val()) ) {
            toastr.warning('출고일을 선택해주세요.');
            $('#preOutWhsDate').focus();
            return false;
        }
	
		if(!$.trim($('#preWorkChargerNm').val())){
			toastr.warning('담당을 선택해주세요.');
			$('#btnItemChargr').focus();
			return false;
		}

		//처리중..
		$('#my-spinner').show();
		
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if($(this).find('td input[name=preOutQty]').val()=='' || $(this).find('td input[name=preOutQty]').val()=='0') {
				toastr.warning("출고량을 확인해주세요.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;
				return false;
			}

			if($(this).find('td input[name=preOutQty]').val().replace(/,/g,'')>$(this).find('td input[name=remainQty]').val().replace(/,/g,'')) {
				toastr.warning("출고량을 초과하였습니다.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;

				//처리완료..
				$('#my-spinner').hide();
				
				return false;
			}
			
			var rowData = new Object();
			
			rowData.preOutWhsDate = $('#preOutWhsDate').val().replace(/-/g,'');
			rowData.preWorkCharger = $('#preWorkCharger').val();
			rowData.inWhsDesc= $('#inWhsDesc').val();
			
			rowData.poNo = $(this).find('td input[name=poNo]').val();
			rowData.poSeq = $(this).find('td input[name=poSeq]').val();
			rowData.inSeq= $(this).find('td input[name=inSeq]').val();
			rowData.outSeq= $(this).find('td input[name=outSeq]').val();
			rowData.lotNo = $(this).find('td input[name=lotNo]').val();
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.partCd = $(this).find('td input[name=partCd]').val();
			rowData.partRev = $(this).find('td input[name=partRev]').val();
			rowData.partGubun = $(this).find('td input[name=partGubun]').val();
			rowData.preOutQty = $(this).find('td input[name=preOutQty]').val().replace(/,/g,'');

			rowData.locationNo = $(this).find('td input[name=locationNo]').val();
			rowData.locationCd = $(this).find('td input[name=locationCd]').val();
			rowData.areaCd = $(this).find('td input[name=areaCd]').val();
			rowData.floorCd = $(this).find('td input[name=floorCd]').val();
			
			
	        dataArray.push(rowData);
		});

		//$('#my-spinner').show();
		
		if(check == true){
			$.ajax({
				url : '<c:url value="io/preOutWhsAdmCommonCreate"/>',
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
	                    $('#inWhsDesc').attr('disabled', true);
	                    $('#btnItemChargr').attr('disabled', true);
						$('#btnCancel').addClass('d-none');
						$('#btnNew').removeClass('d-none');
						 $('input[name=preOutQty]').attr('disabled', true);
						toastr.success('자재출고 저장되었습니다.');
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
		$('#barcodeNo').attr('disabled', false);
		$('#btnWorkOrdNo').attr('disabled', false);
		$('#btnItemChargr').attr('disabled', false);
		$('#inWhsDesc').attr('disabled', false);
		$('#btnSave').attr('disabled', true);
		$('#btnAllClear').attr('disabled', true);
		$('#btnLineClear').attr('disabled', true);
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#preWorkCharger').val('');
		$('#preWorkChargerNm').val('');
		$('#barcodeNo').val('');
		$('#btnSelEquipCode').focus();
		$('#preOutWhsDate').val(serverDate);
		count = 0;
		$('#count').text(count);
	});

	//저장 완료 후 새로등록
	$('#btnNew').on('click', function() {
		$('#btnCalendar').attr('disabled', false);
		$('#barcodeNo').attr('disabled', false);
		$('#btnWorkOrdNo').attr('disabled', false);
		$('#btnItemChargr').attr('disabled', false);
		$('#inWhsDesc').attr('disabled', false);
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#workOrdNo').val('');
		$('#preWorkCharger').val('');
		$('#preWorkChargerNm').val('');
		$('#barcodeNo').val('');
		$('#inWhsDesc').val('');
		$('#barcodeNo').focus();
		$('#preOutWhsDate').val(serverDate);
		$('#btnNew').addClass('d-none');
		$('#btnCancel').removeClass('d-none');
		count = 0;
		$('#count').text(count);
	});

  	//작업지시번호 목록 조회 팝업
 	var workOrdPopUpTable;
 	function selectWorkOrd(){	   	
		if(workOrdPopUpTable == null || workOrdPopUpTable == undefined)	{
			//작지상세 테이블 
			 workOrdPopUpTable = $('#workOrdPopUpTable').DataTable({
				language : lang_kor,		
				paging : true,
				searching : false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth' : 'posc0010'
					},
				},
				rowId : 'workOrdNo',
				columns : [ 				
						{data : 'workOrdNo'},	
						{data : 'itemGubunNm'},	
						{data : 'itemNm'},	
						{data : 'ordLotNo'},
						{data : 'workOrdQty'},						
				],
				columnDefs: [
		        	{ targets: [4], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3], className: 'text-center-td' },
		        	{ targets: [4], className: 'text-right-td' }
		        ],
			    order: [
			        [ 0, 'asc' ]
			    ],
			    
			});
			
		    $('#workOrdPopUpTable tbody').on('click', 'tr', function () {
			    console.log('dd');
		    	var data = workOrdPopUpTable.row( this ).data();
				$('#workOrdNo').val(data.workOrdNo);
				itemCd = data.itemCd;
				itemRev = data.itemRev;
				$('#workOrdPopUpModal').modal('hide');		
			});
			
		}else{
			$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrdPopUpModal').modal('show');		
   	}

 	//담당모달
	var userPopUpTable;
   	function selectItemChargr(){   		
   		userPopUpTable = $('#userPopUpTable').DataTable({		        
			language: lang_kor,
			lengthChange : false,
			destroy:true,
			paging: true,
			info: true,
			ordering: true,
			processing: true,
			autoWidth: false,
			ajax : {
				url : '<c:url value="/sm/matrlUserDataList"/>',
				type : 'GET',
				data : {}
			},
			rowId : 'userNumber',
			columns: [
		    	{ data: 'userNm', 'className':'text-center-td' },
		    	{ data: 'departmentNm', 'className':'text-center-td' },
		    	{ data: 'postNm', 'className':'text-center-td' },
		    	{ data: 'chargrDutyNm', 'className':'text-center-td' },
		    	{ data: 'workplaceNm', 'className':'text-center-td' },
		    	{ data: 'userDesc', 'className':'text-center-td' }
		  	],
			columnDefs: [
		    	{"className": "text-center", "targets": "_all"},
			],
			order: [
				[ 0, 'asc' ]
			],
		});
		
		$('#userPopUpTable tbody').on('click', 'tr', function () {
		   	var data = userPopUpTable.row( this ).data();	
		   	$('#preWorkChargerNm').val(data.userNm);
		   	$('#preWorkCharger').val(data.userNumber);
		   	$('#userPopUpModal').modal('hide');		    	
		});
		
		$('#userPopUpModal').modal('show');
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
</html>
