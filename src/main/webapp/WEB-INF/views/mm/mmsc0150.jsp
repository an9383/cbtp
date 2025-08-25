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
				<li class="breadcrumb-item active">공수월별</li>
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
				<div class="table-responsive">
					<table id="monListTable" class="table table-bordered">
						<colgroup>
							<col width="4%">
							<col width="17%">
							<col width="2%">
							
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>공정코드</th>
								<th>내용</th>
								<th>구분</th>
								<c:forEach var="mon" begin="1" end="12">
									<td class="text-center">
										${mon} 월
									</td>
								</c:forEach>
								<th>합계</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>
<script>

	let currentHref = "mmsc0150";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공수월별"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var prodYear =  moment(serverDateTo).format('YYYY');
	var userNumberVal = null;
	var userNmVal = null;
	var prodGubun = '001'
	var mhGubun = '001';

	//공통코드 처리 시작
	var prodGubunCode = new Array(); //구분
	<c:forEach items="${prodGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	prodGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료

	//공통코드 처리 시작
	var mhGubunCode = new Array(); //공수구분
	<c:forEach items="${mhGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	mhGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료
	
	
	//생산일보관리 목록조회
	let monListTable = $('#monListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 400,
        ajax : {
    		url: '<c:url value="mm/monthList"/>',
        	type : 'GET',
        	data : {
				'prodGubun' : function(){return prodGubun},
				'prodYear'  : function(){return prodYear},
				'mhGubun'  : function(){return mhGubun}
	         },
      	},
      	rowId : 'userNm',
	    columns : [ 
	    	{data : 'mhCd'},
			{data : 'mhNm'},
			{
				render  : function(data,type,row,meta){
					return '(분)';
				}  
			},
			{data : 'm01',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm02',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm03',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm04',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm05',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm06',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm07',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm08',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm09',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm10',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm11',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'm12',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{
				render : function(data,type,row,meta){
					return '<span id="sum_'+meta.row+'"></span>';
				}
			},
		],
       	order: [
      	],
      	buttons : [ 'copy', 'excel', 'print' ],
        columnDefs: [
           {"className": "text-center", "targets": "_all"},
        ],
        drawCallback : function(settings) {
            
        	$.ajax({
				url : '<c:url value="mm/getSumProdData2" />',
				type : 'GET',
				data : {
					'prodGubun' : function(){return prodGubun},
					'prodYear'  : function(){return prodYear}
				},
				success : function(res){
					let data = res.data;
					console.log(data[0].prodData);

					for(var i=0; i<12; i++){
						i<10?$('#sum_'+i).text(data[i].prodData==0?'·':data[i].prodData):$('#sum_'+i).text(data[i].prodData==0?'·':data[i].prodData)
					}
				}
            }); 

			
            
        }

        
	});  
	
	$('#monListTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        } else {
        	$('#monListTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
	});


	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label><select class="custom-select" id="searchOption"></select>';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">공수구분</label><select class="custom-select" id="searchOption2"></select>';
	html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	$('#monListTable_length').html(html1);
	$('#prodDate').val(serverDateTo);

	//선택박스 처리
	selectBoxAppend(prodGubunCode, "searchOption", "", "");
	selectBoxAppend(mhGubunCode, "searchOption2", "", "");

	//조회버튼 Click
	$('#btnRetv').on('click', function() {
		prodYear = $('#YEAR :selected').val();
		prodGubun = $('#searchOption :selected').val();
		mhGubun = $('#searchOption2 :selected').val();
		$('#monListTable').DataTable().ajax.reload(function(){});
	});
	
	

</script>
<script>
	$(document).ready(function(){
	    setDateBox();
	}); 

    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+5); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }

        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
            $("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
        }

        $('#YEAR').val(prodYear).prop('selected',true);

    }
</script>
</body>
</html>