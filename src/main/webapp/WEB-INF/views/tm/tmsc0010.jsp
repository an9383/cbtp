<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">초기재고관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
	
              <div class="card top_sortbox p-2">
                <div class="row">
              	 <!-- 구분 -->
                <label class="input-label-sm">구분</label>
                 <div class="input-sub-md mr-4">
                   <select id="mainGubun" class="custom-select custom-select-sm" style="width: 120%;" onchange="changeMainGubun();"></select>
                 </div>
                  <!-- 구분 -->
                <label class="input-label-sm">품목구분</label>
                 <div class="input-sub-md">
                   <select id="itemGubun" class="custom-select custom-select-sm" style="width: 120%;" onchange="changeItemGubun();"></select>
                 </div>
                <!-- 작성자 -->
                <label class="input-label-sm ml-3">초기재고 등록자</label>
                   <div class="input-sub-md">
                    <div class="row">
						<div class="input-sub m-0" style="width: 80%;">
							<input type="hidden" class="form-control" id="stockChargr" name="stockChargr" disabled>
							<input type="text" class="form-control" id="stockChargrNm" name="stockChargrNm" disabled>
							<button type="button"
								class="btn btn-primary input-sub-search"
								id="btnStockChargr" onClick="selectStockChargr()">
								<span class="oi oi-magnifying-glass"></span>
							</button>
						</div>
 					</div>
                  </div>
               </div>
            </div>
		<div class="row table-wrap-hid">
	    <!--======================== .left-list ========================-->
            <!-- .card-header -->
            <div class="">
             <!-- .nav-tabs tablist -->
             <ul class="nav nav-tabs card-header-tabs m-0">
                <li class="nav-item">
                   <a class="nav-link active show" data-toggle="tab" href="#tab1" id="tab1Nav">등록</a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" data-toggle="tab" href="#tab2" id="tab2Nav">재고반영 및 취소</a>
                </li>
             </ul><!-- /.nav-tabs -->
            </div><!-- /.card-header -->
            
			<div class="left-list" id="left-list">
              <!--====================TAB-UI=======================-->
                <div class="card-body p-0">
                  <div id="myTabContent" class="tab-content">
                    <!--========등록 탭=====-->
                    <div class="tab-pane fade active show" id="tab1">	
                     <div class="card-body col-sm-12 p-1 mb-2">
                   		<button type="button" class="btn btn-primary float-right mr-1" id="btnSave">저장</button>
                   		<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
                   		<button type="button" class="btn btn-success float-right mr-1" id="btnAdd">추가</button>
                  		<div class="row">
                  		 <label class="input-label-sm">재고반영일자</label>
		                <!-- 일자 -->
		                 <div class="input-sub-md">
		                 <div class="form-group input-sub m-0 row">
						   <input class="form-control" style="width:97px;" type="text" id="startDate" name="startDate" disabled />
						   <button onclick="fnPopUpCalendar(startDate,startDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="startDateCalendar" type="button" >
						   <span class="oi oi-calendar"></span></button>
		                 </div>
		                 </div>
                  		  <!-- 일자 -->
	              		  <label class="input-label-sm">LOT생성일자</label>
	                      <div class="input-sub-md">
		                     <div class="form-group input-sub m-0 row">
							   <input class="form-control" style="width:97px;" type="text" id="lotDate" disabled />
							   <button onclick="fnPopUpCalendar(lotDate,lotDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="lotDateCalendar" type="button" >
							   <span class="oi oi-calendar"></span></button>
		                     </div>
	                      </div>
	            		   <!-- 창고 -->
		                  <label class="input-label-sm">창고</label>
							 <div class="input-sub m-0 mr-2" style="max-width: 100px;">
								<input type="hidden" class="form-control" id="locNo" disabled>
							 	<input type="hidden" class="form-control" id="locCd" disabled>
								<input type="text" class="form-control" id="locNm" disabled>
								<button type="button"
									class="btn btn-primary input-sub-search"
									id="btnLocationCd" onClick="selectLocationCd()">
									<span class="oi oi-magnifying-glass"></span>
								</button>
		                   </div>
		                     <!-- 구역 -->
		                  <label class="input-label-sm">구역</label>
							 <div class="input-sub m-0 mr-2" style="max-width: 70px;">
								<!-- <input type="hidden" class="form-control" id="areaCd"  disabled> -->
								<input type="text" class="form-control" id="areaNm" style="text-align:center;" disabled>
							 </div>
		                     <!-- 위치 -->
		                  <label class="input-label-sm">위치</label>
							 <div class="input-sub mr-2" style="max-width: 70px;">
								<input type="text" class="form-control" id="floorNm" style="text-align:center;" disabled>
							 </div>
							 <button type="button" class="btn btn-info float-right mr-1" id="btnApply3">일괄적용</button>
							 <button type="button" class="btn btn-info float-right mr-1" id="btnReset">초기화</button>
		                </div>
				          </div>
				           <!-- table -->
					       <div class="table-responsive">
					      	<table class="table table-bordered" id="stockAdjustAdmTable" style="width:100%">
					      		<colgroup>
						      		<col width="3%;">
						      		<col width="7%;">
						      		<col width="5%;">
						      		<col width="5%;">
						      		<col width="15%;">
						      		<col width="17%;">
						      		<col width="9%;">
						      		<col width="9%;">
						      		<col width="9%;">
						      		<col width="7%;">
						      		<col width="7%;">
						      		<col width="7%;">
						      	</colgroup>
						      	<thead class="thead-light" style="font-size: 11px;">
									<tr>
										<th><input type="checkbox" id="btnAllCheck3"></th>
										<th class="text-center">재고반영일자</th>
										<th class="text-center">구분</th>
										<th class="text-center">품목구분</th>
										<th class="text-center">품번</th>
										<th class="text-center">품명</th>
										<th class="text-center">Maker</th>
										<th class="text-center">실사재고</th>
										<th class="text-center">LOT생성일자</th>
										<th class="text-center">창고</th>
										<th class="text-center">구역/위치</th>
										<th class="text-center">비고</th>
									</tr>
								</thead>
					     	</table>
				           </div>
                          </div>
                          <!--========재고반영및 취소 탭=====-->
                          <div class="tab-pane fade" id="tab2">
                           <div class="card-body col-sm-12 p-1 mb-2">
                        	   <button type="button" class="btn btn-danger float-right mr-1" id="btnDel2">삭제</button>
						        <button type="button" class="btn btn-primary float-right mr-1" id="btnCancel">반영취소</button>
					        	<button type="button" class="btn btn-primary float-right mr-1" id="btnApply">재고반영</button>
                          		<div class="row">
                          		
                          			<!-- <label class="input-label-sm">일자</label>
								    <div class="form-group input-sub m-0 row"></div>
								    <input class="form-control" style="width:97px;" type="text" id="approvalDateFrom" name="approvalDateFrom" disabled/>
								    <button onclick="fnPopUpCalendar(approvalDateFrom,approvalDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="approvalDateFromCalendar" type="button">
								    <span class="oi oi-calendar"></span>
								    </button>
								    </div>
								     ~<div class="form-group input-sub m-0 row">
								    <input class="form-control" style="width:97px;" type="text" id="approvalDateTo" name="approvalDateTo" disabled/>
								    <button onclick="fnPopUpCalendar(approvalDateTo,approvalDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="approvalDateToCalendar" type="button">
								    <span class="oi oi-calendar"></span>
								    </button>
							   		</div> -->
							   		
	                          		<label class="input-label-sm">반영여부</label>
								    <div class="custom-control custom-radio row">
									<input type="radio" class="custom-control-input" name="approvalYn" id="apr3" value="" checked> 
									<label class="custom-control-label input-label-sm" for="apr3">전체</label></div>
									<div class="custom-control custom-radio row">
									<input type="radio" class="custom-control-input" name="approvalYn" id="apr1" value="Y"> 
									<label class="custom-control-label input-label-sm" for="apr1">반영</label></div>
									<div class="custom-control custom-radio row">
									<input type="radio" class="custom-control-input" name="approvalYn" id="apr2" value="N"> 
									<label class="custom-control-label input-label-sm" for="apr2">미반영</label></div>
				         		</div>
				         		
				           </div>
				           <!-- table -->
					       <div class="table-responsive">
					      	<table class="table table-bordered" id="stockAdjustAdmTable2" style="width:100%">
						      	<colgroup>
						      		<col width="2%">
						      		<col width="8%">
						      		<col width="5%">
						      		<col width="4%">
						      		            
						      		<col width="11%">
						      		<col width="12%">
						      		<col width="7%">
						      		<col width="6%">
						      		            
						      		<col width="6%">
						      		<col width="6%">
						      		<col width="10%">
						      		<col width="4%">
						      		<col width="4%">
						      		<col width="4%">
						      		<col width="7%">
						      		<col width="4%">
						      	</colgroup>
						      	<thead class="thead-light" style="font-size: 11px;">
									<tr>
										<th><input type="checkbox" id="btnAllCheck2"></th>
										<th class="text-center">전표번호</th>
										<th class="text-center">재고반영일자</th>
										<th class="text-center">품목구분</th>
										<th class="text-center">품번</th>
										<th class="text-center">품명</th>
										<th class="text-center">Maker</th>
										<th class="text-center">전산재고</th>
										<th class="text-center">실사재고</th>
										<th class="text-center">차이수량</th>
										<th class="text-center">BarcodeNo</th>
										<th class="text-center">창고</th>
										<th class="text-center">구역</th>
										<th class="text-center">위치</th>
										<th class="text-center">비고</th>
										<th class="text-center">반영여부</th>
									</tr>
								</thead>
					     	</table>
                          </div>
                        </div>
                      </div>
               </div><!-- /.card -->
               <!--====================/TAB-UI=======================-->
			</div>
			<!-- /.left-list -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
