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
				<li class="breadcrumb-item"><a href="#">부적합관리</a></li>
				<li class="breadcrumb-item active">부적합관리대장(후가공)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="overflow-hidden" id="main">
	
				<div class="row">
					<div class="p-0" style="width: 90%;">
						<div class="row p-0 mb-2" style="height:86vh;">
							<div class="col-md-12 p-1" style="background-color:#ffffff;">
								<table id="unfitAdmTable" class="table table-bordered tr_highlight_row">
									<colgroup>
										<col width="2%">
										<col width="4%">
										<col width="5%">
										<col width="6%">
										<col width="5%">
										<col width="9%">
										<col width="8%">
										<col width="8%">
										<col width="4%">
										<col width="5%">
										<col width="5%">
										<col width="7%">
										<col width="5%">
										<col width="7%">
										<col width="7%">
										<col width="7%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" class="" id="checkAll" name="checkAll"></th>
											<th>승인여부</th>
											<th>발생일자</th>
											<th>협력사</th>
											<th>발생공정</th>
											<th>부품명</th>
											<th>불량내역</th>
											<th id="lotNoTh">LOT NO</th>
											<th>불량 수</th>
											<th>처리유형</th>
											<th class="text-center">수량</th>
											<th>판정일</th>
											<th>판정담당자</th>
											<th>대책회신예정일자</th>
											<th>대책회신완결일자</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="p-0 pl-2" style="width: 10%;">
						<div class="row p-0" style="height:86vh;">
							<div class="col-md-12 p-1" style="background-color:#ffffff;">
								<table id="faultyListTable" class="table table-bordered" >
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>불량유형</th>
											<th class="text-center">총수량</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered mt-4">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr style="font-size: 1.3rem;background: #346cb0;color: white;">
											<th class="text-center"><b>총수량</b></th>
											<th class="text-right" id="totalFaulty" ></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
