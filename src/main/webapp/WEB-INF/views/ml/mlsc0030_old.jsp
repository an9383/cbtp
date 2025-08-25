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
				<li class="breadcrumb-item"><a href="#">금형정보관리</a></li>
				<li class="breadcrumb-item active">금형수명관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="height:850px;">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="moldLifeTable"  class="table table-bordered tr_highlight_row">
							<colgroup>
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center"style="vertical-align:middle; min-width:100px;" rowspan="2">금형코드</th>
									<th class="text-center"style="vertical-align:middle; min-width:100px;" rowspan="2">금형명</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">Cavity<br>(배열수)</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">보증수명</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">남은<br>타수</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">누적<br>타수</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">이월</th>
									<th class="text-center"style="vertical-align:middle; min-width:80px;" rowspan="2">월합계</th>
									<th class="text-center"style="vertical-align:middle; " id="cntPunchHd" colspan="31">개별 타수 현황</th>
								</tr>
								<tr>	
									<th class="text-center" style="min-width: 50px">1</th>
									<th class="text-center" style="min-width: 50px">2</th>
									<th class="text-center" style="min-width: 50px">3</th>
									<th class="text-center" style="min-width: 50px">4</th>
									<th class="text-center" style="min-width: 50px">5</th>
									<th class="text-center" style="min-width: 50px">6</th>
									<th class="text-center" style="min-width: 50px">7</th>
									<th class="text-center" style="min-width: 50px">8</th>
									<th class="text-center" style="min-width: 50px">9</th>
									<th class="text-center" style="min-width: 50px">10</th>
									<th class="text-center" style="min-width: 50px">11</th> 
									<th class="text-center" style="min-width: 50px">12</th>
									<th class="text-center" style="min-width: 50px">13</th>
									<th class="text-center" style="min-width: 50px">14</th>
									<th class="text-center" style="min-width: 50px">15</th>
									<th class="text-center" style="min-width: 50px">16</th>
									<th class="text-center" style="min-width: 50px">17</th>
									<th class="text-center" style="min-width: 50px">18</th>
									<th class="text-center" style="min-width: 50px">19</th>
									<th class="text-center" style="min-width: 50px">20</th>
									<th class="text-center" style="min-width: 50px">21</th>
									<th class="text-center" style="min-width: 50px">22</th>
									<th class="text-center" style="min-width: 50px">23</th>
									<th class="text-center" style="min-width: 50px">24</th>
									<th class="text-center" style="min-width: 50px">25</th>
									<th class="text-center" style="min-width: 50px">26</th>
									<th class="text-center" style="min-width: 50px">27</th>
									<th class="text-center" style="min-width: 50px">28</th>
									<th class="text-center" style="min-width: 50px">29</th>
									<th class="text-center" style="min-width: 50px">30</th>
									<th class="text-center" style="min-width: 50px">31</th>
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

<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let menuAuth = 'mlsc0030';
	let currentHref = 'mlsc0030';
	let currentPage = $('.'+currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active'); 
	$(document).attr("title","금형수명관리");	
	var inWhsDateCal = "${serverDate}";  
	inWhsDateCal = inWhsDateCal.substring(0,7);
    
	// 목록조회
	let moldLifeTable = $('#moldLifeTable').DataTable({
		dom :"<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",	
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 100000000,
		scrollX: true,
		scrollCollapse: true,
		fixedColumns: {
			 leftColumns: 8
	    },
	    scrollY: "640px",
		ajax: {
            url: '<c:url value="/ml/readMoldMonthListAll"/>',
            type: 'GET',
            data: {
            	'menuAuth'		:		menuAuth,
            	'thisMonth'		:		function(){return inWhsDateCal.replace(/-/g,"").substring(0,6);},	            	
            },	            
        },
        columns: [
        	{ data: 'equipNo' },
        	{ data: 'equipNm' },
        	{ data: 'equipCavity',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
        	{ data: 'warrantyLife',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'remainPunch',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'accPunch',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'lastMonth',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'thisMonth',
	        	render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch1',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  			
	        			data = parseFloat(data);			
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch2',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch3',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch4',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch5',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch6',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch7',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch8',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch9',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch10',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch11',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch12',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch13',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch14',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch15',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch16',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch17',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch18',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch19',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch20',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch21',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch22',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch23',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch24',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch25',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch26',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch27',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch28',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch29',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch30',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  					
	        			data = parseFloat(data);		
						return addCommas(data.toFixed(0));
	        		}
        	},
			{ data: 'punch31',
	        		render: function(data, type, row) {
	        			if(data == null){
	                		data = 0;
	                	}  						
	        			data = parseFloat(data);	
						return addCommas(data.toFixed(0));
	        		}
        	},
			
        ],
		columnDefs: [
			{ targets: [0,1,2,3,4,5,6,7], className: 'text-center-td' },
        	{ targets: [8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38], className: 'text-right-td' },
        ],
		order : [ [ 0, 'asc' ] ],
		buttons: [
			{
			    extend: 'copy',
				title: '금형수명관리',
			},
			{
			    extend: 'excel',
			    title: '금형수명관리',
			},
			{
			    extend: 'print',
			    title: '금형수명관리',
			}
		],
		drawCallback : function() {
         
        }
	});

	$('#moldLifeTable').DataTable().ajax.reload( function () {}); 
	
	let html = '<div class="row col-sm-6">';
	html += '<label class="input-label-sm mr-1">년 월</label>';
	html += '<input type="text" class="form-control mr-2" id="inWhsDateCal" style="width:65px;"></input>';					
	html += '<button type="button" class="btn btn-primary float-left mr-2" id="btnRetv">조회</button>	';
	html += '</div>';
	

	$('#moldLifeTable_length').html(html);
	$('#inWhsDateCal').val(inWhsDateCal);
	
	$('#btnRetv').on('click', function() {   	

    	inWhsDateCal =  $('#inWhsDateCal').val();   	    	
    	$('#moldLifeTable').DataTable().ajax.reload( function () {}); 
		
    });
	
	$('#inWhsDateCal').monthpicker({pattern: 'yyyy-mm', 
	    selectedYear: 2020,
	    startYear: 1900,
	    finalYear: 2212
	});

</script>


</body>
</html>
