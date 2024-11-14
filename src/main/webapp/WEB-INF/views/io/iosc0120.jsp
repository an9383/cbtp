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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">자재입고등록</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="open-arrow a" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2();"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive a" >
						<table id="inOutWhsTable" class="table table-bordered">
							<colgroup>
								<col width="3%">
								<col width="5%">
								<col width="5%">
								<col width="4%">
								<col width="5%">
								<col width="8%">
								<col width="4%">
								<col width="4%">
								<col width="6%">
								<col width="10%">
								<col width="14%">
								<col width="3%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>	
									<th>가입고일</th>	
									<th>입고일</th>	
									<th>승인구분</th>
									<th>수입검사일</th>
									<th>Barcode No</th>
									<th>창고</th>
									<th>구역/위치</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th class="text-center">가입고수량</th>
									<th class="text-center">합격수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">미입고수량</th>
									<th>LOT NO</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix"
				id="rfSidenav" style="width: 45%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
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
									<tr class="d-none">
										<th colspan="1">현장입고일</th>
										<td colspan="2">
											<div class="row">
												<div class="form-group input-sub m-0 row"
													style="min-width: 100%;">
													<input class="form-control" type="text" id="inWhsDate"
														name="inWhsDate" style="min-width: 100%;" disabled />
													<button
														onclick="fnPopUpCalendar(inWhsDate,inWhsDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="inWhsDateCalendar" type="button">
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
										<th colspan="1">창고코드</th>
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
										<th>창고정보</th>
										<th>창고</th>
										<td>	
											<input type="hidden" id="locationCd">
											<input type="hidden" id="mainGubun">
											<input type="text" class="form-control" id="locationNm" style="max-width: 100%;" readonly>
										</td>
										<th>구역</th>
										<td>
											<input type="hidden" id="areaCd">
											<input type="text" class="form-control" id="areaNm" style="max-width: 100%;" readonly>
										</td>
										<th>위치</th>
										<td>
											<input type="hidden" id="floorCd">
											<input type="text" class="form-control" id="floorNm" style="max-width: 100%;" readonly>
										</td>
									</tr>
									<tr>
										<th colspan="1">Barcode No</th>
										<td colspan="6"><input type="text" class="form-control"
											id="barcodeNo" placeholder="스캐너만 입력" style="max-width: 100%;"></td>
									</tr>
								</table>
							</div>
							<div id="baseInfoButton">
								<div class="card-body col-sm-12 p-1">
									<!-- <button type="button" class="btn btn-danger float-right "
										id="btnAllDel">전체삭제</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button> -->
									<button type="button"
										class="btn btn-primary d-none float-right mr-1" id="btnSave">저장</button>
									<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
										type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-warning float-right mr-1"
										id="btnDel">삭제</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button>
									<!-- <button type="button" class="btn btn-primary float-right mr-1"
										id="btnCansle">취소</button>
									<button class="btn btn-primary d-none"
										id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status"
											aria-hidden="true"></span> 처리중
									</button> -->
								</div>
							</div>
							<div class="table-responsive">
								<table id="barcodeDtlTable" class="table table-bordered">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="25%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>Barcode NO</th>
											<th>품목번호</th>
											<th>품명</th>
											<th>차종</th>
											<th>단위</th>
											<th>입고량</th>
										</tr>
									</thead>
								</table>
							</div>
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
	<div class="modal fade" id="locationPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
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
								<td><select class="custom-select" id="selectLocationCd"
									style="max-width: 100%;" onchange="changeAreaCd()"></select></td>
								<th>구역</th>
								<td><select class="custom-select" id="selectAreaCd"
									style="max-width: 100%;" onchange="changeFloorCd()">
										<option value="">창고를 선택해주세요.</option>
								</select></td>
							</tr>
						</table>
						<table id="locationPopupTable"
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
	
	let currentHref = "iosc0120";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","자재입고등록"); 
	let viewIdx;
	let btnView;
	let sideView = 'add';
	
	var tableIdx=null;
	
	var preInWhsDateFromCal =  "${serverDateFrom}";
	var preInWhsDateToCal =  "${serverDateTo}";
	var preInWhsDateCal =  "${serverDateTo}";	
	var searchOption = '';
	var searchOption2 = null;
	var approvalCd = null;
	var poNo;
	var poSeq;
	var inSeq;
	
	var barcodeNo;
	var itemSeq;
	var itemCd;
	var itemNm;
	var itemModel;
	var itemUnit;
	var inWhsQty;
	var baseInfoCd;
	var etc3;
	var areaCd;
	var mainGubun = null;
	
	var mainGubunVal = '';
	var itemGubunVal = '';
	
	$('#inWhsDate').val(preInWhsDateCal);
	
	//공통코드 처리 시작	
	var areaCdCodeEmpty = new Array();  
	
 	var locationCdCode = new Array(); 
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.locationCd}";
	json.baseNm = "${info.locationNm}";
	locationCdCode.push(json);
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
	selectBoxAppend(locationCdCode , "selectLocationCd",'', "2");

	
	//입고등록 목록조회
	let inOutWhsTable = $('#inOutWhsTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-1'i><'col-sm-12 col-md-4'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 100000,
		scrollY : "620px",
		ajax : {
			url : '<c:url value="io/inOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return preInWhsDateFromCal.replace(/-/g,'');},
				'endDate' : function(){return preInWhsDateToCal.replace(/-/g,'');},
				'searchOption'  : function(){return searchOption;},
				'approvalCd'  : function(){return approvalCd;},
				'searchOption2'  : function(){return searchOption2;},
				'mainGubun' : function(){return mainGubunVal;},
				}	
		},	
		rowId : 'lotNo',
		columns : [ 
				{data : 'mainGubunNm'},
				{data : 'preInWhsDate', 
					render : function(data, type, row, meta){
						if(data != null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					}
				}, 
				{data : 'inWhsDate', 
					render : function(data, type, row, meta){
						if(data != null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					}
				}, 
				{data : 'approvalNm',
					render : function(data, type, row, meta){
						if(data!=null){
							if(data=="승인"){
								return data;
							}else{
								return '<span style="color: red">'+data+'</span>';
							}
						}else{
							return '-';	//미승인 시(승인 처리 안하는 값 )
						}
					}
				}, 
				{data : 'inspectDate',
					render : function(data, type, row, meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					}
				}, 
				{data : 'barcodeNo'},
				{data : 'locationNm',
					render : function(data, type, row, meta){
						if(data != null){
							return data;
						}else{
							return '-';
						}
					}
				},
				{data : 'areaNm',
					render : function(data, type, row, meta){
						if(data != null){
							return data+" / "+row['floorCd'];
						}else{
							return '-';
						}
					}
				},
				{data : 'itemModel'},				
				{data : 'itemCd'},
				{data : 'itemNm'},
				{data : 'itemUnit'},
				{data : 'preInWhsQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return addCommas(data);
						}else{
							return '0';
						}
					}
				},
				{data : 'pairCnt',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return addCommas(data);
						}else{
							return '0';
						}
					}
				},
				{data : 'faultyCnt',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return addCommas(data);
						}else{
							return '0';
						}
					}
				},
				{data : 'inWhsQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						return addCommas(data);
					}
				},
				{data : 'diffQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data>0){
							return '<span style="color: blue">'+addCommas(data)+'</span>';
						}else{
							return addCommas(data);
						}
					}
				},
				{data : 'lotNo'},
		],
	    order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs: [
			//{ "targets": [9,10,11,12,13] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        	
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

	//바코드 상세 목록
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>",
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
			url : '<c:url value="io/inOutWhsAdmRead"/>',
			type : 'GET',
			data : {
				'barcodeNo' : function(){return barcodeNo;},
			},
		},
		columns : [
				{data : 'barcodeNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
							var html = '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>';
							html += '<input type="hidden" class="form-control" name="poNo" value="'+poNo+'">';	
							html += '<input type="hidden" class="form-control" name="poSeq" value="'+poSeq+'">';	
							html += '<input type="hidden" class="form-control" name="inSeq" value="'+inSeq+'">';
		    				return html;	
						} else{
							var html = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>';
							html += '<input type="hidden" class="form-control" name="poNo" value="'+poNo+'">';	
							html += '<input type="hidden" class="form-control" name="poSeq" value="'+poSeq+'">';	
							html += '<input type="hidden" class="form-control" name="inSeq" value="'+inSeq+'">';
		    				return html;	
						}		    			
		    		}
				}, 
				{data : 'itemCd',
					render: function(data, type, row, meta) {	
						var html='';
						if(data!=null){
							html += '<input type="text" class="form-control" name="itemCd" value="'+data+'" style="width:100%;text-align:center;" disabled>';		
							html += '<input type="hidden" class="form-control" name="itemSeq" value="'+row['itemSeq']+'">';		
							
							return html;		
						} else{
							html += '<input type="text" class="form-control" name="itemCd" value="'+itemCd+'" style="width:100%;text-align:center;" disabled>';		
							html += '<input type="hidden" class="form-control" name="itemSeq" value="'+itemSeq+'">';		
							
							return html;
						}		    			
		    		}
				}, 
				{data : 'itemNm',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="'+data+'" disabled>';		
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="'+itemNm+'" disabled>';	
						}		
	    			}
				}, 
				{data : 'itemModel',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModel" value="'+data+'" disabled>';			
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModel" value="'+itemModel+'" disabled>';	
						}			    			
		    		}
				}, 
				{data : 'itemUnit',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemUnit" value="'+data+'" disabled>';			
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemUnit" value="'+itemUnit+'" disabled>';	
						}		
					},
				}, 
				{data : 'inWhsQty',
					render: function(data, type, row, meta) {
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="inWhsQty" value="'+data+'" disabled>';			
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="inWhsQty" value="'+inWhsQty+'" disabled>';	
						}				
		    		}
				},
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
		btnView = 'edit';
		
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
			
			if(check2){
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
		                   $('#mainGubun').val(data.mainGubun);
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
	

	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check2=true;  	
		if(e.keyCode == 13){
			if(!$.trim($('#locationNm').val())){
				toastr.warning('창고번호를 스캔해주세요.');
				$('#locationNo').focus();
				check2 = false;
				return false;
			}
			
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
			}
			
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').focus();
					$('#barcodeNo').select();
					check2 = false;
					return false;
				}
			});
			
			var mainGubunCheck = false;
			var tempMainGubun = '';
			
			$.ajax({
            	url: '/io/inOutWhsAdmRead',
                type: 'GET',
                async : false,
                data: {
                	'barcodeNo'  :  $('#barcodeNo').val()               
                },
                success: function (res) {
                    let data = res.data;
                    
                    if (res.result == 'ok') {
	                    
                    	if(data.mainGubun != $('#mainGubun').val()){
                    		mainGubunCheck = true;
                    		if($('#mainGubun').val() == '001'){
                    			tempMainGubun = '사출';
                    		} else {
                    			tempMainGubun = '봉제';
                    		}
                    	}
                        
                    }
	             }
	        });

			if(mainGubunCheck){
				toastr.warning('해당 창고는 '+tempMainGubun+'입니다. 확인해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').select();
				check2 = false;
				return false;
			}
			
			if(check2){
			 	$.ajax({
	            	url: '/io/inOutWhsAdmRead',
	                type: 'GET',
	                data: {
	                	'barcodeNo'  :  $('#barcodeNo').val()               
	                },
	                success: function (res) {
	                    let data = res.data;
	                    
	                    if (res.result == 'ok') {
		                    poNo = data.poNo;
		                    poSeq = data.poSeq;
		                    inSeq = data.inSeq;
		                    barcodeNo = data.barcodeNo;
		                    itemSeq = data.itemSeq;
		                    itemCd = data.itemCd;
		                    itemNm = data.itemNm;
		                    itemModel = data.itemModel;
		                    itemUnit = data.itemUnit;
		                    inWhsQty = data.inWhsQty;
// 		                    inWhsQty = data.inspectYn=='001'?addCommas(data.pairCnt):addCommas(data.pairCnt);
		                    
		                    areaNm = data.areaNm==null?"-":data.areaNm;
		                    
	                    	$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
							//$('#barcodeNo').focus();
							$('#barcodeNo').select();
							$('#btnSave').removeClass('d-none');
	                        toastr.success("추가되었습니다.");
	                        
	                    }else{
	                    	if(res.result == 'empty') {
		                    	toastr.warning("등록되지 않은 바코드입니다. 확인해주세요.");
		                    }else if(res.result == 'notApproval') {
		                    	toastr.warning("승인된 바코드가 아닙니다. 확인해주세요.");
		                    }else if(res.result == 'notInspect') {
		                    	toastr.warning("수입검사된 바코드가 아닙니다. 확인해주세요.");
		                    }else if(res.result == 'notRemain') {
		                    	toastr.warning("남은수량이 없습니다. 확인해주세요.");
		                    }else if(res.result == 'error') {
		                    	toastr.error(res.message, '', {timeOut: 5000});
		                    }    

	                    	$('#barcodeNo').select();
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

	
	// 저장 처리
	$('#btnSave').on('click',function() {
		
		var dataArray = new Array();		
		var check = true;  	

		if(!$.trim($('#locationNo').val())){
			toastr.warning('창고 바코드를 스캔해주세요.');
			$('#locationNo').focus();
			check = false;
			return false;
		}
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
				 
			var rowData = new Object();
			rowData.poNo = $(this).find('td input[name=poNo]').val();
			rowData.poSeq = $(this).find('td input[name=poSeq]').val();
			rowData.inSeq = $(this).find('td input[name=inSeq]').val();
			
			rowData.inWhsDate = $('#inWhsDate').val().replace(/-/g,'');
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();	
			rowData.inWhsQty = $(this).find('td input[name=inWhsQty]').val().replace(/,/g,'');	
			rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();	
			rowData.locationNo = $('#locationNo').val();
			rowData.locationCd = $('#locationCd').val();
			rowData.areaCd = $('#areaCd').val();
			rowData.floorNm = $('#floorNm').val();
			
	        dataArray.push(rowData);
	        console.log(dataArray);
		});
			
		if(check){
			$.ajax({
				url : '<c:url value="io/inOutWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {		
					console.log(res.result)		
					if (res.result == 'ok') {
						// 보기					
						$('#inOutWhsTable').DataTable().ajax.reload(function() {});	
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val("");
						$('#barcodeNo').focus();
						$('#locationCd').val("");
						$('#mainGubun').val("");
						$('#locationNm').val("");
						$('#areaCd').val("");
						$('#areaNm').val("");
						$('#floorCd').val("");
						$('#floorNm').val("");
						$('#locationNo').val("");
						$('#btnSave').addClass('d-none');
						
						toastr.success('저장되었습니다.');
					
					} else {
						toastr.error(res.message);
					}

					//처리중..
					$('#my-spinner').hide();
				},
				complete : function() {
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
	html1 += '<select name="mainGubun" id="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '&nbsp;<select class="custom-select" id="searchOption"><option value="">전체</option><option value="001" selected>가입고일</option><option value="002">수입검사일</option><option value="003">입고일</option></select>';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
	html1 += '<select class="custom-select" id="approvalCd">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">입고여부</label>'; 
	html1 += '<select class="custom-select" id="searchOption2">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">입고</option>';
	html1 += '<option value="002">미입고</option>';
	html1 += '</select>';
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
    
	$('#inOutWhsTable_length').html(html1);
	$('#preInWhsDateFrom').val(preInWhsDateFromCal);
	$('#preInWhsDateTo').val(preInWhsDateToCal);

	selectBoxAppend(mainGubunArray, "mainGubun", "", "1");
	
	// 조회버튼
	$('#btnRetv').on('click', function() {
    	preInWhsDateFromCal =  $('#preInWhsDateFrom').val();
    	preInWhsDateToCal =  $('#preInWhsDateTo').val();
    	searchOption = $("#searchOption").val();
		approvalCd = $('#approvalCd').val();
		searchOption2 = $('#searchOption2').val();
		mainGubunVal =  $('#mainGubun option:selected').val();
		$('#inOutWhsTable').DataTable().ajax.reload( function () {});
    });	


	// 전체조회 버튼
	$('#btnAllList').on('click', function() {
		preInWhsDateFromCal =  "";
		preInWhsDateToCal =  "";
		searchOption = '';
		approvalCd ='';
		searchOption2 = '';
    	$('#inOutWhsTable').DataTable().ajax.reload( function () {});
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
				pageLength : 20,
				ajax : {
					url : 'bm/baseInfoWhList',
					type : 'GET',
					data : {
						'baseInfoGubun' : "001",
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
				
				$('#locationPopupModal').modal('hide');
			});
		} else {
			$('#locationPopupTable').DataTable().ajax.reload(function() {});
		}

		$('#locationPopupModal').modal('show');
		selectBoxAppend(locationCdCode , "locationCd",'', "2");
	}
	
	
	function uiProc(flag) {
		$('#inWhsDateCalendar').attr('disabled',flag);
		$('#locationCd').attr('disabled',flag);
		$('#areaCd').attr('disabled',flag);
		$('#floorCd').attr('disabled',flag);
		$('#barcodeNo').attr('disabled',flag);
		
	}

/* 
	function ToFloat(number){

		var tmp = number + "";

		if(tmp.indexOf(".") != -1){

			//number = number.toFixed(4);

			number = number.replace(/(0+$)/, "");
			number = number.slice(0,-1);

		}

		return number;

	}
	 */
</script>
</body>
</html>