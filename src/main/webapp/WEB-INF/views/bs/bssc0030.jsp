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
				<li class="breadcrumb-item active">생산지시현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="row mb-4">
							<div class="form-group float-right">
								<label class="col-form-label pt-0 pb-0" style="font-size: 15px;">상태
									:&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: #CCCCCC; font-size: 15px;">출고대기</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: #CCCCCC; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: black; font-size: 15px;">승인대기</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: black; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: blue; font-size: 15px;">승인진행</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: blue; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label class="col-form-label pt-0 pb-0"
									style="color: green; font-size: 15px;">승인완료</label> <label
									class="col-form-label pt-0 pb-0"
									style="color: green; font-size: 15px;">●&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
					</div>
					<div class="table-responsive">
						<table id="bizOrderAdmTable" class="table table-bordered">
							<colgroup>
								<col width="2%">
								<col width="10%">
								<col width="5%">
								<col width="5%">
								<col width="6%">    
								
								<col width="7%">
								<col width="4%">
								<col width="3%">
								<col width="12%">
								<col width="5%"> 
								
								<col width="6%">
								<col width="5%">
								<col width="11%">
								<col width="17%">
								
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th id="th1">수주상세번호</th>
									<th>접수일</th>
									<th>생산투입상태</th>
									<th>발주번호</th>
									<th>발주처</th>
									<th>국내/국외</th>
									<th>구분</th>
									<th>품명(Type)</th>
									<th>주문수량</th>
									<th>미납수량</th>
									<th>납품일</th>
									<th>전달사항</th>
									<th id="th2">생산지연사유</th>
								</tr>
							</thead>
						</table>
					</div>
					
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar right-sidebar-fix"
				id="rfSidenav" style="width: 35%;">
				<div class="card-body col-sm-12">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand2"
							class="closebtn float-right" onclick="closerNav2()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<div class="card-header card-tab">
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item"><a class="nav-link active show"
								id="tab2Nav" data-toggle="tab" href="#tab2">납품일(영업)</a></li>
							<li class="nav-item"><a class="nav-link" id="tab1Nav"
								data-toggle="tab" href="#tab1">전달사항</a></li>
							<!-- <li class="nav-item"><a class="nav-link" id="tab3Nav"
								data-toggle="tab" href="#tab3">생산완료일</a></li> -->
							<li class="nav-item"><a class="nav-link" id="tab4Nav"
								data-toggle="tab" href="#tab4">생산지연사유</a></li>
						</ul>
					</div>
					<br>
					<button type="button" class="btn btn-warning float-right mr-1"
						id="btnDel">삭제</button>
					<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<button type="button" class="btn btn-primary float-right mr-1"
						id="btnEdit">수정</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>
					<button type="button" class="btn btn-primary float-right mr-1"
						id="btnAdd">추가</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
					</button>

				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade" id="tab1">
							<form id="form">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-2"
										id="bizOrderSdTable">
										<colgroup>
											<col width="15%">
											<col width="25%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>부서</th>
												<th>내용</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<div class="tab-pane fade active show" id="tab2">
							<form id="form2">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-2"
										id="bizOrderDlTable">
										<colgroup>
											<col width="15%">
											<col width="25%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>납품일</th>
												<th>내용</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>

						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<div class="tab-pane fade" id="tab3">
							<form id="form3">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-2"
										id="bizOrderPcTable">
										<colgroup>
											<col width="15%">
											<col width="25%">
											<col width="30%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>생산완료일</th>
												<th>내용</th>
												<th>생산수량</th>
												<th>완료수량</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>

						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<div class="tab-pane fade" id="tab4">
							<form id="form4">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-2"
										id="bizOrderDaTable">
										<colgroup>
											<col width="15%">
											<col width="25%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>담당자</th>
												<th>내용</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<button type="button" class="btn btn-primary float-right d-none"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<!--수주진행현황 hunterPopup 시작-->
<div id="popoverContent" class='d-none'>
	<table class="table table-bordered d-none mh-100" id="approveProcTable" style="width:300px; max-height: 100%">
		<thead class="thead-light">
			<tr>
				<th class="text-center-th">No.</th>
				<th class="text-center-th">작지번호</th>
				<th class="text-center-th">승인처리</th>
			</tr>
		</thead>
	</table>
