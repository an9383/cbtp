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
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">생산일보관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="open-arrow" id="arrowLeft">
					<button id="left-width-btn2" onclick="openrNav2()"
						class="btn btn-primary input-sub-search" type="button">
						<i class="mdi mdi-arrow-left"></i>
					</button>
				</div>
				
				
				<div class="row">&nbsp;&nbsp;
					<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">
					<input class="form-control" style="width:97px;" type="text" id="prodDate" name="prodDate" disabled/>
					<button onclick="fnPopUpCalendar(prodDate,prodDate,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="prodDateCalendar" type="button">
						<span class="oi oi-calendar"></span>
					</button>
				</div>&nbsp;&nbsp;&nbsp;
					<label class="input-label-sm">구분</label>
					<select class="custom-select" id="searchOption" style="max-width: 80px;"></select>&nbsp;
				  	<button type="button"  class="btn btn-primary" id="btnRetv">조회</button>
				</div>
				
				<br>
	
				<div class="card-header card-tab mb-3">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active show"
							id="tab1Nav" data-toggle="tab" href="#tab1">유실공수</a></li>
						<li class="nav-item"><a class="nav-link" id="tab2Nav"
							data-toggle="tab" href="#tab2">생산관리-소형</a></li>
						<li class="nav-item"><a class="nav-link d-none" id="tab3Nav"
							data-toggle="tab" href="#tab3">생산관리-중형</a></li>
							<li class="nav-item"><a class="nav-link" id="tab5Nav"
							data-toggle="tab" href="#tab5">추가공수</a></li>
						<li class="nav-item"><a class="nav-link" id="tab4Nav" 
							data-toggle="tab" href="#tab4">통계</a></li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				
				<!-- <div id="myTabContent" class="tab-content">
					<div class="tab-pane fade active show" id="tab1"> -->
						<div id="admTable" class="table-responsive">
							<table id="prodDailyAdmTable" class="table table-bordered">
								<thead class="thead-light">
									<tr id="mhHd"></tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="3">합계</th>
										<c:forEach var="sum" begin="1" end="30">
											<td class="text-center">
												<span id="sum_${sum}"></span>
											</td>
										</c:forEach>
									</tr>
								</tfoot>
							</table>
						</div>
						<div id="staticTable" class="table-responsive d-none">
							<table id="statListAdmTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th rowspan="2">성명</th>
										<th rowspan="2">단위</th>
										<th>재적 공수</th>
										<th>취업 공수</th>
										<th>작업 공수</th>
										<th>추가 공수</th>
										<th>휴업 공수</th>
										<th>유실 공수</th>
										<th>실동 공수</th>
										<th>준비작업시간</th>
									</tr>
									<tr>
										<th>((480분-휴식시간)*보유인원)</th>
										<th>(재적공수-휴업공수)</th>
										<th>(취업공수+추가공수)</th>
										<th>(잔업, 타부서지원받음)</th>
										<th>(타부서지원,휴가,조퇴,외부교육,출장)</th>
										<th>(무작업시간)</th>
										<th>(작업공수+유실공수)</th>
										<th>-</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="2">합계</th>
										<td><span id="totalSum_1">·</span></td>
										<td><span id="totalSum_2">·</span></td>
										<td><span id="totalSum_3">·</span></td>
										<td><span id="totalSum_4">·</span></td>
										<td><span id="totalSum_5">·</span></td>
										<td><span id="totalSum_6">·</span></td>
										<td><span id="totalSum_7">·</span></td>
										<td><span id="totalSum_8">·</span></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<%-- <div class="tab-pane fade" id="tab2">
						<div class="table-responsive">
							<table id="prodDailySmallTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>성명</th>
										<th>단위</th>
										<c:forEach items="${prodNm}" var="info" varStatus="status">
											<th class="text-center"><c:out value="${info.baseNm}" /></th>
										</c:forEach>
										<th>관리</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="2">합계</th>
										<c:forEach var="sum" begin="1" end="20">
											<td class="text-center">
												<span id="sum_${sum}"></span>
											</td>
										</c:forEach>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab3">
						<div class="table-responsive">
							<table id="prodDailyMiddleTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>성명</th>
										<th>단위</th>
										<c:forEach items="${prodNm}" var="info" varStatus="status">
											<th class="text-center"><c:out value="${info.baseNm}" /></th>
										</c:forEach>
										<th>관리</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="2">합계</th>
										<c:forEach var="sum" begin="1" end="20">
											<td class="text-center">
												<span id="sum_${sum}"></span>
											</td>
										</c:forEach>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab4">
						<div class="table-responsive">
							<table id="prodDailySumTable" class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th>성명</th>
										<th>단위</th>
										<c:forEach items="${prodNm}" var="info" varStatus="status">
											<th class="text-center"><c:out value="${info.baseNm}" /></th>
										</c:forEach>
										<th>관리</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="2">합계</th>
										<c:forEach var="sum" begin="1" end="20">
											<td class="text-center">
												<span id="sum_${sum}"></span>
											</td>
										</c:forEach>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div> 
				</div>
			</div>--%>
		</div>
	</div>
