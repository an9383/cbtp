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
				<li class="breadcrumb-item active">출하검사결과조회(레이저)</li>
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
							<colgroup>
								<col width="6%">
								<col width="4%">
								<col width="4%">
								<col width="5%">
								<col width="5%">
								<col width="4%">
								<col width="4%">
								<col width="4%">
								<col width="6%">
								<col width="4%">
								<col width="4%">
								<col width="3%">
								<col width="3%">
								<col width="3%"> 
								<col width="5%">
								<col width="4%">
								<col width="3%">
								<col width="7%">
								<col width="4%">
								<col width="3%">
								<col width="3%">
								<col width="3%">
								<col width="3%">
								<col width="3%">
								<col width="3%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="vertical-align: middle!important;">검사일</th>
									<th style="vertical-align: middle!important;">승인여부</th>									
									<th style="vertical-align: middle!important;">품번</th>
									<th style="vertical-align: middle!important;">품명</th>
									<th style="vertical-align: middle!important;">자재명</th>
									<th style="vertical-align: middle!important;">GRADE</th>
									<th style="vertical-align: middle!important;">금형코드</th>
									<th style="vertical-align: middle!important;">Cavity</th>			
									<th style="vertical-align: middle!important;">요청일</th>						
									<th style="vertical-align: middle!important;" class="text-center">요청<br>수량</th>
									<th style="vertical-align: middle!important;" class="text-center">검사<br>수량</th>			
									<th style="vertical-align: middle!important;" class="text-center">양품<br>수량</th>
									<th style="vertical-align: middle!important;" class="text-center">불량<br>수량</th>
									<th style="vertical-align: middle!important;" class="text-center">출하<br>수량</th>
									<th style="vertical-align: middle!important;" class="text-center">요청번호</th>
									<th style="vertical-align: middle!important;">검사구분</th>	
									<th style="vertical-align: middle!important;">순번</th>									
									<th style="vertical-align: middle!important;">목록</th>
									<th style="vertical-align: middle!important;">확인방법</th>
									<th style="vertical-align: middle!important;">결과</th>
									<th style="vertical-align: middle!important;" id="thX1">X1</th>
									<th style="vertical-align: middle!important;" id="thX2">X2</th>
									<th style="vertical-align: middle!important;" id="thX3">X3</th>
									<th style="vertical-align: middle!important;" id="thX4">X4</th>
									<th style="vertical-align: middle!important;" id="thX5">X5</th>
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
	let currentHref = "qmsc0130";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","출하검사결과조회(레이저)"); 
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let serverDate = "${serverDateTo}";
	let approval = '001';
	let inspTypeVal = '';
	let itemSeq = '';
	let qaEval = '';
	let traIdx = 0; //testResultArray 인덱스
	let dataZero = false;

	//공통코드 처리 시작
	let qaEvalCode = new Array();	//판정
    <c:forEach items = "${qaEval}" var = "info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	qaEvalCode.push(json);
	</c:forEach>

	let approvalCode = new Array();	//승인
    <c:forEach items = "${approval}" var = "info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	approvalCode.push(json);
	</c:forEach>

	let inspTypeCode = new Array();	// 검사유형 목록
	var json = new Object();
	json.baseCd = "001";
	json.baseNm = "외관";
	inspTypeCode.push(json);
	json = new Object();
	json.baseCd = "002";
	json.baseNm = "치수";
	inspTypeCode.push(json);
	
	let testResultArray = new Array(); //검사항목결과관리 연계번호 조회
    <c:forEach items = "${testResultList}" var = "info">
	var json = new Object();
	json.inspSourceNo = "${info.inspSourceNo}";
	json.inspSourceSubNo = "${info.inspSourceSubNo}";
	testResultArray.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	//초기화
	if ( testResultArray.length > 1 ) {
		$('#tableNext').attr('disabled', false);
		dataZero = false;
	} else if ( testResultArray.length == 1 ) {
		dataZero = false;
	} else {
		var json = new Object();
		json.inspSourceNo = "";
		json.inspSourceSubNo = "";
		testResultArray.push(json);
		
		dataZero = true;
	}
	//초기화 끝
	
	//검사결과 목록조회
	let testResultTable = $('#testResultTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>" +
			 "<'row'<'col-sm-12'tr>>" +
			 "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>" +
			 "<'row bottomRow'<'col-sm-12 col-md-12'>>B",
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
		scrollY: '60vh',
		scrollX: true,
		scrollCollapse: false,
		ajax : {
			url : '<c:url value="qm/testResultCompleteList"/>',
			type : 'GET',
			data : {
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); },
	           	'qaEval': function() { return qaEval; },
	           	'itemSeq': function() { return itemSeq; },
	           	'approvalYn': function() { return approval; },
	           	'inspSourceNo': function() { return testResultArray[traIdx].inspSourceNo; },
	           	'inspSourceSubNo': function() { return testResultArray[traIdx].inspSourceSubNo; },
	           	'inspType': function() { return inspTypeVal; },
	           	'mainGubun': function() { return '001'; },
			}
		},	
		rowId : '',
		columns : [
			{//검사일
				data : 'inspectDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				},
				name : 'rowspan'
			},
			{//승인여부
				data : 'approvalYnNm',
				name : 'rowspan'
			},			
			{//품번
				data : 'itemCd',
				name : 'rowspan'
			},
			{//품명
				data : 'itemNm',
				name : 'rowspan'
			},
			{//자재명
				data : 'matrlNm',
				name : 'rowspan'
			},
			{//GRADE
				data : 'itemGrade',
				name : 'rowspan'
			},
			{//금형코드
				data : 'equipNo',
				name : 'rowspan'
			},
			{//Cavity
				data : 'equipCavity',
				name : 'rowspan'
			},
			{//요청일
				data : 'doDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				},
				name : 'rowspan'
			},				
			{//요청수량
				data : 'targetQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				name : 'rowspan'
			},
			{//검사수량
				data : 'inspectCnt',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				name : 'rowspan'
			},
			{//양품수량
				data : 'pairQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				name : 'rowspan'
			},
			{//불량수량
				data : 'faultyQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				name : 'rowspan'
			},
			{//출하수량
				data : 'outputQty',
				render : function( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(data);
					} else {
						return "0";
					}
				},
				name : 'rowspan'
			},
			{//요청번호
				data : 'doNo',
				name : 'rowspan'
			},
			{//검사구분
				data : 'inspTypeNm',
				name : 'rowspan'
			},		
			{//순번
				data : 'inspSeq',
				name : 'rowspan'
			},		
			{//목록
				data : 'inspList',
				name : 'rowspan'
			},
			{//확인방법
				data : 'inspCheckNm',
				name : 'rowspan'
			},
			{//결과
				data : 'inspResult',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != "" ) {
						if ( data == "001" ) {
							return '합격';
						} else {
							return '<span style="color:red;">불합격</span>';
						}
					} else {
						return '미판정';
					}
				}
			},
			{//X1
				data :'inspX1',
				render : function(data, type, row, meata){
					if ( data != null && data != "" ) {
						$('#thX1').html('X1 <hr class="" style="margin-top: 0.3rem;margin-bottom: 0.3rem;border: 1px solid #888c9b78;min-width: 100%;">'+row['cavityNo1']);
						//외관
						if ( row['inspType'] == "001" ) {
							if ( data == "001" ) {
								return '합격';
							} else {
								return '불합격';
							}
						//치수
						} else {
							return data;
						}
					} else {
						return '';
					}
				}
			},
			{//X2
				data :'inspX2',
				render : function(data, type, row, meata){
					if( data != null && data != "" ) {
						$('#thX2').html('X2 <hr class="" style="margin-top: 0.3rem;margin-bottom: 0.3rem;border: 1px solid #888c9b78;min-width: 100%;">'+row['cavityNo2']);
						//외관
						if ( row['inspType'] == "001" ) {
							if (data == "001" ) {
								return '합격';
							} else {
								return '불합격';
							}
						//치수
						} else {
							return data;
						}
					} else {
						return '';
					}
				}
			},
			{//X3
				data :'inspX3',
				render : function(data, type, row, meata){
					if ( data != null && data != "" ) {
						$('#thX3').html('X3 <hr class="" style="margin-top: 0.3rem;margin-bottom: 0.3rem;border: 1px solid #888c9b78;min-width: 100%;">'+row['cavityNo3']);
						//외관
						if ( row['inspType'] == "001" ) {
							if ( data == "001" ) {
								return '합격';
							} else {
								return '불합격';
							}
						//치수
						} else {
							return data;
						}
					} else {
						return '';
					}
				}
			},
			{//X4
				data :'inspX4',
				render : function(data, type, row, meata){
					if ( data != null && data != "" ) {
						$('#thX4').html('X4 <hr class="" style="margin-top: 0.3rem;margin-bottom: 0.3rem;border: 1px solid #888c9b78;min-width: 100%;">'+row['cavityNo4']);
						//외관
						if ( row['inspType'] == "001" ) {
							if ( data == "001" ) {
								return '합격';
							} else {
								return '불합격';
							}
						//치수
						} else {
							return data;
						}
					} else {
						return '';
					}
				}
			},
			{//X5
				data :'inspX5',
				render : function(data, type, row, meata){
					if ( data != null && data != "" ) {
						$('#thX5').html('X5 <hr class="" style="margin-top: 0.3rem;margin-bottom: 0.3rem;border: 1px solid #888c9b78;min-width: 100%;">'+row['cavityNo5']);
						//외관
						if ( row['inspType'] == "001" ) {
							if ( data == "001" ) {
								return '합격';
							} else {
								return '불합격';
							}
						//치수
						} else {
							return data;
						}
					} else {
						return '';
					}
				}
			},		
		],		
	    order: [
	        
	    ],
	    buttons: [
	    	'copy', {
                extend: 'excel',
                title: '출하검사결과조회(레이저)',
                className : 'btn-secondary',
            	init : function ( api, node, config ) {
					$(node).addClass('btn-secondary');
					$(node).text('Excel');
				},
				/* exportOptions: {
                	columns  : [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],
                    format: {
                        body: function (data, column, row, node) {
                        	if(row==0) {
                            	console.log(node);
                        		return node.innerHTML;
                            } else {
                                return data;
                            }
                        }
                    },
                } */ 
                customize : function (xlsx) {
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);

			 		col.each(function () {
			 	    	$(this).attr('width', 15);
			 	    });

			 		if ( testResultTable.data().length > 0 ) {
			 			let resultV = $('c[r=V2] t', sheet).text().substring(0, $('c[r=V2] t', sheet).text().indexOf(" "));
			 			$('c[r=V2] t', sheet).text(resultV + " -" + $('c[r=V2] t', sheet).text().substring($('c[r=V2] t', sheet).text().indexOf(" ")));
			 			
			 			let resultW = $('c[r=W2] t', sheet).text().substring(0,$('c[r=W2] t', sheet).text().indexOf(" "));
			 			$('c[r=W2] t', sheet).text(resultW + " -" + $('c[r=W2] t', sheet).text().substring($('c[r=W2] t', sheet).text().indexOf(" ")));

			 			let resultX = $('c[r=X2] t', sheet).text().substring(0,$('c[r=X2] t', sheet).text().indexOf(" "));
			 			$('c[r=X2] t', sheet).text(resultX + " -" + $('c[r=X2] t', sheet).text().substring($('c[r=X2] t', sheet).text().indexOf(" ")));

			 			let resultY = $('c[r=Y2] t', sheet).text().substring(0,$('c[r=Y2] t', sheet).text().indexOf(" "));
			 			$('c[r=Y2] t', sheet).text(resultY + " -" + $('c[r=Y2] t', sheet).text().substring($('c[r=Y2] t', sheet).text().indexOf(" ")));

			 			let resultZ = $('c[r=Z2] t', sheet).text().substring(0,$('c[r=Z2] t', sheet).text().indexOf(" "));
			 			$('c[r=Z2] t', sheet).text(resultZ + " -" + $('c[r=Z2] t', sheet).text().substring($('c[r=Z2] t', sheet).text().indexOf(" ")));
			 		}
			 		
				}
            }, 'print'                                
	    ],
	    rowsGroup : [ 'rowspan:name', [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ],
	    columnDefs : [ 
		    { targets : [9,10,11,12,13],render : $.fn.dataTable.render.number(','),className : 'td_top'},
		    { targets : [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], className : 'td_top'},
	    ],
		drawCallback: function() {
			/* let api = this.api();
			let data = api.data();
			
			let change = -1;
			
			for(var i=0;i<data.length;i++) {			
				
				if(change == 1) {
					$(testResultTable.row(i).node()).addClass('bg-light');
				}

				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(data[i].doNo != data[i+1].doNo) {
						change = change * -1;
					}
				}
			}

			//최종결과 값 생성
			let bulCount = 0;
			let nullCount = 0;
			for(var i=0;i<data.length;i++) {	
				//외관일경우	
				if(data[i].inspType == "001"){
					if(data[i].inspX1=="002" || data[i].inspX2=="002" || data[i].inspX3=="002" || data[i].inspX4=="002" || data[i].inspX5=="002"){
						bulCount--;
					}
				//치수일경우
				}else{
					if(
						((parseFloat(data[i].inspStandLower) > parseFloat(data[i].inspX1)) || (parseFloat(data[i].inspX1) > parseFloat(data[i].inspStandUpper)))
						|| ((parseFloat(data[i].inspStandLower) > parseFloat(data[i].inspX2)) || (parseFloat(data[i].inspX2) > parseFloat(data[i].inspStandUpper)))
						|| ((parseFloat(data[i].inspStandLower) > parseFloat(data[i].inspX3)) || (parseFloat(data[i].inspX3) > parseFloat(data[i].inspStandUpper)))
						|| ((parseFloat(data[i].inspStandLower) > parseFloat(data[i].inspX4)) || (parseFloat(data[i].inspX4) > parseFloat(data[i].inspStandUpper)))
						|| ((parseFloat(data[i].inspStandLower) > parseFloat(data[i].inspX5)) || (parseFloat(data[i].inspX5) > parseFloat(data[i].inspStandUpper)))
					){ bulCount--;}
				}

				if(data[i].inspX1==null || data[i].inspX1==""){
					nullCount--;
				} 
				if(data[i].inspX2==null || data[i].inspX2==""){
					nullCount--;
				} 
				if(data[i].inspX3==null || data[i].inspX3==""){
					nullCount--;
				} 
				if(data[i].inspX4==null || data[i].inspX4==""){
					nullCount--;
				} 
				if(data[i].inspX5==null || data[i].inspX5==""){
					nullCount--;
				} 
				
				if(bulCount<0 && nullCount!=-5){
					$('span[name=inspResult]').eq(i).text("불합격");
					$('span[name=inspResult]').eq(i).css('color','red');
				}else if(bulCount==0 && nullCount==-5){
					$('span[name=inspResult]').eq(i).text("미판정");
					$('span[name=inspResult]').eq(i).css('color','black');
				}else {
					$('span[name=inspResult]').eq(i).text("합격");
					$('span[name=inspResult]').eq(i).css('color','black');
				} 
				
				bulCount=0;
				nullCount=0;
			} */
			
		}
	});
	
    let html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">출하일자</label><div class="form-group input-sub m-0 row">';
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

    html1 += '<label class="input-label-sm">판정</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="qaEval" name="qaEval" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';

    html1 += '<label class="input-label-sm">승인여부</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="approval" name="approval" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';

    html1 += '<label class="input-label-sm">품번</label>';
	html1 += '<div class="input-sub m-0"  style="width: 80%;">';
	html1 += '<input type="hidden" class="form-control" id="itemSeq" name="itemSeq">';
	html1 += '<input type="text" class="form-control" id="itemNm" name="itemNm" disabled>';
	html1 += '<button type="button" id="btnItemCd" class="btn btn-primary input-sub-search" onclick="itemCdSelectInCorpCd()">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '<div class="ml-1">';
	html1 += '<button type="button" id="itemSeqDelete" class="btn closeBtn p-1" onclick="$(\'#itemSeq\').val(\'\'); $(\'#itemNm\').val(\'\');">';
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
	html1 += '</div>';

    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
 	
    html1 += '</div>';
    
	let html2 = '<div class="col-sm-12">';
 	html2 += '<button type="button" class="btn btn-success float-right ml-2" id="tableNext" onclick="tableReload(\'next\');" disabled>▶</button>';
 	html2 += '<label class="input-label-sm float-right m-1" id="pageInfo">0</label>';
 	html2 += '<button type="button" class="btn btn-success float-right mr-2" id="tablePrev" onclick="tableReload(\'prev\');" disabled>◀</button>';
    html2 += '</div>';
    
	$('#testResultTable_length').html(html1);
	$('.bottomRow').html(html2);
	
	$('#doDateFrom').val(serverDateFrom);
	$('#doDateTo').val(serverDateTo);
	
	selectBoxAppend(inspTypeCode, "inspType", "", "1");
	selectBoxAppend(approvalCode, "approval", "001", "");
	selectBoxAppend(qaEvalCode, "qaEval", "", "1");
	
	$('#pageInfo').text((traIdx+1) + " - " + testResultArray.length);
	if(dataZero) {$('#pageInfo').text('0 - 0');}

	//조회 버튼 클릭 시
	$('#btnRetv').on('click', function() {
		
		let dateToNum = parseInt( $('#doDateTo').val().replace(/-/g,'') );
		let dateFromNum = parseInt( $('#doDateFrom').val().replace(/-/g,'') );
		let dateDiff = dateToNum - dateFromNum;
		
		if ( isNaN(dateDiff) ) {
			toastr.warning("검색기간이 YYYY-MM-DD 형식인지 확인해주세요!");
			return false;
		}
		if ( dateDiff < 0 ) {
			toastr.warning("기간을 잘못 선택하였습니다.<br>다시 선택해 주세요!");
			return false;
		}
		if ( dateDiff > 10000 ) {
			toastr.warning("검색 가능 기간은 최대 1년입니다!");
			return false;
		}
		
		serverDateFrom = $('#doDateFrom').val();
		serverDateTo = $('#doDateTo').val();
		approval = $('#approval option:selected').val();
		qaEval = $('#qaEval option:selected').val();		
		inspTypeVal = $('#inspType option:selected').val();
		itemSeq = $('#itemSeq').val();
	
		testResultArrayReload(); //검사항목결과관리 연계번호 조회
		
		$('#testResultTable').DataTable().ajax.reload(function(){});
		
		$('#pageInfo').text((traIdx+1) + " - " + testResultArray.length);
		if(dataZero) {$('#pageInfo').text('0 - 0');}
		
		setTimeout(function(){
			testResultTable.draw();
			testResultTable.draw();
		}, 300);
		
    });

	//품번 모달 테이블
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
					'itemGubun' : function(){ return "001"; },
					'mainGubun' : function(){ return "001"; },
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
			let data = inspCodePopUpTable.row(this).data();
			
			$('#itemSeq').val(data.itemSeq);
			$('#itemNm').val(data.itemNm);
			$('#inspCodePopUpModal').modal('hide');
		});
		
		$('#inspCodePopUpModal').modal('show');
	}
	
	//페이징 버튼 클릭 시
	function tableReload(check) {
		if ( check == 'next' ) {//▶ 클릭 시
			traIdx ++;
			if ( traIdx >= testResultArray.length-1 ) {
				$('#tablePrev').attr('disabled', false);
				$('#tableNext').attr('disabled', true);
			} else {
				$('#tablePrev').attr('disabled', false);
				$('#tableNext').attr('disabled', false);
			}
		} else if ( check == 'prev' ) {//◀ 클릭 시
			traIdx --;
			if ( traIdx <= 0 ) {
				$('#tablePrev').attr('disabled', true);
				$('#tableNext').attr('disabled', false);
			} else {
				$('#tablePrev').attr('disabled', false);
				$('#tableNext').attr('disabled', false);
			}
		} else {
			console.log("예상치 못한 오류가 발생했습니다.");
		}
		
		$('#testResultTable').DataTable().ajax.reload(function(){});
		
		$('#pageInfo').text((traIdx+1) + " - " + testResultArray.length);
		if(dataZero) {$('#pageInfo').text('0 - 0');}
		
		setTimeout(function(){
			testResultTable.draw();
			testResultTable.draw();
		}, 300);
	}
	
	//검사항목결과관리 연계번호 조회
	function testResultArrayReload() {
		$.ajax({
			url : '<c:url value="qm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); },
	           	'qaEval': function() { return qaEval; },
	           	'inspType': function() { return inspTypeVal; },
	           	'itemSeq': function() { return itemSeq; },
	           	'approvalYn': function() { return approval; },
	           	'mainGubun': function() { return '001'; },
			},
			success : function(res) {
				let data = res.data;
				
				traIdx = 0;
				$('#tablePrev').attr('disabled', true);
				$('#tableNext').attr('disabled', true);
				
				testResultArray = new Array(); //검사항목결과관리 연계번호 조회
				data.forEach(function(array){
					var json = new Object();
					json.inspSourceNo = array.inspSourceNo;
					json.inspSourceSubNo = array.inspSourceSubNo;
					testResultArray.push(json);
				});
				
				if ( testResultArray.length > 1 ) {
					$('#tableNext').attr('disabled', false);
					dataZero = false;
				} else if ( testResultArray.length == 1 ) {
					dataZero = false;
				} else {
					var json = new Object();
					json.inspSourceNo = "";
					json.inspSourceSubNo = "";
					testResultArray.push(json);
					dataZero = true;
				}
				
			}
		});
	}
	
</script>

</body>
</html>
