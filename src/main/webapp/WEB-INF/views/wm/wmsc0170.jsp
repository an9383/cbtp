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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">월생산계획</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="height:850px;">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="monProdPlanAdmTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="2%">
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
 								<col width="8%">
							</colgroup> 
							<thead class="thead-light">
								<tr>
									<td colspan="8" style="background: lightgray;"></td>
									<td style=" background: yellow;text-align: right;font-weight: bold;"><span id="initStockSumQty"></span></td>
									<td style=" background: yellow;text-align: right;font-weight: bold;"><span id="salesTmSumQty"></span></td>
									<td style=" background: yellow;text-align: right;font-weight: bold;"><span id="safyStockSumQty"></span></td>
									<td style=" background: yellow;text-align: right;font-weight: bold;"><span id="salesOrderSumQty"></span></td>
									<td style=" background: yellow;text-align: right;font-weight: bold;"><span id="prodTotalSumQty"></span></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th class="text-center"><input type="checkbox" class="checkbox" id="checkAll"></th>
									<th class="text-center">품목코드</th>
									<th class="text-center">구분</th>
									<th class="text-center">확정</th>
									<th class="text-center">고객사</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">작업장</th>
									<th class="text-center">기초재고</th>
									<th class="text-center">현재고</th>
									<th class="text-center">안전재고</th>
									<th class="text-center">월판매계획</th>
									<th class="text-center">생산계획</th>
									<th class="text-center">생산계획</th>
									<th class="text-center">영업오더</th>
									<th class="text-center">안전재고</th>
									
									<!-- <th class="text-center">현재고</th>
									<th class="text-center">안전재고</th>
									<th class="text-center">기초재고</th>
									<th class="text-center">영업오더</th>
									<th class="text-center">생산계획</th>
									<th class="text-center">생산계획</th> -->
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "wmsc0170";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "월생산계획");
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let serverDate = null;

	let dt = new Date();
	let year = "";
	let com_year = dt.getFullYear();
	let mon = dt.getMonth() + 1;

	let prodYear = com_year;
	let prodMon = mon < 10 ? "0" + mon : mon;
	let confirmYn = '';
	let urlData = '';
	let mainGubun = '';

    //합계컬럼
    let safyStockSumQty = 0;	//안전재고수량
    let initStockSumQty = 0;	//기초재고수량
    let salesOrderSumQty = 0;	//영업오더수량
    let prodTotalSumQty = 0;	//생산계획수량
    let endStockSumQty = 0;		//기말재고수량

