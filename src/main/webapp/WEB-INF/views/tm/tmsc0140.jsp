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
		<a href="<c:url value="tmsc0210"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0060"><p class="mo_main_title">수입검사</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">승인일</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input class="form-control-md" type="text" id="apDate" disabled />
						<button onclick="fnPopUpCalendar(apDate,apDate,'yyyy-mm-dd');" class="btn btn-secondary input-sub-search-md" type="button" id="btnCalendar">
							<span class="oi oi-calendar" style="font-size: 13px;"></span>
						</button>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">승인인</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="hidden" id="apChargr" name="apChargr">
						<input type="text" class="form-control-md" id="apChargrNm" name="apChargrNm" style="min-width:100%" disabled> 
						<button type="button" class="btn btn-primary input-sub-search-md" id="btnApChargr" onClick="selectApChargr()">
							<span class="oi oi-magnifying-glass" style="font-size: 15px;"></span>
						</button>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">Barcode No</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
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
					<button type="button" class="btn btn-success float-right" id="btnApprove">승인</button>
					<!-- <button type="button" class="btn btn-secondary float-right" id="btnCancel">취소</button> -->
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
								<th style="min-width: 20px">No.</th>
								<th style="min-width: 140px">Barcode NO</th>
								<th style="min-width: 80px">CODE</th>
								<th style="min-width: 40px">REV</th>
								<th style="min-width: 100px">ITEM</th>
								<th style="min-width: 220px">SPEC</th>
								<th class="text-center" style="min-width: 60px">가입고량</th>
								<th style="min-width: 90px">가입고일</th>
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
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>
<%@include file="../layout/bottom.jsp" %>
<script>

	$(document).attr("title","수입검사 승인처리");
	let menuAuth = 'tmsc0140';
	var serverDateFrom = "${serverDateFrom}"
	var serverDateTo = "${serverDateTo}"
	var serverDate = "${serverDate}"
	var userNm = "${userNm}"
	var userNumber = "${userNumber}"
	var barcodeNo = null;
	var apGubun = 'II';
	var barcodeNoVal = null;
	var preInWhsQty = null;
	var preInWhsDate = null;
	var count = 0;

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로

	//승인여부
	$.ajax({
		url : '<c:url value="sm/approvalAuthAdmList"/>',
		type: 'GET',
		dataType: 'json',
		async: false,
		data: {
			'userId' 	: function() { return userId;},
			'apprDesc'	: function() { return menuUrl;}
		},
		success: function(res) {
			let data = res.data;
			
			console.log(data.length);
			console.log(data);
			if (data.length != 0) {
				console.log('hi');
				$('#btnApprove').removeClass('d-none');
// 				$('#btnCancle').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
// 				$('#btnCancle').addClass('d-none');
			}
		},
	});
	
	$('#apDate').val(serverDate);
	$('#barcodeNo').focus();
	$('#apChargrNm').val(userNm);
	$('#apChargr').val(userNumber);

	$.fn.dataTable.ext.errMode = 'none';
	let barcodeDtlTable = $('#barcodeDtlTable').on( 'error.dt', function ( e, settings, techNote, message ) {
		if(techNote == 7) {
			toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.", '', {timeOut: 5000});
			location.href = "/";
		}
	}).DataTable({
			language : lang_kor,		
			paging : false,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			searching : false,
			pageLength : 20,
			ajax : {
				url : '<c:url value="tm/inOutWhsAdmRead"/>',
				type : 'GET',
				data : {
					//'startDate'  : function(){return serverDateFrom.replace(/-/g,'')},
					//'endDate'    : function(){return serverDateTo.replace(/-/g,'')},
					'barcodeNo'  :  function(){return barcodeNoVal},
					}	

			},	
			rowId : 'lotNo',
			columns : [ 
					{
						render : function(data, type, row, meta) {
							return meta.row+ meta.settings._iDisplayStart+ 1;
						},
						'className' : 'text-center'
					},
					{data : 'barcodeNo',
						render: function(data, type, row, meta) {	
							if(data!=null){
			    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="max-width:100%;text-align:center;" disabled>';	
							} else{
								return '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="max-width:100%;text-align:center;" disabled>' ;	
							}		    			
			    		}
		    		},
					{data : 'partCd',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="text" class="form-control" name="partCd" value="'+data+'" style="max-width:100%;text-align:center;" disabled>';		
							} else{
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+partCd+'" disabled>';	
							}		    			
			    		}
		    		},
					{data : 'partRev',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partRev" value="'+data+'" disabled>';		
							} else{
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partRev" value="'+partRev+'" disabled>';	
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
					{data : 'partSpec',
		    			render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partSpec" value="'+data+'" disabled>';			
							} else{
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partSpec" value="'+partSpec+'" disabled>';	
							}		
						}
					},
					{data : 'preInWhsQty',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preInWhsQty" value="'+addCommas(data)+'" disabled>';			
							} else{
								return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preInWhsQty" value="'+preInWhsQty+'" disabled>';	
							}				
			    		}, "className": "text-right"
					},
					{data : 'preInWhsDate',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="preInWhsDate" value="'+moment(data).format('YYYY-MM-DD')+'" disabled>';			
							} else{
								return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="preInWhsDate" value="'+moment(preInWhsDate).format('YYYY-MM-DD')+'" disabled>';	
							}		
						}
					}
			],
	        columnDefs: [
		    ], 
		    order: [
		        [ 0, 'asc' ]               
		    ],
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
	            	url: 'tm/inOutWhsAdmRead',
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
		                    preInWhsQty = addCommas(data.preInWhsQty);
		                    preInWhsDate = data.preInWhsDate;
		                    
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

	
	// 승인 처리
	$('#btnApprove').on('click',function() {
		var dataArray = new Array();
		var check=true;

		//처리중..
		$('#my-spinner').show();
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
			var rowData = new Object();
			
			rowData.apCd= $(this).find('td input[name=barcodeNo]').val();	
			rowData.apGubun= apGubun;
			rowData.apDate= $('#apDate').val().replace(/-/g,'');
			rowData.apChargr= $('#apChargr').val();
			rowData.apQty= $(this).find('td input[name=preInWhsQty]').val().replace(/,/g,'');	
			rowData.sourceNo= $('#barcodeNo').val();
			
	        dataArray.push(rowData);
		});
		
		if(check == true){
			$.ajax({
				url : '<c:url value="tm/approveProcAdmCreate"/>',
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
						$('#btnCancel').addClass('d-none');
						$('#btnNew').removeClass('d-none');
						
						toastr.success('수입검사 승인처리되었습니다.');

						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val('');
						
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
	

	//담당모달
	var userPopUpTable;
   	function selectApChargr(){   	
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
		   	$('#apChargrNm').val(data.userNm);
		   	$('#apChargr').val(data.userNumber);
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
<

/html>