<!-- 부적합관리 / 부적합관리대장(후가공) 모달 시작-->
<div class="modal fade bd-example-modal-lg d-none" id="unfitProcResPopupModal" tabindex="-1" role="dialog" aria-labelledby="unfitProcResPopupModal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="unfitProcResPopupLabel">처리 결과</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <div class="row">
					 <div class="card-body col-sm-12 p-1">
						 <button type="button" class="btn btn-success float-left mr-1"
							id="btnApprove">승인</button>
						 <button class="btn btn-warning d-none" id="btnApproveConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						 </button>
					 	 <button type="button" class="btn btn-primary float-right mr-1 d-none"
						 	id="btnDtlSave">저장</button>
						 <button class="btn btn-primary d-none" id="btnDtlSaveConfirmLoading"
						 	type="button" disabled>
						 	<span class="spinner-border spinner-border-sm" role="status"
						 		aria-hidden="true"></span> 처리중
					   	 </button>
					   	  <button type="button" class="btn btn-danger float-right mr-1"
						 	id="btnDtlDel">삭제</button>
						 <button class="btn btn-warning d-none" id="btnDtlDelConfirmLoading"
						 	type="button" disabled>
						 	<span class="spinner-border spinner-border-sm" role="status"
						 		aria-hidden="true"></span> 처리중
						 </button>
						 <button type="button" class="btn btn-warning float-right mr-1"
						 	id="btnDtlEdit">수정</button>
						 <button class="btn btn-warning d-none" id="btnDtlEditConfirmLoading"
						 	type="button" disabled>
						 	<span class="spinner-border spinner-border-sm" role="status"
						 		aria-hidden="true"></span> 처리중
						 </button>
						 <button type="button" class="btn btn-primary float-right mr-1"
						 	id="btnDtlAdd">등록</button>
						 <button class="btn btn-primary d-none" id="btnDtlAddConfirmLoading"
						 	type="button" disabled>
						 	<span class="spinner-border spinner-border-sm" role="status"
						 		aria-hidden="true"></span> 처리중
					   	 </button>
					 </div>
					 <div class="card-body col-sm-12 p-1">
						 <form id="form2">
							  <table class="table table-bordered mb-2" id="">
								<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th colspan="4">부적합처리</th>
								</tr>
								<tr>
									<th>부적합처리</th>
									<td colspan="3">
										<div class="row" style="justify-content: space-around;">
											<div class="custom-control custom-control-inline custom-radio row" id="radio1">
				                           	 	<input type="radio" class="custom-control-input" name="approvalYn" id="apr1" value="001" onclick="" selected disabled/> 
				                           	 	<label class="custom-control-label" for="apr1">특채</label>
				                          	</div>	
				                          	 <div class="custom-control custom-control-inline custom-radio row" id="radio2">
				                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr2" value="002" onclick="" disabled/> 
				                            	<label class="custom-control-label" for="apr2">반품</label>
				                          	</div>
				                          	 <div class="custom-control custom-control-inline custom-radio row" id="radio3">
				                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr3" value="003" onclick="" disabled/> 
				                            	<label class="custom-control-label" for="apr3">폐기</label>
				                          	</div>
				                          	<div class="custom-control custom-control-inline custom-radio row" id="radio4">
				                            	<input type="radio" class="custom-control-input" name="approvalYn" id="apr4" value="004" onclick="" disabled/> 
				                            	<label class="custom-control-label" for="apr4">재작업</label>
				                          	</div>
			                          	</div>
									</td>
								</tr>
								<tr>
									<th>부적합 등록일</th>
									<td>
										<div class="form-group input-sub m-0" style="max-width: 100%">
											<input type="date" class="form-control" id="faultyDate" name="faultyDate" value=""  style="min-width : 100%;"/>
										</div>
									</td>
									<th>부적합 담당자</th>
									<td>
										<div class="input-sub m-0" style="max-width: 100%">
											<input type="hidden" class="form-control"
													style="max-width: 100%" id="idx" name="idx"
													disabled>
											<input type="hidden" class="form-control"
												style="max-width: 100%" id="faultyChargr" name="faultyChargr"
												disabled> <input type="text" class="form-control"
												style="max-width: 100%" id="faultyChargrNm" name="faultyChargrNm"
												disabled>
											<button type="button"
												class="btn btn-primary input-sub-search" name="btnfaultyChargr"
												id="btnfaultyChargr" onClick="selectInspectChargr2();" disabled>
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>양품수량</th>
									<td><input type="text" class="form-control number-float0" id="pairCnt" name="pairCnt" style="text-align:right; min-width: 100%;" disabled></td>
									<th>불량수량</th>
									<td><input type="text" class="form-control number-float0" id="faultyCnt" name="faultyCnt" style="text-align:right; min-width: 100%;" disabled></td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control" id="faultyDesc" name="faultyDesc" style="max-width:100%" disabled></td>
								</tr>
							</thead>
				       </table>
			       </form>
				 </div>
				</div>
			<hr class="text-secondary"> 
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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
	let currentHref = "qmsc0250"; 
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","부적합관리대장(후가공)"); 
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	let serverDate = "${serverDateTo}"
	let userNm = "${userNm}"
	let userNumber = "${userNumber}"
	
	let serverDateFrom =  moment().subtract('1','M').format('YYYY-MM-DD');
	let serverDateTo =  moment().format('YYYY-MM-DD');
	
	let unfitNo = '';
	let unfitGubun = '001';
	let unfitLot = '';
	let unfitIndex = '';
	let faultyCd = '';
	let unfitAdmTableUrl = '<c:url value="qm/unfitPrcssAdmList"/>';

	let unfitResNoVal;
	let unfitResLotVal
	let url;
	let unfitResultNoVal='';
	let unfitNoVal='';
	let idxVal2;

	let unfitLotVal = '';
	let faultyCdVal = '';
	let unfitGubunVal = '';
	let unfitProc ='';
	let itemSeq ='';
	let itemGubun ='';
	let approvalYn='';
	let insertYnVal = '';
	let unfitAppr='002';
	
	//공통코드 시작
	let unfitGubunArray = new Array();
	<c:forEach items="${unfitGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitGubunArray.push(json);
	</c:forEach>
	
	let unfitProcArray = new Array();
	<c:forEach items="${unfitProc}" var="info">
	if ( "${info.etc1}" == '공통' || "${info.etc1}" == '후가공' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		unfitProcArray.push(json);
	}
	</c:forEach>

	let unfitApprArray = new Array();
	<c:forEach items="${unfitAppr}" var="info">
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		unfitApprArray.push(json);
	</c:forEach>
	////공통코드 끝
    
	let unfitAdmTable = $('#unfitAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
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
		//ordering: false,
		ajax : {
			url : '<c:url value="qm/unfitAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate': function() {return serverDateFrom.replace(/-/g, '');},
	           	'endDate': function() {return serverDateTo.replace(/-/g, '');},
	           	'unfitGubun': function() {return unfitGubun;},
	           	'unfitProc': function() {return unfitProc;},
	           	'approvalYn': function() {return unfitAppr;},
				'insertYn'	: function() {return insertYnVal;},
	           	'mainGubun': function() {return '002';},
			},
		},
		columns : [
			{//체크박스
				render: function(data, type, row, meta) {
					if(row['approvalYn']!="Y"){
						return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="inspectList" value="">';
					}else{
						return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="inspectList" value="" disabled>';
					}
					
				},
				'className' : 'text-center'
			},
			{//발생일자
				data : 'approvalYn',
				render : function(data, type, row, meta){
					return data=="Y"?"승인":"미승인";
				},className : 'text-center'
			},
			{//발생일자
				data : 'inspectDate',
				render : function(data, type, row, meta){
					return moment(data).format("YYYY-MM-DD");
				},className : 'text-center'
			},
			{//협력사
				data : 'itemCusNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '-';
					}
					
				},className : 'text-center'
			}, 
			{//발생공정
				data : 'equipNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '-';
					}
					
				},className : 'text-center'
			}, 
			{//부품명
				data : 'itemNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '-';
					}
					
				},className : 'text-center'
			}, 
			{//불량내역
				data : 'faultyDtl',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '';
					}
					
				},className : 'text-center'
			},
			{//LOT NO
				data : 'lotNo',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '-';
					}
					
				},className : 'text-center'
			}, 
			{//불량수
				data : 'faultyQty',
				render : function(data, type, row, meta){
					if(data != null){
						return rmDecimal(data);
					} else {
						return '';
					}					
				},className : 'text-center'	
			},  
			/* {//처리결과 
				data : 'unfitProcNm',
				render : function(data, type, row, meta){
					if(data != null){
						if(row['approvalYn']!=null && row['approvalYn']=="Y"){
							return '<button type="button" class="btn btn-success"  name="unfitProcNm" onclick="unfitProcRes(\''+meta.row+'\',\''+(row['unfitNo']==null?"":row['unfitNo'])+'\')">처리결과</button>';
						}else{
							return '<button type="button" class="btn btn-outline-success"  name="unfitProcNm" onclick="unfitProcRes(\''+meta.row+'\',\''+(row['unfitNo']==null?"":row['unfitNo'])+'\')">처리결과</button>';
						}
					} else {
						return '<button type="button" class="btn btn-outline-success"  name="unfitProcNm" onclick="unfitProcRes(\''+meta.row+'\',\''+(row['unfitNo']==null?"":row['unfitNo'])+'\')">처리결과</button>';
					}						
				},className : 'text-center'	
			}, */
			{//처리결과 
				data : 'unfitProcNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					} else {
						return '';
					}						
				},className : 'text-center'	
			},
			{//수량
				data : 'unfitProc',
				render : function(data, type, row, meta){
					if(data!=null){
						if(row['unfitProc']=="001"){
							return rmDecimal(row['unfitPairCnt']);
						}else{
							return rmDecimal(row['unfitFaultyCnt']);
						}
					}else{
						return '';
					}
					
				},className : 'text-right'	
			},
			{//부적합 등록일
				data : 'unfitFaultyDate',
				render : function(data, type, row, meta){
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}						
				},className : 'text-center'	
			},
			{//부적합 담당자
				data : 'unfitFaultyChargrNm'
				,className : 'text-center'	
			},
			{//대책회신 예정일자
				data : 'cmApproDate',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="date" class="form-control" id="cmApproDate'+meta.row+'" name="cmApproDate" value="'+moment(data).format("YYYY-MM-DD")+'" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					} else {
						return '<input type="date" class="form-control" id="cmApproDate'+meta.row+'" name="cmApproDate" value="" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					}
				}
			}, 
			{//대책회신 완결일자 
				data : 'cmComplDate',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="date" class="form-control" id="cmComplDate'+meta.row+'" name="cmComplDate" value="'+moment(data).format("YYYY-MM-DD")+'" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					} else {
						return '<input type="date" class="form-control" id="cmComplDate'+meta.row+'" name="cmComplDate" value="" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					}
				}
			}, 
			{//비고
				data : 'unfitDesc',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="text" class="form-control" id="unfitDesc'+meta.row+'" name="unfitDesc" value="'+data+'" onChange="unfitAdmCreate()" style="min-width : 100%;" maxlength="128" />';
					} else {
						return '<input type="text" class="form-control" id="unfitDesc'+meta.row+'" name="unfitDesc" value="" onChange="unfitAdmCreate()" style="min-width : 100%;" maxlength="128"/>';
					}
				}
			}, 
		],
		columnDefs : [
			 /* { targets : [0,1,2,3,4], className : 'td_top'},  */
		],
		createdRow : function( row, data, dataIndex ) {
		    if ( data['approvalYn'] == "Y" ) {
		    	$(row).find('td').eq(1).css('color','blue').css('font-weight','bold');
		    }else{
		    	$(row).find('td').eq(1).css('color','red').css('font-weight','bold');
		    }
		},
		buttons : [ {
			extend : 'copy',
			title : '부적합관리대장(수입,공정,출하)',
		}, {
			extend : 'excel',
			title : '부적합관리대장(수입,공정,출하)',
		}, {
			extend : 'print',
			title : '부적합관리대장(수입,공정,출하)',
		}, ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
   
    
	//테이블 왼쪽 위 html
	let unfitHtml = '<div class="row">';
	//발생일자
	unfitHtml += '&nbsp;&nbsp;<label class="input-label-sm">발생일자</label><div class="form-group input-sub m-0 row">';
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
    unfitHtml += '<label class="input-label-sm">구분</label>';
    unfitHtml += '<div class="form-group input-sub m-0 row">';
	unfitHtml += '<select id="unfitGubunSelect" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '</select></div>&nbsp;&nbsp;&nbsp;';
    unfitHtml += '<label class="input-label-sm">처리유형</label>';
    unfitHtml += '<div class="form-group input-sub m-0 row">';
	unfitHtml += '<select id="unfitProcSelect" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '</select></div>&nbsp;&nbsp;&nbsp;';
	unfitHtml += '<label class="input-label-sm">승인여부</label>';
    unfitHtml += '<div class="form-group input-sub m-0 row">';
	unfitHtml += '<select id="unfitApprSelect" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '<option value="">전체</option>';
	unfitHtml += '<option value="001">승인</option>';
	unfitHtml += '<option value="002" selected>미승인</option>';
	unfitHtml += '</select></div>&nbsp;&nbsp;&nbsp;';
	unfitHtml += '<label class="input-label-sm">등록여부</label>';
    unfitHtml += '<div class="form-group input-sub m-0 row">';
	unfitHtml += '<select id="insertYn" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '<option value="">전체</option>';
	unfitHtml += '<option value="001">등록</option>';
	unfitHtml += '<option value="002">미등록</option>';
	unfitHtml += '</select></div>&nbsp;&nbsp;&nbsp;';
	unfitHtml += '<button type="button" class="btn btn-primary mr-3" id="btnRetv" onClick="btnRetvClick()">조회</button>';


	unfitHtml += '&nbsp;&nbsp;<label class="input-label-sm">처리일자</label><div class="form-group input-sub m-0 mr-2 row">';
    unfitHtml += '<input class="form-control" style="width:97px;" type="text" id="procDate" disabled/>';
    unfitHtml += '<button onclick="fnPopUpCalendar(procDate, procDate, \'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="procDateCalendar" type="button">';
    unfitHtml += '<span class="oi oi-calendar"></span>';
    unfitHtml += '</button>'; 
    unfitHtml += '</div>';
	unfitHtml += '<button type="button" class="btn mr-1" id="btnReturnAdd" style="background-color:red; color:white;">반품등록</button>';
	unfitHtml += '<button type="button" class="btn mr-1" id="btnDisAdd" style="background-color:#673ab7; color:white;">폐기등록</button>';
	unfitHtml += '</div>';
    
	$('#unfitAdmTable_length').html(unfitHtml);
	$('#startDate').val(serverDateFrom);
	$('#endDate').val(serverDateTo);
	$('#procDate').val(serverDateTo);
	
	
	selectBoxAppend(unfitGubunArray, "unfitGubunSelect", "001", "");
	selectBoxAppend(unfitProcArray, "unfitProcSelect", "", "1");
	
	
	//조회 버튼 클릭시
	function btnRetvClick() {
		serverDateFrom =  $('#startDate').val();
		serverDateTo =  $('#endDate').val();
		unfitGubun =  $('#unfitGubunSelect option:selected').val();
		unfitProc =  $('#unfitProcSelect option:selected').val();
		unfitAppr =  $('#unfitApprSelect option:selected').val();
		insertYnVal =  $('#insertYn option:selected').val();
		$('#unfitAdmTable').DataTable().ajax.reload(function(){});
		$('#faultyListTable').DataTable().ajax.reload(function(){return });
    };


 	// 보기
	$('#unfitAdmTable tbody').on('click','tr',function() {
		itemSeq = unfitAdmTable.row(this).data().itemSeq;
		itemGubun = unfitAdmTable.row(this).data().itemGubun;
		unfitNo = unfitAdmTable.row(this).data().unfitNo;
		unfitLot = unfitAdmTable.row(this).data().lotNo;
		faultyCd = unfitAdmTable.row(this).data().faultyCd;
		approvalYn = unfitAdmTable.row(this).data().approvalYn;
		unfitIndex = $('#unfitAdmTable').DataTable().row(this).index();
	});
    
	let faultyListTable = $('#faultyListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-3'><'col-sm-12 col-md-9'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>",
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : 10000000,
		//ordering: false,
		ajax : {
			url : '<c:url value="qm/faultyTypeTotalList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate': function() {return serverDateFrom.replace(/-/g, '');},
	           	'endDate': function() {return serverDateTo.replace(/-/g, '');},
	           	'unfitGubun' : function(){return unfitGubun;}
			},
		},
		columns : [
			{
				data : 'faultyDtl',
				render : function(data, type, row, meta){
					if(data != null){
						return '<span style="cursor: pointer;">'+data+'</span>';
					} else {
						return '-';
					}
					
				},className : 'text-center'
			}, 
			{
				data : 'faultyCnt',
				render : function(data, type, row, meta) {
					return '<span style="cursor: pointer;">'+rmDecimal(data)+'</span>';
				},
				'className' : 'text-right'
			}, 
		],
		columnDefs : [
			
		],
		drawCallback: function(settings) {
        }, 
	});

	// 보기
	$('#faultyListTable tbody').on('click','tr',function() {
		//불량cavity테이블
		if(unfitGubun=="002"){
			faultyCd = faultyListTable.row(this).data().faultyCd;

			var tr = $(this).closest('tr');
	        var row = faultyListTable.row( tr );
	        var idx = $.inArray( tr.attr('id'), detailRows );

	        if ( row.child.isShown() ) {
	            tr.removeClass( 'details' );
	            row.child.hide();
	 
	            // Remove from the 'open' array
	            detailRows.splice( idx, 1 );
	        }
	        else {
	            tr.addClass( 'details' );
	            row.child( format( row.data() ) ).show();
	 
	            // Add to the 'open' array
	            if ( idx === -1 ) {
	                detailRows.push( tr.attr('id') );
	            }
	        }
		}
	});

	//개발관리 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var cavityHtml = '';

		$.ajax({
			url : '<c:url value="qm/faultyTypeCavityList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate': function() {return serverDateFrom.replace(/-/g, '');},
	           	'endDate': function() {return serverDateTo.replace(/-/g, '');},
	           	'faultyCd' : function(){return faultyCd;}
			},
            async: false,
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                    if(data.length>0){
                    	cavityHtml	 = '<table class="table table-bordered" style="background:#0275d81c;">';
                    	cavityHtml	+= '	<colgroup>';
                    	cavityHtml	+= '		<col width="50%">';
                    	cavityHtml	+= '		<col width="50%">';
                    	cavityHtml	+= '	</colgroup>';
                    	cavityHtml	+= '	<thead class="thead-light">';
                    	cavityHtml	+= '		<tr>';
                    	cavityHtml	+= '			<th style="background:#0275d86e;">CAVITY</th>';
            			cavityHtml	+= '			<th style="background:#0275d86e;">수량</th>';
            			cavityHtml	+= '		</tr>';
               			cavityHtml	+= '	</thead>';
               			cavityHtml	+= '	<tbody>';
                        for(var i=0;i<data.length;i++) {
                        	cavityHtml	+= '		<tr>';
                        	cavityHtml	+= '			<td class="text-center-td">'+data[i].faultyCavity+' CAVITY</td>';
                        	cavityHtml	+= '			<td class="text-right-td">'+data[i].faultyQty+'</td>';
                        	cavityHtml	+= '		</tr>';
                        }
                        cavityHtml	+= '	</tbody>';
                        cavityHtml	+= '</table>';
                    }
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return cavityHtml;
	}
	//개발관리 상세내역 끝

    
	//부적합 등록, 수정
    function unfitAdmCreate() {
		$.ajax({
			url : '<c:url value="qm/unfitAdmCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'unfitNo' : unfitNo,
				'unfitGubun' : unfitGubun,
				'unfitLot' : unfitLot,
				'faultyCd' : faultyCd,
				'unfitProc'   : $('#unfitProc' + unfitIndex).val(),
				'cmApproDate' : $('#cmApproDate' + unfitIndex).val().replace(/-/g,''),
				'cmComplDate' : $('#cmComplDate' + unfitIndex).val().replace(/-/g,''),
				/* 'unfitDate'   : $('#unfitDate' + unfitIndex).val().replace(/-/g,''), */
				'unfitDesc'   :  $('#unfitDesc' + unfitIndex).val(), 
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(res.addEditCheck == '등록'){
						toastr.success('등록되었습니다.');
					} else if(res.addEditCheck == '수정'){
						toastr.success('수정되었습니다.');
					}
					$('#unfitAdmTable').DataTable().ajax.reload(null, false);
				} else {
					toastr.error(res.message);
				}
			}
		});
    }
	
	//부적합처리 수정 시 폐기일자가 자동으로 등록, 삭제되도록 구현
    function unfitAdmProcCreate() {
		let tempUnfitDate = '';
		
		if (!$.trim($('#unfitDate' + unfitIndex).val())) {//폐기일자 값이 없으면
			tempUnfitDate = serverDate.replace(/-/g,'');
		} else {//폐기일자 값이 있으면
			tempUnfitDate = $('#unfitDate' + unfitIndex).val().replace(/-/g,'');
		}
		
		if (!$.trim($('#unfitProc' + unfitIndex).val())) {//부적합처리 값이 '-' 이면
			tempUnfitDate = '';
		}
		
		$.ajax({
			url : '<c:url value="qm/unfitAdmCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'unfitNo' : unfitNo,
				'unfitGubun' : unfitGubun,
				'unfitLot' : unfitLot,
				'faultyCd' : faultyCd,
				'unfitProc'   : $('#unfitProc' + unfitIndex).val(),
				'unfitDate'   : tempUnfitDate,
				'unfitDesc'   : $('#unfitDesc' + unfitIndex).val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(res.addEditCheck == '등록'){
						toastr.success('등록되었습니다.');
					} else if(res.addEditCheck == '수정'){
						toastr.success('수정되었습니다.');
					}
					$('#unfitAdmTable').DataTable().ajax.reload(null, false);
				} else {
					toastr.error(res.message);
				}
			}
		});
		
    }



    //처리결과 버튼 클릭시 
	function unfitProcRes(idx,unfitNo){
		console.log(idx);
		unfitNoVal = unfitNo;
		unfitLotVal = unfitAdmTable.row(idx).data().lotNo;
		faultyCdVal = unfitAdmTable.row(idx).data().faultyCd;
		faultyQty = unfitAdmTable.row(idx).data().faultyQty;

		inSlipNoVal = unfitAdmTable.row(idx).data().inSlipNo;
		inSlipSeqVal = unfitAdmTable.row(idx).data().inSlipSeq;
		console.log('inSlipNoVal:'+inSlipNoVal);
		console.log('inSlipSeqVal:'+inSlipSeqVal);
		
		unfitGubunVal = $('#unfitGubunSelect option:selected').val();
		
		if(unfitNoVal!=null && unfitNoVal!=''){
			$.ajax({
				url : '<c:url value="/qm/unfitResultRead"/>',
				type : 'GET',
				data : {'unfitNo' : unfitNoVal},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if(data!=null){
							unfitResultNoVal = data.unfitResultNo;
							$('#faultyDate').val(moment(data.unfitFaultyDate).format('YYYY-MM-DD'));
							$('#faultyChargr').val(data.unfitFaultyChargr);
							$('#faultyChargrNm').val(data.unfitFaultyChargrNm);
							$('#pairCnt').val(addCommas(data.unfitPairCnt));
							$('#faultyCnt').val(addCommas(data.unfitFaultyCnt));
							$('#faultyDesc').val(data.unfitDesc);		
							//radioButton
							if(data.unfitProc == '001'){
								$('#apr1').prop('checked', true);
							}else if(data.unfitProc == '002'){
								$('#apr2').prop('checked', true);
							}else if(data.unfitProc == '003'){
								$('#apr3').prop('checked', true);
							}else if(data.unfitProc == '004'){
								$('#apr4').prop('checked', true);
							}		

							$('#btnDtlAdd').attr('disabled',true);
							$('#btnDtlEdit').attr('disabled',false);
							$('#btnDtlDel').attr('disabled',false);
						}else{
							unfitResultNoVal = '';
							$('#faultyDate').val(moment(serverDate).format('YYYY-MM-DD'));
							$('#faultyChargr').val(userNumber);
							$('#faultyChargrNm').val(userNm);
							$('#pairCnt').val(addCommas(faultyQty));
							$('#faultyCnt').val('0');
							$('#faultyDesc').val('');	

							$('#btnDtlAdd').attr('disabled',false);
							$('#btnDtlEdit').attr('disabled',true);	
							$('#btnDtlDel').attr('disabled',true);
						}
						
					} else {
						toastr.error(res.message);
					}
				},
			}); 
		}else{
			unfitResultNoVal = '';
			$('#faultyDate').val(moment(serverDate).format('YYYY-MM-DD'));
			$('#faultyChargr').val(userNumber);
			$('#faultyChargrNm').val(userNm);
			$('#pairCnt').val(addCommas(faultyQty));
			$('#faultyCnt').val('0');
			$('#faultyDesc').val('');		

			$('#btnDtlAdd').attr('disabled',false);
			$('#btnDtlEdit').attr('disabled',true);	
			$('#btnDtlDel').attr('disabled',true);
		}
		
         //UI
         uiProcModal(true);
         $('#btnDtlAdd').removeClass('d-none');
         $('#btnDtlSave').addClass('d-none');
         $('#unfitProcResPopupModal').removeClass('d-none');
         $('#unfitProcResPopupModal').modal('show');
         $('input[name=idx]').val(idx);

         if(unfitGubunVal=='001'){
             $('#radio1').removeClass('d-none');
             $('#radio2').removeClass('d-none');
             $('#radio3').removeClass('d-none');
             $('#radio4').addClass('d-none');
         }else if(unfitGubunVal=='002'){
        	 $('#radio1').removeClass('d-none');
             $('#radio2').addClass('d-none');
             $('#radio3').removeClass('d-none');
             $('#radio4').removeClass('d-none');
         }else if(unfitGubunVal=='003'){
        	 $('#radio1').removeClass('d-none');
             $('#radio2').addClass('d-none');
             $('#radio3').removeClass('d-none');
             $('#radio4').addClass('d-none');
         }else{
        	 $('#radio1').removeClass('d-none');
             $('#radio2').removeClass('d-none');
             $('#radio3').removeClass('d-none');
             $('#radio4').addClass('d-none');
         }
         
 		 $('#unfitProcResPopupModal').modal('hide');
         
         //날짜 추가
         $('#faultyDate').val(serverDate);        
         //라디오버튼 추가 
         $('#apr1').prop("checked", true);  
     }

	//담당자 모달 
    var userPopUpTable3;
	function userPopUpTableModal2() {
		userPopUpTable3 = $('#userPopUpTable3').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy: true,
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
				data : 'userDesc'
			}, ],
			columnDefs : [ {
				"targets" : [ 0, 1, 2, 3, 4 ],
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});

		$('#userPopUpTable3 tbody').on('click', 'tr', function() {
			var data = userPopUpTable3.row(this).data();		
		
			$('#faultyChargr').val(data.userNumber);
			$('#faultyChargrNm').val(data.userNm);
			
			$('#userPopUpModal3').modal('hide');
			$('#unfitProcResPopupModal').modal('show');
		});
		$('#userPopUpModal3').modal('show');
	}

    //부적합 담당자 모달 클릭시 
    function selectInspectChargr2(){
    	userPopUpTableModal2();
   	 	$('#unfitProcResPopupModal').modal('hide');
     }
   
    //등록 클릭시
    $('#btnDtlAdd').on('click',function(){

    	if(approvalYn!=null && approvalYn=="Y"){
			toastr.warning("이미 승인되었습니다.");		
			return false;
		}
		
	   	uiProcModal(false);
	   	$('#btnDtlSave').removeClass('d-none');
    });

    //수정 클릭시
    $('#btnDtlEdit').on('click',function(){

    	if(approvalYn!=null && approvalYn=="Y"){
			toastr.warning("이미 승인되었습니다.");		
			return false;
		}
		
	   	uiProcModal(false);
	   	$('#btnDtlSave').removeClass('d-none');
     });

  	//삭제 클릭시
    $('#btnDtlDel').on('click',function(){
        
    	if(approvalYn!=null && approvalYn=="Y"){
			toastr.warning("이미 승인되었습니다.");		
			return false;
		}
		
        $.ajax({
			url : '<c:url value="qm/unfitResultDel"/>',
			type : 'POST',
			data : {
				'unfitResultNo' : function(){return unfitResultNoVal}
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("삭제되었습니다.");
					uiProcModal(true);
					unfitResultNoVal = '';
					$('#faultyDate').val(moment(serverDate).format('YYYY-MM-DD'));
					$('#faultyChargr').val('');
					$('#faultyChargrNm').val('');
					$('#pairCnt').val(addCommas(faultyQty));
					$('#faultyCnt').val('0');
					$('#faultyDesc').val('');		
					$('#btnDtlAdd').attr('disabled',false);
					$('#btnDtlEdit').attr('disabled',true);	
					$('#btnDtlDel').attr('disabled',true);			
					$('#btnDtlSave').addClass('d-none');			 		 
					$('#unfitAdmTable').DataTable().ajax.reload(function() {});
				}else if(res.result=="error"){
					toastr.warning(res.message);
				}
			}
        });
    });
    
    //저장
    $('#btnDtlSave').on('click',function(){
    	//입력값 검사
    	if (!$.trim($('#faultyDate').val())) {
			toastr.warning('부적합 등록일을 입력해주세요.');
			$('#faultyDate').focus();
			return false;
		}
		
    	if (!$.trim($('#faultyChargrNm').val())) {
			toastr.warning('부적합 담당자를 입력해주세요.');
			$('#faultyChargrNm').focus();
			return false;
		}
		
		if (!$.trim($('#pairCnt').val())) {
			toastr.warning('양품수량을 입력해주세요.');
			$('#pairCnt').focus();
			return false;
		}

		if (!$.trim($('#faultyCnt').val())) {
			toastr.warning('불량수량을 입력해주세요.');
			$('#faultyCnt').focus();
			return false;
		}

		let pairCnt = parseInt($('#pairCnt').val().replace(/,/g,''));
		let faultyCnt = parseInt($('#faultyCnt').val().replace(/,/g,''));
		
		if(faultyQty<(pairCnt+faultyCnt)){
			toastr.warning("부적합 수량을 초과하였습니다.");
			return false;
		}

		
		$.ajax({
			url : '<c:url value="/qm/unfitResultCreate"/>',
			type : 'POST',
			async : false, 
			data : {
				'unfitResultNo' :unfitResultNoVal,
				'unfitNo' :  unfitNoVal,
				'unfitLot' : unfitLotVal,
				'unfitGubun' : unfitGubunVal,
				'faultyCd' : faultyCdVal,
				'approvalYn' : approvalYn,
				'unfitProc' : $('input[name=approvalYn]:checked').val(),
				'unfitFaultyDate' : $('#faultyDate').val().replace(/-/g, ''),
				'unfitFaultyChargr' : $('#faultyChargr').val(),				
				'unfitPairCnt' : $('#pairCnt').val().replace(/,/g, ''),
				'unfitFaultyCnt' : $('#faultyCnt').val().replace(/,/g, ''),
				'unfitDesc' : $('#faultyDesc').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					if(res.addEditCheck == '등록'){
						toastr.success('등록되었습니다.');
					} else if(res.addEditCheck == '수정'){
						toastr.success('수정되었습니다.');
					}

					idxVal = '';
					unfitResultNoVal = data.unfitResultNo;
					
					//화면처리 
					uiProcModal(true);
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',false);	
					$('#btnDtlDel').attr('disabled',false);			
					$('#btnDtlSave').addClass('d-none');		
					$('#unfitAdmTable').DataTable().ajax.reload(function() {});
				} else {
					toastr.error(res.message);
				}
			}
		});
     })
     
     
     //승인 버튼 클릭시
     $('#btnApprove').on('click',function(){
		if(unfitResultNoVal==null || unfitResultNoVal==""){
			toastr.warning("우선 등록을 해주세요.");		
			return false;
		}

		if(approvalYn!=null && approvalYn=="Y"){
			toastr.warning("이미 승인되었습니다.");		
			return false;
		}

		var url="";
		if(unfitGubunVal=="002"){
			url = '<c:url value="qm/unfitResultPrcssAppr" />';
		}else{
			url = '<c:url value="qm/unfitResultAppr" />';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data  : {
				'mainGubun' : "002",
				'unfitNo'	: function(){return unfitNoVal;},
				'approvalYn': function(){return "Y"},
				'fairQty' 	: function(){return $('#pairCnt').val().replace(/,/g,'')},
				'faultyQty' : function(){return $('#faultyCnt').val().replace(/,/g,'')},
				'spType' 	: function(){return itemGubun;},
				'spCd' 		: function(){return itemSeq;},
				'spDate' 	: function(){return $('#faultyDate').val().replace(/-/g,'')},
				'lotNo' 	: function(){return unfitLotVal;},
				'unfitProc' : function(){return $('input[name=approvalYn]:checked').val()},
				'inSlipNo' 	: function(){return inSlipNoVal;},
				'inSlipSeq' : function(){return inSlipSeqVal;}
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("승인되었습니다");
					$('#btnDtlAdd').attr('disabled',true);
					$('#btnDtlEdit').attr('disabled',true);
					$('#btnDtlDel').attr('disabled',true);
					approvalYn = 'Y';
					$('#unfitAdmTable').DataTable().ajax.reload(function(){});
				}else if(res.result=="error"){
					toastr.error(res.message);
				}

				$('#my-spinner').hide();
			}
		})
     });


    //반품등록 버튼 클릭시 
    $('#btnReturnAdd').on('click',function(){
    	var dataArray = new Array();		
		var check=true;  		

		if(unfitGubun!="001"){
			toastr.warning("공정/출하 부적합에서는 반품처리 불가합니다.");
			return false;
		}

		if(!$('input[name=inspectList]').is(':checked')){
			toastr.warning("반품처리할 항목을 선택해주세요.");
			return false;
		}
		
        $('#unfitAdmTable tbody tr').each(function(index,item){
			if($(this).find('input[name=inspectList]').is(':checked')){
				console.log(index);

				let data = $('#unfitAdmTable').DataTable().row(index).data();
				
				var rowData = new Object();

				rowData.mainGubun = '002';
				rowData.unfitNo = data.unfitNo;
				rowData.unfitResultNo = data.unfitResultNo;
				rowData.unfitLot = data.lotNo;
				rowData.unfitGubun = unfitGubun;
				rowData.faultyCd = data.faultyCd;
				rowData.approvalYn = 'Y';
				rowData.unfitProc = '002';
				rowData.unfitFaultyDate = $('#procDate').val().replace(/-/g,'');
				rowData.unfitFaultyChargr = userNumber;		
				rowData.unfitPairCnt = '0';
				rowData.unfitFaultyCnt = data.faultyQty;
				rowData.unfitDesc = '';


				rowData.spType = data.itemGubun;
				rowData.spCd = data.itemSeq;
				rowData.spDate = $('#procDate').val().replace(/-/g,'');
				rowData.lotNo = data.unfitLot;

		        dataArray.push(rowData);
		        console.log(rowData);
			}
        });

		$.ajax({
			url : '<c:url value="/qm/unfitResultCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {		
				if (res.result == 'ok') {
					toastr.success('반품등록 되었습니다.');
					$('#unfitAdmTable').DataTable().ajax.reload();
				}else {
					toastr.error(res.message);
				}

				$('#my-spinner').hide();
			} 
		});
    });
     


    //폐기등록 버튼 클릭시 
    $('#btnDisAdd').on('click',function(){
    	var dataArray = new Array();		
		var check=true;  		

		if(unfitGubun=="001"){
			toastr.warning("수입 부적합에서는 폐기처리 불가합니다.");
			return false;
		}

		if(!$('input[name=inspectList]').is(':checked')){
			toastr.warning("폐기처리할 항목을 선택해주세요.");
			return false;
		}
		
        $('#unfitAdmTable tbody tr').each(function(index,item){
			if($(this).find('input[name=inspectList]').is(':checked')){
				console.log(index);

				let data = $('#unfitAdmTable').DataTable().row(index).data();

				var rowData = new Object();

				rowData.mainGubun = '002';
				rowData.unfitNo = data.unfitNo;
				rowData.unfitResultNo = data.unfitResultNo;
				rowData.unfitLot = data.lotNo;
				rowData.unfitGubun = unfitGubun;
				rowData.faultyCd = data.faultyCd;
				rowData.approvalYn = 'Y';
				rowData.unfitProc = '003';
				rowData.unfitFaultyDate = $('#procDate').val().replace(/-/g,'');
				rowData.unfitFaultyChargr = userNumber;		
				rowData.unfitPairCnt = '0';
				rowData.unfitFaultyCnt = data.faultyQty;
				rowData.unfitDesc = '';

				rowData.spType = data.itemGubun;
				rowData.spCd = data.itemSeq;
				rowData.spDate = $('#procDate').val().replace(/-/g,'');
				rowData.lotNo = data.unfitLot;
				

		        dataArray.push(rowData);
		        console.log(rowData);
			}
        });

		$.ajax({
			url : '<c:url value="/qm/unfitResultCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {		
				if (res.result == 'ok') {
					toastr.success('폐기등록 되었습니다.');
					$('#unfitAdmTable').DataTable().ajax.reload();
				}else {
					toastr.error(res.message);
				}

				$('#my-spinner').hide();
			} 
		});
    });
     
     
    function uiProcModal(flag){
		$('input[name=approvalYn]').attr("disabled", flag);
		$('#faultyDateCalendar').attr("disabled", flag);
		$('#btnfaultyChargr').attr("disabled", flag);
		$('#pairCnt').attr("disabled", flag);
		$('#faultyCnt').attr("disabled", flag);
		$('#faultyDesc').attr("disabled", flag);
		$('#faultyDate').attr("disabled",flag);
     }

  	//전체선택 체크
	$('#checkAll').change(function() {
		if($(this).is(':checked')) {
			$("input[name=inspectList]").prop("checked",true);
			$('input[name=inspectList]').each(function() {
			});
		} else {
			$("input[name=inspectList]").prop("checked",false);
		}
	})
	
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width : 100%" class="custom-select" id="'+ id + idx +'" name="'+ id +'" data-col="' + meta.col + '" onChange="unfitAdmProcCreate()">';
		var option;
		option = "<option value=''>-</option>";
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}



	 $(document).on('keyup',"#faultyCnt, #pairCnt",function(e){
			var data = $(this).val();
			
			if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

				$('.number-float0').on("blur keyup", function() {
					$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
				}); 
				
				toastr.warning('숫자만 입력해주세요.');
				$(this).val("0");
				$(this).select();
				event.preventDefault();
				return false;
			}
			
			$(this).val(addCommas($(this).val().replace(",", "")));
	    });
		
	
</script>
</body>
</html>
