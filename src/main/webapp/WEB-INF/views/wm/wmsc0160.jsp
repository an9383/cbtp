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
				<li class="breadcrumb-item active">제품입고</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2();" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="itemWhsAdmTable" class="table table-bordered">
							<colgroup>
								<col width="4%">
								<col width="7%">
								<col width="10%">
								<col width="12%">
								<col width="8%">
								<col width="5%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="8%">
								<col width="5%">
								<col width="5%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>barcode No</th>
									<th>판정</th>
									<th>검사일</th>
									<th>입고일</th>
									<th>단위</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">미입고수량</th>
									<th>LOT NO</th>
									<th>창고</th>
									<th>구역/위치</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix" id="rfSidenav" style="width: 45%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav2()">
							<i class="mdi mdi-close"></i>
						</a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table id="barcodeAdmTable" class="table table-bordered">
									<colgroup>
										<col width="15%">
										<col width="10%">
										<col width="19%">
										<col width="10%">
										<col width="18%">
										<col width="10%">
										<col width="18%">
									</colgroup>
									<tr>
										<th colspan="1">입고일</th>
										<td colspan="6">
											<div class="row">
												<div class="form-group input-sub m-0 row" style="min-width: 100%;">
													<input class="form-control" type="text" id="inDate" name="inDate" style="min-width: 100%;" disabled />
													<button
														onclick="fnPopUpCalendar(inDate,inDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="inDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</div>
										</td>
										<!-- <th>창고</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%;">
													<input type="hidden" class="form-control" id="locationCd"style="min-width: 100%;" disabled> 
													<input type="text" class="form-control" id="locationNm"style="min-width: 100%;" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnLocationCd" onClick="selectLocationCd()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td> -->
									</tr>
									<!-- <tr>
										<th>구역</th>
										<td><input type="hidden" class="form-control" id="areaCd" style="min-width: 100%;"> 
										<input type="text"class="form-control" id="areaNm" readonly placeholder="창고를 선택해주세요." style="min-width: 100%;"> 
										</td>
										<th>위치</th>
										<td><input type="text" class="form-control" id="floorCd" readonly placeholder="창고를 선택해주세요." style="min-width: 100%;">
										</td>
										<th>담당자</th>
										<td>
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="inChargr" name="inChargr" style="min-width: 100%;"> 
												<input type="text"class="form-control" id="inChargrNm" name="inChargrNm" disabled style="min-width: 100%;">
												<button type="button"
													class="btn btn-primary input-sub-search" id="btnInChargr"
													onClick="selectInChargr()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
									</tr> -->
									<tr>
										<th colspan="1">Location No</th>
										<td colspan="6">
											<input type="text" class="form-control" id="locationNo" placeholder="스캐너만 입력" style="max-width: 100%;">
											<!-- <input type="hidden" id="locationCd">
											<input type="hidden" id="areaCd">
											<input type="hidden" id="floorCd"> -->
										</td>
										<!-- <td colspan="2">
											<label style="width: 130px;">창고 : <span id="locationCd"></span></label>
											<label style="width: 130px;">구역 : <span id="areaCd"></span></label>
											<label style="width: 130px;">위치 : <span id="floorCd"></span></label>
										</td> -->
									</tr>
									<tr>
										<th></th>
										<th>창고</th>
										<td>	
											<input type="hidden" id="inLoc">
											<input type="text" class="form-control" id="inLocNm" style="max-width: 100%;" readonly>
										</td>
										<th>구역</th>
										<td>
											<input type="hidden" id="inArea">
											<input type="text" class="form-control" id="inAreaNm" style="max-width: 100%;" readonly>
										</td>
										<th>위치</th>
										<td>
											<input type="hidden" id="inFloor">
											<input type="text" class="form-control" id="inFloorNm" style="max-width: 100%;" readonly>
										</td>
									</tr>
									<tr>
										<th colspan="1">Barcode No</th>
										<td colspan="6"><input type="text" class="form-control"
											id="barcodeNo" placeholder="스캐너만 입력" style="max-width: 100%;"></td>
									</tr>
								</table>
							</div>
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
								<button class="btn btn-primary d-none"
									id="btnAddConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<div class="table-responsive">
								<table id="barcodeDtlTable" class="table table-bordered">
									<colgroup>
										<col width="25%">
										<col width="12%">
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="13%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>Barcode No</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th>입고량</th>
										</tr>
									</thead>
								</table>
							</div>
							<button type="button"
								class="btn btn-primary d-none float-right mr-1" id="btnSave">저장</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</form>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
		<!-- Modal Start-->
	<div class="modal fade" id="inLocPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="inLocPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLocPopupLabel">창고정보조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="table-responsive" style="height: 650px">
						<table class="table table-sm table-bordered">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tr>
								<th>창고</th>
								<td><select class="custom-select" id="selectInLoc"
									style="max-width: 100%;" onchange="changeInArea()"></select></td>
								<th>구역</th>
								<td><select class="custom-select" id="selectInArea"
									style="max-width: 100%;" onchange="changeInFloor()">
										<option value="">창고를 선택해주세요.</option>
								</select></td>
							</tr>
						</table>
						<table id="inLocPopupTable"
							class="table table-sm table-bordered">
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
						<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</div>
	<!-- /.page-wrapper -->
