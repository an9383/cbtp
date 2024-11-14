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
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">수입검사결과조회(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="testResultTable" class="table table-bordered tr_highlight_row">						
							<thead class="thead-light">
								<tr>
									<th>입고일자</th>
									<th>승인여부</th>
									<th>거래처</th>	
									<th>원재료명</th>
									<th>LOT/NO</th>									
									<th>단위</th>									
									<th class="text-center">입고수량</th>
									<th class="text-center">양품수량</th>			
									<th class="text-center">불량수량</th>	
									<th class="text-center">입고번호</th>							
									<th>부적합처리</th>
									<th>검사구분</th>	
									<th>순번</th>										
									<th>목록</th>
									<th>확인방법</th>
									<th>결과</th>
									<th>확인결과</th>
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
	<!-- 검사항목관리 코드 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="inspCodePopUpLabel">제품검사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="inspCodePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   			<th style="width : 8%">품목구분</th>
									<th style="width : 25%">품번</th>
									<th style="width : 30%">품명</th>
									<th style="width : 15%">고객사</th>
									<th style="width : 15%">상태</th>
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
	<!-- 검사항목관리 코드 모달 종료-->
<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
.td_top{
	vertical-align: top!important;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "qmsc0140";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사결과조회(레이저)"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var approval = '001';
	var inspType = '';
	var itemSeq = '';
	var qaEval = '';	

	//공통코드 처리 시작
	let qaEvalCode=new Array();	//판정
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>

	let approvalCode=new Array();	//승인
    <c:forEach items="${approval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		approvalCode.push(json);
	</c:forEach>

	let inspTypeCode = new Array();	// 검사유형 목록    
	var json = new Object();	
	json.baseCd = "001";
	json.baseNm = "외관";
	inspTypeCode.push(json);
	json = new Object();
	json.baseCd = "002";
	json.baseNm = "물성치";
	inspTypeCode.push(json);
	//공통코드 처리 끝

	//검사결과 목록조회
	let testResultTable = $('#testResultTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
			language : lang_kor,	
			destroy : true,	
			paging : true,
			searching : true,
			info : true,
			ordering : false,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 1000000,
			scrollY: '65vh',
			scrollX: true,
			scrollCollapse: true,
		ajax : {
			url : '<c:url value="io/inspTestResultList"/>',
			type : 'GET',
			data : {
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); },
	           	'qaEval': function() { return qaEval; },
	           	'inspType': function() { return inspType; },
	           	'itemSeq': function() { return itemSeq; },
	           	'approvalYn': function() { return approval; },
	           	'mainGubun': function() { return '001'; },
			}	
		},	
		rowId : '',
		columns : [ 
			{//입고일자
				data :'preInWhsDate',
				render : function(data, type, row, meata){
					console.log(meata);
					return moment(data).format("YYYY-MM-DD");
				},
				name : 'rowspan'
			},		
			{//승인여부
				data :'approvalYnNm',
				name : 'rowspan'
			},	
			{//거래처
				data :'dealCorpNm',
				name : 'rowspan'
			},			
			{//원재료명
				data :'itemNm',
				name : 'rowspan'
			},								
			{//LOT/NO
				data :'lotNo',
				name : 'rowspan'
			},
			{//단위
				data :'itemUnitNm',
				name : 'rowspan'
			},
			{//입고수량
				data :'preInWhsQty',
				name : 'rowspan'
			},
			{//양품수량
				data :'pairQty',
				name : 'rowspan'
			},
			{//불량수량
				data :'faultyQty',
				name : 'rowspan'
			},	
			{//입고번호
				data :'inSlipNo',
				name : 'rowspan'
			},				
			{//부적합처리
				data :'faultyPcs',
				name : 'rowspan'
			},	
			{//검사구분
				data :'inspTypeNm',
				name : 'rowspan'
			},	
			{//순번
				data :'inspSeq'
			},			
			{//목록
				data :'inspList'
			},
			{//확인방법
				data :'inspCheckNm'
			},
			{//결과
				data :'inspResult',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						if(data=="001"){
							return '합격';
						}else{
							return '<span style="color:red;">불합격</span>';
						}
					}else{
						return '미판정';
					}
				}
			},
			{//확인결과
				data :'inspX1',
				render : function(data, type, row, meata){
					if(row['inspType']=="001"){
						if(row['inspResultNm']!=null){
							if(row['inspResultNm']=="합격"){
								return row['inspResultNm'];
							}else{
								return '<span style="color:red;">'+row['inspResultNm']+'</span>';
							}
						}else{
							return '';
						}
					}else{
						if(row['inspX1']!=null){
							if((parseFloat(row['inspStandLower']) > parseFloat(row['inspX1'])) || (parseFloat(row['inspX1']) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+row['inspX1']+'</span>';
							}else{
								return row['inspX1'];
							}
						}else{
							return '';
						}
					}
				}
			},
		],
	    order: [
	       // [ 12,0, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    rowsGroup : [ 'rowspan:name', [ 0,1,2,3,4,5,6,7,8,9,10,11] ],
	    columnDefs : [ 
		    { targets : [6,7,8], render : $.fn.dataTable.render.number(','), className : 'td_top'},
		    { targets : [0,1,2,3,4,5,6,7,8,9,10,11], className : 'td_top'},
		],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let change = -1;
			
			for(var i=0;i<data.length;i++) {			
				
				if(change == 1) {
					$(testResultTable.row(i).node()).addClass('bg-light');
				}

				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(data[i].inSlipNo != data[i+1].inSlipNo) {
						change = change * -1;
					}
				}
			} 
		}
	});
	
    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">입고일자</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled />';
    html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>&nbsp;&nbsp;&nbsp;';   

	
    html1 += '<label class="input-label-sm">검사구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="inspType" name="inspType" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';	

    html1 += '<label class="input-label-sm">승인여부</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="approval" name="approval" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm">품번</label>';
	html1 += '<div class="input-sub m-0"  style="width: 80%;">';
	html1 += '<input type="hidden" class="form-control" id="itemSeq" name="itemSeq">';
	html1 += '<input type="text" class="form-control" id="itemNm" name="itemNm" disabled="">';
	html1 += '<button type="button" id="btnItemCd" class="btn btn-primary input-sub-search" onclick="itemCdSelectInCorpCd()">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '<div class="ml-1" style="width: 5%;">';
	html1 += '<button type="button" id="itemSeqDelete" class="btn closeBtn" onclick="itemSeqDeleteFunc();">';
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
	html1 += '</div>';

	
    html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;'
    html1 += '</div>';
    
	$('#testResultTable_length').html(html1);
	$('#doDateFrom').val(serverDateFrom);
	$('#doDateTo').val(serverDateTo);
	
	selectBoxAppend(inspTypeCode, "inspType", "", "1");
	selectBoxAppend(approvalCode, "approval", "001", "");
	selectBoxAppend(qaEvalCode, "qaEval", "", "1");

	
	$('#btnRetv').on('click', function() {

		var dateToNum = parseInt($('#doDateTo').val().replace(/-/g,''));
		var dateFromNum = parseInt($('#doDateFrom').val().replace(/-/g,''));
		var dateDiff = dateToNum-dateFromNum
		
		if (isNaN(dateDiff)) {
			toastr.warning("검색기간이 YYYY-MM-DD 형식인지 확인해주세요!");
			
			return false;
		}
		if (dateDiff < 0) {
			toastr.warning("기간을 잘못 선택하였습니다.<br>다시 선택해 주세요!");
			
			return false;
		}
		if (dateDiff > 10000) {
			toastr.warning("검색 가능 기간은 최대 1년입니다!");
			
			return false;
		}

		
		serverDateFrom =  $('#doDateFrom').val();
		serverDateTo =  $('#doDateTo').val();
		approval = $('#approval option:selected').val();
		qaEval = $('#qaEval option:selected').val();		
		inspType = $('#inspType option:selected').val();
		itemSeq = $('#itemSeq').val();
	
		
		$('#testResultTable').DataTable().ajax.reload( function () {});

		setTimeout(function(){
			testResultTable.draw();
		},100)
    });
	
	let itemGubunList = ['003', '004', '005'];
	
	//코드 팝업 시작
	let inspCodePopUpTable;
	function itemCdSelectInCorpCd() {
		if (inspCodePopUpTable != null && inspCodePopUpTable != 'undefined') {
			inspCodePopUpTable.destroy();
		}
		inspCodePopUpTable = $('#inspCodePopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'itemGubunList' : function(){return itemGubunList;},
					'mainGubun': function() { return '001'; },
				},
			},
			columns : [
				{//품목구분
					data : 'itemGubunNm'
				},
				{//품번
					data : 'itemCd'
				}, 
				{//품명
					data : 'itemNm'
				},
				{//고객사
					data : 'itemCusNm'
				}, 
				{//상태
					data : 'stateCdNm'
				}  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
			drawCallback : function(){
				
			}
		});
		
		$('#inspCodePopUpTable tbody').on('click', 'tr', function() {
			var data = inspCodePopUpTable.row(this).data();
			
			//중복체크
			var itemSeqCheck = false;
			$.ajax({
				url : '<c:url value="bm/inspAdmRead"/>',
				type : 'GET',
				async : false,
				data : {
					'itemSeq' : function(){return data.itemSeq;},
				},
				success : function(res) {
					let data = res.data;
					if(data != null){
						itemSeqCheck = true;
					}
				}
			});
			$('#itemSeq').val(data.itemSeq);			
			$('#itemNm').val(data.itemNm);	
			$('#inspCodePopUpModal').modal('hide');
		});
		
		$('#inspCodePopUpModal').modal('show');
		
	}
	
	function itemSeqDeleteFunc(){
		$('#itemSeq').val('');
		$('#itemNm').val('');
	}
	
</script>

</body>
</html>
