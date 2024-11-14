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
				<li class="breadcrumb-item"><a href="#">설비관리</a></li>
				<li class="breadcrumb-item active">설비가동/비가동관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-60" id="left-60" style="width: 12%;">
				<div class="card">
					<div class="form-group row pb-3">
						<label for="middlePrcssList"
							class="col-sm-3 col-form-label p-0 mt-1">설비구분</label>
						<div class="col-sm-9">
							<div class="input-sub m-0">
								<select class="custom-select" id="equipGubunList">
								</select>
							</div>
						</div>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipCodeAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th class="text-center-th">설비명</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-70" id="myrSidenav" style="width: 87%;">
				<div class="card-body col-sm-12" style="padding: 7px;">
					<div class="card-header card-tab">
						<ul class="nav nav-tabs card-header-tabs">
							<li class="nav-item"><a class="nav-link active show"
								data-toggle="tab">가동시간/생산실적</a></li>
						</ul>
					</div>
				</div>
				<div class="table-responsive">
					<table id="workTimeTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th class="text-center-th">작지번호</th>
								<th class="text-center-th">품명(Type)</th>
								<th class="text-center-th">시작시간</th>
								<th class="text-center-th">종료시간</th>
								<th class="text-center-th">가동시간</th>
								<th class="text-center-th">상태</th>
								<th class="text-center-th">투입수량</th>
								<th class="text-center-th">생산수량</th>
								<th class="text-center-th">담당</th>
							</tr>
						</thead>
						<tfoot class="text-center">
							<tr>
								<th>합계</th>

								<th></th>
								<th></th>
								<th></th>
								<th id="workTimeSum"></th>
								<th class="text-right-th" id="inputKGSum"></th>
								<th class="text-right-th" id="intpuEASum"></th>
								<th class="text-right-th" id="outputCntSum"></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- .right-sidebar -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>

	let currentHref = 'emsc0070';
	let currentPage = $('.'+currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","설비가동/비가동관리");

	let equipGubunVal = '';
	let ordDateVal = '';
	let equipCdVal = '';

	let workBehTime = new Array();
	let workTimeArray = new Array();

	
	
	// 설비구분 목록
	var equipGubunCode=new Array();
    <c:forEach items="${equipGubun}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		equipGubunCode.push(json);
    </c:forEach>

	// 설비목록
    let equipCodeAdmTable = $('#equipCodeAdmTable').DataTable({
        dom: "<'row'<'col-sm-12 col-md-12'l>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		destroy: false,
        language: lang_kor,
        paging: false,
        info: false,
        ordering: true,
        processing: false,
        autoWidth: false,
        lengthChange: false,
        pageLength: 50,
        scrollY: '600px',
        searching: false,
        select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax: {
	        url: '<c:url value="/mm/equipCodeList"/>',
	        type: 'POST',
	        data: {
	        	'equipGubun'	:	function(){ return equipGubunVal = $('#equipGubunList option:selected').val(); },
	        },
	    },
        rowId: 'equipCd',
        columns: [
        	{ data: 'equipNm', 'className':'text-center-td' }
        ],
        columnDefs: [
        ],
        order: [
        ],
        buttons: [
        ],
        drawCallback: function () {
        },
    });
    
	selectBoxAppend(equipGubunCode, 'equipGubunList', '', '2');


	//설비구분 change
	$('#equipGubunList').on('change',function() {
		equipGubunVal = $(this).val();
		$('#equipCodeAdmTable').DataTable().ajax.reload( function () {});
	});

	//설비목록 조회 click
	$('#equipCodeAdmTable tbody').on('click','tr',function() {
		ordDateVal = moment($('#workOrdDate').val()).format('YYYYMMDD');
		equipCdVal = $(this).attr('id');
		searchWorkTimeTable();
	});


	// 가동시간 목록
    let workTimeTable = $('#workTimeTable').DataTable({
        dom: "<'row'<'col-sm-12 col-md-4'l><'col-sm-12 col-md-8'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
        language: lang_kor,
        paging: true,
        info: false,
        ordering: true,
        processing: true,
        autoWidth: false,
        lengthChange: true,
        pageLength: 20,
        select: {
            style: 'single',
            toggleable: false,
            items: 'row'
        },
        ajax: {
            url: '<c:url value="/em/equipToWorkOrdList"/>',
            type: 'POST',
            data: {
                'ordDate'	:	function() { return ordDateVal; },
                'equipCd'	:	function() { return equipCdVal; }
            },
            beforeSend: function() {
            	workTimeArray = new Array();
            }
        },
        columns: [
        	{ data: 'workOrdNo' },
        	{ data: 'itemNm' },
        	{ data: 'workStartTime', 'className':'text-center-td',
				render : function(data, type, row, meta) {
					var nowDate = moment().format('YYYYMMDD');
					var searchDate = moment($('#workOrdDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
					var startDate = moment(row['workStartTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var endDate = moment(row['workEndTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var resultData = "";
					
					if(data == null || data == "") {
						resultData = "";
                	} else {
                    	if(moment(searchDate).isAfter(nowDate)) { // 검색일이 오늘 이후일 경우
                    		resultData = '';
                        } else { // 검색일이 오늘과 같거나 이전일 경우
                        	if(moment(startDate).isSame(searchDate)) { // 시작일이 오늘일 경우
                        		resultData = data.substring(8,10) + ':' + data.substring(10,12);
    	                    } else if(moment(startDate).isBefore(searchDate)) { // 시작일이 오늘이전일 경우
    	                    	if(moment(endDate).isBefore(searchDate)) { // 종료일이 오늘이전일 경우
    	                    		resultData = '';
    		                    } else { // 종료일이 오늘이거나 오늘 이후일 경우
    	                    		resultData = '00:00';
    		                    }
    	                    } else { // 시작일이 오늘이후일 경우
    	                    	resultData = '';
    		                }
                        }
                	}
					return resultData;
				}
           	},
            { data: 'workEndTime', 'className':'text-center-td',
				render : function(data, type, row, meta) {
					var nowDate = moment().format('YYYYMMDD');
					var searchDate = moment($('#workOrdDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
					var startDate = moment(row['workStartTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var endDate = moment(row['workEndTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var resultData = "";

					if(data == null || data == "") { // 종료일이 없을 경우
						if(moment(searchDate).isAfter(nowDate)) { // 검색일이 오늘 이후일 경우
                    		resultData = '';
                        } else { // 검색일이 오늘과 같거나 이전일 경우
                        	if(row['workStartTime'] != '') { // 시작일이 등록되어있을 경우
    							if(moment(startDate).isSame(nowDate)) { // 시작일이 오늘과 같을 경우
    								if(moment(searchDate).isSame(nowDate)) { // 시작일이 검색일과 같을 경우
    									resultData = "";
    								} else { // 시작일이 검색일과 다를 경우
    									resultData = "";
    								}
    							} else { // 시작일이 오늘과 다를 경우
    								if(moment(searchDate).isSame(nowDate)) { // 검색일과 오늘이 같을 경우
    									resultData = "";
    								} else { // 검색일과 오늘이 다를 경우
    									resultData = '23:59';
    								}
    							}
    						} else {
    							resultData = "";
    						}
                        }
                	} else {
                		if(moment(endDate).isSame(searchDate)) { // 종료일이 오늘일 경우
                    		resultData = data.substring(8,10) + ':' + data.substring(10,12);
	                    } else if(moment(endDate).isBefore(searchDate)) { // 종료일이 오늘이전일 경우
	                    	resultData = '';
	                    } else { // 종료일이 오늘이후일 경우
	                    	resultData = '23:59';
		                }
                	}

					return resultData;
				}
           	},
        	{
				render : function(data, type, row, meta) {
					var nowDate = moment().format('YYYYMMDD');
					var searchDate = moment($('#workOrdDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
					var startDate = moment(row['workStartTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var endDate = moment(row['workEndTime'],'YYYYMMDDHHmmss').format('YYYYMMDD');
					var resultData = "";

					
					
					if(row['workEndTime'] == '') { // 종료시간이 없으면
            			resultData = "";
					} else { // 종료시간이 없지 않으면
						if(moment(endDate).isSame(searchDate)) { // 종료일이 오늘일 경우
							if(moment(startDate).isSame(searchDate)) { // 시작일이 오늘일 경우
								var startDateVal = moment(row['workStartTime'], 'YYYY-MM-DD HH:mm:ss'); // 시작일
	    						var endDateVal = moment(row['workEndTime'], 'YYYY-MM-DD HH:mm:ss'); // 종료일
	    						resultData = moment.duration(endDateVal.diff(startDateVal)).asMinutes().toFixed(0)+'분'
		                    } else { // 시작일이 오늘이전일 경우
		                    	var startDateVal = moment(moment(row['workEndTime'],'YYYYMMDD').format('YYYY-MM-DD HH:mm:ss')); // 현재일 00:00
    							var endDateVal = moment(row['workEndTime'], 'YYYY-MM-DD HH:mm:ss'); // 종료일
    							resultData = moment.duration(endDateVal.diff(startDateVal)).asMinutes().toFixed(0)+'분';
		                    }
	                    } else if(moment(endDate).isBefore(searchDate)) { // 종료일이 오늘이전일 경우
	                    	resultData = '';
	                    } else { // 종료일이 오늘이후일 경우
	                    	if(moment(startDate).isSame(searchDate)) { // 시작일이 오늘일 경우
	                    		var startDateVal = moment(row['workStartTime'], 'YYYY-MM-DD HH:mm:ss'); // 시작일
    							var endDateVal = moment(moment(row['workStartTime'],'YYYYMMDD').add(1, 'd').format('YYYY-MM-DD HH:mm:ss')); // 다음날 00:00
    							resultData = moment.duration(endDateVal.diff(startDateVal)).asMinutes().toFixed(0)+'분';
		                    } else if(moment(startDate).isBefore(searchDate)) { // 시작일이 오늘이전일 경우
		                    	resultData = '1440분';
		                    } else { // 시작일이 오늘이후일 경우
		                    	resultData = '';
		                    }
		                }
					}

					workTimeArray.push({ 'ordPlanSeq' : row['ordPlanSeq'], 'workBehTime' : resultData });
					
					return resultData;

					
				}
           	},
           	{ data: 'workStatus',
	    		render : function(data, type, row, meta) {
		    		if(data == 'PD') { return '<div style="color:green;">대기</div>'; }
		    		else if(data == 'WI') { return '<div style="color:blue;">시작</div>'; }
		    		else if(data == 'WC') { return '<div style="color:red;">종료</div>'; }
		    		else if(data == 'DT') { return '<div style="color:bworn;">비가동</div>'; }
		    		else { return '<div style="color:black;">미결</div>'; }
		    	}
	    	},
            { data: 'targetQty' },
        	{ data: 'outputQty' },
        	{ data: 'workChargrNm' }
        ],
        columnDefs: [
            { targets: [0,1,2,3,4,5,8] , className: 'text-center-td' },
            { targets: [6,7] , className: 'text-right-td', render: $.fn.dataTable.render.number( ',' ) },
        ],
        order: [
        ],
        buttons: [
        ],
        drawCallback: function () {

        	var unique = workTimeArray.map(function (val, index) {
	    		return val['workBehTime'];
	    	}).filter(function (val, index, arr) {
	    		return arr.indexOf(val) === index;
	    	});

            
        	var workTimeSum = 0;
        	var timeArray = unique.filter( time => time != "");

        	
            for(var i=0;i<timeArray.length;i++) {
                workTimeSum += parseInt(timeArray[i].replace(/분/g,''));
            }
            $('#workTimeSum').html(workTimeSum.toString() + '분');

            var outputSum = $('#workTimeTable').DataTable().column(7).data().sum();           
            $('#outputCntSum').html(outputSum.toLocaleString());

            $('#upTimeH').text((Math.floor(workTimeSum/60)).toString() + '시간');
            $('#upTimeM').text((workTimeSum%60).toString() + '분');
			$('#downTimeH').text((Math.floor((1440-workTimeSum)/60)).toString() + '시간');
			$('#downTimeM').text(((1440-workTimeSum)%60).toString() + '분');
        },
    });


    var html2  = '<div class="row">&nbsp;<label class="input-label-sm">작지일</label><div class="form-group input-sub m-0 row">';
		html2 += '<input class="form-control" style="width:97px;" type="text" id="workOrdDate" name="workOrdDate" />';
		html2 += '<button onclick="fnPopUpCalendar(workOrdDate,workOrdDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="workOrdDateCalendar" type="button">';
		html2 += '<span class="oi oi-calendar"></span>';
		html2 += '</button>'; 
		html2 += '</div>';
		
	$('#workTimeTable_length').html(html2);
	$('#workOrdDate').val(moment().format('YYYY-MM-DD'));

	function searchWorkTimeTable() {
		ordDateVal = moment($('#workOrdDate').val()).format('YYYYMMDD');
		$('#workTimeTable').DataTable().ajax.reload( function () {});
	}

	// 작업지시일 변경 listener
	workOrdDateVal = moment().format('YYYY-MM-DD');
	setInterval(function(){
		if($('#workOrdDate').val() != workOrdDateVal) {
			searchWorkTimeTable();
		}
		workOrdDateVal = $('#workOrdDate').val();
	},
	100);


	var html3  = '<div class="row float-right alert-primary">';
		html3 += '	<h5 class="mr-3 mb-0" style="color:blue;">가동시간</h5>';
		html3 += '	<h6 class="mr-1 mb-0 mt-1" id="upTimeH" style="color:blue;">0시간</h6>';
		html3 += '	<h6 class="mr-5 mb-0 mt-1" id="upTimeM" style="color:blue;">0분</h6>';
		html3 += '	<h5 class="mr-3 mb-0" style="color:red;">비가동시간</h5>';
		html3 += '	<h6 class="mr-1 mb-0 mt-1" id="downTimeH" style="color:red;">0시간</h6>';
		html3 += '	<h6 class="mr-2 mb-0 mt-1" id="downTimeM" style="color:red;">0분</h6>';
		html3 += '</div>';

	$('#workTimeTable_filter').html(html3);
</script>
</body>
</html>