<%@include file="../layout/bottom.jsp"%>
<style>
#th {
	padding-bottom: 12px;
}
</style>
	<script>

	let currentHref = "wmsc0160";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","제품입고"); 
	let viewIdx;
	let btnView;
	let sideView = 'add';
	
	var tableIdx=null;
	
	var inDateFromCal =  "${serverDateFrom}";
	var inDateToCal =  "${serverDateTo}";
	var inDateCal =  "${serverDateTo}";	
	
	var barcodeNo = null;
	var workOrdNo = null;
	var itemSeq;
	var itemModelNm;
	var itemCd;
	var itemNm;
	var itemUnitNm;
		
	var itemRev;
	var itemGubunNm;
	var itemCapa;
	var diffQty;
	var baseInfoCd;
	var etc3;
	var areaCd;
	
	var mainGubunVal = '';
	var itemGubunVal = '';
	
	$('#inDate').val(inDateCal);
	
	//공통코드 처리 시작	
	var areaCdCodeEmpty = new Array();  
	
 	var inLocCode = new Array(); 
	<c:forEach items="${inLoc}" var="info">
	var json = new Object();
	json.baseCd = "${info.inLoc}";
	json.baseNm = "${info.inLocNm}";
	inLocCode.push(json);
	</c:forEach> 
	
	var itemGubunArray = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunArray.push(json);
	</c:forEach>
	
	var mainGubunArray = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	//선택박스 처리
	selectBoxAppend(inLocCode , "selectInLoc",'', "2");

	// 구역목록
	function changeInArea(){
		$.ajax({
			url : '<c:url value="wm/getInArea" />',
			type : 'GET',
			data : {
				'inLoc' : $('#selectInLoc option:selected').val()
			},
			success : function(res){
				if(res.result == "ok"){
				 	var inAreaCode = new Array(); 
				 	
				 	for(var i=0; i<res.data.length; i++){
				 		var json = new Object();
						json.baseCd = res.data[i].inArea;
						json.baseNm = res.data[i].inAreaNm;
						inAreaCode.push(json);
					 }
				 	
				}
				selectBoxAppend(inAreaCode , 'selectInArea','', '2');
				baseInfoCd = $('#selectInLoc option:selected').val();
				$('#inLocPopupTable').DataTable().ajax.reload( function () {});

			}
		})
	}

	// 위치목록
	function changeInFloor(){
		etc3 = $('#selectInArea option:selected').val()
		$('#inLocPopupTable').DataTable().ajax.reload( function () {});
	}

	//제품입고 목록조회
	let itemWhsAdmTable = $('#itemWhsAdmTable').DataTable({
		dom:  "<'row'<'col-sm-5 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="wm/itemWhsAdmList"/>',
			data : {
				'startDate' : function(){return inDateFromCal.replace(/-/g,'');},
				'endDate' : function(){return inDateToCal.replace(/-/g,'');},
				'mainGubun' : function() {return mainGubunVal;},
			}	

		},	
		rowId : 'barcodeNo',
		columns : [ 
				{
					data : 'mainGubunNm'
				},
				{
					data : 'itemModelNm'
				},
				{
					data : 'itemCd'
				},
				{
					data : 'itemNm'
				},	
				{
					data : 'workOrdNo'
				},
				{
					data : 'judgmentNm',
					render : function(data, type, row, meta){
						return data;
					}
				}, 
				{
					data : 'inspectDate',
					render : function(data, type, row, meta){
						return moment(data).format('YYYY-MM-DD');
					}
				}, 
				{
					data : 'inDate',
					render : function(data, type, row, meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
						
					}
				}, 
				{
					data : 'itemUnitNm'
				},
				{
					data : 'pairQty',
					render : function(data, type, row, meta){
						if(data != null){
							return addCommas(data);
						}else{
							return '-';
						}
					}, "className" : "text-right"
				},
				{
					data : 'inQty',
					render : function(data, type, row, meta){
						if(data != null){
							return addCommas(data);
						}else{
							return '-';
						}
					}, "className" : "text-right"
				},
				{
					data : 'diffQty',
					render : function(data, type, row, meta){
						if(data != null){
							return addCommas(data);
						}else{
							return '-';
						}
					}, "className" : "text-right"
				},
				{
					data : 'workOrdNo'
				},
				{
					data : 'inLocNm',
					render : function(data, type, row, meta){
						if(data!=null){
							return data;
						}else{
							return '-';
						}
						
					}
				},
				{
					data : 'inAreaNm',
					render : function(data, type, row, meta){
						if(data!=null){
							return data+" / "+row['inFloor'];
						}else{
							return '-';
						}
						
					}
				},
			
		],
	   /*  order: [
	        [ 1, 'desc' ]
	    ], */
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});


	/* // 세부 목록 보기
	$('#inOutWhsTable tbody').on('click','tr',function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				$('#inOutWhsTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
			
			tableIdx = inOutWhsTable.row(this).index();
			barcodeNo = inOutWhsTable.row(this).data().barcodeNo;
			
			$('#barcodeDtlTable').DataTable().ajax.reload(function() {});
			
	});
 */
	
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching: false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="wm/itemWhsAdmRead"/>',
			type : 'GET',
			data : {
				'barcodeNo' : function(){return barcodeNo;},
			},
		},
		rowId : '',
		columns : [
				{data : 'barcodeNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>';	
						} else{
							var html = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>' ;	
							html += '<input type="hidden" name="workOrdNo" value="'+workOrdNo+'">' ;	

							return html;
						}		    			
		    		}
				}, 
				{data : 'itemModelNm',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" name="itemModelNm" value="'+data+'" style="width:100%;text-align:center;" disabled>';		
						} else{
							var html =  '<input type="text" class="form-control" name="itemModelNm" value="'+itemModelNm+'" style="max-width:100%; text-align:center;" disabled>';

							return html;
						}		    			
		    		}
				}, 
				{data : 'itemCd',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" name="itemCd" value="'+data+'" style="width:100%;text-align:center;" disabled>';		
						} else{
							var html =  '<input type="text" class="form-control" name="itemCd" value="'+itemCd+'" style="max-width:100%; text-align:center;" disabled>';
							html += '<input type="hidden" name="itemSeq" value="'+itemSeq+'">' ;
							
							return html;
						}		    			
		    		}
				},
				{data : 'itemNm',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="width:100%;text-align:center;" disabled>';		
						} else{
							var html =  '<input type="text" class="form-control" name="itemNm" value="'+itemNm+'" style="max-width:100%; text-align:center;" disabled>';

							return html;
						}		    			
		    		}
				},
				{data : 'itemUnitNm',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" name="itemUnitNm" value="'+data+'" style="width:100%;text-align:center;" disabled>';		
						} else{
							var html =  '<input type="text" class="form-control" name="itemUnitNm" value="'+itemUnitNm+'" style="max-width:100%; text-align:center;" disabled>';

							return html;
						}		    			
		    		}
				},
				{data : 'diffQty',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="diffQty" value="'+addCommas(data)+'" disabled>';			
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="diffQty" value="'+diffQty+'" disabled>';	
						}				
		    		}
				}, 
				/* {data : 'inLoc',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="inLoc" value="'+data+'" disabled>';		
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="inLoc" value="'+inLoc+'" disabled>';	
						}				
		    		}
				} */

				 ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '공정BOM상세'
		}, 'print' ],
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
		console.log(tableIdx);
		btnView = 'edit';
		
	});

	// 라인삭제버튼 
	$('#btnDel').on('click', function() {
		if(btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#barcodeDtlTable').DataTable().rows(tableIdx).remove().draw();
		
		if(barcodeDtlTable.data().count() == 0){
			$('#btnSave').addClass('d-none');
		}
		btnView = "";
			
	});

	// 바코드입력
	$('#locationNo').keypress(function(e){
		var check2 = true;  	
		if(e.keyCode == 13){
			if(!$.trim($('#locationNo').val())){
				toastr.warning('창고 바코드를 스캔해주세요.');
				$('#locationNo').focus();
				check2 = false;
				return false;
			}

// 			if($('#locationNo').val().length != 12) {
// 				toastr.warning('잘못된 창고 바코드 입니다. 확인해주세요.');
// 				$('#locationNo').focus();
// 				$('#locationNo').select();
// 				check=false;
// 				return false;
// 			}
			
			if(check2){
			 	$.ajax({
	            	url: '/io/getLocInfo',
	                type: 'GET',
	                data: {
	                	'locationNo'  :  $('#locationNo').val(),
	                	'status' 		: 'item'                     
	                },
	                success: function (res) {
	                    let data = res.data;
	                    
	                    if (res.result == 'ok') {
		                    
		                   $('#inLoc').val(data.locationCd);
		                   $('#inLocNm').val(data.locationNm);
		                   $('#inArea').val(data.areaCd);
		                   $('#inAreaNm').val(data.areaNm);
		                   $('#inFloor').val(data.floorCd);
		                   $('#inFloorNm').val(data.floorNm);

		                   $('#barcodeNo').focus();
		                   toastr.success("창고정보 추가되었습니다.");
		                   
	                    }else if(res.result == 'empty') {
	                    	toastr.warning("등록되지 않은 창고 바코드입니다. 확인해주세요.");
	                    }else if(res.result == 'notItemLocCd') {
	                    	toastr.warning("제품 창고 바코드가 아닙니다. 확인해주세요.");
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
	
	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check2 = true;  	
		if(e.keyCode == 13){
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
			}

// 			if($('#barcodeNo').val().length != 13) {
// 				toastr.warning('잘못된 바코드 입니다. 확인해주세요.');
// 				$('#barcodeNo').focus();
// 				$('#barcodeNo').select();
// 				check=false;
// 				return false;
// 			}
			
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val() == $('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					check2 = false;
					return false;
				}
			});

			if(check2){
			 	$.ajax({
	            	url: '<c:url value="wm/barcodeNoScanInList" />',
	                type: 'GET',
	                data: {
	                	'barcodeNo'  :  $('#barcodeNo').val()               
	                },
	                success: function (res) {
	                    let data = res.data;
	                    $('#barcodeNo').select();
	                    
	                    if (res.result == "ok") {
		                    barcodeNo = data.workOrdNo;
		                    workOrdNo = data.workOrdNo;
		                    itemSeq = data.itemSeq;
		                    itemCd = data.itemCd;
		                    itemNm = data.itemNm;
		                    itemModelNm = data.itemModelNm;
		                    itemUnitNm = data.itemUnitNm;
		                    itemGubunNm = data.itemGubunNm;
		                    itemCapa = data.itemCapa;
		                    diffQty = Math.floor(data.diffQty);
		                    inLoc = data.inLoc==null?"-":data.inLoc;
		                    
	                    	$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
							$('#btnSave').removeClass('d-none');
	                        toastr.success("추가되었습니다.");
	                    }else if(res.result == "fail") {
	                    	toastr.warning(res.message);
	                    }else if(res.result == "error") {
	                    	toastr.error(res.message, '', {timeOut: 5000});
	                    }    
		             },
		             complete:function(){
		             }
		        });
			}
		}
	});

	
	// 저장 처리
	$('#btnSave').on('click',function() {
		
		var dataArray = new Array();		
		var check = true;  	
		
		if(!$.trim($('#locationNo').val())){
			toastr.warning('창고 바코드를 스캔해주세요.');
			$('#locationNo').focus();
			return false;
		} 
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
				 
			var rowData = new Object();
			
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();	
			rowData.workOrdNo = $(this).find('td input[name=workOrdNo]').val();	
			rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();	
			rowData.inDate = $('#inDate').val().replace(/-/g,'');
			rowData.inQty = $(this).find('td input[name=diffQty]').val();
			rowData.inChargr = $('#inChargr').val();
			rowData.inLoc = $('#inLoc').val();
			rowData.inArea = $('#inArea').val();
			rowData.inFloor = $('#inFloorNm').val();
			rowData.locationNo = $('#locationNo').val();
			
	        dataArray.push(rowData);
	        console.log(dataArray)
		});
			
		if(check){
			$.ajax({
				url : '<c:url value="wm/itemWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						// 보기					
						$('#itemWhsAdmTable').DataTable().ajax.reload(function() {});	
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val("");
						$('#locationNo').val("");
						$('#inLoc').val("");
						$('#inLocNm').val("");
						$('#inArea').val("");
						$('#inAreaNm').val("");
						$('#inFloorNm').val("");

						
						$('#inChargr').val("");
						$('#inChargrNm').val("");
						$('#btnSave').addClass('d-none');
						
						toastr.success('저장되었습니다.');
					
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	var sysdate = "${serverTime}";
	   
    var html1 = '<div class="row">';
    html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="mainGubun" name="mainGubun" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">완제품검사일</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inDateFrom" name="inDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inDateFrom,inDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inDateTo" name="inDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inDateTo,inDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '</div>';
    
	$('#itemWhsAdmTable_length').html(html1);
	$('#inDateFrom').val(inDateFromCal);
	$('#inDateTo').val(inDateToCal);

	selectBoxAppend(mainGubunArray, "mainGubun", "", "1");
	
	// 조회버튼
	$('#btnRetv').on('click', function() {
		mainGubunVal =  $('#mainGubun option:selected').val();
		inDateFromCal =  $('#inDateFrom').val();
		inDateToCal =  $('#inDateTo').val();
		$('#itemWhsAdmTable').DataTable().ajax.reload( function () {});
    });	

	//창고정보조회 팝업 시작
	var inLocPopupTable;
	function selectInLoc() {
		if (inLocPopupTable == null || inLocPopupTable == undefined) {
			inLocPopupTable = $('#inLocPopupTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				searching:false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : 'bm/baseInfoWhList',
					type : 'GET',
					data : {
						'baseInfoGubun' : "002",
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
			$('#inLocPopupTable tbody').on('click', 'tr', function() {
				var data = inLocPopupTable.row(this).data();

				//창고정보
				$('#inLocNm').val(data.baseInfoNm);
				$('#inLoc').val(data.baseInfoCd);
				//구역정보
				$('#inAreaNm').val(data.areaNm);
				$('#inArea').val(data.areaCd);
				//위치정보
				$('#inFloor').val(data.etc2);
				
				$('#inLocPopupModal').modal('hide');
			});
		} else {
			$('#inLocPopupTable').DataTable().ajax.reload(function() {});
		}

		$('#inLocPopupModal').modal('show');
		selectBoxAppend(inLocCode , "inLoc",'', "2");
	}
	
	
	function uiProc(flag) {
		$('#inWhsDateCalendar').attr('disabled',flag);
		$('#locationCd').attr('disabled',flag);
		$('#areaCd').attr('disabled',flag);
		$('#floorCd').attr('disabled',flag);
		$('#barcodeNo').attr('disabled',flag);
		
	}

	

	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectInChargr() {
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
					data : 'chargrDutyNm'
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
				$('#inChargr').val(data.userNumber);
				$('#inChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}


	// 바코드 출력 버튼 click
	$('#btnBarcode').on('click', function() {
		if(doubleClickCheck()) {
			return false;
		}
		
		if(!$('input[name=printList]').is(':checked')) {
			toastr.warning('인쇄할 자재를 체크하고 인쇄해주세요.');
			doubleClickState = false;
			return false;
		}
		
		$('input[name=printList]').each(function() {
			var tableRowNum = $(this).attr('id').split('-')[1];
			
			if($(this).is(':checked')) {
				var custItemCdLal = inOutWhsAdmTable.row(tableRowNum).data().custItemCd==null || inOutWhsAdmTable.row(tableRowNum).data().custItemCd==''?'':inOutWhsAdmTable.row(tableRowNum).data().custItemCd;
		        var custItemNmLal = inOutWhsAdmTable.row(tableRowNum).data().custItemNm==null || inOutWhsAdmTable.row(tableRowNum).data().custItemNm==''?'':inOutWhsAdmTable.row(tableRowNum).data().custItemNm;
		        //var itemDcLal = lpodViewTable.row('.selected').data().itemDc==null || lpodViewTable.row('.selected').data().itemDc==''?'':lpodViewTable.row('.selected').data().itemDc;
		        var itemDcLal = itemDc==null || itemDc==''?'':itemDc;
		        var preInWhsDateLal = moment(inOutWhsAdmTable.row(tableRowNum).data().preInWhsDate,'YYYY-MM-DD').format('YYYY.MM.DD');
		        var lotNoLal = inOutWhsAdmTable.row(tableRowNum).data().lotNo;
		        var barcodeNoLal = inOutWhsAdmTable.row(tableRowNum).data().barcodeNo;
				labelPrint(custItemCdLal,
						custItemNmLal,
						itemDcLal,
						preInWhsDateLal,
						lotNoLal,
						barcodeNoLal);
			}
		});
		setTimeout(function() {
			doubleClickState = false;
		}, 500)
	});
	
</script>
	<script>

//Do printing...
function labelPrint(custItemCdLal,
					custItemNmLal,
					itemDcLal,
					preInWhsDateLal,
					lotNoLal,
					barcodeNoLal) {

		
        
		var cmds =  "\n";
			cmds += "";
			cmds += "BD20,20,800,400,B,5\n";
			cmds += "BD20,20,800,330,B,5\n";
			cmds += "BD20,20,800,240,B,5\n";
			cmds += "BD20,20,800,170,B,5\n";
			cmds += "BD20,20,800,105,B,5\n";
			cmds += "BD400,165,800,240,B,5\n";
			cmds += "BD20,20,120,240,B,5\n";
			cmds += "BD550,165,800,240,B,5\n";
			cmds += "V35,45,U,40,40,1,N,N,N,0,L,0,'품번'\n";
			cmds += "V135,45,U,40,40,1,N,N,N,0,L,0,'"+custItemCdLal+"'\n";
			cmds += "V420,65,U,25,25,1,N,N,N,0,L,0,'가입고일 : '\n";
			cmds += "V520,65,U,25,25,1,N,N,N,0,L,0,'"+preInWhsDateLal+"'\n";
			cmds += "V35,115,U,40,40,1,N,N,N,0,L,0,'품명'\n";
			cmds += "V135,120,U,35,35,1,N,N,N,0,L,0,'"+custItemNmLal+"'\n";
			cmds += "V35,185,U,40,40,1,N,N,N,0,L,0,'규격'\n";
			cmds += "V135,190,U,25,25,1,N,N,N,0,L,0,'"+itemDcLal+"'\n";
			cmds += "V420,190,U,30,30,1,N,N,N,0,L,0,'LOT NO'\n";
			cmds += "V580,190,U,25,25,1,N,N,N,0,L,0,'"+lotNoLal+"'\n";
			cmds += "B1250,245,1,2,4,50,0,1,'"+barcodeNoLal+"'\n"; // 중간크기
			//cmds += "B1100,245,1,4,9,50,0,1,'"+barcodeNoLal+"'\n"; // 꽉찬크기
			cmds += "V270,340,U,40,40,1,N,N,N,0,L,0,'(주)유창하이텍'\n";
			cmds += "P1\n";
						

		sendMessage(cmds);
		console.log('라벨인쇄');
}

</script>
</body>
</html>