<!-- /.page-wrapper -->
<!-- 제품조회 모달 시작-->
<div class="modal fade bd-example-modal-xl" id="itemPartPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemPartPopUpLabel2">품목조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body ">
                   <div class="row ">
						<button type="button" class="btn btn-primary float-right mr-1" id="btnItemAdd">품목추가</button>
					</div>
                  <div class="table-responsive" style="height: 380px">
					<table id="itemAllPopupTable" class="table table-bordered">
						<colgroup>
				      		<col width="5%;">
				      		<col width="12%;">
				      		<col width="20%;">
				      		<col width="15%;">
				      		<col width="8%;">
				      		<col width="7%;">
				      		<col width="10%;">
				      	</colgroup>
						<thead class="thead-light">
		                    <tr>
		                    	<th></th>
	                            <th><input type="checkbox" id="btnAllCheck"></th>
	                            <th>품번</th>
	                            <th>품명</th>
	                            <th>Maker</th>
	                            <th>현재고</th>
	                            <th>창고</th>
	                            <th>구역/위치</th>
	                        </tr>
	                    </thead>
					</table>
				</div>
				<hr class="mb-2 mt-2">
				<div class="row">
					<button type="button" class="btn btn-danger float-right mr-1" id="btnItemDel">품목삭제</button>
				</div>
				<hr class="mb-2 mt-2">
				<div class="table-responsive" style="height: 250px">
					<table id="itemAllTempTable" class="table table-bordered">
						<colgroup>
				      		<col width="5%;">
				      		<col width="12%;">
				      		<col width="20%;">
				      		<col width="15%;">
				      		<col width="8%;">
				      		<col width="7%;">
				      		<col width="10%;">
				      	</colgroup>
						<thead class="thead-light">
		                    <tr>
		                    	<th></th>
	                            <th><input type="checkbox" id="btnAllCheck"></th>
	                            <th>품번</th>
	                            <th>품명</th>
	                            <th>Maker</th>
	                            <th>현재고</th>
	                            <th>창고</th>
	                            <th>구역/위치</th>
	                        </tr>
	                    </thead>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnGetItemList">가져오기</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>		
