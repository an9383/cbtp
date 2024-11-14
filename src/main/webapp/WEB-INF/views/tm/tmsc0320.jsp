<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/top.jsp"%>
<style>
body {
	overflow: hidden;
}
</style>
<!-- .app -->
<div class="app pda_mo_wrap"
	style="display: flex; flex-direction: column; height: 100%;">
	<header class="pda_mo_hd">
		<a href="<c:url value="/tmsc0100"/>" class="float-left"><img
			class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a
			href="/tmsc0320"><p class="mo_main_title">재고현황</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
		<div class="col-12 row p-3">
			<div class="col-3 mo_sort_title" style="font-size: 13px;">Barcode 스캔 </div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="barcodeNo"
					inputmode="none" placeholder="스캐너만 입력">
			</div>
		</div>
	</div>

	<!--==end==-sortbox-->
	<div class="mo_sortbox m-0 bg_wh" id="detailDiv">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<h5 class="pb-1" style="text-align:center;">
				<span style="text-align:center;">현 재고량</span>
				<span class="text-blue" style="text-align: center;" id="countStockQty"></span>
				</h5>
			<br>
			<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title" style="text-align:center;font-weight:bold;">구분</div>
				<div class="form-group input-sub col-9 m-0 p-0">
					<input type="text" class="form-control-md" id="itemGubunNm" name="itemGubunNm" style="min-width:100%" readonly>
				</div>
			</div>
			<div class="col-12 row p-1">
				<div class="col-3 mo_sort_title" style="text-align:center;font-weight:bold;">차종</div>
				<div class="form-group input-sub col-9 m-0 p-0">
					<input type="text" class="form-control-md" id="itemModelNm" name="itemModelNm" style="min-width:100%" readonly> 
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
				<div class="col-3 mo_sort_title" style="text-align:center;font-weight:bold;">품번</div>
				<div class="form-group input-sub col-9 m-0 p-0">
					<input type="text"style="max-width: 100%;" id="itemCd" class="form-control-md" readonly>
				</div>
			</div>
			<div class="col-12 row p-1">
				<div class="col-3 mo_sort_title" style="text-align:center;font-weight:bold;">품명</div>
				<div class="form-group input-sub col-9 m-0 p-0">
					<input type="text" class="form-control-md" id="itemNm" readonly>
				</div>
			</div>
	</div>
	<div class="container-fluid bg_wh" id="main" style="height: 100%;display: flex;flex-direction: column;">

		<!--table-->
		<!-- .table-responsive -->
		<div class="card mo_card" style="OVERFLOW-Y:auto; width:100%;">
			<div class="table-responsive">
				<table id="barcodeDtlTable" class="table table-bordered table-td-center">
					<thead class="thead-light">
						<tr>
							<th style="min-width: 20px">순번</th>
							<!-- 
							<th style="min-width: 80px">차종</th>
							<th style="min-width: 100px">품번</th>
							<th style="min-width: 100px">품명</th>
							 -->
							<th style="min-width: 70px">창고</th>
							<th style="min-width: 60px">구역/위치</th>
							<th class="text-center-th" style="min-width: 55px">재고수량</th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!--==end==card-->
		<!--==end==table-->

	</div>
	<footer class="p-2" style="margin-top: auto;">
		<div class="mo_sumbox">
			<button type="button" class="btn btn-warning float-left"
				id="btnKeyboard">자판 Off</button>
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
<script type="text/javascript"
	src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp"%>

<script>
	$(document).attr("title", "재고현황");
	let menuAuth = 'tmsc0320';
	var serverDate = "${serverDate}"
	var serverMonth = serverDate.substring(0, 7);
	let itemUnitVal = '';
	var spCdArr = new Array();

	$('#countStockQty').text("0 개");

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
		pageLength : 20,
		ajax : {
			url : '<c:url value="tm/locationGroupStockQtyList"/>',
			type : 'GET',
			data : {
				'barcodeNo'  : function(){return $('#barcodeNo').val()},
				'mainGubun'  : function(){return '002'},
			},
		},
		rowId : 'barcodeNo',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				}
			},
			/*
			{data : 'itemModel'},
			{data : 'itemCd',
				render: function(data, type, row, meta) {
					return data;  			
	    		}
			},
			{data : 'itemNm'}, 
			*/
			{data : 'locationNm',
				render: function(data, type, row, meta) {
					return data;
	    		}
			},
			{data : 'areaNm',
				render: function(data, type, row, meta) {
					return data+" / "+row['floorCd'];
					
	    		}
			},
			{data : 'realQty',
				render: function(data, type, row, meta) {
					return addCommas(Math.floor(data));	
	    		},'className' : 'text-right'
			},
		 ],
		order : [],
		drawCallback : function(){
			var api = this.api();
			let qty = 0;
			for(var i=0; i<api.data().count(); i++){
				qty = qty + api.row(i).data().realQty;
			}
			
			$('#countStockQty').text('');
			$('#countStockQty').text(addCommas(Math.floor(qty)) + ' ' + itemUnitVal);

			
			/*
			var realQty = 0;
			
			for(var i=0; i<api.data().count(); i++){
				realQty += parseInt(api.row(i).data().spQty);
			};

			$('#realQty').text(realQty);
			console.log("realQty:"+realQty)
			//inventoryDtlTable.row(0).data().spQty;
			*/
		}
	});  
	
	
	//바코드 스캔시
	$("#barcodeNo").keypress(function(e) {
	var check = true;

		if (e.which == 13) {
	
			if (!$.trim($('#barcodeNo').val())) {
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check = false;
				return false;
			}

			if (check == true) {
				$.ajax({
					url : '<c:url value="tm/countStockPaymentQty" />',
					type : 'GET',
					data : {
						'menuAuth' 	: menuAuth,
						'barcodeNo' : $('#barcodeNo').val(),
					},
					success : function(res) {
						if (res.result == 'ok') {
							let data = res.data;
							$('#itemGubunNm').val(data.itemGubunNm);
							$('#itemModelNm').val(data.itemModelNm);
							$('#itemCd').val(data.itemCd);
							$('#itemNm').val(data.itemNm);
							itemUnitVal = data.itemUnitNm;
							console.log(itemUnitVal)
							$('#countStockQty').text("0 개");
							$('#barcodeDtlTable').DataTable().ajax.reload(function() {});
							$('#barcodeNo').select();
						} else {
							if (res.result == 'empty') {
								toastr.warning("등록되지 않은 바코드입니다. 확인해주세요.");
							} else {
								toastr.warning(res.message,'',
									{timeOut : 5000}
								);
							}
						}
	
					},
					complete : function() {
						//$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}
		}
	});

	//모바일 자판 On/Off
	$('#btnKeyboard').on('click', function() {
		var inputmode = $('#spCd').attr('inputmode');
		if (inputmode == 'none') {
			$('#btnKeyboard').text("자판 On");
			$('#spCd').attr('inputmode', 'text');
		} else if (inputmode == 'text') {
			$('#btnKeyboard').text("자판 Off");
			$('#spCd').attr('inputmode', 'none');
		}
	});
</script>

</body>
</html>
