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
				<li class="breadcrumb-item active">공수일별</li>
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
					<table id="dateListTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>공정코드</th>
								<th>내용</th>
								<th>구분</th>
								<c:forEach var="mon" begin="1" end="31">
									<td class="text-center">
										${mon} 일
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

	let currentHref = "mmsc0140";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공수일별"); 
	
	let viewIdx;
	let sideView = 'add';
	let sideDtlView = 'add';
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var prodDate =  moment(serverDateTo).format('YYYY-MM');
	var userNumberVal = null;
	var userNmVal = null;
	var prodGubun = '001'
	var mhGubun = '001';
	

	//공통코드 처리 시작
	var prodGubunCode = new Array(); // 스페셜/표준
	<c:forEach items="${prodGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	prodGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료

	//공통코드 처리 시작
	var mhGubunCode = new Array(); // 스페셜/표준
	<c:forEach items="${mhGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	mhGubunCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료
	
	//공수일별 목록조회
	let dateListTable = $('#dateListTable').DataTable({
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
    		url: '<c:url value="mm/dateList"/>',
        	type : 'GET',
        	data : {
				'prodGubun' : function(){return prodGubun},
				'prodDate'  : function(){return prodDate.replace(/-/g,'')},
				'mhGubun'  : function(){return mhGubun},
				
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
			{data : 'd01',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd02',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd03',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd04',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd05',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd06',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd07',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd08',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd09',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd10',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd11',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd12',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd13',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd14',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd15',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd16',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd17',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd18',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd19',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd20',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd21',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd22',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd23',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd24',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd25',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd26',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd27',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd28',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd29',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd30',
				render : function(data,type,row,meta){
					return data==0 || data==null?'·':data;
				}
			},
			{data : 'd31',
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
				url : '<c:url value="mm/getSumProdData3" />',
				type : 'GET',
				data : {
					'prodGubun' : function(){return prodGubun},
					'prodDate'  : function(){return prodDate.replace(/-/g,'')}
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
	
	$('#dateListTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        } else {
        	$('#dateListTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
	});


	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;<div class="form-group m-0 mr-2">';
	html1 += '<select name="MONTH" id="MONTH" class="select w80 col-12 custom-select"></select>'; 
	html1 += '</div>';
	html1 += '&nbsp;<label class="input-label-sm">구분</label><select class="custom-select" id="searchOption"></select>';
	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">공수구분</label><select class="custom-select" id="searchOption2"></select>';
	html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	$('#dateListTable_length').html(html1);
	$('#prodDate').val(serverDateTo);

	//선택박스 처리
	selectBoxAppend(prodGubunCode, "searchOption", "", "");
	selectBoxAppend(mhGubunCode, "searchOption2", "", "");

	//조회버튼 Click
	$('#btnRetv').on('click', function() {
		
		prodDate = $('#YEAR :selected').val()+$('#MONTH :selected').val();
		prodGubun = $('#searchOption :selected').val();
		mhGubun = $('#searchOption2 :selected').val();

		
		$('#dateListTable').DataTable().ajax.reload(function(){});
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
            if(i<10){
            	$("#MONTH").append("<option value='0"+ i +"'>0"+ i + " 월" +"</option>");
            }else{
            	$("#MONTH").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
            }
            
        }
        
        var dateArr = prodDate.split('-');
        
        $('#YEAR').val(dateArr[0]).prop('selected',true);
        $('#MONTH').val(dateArr[1]).prop('selected',true);

    }
</script>
</body>
</html>