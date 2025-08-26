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
				<li class="breadcrumb-item active">자주/공정검사결과조회(레이저)</li>
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
									<th rowspan="2" style="vertical-align: middle!important; min-width:75px;">작업지시번호</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:65px;">생산일자</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:55px;">설비명</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;">작업자</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:85px;">품번</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:85px;">품명</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:55px;">자재명</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:45px;">GRADE</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:65px;">금형코드</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;">Cavity</th>									
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;" class="text-center">생산<br>수량</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;" class="text-center">양품<br>수량</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;" class="text-center">불량<br>수량</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;">초/중/종</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:55px;">검사구분</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;">순번</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:115px;">목록</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:55px;">확인방법</th>
									<th rowspan="2" style="vertical-align: middle!important; min-width:35px;">결과</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.1</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.2</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.3</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.4</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.5</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.6</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.7</th>
									<th colspan="3" style="vertical-align: middle!important; min-width:140px;">CVT.8</th>
								</tr>
								<tr>
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.1 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.2 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.3 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.4 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.5 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.6 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.7 -->
									<th style="min-width: 45px;">X1</th>
									<th style="min-width: 45px;">X2</th>
									<th style="min-width: 45px;">X3</th> <!-- CVT.8 -->
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
	let currentHref = "qmsc0120";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","자주/공정검사결과조회(레이저)"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var inspResultGubun = '002';
	var inspType = '';
	var itemSeq = '';
	var equipCd = '';	

	//공통코드 처리 시작   
	let inspResultGubunCode = new Array();	// 검사유형 목록    
	var json=new Object();
	json.baseCd="002";
	json.baseNm="공정검사";
	inspResultGubunCode.push(json);
	json=new Object();
	json.baseCd="004";
	json.baseNm="자주검사";
	inspResultGubunCode.push(json);

	let inspTypeCode = new Array();	// 검사유형 목록    
	var json=new Object();	
	json.baseCd="001";
	json.baseNm="외관";
	inspTypeCode.push(json);
	json=new Object();
	json.baseCd="002";
	json.baseNm="치수";
	inspTypeCode.push(json);
	json=new Object();
	json.baseCd="003";
	json.baseNm="중량";
	inspTypeCode.push(json);

	//검사결과 목록조회
	let testResultTable = $('#testResultTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: '63vh',
		scrollX: true,
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="qm/jajuPrcssTestResultDataList"/>',
			type : 'GET',
			data : {
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); },
	           	'inspResultGubun': function() { return inspResultGubun; },
	           	'inspType': function() { return inspType; },
	           	'itemSeq': function() { return itemSeq; },
	           	'equipCd': function() { return equipCd; },
	           	'mainGubun': function() { return '001'; },
			}
		},
		rowId : '',
		columns : [
			{//작업지시번호
				data :'workOrdNo',
				name : 'rowspan'
			},
			{//생산일자
				data :'workEndTime',
				render : function(data, type, row, meata){
					if (data != null && data != '') {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				}, name : 'rowspan'
			},
			{//설비명
				data :'equipNm',
				name : 'rowspan'
			},
			{//작업자
				data :'workChargrNm',
				name : 'rowspan'
			},
			{//품번
				data :'itemCd',
				name : 'rowspan'
			},
			{//품명
				data :'itemNm',
				name : 'rowspan'
			},
			{//자재명
				data :'matrlNm',
				name : 'rowspan'
			},
			{//GRADE
				data :'itemGrade',
				name : 'rowspan'
			},
			{//금형코드
				data :'equipNo',
				name : 'rowspan'
			},
			{//Cavity
				data :'equipCavity',
				name : 'rowspan'
			},
			{//생산수량
				data :'outputQty',
				name : 'rowspan'
			},
			{//양품수량
				data :'fairQty',
				name : 'rowspan'
			},
			{//불량수량
				data :'faultyQty',
				name : 'rowspan'
			},
			{//초/중/종
				data :'inspectGubunNm',
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
			{//CVT.1 - X1
				data :'inspX1',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.1 - X2
				data :'inspX2',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.1 - X3
				data :'inspX3',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.2 - X1
				data :'inspX4',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.2 - X2
				data :'inspX5',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.2 - X3
				data :'inspX6',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.3 - X1
				data :'inspX7',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.3 - X2
				data :'inspX8',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.3 - X3
				data :'inspX9',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.4 - X1
				data :'inspX10',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.4 - X2
				data :'inspX11',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.4 - X3
				data :'inspX12',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.5 - X1
				data :'inspX13',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.5 - X2
				data :'inspX14',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.5 - X3
				data :'inspX15',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.6 - X1
				data :'inspX16',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.6 - X2
				data :'inspX17',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.6 - X3
				data :'inspX18',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.7 - X1
				data :'inspX19',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.7 - X2
				data :'inspX20',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.7 - X3
				data :'inspX21',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.8 - X1
				data :'inspX22',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.8 - X2
				data :'inspX23',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
			{//CVT.8 - X3
				data :'inspX24',
				render : function(data, type, row, meata){
					if(data!=null && data!=""){
						//외관
						if(row['inspType']=="001"){
							if(data=="001"){
								return '합격';
							}else{
								return '<span style="color:red;">불합격</span>';
							}
						//치수
						}else{
							if((parseFloat(row['inspStandLower']) > parseFloat(data)) || (parseFloat(data) > parseFloat(row['inspStandUpper'])) ){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					}else{
						return '';
					}
				}
			},
		],
	    order: [
	       // [ 0,1, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    rowsGroup : [ 'rowspan:name', [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14] ],
	    columnDefs : [ 
		    { targets : [10,11,12],render : $.fn.dataTable.render.number(','),className : 'td_top'},
		    { targets : [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14], className : 'td_top'}, 
		],
		drawCallback: function() {
		}
	});
	
    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">검사일자</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" onchange="changeDate(1);" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled />';
    html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>&nbsp;&nbsp;&nbsp;';   

    html1 += '<label class="input-label-sm">검사유형</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="inspResultGubun" name="inspResultGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm">검사구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="inspType" name="inspType" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm">설비명</label>';
	html1 += '<div class="row">';
	html1 += '<div class="input-sub m-0" style="width: 80%;">';
	html1 += '<input type="hidden" class="form-control" id="equipCd" name="equipCd"> ';
	html1 += '<input type="text" class="form-control" id="equipNm" name="equipNm" disabled>';
	html1 += '<button type="button" id="equipCdCus" class="btn btn-primary input-sub-search"onClick="equipCdSelectInCorpCd();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '<div class="ml-1" style="width: 5%;">';
	html1 += '<button type="button" id="equipCdDelete" class="btn closeBtn" onclick="equipCdDeleteFunc();">';
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '</div>';
	
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
	selectBoxAppend(inspResultGubunCode, "inspResultGubun", "002", "");

	//조회버튼 클릭시
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
		inspResultGubun = $('#inspResultGubun option:selected').val();
		inspType = $('#inspType option:selected').val();
		itemSeq = $('#itemSeq').val();;
		equipCd = $('#equipCd').val();;	
		
		$('#testResultTable').DataTable().ajax.reload( function () {} );

		setTimeout(function(){
			testResultTable.draw();
		},100)
    });

	function equipCdDeleteFunc(){
		$('#equipCd').val('');
		$('#equipNm').val('');
	}

	function itemSeqDeleteFunc(){
		$('#itemSeq').val('');
		$('#itemNm').val('');
	}

	//설비 팝업 시작
	let equipCdPopUpTable = null;
	function equipCdSelectInCorpCd(){
		equipCdPopUpTable = $('#equipCdPopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
			bDestroy : true,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/equipCodeAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return '001';},
				},
			},
			columns : [ 
				{//금형코드
					data : 'equipNo'
				},
				{//금형명
					data : 'equipNm'
				},
				{//제조사
					data : 'mfcCorpCd'
				},
				{//제작일자
					data : 'mfcDate',
					render : function(data, type, row) {
						if ( data != null && data != '' ) {
							return moment(data).format('YYYY-MM-DD');
						} else {
							return '';
						}
					}
				}
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		$('#equipCdPopUpModal').modal('show');
		
	}

	$(document).on('click', '#equipCdPopUpTable tbody tr', function() {
		var data = equipCdPopUpTable.row(this).data();
		
		$('#equipCd').val(data.equipCd);
		$('#equipNm').val(data.equipNm);
		
		$('#equipCdPopUpModal').modal('hide');
	});

	let itemGubunList = ['001', '003'];
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
					'mainGubun' : function(){return '001';},
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
	
</script>

</body>
</html>
