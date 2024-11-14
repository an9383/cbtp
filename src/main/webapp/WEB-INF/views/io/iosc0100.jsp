<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 반품 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="returnAddModal" tabindex="-1" role="dialog" aria-labelledby="returnAddModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 550px; height: 400px; position: absolute; left: 50%; transform: translateX(-50%);">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="returnAddModalPopUpLabel">반품 등록</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<div class="card-body col-sm-12 p-1 mb-2">
						<button type="button" class="btn btn-primary float-right" id="btnReturnSave">반품등록</button>	
					</div>
	      			<hr class="text-secondary">	         
	        			<table id="returnAddTable" class="table table-bordered">
	                   		<thead class="thead-light">
								<tr>
									<th>반품번호</th>
									<td><input type="text" class="form-control" id="retnNo" name="retnNo" maxlength="50" style="min-width : 100%;" disabled></td>
									<th>반품담당자</th>
									<td>
										<div class="input-sub m-0">
											<input type="hidden" id="returnChargr" name="returnChargr">
											<input type="text" class="form-control" id="returnChargrNm"
												name="returnChargrNm" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" id="btnReturnChargr"
												onClick="selectReturnChargr()">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>반품수량</th>
									<td><input type="text" class="form-control" id="returnQty" name="returnQty" maxlength="50" style="min-width : 100%;" disabled></td>
									<th>반품일자</th>
									<td>
										<div class="form-group input-sub m-0" style="max-width: 100%">
											<input class="form-control" style="max-width: 100%" type="date" id="returnDate" name="returnDate"/>		
										</div>
									</td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control" id="returnDesc" name="returnDesc" maxlength="100" style="min-width : 100%;"></td>
								</tr>
							</thead>
						</table>
					<hr class="text-secondary"> 
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 반품 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">업체반품</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="container-fluid overflow-hidden" id="main">
	
				<div class="row">
					<div class="p-0" style="width: 100%;">
						<div class="row p-0 mb-2" style="height:86vh;">
							<div class="col-md-12 p-1" style="background-color:#ffffff;">
								<table id="purchaseOrderReturnTable" class="table table-bordered tr_highlight_row">
									<colgroup>
										<col width="3%">
										<col width="7%">
										<col width="10%">
										<col width="10%">
										<col width="7%">
										<col width="7%">
										<col width="4%">
										<col width="10%">
										<col width="4%">
										<col width="5%">
										<col width="5%">
										<col width="6%">
										<col width="5%">
										<col width="7%">
										<col width="5%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>No.</th>
											<th>공급사</th>
											<th>품번</th>
											<th>품명</th>
											<th>부적합일자</th>
											<th>부적합담당자</th>
											<th>불량내역</th>
											<th>LOT NO</th>
											<th class="text-center">불량수량</th>
											<th class="text-center">반품수량</th>
											<th>반품일자</th>
											<th>반품담당자</th>
											<th>반품번호</th>
											<th>비고</th>
											<th>관리</th>
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
<style>
.td_top{
	vertical-align: top!important;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "iosc0100"; 
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","반품등록"); 

	let tableIdx;
	let serverDate = "${serverDateTo}"
	let userNm = "${userNm}"
	let userNumber = "${userNumber}";
	let returnDateFrom = moment().subtract('1','M').format('YYYY-MM-DD');
	let returnDateTo = moment().format('YYYY-MM-DD');
	let unfitResultNo = '';

	let purchaseOrderReturnTable = $('#purchaseOrderReturnTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : 10000000,
		ajax : {
			url : '<c:url value="io/purchaseOrderReturnList"/>',
			type : 'GET',
			async : false,
			data : {
				'mainGubun': function() {return '001';},
				'startDate': function() {return returnDateFrom.replace(/-/g, '');},
	           	'endDate': function() {return returnDateTo.replace(/-/g, '');},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {
					return meta.row+1;
				},
				'className' : 'text-center'
			},
			{data : 'dealCorpNm',className : 'text-center'}, 
			{data : 'itemCd',className : 'text-center'},
			{data : 'itemNm',className : 'text-center'}, 
			{
				data : 'unfitFaultyDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				},
				className : 'text-center'
			}, 
			{
				data : 'unfitFaultyChargrNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return ;
					}
				},
				className : 'text-center'
			},
			{
				data : 'faultyDtl',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return ;
					}
				},
				className : 'text-center'
			},
			{data : 'unfitLot',className : 'text-center'}, 
			{
				data : 'faultyQty',
				render : function(data,type,row,meta){
					return rmDecimal(data);
				},
				className : 'text-right'
			},
			{
				data : 'returnQty',
				render : function(data,type,row,meta){
					return rmDecimal(data);
				},
				className : 'text-right'
			}, 
			{
				data : 'returnDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '';
					}
				},
				className : 'text-center'
			}, 
			{
				data : 'returnChargrNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return row.returnChargr;
					}
				},
				className : 'text-center'
			}, 
			{
				data : 'retnNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
				className : 'text-center'
			}, 
			{
				data : 'returnDesc',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
				className : 'text-center'
			}, 
			{
				render : function(data,type,row,meta){
					if(row['returnDate']!=null){
						return '<button type="button" class="btn btn-success" name="retnAdd" disabled>반품완료</button>';
					}else{
						return '<button type="button" class="btn btn-danger" name="retnAdd" onclick="retnAdd('+meta.row+')">반품진행</button>';
					}
				},
				className : 'text-center'
			}, 
		],
		columnDefs : [
		],
		createdRow : function( row, data, dataIndex ) {
		  
		},
		buttons : [ {
			extend : 'copy',
			title : '반품등록',
		}, {
			extend : 'excel',
			title : '반품등록',
		}, {
			extend : 'print',
			title : '반품등록',
		}, ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
	

	//테이블 왼쪽 위 html
	let unfitHtml = '<div class="row">';
	unfitHtml += '&nbsp;&nbsp;<label class="input-label-sm">반품일자</label><div class="form-group input-sub m-0 row">';
    unfitHtml += '<input class="form-control" style="width:97px;" type="text" id="startDate" disabled/>';
    unfitHtml += '<button onclick="fnPopUpCalendar(startDate, startDate, \'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="startDateCalendar" type="button">';
    unfitHtml += '<span class="oi oi-calendar"></span>';
    unfitHtml += '</button>'; 
    unfitHtml += '</div>';
    unfitHtml += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    unfitHtml += '<input class="form-control" style="width:97px;" type="text" id="endDate" disabled />';
    unfitHtml += '<button onclick="fnPopUpCalendar(endDate, endDate, \'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="endDateCalendar" type="button">';
    unfitHtml += '<span class="oi oi-calendar"></span>';
    unfitHtml += '</button>'; 
    unfitHtml += '</div>&nbsp;&nbsp;&nbsp;';
	unfitHtml += '<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
	unfitHtml += '<button type="button" class="btn btn-primary mr-1" id="btnAllRetv">전체조회</button>';
	unfitHtml += '</div>';
    
	$('#purchaseOrderReturnTable_length').html(unfitHtml);
	$('#startDate').val(returnDateFrom);
	$('#endDate').val(returnDateTo);

	//조회 클릭시
	$('#btnRetv').on('click',function(){
		returnDateFrom = $('#startDate').val().replace(/-/g,'');
		returnDateTo = $('#endDate').val().replace(/-/g,'');
		$('#purchaseOrderReturnTable').DataTable().ajax.reload(function(){});
	});

	//전체조회 클릭시
	$('#btnAllRetv').on('click',function(){
		returnDateFrom = '';
		returnDateTo = '';
		$('#purchaseOrderReturnTable').DataTable().ajax.reload(function(){});
	});

	//반품버튼 클릭시
	function retnAdd(idx){
		console.log('반품등록')
		let data = purchaseOrderReturnTable.row(idx).data();
		tableIdx=idx;
		unfitResultNo = data.unfitResultNo;
		$('#returnQty').val(data.returnQty);
		$('#returnDate').val(moment().format('YYYY-MM-DD'));

		$('#returnChargr').val(userNumber);
		$('#returnChargrNm').val(userNm);
		
		//반품번호 가져오기
    	$.ajax({
			url  : '<c:url value="io/getRetnNo" />',
			type : 'GET',
			data : {}, 
			success : function(res){
				$('#retnNo').val(res.data);
			}
        });

		$('#returnAddModal').modal('show');
	};

	$('#btnReturnSave').on('click',function(){


		let dataArray = new Array();

		
		if ( !$.trim($('#returnQty').val()) ) {
            toastr.warning('반품수량을 입력해주세요.');
            $('#returnQty').focus();
            return false;
        }

		if ( !$.trim($('#returnDate').val()) ) {
            toastr.warning('반품일자를 입력해주세요.');
            $('#returnDate').focus();
            return false;
        }
        
		if ( !$.trim($('#returnChargr').val()) ) {
            toastr.warning('반품담당자를 선택해주세요.');
            $('#returnChargr').focus();
            return false;
        }

        
		$('#returnAddTable thead tr').each(function(index,item){
			
			var rowData = new Object();
			let data = purchaseOrderReturnTable.row(tableIdx).data();

			if($('#returnQty').val()>data.returnQty) {
				toastr.error('계획된 반품수량보다 많습니다.');
				$('#returnQty').focus();
				return false;
			}
			rowData.retnNo = $('#retnNo').val();
			rowData.unfitResultNo = unfitResultNo;
			rowData.returnQty =  $('#returnQty').val();
			rowData.returnDate =  $('#returnDate').val().replace(/-/g,'');
			rowData.returnChargr = $('#returnChargr').val();
			rowData.returnDesc =  $('#returnDesc').val();
			rowData.approvalYn = 'N';

			rowData.unfitNo = data.unfitNo;
			rowData.itemGubun = data.itemGubun;
			rowData.itemSeq = data.itemSeq;
			rowData.mainGubun = data.mainGubun;			
		    
	        dataArray.push(rowData);
	        console.log(rowData);
			
		});
		
		$.ajax({
			url : '<c:url value="io/purchaseOrderReturnCreate"/>' ,
			type : 'POST',
			datatype: 'json',
			data : JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			success : function(res){
				if(res.result=="ok"){
					toastr.success("반품되었습니다.");
					$('#purchaseOrderReturnTable').DataTable().ajax.reload();
					$('#returnAddModal').modal('hide');
				}else{
					toastr.error(res.message);
				}
			}
		});
	});


	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectReturnChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 15,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {

					}
				},
				rowId : 'userNumber',
				columns : [ {
					data : 'userNm'
				}, {
					data : 'departmentNm'
				}, {
					data : 'postNm'
				}, {
					data : 'chargeDutyNm'
				}, {
					data : 'workplaceNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4, 5 ],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#returnChargr').val(data.userNumber);
				$('#returnChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#userPopUpModal').modal('show');
	}
</script>
</body>
</html>
