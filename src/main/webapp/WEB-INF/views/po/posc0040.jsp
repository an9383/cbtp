<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% 
	String adminCheck = session.getAttribute("adminCheck").toString();
%>
<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	
    <!--header ============================================================== -->
    <header class="page-title-bar row">
     <nav aria-label="breadcrumb" class="breadcrumb-padding">
      <ol class="breadcrumb">
       <li class="breadcrumb-item">
         <a href="#">생산관리</a>
       </li>
       <li class="breadcrumb-item active">설비일상점검현황 </li>
      </ol>
     </nav>
    </header> 

	<div class="container-fluid" id="main">
    	<div class="row table-wrap-hid">	
                  <!--======================== .left-list ========================-->
   			<div class="left-list left-30" id="left-30" style="width:50%;">
            	<div class="card">                  
                	<div class="table-responsive">
	                	<table id="equipGroupTable" class="table table-bordered" style="text-align:center"> 
	                		<colgroup>
								<col width="5%">
								<col width="25%">
								<col width="25%">
								<col width="30%">
								<col width="15%">
							</colgroup>
	                        <thead class="thead-light">
		                        <tr>
	                              <th>No.</th> 
	                              <th>점검일자</th>          
	                              <th>작업지시번호</th> 
	                              <th>설비명</th> 
	                              <th>작업자</th>                            
	                            </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	  	
	    <!-- 사이드 페이지 -->
			<div class="right-list right-70" id="myrSidenav" style="width:49%;">
	        	<div class="card" id="formBox">  
					<div class="table-responsive">
				    	<table id="equipCheckPopupTable" class="table table-bordered" style="width:100%">
							<colgroup>
								<col width="5%">
								<col width="25%">
								<col width="25%">
								<col width="30%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">점검항목</th>
									<th class="text-center">점검방법</th>
									<th class="text-center">SPEC</th>
									<th class="text-center">점검</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>   

	menuAuth = 'posc0040';
	let currentHref = 'posc0040';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","설비일상점검현황");

	$(document).ready(function() {
		$('body').css('font-size','15px');
		$('input').css('font-size','120%').css('height','2rem');
		$('select').css('font-size','120%').css('height','2rem');
		$('th').css('vertical-align','middle')
				.css('background-color','#f6f7f9')
				.css('text-align','center')
				.css('width','100px');
		$('button').css('font-size','120%').css('height','2rem');
		
		$('#equipCheckPopupTable_wrapper .dataTables_length label').css('font-size','120%');
		$('#equipCheckPopupTable_wrapper .dataTables_length span').css('font-size','120%');
	});
	
	let serverDateFrom =  "${serverDateFrom}";
	let serverDateTo =  "${serverDateTo}";
	let equipCdVal = "";
	let workOrdNoVal = "";
	let equipOption = "";

	var equipCode=new Array();
    <c:forEach items="${equipList}" var="info">
		var json=new Object();
		json.baseCd="${info.equipCd}";
		json.baseNm="${info.equipNm}";
		equipCode.push(json);
	</c:forEach>

	let equipGroupTable = $('#equipGroupTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : 10, 
		ajax : {
			url : '<c:url value="po/workOrderEquipDailyCheckByEquipCd"/>',
			type : 'GET',
			data : {
				'startDate'	:	function(){return serverDateFrom.replace(/-/g,'');},
				'endDate'	:	function(){return serverDateTo.replace(/-/g,'');},
				'equipCd'	:	function(){return equipOption;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				},
				'className' : 'text-center'
			},
			{
				data : 'checkDate',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				},'className' : 'text-center'
			},
			{
				data : 'workOrdNo',
				'className' : 'text-center'
			},
			{
				data : 'equipNm',
				'className' : 'text-center'
			},
			{
				data : 'checkChargr',
				'className' : 'text-center'
			},
			
		],
		columnDefs : [],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	}); 


	var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">점검일자</label>';
	    html1 += '<input class="form-control" style="width: 8.3rem;" type="text" id="checkDateFrom" name="checkDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(checkDateFrom,checkDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="checkDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>';
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width: 8.3rem;" type="text" id="checkDateTo" name="checkDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(checkDateTo,checkDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="checkDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">설비명</label>'; 
		html1 += '<select class="custom-select" id="equipOptionList">';
		html1 += '</select>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '</div>';
   
	$('#equipGroupTable_length').html(html1);
	$('#checkDateFrom').val(serverDateFrom);
	$('#checkDateTo').val(serverDateTo);
	
	selectBoxAppend(equipCode, "equipOptionList", "", "");
	
	//조회버튼 클릭시
	$('#btnRetv').on('click',function(){
		serverDateFrom = $('#checkDateFrom').val();
		serverDateTo = $('#checkDateTo').val();
		equipOption = $('#equipOptionList option:selected').val();
		$('#equipGroupTable').DataTable().ajax.reload(function() {});
	});
	
	//목록 선택시
	$('#equipGroupTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#equipGroupTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		equipCdVal = equipGroupTable.row(this).data().equipCd;
		workOrdNoVal = equipGroupTable.row(this).data().workOrdNo;

		$('#equipCheckPopupTable').DataTable().ajax.reload();
	});

	
	let equipCheckPopupTable = $('#equipCheckPopupTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : 10, 
		ajax : {
			url : '<c:url value="po/workOrderEquipDailyCheckList"/>',
			type : 'GET',
			data : {
				'workOrdNo'	:	function(){return workOrdNoVal;},
				'equipCd'	:	function(){return equipCdVal;},
				'mainGubun'	:	function(){return "001";},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row+1;
				},
				'className' : 'text-center'
			},
			{
				data : 'checkList',
				'className' : 'text-center'
			},
			{
				data : 'checkMethod',
				'className' : 'text-center'
			},
			{
				data : 'checkSpec',
				'className' : 'text-center'
			},
			{
				data : 'checkPass',
				render : function(data, type, row, meta) {
					var html="";
					if(row['inspInputMethod']=="001"){
						if(data!=null && data!=""){
							if(data=="OK"){
								html = '<span class="btn" style="font-size: 1.5rem; width: 100%;"value="'+row['checkPass']+'">●</span>';
							}else{
								html = '<span class="btn" style="color:red; font-size: 1.5rem; width: 100%;" value="'+row['checkPass']+'">●</span>';
							}
						}else{
							html = '<span class="btn" style="color:lightgray; font-size: 1.5rem; width: 100%;" value="'+row['checkPass']+'">●</span>';
						}
					}else{
						if(data!=null && data!=""){
							if(data=="OK"){
								html = '<input type="text" class="form-control p-3" value="'+row['checkResult']+'" style="color:black; background:white;font-size: 1.3rem;text-align: center;" disabled>';
							}else{
								html = '<input type="text" class="form-control p-3" value="'+row['checkResult']+'" style="color:black; background:red;font-size: 1.3rem;text-align: center;" disabled>';
							}
						}else{
							html = '<input type="text" class="form-control p-3" value="" style="color:black; background:lightgray;font-size: 1.3rem;text-align: center;" placeholder="0" disabled>';
						}
					}

					return html;
				},
				'className' : 'text-center'
			},
		],
		columnDefs : [],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	}); 


	var html = '<div class="card-body p-0">';
	html += '<div class="float-right mt-1">';
	html += '<span class="mr-2"><b>범례:</b></span>';
	html += '<label class="input-label mr-1" style="color:lightgray; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="6MonPass" style="background-color:lightgray; width: 60px; font-size: 0.725rem; font-weight: 500;">0</span>';
	html += '<span class="mr-3"><b>미입력 /</b></span>';
	html += '<label class="input-label mr-1" style="color:black; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="12MonPass" style="background-color:white; border: solid 1px black; width:60px; font-size: 0.725rem; font-weight: 500;">확인값</span>';
	html += '<span class="mr-3"><b>양호 /</b></span>';
	html += '<label class="input-label mr-1" style="color:red; font-size: 1rem; ">●</label>';
	html += '<span class="badge mr-1 btn" id="24MonPass" style="background-color:red; width:60px; font-size: 0.725rem;color: black;font-weight: 500;">확인값</span>';
	html += '<span class="mr-3"><b>이상</b></span>';
	html += '</div>';
	html += '<div class="float-right">';
	html += '</div>';
	html += '</div>';
	
	$('#equipCheckPopupTable_length').html(html);

   	
   	
</script>

</body>
</html>
