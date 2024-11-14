<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>
<html>
<div class="page-wrapper" id="page-wrapper">

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">개별출고</li>
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
						<button id="left-width-btn2" onclick="openrNav2();"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="preOutWhsAdmTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="10%">
								<col width="8%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>출고일</th>
									<th>LOT NO</th>
									<th>품번</th>
									<th>품명</th>
									<th>차종</th>
									<th class="text-center">출고량</th>
									<th>담당자</th>
									<th>Barcode No</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix"
				id="rfSidenav" style="width: 43%;">
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
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>출고일</th>
										<td>
											<div class="form-group input-sub m-0 row"
												style="min-width: 100%">
												<input class="form-control" type="text" id="preOutWhsDate"
													name="preOutWhsDate" disabled style="min-width: 100%" />
												<button
													onclick="fnPopUpCalendar(preOutWhsDate,preOutWhsDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="preOutWhsDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
										<th>담당</th>
										<td><input type="hidden" id="preWorkCharger"
											name="preWorkCharger">
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="text" class="form-control"
														id="preWorkChargerNm" name="preWorkChargerNm"
														style="min-width: 100%" disabled>
													<button type="button"
														class="btn btn-primary input-sub-search"
														id="btnItemChargr" onClick="selectItemChargr()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>창고</th>
										<td colspan="3">
											<input type="text"style="max-width: 100%;" class="form-control" value="재공창고" disabled>
											<input type="hidden"style="max-width: 100%;" class="form-control" id="locationNo" value="20210825-001">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="locationCd" value="003">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="areaCd" value="001">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="floorCd" value="재공창고">
										</td>
									</tr>
									<tr>
										<th>Barcode No</th>
										<td colspan="3"><input type="text"
											style="max-width: 100%;" class="form-control" id="barcodeNo"
											placeholder="스캐너만 입력"></td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3"><input type="text"
											style="max-width: 100%;" class="form-control" id="inWhsDesc"></td>
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
										id="btnDelConfirmLoading" type="button" disabled>
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
										<col width="22%">
										<col width="14%">
										<col width="18%">
										<col width="6%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>바코드</th>
											<th>CODE</th>
											<th>ITEM</th>
											<th>단위</th>
											<th>남은 출고량</th>
											<th>출고량</th>
											<th>창고</th>
											<th>구역/위치</th>
										</tr>
									</thead>
								</table>
							</div>

							<%-- <div class="table-responsive d-none" id="printarea">
								<div style="text-align:center; font-size: 30px;"><span><b>제품 출고 내역</b></span></div>
								<br>
								<table id="printTable" class="table table-bordered" style="border: 2px; solid; black;">
									<colgroup>
										<col width="25%">
										<col width="25%">
										<col width="35%">
										<col width="20%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th style="font-size: 20px; text-align:left;">작지번호</th>
											<td><span id="printWorkOrdNo"style="font-size: 20px;"></span></td>
											<td colspan="2"><svg id="workOrdNoBarcode"></svg></td>
										</tr>
										<tr>
											<th style="font-size: 20px; text-align:left;">품명</th>
											<td colspan="3"><span id="printItemNm" style="font-size: 20px;"></span></td>
										</tr>
										<tr>
											<th style="font-size: 20px;">바코드</th>
											<th style="font-size: 20px;">CODE</th>
											<th style="font-size: 20px;">ITEM</th>
											<th style="font-size: 20px;">출고량</th>
										</tr>
									</thead>
								</table>
							</div> --%>
						</form>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
