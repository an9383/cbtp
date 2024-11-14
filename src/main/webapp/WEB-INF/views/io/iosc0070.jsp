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
				<li class="breadcrumb-item active">외주발주등록</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="outsourcingAdmTable" class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="20%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>외주발주번호</th>
									<th>품명(Type)</th>
									<th>구분</th>
									<th>공정</th>
									<th class="text-center">발주수량</th>
									<th>출고처</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<div class="tab-pane fade active show" id="tab1">
						<div class="card-body col-sm-12 p-1 mb-2">
							<button type="button" class="btn btn-warning float-right mr-1"
								id="btnDel">삭제</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnEdit">수정</button>
							<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnAdd">등록</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>

						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<div id="myTabContent" class="tab-content">
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
							<form id="form">
								<div class="table-responsive">
									<table id="outsourcingDtlTable" class="table table-bordered">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>작지번호</th>
											<td>
												<div class="input-sub m-0" style="width: 100%">
													<input type="text" class="form-control" id="workOrdNo" name="workOrdNo" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnWorkOrdNo" onClick="selectWorkOrdNo()" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
											<th>외주발주번호</th>
											<td><input class="form-control" type="text"
												id="outsrcNo" disabled></td>
										</tr>
										<tr>
											<th>발주일</th>
											<td>
												<div class="form-group input-sub m-0">
													<input class="form-control" type="text" id="outsrcDate" name="outsrcDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(outsrcDate,outsrcDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="outsrcDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>담당자</th>
											<td>
												<div class="input-sub m-0" style="width: 100%">
													<input type="hidden" class="form-control" id="outChargr" name="outChargr" disabled> 
													<input type="text"class="form-control" id="outChargrNm" name="outChargrNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnOutChargr" onClick="selectOutChargr()" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>품명(Type)</th>
											<td>
												<input class="form-control" type="hidden"id="itemSeq" disabled> 
												<input class="form-control"type="hidden" id="itemCd" disabled> 
												<input class="form-control" type="text" id="itemNm" disabled>
											</td>
											<th>구분</th>
											<td><input class="form-control" type="text" id="itemGubun" disabled></td>
										</tr>
										<tr>
											<th>공정</th>
											<td>
												<select class="custom-select" id="minorPrcssCd" disabled>
													<option value="001">사출외주</option>
												</select>
											</td>
											<th>출고처</th>
											<td>
												<div class="input-sub m-0" style="width: 100%">
													<input type="hidden" class="form-control" id="outCorpCd" name="outCorpCd" disabled> 
													<input type="text" class="form-control" id="outCorpNm" name="outCorpNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnOutCorpCd" onClick="selectOutCorpCd()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr>
											<th>사급/도급</th>
											<td><select class="custom-select" id="outsrcGubun" disabled></select></td>
											<th>발주수량</th>
											<td><input class="form-control number-float0" type="text" id="outsrcQty" disabled style="text-align: right;"></td>
										</tr>
										<tr>
											<th>출고요청일</th>
											<td>
												<div class="form-group input-sub m-0 row">
													<input class="form-control" style="width: 100%;" type="text" id="reqDate" name="reqDate" disabled />
													<button onclick="fnPopUpCalendar(reqDate,reqDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="reqDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>납기일</th>
											<td>
												<div class="form-group input-sub m-0 row">
													<input class="form-control" style="width: 100%;" type="text" id="dlvDate" name="dlvDate" disabled />
													<button onclick="fnPopUpCalendar(dlvDate,dlvDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="dlvDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<button type="button" class="btn btn-primary d-none float-right"
									id="btnSave">저장</button>
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
		<!-- /.page-wrapper -->
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>