<!-- 제품조회 모달 종료-->
<%@include file="../layout/bottom.jsp"%>

<script>
	let currentHref = "tmsc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	$(document).attr("title", "초기재고관리");

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	
	var gubunVal=null;
	var index=0;
	var tableIdx=0;
	var uiProc;
	var sideView;
	var approvalYn=null;
	var locationCd="";
	var saGubunVal = null;
	var saGubunNmVal = null;
	var saTypeCdVal = null;
	var saTypeNmVal = null;
	
	var locCdList = ['002']; //제품/상품/반제품 -> 002, 자재/부자재 -> 001,003,004
	
	
	$('#stockChargr').val(userNumber);
	$('#stockChargrNm').val(userNm);
	$('#startDate').val(serverDate);
	$('#lotDate').val(serverDate);
	

	//$('#approvalDateFrom').val(serverDateFrom);
	//$('#approvalDateTo').val(serverDateTo);

	
	//공통코드 처리 시작
	var locationCdCode = new Array(); //창고
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locationCdCode.push(json);
	</c:forEach> 
	
	/* var areaCdCode = new Array(); //구역코드
	<c:forEach items="${areaCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	areaCdCode.push(json);
	</c:forEach>  */

	var mainGubunCode = new Array(); //구분(사출/봉제)
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunCode.push(json);
	</c:forEach> 
	
	var itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝
	
	selectBoxAppend(locationCdCode, "locationCd", "", "2");
	//selectBoxAppend(areaCdCode, "areaCd", "", "2");
	selectBoxAppend(mainGubunCode, "mainGubun", "", "");
	selectBoxAppend(itemGubunCode, "itemGubun", "", "");

	//tab1Nav 선택시
	$('#tab1Nav').on('click',function(){
		setTimeout(function(){
			$('#stockAdjustAdmTable').DataTable().ajax.reload(function(){
				stockAdjustAdmTable.draw()
			});
		},200);
	})
	
	//tab2Nav 선택시
	$('#tab2Nav').on('click',function(){
		
		setTimeout(function(){
			$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){
				stockAdjustAdmTable2.draw()
			});
		},200);
		
	})

	//구분 변경시
	$('#mainGubun').on('change',function(){
		$('#locNm').val('');
		$('#locCd').val('');
		$('#locNo').val('');
		$('#areaNm').val('');
		//$('#areaCd').val('');
		$('#floorNm').val('');
	}); 
	
	//기초재고관리 테이블
	let stockAdjustAdmTable = $('#stockAdjustAdmTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY : "600px",
		ajax : {
			url : '<c:url value="io/purchaseOrderDtlList"/>',
			type : 'GET',
			data : {				
			}	
		},	
		columns : [
				{
					render : function(data,type, row, meta){
						return '<input type="checkbox" name="check3">';	
					}
				}, 
				{data : 'approvalDate',
					render: function(data, type, row, meta) {
						return '<input class="form-control"  type="text" id="approvalDate'+index+'" name="approvalDate" value="'+serverDateTo+'" style="text-align:center;" disabled/>'; 
					}
				},
				{data : 'saGubun',
					render : function(data, type, row, meta){
						var html="";
						if(data!=null){
							html = '<input type="hidden" class="form-control" name="saGubun" value="'+data+'" style="text-align:center;" disabled>';	
							html +='<input type="text" class="form-control" name="saGubunNm" value="'+saGubunNmVal+'" style="text-align:center;max-width:100%;" disabled>';	
							return html;	
							
						} else{
							html =  '<input type="hidden" class="form-control" name="saGubun" value="" style="text-align:center;max-width:100%;" disabled>';
							html += '<input type="text" class="form-control" name="saGubunNm" value="" style="text-align:center;max-width:100%;" disabled>';
							return html;	
						}	
					}
				},
				{data : 'saTypeNm',
					render : function(data, type, row, meta){
						var html="";
						if(data!=null){
							html = '<input type="hidden" class="form-control" name="saType" value="'+saTypeCdVal+'" style="text-align:center;" disabled>';	
							html +='<input type="text" class="form-control" name="saTypeNm" value="'+data+'" style="text-align:center;max-width:100%;" disabled>';	
							return html;	
							
						} else{
							html =  '<input type="hidden" class="form-control" name="saType" value="" style="text-align:center;max-width:100%;" disabled>';
							html += '<input type="text" class="form-control" name="saTypeNm" value="" style="text-align:center;max-width:100%;" disabled>';
							return html;	
						}	
					}
				},
				{data : 'saCd',
					render : function(data, type, row, meta){
						var html = 	'';
						if(data!=null){
							html += '<input type="hidden" name="itemSeq" value="'+itemSeq+'">';		
							html += '<input type="text" class="form-control" name="saCd" value="'+data+'" style="text-align:center;max-width:100%;" disabled>';		
							return html;
						} else{
							html += '<input type="hidden" name="itemSeq" value="">';		
							html += '<input type="text" class="form-control" name="saCd" value="" style="text-align:center;max-width:100%;" disabled>';		
							return html;
						}	
					}
				},
				{data : 'saNm',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="text" class="form-control" name="saNm" value="'+data+'" style="text-align:center;max-width:100%;" disabled>';		
							
						} else{
							return '<input type="text" class="form-control" name="saNm" value="" style="text-align:center;max-width:100%;" disabled>';
						}	
					}
				},
				{data : 'itemMaker',
					render : function(data, type, row, meta){
						if(data!=null){
							return '<input type="text" class="form-control" name="itemMaker" value="'+data+'" style="text-align:center;max-width:100%;" disabled>';		
							
						} else{
							return '<input type="text" class="form-control" name="itemMaker" value="" style="text-align:center;max-width:100%;" disabled>';
						}	
					}
				},
				{data : 'realStockQty',
					render : function(data, type, row, meta){
						return '<input type="text" class="form-control" name="realStockQty" value="" style="text-align:right; max-width:100%;" onkeydown="moveFocus('+meta.row+')">';
					}
				},	
				{data : 'lotDate',
					render: function(data, type, row, meta) {
						
						var	html = '<div class="form-group input-sub m-0 row">';
							html += '<input class="form-control"  type="text" id="lotDate'+index+'" name="lotDate" value="'+serverDateTo+'" disabled/>' 
		    				html += '<button onclick="fnPopUpCalendar(lotDate'+index+',lotDate'+index+',\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" name="lotDateFromCalendar" type="button">';	
							html += '<span class="oi oi-calendar"></span></buton></div>';

							index++;
							
							return html;
					}
				},
				{data : 'locationNm',
					render : function(data, type, row, meta){
						var html =  '<input type="hidden" name="locationNo" value="'+row['locationNo']+'">';
						html +=  '<input type="hidden" name="locationCd" value="'+row['locationCd']+'">';
						html += '<input type="text" class="form-control" name="locationNm" value="'+data+'" style="text-align:center; max-width:100%;" disabled>';

						return html;
					}
				},
				{data : 'areaNm',
					render : function(data, type, row, meta){
						var html = '<input type="hidden" name="areaCd" value="'+row['areaCd']+'">';
						html +=  '<input type="hidden" name="floorNm" value="'+row['floorNm']+'">';
						html += '<input type="text" class="form-control" name="areaNm" value="'+data+" / "+row['floorNm']+'" style="text-align:center; max-width:100%;" disabled>';

						return html;
					}
				},
				{data : 'saDesc',
					render : function(data, type, row, meta){
						return '<input type="text" class="form-control" name="saDesc" value="" >';
					}
				},
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

	$('#stockAdjustAdmTable tbody').on('click','tr',function(e){
    	
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#stockAdjustAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		sideView="edit";
		tableIdx = $('#stockAdjustAdmTable').DataTable().row(this).index();
		$('input[name=realStockQty]').eq(tableIdx).select();
	});


	//커서이동
	function moveFocus(row){
		let rowCount = stockAdjustAdmTable.data().count()-1;	//행수
		
		if(event.keyCode == 13){
			if(rowCount >= row+1){
				console.log("커서이동입니다.");
				console.log("row:"+row);		//0
	
				setTimeout(function(){ 
					$('input[name=realStockQty]').eq(row+1).focus();
					$('input[name=realStockQty]').eq(row+1).select();
				},10);
				
				tableIdx = row+1;
			}else{
				setTimeout(function(){ 
					$('input[name=realStockQty]').eq(0).focus();
					$('input[name=realStockQty]').eq(0).select();
				},10);

				tableIdx = 0;
			}
		}
	}
	
	//단가 콤마 생성
 	$(document).on('keyup','input[name=realStockQty]',function(){
		$('input[name=realStockQty]').eq(tableIdx).val(addCommas(uncomma($(this).val())));
		
		if($('input[name=realStockQty]').eq(tableIdx).val()==""){
			$('input[name=realStockQty]').eq(tableIdx).val('0');
			$('input[name=realStockQty]').eq(tableIdx).select();
		}
	});

 	
	//구분 변경시
	function changeMainGubun(){
		//재고반영 및 취소탭 조회
		if($('#tab2Nav').attr('class').indexOf('active')!=-1){
			$('#stockAdjustAdmTable2').DataTable().ajax.reload();
		}
	} 

	
	//품목구분 변경시
	function changeItemGubun(){
		let itemGubunVal = $('#itemGubun option:selected').val();
		switch(itemGubunVal){
		case '001' : case '002' : case '003' : 
			locCdList=['002']; 
			break;
		case '004' : case '005' : 
			locCdList=['001','003','004']; 
			break;
		default: locCdList=['002']; 
		}

		//재고반영 및 취소탭 조회
		if($('#tab2Nav').attr('class').indexOf('active')!=-1){
			$('#stockAdjustAdmTable2').DataTable().ajax.reload();
		}

		$('#locNm').val('');
		$('#locNo').val('');
		$('#locCd').val('');
		$('#areaNm').val('');
		$('#floorNm').val('');
	} 
	
	//품목조회 팝업 상단 목록
	let itemAllPopupTable = $('#itemAllPopupTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		searching : true,
		scrollY: "270px",
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmList"/>',
			type : 'GET',
			data : {
				'tmMon' : function() {return $('#startDate').val().substring(0,7).replace(/-/g, '');},
				'tmDate' : function() {return $('#startDate').val().replace(/-/g, '');},
				'mainGubun' : function() {return $('#mainGubun').val();},
				'spType' : function() {return $('#itemGubun').val();},
				//'realQtyOption' : function() {return "001";},
				'locationCd' : function(){return $('#itemGubun').val()=="001"||$('#itemGubun').val()=="002"||$('#itemGubun').val()=="003"?"002":"001";}
			},
		},
		rowId : 'saCd',
		columns : [
			{
				data : 'itemSeq'
			},
			{
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="check">';
				}
			}, {
				data : 'spCd'
			}, {
				data : 'spNm',
				'className' : 'text-center'
			}, {
				data : 'itemMaker',
				'className' : 'text-center'
			}, {
				data : 'realQty',
				render : function(data, type, row, meta){
					return rmDecimal(data);
				},
				"className" : "text-right"
			}, {
				data : 'locationNm',
				'className' : 'text-center'
			}, {
				data : 'areaNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data + " / "+row['floorNm'] 
					}else{
						return '-';
					}
				},'className' : 'text-center'
			}, 
		],
		columnDefs : [ 
			{ targets: [6], render: $.fn.dataTable.render.number( ',' ), 'className' : 'text-right' },
			{ "targets" : [0],"visible" : false},
			{ "defaultContent" : "-","targets" : "_all","className" : "text-center"},
		],
		drawcallback : [{
			//itemAllPopupTable.columns.adjust().draw(); 
		}],
		order : [ [ 1, 'asc' ] ],
		buttons : [],
	});
    
	//품목조회 팝업 하단 목록
	let itemAllTempTable = $('#itemAllTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		searching: false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: "170px",
		ajax : {
			url : '<c:url value="tm/itemAllTempTableReset"/>',
			type : 'GET',
			data : {
				},
		},
		rowId : 'saCd',
		columns : [
			{
				data : 'itemSeq'
			},
			{
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="check4">';
				}
			}, {
				data : 'itemCd'
			}, {
				data : 'itemNm',
				'className' : 'text-center'
			}, {
				data : 'itemMaker',
				'className' : 'text-center'
			}, {
				data : 'realQty',
				render : function(data, type, row, meta){
					return rmDecimal(data);
				},
			}, {
				data : 'locationNm',
				'className' : 'text-center'
			}, {
				data : 'areaNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data + " / "+row['floorNm'] 
					}else{
						return '-';
					}
				},'className' : 'text-center'
			}, 
		],
		columnDefs : [ 
			{ targets: [6], render: $.fn.dataTable.render.number( ',' ), 'className' : 'text-right' },
			{"targets" : [0],"visible" : false},
			{"defaultContent" : "-","targets" : "_all","className" : "text-center"},
		],
		drawcallback : [{
			//itemAllPopupTable.columns.adjust().draw(); 
		}],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
	});


	//모두 체크하기
	$('#btnAllCheck4').on('click',function(){
		if($('#btnAllCheck4').prop("checked")){
			$('input:checkbox[name=check4]').prop("checked",true);
		}else{
			$('input:checkbox[name=check4]').prop("checked",false);
		}
	});
	
	//모두 체크하기
	$('#btnAllCheck3').on('click',function(){
		if($('#btnAllCheck3').prop("checked")){
			$('input:checkbox[name=check3]').prop("checked",true);
		}else{
			$('input:checkbox[name=check3]').prop("checked",false);
		}
	});

	//모두 체크하기
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
		}
	});
	

	//일괄적용 버튼 클릭시
	$('#btnApply3').on('click',function(){

		if($('#locNo').val()==""){
			toastr.warning("창고을 선택해주세요.");
			$('#btnLocationCd').focus();
			return false;
		}
		
		if(stockAdjustAdmTable.data().count()==0){
			toastr.warning("적용할 항목을 추가해주세요.");
			$('#btnAdd').focus();
			return false;
		}
		
		if($('input:checkbox[name=check3]').is(":checked")==false){
			toastr.warning("적용할 항목을 선택해주세요.");
			return false;
		}
		
		$('input:checkbox[name=check3]:checked').each(function(index){
			var tr = $('input:checkbox[name=check3]:checked').parent().parent().eq(index);
			var saGubun = $('#mainGubun').val();
			if(stockAdjustAdmTable.row(index).data().saGubun==saGubun){
				$('input[name=locationNo]').eq(tr.index()).val($('#locNo').val());
				$('input[name=locationCd]').eq(tr.index()).val($('#locCd').val());
				$('input[name=locationNm]').eq(tr.index()).val($('#locNm').val());
				$('input[name=areaNm]').eq(tr.index()).val($('#areaNm').val()+" / "+$('#floorNm').val());
				$('input[name=lotDate]').eq(tr.index()).val($('#lotDate').val());
				$('input[name=approvalDate]').eq(tr.index()).val($('#startDate').val());
			}
		});
	});

	//초기화 버튼 클릭시
	$('#btnReset').on('click',function(){
		$('#startDate').val(serverDate);
		$('#lotDate').val(serverDate);
		$('#locNo').val('');
		$('#locCd').val('');
		$('#locNm').val('');
		$('#areaNm').val('');
		//$('#areaCd').val('');
		$('#floorNm').val('');
	});
	
	
	//추가버튼 클릭시
	$('#btnAdd').on('click',function(){

		$('#itemPartPopUpModal2').modal('show');
		
		setTimeout(function(){
			$('#itemAllPopupTable').DataTable().ajax.reload(function(){
				itemAllPopupTable.draw();
			}); 
			$('#itemAllTempTable').DataTable().ajax.reload(function(){
				itemAllTempTable.draw();
			}); 
		},150)
		sideView="add";
	})
	
	
	
	var locationNoVal = null;
	var locationCdVal = null;
	//var areaCdVal = null;
	var floorNmVal = null;
	
	//품목추가 버튼 클릭시
	$('#btnItemAdd').on('click',function(){
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		}

		
		$('#itemAllPopupTable tbody tr').each(function(index, item) {		
			var data = itemAllPopupTable.row(this).data();
			if ($(this).find('td input[name=check]').is(":checked") == true) {

				$('#itemAllTempTable').DataTable().row.add(
				{
					"itemSeq" : data.itemSeq,
					"itemGubun" : data.spTypeNm,
					"itemCd" : data.spCd,
					"itemNm" : data.spNm,
					"itemMaker" : data.itemMaker,
					"locationNo" : data.locationNo,
					"locationCd" : data.locationCd,
					"locationNm" : data.locationNm,
					"areaCd" 	 : data.areaCd,
					"areaNm"     : data.areaNm,
					"floorNm"    : data.floorNm,
					"realQty"   : data.realQty
				}).draw(true);				
			}
		});

		$('input[name=check]').prop("checked",false); 
		$('#btnAllCheck').prop("checked",false); 
	});

	//행삭제 버튼 클릭시
	$('#btnItemDel').on('click',function(){
		if($('input:checkbox[name=check4]').is(":checked")==false){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#itemAllTempTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check4]').is(":checked") == true) {
				arr.push(index);
			}
		});
		$('#itemAllTempTable').DataTable().rows(arr).remove().draw();	
		$('input[name=check4]').prop("checked",false); 
		$('#btnAllCheck4').prop("checked",false); 
	});

	

	//가져오기 버튼 클릭시
	$('#btnGetItemList').on('click',function(){
		
		$('#itemAllTempTable tbody tr').each(function(index, item) {		
			var data = itemAllTempTable.row(this).data();
				itemSeq = data.itemSeq;							//품목시퀀스
				saGubunVal = $('#mainGubun').val();				//구분
				saGubunNmVal = saGubunVal=="001"?"사출":"봉제";	//구분명

				saTypeCdVal = $('#itemGubun option:selected').val();		//품목구분
				saTypeNmVal = $('#itemGubun option:selected').text();		//품목명
				
				$('#stockAdjustAdmTable').DataTable().row.add(
				{
					"saGubun" 		: saGubunVal,
					"saTypeNm" 		: saTypeNmVal,
					"saCd" 			: data.itemCd,
					"saNm" 			: data.itemNm,
					"itemMaker" 	: data.itemMaker,
					"saSpec" 		: data.saSpec,
					"locationNo" 	: (data.locationNo==null?"-":data.locationNo),
					"locationCd" 	: (data.locationCd==null?"-":data.locationCd),
					"locationNm" 	: (data.locationNm==null?"-":data.locationNm),
					"areaCd" 	 	: (data.areaCd==null?"-":data.areaCd),
					"areaNm"     	: (data.areaNm==null?"-":data.areaNm),
					"floorNm"    	: (data.floorNm==null?"-":data.floorNm),
				}).draw(true);				
		});
		
		$('#itemPartPopUpModal2').modal('hide');
		$('#itemAllTempTable').DataTable().clear().draw();
		$('input[name=realStockQty]').eq(0).focus();	//실사재고 입력칸 포커스
		$('input[name=realStockQty]').eq(0).select();
	});

	//삭제버튼 클릭시
	$('#btnDel').on('click',function(){

		if($('input[name=check3]').is(':checked')==false) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		$('#stockAdjustAdmTable tbody tr').each(function(index, item) {		
			if ($(this).find('td input[name=check3]').is(":checked") == true) {
				$('#stockAdjustAdmTable').DataTable().rows(this).remove().draw();
			}
		});

		$('#btnAllCheck3').prop('checked',false);
	})
	
	//저장버튼 클릭 시
	$('#btnSave').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	
			
		if(!$.trim($('#stockChargrNm').val())){
			toastr.warning('초기재고 등록자를 선택해주세요.');
			$('#btnSelOfficeUser').focus();
			return false;
		}

		if(stockAdjustAdmTable.data().count()==0){
			toastr.warning("저장할 항목을 추가해주세요.");
			$('#btnAdd').focus();
			return false;
		}

		$('#stockAdjustAdmTable tbody tr').each(function(index, item){

			//입력값 검사
			if ($(this).find("td input[name=realStockQty]").val() == "") {		
				toastr.warning('실사재고를 입력해주세요');	
				check=false;
				return false;
			} 
			if ($(this).find("td input[name=areaNm]").val() == "") {		
				toastr.warning('창고를 선택해주세요');	
				$('#btnLocationCd').focus();
				check=false;
				return false;
			} 
			 
			var rowData = new Object();

			rowData.stockChargr= $('#stockChargr').val();
			
			rowData.saCd= $(this).find('td input[name=itemSeq]').val();	
			//rowData.saRev= $(this).find('td input[name=saRev]').val();	
			rowData.realStockQty= $(this).find('td input[name=realStockQty]').val().replace(/,/g,'');	

			rowData.locationCd= $(this).find('td input[name=locationCd]').val();	
			//rowData.areaCd= $(this).find('td input[name=areaCd]').val();	
			//rowData.floorCd= $(this).find('td input[name=floorCd]').val();	
			rowData.locationNo= $(this).find('td input[name=locationNo]').val();	
			
			rowData.approvalDate= $(this).find('td input[name=approvalDate]').val().replace(/-/g,'');	
			rowData.lotDate= $(this).find('td input[name=lotDate]').val().replace(/-/g,'');	
			rowData.saType=	$(this).find('td input[name=saType]').val();	
			rowData.saDesc=	$(this).find('td input[name=saDesc]').val();	
			
	        dataArray.push(rowData);
	        console.log(dataArray);
		});
		
		if(check == true){
			$.ajax({
				url :'<c:url value="tm/preStockCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						uiProc(true);
						toastr.success('등록되었습니다.');
						$('#stockAdjustAdmTable').DataTable().clear().draw();
						$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){});
						$('#btnAllCheck3').prop('checked',false);
					} else if(res.result == 'exist'){
						toastr.error("이미 초기재고가 있습니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});
		}
		
		
	});


	//재고반영 목록
	let stockAdjustAdmTable2 = $('#stockAdjustAdmTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-1'f><'col-sm-12 col-md-9'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		searching: true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY : "550px",
		ajax : {
			url : '<c:url value="tm/preStockList"/>',
			type : 'GET',
			data : {
				'stockType'  : '001',
				'approvalYn' : function(){return approvalYn;},
				'saType' : function(){return $('#itemGubun').val();},
				'mainGubun' : function(){return $('#mainGubun').val();},
			},
		},
		rowId : 'saCd',
		columns : [
			{
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="check2" >';
				}
			}, {
				data : 'saNo',
			}, {
				data : 'approvalDate',
				render : function(data, type, row,meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			}, {
				data : 'saTypeNm',
			}, {
				data : 'saCd'
			}, {
				data : 'saNm'
			}, {
				data : 'itemMaker'
			}, {
				data : 'cmptStockQty',
				render : function(data,type,row,meta){
					return rmDecimal(data);
				},
				"className" : "text-right"
			}, {
				data : 'realStockQty',
				render : function(data,type,row,meta){
					return rmDecimal(data);
				},
				"className" : "text-right"
			}, {
				data : 'diffQty',
				render : function(data,type,row,meta){
					return rmDecimal(data);
				},
				"className" : "text-right"
			}, {
				data : 'barcodeNo'
			}, {
				data : 'locationNm'
			}, {
				data : 'areaNm'
			}, {
				data : 'floorCd'
			}, {
				data : 'saDesc'
			}, {
				data : 'approvalYn',
				render : function(data,type,row,meta){
					if(data!=null){
						if(data=="Y"){
							return '<span style="color:blue;font-weight:bold;">반영</span>';
						}else{
							return '<span style="color:red;font-weight:bold;">미반영</span>';
						}
					}else{
						return '';
					}
				},
			}
		],
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center"
		} ],
		columnDefs: [
			{ "targets": [7,8,9] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        ],
        buttons : [ 'copy', {
			extend : 'excel',
			title : '초기재고관리'
		}, 'print' ],
	});



	//반영여부 선택
	$('input[name=approvalYn]').on('change',function(){
		approvalYn = $('input[name=approvalYn]:checked').val();

		$('#stockAdjustAdmTable2').DataTable().ajax.reload();
	});
	
	//모두 체크하기
	$('#btnAllCheck2').on('click',function(){
		if($('#btnAllCheck2').prop("checked")){
			$('input:checkbox[name=check2]').prop("checked",true);
		}else{
			$('input:checkbox[name=check2]').prop("checked",false);
		}
	});


	//삭제 버튼 클릭
	$('#btnDel2').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	

		if(	$('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("재고반영할 항목을 선택해주세요.");
			check==false;
			return false;
		}

		$('input:checkbox[name=check2]').each(function(index){
			console.log(index)
			if(this.checked){
				var rowData = new Object();
				rowData.saNo= stockAdjustAdmTable2.row(index).data().saNo;	
				rowData.saSeq= stockAdjustAdmTable2.row(index).data().saSeq;
				
		        dataArray.push(rowData);
		        console.log(dataArray);
			}
		})

		if(check == true){
			$.ajax({
				url :'<c:url value="tm/stockAdjustDelete"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						uiProc(true);
						toastr.success('재고삭제 되었습니다.');
						$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){});
						$('#btnAllCheck2').prop('checked',false);
					}else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});
		}
	});
	
	//재고반영 버튼 클릭
	$('#btnApply').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	
		var check2=true;

		if(	$('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("재고반영할 항목을 선택해주세요.");
			check==false;
			return false;
		}

		$('input:checkbox[name=check2]').each(function(index){
			if(this.checked){
				if(stockAdjustAdmTable2.row(index).data().approvalYn == "Y"){
					toastr.warning("미반영된 항목만 재고반영이 가능합니다. 확인해주세요.");
					check=false;
					check2=false;
					return false;
				}
			}
		});
		
		if(check2==true){
			$('input:checkbox[name=check2]').each(function(index){
				console.log(index)
				if(this.checked){
					var rowData = new Object();
					rowData.saNo= stockAdjustAdmTable2.row(index).data().saNo;	
					rowData.saSeq= stockAdjustAdmTable2.row(index).data().saSeq;
					rowData.saType= stockAdjustAdmTable2.row(index).data().saType;
					rowData.saCd= stockAdjustAdmTable2.row(index).data().itemSeq;
					//rowData.saRev= stockAdjustAdmTable2.row(index).data().saRev;
					
					rowData.approvalDate= stockAdjustAdmTable2.row(index).data().approvalDate.replace(/-/g,'');
					rowData.diffQty= stockAdjustAdmTable2.row(index).data().diffQty;
					rowData.barcodeNo= stockAdjustAdmTable2.row(index).data().barcodeNo;
					rowData.saDesc= stockAdjustAdmTable2.row(index).data().saDesc;
					rowData.locationNo= stockAdjustAdmTable2.row(index).data().locationNo;
					rowData.locationCd= stockAdjustAdmTable2.row(index).data().locationCd;
					//rowData.areaCd= stockAdjustAdmTable2.row(index).data().areaCd;
					//rowData.floorCd= stockAdjustAdmTable2.row(index).data().floorCd;
					
					rowData.value = 'Y';
					rowData.spSubGubun = '초기재고';
					
			        dataArray.push(rowData);
			        console.log(dataArray);
				}
			})
		}
		
		
		if(check == true){
			$.ajax({
				url :'<c:url value="tm/approvalYnUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						uiProc(true);
						toastr.success('재고반영되었습니다.');
						$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){});
						$('#btnAllCheck2').prop('checked',false);
					}else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});
		}
	})

	
	//반영취소 버튼 클릭
	$('#btnCancel').on('click',function(){
		var dataArray = new Array();		
		var check=true;  	
		var check2=true;
		
		if(	$('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("재고반영할 항목을 선택해주세요.");
			check==false;
			return false;
		}

		$('input:checkbox[name=check2]').each(function(index){
			if(this.checked){
				if(stockAdjustAdmTable2.row(index).data().approvalYn == "N"){
					toastr.warning("반영된 항목만 반영취소가 가능합니다. 확인해주세요.");
					check=false;
					check2=false;
					return false;
				}
			}
		});


		if(check2==true){
			$('input:checkbox[name=check2]').each(function(index){
				if(this.checked){
					var rowData = new Object();
					rowData.saNo= stockAdjustAdmTable2.row(index).data().saNo;	
					rowData.saSeq= stockAdjustAdmTable2.row(index).data().saSeq;
					rowData.value = 'N';
					rowData.barcodeNo = stockAdjustAdmTable2.row(index).data().barcodeNo;
					rowData.locationNo= stockAdjustAdmTable2.row(index).data().locationNo;
					
			        dataArray.push(rowData);
			        console.log(dataArray);
				}
			})
		}
		
		if(check == true){
			$.ajax({
				url :'<c:url value="tm/approvalYnUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						uiProc(true);
						toastr.success('재고반영 취소되었습니다.');
						$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){});
						$('#btnAllCheck2').prop('checked',false);
					}else if(res.result == 'fail'){
						uiProc(true);
						toastr.success(res.message);
						$('#stockAdjustAdmTable2').DataTable().ajax.reload(function(){});
						$('#btnAllCheck2').prop('checked',false);
					}else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});
		}
	})
	
	





	
	//작성자 팝업 시작
	var userPopUpTable;
	function selectStockChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/sm/matrlUserDataList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'matrlUser',
				columns : [ {
					data : 'userNm'
				}, {
					data : 'departmentNm'
				}, {
					data : 'postNm'
				}, {
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});

			$('#userPopUpTable tbody').on('click', 'tr', function() {

				var data = userPopUpTable.row(this).data();
				$('#stockChargrNm').val(data.userNm);
				$('#stockChargr').val(data.userNumber);
				$('#userPopUpModal').modal('hide');		
			});
		}
		$('#userPopUpModal').modal('show');
 	}


	//창고정보조회 팝업 시작
	var locationPopupTable;
	function selectLocationCd() {

		if(!$.trim($('#mainGubun').val())){
			toastr.warning("구분을 선택해주세요.");
			return false;
		}
		
		locationPopupTable = $('#locationPopupTable').DataTable({
			dom : "",
			language : lang_kor,
			lengthChange : true,
			paging : true,
			searching:true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy : true,
			pageLength : 15,
			ajax : {
				url : 'bm/locationAdmList',
				type : 'GET',
				
				data : {
					'useYn' : '001',
					'locCdList' : function(){return locCdList},
					'mainGubun' : $('#mainGubun option:selected').val(),
					}
			},
			columns : [ 
			{
				render : function(data, type, row,meta) {
					return meta.row+1;
				}
			},  {
				data : 'locNm'
			}, {
				data : 'areaNm'
			}, {
				data : 'floorNm'
			}, {
				data : 'locDesc'
			}, {
				data : 'locNo'
			},  ],
			columnDefs : [ {
				"targets" : '_all',"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});
			
		
		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();

			$('#locNo').val(data.locNo);
			$('#locCd').val(data.locCd);
			$('#locNm').val(data.locNm);
			$('#areaNm').val(data.areaNm);
			//$('#areaCd').val(data.areaCd);
			$('#floorNm').val(data.floorNm);
			
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	} 

 
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta, flag){

		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" >';
	
		var option2="";
		if(flag == '1') {
			option2 = "<option value='' selected>"+ "전체" +"</option>";
	   	} else if(flag == '2') {
	   		option2 = "<option value=''>"+ "선택" +"</option>";
	   	}
	   	
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
		return shtml + option2 +option + ehtml;
		
	}	


	function uiProc(flag) {
		$("button[name=approvalDateCalendar]").attr("disabled", flag);
		$("input[name=realStockQty]").attr("disabled", flag);
		$("button[name=lotDateFromCalendar]").attr("disabled", flag);
		//$("select[name=areaCd]").attr("disabled", flag);
		$("input[name=floorCd]").attr("disabled", flag);
		$("input[name=desc]").attr("disabled", flag);
	}

</script>
</body>
</html>