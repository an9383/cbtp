<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row ml-2">
		<nav aria-label="breadcrumb" class="breadcrumb-padding" style="width:100%">
			<div class="row">
				<div class="col-md-2">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active">공장력등록</li>
						<li class="breadcrumb-item pt-2"><a href="#">기준정보관리</a></li>
					</ol>
				</div>
				<div class="col-md-10">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()" class="btn btn-primary input-sub-search" type="button" style="top: -30px !important;">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list overflow-hidden" id="left-list" style="width: 70%;">
				<div class="card">
					<div class="row">
						<div class="col-md-12"></div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-1" style="text-align: center;">
							<button type="button" class="btn btn-light" id="prevMonth" style="font-size:1rem">
								<i class="fas fa-chevron-left"></i>
							</button>
						</div>
						<div class="col-md-2" style="text-align: center;">
							<h4 class="m-0" id="esarchMonth"></h4>
						</div>
						<div class="col-md-1" style="text-align: center;">
							<button type="button" class="btn btn-light" id="nextMonth" style="font-size:1rem">
								<i class="fas fa-chevron-right"></i>
							</button>
						</div>
						<div class="col-md-4 mt-1">
							<button type="button" class="btn btn-primary float-right" id="btnSearch">조회</button>
							<select id="searchType" class="custom-select mr-2 float-right" style="max-width:80px">
								<option value="001">레이저</option>
								<option value="002">후가공</option>
							</select>
							<input class="form-control float-right mr-2" style="max-width:110px" type="date" id="searchDate">						
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered dtable_sel_bd" id="calendarTable">
									<colgroup>
			                            <col width="14%">
			                            <col width="14%">
			                            <col width="14%">
			                            <col width="14%">
			                            <col width="14%">
			                            <col width="14%">
			                            <col width="14%">
			                        </colgroup>
									<thead class="thead-light">
										<tr>
											<th class="p-1" style="color:red;">일요일</th>
											<th class="p-1">월요일</th>
											<th class="p-1">화요일</th>
											<th class="p-1">수요일</th>
											<th class="p-1">목요일</th>
											<th class="p-1">금요일</th>
											<th class="p-1" style="color:blue;">토요일</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar overflow-hidden" id="rfSidenav" style="width: 29%;">
				<div class="card">
					<div class="row">
						<div class="col-md-12 p-0">
							<select id="alltimeCode" class="custom-select"></select>
							<div class="table-responsive">
								<table class="table table-bordered" id="dateLineTable">
									<colgroup>
										<col width="8%">
			                            <col width="20%">
			                            <col width="12%">
			                            <col width="12%">
			                            <col width="20%">
			                            <col width="13%">
			                            <col width="15%">
			                        </colgroup>
			                        <thead>
			                        	<tr>
			                        		<th><input type="checkbox" class="checkbox_md align-middle text-center" id="allCheckYn"></th>
			                        		<th>날짜</th>
			                        		<th>요일</th>
			                        		<th>설정</th>
			                        		<th>작업시간</th>
			                        		<th>가동시간</th>
			                        		<th>비가동시간</th>
			                        	</tr>
			                        </thead>
			                        <tbody>
			                        </tbody>
								</table>
								<button type="button" class="btn btn-primary float-right" id="btnSave">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<%@include file="../layout/bottom.jsp" %>
