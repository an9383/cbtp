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
		<a href="/tmsc0100" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0070"><p class="mo_main_title">현품표 조회</p></a>
	</header>
	<div class="pt-0">
		<button type="button" class="btn btn_item_gubun" id="item_001" onclick="gubunSelect('001')" style="height: 40px;width:49%;background: #F7C46C;color: black;border: 1px solid black;font-size: 15px;">원재료</button>
		<button type="button" class="btn btn_item_gubun" id="item_002" onclick="gubunSelect('002')" style="height: 40px;width:50%;background: #F3DFBB;color: black;border: 1px solid black;font-size: 15px;">제품</button>
	</div>
	<!--====-sortbox-->
	<div class="mo_sortbox mb-0">
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">LOT NO</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너로 입력">
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">품명</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="itemNm" inputmode="none" disabled>
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">수량</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="remainQty" inputmode="none" disabled>
			</div>
		</div>
	</div>
	<div class="mo_sortbox" id="messageDiv" style="height: 30px;background: white;text-align: center; line-height:30px;">
		<span id="message" style="font-size: 15px; font-weight: bold">LOT를 스캔해주세요.</span> <!-- 노란색 : #ffdf00  이전 LOT 가 있습니다. 파란색 : #36b9ff 투입 가능한 LOT 입니다.-->
	</div>
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
								<th style="min-width: 60px">
									<span class="label-date" id="label_001">입고일자</span>
									<span class="label-date d-none" id="label_002">생산일자</span>
								</th>
								<th class="text-center" style="min-width: 50px;">수량</th>
								<th style="min-width: 100px">LOT NO</th>
								<th style="min-width: 70px">위치</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--==end==card-->
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

	$(document).attr("title","현품표 조회");
	let menuAuth = 'tmsc0070';

	let btnView;			//삭제할 수 있는 행 클릭 여부
	let sideView = 'add';
	let btnVal = 'add';

	var serverDate = "${serverDate}";
	$('#preOutWhsDate').val(serverDate);
	$('#btnWorkOrdNo').focus();
	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	$('#preWorkCharger').val(userNumber);
	$('#preWorkChargerNm').val(userNm);
	var barcodeNo;
	var tableIdx=null;

	var lotNo=null;
	var poNo = null;
	var poSeq = null;
	var inSeq = null;
	var barcodeNo = null;
	var locationCd = "001";
	
	var ordCorpNmVal=null;
	var contDtlNoVal=null;
	var dlvDate=null;
	var workOrdDate=null;
	var workOrdQtyVal=null;
	var partGubunVal=null;
	var workOrdNoVal=null;
	var itemCdVal=null;
	var itemRevVal=null;
	var workOrdNo=null;

	var itemCd = null;
	var itemSeq = null;
	var upperItemSeq = null;
	var itemGubun = null;
	var itemNm = null;
	var itemUnit = null;
	var itemModel = null;

	
	//바코드 목록조회
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		scrollY : "350px",
		ajax : {
			url : '<c:url value="io/barcodeList"/>',
			type : 'GET',
			data : {
				'barcodeNo'  : function(){return $('#barcodeNo').val()},
				'mainGubun'  : function(){return '001'}
			},
		},
		rowId : 'barcodeNo',
		columns : [
			{
				data : 'inDate',
				render: function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
	    		}
			},
			{
				data : 'remainQty',
				render: function(data, type, row, meta) {
					return data;	
	    		},'className' : 'text-right'
			},
			{data : 'barcodeNo'},
			{
				render: function(data, type, row, meta) {
					return row['locationNm']+" / "+row['areaNm']+" / "+row['floorNm'];
	    		}
			},
		 ],
		order : [],
		
	});  

	//상세테이블 클릭시
	$('#barcodeDtlTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#barcodeDtlTable').DataTable().row(this).index();
		btnView = 'delete';
	});

	
	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check = true;
		
		if(e.keyCode == 13){

			if(locationCd==""){
				toastr.warning('원재료/제품을 스캔해주세요.');
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

			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').select();
					check=false;
					return false;
				}
			});

			if(check==true){
			 	$.ajax({
	            	url: '<c:url value="io/barcodeList"/>',
	                type: 'GET',
	                data: {
	                	'workOrdNo'  :  $('#workOrdNo').val(),
	                	'barcodeNo'  :  $('#barcodeNo').val(),
	                	'locationCd' :  function(){return locationCd},
	                	'mainGubun'  : function(){return '001'}
	                },
	                success: function (res) {
	                    let data = res.data;
	                    console.log(res.itemNm);
	                    console.log(rmDecimal(res.remainQty));
	                    console.log(res.message);
	                    console.log(res.result);

	                    
	                    $('#barcodeNo').select();
	                    $('#itemNm').val(res.itemNm);
  	    				$('#remainQty').val(rmDecimal(res.remainQty));
  	    				$('#message').text(res.message);
  	    				$('#barcodeDtlTable').DataTable().clear().draw();
  	    				
	                    if (res.result == 'ok') {
	                        $('#barcodeNo').focus();
			            	$('#messageDiv').css('background','#36b9ff');
			            }else if(res.result == "fifo"){
			            	
			            	$('#messageDiv').css('background','#ffdf00');
			            	for(var i=0; i<data.length; i++){
			            		$('#barcodeDtlTable').DataTable().row.add({
			            			'inDate'	: data[i].inDate,
			    	    			'remainQty'	: rmDecimal(data[i].realQty),
			    	    			'barcodeNo'	: data[i].barcodeNo,
			    	    			'locationNm': data[i].locationNm,
			    	    			'areaNm'	: data[i].areaNm,
			    	    			'floorNm'	: data[i].floorNm,
			    				}).draw(false);
				            }

			            }else if (res.result == "fail"){
			            	$('#messageDiv').css('background','#ff7400');
			            	$('#itemNm').val("");
	  	    				$('#remainQty').val("");
		                }else {
		                	toastr.error(res.message, '', {timeOut: 5000});
			            }
			            
	                    if(barcodeDtlTable.data().count()>0){
		                   	$('#btnLineClear').attr('disabled', false);
							$('#btnAllClear').attr('disabled', false);
							$('#btnSave').attr('disabled', false);
				        }
		             },
		             complete:function(){
		             }
		        });
			}
		}
	});

	// 라인삭제버튼 
	$('#btnLineClear').on('click', function() {
		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning('삭제할 데이터가 없습니다.');
			return false;
		}
		if(btnView != 'delete') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#barcodeDtlTable').DataTable().rows(tableIdx).remove().draw();
		
		if(barcodeDtlTable.data().count() == 0){
			$('#btnSave').attr('disabled', true);
		}
		btnView = "";
			
	});

	// 전체삭제버튼 
	$('#btnAllClear').on('click', function() {
		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning('삭제할 데이터가 없습니다.');
			return false;
		}
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#btnSave').attr('disabled', true);
		btnView = "";
	});


	//원재료/제품 구분 버튼 클릭
    function gubunSelect(gubun){
        console.log(gubun);
        $('.btn_item_gubun').css('background','#F3DFBB');
        $('#item_'+gubun).css('background','#F7C46C');
		locationCd = gubun;
		$('#barcodeNo').focus();
		$('#barcodeNo').select();

		$('.label-date').addClass('d-none');
		$('#label_'+gubun).removeClass('d-none');
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