/*     let safyStockSumAmt = 0;	//안전재고수량
    let initStockSumAmt = 0;	//기초재고수량
    let salesOrderSumAmt = 0;	//영업오더수량
    let prodTotalSumAmt = 0;	//생산계획수량
    let endStockSumAmt = 0;		//기말재고수량 */
	
	// 목록조회
	let monProdPlanAdmTable = $('#monProdPlanAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12 col-md-1 mr-6 mt-3'f><'col-sm-12 col-md-8 mt-3'B>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY: "60vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="wm/monProdPlanAdmList"/>',
			type : 'GET',
			data : {
				'prodYear' : function(){ return prodYear; },
				'prodMon' : function(){ return prodMon; },
				'confirmYn' : function(){ return confirmYn; },
				'urlData' : function(){ return urlData; },
				'mainGubun' : function(){ return mainGubun; },
			},
		},
		rowId : '',
		columns : [
			{//체크박스 - column 0
				render: function(data, type, row, meta) {
					return '<input type="checkbox" name="check"/>';
				}	
			},
			{//품목코드(숨김) - column 1
				data : 'itemSeq'
			}, 
			{//구분 - column 2
				data : 'mainGubunNm',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//확정여부 - column 3
				data : 'confirmYnNm',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '미확정';
					}
				}
			}, 
			{//업체명 - column 4
				data : 'itemCusNm'
			},
			{//품번 - column 6
				data : 'itemCd'
			},
			{//품명 - column 7
				data : 'itemNm'
			},
			{//작업장 - column 8
				data : 'itemWorkplaceNm'
			},
			{//기초재고 - column 9
				data : 'initStockQty',
				render : function ( data, type, row, meta ) {
					if (data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			}, 
			{//현재고 - column 10
				data : 'initStockQty',
				render : function ( data, type, row, meta ) {
					if (data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//안전재고 - column 11
				data : 'safyStockQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						let html = '';
						html += '<input type="text" class="form-control number-float0" name="safyStockQty" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
						html += '<input type="hidden" class="form-control number-float0" name="tempSalesOrderQty" style="text-align:right" value="'+row['salesOrderQty']+'" />';
						return html;
					} else {
						let html = '';
						html += '<input type="text" class="form-control number-float0" name="safyStockQty" style="text-align:right; border:none; background:white;" value="0" disabled/>';
						html += '<input type="hidden" class="form-control number-float0" name="tempSalesOrderQty" style="text-align:right" value="'+row['salesOrderQty']+'" />';
						return html;
					}
				},
				'className' : 'text-right'
			}, 
			{//영업오더 - column 12
				data : 'salesOrderQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="salesOrderQty" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return '<input type="text" class="form-control number-float0" name="salesOrderQty" style="text-align:right; border:none; background:white;" value="0" disabled/>';
					}
				},
				'className' : 'text-right'
			},
			{//생산계획 - column 13
				data : 'prodTotalQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="prodTotalQty" style="text-align:right" value="'+rmDecimal(data)+'" />';
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//생산계획(숨김) - column 14
				data : 'prodTotalQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//영업오더(숨김) - column 15
				data : 'salesOrderQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//안전재고(숨김) - column 16
				data : 'safyStockQty',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			/*
			
			{//현재고 - column 16
				data : 'initStockAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return rmDecimal( parseFloat(row['initStockQty'] == null || row['initStockQty'] == "" ? "0" : row['initStockQty'] ) * parseFloat( row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			},
			{//안전재고 - column 17
				data : 'safyStockAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="safyStockAmt" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return rmDecimal( parseFloat( row['safyStockQty'] == null || row['safyStockQty'] == "" ? "0" : row['safyStockQty'] ) * parseFloat( row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			},
			{//기초재고 - column 18
				data : 'initStockAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="initStockAmt" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return rmDecimal( parseFloat(row['initStockQty'] == null || row['initStockQty'] == "" ? "0" : row['initStockQty'] ) * parseFloat( row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			}, 
			{//영업오더 - column 19
				data : 'salesOrderAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="salesOrderAmt" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return rmDecimal( parseFloat(row['salesOrderQty'] == null || row['salesOrderQty'] == "" ? "0" : row['salesOrderQty'] ) * parseFloat( row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			}, 
			{//생산계획 - column 20
				data : 'prodTotalAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return '<input type="text" class="form-control number-float0" name="prodTotalAmt" style="text-align:right; border:none; background:white;" value="'+rmDecimal(data)+'" disabled/>';
					} else {
						return rmDecimal( parseFloat(row['prodTotalQty'] == null || row['prodTotalQty'] == "" ? "0" : row['prodTotalQty'] ) * parseFloat( row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			},
			{//생산계획(숨김) - column 21
				data : 'prodTotalAmt',
				render : function ( data, type, row, meta ) {
					if ( data != "" && data != null ) {
						return rmDecimal(data);
					} else {
						return rmDecimal( parseFloat(row['prodTotalQty']) * parseFloat(row['unitCost']).toFixed(2) );
					}
				},
				'className' : 'text-right'
			},
			
			*/
		],
		columnDefs : [
			{ targets : '_all' , className : 'text-center'},
			{ "visible": false, "targets": [1,13,14,15] }
		],
		drawCallback : function() {
        	var api = this.api();
        	
        	for ( var i = 0; i < api.data().count(); i++ ) {

        		safyStockSumQty += parseFloat( $('input[name=safyStockQty]').eq(i).val() == null ? "0" : $('input[name=safyStockQty]').eq(i).val().replace(/,/g, '') );
        		initStockSumQty += parseFloat( api.row(i).data().initStockQty == null ? "0" : api.row(i).data().initStockQty.replace(/,/g, '') );
        		salesOrderSumQty += parseFloat( $('input[name=salesOrderQty]').eq(i).val() == null ? "0" : $('input[name=salesOrderQty]').eq(i).val().replace(/,/g, '') );
        		prodTotalSumQty += parseFloat( api.row(i).data().prodTotalQty == null ? "0" : api.row(i).data().prodTotalQty.replace(/,/g, '') );
        		
            	//계획확정건 비활성화
            	if ( api.row(i).data().confirmYn == "002" || api.row(i).data().confirmYn == null ) {
					$('input[name=check]').eq(i).attr('disabled', false);
					$('input[name=prodTotalQty]').eq(i).attr('disabled', false);
                } else {
                	$('input[name=check]').eq(i).attr('disabled', true);
                	$('input[name=prodTotalQty]').eq(i).attr('disabled', true);
                } 
        	}

    		$('#salesTmSumQty').text( rmDecimal(initStockSumQty) );
        	$('#safyStockSumQty').text( rmDecimal(safyStockSumQty) );
    		$('#initStockSumQty').text( rmDecimal(initStockSumQty) );
    		$('#salesOrderSumQty').text( rmDecimal(salesOrderSumQty) );
    		$('#prodTotalSumQty').text( rmDecimal(prodTotalSumQty) );
    		
        }, 
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 
			{ 
				extend : 'excel',
				title : '월 생산계획',
				filename : function(){
					var year = $('#YEAR').val();
					var mon = $('#MONTH').val();
					return year+'년 '+mon+'월 월 생산계획';
				},
				exportOptions: {
					columns  : [1,2,3,4,5,6,7,8,10,15,14,13],
                },
			 	customize : function(xlsx){
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);

			 		col.each(function () {
			 	    	$(this).attr('width', 10);
			 	    });

			 	 	$(col[0]).attr('width', 10);
			 		$(col[3]).attr('width', 20);
			 		$(col[4]).attr('width', 20);
				} 
			},
		 'print' 
		]
		
	});

	//monProdPlanAdmTable의 dataTables_length 변경
	var html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">년도</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
    html1 += '</div>';
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	 
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="mainGubun" id="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">레이저</option>';
	html1 += '<option value="002">후가공</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">확정여부</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="selectView" id="selectView" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">확정</option>';
	html1 += '<option value="002">미확정</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';

	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>';
	
	html1 += '<label class="input-label-sm ml-3">안전재고</label>';
	html1 += '<div class="input-sub m-0" style="width:100px">';
	html1 += '<input type="text" class="form-control" id="saveStock" name="saveStock" value="0" style="text-align : right;">';
	html1 += '</div>';
	html1 += '<label class="input-label-sm">%</label>';
	html1 += '<button type="button" class="btn btn-primary float-right ml-1"';
	html1 += 'id="saveStockChange">안전재고 적용</button>';
	
	html1 += '</div>';
	html1 += '<button type="button" class="btn btn-primary float-right" id="btnConfirm">계획확정</button>';
	html1 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnSave">저장</button>';
	html1 += '</div>';

	$('#monProdPlanAdmTable_length').html(html1);

	// 년도/월/구분/확정여부 클릭 시
	$('#YEAR, #MONTH, #mainGubun, #selectView').on('change', function() {
		prodYear =  $('#YEAR option:selected').val();
		prodMon =  $('#MONTH option:selected').val();
		confirmYn =  $('#selectView option:selected').val();
		mainGubun =  $('#mainGubun option:selected').val();
		urlData = '';
		sumResetProc();	//합계 초기화

		$('#salesTmSumQty').text("0");
	    $('#safyStockSumQty').text("0");
		$('#initStockSumQty').text("0");
		$('#salesOrderSumQty').text("0");
		$('#prodTotalSumQty').text("0");
		$('#endStockSumQty').text("0");
		
	/* 	$('#salesTmSumAmt').text("0");
		$('#safyStockSumAmt').text("0");
		$('#initStockSumAmt').text("0");
		$('#salesOrderSumAmt').text("0");
		$('#prodTotalSumAmt').text("0");
		$('#endStockSumAmt').text("0"); */
		    
		$('#monProdPlanAdmTable').DataTable().ajax.reload(function(){});
		
    });

	// 안전재고 변경
	$('#saveStockChange').on('click', function() {
		let check = true;
		let dataArray = new Array();
		
 		if ( !$.trim($('#saveStock').val()) ) {
			toastr.warning('안전재고를 입력해주세요.');
			check == false;
			return false;
		}
		
		if ( $('input[name=check]').is(":checked") != true ) {
			toastr.warning('항목을 선택해주세요.');
			check == false;
			return false;
		}

		$('#monProdPlanAdmTable tbody tr').each(function(index, item) {
			if ( $(this).find('td input[name=check]').is(":checked") ) {
				
				let tempSaveStock = $(this).find('td input[name=tempSalesOrderQty]').val().replace(/,/g,'');
				
				// 안전재고 계산
			 	let tempPercent = $('#saveStock').val();
			 	let tempValue = tempSaveStock * (tempPercent / 100);
			 	// 안전재고 입력
			 	$(this).find('td input[name=safyStockQty]').val(rmDecimal(Math.floor(tempValue)));
			 	
			 	//생산계획(수량) 계산
			 	let tempA1 = parseFloat( $(this).find('td input[name=safyStockQty]').val().replace(/,/g,'') );
			 	let tempB1 = parseFloat( $(this).find('td input[name=salesOrderQty]').val().replace(/,/g,'') );
			 	$(this).find('td input[name=prodTotalQty]').val( rmDecimal(tempA1 + tempB1) ); // + 영업오더
				
			 	let rowCount = $(this).find('td input[name=safyStockQty]').parent().parent().index();
			 	let safyStockQtyVal = parseFloat($('input[name=safyStockQty]').eq(rowCount).val().replace(/,/g,'')); //안전재고
			 	let unitCostVal = parseFloat( monProdPlanAdmTable.row(rowCount).data().unitCost );	//단가
				
				$('input[name=safyStockAmt]').eq(rowCount).val( rmDecimal(safyStockQtyVal * unitCostVal) );

				//생산계획(수량) 계산
			 	let tempA2 = parseFloat($(this).find('td input[name=safyStockAmt]').val().replace(/,/g,''));
			 	let tempB2 = parseFloat($(this).find('td input[name=salesOrderAmt]').val().replace(/,/g,''));
			 	$(this).find('td input[name=prodTotalAmt]').val( rmDecimal(tempA2 + tempB2) ); // + 영업오더
				
			 	let prodTotalSumQtyVal = 0;
			 	let prodTotalSumAmtVal = 0;
				
				for( var i = 0; i < monProdPlanAdmTable.data().count(); i++ ) {
					prodTotalSumQtyVal += parseFloat( $('input[name=prodTotalQty]').eq(i).val().replace(/,/g,'') );
					prodTotalSumAmtVal += parseFloat( $('input[name=prodTotalAmt]').eq(i).val().replace(/,/g,'') );
				}

				$('#prodTotalSumQty').text(rmDecimal(prodTotalSumQtyVal));
				$('#prodTotalSumAmt').text(rmDecimal(prodTotalSumAmtVal));

				safyStockSumQty = 0;
				safyStockSumAmt = 0;
				
	        	for ( var i = 0; i < monProdPlanAdmTable.data().count(); i++ ) {
	        		safyStockSumQty += parseFloat( $('input[name=safyStockQty]').eq(i).val() == null ? "0" : $('input[name=safyStockQty]').eq(i).val().replace(/,/g,'') );
	        		safyStockSumAmt += parseFloat( $('input[name=safyStockAmt]').eq(i).val() == null ? "0" : $('input[name=safyStockAmt]').eq(i).val().replace(/,/g,'') );
	        	}

	        	$('#safyStockSumQty').text(rmDecimal(safyStockSumQty));
	    		$('#safyStockSumAmt').text(rmDecimal(safyStockSumAmt));
	    		
			}
		});
	});

	//저장처리
	$('#btnSave').on('click', function() {
		let dataArray = new Array();
		let check = true;
		
		$('#my-spinner').show(); //처리중 모달 실행
		
		$('#monProdPlanAdmTable tbody tr').each(function(index, item) {

			//입력값 검사
			if ( $(this).find("td input[name=prodTotalQty]").val() == "" ) {
				toastr.warning('생산계획을 입력해주세요');
				$(this).find("td input[name=prodTotalQty]").focus();
				check = false;

				$('#my-spinner').hide(); //처리중 모달 종료
				
				return false;
			}

			if ( monProdPlanAdmTable.row(index).data().confirmYn == "002" ||  monProdPlanAdmTable.row(index).data().confirmYn == null ) {
				let rowData = new Object();
				
				rowData.prodYear = $('#YEAR option:selected').val();
				rowData.prodMon = $('#MONTH option:selected').val();
				rowData.itemSeq = monProdPlanAdmTable.row(index).data().itemSeq;

				rowData.safyStockQty = $(this).find('input[name="safyStockQty"]').val() == null ? "0" : $(this).find('input[name="safyStockQty"]').val().replace(/,/g,'');
				rowData.initStockQty = monProdPlanAdmTable.row(index).data().initStockQty == null ? "0" : monProdPlanAdmTable.row(index).data().initStockQty.replace(/,/g,'');
				rowData.salesOrderQty = $(this).find('input[name="salesOrderQty"]').val() == null ? "0" : $(this).find('input[name="salesOrderQty"]').val().replace(/,/g,'');
				rowData.prodTotalQty = $(this).find('input[name="prodTotalQty"]').val() == null ? "0" : $(this).find('input[name="prodTotalQty"]').val().replace(/,/g,'');
				rowData.endStockQty = $(this).find('input[name="endStockQty"]').val() == null ? "0" : $(this).find('input[name="endStockQty"]').val().replace(/,/g,'');
				rowData.safyStockAmt = $(this).find('input[name="safyStockAmt"]').val() == null ? "0" : $(this).find('input[name="safyStockAmt"]').val().replace(/,/g,'');
				rowData.initStockAmt = monProdPlanAdmTable.row(index).data().initStockAmt == null ? "0" : monProdPlanAdmTable.row(index).data().initStockAmt.replace(/,/g,'');
				rowData.salesOrderAmt = monProdPlanAdmTable.row(index).data().salesOrderAmt == null ? "0" : monProdPlanAdmTable.row(index).data().salesOrderAmt.replace(/,/g,'');

				rowData.prodTotalAmt = $(this).find('input[name="prodTotalAmt"]').val() == null ? "0" : $(this).find('input[name="prodTotalAmt"]').val().replace(/,/g,'');
				rowData.endStockAmt = $(this).find('input[name="endStockAmt"]').val() == null ? "0" : $(this).find('input[name="endStockAmt"]').val().replace(/,/g,'');
				rowData.unitCost = monProdPlanAdmTable.row(index).data().unitCost == null ? "0" : monProdPlanAdmTable.row(index).data().unitCost.replace(/,/g,'');

		        dataArray.push(rowData);
		        console.log(rowData);
			}
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="wm/monProdPlanAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if ( res.result == 'ok' ) {
						urlData = '';	
						sumResetProc();	//합계 초기화

						$('#monProdPlanAdmTable').DataTable().ajax.reload(function(){});
						    
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide(); //처리중 모달 종료
						
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
		
	});

	//계획확정 버튼 클릭
	$('#confirmSaveModalY').on('click', function() {
		confirmUpdate();
	});

	//계획확정 버튼 클릭
	$('#btnConfirm').on('click', function() {
		$('#confirmSaveModal').modal('show');
	});
	
	//계획확정
	function confirmUpdate () {
		let dataArray = new Array();		
		let check = true;  		

		$('#my-spinner').show(); //처리중 모달 시작

		$('#monProdPlanAdmTable tbody tr').each(function(index, item) {

			if( monProdPlanAdmTable.row(index).data().confirmYn == "002" ) {
				var rowData = new Object();
				
				rowData.prodYear = $('#YEAR option:selected').val();
				rowData.prodMon = $('#MONTH option:selected').val();
				rowData.itemSeq = monProdPlanAdmTable.row(index).data().itemSeq;
				rowData.confirmYn = '001';
				
		        dataArray.push(rowData);
		        console.log(rowData)
			}
		});
		
		if (check) {
			$.ajax({
				url : '<c:url value="wm/monProdPlanAdmUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if ( res.result == 'ok' ) {
						sumResetProc();	//합계 초기화
						$('#monProdPlanAdmTable').DataTable().ajax.reload(function(){});
						
						toastr.success('계획확정되었습니다.');
						$('#my-spinner').hide(); //처리중 모달 종료
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	}
	
	
	//***************엑셀 업로드 시작***************
	
	//엑셀업로드 버튼 클릭
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);
		formData.append('case', 'mon');
		
		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="wm/prodPlanAdmExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;

					sumResetProc();	//합계 초기화
					
					$('#monProdPlanAdmTable').DataTable().clear().draw();
					$('#monProdPlanAdmTable').DataTable().ajax.reload(function(){});

					$('#btnExcelUpload').val("");
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});
	
	//***************엑셀 업로드 종료***************
	
	
	//숫자만 입력하게 처리
	$(document).on('keyup', "input[name=prodTotalQty], input[name=safyStockQty]", function(event){
		let preInWhsQtyData = $(this).val();	   
		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			});
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
		
		let rowCount = $(this).parent().parent().index();
		let prodTotalQtyVal = parseFloat( $('input[name=prodTotalQty]').eq(rowCount).val().replace(/,/g,'') );		//생산계획수량
		let unitCostVal = parseFloat( monProdPlanAdmTable.row(rowCount).data().unitCost );							//단가

		let initStockQtyVal = parseFloat( monProdPlanAdmTable.row(rowCount).data().initStockQty );					//기초재고
		let salesOrderQtyVal = parseFloat( $('input[name=salesOrderQty]').eq(rowCount).val().replace(/,/g,'') );	//영업오더

		//$('input[name=prodTotalAmt]').eq(rowCount).val( rmDecimal(prodTotalQtyVal*unitCostVal) );
		
		let prodTotalSumQtyVal = 0;
		let prodTotalSumAmtVal = 0;
		
		for ( var i=0; i<monProdPlanAdmTable.data().count(); i++ ) {
			prodTotalSumQtyVal += parseFloat( $('input[name=prodTotalQty]').eq(i).val().replace(/,/g,'') );
			//prodTotalSumAmtVal += parseFloat( $('input[name=prodTotalAmt]').eq(i).val().replace(/,/g,'') );
		}

		$('#prodTotalSumQty').text( rmDecimal(prodTotalSumQtyVal) );
		//$('#prodTotalSumAmt').text( rmDecimal(prodTotalSumAmtVal) );
		
	}); 
	
	//숫자만 입력하게 처리
	$(document).on('keyup', "#saveStock", function(event){
		var preInWhsQtyData = $(this).val();
		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if ( preInWhsQtyData >= 1000 ) {
			toastr.warning('천(1,000) 미만의 숫자를 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
		$(this).val( rmDecimal( $(this).val().replace(/,/g,'') ) );

	}); 

	//합계 초기화
	function sumResetProc () {
		safyStockSumQty = 0;	//안전재고수량
	    initStockSumQty = 0;	//기초재고수량
	    salesOrderSumQty = 0;	//영업오더수량
	    prodTotalSumQty = 0;	//생산계획수량
	    endStockSumQty = 0;		//기말재고수량
        
	    safyStockSumAmt = 0;	//안전재고수량
	    initStockSumAmt = 0;	//기초재고수량
	    salesOrderSumAmt = 0;	//영업오더수량
	    prodTotalSumAmt = 0;	//생산계획수량
	    endStockSumAmt = 0;		//기말재고수량
	}
	
	//전체선택 체크
	$('#checkAll').change(function() {
		if ( $(this).is(':checked') ) {
			$("input[name=check]").prop("checked", true);
			$('#monProdPlanAdmTable tbody tr').each(function() {
				if ( $(this).find('td input[name="check"]').prop('disabled') ) {
					$(this).find('td input[name="check"]').prop("checked", false);
				}
			});
		} else {
			$("input[name=check]").prop("checked", false);
		}
	})
	
</script>
<script>
      $(document).ready(function(){
          setDateBox();
      }); 
    // select box 연도 , 월 표시
    function setDateBox(){
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for ( var y = (com_year-1); y <= (com_year+5); y++ ) {
            $("#YEAR").append('<option value="'+ y +'"'+(y == com_year ? 'selected' : '')+'>'+ y + '년' +'</option>');
        }

        // 월 뿌려주기(1월부터 12월)
        let month;
        $("#MONTH").append("<option value=''>월</option>");
        for ( var i = 1; i <= 12; i++ ) {
        	$("#MONTH").append('<option value="'+(i < 10 ? '0' + i : i)+'" '+(i == mon ? 'selected' : '')+'>'+i+'월'+'</option>'); 
        }
    }
    
</script>

</body>
</html>
