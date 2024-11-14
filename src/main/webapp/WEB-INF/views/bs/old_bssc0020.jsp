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
				<li class="breadcrumb-item active">수주현황</li>
			</ol>
		</nav>
	</header>
	
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card-header card-tab">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">신규등록</a></li>
						<li class="nav-item"><a class="nav-link"
							id="tab2Nav" data-toggle="tab" href="#tab2">내부등록</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<br><br>
				<div class="card">
                    <div class="open-arrow" id="arrowLeft">
                       <button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
                    </div>
                    <div id="table1">
					<div class="table-responsive" style="margin-bottom: 18%; ">
						<table id="bizOrderOutTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>수주번호</th>
									<th>접수일</th>
									<th>접수자</th>
									<th>발주처</th>
									<th>국내/국외</th>
									<th>구분</th>
									<th>품명(Type)</th>
									<th>LOT NO</th>
									<th>전압</th>
									<th>Size</th>
									<th>단가</th>
									<th>금액</th>
									<th>출하요청일</th>
								</tr>
							</thead>
						</table>
					</div>
					</div>
					<div id="table2" class="d-none">
					<div class="table-responsive" style="margin-bottom: 18%; ">
						<table id="bizOrderInTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>수주번호</th>
									<th>접수일</th>
									<th>접수자</th>
									<th>발주처</th>
									<th>의뢰인</th>
									<th>구분</th>
									<th>품명(Type)</th>
									<th>LOT NO</th>
									<th>특이사항</th>
									<th>출하요청일</th>
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
	
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bssc0020";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";

	var bizGubun = '001';
	var contNo = null;
	var ordCorpCd = null;
	var inexGubun = null;
	var contGubun = null;
	var itemCd = null;
	var workOrdNo = null;
	var dtlOrdCnt = null;
	var lotNo = null;
	var ordDtlDesc = null;
	var activeTab = "신규등록";
	var rcvDateInFromCal = serverDateFrom;
	var rcvDateInToCal = serverDateTo;
	var rcvDateOutFromCal = serverDateFrom;
	var rcvDateOutToCal = serverDateTo;

	
	$("input[name=rcvDate]").val(serverDateTo);
	$("input[name=shipReqDate]").val(serverDateTo);
	
	$('a[data-toggle="tab"]').on('shown.bs.tab',function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	//외부등록 탭 클릭시
	$('#tab1Nav').on('click',function(){
		$('#table1').removeClass('d-none');
		$('#table2').addClass('d-none');
		bizGubun = '001';
		$('#bizOrderOutTable').DataTable().ajax.reload( function () {});
	});

	//내부등록 탭 클릭시
	$('#tab2Nav').on('click',function(){
	
		$('#table1').addClass('d-none');
		$('#table2').removeClass('d-none');
		bizGubun = '002';
		$('#bizOrderInTable').DataTable().ajax.reload( function () {});
	});

	//영업주문관리 목록조회(외부)
	let bizOrderOutTable = $('#bizOrderOutTable').DataTable({
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderAdmStatusList"/>',
			type : 'GET',
			data : {
				'bizGubun': function(){return bizGubun;},
				'startDate' : function(){return rcvDateOutFromCal;},
				'endDate' : function(){return rcvDateOutToCal;}
			},
		},
		rowId : 'soNb',
		columns : [ 
				{data : 'contNo'},
				{data : 'rcvDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{data : 'rcvChargrNm'},
				{data : 'ordCorpNm'},
				{data : 'inexGubunNm'},				
				{data : 'contGubunNm'},
				{data : 'itemNm'},
				{data : 'lotNo'},
				{data : 'itemVoltage'},
				{data : 'itemSize'},
				{data : 'unitCost'},
				{data : 'totalAmt'},
				{data : 'shipReqDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
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

	//영업주문관리 목록조회(내부)
	let bizOrderInTable = $('#bizOrderInTable').DataTable({
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		//ordering: false,
		ajax : {
			url : '<c:url value="bs/bizOrderAdmStatusList"/>',
			type : 'GET',
			data : {
				'bizGubun': function(){return bizGubun;},
				'startDate' : function(){return rcvDateInFromCal;},
				'endDate' : function(){return rcvDateInToCal;}
			},
		},
		rowId : 'soNb',
		columns : [ 
				{data : 'contNo'},
				{data : 'rcvDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{data : 'rcvChargrNm'},
				{data : 'ordCorpNm'},
				{data : 'contClient'},				
				{data : 'contGubunNm'},
				{data : 'itemNm'},
				{data : 'lotNo'},
				{data : 'bizOrdDtl'},
				{data : 'shipReqDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
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

	//영업주문관리 외부 목록 클릭시
	$('#bizOrderOutTable tbody').on('click','tr', function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			
		} else {
			$('#bizOrderOutTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		$('#btnSave').addClass('d-none');
		contNo = bizOrderOutTable.row(this).data().contNo;
		ordCorpCd =  bizOrderOutTable.row(this).data().ordCorpNm; //발주처명
		inexGubun =  bizOrderOutTable.row(this).data().inexGubunNm; //국내/국외명
		contGubun = bizOrderOutTable.row(this).data().contGubunNm;  //구분명
		itemCd = bizOrderOutTable.row(this).data().itemNm;			//품명

		
        $.ajax({
            url: '<c:url value="/bs/bizOrderAdmRead"/>',
            type: 'GET',
            data: {
               'bizGubun' : function(){return bizGubun;},
               'contNo' : function(){return contNo;}
            },
            success: function (res) {
                let data = res.data;
      			
      			if(res.result == 'ok') {
      				sideView = 'edit';
      				uiProc(true);
                    $('#formOut input[name=contNo]').val(data.contNo);
                    $('#formOut input[name=rcvDate]').val(data.rcvDate);
                    $('#formOut input[name=ordNo]').val(data.ordNo);
                    $('#formOut input[name=rcvChargr]').val(data.rcvChargr);
                    $('#formOut input[name=rcvChargrNm]').val(data.rcvChargrNm);
                    $('#formOut input[name=ordCorpCd]').val(data.ordCorpCd);
                    $('#formOut input[name=ordCorpNm]').val(data.ordCorpNm);
                    $('#formOut input[name=shipReqDate]').val(data.shipReqDate);
                    $('#formOut input[name=itemNm]').val(data.itemNm);
                    $('#formOut input[name=itemCd]').val(data.itemCd);
                    $('#formOut input[name=ordCnt]').val(data.ordCnt);
                    $('#formOut input[name=itemVoltage]').val(data.itemVoltage);
                    $('#formOut input[name=itemOutput]').val(data.itemOutput);
                    $('#formOut input[name=itemSize]').val(data.itemSize);
                    $('#formOut input[name=itemGubunOut]').val(data.itemGubun);  
                    $('#formOut input[name=unitCost]').val(data.unitCost);
                    $('#formOut input[name=totalAmt]').val(data.totalAmt);
                    $('#formOut input[name=delayCnt]').val(data.delayCnt);
                    $('#formOut input[name=shipCnt]').val(data.shipCnt);  


                	//선택박스처리(외부)
                	selectBoxAppend(useYnCode, "useYnOut", data.useYn, "");  //사용여부
                	selectBoxAppend(inexGubunCode, "inexGubunOut", data.inexGubun, "2");  //국내/국외
                	selectBoxAppend(contGubunCode, "contGubunOut", data.contGubun, "");  //수주구분
                	selectBoxAppend(itemGubunCode, "itemGubunOut", data.itemGubun, "2");  //스페셜/표준
                	selectBoxAppend(confirmYnCode, "confirmYnOut", data.confirmYn, "2");  //확정여부
      			} else {
      				toastr.error(res.message);
      			}
            }
        });
        
	
		
		$('#bizOrderDtlTable').DataTable().ajax.reload( function () {});
		console.log(contNo);
	});

	
	//영업주문관리 내부 목록 클릭시
    $('#bizOrderInTable tbody').on('click','tr', function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			
		} else {
			$('#bizOrderInTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		contNo = bizOrderInTable.row(this).data().contNo;
 		ordCorpCd =  bizOrderInTable.row(this).data().ordCorpNm; //발주처명
		inexGubun = '-'; //국내/국외명
		contGubun = bizOrderInTable.row(this).data().contGubunNm;  //구분명
		itemCd = bizOrderInTable.row(this).data().itemNm;			//품명 
		
		 $.ajax({
	            url: '<c:url value="/bs/bizOrderAdmRead"/>',
	            type: 'GET',
	            data: {
	               'bizGubun' : function(){return bizGubun;},
	               'contNo' : function(){return contNo;}
	            },
	            success: function (res) {
	                let data = res.data;
	      			
	      			if(res.result == 'ok') {
	      				sideView = 'edit';
	      				uiProc(true);
	                    $('#formIn input[name=contNo]').val(data.contNo);
	                    $('#formIn input[name=rcvDate]').val(data.rcvDate);
	                    $('#formIn input[name=ordNo]').val(data.ordNo);
	                    $('#formIn input[name=rcvChargr]').val(data.rcvChargr);
	                    $('#formIn input[name=rcvChargrNm]').val(data.rcvChargrNm);
	                    $('#formIn input[name=ordCorpCd]').val(data.ordCorpCd);
	                    $('#formIn input[name=ordCorpNm]').val(data.ordCorpNm);
	                    $('#formIn input[name=shipReqDate]').val(data.shipReqDate);
	                    $('#formIn input[name=contClient]').val(data.contClient);
	                    $('#formIn input[name=itemCd]').val(data.itemCd);
	                    $('#formIn input[name=itemNm]').val(data.itemNm);
	                    $('#formIn input[name=bizOrdDtl]').val(data.bizOrdDtl);
	                    $('#formIn input[name=delayCnt]').val(data.delayCnt);
	                    $('#formIn input[name=shipCnt]').val(data.shipCnt);  

	                	//선택박스처리(외부)
	                	selectBoxAppend(useYnCode, "useYnIn", data.useYn, "");  //사용여부
	                	selectBoxAppend(contGubunCode, "contGubunIn", data.contGubun, "");  //수주구분
	                	selectBoxAppend(confirmYnCode, "confirmYnIn", data.confirmYn, "2");  //확정여부
	      			} else {
	      				toastr.error(res.message);
	      			}
	            }
	        });
	        
		$('#bizOrderDtlTable').DataTable().ajax.reload( function () {});
		console.log(contNo);
	});

  
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
    
   
	$('#bizOrderOutTable_length').html(html1);
	$('#rcvDateOutFrom').val(serverDateFrom);
	$('#rcvDateOutTo').val(serverDateTo);

	 //영업주문관리(내부 일자)
	 var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInFrom" name="rcvDateInFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateInFrom,rcvDateInFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="rcvDateInTo" name="rcvDateInTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(rcvDateInTo,rcvDateInTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="rcvDateInToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnInRetv">조회</button>'
	    html1 += '</div>';
   
  
	$('#bizOrderInTable_length').html(html1);
	$('#rcvDateInFrom').val(serverDateFrom);
	$('#rcvDateInTo').val(serverDateTo);

	$('#btnOutRetv').on('click',function(){
		rcvDateOutFromCal = $('#rcvDateOutFrom').val();
		rcvDateOutToCal = $('#rcvDateOutTo').val();
		
		$('#bizOrderOutTable').DataTable().ajax.reload(function() {});
   		$('#bizOrderDtlTable').DataTable().clear().draw();
   		$('#formOut').each(function(){
           	this.reset();
       	});
      
	});

	 
	$('#btnInRetv').on('click',function(){
		rcvDateInFromCal = $('#rcvDateInFrom').val();
		rcvDateInToCal = $('#rcvDateInTo').val();

		$('#bizOrderInTable').DataTable().ajax.reload(function() {});
		$('#bizOrderDtlTable').DataTable().clear().draw();
		$('#formIn').each(function(){
        	this.reset();
    	});
	});

	
   	
	function uiProc(flag) {
		$("#formOut input[name=contNo]").attr("disabled", flag);
		$("#formOut input[name=ordNo]").attr("disabled", flag);
		$("#formOut input[name=ordCnt]").attr("disabled", flag);
		$("#formOut input[name=itemVoltage]").attr("disabled", flag);
		$("#formOut input[name=itemOutput]").attr("disabled", flag);
		$("#formOut input[name=itemSize]").attr("disabled", flag);
		$("#formOut input[name=unitCost]").attr("disabled", flag);
		$("#formOut input[name=totalAmt]").attr("disabled", flag);
		$("#formOut input[name=delayCnt]").attr("disabled", flag);
		$("#formOut input[name=shipCnt]").attr("disabled", flag);

		$("button[name=rcvDateCalendar]").attr("disabled", flag);
		$("button[name=shipReqDateCalendar]").attr("disabled", flag);

		$("button[name=btnRcvChargr]").attr("disabled", flag);
		$("button[name=btnOrdCorpCd]").attr("disabled", flag);
		$("button[name=btnItemCd]").attr("disabled", flag);

		$("#inexGubunOut").attr('disabled',flag);
		$("#contGubunOut").attr('disabled',flag);
		$("#itemGubunOut").attr('disabled',flag);
		$("#confirmYnOut").attr('disabled',flag);
		$("#useYnOut").attr('disabled',flag);
	}

	function uiProc2(flag) {
		$("#formIn input[name=contNo]").attr("disabled", flag);
		$("#formIn input[name=ordNo]").attr("disabled", flag);
		$('#formIn input[name=contClient]').attr("disabled",flag);
		$('#formIn input[name=ordCnt]').attr("disabled",flag);
		$('#formIn input[name=bizOrdDtl]').attr("disabled",flag);
		$("#formIn input[name=delayCnt]").attr("disabled", flag);
		$("#formIn input[name=shipCnt]").attr("disabled", flag);
		
		$("button[name=btnRcvChargr]").attr("disabled", flag);
		$("button[name=btnOrdCorpCd]").attr("disabled", flag);
		$("button[name=btnItemCd]").attr("disabled", flag);
		$('button[name=rcvDateCalendar]').attr("disabled",flag);
		$('button[name=shipReqDateCalendar]').attr("disabled",flag);

		
		$("#contGubunIn").attr('disabled',flag);
		$("#confirmYnIn").attr('disabled',flag);
		$("#useYnIn").attr('disabled',flag);
		
	}
	
</script>
</body>
</html>