<script>

	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "iosc0070";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","외주발주등록"); 
	let viewIdx;
	let btnView;
	let sideView = 'add';
	uiProc(true);
	var tableIdx=null;
	var outsrcNo;
	var workOrdNo;
	var minorPrcssCd;
	var msg;
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate =  "${serverDateTo}";	
	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	
	$('#outsrcDate').val(serverDate);
	$('#reqDate').val(serverDate);
	$('#dlvDate').val(serverDate);
	
	//공통코드 처리 시작		
 	var outsrcGubunCode = new Array(); // 사급/도급
 	//var minorPrcssCdCode=new Array();
 	
	<c:forEach items="${outsrcGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	outsrcGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	    
	//선택박스 처리
	selectBoxAppend(outsrcGubunCode , 'outsrcGubun','', "");
	    
    $('#saveBtnModalY').on('click',function() {
    	uiProc(true);
    	$('#btnSave').addClass('d-none');
    	$('#btnEdit').attr('disabled',false);  // 수정버튼
    	$('#btnDel').attr('disabled',false);  // 삭제버튼
    	
    });


	 let outsourcingAdmTable = $('#outsourcingAdmTable').DataTable({
        dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",        
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="io/outsourcingAdmList"/>',
            type: 'GET',
            data: {
	          	'startDate': function() { return serverDateFrom.replace(/-/g,'');},
	            'endDate': function() { return serverDateTo.replace(/-/g,''); }
            },          
        },
        rowId: 'outsrcNo',
        columns : [ 
			{data :'outsrcNo'},
			{data : 'itemNm'},
			{data : 'itemGubunNm'}, 
			{
				render : function(data,type,row,meta){
					return '사출외주';
				}
			},
			{data : 'outsrcQty'},
			{data : 'outCorpNm'},	
		],
		columnDefs: [
			{ targets: [4] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' }
		],   
        order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
       
    });

	// 보기
    $('#outsourcingAdmTable tbody').on('click', 'tr', function () {
    	
    	if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}

        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }
        else {
        	$('#outsourcingAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        
        outsrcNo = outsourcingAdmTable.row( this ).data().outsrcNo;
        workOrdNo = outsourcingAdmTable.row( this ).data().workOrdNo;
        minorPrcssCd = outsourcingAdmTable.row( this ).data().minorPrcssCd;
        
        $('#btnSave').addClass('d-none');  // 저장버튼
        $('#btnEdit').attr('disabled',false); // 수정버튼
        $('#btnDel').attr('disabled',false); // 삭제버튼
    	
        $.ajax({
            url: '<c:url value="/io/outsourcingAdmRead"/>',
            type: 'GET',
            data: {
                'outsrcNo': function(){return outsrcNo;},
            },
            success: function (res) {
                let data = res.data;
                
      			if(res.result == 'ok') {
      				sideView = 'edit';
                    
                    $('#workOrdNo').val(data.workOrdNo);
                    $('#outsrcNo').val(data.outsrcNo);
                    $('#outChargr').val(data.outChargr);
                    $('#outChargrNm').val(data.outChargrNm);
                    $('#itemSeq').val(data.itemSeq);
                    $('#itemCd').val(data.itemCd);
                    $('#itemNm').val(data.itemNm);
                    $('#itemGubun').val(data.itemGubunNm);
                    $('#outCorpNm').val(data.outCorpNm);
                    $('#outCorpCd').val(data.outCorpCd);
                    $('#outsrcQty').val(addCommas(data.outsrcQty));
                    $('#outsrcDate').val(moment(data.outsrcDate).format('YYYY-MM-DD'));
                    $('#reqDate').val(moment(data.reqDate).format('YYYY-MM-DD'));
                    $('#dlvDate').val(moment(data.dlvDate).format('YYYY-MM-DD'));
                    uiProc(true);
                    
                    //선택박스 처리
                    selectBoxAppend(outsrcGubunCode, "outsrcGubun", data.outsrcGubun, "");
                    
            		
            		if(data.outQty!=0){
						msg = "이미 외주출고 되었습니다. 확인해주세요.";
                	}else if(data.inQty!=0){
						msg = "이미 외주입고 되었습니다. 확인해주세요.";
                	}else{
						msg=null;
                    }
      			} else {
      				toastr.error(res.message);
      			}
            }
        });
    });
	 

	//등록폼
	$('#btnAdd').on('click',function(){
		sideView = "add";

		$('#form').each(function(){
        	this.reset();
    	});
    	
		$.ajax({
			url : '<c:url value="io/getOutsrcNo"/>',
			type : 'GET', 
			data : {},
			success : function(res){
				$('#outsrcNo').val(res.data);
			}
		})
		
		//선택박스 처리
		selectBoxAppend(outsrcGubunCode , 'outsrcGubun','', "");

		/* minorPrcssCdCode.length=0;
		$('#minorPrcssCd').empty();
		var option = $("<option value=''>미배정</option>");
		$('#minorPrcssCd').append(option); */
		
		//화면처리
		uiProc(false);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#outsrcDate').val(serverDate);
		$('#outChargr').val(userNumber);
		$('#outChargrNm').val(userNm);
		$('#reqDate').val(serverDate);
		$('#dlvDate').val(serverDate);
	});

	//수정폼
	$('#btnEdit').on('click',function(){

		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		if(msg!=null){
			toastr.warning(msg);
			return false;
		}
		
		uiProc(false);
		$('#btnWorkOrdNo').attr('disabled',true);
		$('#btnSave').removeClass('d-none');

		
		//minorPrcssCdCode.length=0;
		
		$.ajax({
			url : '<c:url value="po/outsrcAdmWorkordList"/>',
			type : 'GET',
			data : {					     
	            'menuAuth'  : 'posc0010',
	            'workOrdNo' :  workOrdNo
			},				
			success : function(res) {
				
				if (res.result == 'ok') {
					/* 
					for(var i=0; i<res.data.length; i++){
				 		var json = new Object();
						json.baseCd = res.data[i].lowerPrcssCd;
						json.baseNm = res.data[i].lowerPrcssNm;
						minorPrcssCdCode.push(json);
					 }

					selectBoxAppend(minorPrcssCdCode, 'minorPrcssCd', minorPrcssCd,"" ); */
					
				} else {
					toastr.error(res.message);
				}
			},				
		});
	});

	//삭제폼
	$('#btnDel').on('click',function(){

		if(sideView != "edit"){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		if(msg!=null){
			toastr.warning(msg);
			return false;
		}
		
		$.ajax({
			url : '<c:url value="io/outsourcingAdmDelete" />',
			type : 'GET',
			data  : {
				'outsrcNo' : function(){return outsrcNo;}
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("삭제 되었습니다.");
					
					$('#form').each(function(){
			        	this.reset();
			    	});
					$('#outsourcingAdmTable').DataTable().ajax.reload();
								
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});


	//저장처리
	$('#btnSave').on('click',function(){
		
		if (!$.trim($('#workOrdNo').val())) {
			$('#btnWorkOrdNo').focus();
			toastr.warning('작지번호를 선택해 주세요.');
			return false;
		}

		if (!$.trim($('#outChargrNm').val())) {
			$('#btnOutChargr').focus();
			toastr.warning('담당자를 선택해 주세요.');
			return false;
		}

		if (!$.trim($('#outCorpNm').val())) {
			$('#btnOutCorpCd').focus();
			toastr.warning('출고처를 선택해 주세요.');
			return false;
		}

		if (!$.trim($('#outsrcQty').val())) {
			$('#outsrcQty').focus();
			toastr.warning('발주수량을 입력해 주세요.');
			return false;
		}
		
		if (sideView == "add") {
			url = '<c:url value="/io/outsourcingAdmCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/io/outsourcingAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'workOrdNo' 	: 	$('#workOrdNo').val(),
				'outsrcNo'  	: 	$('#outsrcNo').val(),
				'minorPrcssCd'  : 	$('#minorPrcssCd option:selected').val(),
				'itemCd' 	  	: 	$('#itemCd').val(),
				'itemRev' 	  	:	'0',
				'outCorpCd' 	: 	$('#outCorpCd').val(),
				'outsrcGubun'  	: 	$('#outsrcGubun option:selected').val(),
				'outsrcQty'   	: 	$('#outsrcQty').val().replace(/,/g,''),
				'reqDate' 		: 	$('#reqDate').val().replace(/-/g,''),
				'dlvDate'		: 	$('#dlvDate').val().replace(/-/g,''),
				'outsrcDate' 	: 	$('#outsrcDate').val().replace(/-/g,''),
				'outChargr' 	: 	$('#outChargr').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if( sideView == "edit" ) {
	                	toastr.success('수정되었습니다.');
                    }else{
                        toastr.success('등록되었습니다.');
                    } 
					uiProc(true);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					$('#btnSave').addClass('d-none');
					$('#outsourcingAdmTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
			}
		});
		
	});
	

   	
	   
    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="outsrcDateFrom" name="outsrcDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(outsrcDateFrom,outsrcDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outsrcDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="outsrcDateTo" name="outsrcDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(outsrcDateTo,outsrcDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="outsrcDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '</div>';
    
	$('#outsourcingAdmTable_length').html(html1);
	$('#outsrcDateFrom').val(serverDateFrom);
	$('#outsrcDateTo').val(serverDateTo);
	
	// 조회버튼
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#outsrcDateFrom').val();
		serverDateTo =  $('#outsrcDateTo').val();
		$('#outsourcingAdmTable').DataTable().ajax.reload( function () {});
    });	


	//작업지시번호 목록 조회 팝업
   	var workOrdPopUpTable;
   	function selectWorkOrdNo()
   	{	   	
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
				pageLength : 15,
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

		//	DataTable distinctTable = DT.DefaultView.ToTable(true,'workOrdNo');
			
		    $('#workOrdPopUpTable tbody').on('click', 'tr', function () {
		    	var data = workOrdPopUpTable.row( this ).data();
		    	$('#workOrdNo').val(data.workOrdNo);
		    	$('#itemSeq').val(data.itemSeq);
		    	$('#itemCd').val(data.itemCd);
				$('#itemNm').val(data.itemNm);
				$('#itemGubun').val(data.itemGubunNm);
				
				//minorPrcssCdCode.length=0;
				
				$.ajax({
					url : '<c:url value="po/outsrcAdmWorkordList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth'  : 'posc0010',
			            'workOrdNo' :  data.workOrdNo
					},				
					success : function(res) {
						
						if (res.result == 'ok') {
							
							/* for(var i=0; i<res.data.length; i++){
						 		var json = new Object();
								json.baseCd = res.data[i].lowerPrcssCd;
								json.baseNm = res.data[i].lowerPrcssNm;
								minorPrcssCdCode.push(json);
							 }

							selectBoxAppend(minorPrcssCdCode, 'minorPrcssCd', '', ''); */
							
						} else {
							toastr.error(res.message);
						}
					},				
				});
				
				
		    	
				$('#workOrdPopUpModal').modal('hide');		
			});
		}else{
			$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrdPopUpModal').modal('show');		
   	} 

	//담당자 팝업 시작
	var userPopUpTable;
	function selectOutChargr() {
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
					data : 'workplaceNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#outChargr').val(data.userNumber);
				$('#outChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}
	
  	//출고처 팝업 시작
   	var dealCorpPopUpTable;
   	function selectOutCorpCd()
   	{	   	
		if(dealCorpPopUpTable == null || dealCorpPopUpTable == undefined)	{
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange: false,
		        pageLength: 15,
				ajax : {
					url : '<c:url value="bm/dealCorpDataList"/>',
					type : 'GET',
					data : {},
				},
				rowId : 'dealCorpCd',
				columns : [{
					data : 'dealCorpCd'
				},{
					data : 'dealCorpNm'
				}, {
					data : 'initial'
				}, {
					data : 'presidentNm'
				}, {
					data : 'country'
				}, {
					data : 'corpNo'
				}
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

		    $('#dealCorpPopUpTable tbody').on('click', 'tr', function () {
		    	var data = dealCorpPopUpTable.row( this ).data();
		    	$('#outCorpCd').val(data.dealCorpCd);
		    	$('#outCorpNm').val(data.dealCorpNm);
		    	
				
                $('#dealCorpPopUpModal').modal('hide');
	
				});
		}else{
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal').modal('show');		
   	} 


    $(document).on('keyup','#outsrcQty',function(e){
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

	
	
	function uiProc(flag) {
		$('#btnWorkOrdNo').attr('disabled',flag);
		$('#btnOutChargr').attr('disabled',flag);
		$('#minorPrcssCd').attr('disabled',flag);
		$('#btnOutCorpCd').attr('disabled',flag);
		$('#outsrcGubun').attr('disabled',flag);
		$('#outsrcQty').attr('disabled',flag);
		$('#outsrcDateCalendar').attr('disabled',flag);
		$('#reqDateCalendar').attr('disabled',flag);
		$('#dlvDateCalendar').attr('disabled',flag);
		$('#btnOutsrcChargr').attr('disabled',flag);
	}
</script>

   	

</body>
</html>