<script>
	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "70%"
			}, 0);
				$("#arrow-left").animate({
				display : "none"
			}, 0);
		}
		state = !state;
	});

	let currentHref = "bmsc0220";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","공장력등록");

	var timeCode = new Array();
	<c:forEach items="${timeCodeList}" var="info">
	if("${info.baseAbbr}"=='001') {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}" + ' ' + moment("${info.etc1}", 'HH:mm').format('HH:mm') + ' : ' + moment("${info.etc2}", 'HH:mm').format('HH:mm');
		json.etc1 = "${info.etc1}";
		json.etc2 = "${info.etc2}";
		json.etc3 = "${info.etc3}";
		json.baseNm2 = "${info.baseNm}";

		let startHour = "${info.etc1}".substr(0, 2);

    	let endHour = "${info.etc2}".substr(0, 2);
    	let runningTimeVal = 0;
    	if(parseInt(startHour)<parseInt(endHour)) {
    		startTimeVal = moment().format('YYYYMMDD') + moment(startHour,'HH:mm').format('HHmm'); 
        	endTimeVal = moment().format('YYYYMMDD') + moment(endHour,'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
	 		var sum = getEnd - getStart;
	 		runningTimeVal = sum/60000/60;
        } else {
        	startTimeVal = moment().format('YYYYMMDD') + moment(startHour,'HH:mm').format('HHmm'); 
        	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment(endHour,'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
	 		var sum = getEnd - getStart;
	 		runningTimeVal = sum/60000/60;
        }
    	json.runningTime = runningTimeVal;
		timeCode.push(json);
	}
	</c:forEach>
	
	
	selectBoxAppend(timeCode, "alltimeCode", "", "2");
	
	$('#searchDate').val(moment().format('YYYY-MM-DD'));
	let searchMonthVal = moment().format('YYYY-MM');

	let saveState = 'add';
	let factoryType = $('#searchType').val();
	
	$('#alltimeCode').change(function() {

		let timeCd = '';
		let timeName = '';
		let startTime = '';
		let endTime = '';
		let runningTime = 0;
		let breakTime = 0;
		console.log(timeCode)
		
		console.log(timeCode.length)
		for(let x = 0; x<timeCode.length; x++) {
			if(timeCode[x].baseCd==$('#alltimeCode').val()) {
				timeCd = timeCode[x].baseCd;
				timeName = timeCode[x].baseNm2;
				startTime = moment(timeCode[x].etc1, 'HH:mm').format('HH:mm');
				endTime = moment(timeCode[x].etc2, 'HH:mm').format('HH:mm');
			}
		}

		let startTimeVal;
    	let endTimeVal;
		let stopTimeVal;
    	
    	let startHour = startTime.substr(0, 2);

    	let endHour = endTime.substr(0, 2);
    	if(parseInt(startHour)<parseInt(endHour)) {
    		startTimeVal = moment().format('YYYYMMDD') + moment(startHour,'HH:mm').format('HHmm'); 
        	endTimeVal = moment().format('YYYYMMDD') + moment(endHour,'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
	 		var sum = getEnd - getStart;
	 		stopTimeVal = sum/60000/60;
        } else {
        	startTimeVal = moment().format('YYYYMMDD') + moment(startHour,'HH:mm').format('HHmm'); 
        	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment(endHour,'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
	 		var sum = getEnd - getStart;
	 		stopTimeVal = sum/60000/60;
        }
    	runningTime = stopTimeVal;
    	breakTime = 24 - runningTime;
    	console.log("000 : " + stopTimeVal)
		
		let count = 0;
		for(let i=1; i<=31; i++) {
			if($('#checkYn'+i).is(':checked')) {
				$('#timeCode'+i).val(timeCd);
				$('#startTime'+i).val(startTime);
				$('#endTime'+i).val(endTime);
				$('#timeName'+i).text(timeName);
				$('#time'+i).text(startTime + '~' + endTime);
				$('#runningTime'+i).text(runningTime);
				$('#breakTime'+i).text(breakTime);
				count++;
			}
		}
		if(count==0) {
			toastr.warning('설정할 데이터를 체크해주세요.');
		}
		$('#alltimeCode').val('');
	});

	//기준시간조회 버튼 click
	$('#btnLoadTime').on('click',function() {
		$.ajax({
			url : '<c:url value="bm/commonCodeList"/>',
			type : 'GET',
			data : {
				'baseGroupCd' : '068'
			},
			beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == 'ok') {
					var data = res.data;
					$('#dayStartTimeAll').val(data[0].etc1);
					$('#dayEndTimeAll').val(data[0].etc2);
					$('#dayTotalTimeAll').val(data[0].etc3);

					$('#nightStartTimeAll').val(data[1].etc1);
					$('#nightEndTimeAll').val(data[1].etc2);
					$('#nightTotalTimeAll').val(data[1].etc3);

					$('#dayStartTimeEndAll').val(data[2].etc1);
					$('#dayEndTimeEndAll').val(data[2].etc2);
					$('#dayTotalTimeEndAll').val(data[2].etc3);

					$('#nightStartTimeEndAll').val(data[3].etc1);
					$('#nightEndTimeEndAll').val(data[3].etc2);
					$('#nightTotalTimeEndAll').val(data[3].etc3);
					
					$('#my-spinner').hide();
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	// 박스 전체 체크
	$('#allCheckYn').on('click',function() {
		if($(this).is(':checked')) {
			$('input[name=checkYn]').prop('checked',true);
		} else {
			$('input[name=checkYn]').prop('checked',false);
		}
	})
	
	function dateLineInsert(value) {
		$('#allCheckYn').prop('checked',false);
		
		$('#dateLineTable tbody').empty();

		for(let i = 1; i<=value; i++) {
			let html = '<tr>';
			html += '<td class="text-center"><input type="checkbox" class="checkbox_md align-middle" name="checkYn" id="checkYn'+i+'"></td>';
			html += '<input type="hidden" id="timeCode'+i+'">';
			html += '<input type="hidden" id="startTime'+i+'">';
			html += '<input type="hidden" id="endTime'+i+'">';
			html += '<input type="hidden" id="dataStatus'+i+'" value="create">';
			html += '<td class="text-center" id="date'+i+'"></td>';
			html += '<td class="text-center" id="day'+i+'"></td>';
			html += '<td class="text-center" id="timeName'+i+'"></td>';
			html += '<td class="text-center" id="time'+i+'"></td>';
			html += '<td class="text-center" id="runningTime'+i+'"></td>';
			html += '<td class="text-center" id="breakTime'+i+'"></td>';
			
			html += '</tr>';
			$('#dateLineTable tbody').append(html);
		}
		let totalHtml = '<tr><th colspan="5" class="text-center">합계</th>';
		totalHtml += '<td id="totalRunningTime" class="text-center"></td>';
		totalHtml += '<td id="totalBreakTime" class="text-center"></td></tr>';
		$('#dateLineTable tbody').append(totalHtml);
		//dateLineTable.draw();
	}

	// 날짜 조회
	$('#btnSearch').on('click',function() {
		searchMonthVal = moment($('#searchDate').val()).format('YYYY-MM');
		factoryType = $('#searchType').val();
		calendarTable.ajax.reload(function() {});
		
	});

	//월달력 조회
	let dateLineTable = $('#dateLineTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '72vh',
		pageLength : 20000,
		columns : [
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{
				render : function(data, type, row, meta) {
					return '';
				}
			},
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
	    	let api = this.api();
	    	$('.dataTables_scrollBody').css({
	    		'overflow-y': 'scroll'		
		    });
	    	api.columns.adjust();
	    },
	});
	
	//월달력 조회
	let calendarTable = $('#calendarTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20000,
		select: {
            style: 'single',
            toggleable: false,
            items: 'cell',
            info: false
        },
		ajax : {
			url : '<c:url value="bm/calendarListToMonth"/>',
			type : 'POST',
			data : {
				'searchMonth' : function(){ return moment(searchMonthVal).format('YYYYMM'); },
			},
		},
		rowId : 'idx',
		columns : [
			{ data: 'su',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'mo',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'tu',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'we',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'th',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'fr',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	},
			{ data: 'sa',
				render : function(data, type, row, meta) {
					return calendarHtml(data);
				}
	    	}
		],
		columnDefs : [
			{
				targets: '_all', className: 'p-0 font-weight-bold'
			}
		],
	    order: [],
	    buttons: [],
	    drawCallback: function() {
	    	dataArray = [];
		    var today = moment().format('YYYY-MM-DD');
		    $('#esarchMonth').text(moment(searchMonthVal).format('YYYY.MM'));

		    //var solYear = moment(searchMonthVal,'YYYY-MM').format('YYYY');
		    //var solMonth = moment(searchMonthVal,'YYYY-MM').format('MM');
		    ////공휴일 API
		    //$.ajax({
			//	url: '<c:url value="et/getHolidayAPI"/>',
	        //    type: 'POST',
	        //    data: {
		    //        'apiType'		:	'getHoliDeInfo',
	        //    	'solYear'		:	solYear,
	        //    	'solMonth'		:	solMonth,
	        //    	'type'			:	'json'
	        //    },
	        //    async : false,
	        //    beforeSend: function() {
	        //        $('#my-spinner').show();
	        //    },
	        //    success: function (res) {
		    //        var data = JSON.parse(res.data).response.body.items.item;
		    //        var totalCount = JSON.parse(res.data).response.body.totalCount;
		    //        if(totalCount != 0) {
		    //        	for(var i=0;i<data.length;i++) {
			//	            var name = data[i].dateName;
			//	            var date = moment(data[i].locdate,'YYYYMMDD').format('YYYY-MM-DD');
			//	            $('#'+date).css('color','red');
			//	            $('#'+date).append(calendarDtlHtml(name,'red','red','white'));
			//	        }
			//        }
		    //        $('#my-spinner').hide();
	        //    }
			//});
			
			//국경일 목록
			var year = moment(searchMonthVal,'YYYY-MM').format('YYYY');
			var holidayArray = new Array();
			holidayArray.push(year+'-01-01'); // 신정
			holidayArray.push(year+'-'+moment(year+'-'+lunarDate(year+'0101')).subtract('1','d').format('MM-DD')); // 설날연휴
			holidayArray.push(year+'-'+lunarDate(year+'0101')); // 설날
			holidayArray.push(year+'-'+moment(year+'-'+lunarDate(year+'0101')).add('1','d').format('MM-DD')); // 설날연휴
			holidayArray.push(year+'-03-01'); // 삼일절
			holidayArray.push(year+'-'+lunarDate(year+'0408')); // 부처님오신날
			holidayArray.push(year+'-05-05'); // 어린이날
			holidayArray.push(year+'-06-06'); // 현충일
			holidayArray.push(year+'-08-15'); // 광복절
			holidayArray.push(year+'-'+moment(year+'-'+lunarDate(year+'0815')).subtract('1','d').format('MM-DD')); // 추석연휴
			holidayArray.push(year+'-'+lunarDate(year+'0815')); // 추석
			holidayArray.push(year+'-'+moment(year+'-'+lunarDate(year+'0815')).add('1','d').format('MM-DD')); // 추석연휴
			holidayArray.push(year+'-10-03'); // 개천절
			holidayArray.push(year+'-10-09'); // 한글날
			holidayArray.push(year+'-12-25'); // 크리스마스
			
			$('#'+year+'-01-01').append(calendarDtlHtml('신정','red','red','white','400'));
			$('#'+year+'-'+moment(year+'-'+lunarDate(year+'0101')).subtract('1','d').format('MM-DD')).append(calendarDtlHtml('설날연휴','red','red','white','400'));
			$('#'+year+'-'+lunarDate(year+'0101')).append(calendarDtlHtml('설날','red','red','white','400'));
			$('#'+year+'-'+moment(year+'-'+lunarDate(year+'0101')).add('1','d').format('MM-DD')).append(calendarDtlHtml('설날연휴','red','red','white','400'));
			$('#'+year+'-03-01').append(calendarDtlHtml('3.1절','red','red','white','400'));
			$('#'+year+'-'+lunarDate(year+'0408')).append(calendarDtlHtml('부처님오신날','red','red','white','400'));
			$('#'+year+'-05-05').append(calendarDtlHtml('어린이날','red','red','white','400'));
			$('#'+year+'-06-06').append(calendarDtlHtml('현충일','red','red','white','400'));
			$('#'+year+'-08-15').append(calendarDtlHtml('광복절','red','red','white','400'));
			$('#'+year+'-'+moment(year+'-'+lunarDate(year+'0815')).subtract('1','d').format('MM-DD')).append(calendarDtlHtml('추석연휴','red','red','white','400'));
			$('#'+year+'-'+lunarDate(year+'0815')).append(calendarDtlHtml('추석','red','red','white','400'));
			$('#'+year+'-'+moment(year+'-'+lunarDate(year+'0815')).add('1','d').format('MM-DD')).append(calendarDtlHtml('추석연휴','red','red','white','400'));
			$('#'+year+'-10-03').append(calendarDtlHtml('개천절','red','red','white','400'));
			$('#'+year+'-10-09').append(calendarDtlHtml('한글날','red','red','white','400'));
			$('#'+year+'-12-25').append(calendarDtlHtml('크리스마스','red','red','white','400'));
			
		  	//공장력 월별 공휴일 목록조회
		    $.ajax({
				url: '<c:url value="bm/factoryCalendarHolidayList"/>',
	            type: 'POST',
	            data: {					
	            	'searchMonth'	:	function(){return moment(searchMonthVal).format('YYYYMM');}
	            },
	            async : false,
	            beforeSend: function() {
	                $('#my-spinner').show();
	            },
	            success: function (res) {
	                if(res.result == 'ok') {
		                var data = res.data;
		                dateLineInsert(data.length);
		                for(var i=0;i<data.length;i++) {
			                var date = moment(data[i].factoryDate).format('YYYY-MM-DD');
			                let dayName = '';
			                if(data[i].weekend=='1') {
			                	dayName = '일';
							} else if(data[i].weekend=='2') {
								dayName = '월';
							} else if(data[i].weekend=='3') {
								dayName = '화';
							} else if(data[i].weekend=='4') {
								dayName = '수';
							} else if(data[i].weekend=='5') {
								dayName = '목';
							} else if(data[i].weekend=='6') {
								dayName = '금';
							} else {
								dayName = '토';
							}
							$('#date'+(i+1)).text(date);
							$('#day'+(i+1)).text(dayName);
			                var name = '공휴일';
			                if(_.indexOf(holidayArray,moment(date).format('YYYY-MM-DD')) == -1) {
			                	if(data[i].weekend == '1') {
			                		$('#'+date).css('color','red');
			                		$('#'+date).append(calendarDtlHtml(name,'red','red','white','400'));
				                } else if(data[i].weekend == '7') {
				                	$('#'+date).css('color','blue');
				                	$('#'+date).append(calendarDtlHtml(name,'blue','blue','white','400'));
					            } else {
					            	//$('#'+date).append(calendarDtlHtml(name,'white','white','white'));
						        }
				            } else {
				            	$('#'+date).css('color','red');
					        }
			            }
			            
	                } else {
	                    toastr.error(res.message);
	                }
	                $('#my-spinner').hide();
	            }
			});
			
		    //공장력 월별 목록조회
		    $.ajax({
				url: '<c:url value="bm/factoryCalendarList"/>',
	            type: 'POST',
	            data: {
	            	'searchMonth'	:	moment(searchMonthVal,'YYYY-MM').format('YYYYMM'),
	            	'factoryType'	:	factoryType,
	            },
	            async : false,
	            beforeSend: function() {
	                $('#my-spinner').show();
	            },
	            success: function (res) {
	                if(res.result == 'ok') {
		                var data = res.data;
		                let totalRunningTime = 0;
		                let totalBreakTime = 0;
		                for(var i=0;i<data.length;i++) {
		                	var date = moment(data[i].factoryDate,'YYYYMMDD').format('YYYY-MM-DD');
			                $('#'+date).append(calendarDtlHtml2(data[i].timeCode,'#EDEAD7','#EDEAD7','black','900'));
			                var dateId = parseInt(data[i].factoryDate.substr(6,2));
			                $('#dataStatus'+dateId).val('update');
			                $('#timeName'+dateId).text(data[i].timeName);
			                let startTimeVal = data[i].startTime.substr(8,2);
			                let endTimeVal = data[i].endTime.substr(8,2);
			                $('#time'+dateId).text(startTimeVal + ':00' + '~' + endTimeVal + ':00');
			                $('#runningTime'+dateId).text(data[i].runningTime);
			                $('#breakTime'+dateId).text(data[i].breakTime);
			                totalRunningTime = totalRunningTime + parseInt(data[i].runningTime);
			                totalBreakTime = totalBreakTime + parseInt(data[i].breakTime);
			            }
			            $('#totalRunningTime').text(totalRunningTime);
			            $('#totalBreakTime').text(totalBreakTime);
	                } else {
	                    toastr.error(res.message);
	                }
	                $('#my-spinner').hide();
	            }
			});
		}
	});

	// 이전 월 버튼 click
    $('#prevMonth').on('click',function() {
    	searchMonthVal = moment(searchMonthVal).subtract(1,'M').format('YYYY-MM');
    	factoryType = $('#searchType').val();
    	calendarTable.ajax.reload(function() {});
	});
 	// 다음 월 버튼 click
    $('#nextMonth').on('click',function() {
    	searchMonthVal = moment(searchMonthVal).add(1,'M').format('YYYY-MM');
    	factoryType = $('#searchType').val();
    	calendarTable.ajax.reload(function() {});
	});

 	// 저장 버튼 click
    $('#btnSave').on('click',function() {
        dataArray = new Array();
    	for(let i=1; i<=31; i++) {
			if($('#timeCode'+i).val()!='') {
				let rowData = new Object();
				let rowDate = moment($('#date'+i).text()).format('YYYYMMDD');
				rowData.factoryDate = rowDate;
				rowData.factoryType = factoryType;
				rowData.timeCode = $('#timeCode'+i).val();
				rowData.dataStatus = $('#dataStatus'+i).val();
				rowData.startTime = rowDate + moment($('#startTime'+i).val(), 'HH:mm').format('HHmm');
				rowData.endTime = rowDate + moment($('#endTime'+i).val(), 'HH:mm').format('HHmm');
				rowData.runningTime = $('#runningTime'+i).text();
				rowData.breakTime = $('#breakTime'+i).text();
				dataArray.push(rowData);
			}
		}
		console.log(dataArray)
		
		$.ajax({
			url : '<c:url value="bm/factoryCalendarCreateOrUpdate" />',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {
				$('#my-spinner').show();
			},
			success : function(res){
				toastr.success("저장되었습니다.");
				$('#calendarTable').DataTable().ajax.reload( function () {});
				$('#my-spinner').hide();
			}
		});
    });

	//달력 html
	function calendarHtml(data) {
		var resultHtml = '';
		if(data != '' && data != null) {
			data = moment(data).format('YYYY-MM-DD');
			resultHtml += '<div class="calendarTd" id="'+data+'" style="min-height: 12vh;">';
			resultHtml += '	<div class="container">';
			resultHtml += '		<div class="row">';
			resultHtml += '			<div class="col-md-12">';
			resultHtml += 				data.split('-')[2]+'일';
			resultHtml += '			</div>';
			resultHtml += '		</div>';
			resultHtml += '	</div>';
			resultHtml += '</div>';
			resultHtml += ''
		} else {
			resultHtml += '<div style="height: 12vh;"></div>';
		}
		return resultHtml;
	}

	//일정 추가 html
	function calendarDtlHtml(data, borderColor, backgroundColor, color, fontWeigth) {
		var resultHtml = '';
			resultHtml += '<div class="row" style="border: 1px solid '+borderColor+';background-color: '+backgroundColor+'; color:'+color+'; margin:3px; border-radius:5px; font-weight:'+fontWeigth+'">';
			resultHtml += '		<div class="col-md-12 p-1">';
			resultHtml += 			data;
			resultHtml += '		</div>';
			resultHtml += '</div>';
		return resultHtml;
	}

	function calendarDtlHtml2(data, borderColor, backgroundColor, color, fontWeigth) {
		var resultHtml = '';
			resultHtml += '<div class="row" style="border: 1px solid '+borderColor+';background-color: '+backgroundColor+'; color:'+color+'; margin:3px; border-radius:5px; font-weight:'+fontWeigth+'">';
			resultHtml += '		<div class="col-md-12 p-1">';

			for(let i =0; i<timeCode.length; i++) {
				if(timeCode[i].baseCd==data) {
					let runningTimeVal = timeCode[i].runningTime;
					if(timeCode[i].runningTime<10) {
						runningTimeVal = '0' + runningTimeVal;
					}
					resultHtml += timeCode[i].baseNm2+' : '+timeCode[i].etc1+' ~ '+timeCode[i].etc2+'['+runningTimeVal+ ':00]';
					resultHtml += '		</div>';
					resultHtml += '</div>';
					return resultHtml;
				}
			}
			/*
			if(data=='001') {
				resultHtml += '정상 : 09:00 ~ 09:00[24:00]';
			} else if(data=='002') {
				resultHtml += '주간 : 09:00 ~ 18:00[09:00]';
			} else if(data=='003') {
				resultHtml += '야간 : 18:00 ~ 09:00[09:00]';
			}
			resultHtml += '		</div>';
			resultHtml += '</div>';
			*/
		return resultHtml;
	}
	
</script>


</body>
</html>