</div>
<!--수주진행현황 hunterPopup 끝-->
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0030";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산지시현황"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideView2 = '';
	let btnView = '';
	var index = 0;
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate = "${serverDate}";

	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;
	var activeTab = "납품일(영업)";
	var contNo = null;
	var contDtlNo = null;
	var ordCnt = null;
	var dtlOrdCnt = null;
	var etcGubun = "DL";
	var etcSeq;

	//공통코드 시작
	var etcDeptCode=new Array();
    <c:forEach items="${etcDept}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		etcDeptCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	//선택박스 처리
	selectBoxAppend(etcDeptCode, "etcDept", "", "2");
	
	$("input[name=rcvDate]").val(serverDateTo);
	$("input[name=shipReqDate]").val(serverDateTo);
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
	});

	$('#saveBtnModalY').on('click', function() {
	
		uiProc(true);
		//uiProc2(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
		$('#tab2Nav').tab('show');
		etcGubun = "DL";
		$('#bizOrderSdTable').DataTable().ajax.reload();
		
	});
	
	
	
	//생산지시현황 목록조회
	let bizOrderAdmTable = $('#bizOrderAdmTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 15,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcAdmList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return rcvDateOutFromCal.replace(/-/g,"");},
				'endDate' : function(){return rcvDateOutToCal.replace(/-/g,"");
				
				} 
			},
		},
		rowId : 'contDtlNo',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row+ meta.settings._iDisplayStart+ 1;
					},
					'className' : 'text-center'
				},
				{data : 'contDtlNo',
					/* render: function(data, type, row, meta) {
						return '<input class="form-control" type="text" style=" max-width:100%; border:none; text-align:center;" name="contDtlNo" value="'+data+'" inputmode="none" disabled>';
					} */
					'className' : 'contDtlNoClass'
				},				
				{data : 'rcvDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{ data : 'approveStatus',
					render: function(data, type, row, meta) {
						if(data==null) {
							return '';
						} else if(data == '출고진행') {
							return '<p class="mb-0" style="color:#CCCCCC; font-size:15px;">●</p>';
						} else if(data == '승인대기') {
							return '<p class="mb-0" style="color:black; font-size:15px;">●</p>';
						} else if(data == '승인진행') {
							return '<p class="mb-0" style="color:blue; font-size:15px;">●</p>';
						} else if(data == '승인완료') {
							return '<p class="mb-0" style="color:green; font-size:15px;">●</p>';
						} 
					},
					className : 'approveProcPopup text-center',
				},
				{data : 'poNo'},
				{data : 'ordCorpNm'},
				{data : 'inexGubunNm',
					render : function(data, type, row, meta){
						if(data != null){
							return data;
						}else{
							return '-';
						}
					}
				},				
				{data : 'contGubunNm'},
				{data : 'itemNm'},	
				{data : 'dtlOrdCnt'},
				{data : 'delayCnt'},
				{data : 'etcDl',
					render: function(data, type, row, meta) {
						var result = (data==null) ? "" : moment(data).format("YYYY-MM-DD");
						return result;
					}
				}, 
				{data : 'etcSd'},
				/* {data : 'etcPc'}, */
				{data : 'etcDa',
					render: function(data, type, row, meta) {
						if(data!=null){
							var html = '';
								html += '';
								html += '<span class="d-inline-block tooltipGroup" tabindex="0" data-toggle="tooltip" data-placement="left" title="'+data+'">';
								html += (data.length > 20?data.substring(0,20)+'...':data);
								html += '</span>';
							return html;
						}else {
							return '';
						}
						
					},
					'className' : 'etcDaClass'
				},
		],
		columnDefs: [
			{"className": "text-right", "targets": [9,10] , render: $.fn.dataTable.render.number( ',' )},
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons : [ 'copy', 'excel', 'print' ]
	    ,
	    drawCallback: function() {
	        var api = this.api();
		    for(var i=0;i<api.data().count();i++) {
			    if(api.row(i).data().etcDa != '' && api.row(i).data().etcDa !=null) {
			    	console.log(i)
				    console.log(api.row(i).data().etcDa)
			    	$('.contDtlNoClass').eq(i+1).css("color","red");
			    	$('.contDtlNoClass').eq(i+1).css("font-weight" , "bold");
				    $('.etcDaClass').eq(i+1).css("color","red");
				    $('.etcDaClass').eq(i+1).css("font-weight" , "bold");

					//$('#'+api.row(i).data().contDtlNo).addClass('bg-danger2');
					
				}
			}

			$('#th1').css("color","black");
			$('#th2').css("color","black");

		    $(".approveProcPopup").hunterPopup({
	    		title:'생산투입조회',
	    		content: $('#popoverContent'),
	    		placement:'right',
	    		width: '100%'
	    	});
	
			//생산투입상태 td클릭시
			$('.approveProcPopup').on('click',function(){
				$('#popoverContent').removeClass('d-none');
				$('#approveProcTable_wrapper').removeClass('d-none');
            	$('#approveProcTable').removeClass('d-none');
            	var index = parseInt($(this).parents('tr').find('td').eq(0).text())-1;
				console.log(index)
            		
            	contDtlNo = bizOrderAdmTable.row(index).data().contDtlNo;
            	$('#approveProcTable').DataTable().ajax.reload( function () {});
			});

			
			//$('#totalSum1').text(addCommas($('#bizOrderTable').DataTable().column(6).data().sum().toString()));
			//$('#totalSum2').text(addCommas($('#bizOrderTable').DataTable().column(7).data().sum().toString()));
			$('.tooltipGroup').tooltip('enable');
		}
	});

	$('#bizOrderAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		//$('#tab2Nav').tab('show');
		
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		 if ( $(this).hasClass('selected2') ) {
	        $(this).removeClass('selected2');
        }
        else {
        	$('#bizOrderAdmTable').DataTable().$('tr.selected2').removeClass('selected2');
            $(this).addClass('selected2');
        }


		contDtlNo = bizOrderAdmTable.row(this).data().contDtlNo;
	    ordCnt = bizOrderAdmTable.row(this).data().ordCnt;
	    dtlOrdCnt = bizOrderAdmTable.row(this).data().dtlOrdCnt;
	    contNo = bizOrderAdmTable.row(this).data().contNo;
	    
	    
	    console.log(contDtlNo);
	    btnView = '';
		index = 0;
		
		if(activeTab == "전달사항"){
			etcGubun = 'SD';
			$('#bizOrderSdTable').DataTable().ajax.reload(); //전달사항
		}else if(activeTab == "납품일(영업)"){
			etcGubun = 'DL';
			$('#bizOrderDlTable').DataTable().ajax.reload(); //전달사항
			 
		}else if(activeTab == "생산완료일"){
			etcGubun = 'PC';
			$('#bizOrderPcTable').DataTable().ajax.reload(); //전달사항
				
		}else if(activeTab == "생산지연사유"){
			etcGubun = 'DA';
			$('#bizOrderDaTable').DataTable().ajax.reload(); //전달사항
		} 
		
	    $('#btnSave').addClass('d-none');
	    $('#btnAdd').attr('disabled',false);
	   // $('#btnAdd').addClass('disabled');
	    //$('#btnDel').addClass('disabled');
	});
  	
	//전달사항 목록조회
	let bizOrderSdTable = $('#bizOrderSdTable').DataTable({
		language : lang_kor,	
		destroy : true,	
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcDtlList"/>',
			type : 'GET',
			data : {
				'etcGubun'  : function(){return etcGubun;},
				'contDtlNo' : function(){return contDtlNo;}
			},
		},
		rowId : '',
		columns : [ 
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        	},
			},
			{data : 'etcDept',
				render: function(data, type, row, meta) {	
					var html = "";
					html = selectBoxHtml2(etcDeptCode,"etcDept", data, row, meta);
					return html;
				} 
			}, 
			{data : 'etcCont',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input class="form-control" type="text" name="etcCont" value="'+data+'"style="max-width:100%;" disabled/>';
					}else{
						return '<input class="form-control" type="text" name="etcCont" value="" style="max-width:100%;"/>';
					}
				}
			}
		],
		columnDefs: [
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    
	});

	$('#bizOrderSdTable tbody').on('click', 'tr', function(){

		 if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        }
        else {
        	$('#bizOrderSdTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		tableIdx = $('#bizOrderSdTable').DataTable().row(this).index();
		etcSeq = bizOrderSdTable.row(this).data().etcSeq;
		
		sideView2 = 'edit';
		 
	});
	
	
	//납품일(영업) 목록조회
	let bizOrderDlTable = $('#bizOrderDlTable').DataTable({
		language : lang_kor,	
		destroy : true,	
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcDtlList"/>',
			type : 'GET',
			data : {
				'etcGubun': function(){return etcGubun;},
				'contDtlNo' : function(){return contDtlNo;}
			},
		},
		rowId : '',
		columns : [ 
				{
					render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1 ;
		        	},
		        },
				{data : 'etcDate',
					render : function(data, type, row, meta) {
						var value = "";
						
						if (data != null) {
							value =  '<input class="form-control" type="text" id="etcDate'+index+'" value="'+moment(data).format("YYYY-MM-DD")+'" name="etcDate" disabled>';
						} else {
							value =  '<input class="form-control" type="text" id="etcDate'+index+'" value="'+serverDate+'" name="etcDate" disabled>';
						}
						
						var html = '<div class="form-group input-sub m-0">';
						html += value;
						html += '<button onclick="fnPopUpCalendar(etcDate'+index+',etcDate'+index+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="btnEtcDate'+index+'" name="btnEtcDate" type="button" disabled>';
						html += '<span class="oi oi-calendar"></span></button>';
						html += '</div>';
						index++;
						console.log('납품일index:'+index);
						
						return html;
						
					}
				}, 
				{data : 'etcCont',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="etcCont" value="'+data+'"style="max-width:100%;" disabled/>';
						}else{
							return '<input class="form-control" type="text" name="etcCont" style="max-width:100%;" disabled/>';
						}
					}
				}
		],
		columnDefs: [
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    drawCallback: function(settings) {
		    
        }, 
	});

	$('#bizOrderDlTable tbody').on('click', 'tr', function(){

		 if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
       }
       else {
       	$('#bizOrderDlTable').DataTable().$('tr.selected').removeClass('selected');
           $(this).addClass('selected');
       }
		tableIdx = $('#bizOrderDlTable').DataTable().row(this).index();
		etcSeq = bizOrderDlTable.row(this).data().etcSeq;
		sideView2 = 'edit';
		 
	});
	
	//생산완료일 목록조회
	/* let bizOrderPcTable = $('#bizOrderPcTable').DataTable({
		language : lang_kor,	
		destroy : true,	
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcDtlList"/>',
			type : 'GET',
			data : {
				'etcGubun': function(){return etcGubun;},
				'contDtlNo' : function(){return contDtlNo;}
			},
		},
		rowId : '',
		columns : [ 
				{
					render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1 ;
		        	},
		        },
				{data : 'etcDate',
					render : function(data, type, row, meta) {
						var value = "";
						if (data != null) {
							value =  '<input class="form-control" type="text" id="etcDate'+index+'" value="'+data+'" name="etcDate" disabled>';
						} else {
							value =  '<input class="form-control" type="text" id="etcDate'+index+'" value="'+serverDate+'" name="etcDate" disabled>';
						}
						var html = '<div class="form-group input-sub m-0">';
						html += value;
						html += '<button onclick="fnPopUpCalendar(etcDate'+index+',etcDate'+index+',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="etcDate2'+index+'" name="btnEtcDate" type="button" disabled>';
						html += '<span class="oi oi-calendar"></span></button>';
						html += '</div>';

						index++;
						return html;
					}
				},
				{data : 'etcCont',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="etcCont" value="'+data+'"style="max-width:100%;" disabled/>';
						}else{
							return '<input class="form-control" type="text" name="etcCont" style="max-width:100%;"/>';
						}
					}
				},
				{data : 'dtlOrdCnt',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="dtlOrdCnt" value="'+data+'"style="text-align:right;"  disabled/>';
						}else{
							return '<input class="form-control" type="text" name="dtlOrdCnt" value="'+dtlOrdCnt+'" style="text-align:right;" disabled/>';
						}
					}
				}, 
				{data : 'shipCnt',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="dtlShipCnt" value="'+data+'"style="text-align:right;"  disabled/>';
						}else{
							return '<input class="form-control" type="text" name="dtlShipCnt" value="" style="text-align:right;"/>';
						}
					}
				}
		],
		columnDefs: [
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
 		drawCallback: function(settings) {
 			if($('#form3 input[name=etcCont]').val()!=null){
 				$('#btnAdd').addClass('disabled');
 			} 
        }, 
	    
	});

	$('#bizOrderPcTable tbody').on('click', 'tr', function(){

		 if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
      }
      else {
      	$('#bizOrderPcTable').DataTable().$('tr.selected').removeClass('selected');
          $(this).addClass('selected');
      }
		tableIdx = $('#bizOrderPcTable').DataTable().row(this).index();
		etcSeq = bizOrderPcTable.row(this).data().etcSeq;
		sideView2 = 'edit';
		 
	});
 */
	//생산지연사유 목록조회
	let bizOrderDaTable = $('#bizOrderDaTable').DataTable({
		language : lang_kor,	
		destroy : true,	
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderEtcDtlList"/>',
			type : 'GET',
			data : {
				'etcGubun': function(){return etcGubun;},
				'contDtlNo' : function(){return contDtlNo;}
			},
		},
		rowId : '',
		columns : [ 
				{
					render: function(data, type, row, meta) {		
						return meta.row + meta.settings._iDisplayStart + 1 ;
		        	},
				},
				{data : 'etcChargerNm',
					render: function(data, type, row, meta) {	
						var value ="";
						if(data!=null){
							value = '<input type="text" class="form-control" style="max-width:100%;" name="etcChargerNm" value="'+data+'" disabled>';		
							
						} else{
							value = '<input type="text" class="form-control" name="etcChargerNm" value=""disabled>';
						}								
						
		    			var html = '<div class="input-sub m-0">';
		    				 html += value;
		    				 html += '<input type="hidden" name="etcCharger" value="'+row['etcCharger']+'">';
		    				 html += '<button type="button" class="btn btn-primary input-sub-search" name="btnEtcCharger" onClick="selectEtcCharger();" disabled>';
		    				 html += '<span class="oi oi-magnifying-glass"></span>';
		    				 html += '</button>' ;
		    				 html += '</div>' ;
						return html;
					} 
				}, 
				{data : 'etcCont',
					render : function(data, type, row, meta){
						if(data != null){
							return '<input class="form-control" type="text" name="etcCont" value="'+data+'"style="max-width:100%;" disabled/>';
						}else{
							return '<input class="form-control" type="text" name="etcCont" style="max-width:100%;"/>';
						}
					}
				}
		],
		columnDefs: [
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    
	});


	$('#bizOrderDaTable tbody').on('click', 'tr', function(){

		 if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
      }
      else {
      	$('#bizOrderDaTable').DataTable().$('tr.selected').removeClass('selected');
          $(this).addClass('selected');
      }
		tableIdx = $('#bizOrderDaTable').DataTable().row(this).index();
		etcSeq = bizOrderDaTable.row(this).data().etcSeq;
		sideView2 = 'edit';
		 
	});

	//전달사항 탭 클릭시
	$('#tab1Nav').on('click',function(){
		btnView = '';
		sideView2 = '';
		etcGubun = "SD";
		
		$('#bizOrderSdTable').DataTable().ajax.reload();

		$('#btnAdd').attr('disabled',false);
		$('#btnSave').addClass('d-none');
	});

	//납품일(영업) 탭 클릭시
	$('#tab2Nav').on('click',function(){
		btnView = '';
		sideView2 ='';
		etcGubun = "DL";
		index=0;
		
		$('#bizOrderDlTable').DataTable().ajax.reload();
		
		$('#btnAdd').attr('disabled',false);
		$('#btnSave').addClass('d-none');
	});

	//생산완료일 탭 클릭시
	$('#tab3Nav').on('click',function(){
		
		etcGubun = "PC";
		btnView = '';
		sideView2 ='';
		index=0;
		$('#bizOrderPcTable').DataTable().ajax.reload();

		$('#btnSave').addClass('d-none');
		
	});
	
	
	//생산지연사유 탭 클릭시
	$('#tab4Nav').on('click',function(){
		btnView = '';
		sideView2 ='';
		etcGubun = "DA";
		
		$('#bizOrderDaTable').DataTable().ajax.reload();
		
		$('#btnAdd').attr('disabled',false);
		$('#btnSave').addClass('d-none');
	});

	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		btnView = 'edit';
		if(sideView != "edit"){
			toastr.warning("생산지시현황 항목을 선택해주세요.");
			return false;
		}
		
		if(sideView2 !="edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		if(activeTab == "전달사항"){

			$('#form select[name=etcDept]').eq(tableIdx).attr('disabled',false);
			$('#form input[name=etcCont]').eq(tableIdx).attr('disabled',false);
			if(bizOrderSdTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
			
		}else if(activeTab == "납품일(영업)"){

			$('#form2 button[name=btnEtcDate]').eq(tableIdx).attr('disabled',false);
			$('#form2 input[name=etcCont]').eq(tableIdx).attr('disabled',false);
			
			
			if(bizOrderDlTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
		}else if(activeTab == "생산완료일"){
			
			$('#form3 button[name=btnEtcDate]').eq(tableIdx).attr('disabled',false);
			$('#form3 input[name=etcCont]').eq(tableIdx).attr('disabled',false);
			$('#form3 input[name=dtlShipCnt]').eq(tableIdx).attr('disabled',false);
			
			
			if(bizOrderPcTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
		}else if(activeTab == "생산지연사유"){
			$('#form4 button[name=btnEtcCharger]').eq(tableIdx).attr('disabled',false);
			$('#form4 input[name=etcCont]').eq(tableIdx).attr('disabled',false);
			
			if(bizOrderDaTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
		}

		sideView2 = '';
		
	});

	//추가버튼 클릭시
	$('#btnAdd').on('click',function(){

		btnView = 'edit';
		console.log("추가버튼 클릭!!!")
		if(sideView != "edit"){
			toastr.warning("생산지시현황 항목을 선택해주세요.");
			return false;
		}
		
		if(activeTab == "전달사항"){
			$('#bizOrderSdTable').DataTable().row.add({}).draw(false);
			if(bizOrderSdTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}

			
		}else if(activeTab == "납품일(영업)"){
			
			$('#bizOrderDlTable').DataTable().row.add({}).draw(false);
			
			$('#form2 button[name=btnEtcDate]').eq(bizOrderDlTable.data().count()-1).attr('disabled',false);
			$('#form2 input[name=etcCont]').eq(bizOrderDlTable.data().count()-1).attr('disabled',false);
			
			if(bizOrderDlTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
		}else if(activeTab == "생산완료일"){
			$('#btnAdd').attr('disabled',true);
			
			$('#bizOrderPcTable').DataTable().row.add({}).draw(false);
			$('button[name=btnEtcDate]').attr('disabled',false);
			
			
			if(bizOrderPcTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}

		}else if(activeTab == "생산지연사유"){
			$('#bizOrderDaTable').DataTable().row.add({}).draw(false);
			if(bizOrderDaTable.data().count() != 0){
				$('#btnSave').removeClass('d-none');
			}
			
			$('button[name=btnEtcCharger]').eq(bizOrderDaTable.data().count()-1).attr('disabled',false);
			
		}
		sideView2 = '';
	});

	//삭제버튼 클릭시
	$('#btnDel').on('click',function(){
		if(sideView != "edit"){
			toastr.warning("생산지시현황 항목을 선택해주세요.");
			return false;
		}
		if(sideView2 != 'edit'){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		
		$('#btnSave').removeClass('d-none');

		if(activeTab == "전달사항"){
			 $('#bizOrderSdTable').DataTable().rows(tableIdx).remove().draw();
		}else if(activeTab == "납품일(영업)"){
			$('#bizOrderDlTable').DataTable().rows(tableIdx).remove().draw();
		}else if(activeTab == "생산완료일"){
			 $('#bizOrderPcTable').DataTable().rows(tableIdx).remove().draw();
		}else if(activeTab == "생산지연사유"){
			 $('#bizOrderDaTable').DataTable().rows(tableIdx).remove().draw();
		} 
		
		/* if(etcSeq==null){
			
		}else{
			$.ajax({
				url : '<c:url value="bs/bizOrderEtcDtlDelete"/>', 
				type : 'GET',
				data : {
					'etcGubun' : etcGubun,
					'etcSeq' : etcSeq,
					'contDtlNo' : contDtlNo
					},
				success : function(res){
					toastr.success("삭제되었습니다.");
					
					if(activeTab == "전달사항"){
						 $('#bizOrderSdTable').DataTable().ajax.reload(function(){});
						
					}else if(activeTab == "납품일(영업)"){
						 $('#bizOrderDlTable').DataTable().ajax.reload(function(){});
						 
					}else if(activeTab == "생산완료일"){
						 $('#bizOrderPcTable').DataTable().ajax.reload(function(){});
							
					}else if(activeTab == "생산지연사유"){
						 $('#bizOrderDaTable').DataTable().ajax.reload(function(){});
					} 
					
				}
			});
		} */
		 
		sideView2 = '';
	});
	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		var check = true;
		var dataArray = new Array();

		if(activeTab == "전달사항"){
			$('#bizOrderSdTable tbody tr').each(function(index, item) {
	
				if (bizOrderSdTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find("td input[name=etcCont]").val() == "") {
						toastr.warning('내용을 입력해 주세요.');
						$('#form input[name=etcCont]').focus();
						check = false;
						return false;
					} 
				}
	
				var rowData = new Object();
				rowData.etcGubun = etcGubun;
				rowData.contDtlNo = contDtlNo;
				rowData.contNo = contNo;

				etcDeptValue = $(this).find('td select[name=etcDept]').val();
				
 				rowData.etcDept = etcDeptValue==null?"":etcDeptValue;
				rowData.etcCont = $(this).find('td input[name=etcCont]').val();
	
				dataArray.push(rowData);
				console.log(rowData)
			});
		}else if(activeTab == "납품일(영업)"){
			
			$('#bizOrderDlTable tbody tr').each(function(index, item) {
				var rowData = new Object();
				rowData.etcGubun = etcGubun;
				rowData.contDtlNo = contDtlNo;
				rowData.contNo = contNo;

				etcDateValue = $(this).find('td input[name=etcDate]').val();
				etcContValue = $(this).find('td input[name=etcCont]').val();
				
				rowData.etcDate = etcDateValue==null?serverDate.replace(/-/g,''):etcDateValue.replace(/-/g,'');
				rowData.etcCont = etcContValue==null?"":etcContValue;
	
				dataArray.push(rowData);
				console.log(rowData)
			});
			
		}else if(activeTab == "생산완료일"){
			$('#bizOrderPcTable tbody tr').each(function(index, item) {
	
				if (bizOrderPcTable.data().count() != 0) {
					//입력값 검사
					/* if ($(this).find('td input[name=etcDate]').val() == "") {
						toastr.warning('생산완료일을 선택해 주세요.');
						$('input[name=etcDate]').focus();
						check = false;
						return false;
					} */
					/* if ($(this).find("td input[name=etcCont]").val() == "") {
						toastr.warning('내용을 입력해 주세요.');
						$('input[name=etcCont]').focus();
						check = false;
						return false;
					} */
					if ($(this).find("td input[name=dtlShipCnt]").val() == "") {
						toastr.warning('완료수량을 입력해 주세요.');
						$('input[name=dtlShipCnt]').focus();
						check = false;
						return false;
					}
					
				}
	
				var rowData = new Object();
				rowData.etcGubun = etcGubun;
				rowData.contDtlNo = contDtlNo;
				rowData.contNo = contNo;
				
				rowData.etcDate = $(this).find('td input[name=etcDate]').val();
				rowData.etcCont = $(this).find('td input[name=etcCont]').val();
				rowData.dtlOrdCnt = $(this).find('td input[name=dtlOrdCnt]').val();
				rowData.dtlShipCnt = $(this).find('td input[name=dtlShipCnt]').val();
	
				dataArray.push(rowData);
				console.log(rowData)
			});
		}else if(activeTab == "생산지연사유"){
			$('#bizOrderDaTable tbody tr').each(function(index, item) {
	
				if (bizOrderDaTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=etcChargerNm]').val() == "") {
						toastr.warning('담당자를 선택해 주세요.');
						$('button[name=btnEtcCharger]').focus();
						check = false;
						return false;
					}
					if ($(this).find("td input[name=etcCont]").val() == "") {
						toastr.warning('내용을 입력해 주세요.');
						$('input[name=etcCont]').focus();
						check = false;
						return false;
					}
					
				}
	
				var rowData = new Object();
				rowData.etcGubun = etcGubun;
				rowData.contDtlNo = contDtlNo;
				rowData.contNo = contNo;

				etcChargerValue = $(this).find('td input[name=etcCharger]').val();
				
				rowData.etcCharger = etcChargerValue==null?"":etcChargerValue;
				rowData.etcCont = $(this).find('td input[name=etcCont]').val();
	
				dataArray.push(rowData);
				console.log(rowData)
			});
		}

		if (check == true) {
			$.ajax({
				url : '<c:url value="/bs/bizOrderEtcDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("저장되었습니다.");
						$('#bizOrderAdmTable').DataTable().ajax.reload();
						$('#bizOrderSdTable').DataTable().ajax.reload();
						$('#bizOrderDlTable').DataTable().ajax.reload();
						//$('#bizOrderPcTable').DataTable().ajax.reload();
						$('#bizOrderDaTable').DataTable().ajax.reload();
						
						uiProc(true);
						$('#btnSave').addClass('d-none');
						
					} else if (res.result == "excess") {
						toastr.error("완료수량값이 생산수량값을 초과하였습니다. 확인해주세요.");

					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
					sideView2 ="";
				}
			});
		}
	})
	

	//영업주문관리(외부 일자)
	var sysdate = "${serverTime}";
	   
	 var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutFrom" name="rcvDateOutFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateOutFrom,rcvDateOutFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateOutTo" name="rcvDateOutTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateOutTo,rcvDateOutTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateOutToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnOutRetv">조회</button>'
	    html1 += '</div>';
    
   
	$('#bizOrderAdmTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	
	$('#btnOutRetv').on('click',function(){
		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
		rcvDateOutToCal = $('#rcvDateOutTo').val();
		
		$('#bizOrderAdmTable').DataTable().ajax.reload(function() {});
   		$('#bizOrderDtlTable').DataTable().clear().draw();
   		$('#formOut').each(function(){
           	this.reset();
       	});
      
	});




	//생산투입상태 목록
  	let approveProcTable = $('#approveProcTable').DataTable({
		language : lang_kor,
		paging : false,
		info : false,
		ordering : true,
		searching : false,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 15,
		ajax : {
			url : '<c:url value="bs/approveProcList"/>',
			type : 'GET',
			data : {
				'contDtlNo' : function(){return contDtlNo;}
				},
		},
		columns : [{
			render: function(data, type, row, meta) {	
				return meta.row+1;		
			},
		},{
			data : 'workOrdNo'
		},{
			data : 'approveStatus',
			render : function(data, type, row, meta) {
				if(data==null) {
					return '';
				} else if(data == '출고진행') {
					return '<p class="mb-0 minorPrcssPopover"  style="color:#CCCCCC; font-size:15px;">●</p>';
				} else if(data == '승인대기') {
					return '<p class="mb-0 minorPrcssPopover"  style="color:black; font-size:15px;">●</p>';
				} else if(data == '승인진행') {
					return '<p class="mb-0 minorPrcssPopover"  style="color:blue; font-size:15px;">●</p>';
				} else if(data == '승인완료') {
					return '<p class="mb-0 minorPrcssPopover"  style="color:green; font-size:15px;">●</p>';
				} 
			}
		}
		],
		columnDefs : [ 
		
			{"defaultContent": "-", "targets": "_all",	"className": "text-center"},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
    	});
	

	//담당자 팝업 시작
	var userPopUpTable;
	function selectEtcCharger() {
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
				$('#form4 input[name=etcCharger]').eq(tableIdx).val(data.userNumber);
				$('#form4 input[name=etcChargerNm]').eq(tableIdx).val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}


	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnView == "") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnView == "edit") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		
		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm
						+ "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}
	
	function uiProc(flag) {
		$('#form select[name=etcDept]').attr('disabled',flag);
		$('#form input[name=etcCont]').attr('disabled',flag);
		//$('#form2 input[name=etcDate]').attr('disabled',flag);
		$('#form2 input[name=etcCont]').attr('disabled',flag);
		$('#form2 button[name=btnEtcDate]').attr('disabled',flag);
		//$('#form3 input[name=etcDate]').attr('disabled',flag);
		$('#form3 button[name=etcDate]').attr('disabled',flag);
		$('#form3 input[name=etcCont]').attr('disabled',flag);
		$('#form3 button[name=btnEtcDate]').attr('disabled',flag);
		//$('#form3 input[name=ordCnt]').attr('disabled',flag);
		$('#form3 input[name=dtlOrdCnt]').attr('disabled',flag); 
		$('#form3 input[name=dtlShipCnt]').attr('disabled',flag); 
		//$('#form4 input[name=etcChargerNm]').attr('disabled',flag);
		$('#form4 input[name=etcCont]').attr('disabled',flag);
		$('#form4 button[name=btnEtcCharger]').attr('disabled',flag);
	}

	

	
	
</script>
<style>
.bg-danger2 {
  background-color: #A0A0A0 !important;
}

.selected2 {
  background-color: #A0A0A0 !important;
}
</style>
   	
   	

</body>
</html>