</div>
<!-- Modal Start-->
<div class="modal fade bd-example-modal-lg" id="prodDailyAdmDtlModal"tabindex="-1" role="dialog" aria-labelledby="prodDailyAdmDtlTable"aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prodDailyAdmDtlLabel">생산일보 등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive" style="height: 670px;">
					<table id="prodDailyAdmDtlTable" class="table table-bordered">
						<colgroup>
							<col width="10%">
							<col width="55%">
							<col width="35%">
						</colgroup>
						<thead>
							<tr>
								<th>성명</th>
								<td colspan="3">
									<input type="text" class="form-control" id="userNm" style="min-width:100%; text-align:center; font-weight: 500;" disabled/>
								</td>
							</tr>
							<tr>
								<th>번호</th>
								<th>내용</th>
								<th>공수Data(분)</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnSave">저장</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->
<%@include file="../layout/bottom.jsp" %>
<script>

	let currentHref = "mmsc0090";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","생산일보관리"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var userNumberVal = null;
	var userNmVal = null;
	var prodGubun = '001'
	var mhGubun = '001'
	var mhInitial = 'C'

	$('#prodDate').val(serverDateTo);
	

	//공통코드 처리 시작
	var prodGubunCode = new Array(); 
	<c:forEach items="${prodGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	prodGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료
	
	//선택박스 처리
	selectBoxAppend(prodGubunCode, "searchOption", "", "");

	
	//유실공수 탭 click
	$('#tab1Nav').on('click',function(){
		$('#admTable').removeClass('d-none');
		$('#staticTable').addClass('d-none');
		
		mhGubun = '001';
		mhInitial = 'C';
		HderCreate();
		$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
	});

	//생산관리-소형 탭 click
	$('#tab2Nav').on('click',function(){
		$('#admTable').removeClass('d-none');
		$('#staticTable').addClass('d-none');
		
		mhGubun = '004';
		mhInitial = 'S'
		HderCreate();
		$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
	});

	//생산관리-중형 탭 click
	$('#tab3Nav').on('click',function(){
		$('#admTable').removeClass('d-none');
		$('#staticTable').addClass('d-none');
		mhGubun = '005';
		mhInitial = 'M'
		HderCreate();
		$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
	});
	
	//통계 탭 click
	$('#tab4Nav').on('click',function(){
		$('#admTable').addClass('d-none');
		$('#staticTable').removeClass('d-none');
		$('#statListAdmTable').DataTable().ajax.reload(function(){});
	});

	//추가공수 탭 click
	$('#tab5Nav').on('click',function(){
		$('#admTable').removeClass('d-none');
		$('#staticTable').addClass('d-none');
		mhGubun = '002';
		mhInitial = 'T'
		HderCreate();
		$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
	});
	
	//생산일보관리 유실공수,생산관리-소형, 생산관리-중형 목록조회
	HderCreate();
	let prodDailyAdmTable = $('#prodDailyAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,		
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
        ajax : {
    		url: '<c:url value="mm/listAll"/>',
        	type : 'POST',
        	data : {
				'prodGubun' : function(){return prodGubun},	//소형 : 001, 중형 002
				'prodDate'  : function(){return serverDateTo.replace(/-/g,'')},
				'mhGubun'  : function(){return mhGubun},
				'mhInitial'  : function(){return mhInitial}
		        
	         },
      	},
      	rowId : 'userNm',
	    columns : [ 
	    	{
		   		data : 'userNm'
			},
			{
				render  : function(data,type,row,meta){
					return '(분)';
				} 
			},
			{ 
				render  :function(data, type, row, meta){
					return '<button type="button" class="btn btn-primary" id="btnAdd_'+meta.row+'" onclick="btnAdd('+meta.row+')">등록</button>';
				}
			},
			{ data : 'mh01' ,
				render  : function(data,type,row,meta){
					/* if(data!=null){
						return '<input type="text" class="form-control" name="mh01" value="'+data+'" disabeld />';
					}else{
						return '<input type="text" class="form-control" name="mh01" value="·" disabeld />';
					} */

					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ data : 'mh02'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ data : 'mh03' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			 },
			{ data : 'mh04' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
		  	},
		 	{ data : 'mh05' ,
		  		render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh06' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh07' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh08' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh09' ,
			 render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh10',
			 	render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh11' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh12' ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh13'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh14'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh15'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh16'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh17'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh18'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh19'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh20'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh21'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh22'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh23'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh24'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh25'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh26'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh27'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh28'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh29'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
			{ data : 'mh30'  ,
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				}
			},
		],
       	order: [
      	],
      	buttons : [ 'copy', 'excel', 'print' ],
        columnDefs: [
           //{ "targets":[23,24,25,26,27,28,29,30,31,32] , "searchable": false, "visible" :false},
           { "targets": "_all" , "className": "text-center"},
        ],
        drawCallback : function(settings) {

        	$.each($('#prodDailyAdmTable tbody tr'),function(index,item){

        		for(var i=0; i<30; i++){
        			if($('#prodDailyAdmTable .'+i+'').text()==""){
    					$('#prodDailyAdmTable .'+i+'').addClass('d-none');	
    			 		$(this).find('td').eq(i+3).addClass('d-none');
    			 		$('#prodDailyAdmTable tfoot tr').find('td').eq(i).addClass('d-none');
    		 		}else{
    		 			$('#prodDailyAdmTable .'+i+'').removeClass('d-none');	
    			 		$(this).find('td').eq(i+3).removeClass('d-none');
    			 		$('#prodDailyAdmTable tfoot tr').find('td').eq(i).removeClass('d-none');
    			 	}
            	} 

			});   
 

	       	$.ajax({
				url : '<c:url value="mm/getSumProdData" />',
				type : 'GET',
				data : {
					'prodGubun' : function(){return prodGubun},
					'prodDate'  : function(){return serverDateTo.replace(/-/g,'')},
					'mhGubun'  : function(){return mhGubun},
					'mhInitial' : function(){return mhInitial},
				},
				success : function(res){
					let data = res.data;
					if(data.length!=0){
						for(var i=0; i<data.length; i++){
							
							if(data[i].prodData == null){
								data[i].prodData = '·';
							}
							
							i<10?$('#sum_'+(i+1)).text(data[i].prodData):$('#sum_'+(i+1)).text(data[i].prodData);
						}
					}else{
						for(var i=0; i<30; i++){
							i<10?$('#sum_'+(i+1)).text('·'):$('#sum_'+(i+1)).text('·');
						}
					}
				}
            }); 

		},
        
	});  


	//생산일보관리 통계 목록조회
	let statListAdmTable = $('#statListAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,		
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
        ajax : {
    		url: '<c:url value="mm/statListAll"/>',
        	type : 'POST',
        	data : {
				'prodGubun' : function(){return prodGubun},
				'prodDate'  : function(){return serverDateTo.replace(/-/g,'')},
	         },
      	},
      	rowId : 'userNm',
	    columns : [ 
	    	{
		   		data : 'userNm'
			},
			{
				render  : function(data,type,row,meta){
					return '(분)';
				} 
			},
			{ 
				data : 'mhValue1',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue2',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue3',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue4',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue5',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue6',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue7',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			{ 
				data : 'mhValue8',
				render  : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '·';
					}
				} 
			},
			
		],
       	order: [
      	],
      	buttons : [ 'copy', 'excel', 'print' ],
        columnDefs: [
           //{ "targets":[23,24,25,26,27,28,29,30,31,32] , "searchable": false, "visible" :false},
           { "targets": "_all" , "className": "text-center"},
        ],
        drawCallback : function(){
        	var rowCount = $('#statListAdmTable tbody tr').length;
			var sum=0;
			var rowValue=0;

				for(var i=2; i<=9; i++){
					for(var j=0; j<rowCount; j++){
						rowValue = $('#statListAdmTable tbody tr').eq(j).find('td').eq(i).text();
						sum += rowValue=="·"|| rowValue==""?0:parseInt(rowValue);
					}

					$('#totalSum_'+(i-1)+'').text(sum==0?"·":sum);
					sum=0;
	            }
        }
	});  

	//생산일보관리 합계
	$('#prodDailyAdmTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        } else {
        	$('#prodDailyAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
	});
	

	//조회버튼 Click
	$('#btnRetv').on('click', function() {
		serverDateTo = $('#prodDate').val();
		prodGubun = $('#searchOption :selected').val();

		if(prodGubun == "001"){
			$('#tab3Nav').addClass('d-none');
			$('#tab2Nav').removeClass('d-none');
		}else if(prodGubun == "002"){
			console.log('dd');
			$('#tab2Nav').addClass('d-none');
			$('#tab3Nav').removeClass('d-none');
		}
		
		$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
		$('#statListAdmTable').DataTable().ajax.reload(function(){});
		
	});

		
	//등록 버틈 Click
	var prodDailyAdmDtlTable;
	function btnAdd(index){
		
		userNumberVal = prodDailyAdmTable.row(index).data().userNumber;
		userNmVal = prodDailyAdmTable.row(index).data().userNm;
		$('#userNm').val(userNmVal);
		console.log(userNmVal)

		if (prodDailyAdmDtlTable == null || prodDailyAdmDtlTable == undefined) {
		prodDailyAdmDtlTable = $('#prodDailyAdmDtlTable').DataTable({
		    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language: lang_kor,
			paging: false,
			info: false,
			searching: false,
			ordering: false,
			processing: false,
			autoWidth: false,
			lengthChange: false,
			pageLength: 10,
			ajax: {
			    url: '<c:url value="/mm/read"/>',
			    type: 'POST',
			    data: {
			    	'prodGubun'   : '001',
					'prodDate'    : function(){return $('#prodDate').val().replace(/-/g,'')},
					'userNumber'  : function(){return userNumberVal;},
					'mhGubun' 	  : function(){return mhGubun;}
			    }
			},
			columns: [
				{
					render  : function(data,type,row,meta){
						return meta.row+1;
					} 
				},
				{
					data : 'prodNm'
				},
				{
					data : 'prodData',
					render  : function(data,type,row,meta){
						return '<input type="text" class="form-control" name="prodData"  value="'+data+'" style="min-width:100%; text-align:right"  />';
					} 
				
				},
			],
			columnDefs: [
				{targets : [0] , className : 'text-center'}
			],
			order: [
			],
			buttons: [
			],

		});
		
		}else{
			$('#prodDailyAdmDtlTable').DataTable().ajax.reload(function() {});
		}
		$('#prodDailyAdmDtlModal').modal('show');		
   	} 
	


	//저장 버틈 Click
	$('#btnSave').on('click',function(){
		var check = true;
		var dataArray = new Array();

		$('#prodDailyAdmDtlTable tbody tr').each(function(index, item) {
			
			var rowData = new Object();
			rowData.prodGubun = $('#searchOption :selected').val();
			rowData.prodDate = $('#prodDate').val().replace(/-/g,'');
			rowData.userNumber = userNumberVal;	
			rowData.mhInitial = mhInitial;	
			
			rowData.prodCd = prodDailyAdmDtlTable.row(this).data().prodCd;	
			rowData.prodData = $(this).find('td input[name=prodData]').val();	
			
			dataArray.push(rowData);
			console.log(rowData)
		});

		if (check == true) {
			$.ajax({
				url : '<c:url value="mm/create"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success('등록되었습니다.');
						
						$('#prodDailyAdmTable').DataTable().ajax.reload(function(){});
						$('#prodDailyAdmDtlModal').modal('hide');		
						
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
				}
			});
		}
		
		
	});


	//공수명 header create
    function HderCreate(){
   	 $.ajax({
    		url: '<c:url value="mm/headerList"/>',
            type: 'GET',  
            async: false,           
            data: {
                'mhGubun' : function(){return mhGubun;}
			},
			success: function(res){
				var data = res.data;
				var mhHd = '<th class="text-center" style="width: 50px;">성명</th>';
				mhHd += '<th class="text-center" style="width: 30px;">단위</th>';
				mhHd += '<th class="text-center" style="width: 50px;">관리</th>';
				
				
				$.each(data, function(index,item){				
					mhHd += '<th class="text-center"><div class="'+index+'">'+item.mhNm+'</div></th>';
					 
				});
				
				$('#mhHd').html(mhHd); 
			}
		});
	}
	

	
	
</script>
</body>
</html>