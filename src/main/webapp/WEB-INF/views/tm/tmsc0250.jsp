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
		<a href="<c:url value="/tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0250"><p class="mo_main_title">출하요청</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">승인일</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input class="form-control-md" type="date" id="apDate"/>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">발주처</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="hidden" class="form-control" id="poCorpCd" name="ordCorpCd">
						<input type="text" class="form-control-md" id="poCorpNm" name="ordCorpNm" style="min-width:100%" disabled>
						<button type="button" class="btn btn-primary input-sub-search-md" name="btnPoCorpCd" onClick="selectPoCorpCd()">
							<span class="oi oi-magnifying-glass" style="font-size: 15px"></span>
						</button>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">LOT NO</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
					</div>
				</div>
				
	</div>
	<!--==버튼영역-->
	<div class="mo_btnbox pl-2 pr-2">
				<div class="float-left">
					<button type="button" class="btn btn-danger float-right" id="btnDelete" disabled>라인삭제</button>
					<button type="button" class="btn btn-danger float-right mr-2" id="btnAllDelete" disabled>전체삭제</button>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-success float-right mr-1" disabled id="btnSave">요청</button>
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
					<table id="barcodeDtlTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th style="min-width: 20px">No.</th>
								<th style="min-width: 100px">생산LOT NO</th>
								<th style="min-width: 130px">품번</th>
								<th class="text-center-th" style="min-width: 50px">출고요청수량</th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="table-responsive">
					<table id="barcodeViewTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th style="min-width: 220px">품번</th>
								<th class="text-center-th" style="min-width: 80px">출고요청수량</th>
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
						<!-- <span class="mo_sum_font_lg" id="count">0</span> <label>개수</label> -->
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

	$(document).attr("title","출하요청");
	let menuAuth = 'tmsc0250';
	var serverDateFrom = "${serverDateFrom}"
	var serverDateTo = "${serverDateTo}"
	var serverDate = "${serverDate}"
	var userNm = "${userNm}"
	var userNumber = "${userNumber}"
	var barcodeNo = null;
	var apGubun = 'PA';
	var barcodeNoVal = null;
	var count = 0;
	var pairQty = null;

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	
	$('#apDate').val(serverDate);
	$('#barcodeNo').focus();

	$.fn.dataTable.ext.errMode = 'none';
	let barcodeDtlTable = $('#barcodeDtlTable').on( 'error.dt', function ( e, settings, techNote, message ) {
		}).DataTable({
			language : lang_kor,		
			paging : false,
			info : false,
			ordering : false,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			searching : false,
			scrollY : "200px",
			pageLength : 20,
			ajax : {
				url : '<c:url value="bs/deliveryOrderAdmReset"/>',
				type : 'GET',
				data : {
					//'startDate'  : function(){return serverDateFrom.replace(/-/g,'')},
					//'endDate'    : function(){return serverDateTo.replace(/-/g,'')},
					//'barcodeNo'  :  function(){return barcodeNoVal},
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
					{data : 'lotNo','className' : 'text-center'},
					{data : 'itemCd','className' : 'text-center'},
					{data : 'fairQty','className' : 'text-right'},
			],
	        columnDefs: [
		    ], 
		    order: [
		    ],
		});
	
	let barcodeViewTable = $('#barcodeViewTable').on( 'error.dt', function ( e, settings, techNote, message ) {
		}).DataTable({
			language : lang_kor,		
			paging : false,
			info : false,
			ordering : false,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			searching : false,
			scrollY : "110px",
			pageLength : 20,
			ajax : {
				url : '<c:url value="bs/deliveryOrderAdmReset"/>',
				type : 'GET',
				data : {
					//'startDate'  : function(){return serverDateFrom.replace(/-/g,'')},
					//'endDate'    : function(){return serverDateTo.replace(/-/g,'')},
					//'barcodeNo'  :  function(){return barcodeNoVal},
					}	

			},	
			rowId : 'itemSeq',
			columns : [ 
					{data : 'itemCd','className' : 'text-center'},
					{data : 'fairQty',
						render : function(data, type, row, meta) {
							return '<span id="fairQty_'+meta.row+'">'+data+'</span>';
						}, 'className' : 'text-right'
					},
			],
	        columnDefs: [
		    ], 
		    order: [
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
	    	if($('#barcodeNo').val().length!=12) {
	    		toastr.warning('바코드를 확인주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
		    }
	    	
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
	    	//이미 추가한 바코드인지 확인
			if($('#barcodeDtlTable').DataTable().rows().count()!=0) {
				$('#barcodeDtlTable tbody tr').each(function(index, item) {
					if(barcodeDtlTable.row(index).data().lotNo==$('#barcodeNo').val()){
						$('#barcodeNo').focus();
						$('#barcodeNo').select();
						toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
						check2 = false;
						return false;
					}
				});
			} 
	        if(check2 == true){
			 	$.ajax({
	            	url: 'po/pdaLotNoScan',
	                type: 'GET',
	                data: {
	                	'menuAuth'	 	: 	menuAuth,
	                	'ordLotNo'  	:  	$('#barcodeNo').val(),
	                },
	                success: function (res) {
	                    let data = res.data;
	                    if (res.result == 'ok') {
		                    $('#barcodeDtlTable').DataTable().row.add({
		    	    			'lotNo'		: data.ordLotNo,
		    	    			'itemSeq' 	: data.itemSeq,
		    	    			'itemCd'	: data.itemCd,
		    	    			'fairQty'	: data.fairQty,
		    				}).draw(false);
		    				let rowAdd = '';

		    				//view 테이블에 같은 품번이면 수량 더하기 아니면 행 추가
		    				if($('#barcodeViewTable').DataTable().rows().count()!=0) {
			    				//같은 품번이 있는지 확인 없으면 추가
		    					$('#barcodeViewTable tbody tr').each(function(index, item) {
			        				if(barcodeViewTable.row( this ).data().itemSeq==data.itemSeq){
				        				$('#fairQty_'+index).text(parseFloat($('#fairQty_'+index).text()) + parseFloat(data.fairQty));
					        			rowAdd = 'ok';	
			        				}
			        			});
			        			if(rowAdd =='') {
			        				$('#barcodeViewTable').DataTable().row.add({
				    	    			'lotNo'		: data.ordLotNo,
				    	    			'itemSeq' 	: data.itemSeq,
				    	    			'itemCd'	: data.itemCd,
				    	    			'fairQty'	: data.fairQty,
				    				}).draw(false);
				        		}
		    				} else {
		    					$('#barcodeViewTable').DataTable().row.add({
			    	    			'lotNo'		: data.ordLotNo,
			    	    			'itemSeq' 	: data.itemSeq,
			    	    			'itemCd'	: data.itemCd,
			    	    			'fairQty'	: data.fairQty,
			    				}).draw(false);
			    			}
			    			$('#btnSave').attr('disabled', false);
			    			$('#btnDelete').attr('disabled', false);
			    			$('#btnAllDelete').attr('disabled', false);
	                        toastr.success("추가되었습니다.");
	                        $('#barcodeNo').val('');
	                    } else if(res.result=="fail"){
	                    	toastr.warning(res.message);
	                    	$('#barcodeNo').select();
	                    } else if(res.result=="fifo"){
	                    	$('#fifoBtnModal').modal('show');
	                    } else if(res.result == 'error') {
	                    	toastr.warning(res.message, '', {timeOut: 5000});
	                    }  
		             },
		             complete:function(){
		                    //$('#btnAddConfirmLoading').addClass('d-none');
		             }
		        });
	        }
	    }
	});


	$('#btnDelete').on('click',function() {

		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		if(lineCheck == false) {
			toastr.warning("라인을 선택해 주세요.");
			return false;
		}
		console.log($('#barcodeDtlTable').DataTable().row('.selected').data().itemSeq)
		console.log($('#barcodeDtlTable').DataTable().row('.selected').data().fairQty)
		
		$('#barcodeViewTable tbody tr').each(function(index, item) {
			console.log(barcodeViewTable.row( this ).data().itemSeq)
			if(barcodeViewTable.row( this ).data().itemSeq==$('#barcodeDtlTable').DataTable().row('.selected').data().itemSeq){
				if(parseFloat($('#fairQty_'+index).text()) - parseFloat($('#barcodeDtlTable').DataTable().row('.selected').data().fairQty)==0) {
					console.log("데이터 0")
					$('#barcodeViewTable').DataTable().row(this).remove().draw();	
				} else {
					$('#fairQty_'+index).text(parseFloat($('#fairQty_'+index).text()) - parseFloat($('#barcodeDtlTable').DataTable().row('.selected').data().fairQty));
				}
				$('#barcodeDtlTable').DataTable().row('.selected').remove().draw();				
			}
		});
		lineCheck = false;
	});

	$('#btnAllDelete').on('click',function() {
		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#barcodeViewTable').DataTable().clear().draw();

		$('#btnSave').attr('disabled', true);
		$('#btnDelete').attr('disabled', true);
		$('#btnAllDelete').attr('disabled', true);
	});
  	
  	
	// 출하요청
	$('#btnSave').on('click',function() {
		var dataArray = new Array();
		var check=true;

		//처리중..
		$('#my-spinner').show();

		if($('#poCorpCd').val()=='') {
			toastr.warning("발주처를 선택해 주세요.");
			$('#my-spinner').hide();
			return false;
		}
		
		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning("등록할 데이터가 없습니다.");
			$('#my-spinner').hide();
			return false;
		}

		$('#barcodeDtlTable tbody tr').each(function(index, item){
			var rowData = new Object();
			
			rowData.doDate = $('#apDate').val().replace(/-/g,'');
			rowData.poCorpCd = $('#poCorpCd').val();
			rowData.lotNo = barcodeDtlTable.row( this ).data().lotNo;
			rowData.itemSeq = barcodeDtlTable.row( this ).data().itemSeq;
			rowData.targetQty = barcodeDtlTable.row( this ).data().fairQty;
	        dataArray.push(rowData);
		});
		console.log(dataArray)
		if(check == true){
			$.ajax({
				url : '<c:url value="bs/deliveryOrderAdmPdaCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#btnAllDelete').attr('disabled', true);
	                	$('#btnDelete').attr('disabled', true);
	                	$('#btnSave').attr('disabled', true);                    
						toastr.success('출하요청되었습니다.');
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeViewTable').DataTable().clear().draw();
						$('#poCorpCd').val('');
						$('#poCorpNm').val('');
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

	//발주처 팝업 시작
   	var dealCorpPopUpTable4;
   	function selectPoCorpCd()
   	{	   	
		if(dealCorpPopUpTable4 == null || dealCorpPopUpTable4 == undefined)	{
			dealCorpPopUpTable4 = $('#dealCorpPopUpTable4')
			.DataTable(
					{	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
								
							},
						},
						rowId : 'dealCorpSeq',
						columns : [ 
						{
							data : 'dealCorpNm'
						}, 
						{
							data : 'dealCorpCd'
						}, 
						{
							data : 'presidentNm'
						}, 
						{
							data : 'repreItem'
						}, 
						{
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

		    $('#dealCorpPopUpTable4 tbody').on('click', 'tr', function () {
		    	var data = dealCorpPopUpTable4.row( this ).data();
				$('#poCorpCd').val(data.dealCorpCd);
				$('#poCorpNm').val(data.dealCorpNm);
                $('#dealCorpPopUpModal4').modal('hide');
			});
		}else{
			$('#dealCorpPopUpTable4').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal4').modal('show');		
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