</div>
<!-- /.page-wrapper -->
<%@include file="../layout/bottom.jsp" %>
<style>
#th{
	padding-bottom: 12px;
}
</style>
<script>

	let currentHref = "iosc0180";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","개별출고"); 
	
	let viewIdx;
	let btnView;
	let sideView = 'add';
	uiProc(true);
	var tableIdx=null;
	
	var preOutWhsDateFromCal =  "${serverDateFrom}";
	var preOutWhsDateToCal =  "${serverDateTo}";
	var preOutWhsDateCal =  "${serverDateTo}";	
	var approvalCd;
	var barcodeNo;
	var statusCd='O';
	var createOrUpdate = 'create';
	var checkPreOutWhsDate ='';
	var checkPreWorkCharger = '';
	var itemCd=null;
	var itemRev=null;
	var itemNm=null;
	var partGubun=null;
	var partUnit=null;
	var remainQty=null;
	var workOrdNo=null;

	var poNo = null;
	var poSeq = null;
	var inSeq = null;
	var outSeq = null;
	var lotNo = null;
	
 	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	
	//공통코드 처리 시작		
 	var locationCdCode = new Array(); // 상태유무
 	
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locationCdCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝
	
	$('#preOutWhsDate').val(preOutWhsDateCal);
	$('#preWorkCharger ').val(userNumber);
	$('#preWorkChargerNm').val(userNm);
	
	//선택박스 처리
	selectBoxAppend(locationCdCode , 'locationCd','', "1");
	selectBoxAppend(locationCdCode , 'prcsslocCd','', "1");
	
	
	let preOutWhsAdmTable = $('#preOutWhsAdmTable').DataTable({
		dom:  "<'row'<'col-sm-5 col-md-3'l><'col-sm-12 col-md-3'f>>"
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
			url : '<c:url value="io/preOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return preOutWhsDateFromCal.replace(/-/g,'');},
				'endDate' 	: function(){return preOutWhsDateToCal.replace(/-/g,'');},
				'outCase' 	: '002'
				}	

		},	
		rowId : 'lotNo',
		columns : [ 
				{data : 'preOutWhsDate',
					render: function(data,type,row,meta){
						return moment(data).format('YYYY-MM-DD');
					}
				}, 
				{data : 'lotNo'},
				{data : 'partCd'},
				{data : 'partNm'},
				{data : 'preOutQty',
					render: function(data, type, row, meta) {
						return addCommas(Math.floor(data));
					}, "className": "text-right"
				},
				{data : 'preWorkChargerNm'},
				{data : 'barcodeNo'},
				{data : 'inWhsDesc'}
		],
	    order: [
	        [ 0, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

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
			url : '<c:url value="io/barcodeCommonList"/>',
			type : 'GET',
			data : {
				'barcodeNo'  : function(){return $('#barcodeNo').val()}
			},
		},
		rowId : 'barcodeNo',
		columns : [
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
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+data+'" disabled>';	
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+remainQty+'" disabled>';	
						}			    			
		    		}
				},
				{data : 'preOutQty',
					render: function(data, type, row, meta) {	
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="">';				
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
		order : [ [ 0, 'asc' ] ],
		
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
		btnView = 'delete';
		
	});

	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check = true;
		
		if(e.keyCode == 13){
			$('#btnGoPrint').attr('disabled',true);
			
			
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').val().select();
				check=false;
				return false;
			}

			/* if($('#barcodeNo').val().length != 21) {
			
				toastr.warning('잘못된 바코드 입니다. 확인해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').select();
				check=false;
				return false;
			} */


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
	            	url: '<c:url value="io/barcodeCommonList"/>',
	                type: 'GET',
	                data: {
	                	'barcodeNo'	:  $('#barcodeNo').val(),
	                	'itemCd'	:  function(){return itemCd},      
	                	'itemRev'	:  function(){return itemRev},       
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

			                console.log('remainQty : '+remainQty);
			                 
			                $('#barcodeDtlTable').DataTable().row.add({}).draw(false);
			                $('#barcodeNo').select();
							$('#btnSave').removeClass('d-none');
	
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
		                    }/* else if(res.result == 'notCommonGubun') {
		                    	toastr.warning("공통부품 바코드가 이닙니다. 자채출고(작업지시)에서 출고해주세요.");
		                    } */else if(res.result == 'error') {
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


	// BOM조회 버튼 클릭
	$('#btnSelectEbom').on('click', function() {
		if(!$.trim($('#workOrdNo').val())) {
			toastr.warning('작지번호를 선택해주세요.');
			$('#btnWorkOrdNo').focus();
			return false;
		}

		selectEbom();
		
	});
	
	// 라인삭제버튼 
	$('#btnDel').on('click', function() {
		if(btnView != 'delete') {
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
		var check=true;  	

		if(!$.trim($('#preWorkChargerNm').val())){
			toastr.warning('담당을 선택해주세요.');
			$('#btnItemChargr').focus();
			return false;
		}
		
		for(var i=0; i<$('#barcodeDtlTable tbody tr').length; i++){
			$('#barcodeDtlTable tbody tr').eq(i).removeClass('selected');
			var a = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(4).find('input[name=remainQty]').val();	//남은 출고량
			var b = $('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').val().replace(/,/g,'');	//출고량
			if(parseInt(a)<b){
				$('#barcodeDtlTable tbody tr').eq(i).addClass('selected');
				$('#barcodeDtlTable tbody tr').eq(i).find('td').eq(5).find('input[name=preOutQty]').focus();
				toastr.warning("남은 출고량을 넘게 입력하였습니다.");
				return false;
			}
		}

		$('#barcodeDtlTable tbody tr').each(function(index, item){

			if($(this).find('td input[name=preOutQty]').val()=='' || $(this).find('td input[name=preOutQty]').val()=='0') {
				toastr.warning("출고량을 확인해주세요.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;
				return false;
			}

			/* if($(this).find('td input[name=preOutQty]').val().replace(/,/g,'')>$(this).find('td input[name=remainQty]').val().replace(/,/g,'')) {
				toastr.warning("출고량을 초과하였습니다.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;

				//처리완료..
				$('#my-spinner').hide();
				
				return false;
			} */
			
			//처리중..
			$('#my-spinner').show();
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

			rowData.locationNo = $('#locationNo').val();
			rowData.locationCd = $('#locationCd').val();
			rowData.areaCd = $('#areaCd').val();
			rowData.floorCd = $('#floorCd').val();

			rowData.outCase = "002";
			
	        dataArray.push(rowData);
	        console.log(rowData)
		});

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
						
						// 보기					
						$('#preOutWhsAdmTable').DataTable().ajax.reload(function() {});	
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val("");
						$('#barcodeNo').focus();
						
						$('#btnSave').addClass('d-none');

						toastr.success('저장되었습니다.');
					
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
					
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
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
    	

  	//작업지시번호 목록 조회 팝업
 	var workOrdPopUpTable;
 	function selectWorkOrd(){	   	
		if(workOrdPopUpTable == null || workOrdPopUpTable == undefined)	{
			//작지상세 테이블 
			 workOrdPopUpTable = $('#workOrdPopUpTable').DataTable({
				language : lang_kor,		
				paging : true,
				searching : true,
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
			    $('#barcodeDtlTable').DataTable().clear().draw();
		    	var data = workOrdPopUpTable.row( this ).data();
		    	workOrdNo = data.workOrdNo;
				$('#workOrdNo').val(workOrdNo);
				itemCd = data.itemCd;
				itemRev = data.itemRev;

			
				$('#workOrdPopUpModal').modal('hide');		
			});
			
		}else{
			$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrdPopUpModal').modal('show');		
   	} 

 	//BOM코드 팝업 시작
	var itemMotorEbomPopupTable;
	function selectEbom() {
		if (itemMotorEbomPopupTable == null || itemMotorEbomPopupTable == undefined) {
			itemMotorEbomPopupTable = $('#itemMotorEbomPopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-5'B><'col-sm-12 col-md-7'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : false,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : false,
				pageLength : 20,
				ajax : {
					url : 'bm/itemMotorEBomList',
					type : 'GET',
					data : {
						 'itemCd'  : function(){return itemCd;},
						 'itemRev'  : function(){return itemRev;},
						 'partGubun'  : "003",
					}
				},
				rowId : 'contNo',
				columns : [ {
					render: function(data, type, row, meta) {	
						return meta.row + meta.settings._iDisplayStart + 1;		
					}	
				},
				{data : 'partCd'}, 
				{data : 'partNm'}, 
				{data : 'partSpec'}, 
				{data : 'partUnitNm'}, 
				{data : 'partConsumpt'}, 
				],
				columnDefs : [ {
					"targets" : '_all' , "className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [ 
						{
							extend : 'print',
							text : 'Print',
							title : '제품 출고 BOM 내역',
							customize : function(wind){
								var html = "<tr><th colspan='2'>작지번호</th>";
								html += "<td colspan='4'>"+workOrdNo+"</td></tr>";
								html += "<tr><th colspan='2'>ITEM</th>";
								html += "<td colspan='4'>"+itemNm+"</td></tr>";
								
								$(wind.document.body).css('text-align','center').css('font-size','30px');
								$(wind.document.body).find('table').css('text-align','center') .css('font-size','20px');;
								$(wind.document.body).find('table thead').prepend(html);
							},
							className : 'btn-success',
							init : function(api,node,config){
								$(node).removeClass('btn-secondary')
							}
						}
				],
			});

			$('#itemMotorEbomPopupTable tbody').on('click', 'tr', function () {
		    	var data = itemMotorEbomPopupTable.row( this ).data();
				
				console.log('dd');
				$('#itemMotorEbomPopupModal').modal('hide');		
			});
			
		}else{
			$('#itemMotorEbomPopupTable').DataTable().ajax.reload(function() {});
		}
		$('#itemMotorEbomPopupModal').modal('show');		
   	} 


   	
       	
	var sysdate = "${serverTime}";
	   
    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateFrom" name="preOutWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateFrom,preOutWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preOutWhsDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateTo" name="preOutWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateTo,preOutWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preOutWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
    
	$('#preOutWhsAdmTable_length').html(html1);
	$('#preOutWhsDateFrom').val(preOutWhsDateFromCal);
	$('#preOutWhsDateTo').val(preOutWhsDateToCal);
	
	// 조회버튼
	$('#btnRetv').on('click', function() {
		preOutWhsDateFromCal =  $('#preOutWhsDateFrom').val();
    	preOutWhsDateToCal =  $('#preOutWhsDateTo').val();
		$('#preOutWhsAdmTable').DataTable().ajax.reload( function () {});
    });

	$('#btnAllList').on('click', function() {
		preOutWhsDateFromCal =  "";
		preOutWhsDateToCal =  "";
		$('#preOutWhsAdmTable').DataTable().ajax.reload(function () {});
    });

	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta){

		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '"><option value="">'+ '선택' +'</option>';
		
		var option;
		for(key in obj) {
			var tmp; 
			if(obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}	
	
	
	function uiProc(flag) {

	}

	$(document).on('keyup',"input[name=preOutQty]", function(event){
		
		var preInWhsQtyData = $(this).val();
		
		if ( !(	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)	) {
			/* $('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); */
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
 			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(addCommas(uncomma($(this).val())));
		
	});

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	} 

/* 	function goPrint(title){
	     var sw=screen.width;
	     var sh=screen.height;
	     var w=750;
	     var h=700;//세로길이
	     var xpos=(sw-w)/2; //화면에 띄울 위치
	     var ypos=(sh-h)/2; //중앙에 띄웁니다.
	 
	     var pHeader="<html><head><link rel='stylesheet' type='text/css'></head><body>";
	     var pgetContent=document.getElementById("printarea").innerHTML + "<br>";
	
	     
	     
	     //innerHTML을 이용하여 Div로 묶어준 부분을 가져옵니다.
	     var pFooter="</body></html>";
	     pContent=pHeader + pgetContent + pFooter; 


	     
	     pWin=window.open("","print","width=" + w +",height="+ h +",top=" + ypos + ",left="+ xpos +",status=yes,scrollbars=yes"); //동적인 새창을 띄웁니다.
	     pWin.document.open(); //팝업창 오픈

	     
	     
	     pWin.document.write(pContent); //새롭게 만든 html소스를 씁니다.
	     
	     //pWin.document.close(); //클로즈
	     pWin.print(); //윈도우 인쇄 창 띄우고
	     pWin.close(); //인쇄가 되던가 취소가 되면 팝업창을 닫습니다.  
	   } */


</script>

   	

</body>
</html>
