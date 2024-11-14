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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">계획정지관리</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card">
					
					<div style="margin-bottom: 15px;">
						<input class="form-control float-left mr-2" style="width:100px;" type="month" id="searchMonth">
								<select id="searchType" onchange="equipSelectUpdate();" class="custom-select mr-2"  style="width:100px;">
									<option value="001">레이저</option>
									<option value="002">후가공</option>
								</select>
								<select id="searchEquipCd" class="custom-select mr-2"  style="width:100px;"></select>
								<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
							
							<div class="float-right">
							<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnSave">저장</button>
							<button type="button" class="btn btn-danger float-right ml-1" id="btnDelete">삭제</button>
							<button type="button" class="btn btn-warning float-right ml-1" id="btnEdit">수정</button>
							<button type="button" class="btn btn-primary float-right ml-1" id="btnAdd">추가</button>
							<button type="button" class="btn btn-primary float-right ml-1" id="btnBacthAdd">일괄등록</button>
							</div>
						<div class="table-responsive">
							<table id="planStopTable" class="table table-bordered">
								<colgroup>
									<col width="13%">
									<col width="14%">
									<col width="13%">
									<col width="13%">
									<col width="15%">
									<col width="15%">
									<col width="13%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>작업장</th>
										<th>호기명</th>
										<th>일자</th>
										<th>정지항목</th>
										<th>정지시작</th>
										<th>정지종료</th>
										<th>정지시간</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="table-responsive">
						<table id="planStopSomTable" class="table table-bordered">
							<thead class="thead-light">
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<!-- /.left-list -->
		</div>
	</div>
</div>
<!-- ------------------ 일괄등록 모달 시작 ------------------ -->
<div class="modal fade bd-example-modal-lg" id="batchAddPopUpModal" tabindex="-1" role="dialog" aria-labelledby="matrlPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="matrlPopUpLabel">계획정지 일괄등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div> 
			<div class="modal-body">
				<hr class="text-secondary">	         
				<table id="matrlCdPopUpTable" class="table table-bordered">
					<tr>
						<th>시작일자</th>
						<td><input class="form-control mw-100" type="date" id="batchStartDate"></td>
						<th>마지막일자</th>
						<td><input class="form-control mw-100" type="date" id="batchEndDate"></td>         
					</tr>
					<tr>
						<th>설비</th>
						<td><select id="batchEquipCd" class="custom-select mw-100"></select></td>
						<th>정지항목</th>
						<td><select id="batchTimeCode" class="custom-select mw-100" onchange="selectUpdate('0', '002');"></select></td>
					</tr>
					<tr>
						<th>정지시작</th>
						<td>
						<div id="batchStartHtml"></div>
						</td>
						<th>정지종료</th>
						<td>
						<div id="batchEndHtml"></div>
						</td>
					</tr>
				</table>
				<hr class="text-secondary"> 
			</div>
			<div class="modal-footer">
			
			<button type="button" class="btn btn-primary" id="btnBatchSave">저장</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- ------------------ 일괄등록 모달 종료 ------------------ --> 
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "bmsc0310";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","계획정지관리");
	let searchMonthVal = moment().format('YYYY-MM');
	$('#searchMonth').val(searchMonthVal);
	let stopType = $('#searchType').val();
	let equipCd = '';
	let equip001List = new Array();
	let equip002List = new Array();

	<c:forEach items="${equipList}" var="info">
	
	var json = new Object();
	json.equipCd = "${info.equipCd}";
	json.equipNm = "${info.equipNm}";
	json.prcNmNm = "${info.prcNmNm}";
	if("${info.useYn}"=='001') {
		if("${info.prcNm}"=='001') {
			equip001List.push(json);
		} else {
			equip002List.push(json);
		}
	}
	</c:forEach>

	var prcNmList = new Array();
	
	<c:forEach items="${prcNm}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcNmList.push(json);
	</c:forEach>
	
	var stopCode001 = new Array();
	var stopCode002 = new Array();
	
	<c:forEach items="${timeCodeList}" var="info">
	if("${info.baseAbbr}"=='002' && "${info.useYn}"=='001') {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		json.etc1 = "${info.etc1}";
		json.etc2 = "${info.etc2}";
		json.etc3 = "${info.etc3}";
		if("${info.etc3}"=='공통' || "${info.etc3}"=='') {
			stopCode001.push(json);
			stopCode002.push(json);
		} else if("${info.etc3}"=='레이저') {
			stopCode001.push(json);
		} else if("${info.etc3}"=='후가공') {
			stopCode002.push(json);
		}
	}
	</c:forEach>

	equipSelectUpdate();
	
	//월달력 조회
	let planStopSomTable = $('#planStopSomTable').DataTable({
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
		scrollY : '38vh',
		scrollX : true,
		pageLength : 20000,
		columns : [
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
	    	let api = this.api();
	    	$('.dataTables_scrollBody').css({
	    		'overflow-y': 'scroll'		
		    });
	    	//api.draw();
	    },
	});

	//계획정지 목록 조회
	let planStopTable = $('#planStopTable').DataTable({
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
		scrollY : '32vh',
		select: {
            style: 'single',
            toggleable: false,
            info: false
        },
		ajax : {
			url : '<c:url value="bm/planStopList"/>',
			type : 'POST',
			async: false,
			data : {
				'searchMonth'	: function(){ return moment(searchMonthVal).format('YYYYMM'); },
				'stopType'		: function(){ return stopType;},
				'equipCd'		: function(){ return equipCd;}
			},
		},
		columns : [
			{ data: 'stopType',
				render : function(data, type, row, meta) {
					if(stopType=='001') {
						return '레이저';
					} else {
						return '후가공';
					}
					return '';
				}
	    	},
			{ data: 'equipCd',
				render : function(data, type, row, meta) {
					if(stopType=='001') {
						if(data!=null) {
							return selectBoxAppend2(equip001List, "equipCd", data, "2", meta.row);
						} else {
							
							return selectBoxAppend2(equip001List, "equipCd", equipCd, "2", meta.row);
						}
					} else {
						if(data!=null) {
							return selectBoxAppend2(equip002List, "equipCd", data, "2", meta.row);
						} else {
							return selectBoxAppend2(equip002List, "equipCd", equipCd, "2", meta.row);
						}
					}
				}
	    	},
			{ data: 'stopDate',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<input class="form-control mw-100" type="date" value="'+moment(data).format('YYYY-MM-DD')+'" name="stopDate">';
					} else {
						return '<input class="form-control mw-100" type="date" value="'+moment().format('YYYY-MM-DD')+'" name="stopDate">';
					}
				}
	    	},
			{ data: 'timeCode',
				render : function(data, type, row, meta) {
					if(stopType=='001') {
						if(data!=null) {
							return selectBoxAppend2(stopCode001, "timeCode", data, "2", meta.row);
						} else {
							return selectBoxAppend2(stopCode001, "timeCode", "", "2", meta.row);
						}
					} else {
						if(data!=null) {
							return selectBoxAppend2(stopCode002, "timeCode", data, "2", meta.row);
						} else {
							return selectBoxAppend2(stopCode002, "timeCode", "", "2", meta.row);
						}
					}
					
				}
	    	},
			{ data: 'startTime',
				render : function(data, type, row, meta) {
					if(data!=null) {
						let startTimeValue = data.substr(0, 2) + ":" + data.substr(2, 2);
						if(row['timeChangeYn']=='O') {
							return '<div id="startHtml'+meta.row+'" name="startHtml"><input class="form-control mw-100" type="time" value="'+startTimeValue+'" name="startTime"></div>';
						} else {
							return '<div id="startHtml'+meta.row+'" name="startHtml"><input class="form-control mw-100" type="time" value="'+startTimeValue+'" name="startTime" readonly></div>';
						}
					} else {
						return '<div id="startHtml'+meta.row+'" name="startHtml"></div>';
					}
				}
	    	},
			{ data: 'endTime',
				render : function(data, type, row, meta) {
					if(data!=null) {
						let endTimeValue = data.substr(0, 2) + ":" + data.substr(2, 2);  
						if(row['timeChangeYn']=='O') {
							return '<div id="endHtml'+meta.row+'" name="endHtml"><input class="form-control mw-100" type="time" value="'+endTimeValue+'" name="endTime"></div>';
						} else {
							return '<div id="endHtml'+meta.row+'" name="endHtml"><input class="form-control mw-100" type="time" value="'+endTimeValue+'" name="endTime" readonly></div>';
						}
					} else {
						return '<div id="startHtml'+meta.row+'" name="endHtml"></div>';
					}
				}
	    	},
			{ data: 'stopTime',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return data;
					} else {
						return '';
					}
				}
	    	}
		],
		columnDefs : [
		],
	    order: [],
	    buttons: [],
	});
	uiProc(true);
	
	// 날짜 조회
	$('#btnSearch').on('click',function() {
		searchMonthVal = moment($('#searchMonth').val()).format('YYYY-MM');
		stopType = $('#searchType').val();
		equipCd = $('#searchEquipCd option:selected').val();
		if($('#searchEquipCd option:selected').val()=='전체') {
			equipCd = '';
		}
		$('#planStopTable').DataTable().ajax.reload( function () {
			uiProc(true);
		});
		$('#btnSave').addClass('d-none');
		monthChange();
	});

	
	//일괄등록
	$('#btnBacthAdd').on('click',function() {
		$('#batchAddPopUpModal').modal('show');
		if(stopType=='001') {
			selectBoxAppend2(equip001List, "batchEquipCd", "", "2", 'batch');
			selectBoxAppend2(stopCode001, "batchTimeCode", "", "2", 'batch');
		}
		else {
			selectBoxAppend2(equip002List, "batchEquipCd", "", "2", 'batch');
			selectBoxAppend2(stopCode002, "batchTimeCode", "", "2", 'batch');
		}
		$('#batchStartDate').val('');
		$('#batchEndDate').val('');
		$('#batchStartHtml').empty();
		$('#batchEndHtml').empty();
	});

 	// 저장 버튼 click
    $('#btnBatchSave').on('click',function() {
    	if($("#batchStartDate").val()=='') {
			toastr.warning("시작일자를 입력해 주세요.");
			$("#batchStartDate").select();
			return false;
		}
		if($("#batchEndDate").val()=='') {
			toastr.warning("마지막일자를 입력해 주세요.");
			$("#batchEndDate").select();
			return false;
		}

		const dateValue1 = new Date($("#batchStartDate").val());
    	const dateValue2 = new Date($("#batchEndDate").val());
    	
		if(dateValue1>dateValue2) {
			toastr.warning("마지막일자가 시작일자보다 빠릅니다.");
			return false;
		}
		
		if($("#batchEquipCd option:selected").val()=='') {
			toastr.warning("설비를 선택해 주세요.");
			$("#batchEquipCd").select();
			return false;
		}
		if($("#batchTimeCode option:selected").val()=='') {
			toastr.warning("정지항목을 선택해 주세요.");
			$("#batchTimeCode").select();
			return false;
		}
		if($("#batchStartTime").val()=='') {
			toastr.warning("정지시작 시간을 선택해 주세요.");
			$("#batchStartTime").select();
			return false;
		}
		if($("#batchEndTime").val()=='') {
			toastr.warning("정지종료 시간을 선택해 주세요.");
			$("#batchEndTime").select();
			return false;
		}

       	let startTimeVal;
       	let endTimeVal;
		let stopTimeVal;
       	
      	let startHour = moment($("#batchStartTime").val(),'HH:mm').format('HHmm').substr(0, 2);
      	let endHour = moment($("#batchEndTime").val(),'HH:mm').format('HHmm').substr(0, 2);

      	let startMinute = moment($("#batchStartTime").val(),'HH:mm').format('HHmm').substr(2, 2);
      	let endMinute = moment($("#batchEndTime").val(),'HH:mm').format('HHmm').substr(2, 2);
      	
      	if(parseInt(startHour)<parseInt(endHour)) {
    		startTimeVal = moment().format('YYYYMMDD') + moment($("#batchStartTime").val(),'HH:mm').format('HHmm'); 
        	endTimeVal = moment().format('YYYYMMDD') + moment($("#batchEndTime").val(),'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
	 		var sum = getEnd - getStart;
	 		stopTimeVal = sum/60000;
        } else if(parseInt(startHour)==parseInt(endHour)) {
			if(parseInt(startMinute)<parseInt(endMinute)) {
				startTimeVal = moment().format('YYYYMMDD') + moment($("#batchStartTime").val(),'HH:mm').format('HHmm'); 
	        	endTimeVal = moment().format('YYYYMMDD') + moment($("#batchEndTime").val(),'HH:mm').format('HHmm');
            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var getStart = start.getTime();
    			var getEnd = end.getTime();
    	 		var sum = getEnd - getStart;
    	 		stopTimeVal = sum/60000;
			} else {
				startTimeVal = moment().format('YYYYMMDD') + moment($("#batchStartTime").val(),'HH:mm').format('HHmm'); 
            	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment($("#batchEndTime").val(),'HH:mm').format('HHmm'); 
            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var getStart = start.getTime();
    			var getEnd = end.getTime();
    			console.log(startTimeVal)
            	console.log(endTimeVal)
    	 		var sum = getEnd - getStart;
    	 		stopTimeVal = sum/60000;
			}
        } else {
        	startTimeVal = moment().format('YYYYMMDD') + moment($("#batchStartTime").val(),'HH:mm').format('HHmm'); 
        	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment($("#batchEndTime").val(),'HH:mm').format('HHmm');
        	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
        	var getStart = start.getTime();
			var getEnd = end.getTime();
			console.log(startTimeVal)
        	console.log(endTimeVal)
	 		var sum = getEnd - getStart;
	 		stopTimeVal = sum/60000;
        }
        console.log(moment($("#batchStartDate").val()).format('YYYYMMDD'))
        console.log(moment($("#batchEndDate").val()).format('YYYYMMDD'))
        console.log(stopType)
        console.log($("#batchEquipCd option:selected").val())
        console.log($("#batchTimeCode option:selected").val())
        console.log(moment($("#batchStartTime").val(),'HH:mm').format('HHmm'))
        console.log(moment($("#batchEndTime").val(),'HH:mm').format('HHmm'))
        console.log(stopTimeVal)
        $.ajax({
        	url : '<c:url value="bm/planStopBatchCreate" />',
			type : 'POST',
			async : false,
			data : {
				'startDate' : moment($("#batchStartDate").val()).format('YYYYMMDD'),
				'endDate' 	: moment($("#batchEndDate").val()).format('YYYYMMDD'),
				'stopType'	: stopType,
				'equipCd' 	: $("#batchEquipCd option:selected").val(),
				'timeCode' 	: $("#batchTimeCode option:selected").val(),
				'startTime' : moment($("#batchStartTime").val(),'HH:mm').format('HHmm'),
				'endTime' 	: moment($("#batchEndTime").val(),'HH:mm').format('HHmm'),
				'stopTime'	: stopTimeVal
			},
			beforeSend : function() {
   				$('#my-spinner').show();
   			},
			success : function(res) {
				toastr.success("저장되었습니다.");
   				$('#planStopTable').DataTable().ajax.reload( function () {
   					uiProc(true);
       			});
       			$('#batchAddPopUpModal').modal('hide');
   				monthChange();
   				$('#my-spinner').hide();
			},
		});
    });
	
	//추가
	$('#btnAdd').on('click',function() {
		planStopTable.row.add({
	    	'stopType'	:	stopType,
	    	'equipCd'	:	null,
	    	'stopDate'	:	null,
	    	'timeCode'	:	null,
	    	'startTime'	:	null,
	    	'endTime'	:	null,
	    	'stopTime'	:	null,
	    }).draw(true);
	    $('#btnSave').removeClass('d-none');
	});

	//수정
	$('#btnEdit').on('click',function() {
		uiProc(false);
		$('#btnSave').removeClass('d-none');
	});

	//삭제
	$('#btnDelete').on('click',function() {
		$('#planStopTable').DataTable().row('.selected').remove().draw();
		$('#btnSave').removeClass('d-none');
	});

 	// 저장 버튼 click
    $('#btnSave').on('click',function() {
        dataArray = new Array();
        let check = true;
        $('#planStopTable tbody tr').each(function(index, item){
			if($(this).find("td select[name=equipCd] option:selected").val()=='') {
				toastr.warning("설비를 선택해 주세요.");
				$(this).find("td select[name=equipCd]").select();
				check = false;
				return false;
			}
			if($(this).find("td select[name=timeCode] option:selected").val()=='') {
				toastr.warning("정지항목을 선택해 주세요.");
				$(this).find("td select[name=timeCode]").select();
				check = false;
				return false;
			}
			if($(this).find("td input[name=startTime]").val()=='') {
				toastr.warning("정지시작 시간을 선택해 주세요.");
				$(this).find("td input[name=startTime]").select();
				check = false;
				return false;
			}
			if($(this).find("td input[name=endTime]").val()=='') {
				toastr.warning("정지종료 시간을 선택해 주세요.");
				$(this).find("td input[name=endTime]").select();
				check = false;
				return false;
			}

			
            
        	let rowData = new Object();
        	rowData.searchMonth = moment(searchMonthVal).format('YYYYMM');
        	rowData.stopDate = moment($(this).find("td input[name=stopDate]").val()).format('YYYYMMDD');
        	rowData.stopType = stopType;
        	rowData.equipCd = $(this).find("td select[name=equipCd] option:selected").val();
        	rowData.timeCode = $(this).find("td select[name=timeCode] option:selected").val();
        	rowData.startTime = moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm');
        	rowData.endTime = moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm');

        	let startTimeVal;
        	let endTimeVal;
			let stopTimeVal;
        	
        	let startHour = moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm').substr(0, 2);
        	let endHour = moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm').substr(0, 2);
        	let startMinute = moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm').substr(2, 2);
        	let endMinute = moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm').substr(2, 2);
        	if(parseInt(startHour)<parseInt(endHour)) {
        		startTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm'); 
            	endTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm');
            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var getStart = start.getTime();
    			var getEnd = end.getTime();
    	 		var sum = getEnd - getStart;
    	 		stopTimeVal = sum/60000;
            } else if(parseInt(startHour)==parseInt(endHour)) {
				if(parseInt(startMinute)<parseInt(endMinute)) {
					startTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm'); 
	            	endTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm');
	            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
	            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
	            	var getStart = start.getTime();
	    			var getEnd = end.getTime();
	    	 		var sum = getEnd - getStart;
	    	 		stopTimeVal = sum/60000;
				} else {
					startTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm'); 
	            	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm');
	            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
	            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
	            	var getStart = start.getTime();
	    			var getEnd = end.getTime();
	    			console.log(startTimeVal)
	            	console.log(endTimeVal)
	    	 		var sum = getEnd - getStart;
	    	 		stopTimeVal = sum/60000;
				}
            } else {
            	startTimeVal = moment().format('YYYYMMDD') + moment($(this).find("td input[name=startTime]").val(),'HH:mm').format('HHmm'); 
            	endTimeVal = moment().subtract('d', -1).format('YYYYMMDD') + moment($(this).find("td input[name=endTime]").val(),'HH:mm').format('HHmm');
            	var start = new Date(moment(startTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var end = new Date(moment(endTimeVal, "YYYY-MM-DDTHH:mm").format("YYYY-MM-DDTHH:mm"));
            	var getStart = start.getTime();
    			var getEnd = end.getTime();
    			console.log(startTimeVal)
            	console.log(endTimeVal)
    	 		var sum = getEnd - getStart;
    	 		stopTimeVal = sum/60000;
            }
        	rowData.stopTime = stopTimeVal;
        	rowData.deleteEquipCd = equipCd;
        	if(equipCd!='') {
				rowData.deleteStatus = 'equipDelete';
				
            } else {
				rowData.deleteStatus = 'allDelete';
			}
        	dataArray.push(rowData);
        });
        console.log(dataArray)
        if(check) {
        	$.ajax({
    			url : '<c:url value="bm/planStopListCreate" />',
    			type : 'POST',
    			datatype: 'json',
    			data: JSON.stringify(dataArray),
    			contentType : "application/json; charset=UTF-8",
    			beforeSend : function() {
    				$('#my-spinner').show();
    			},
    			success : function(res){
    				toastr.success("저장되었습니다.");
    				$('#planStopTable').DataTable().ajax.reload( function () {
    					uiProc(true);
        			});
    				monthChange();
    				$('#my-spinner').hide();
    			}
    		});
		}
    });
	
	monthChange();
	function monthChange() {
		//월별 공휴일 목록 조회
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
	                	if(data[i].weekend == '1') {
	                		$('#'+date).css('color','red');
		                } else if(data[i].weekend == '7') {
		                	$('#'+date).css('color','blue');
			            } else {
			            	//$('#'+date).append(calendarDtlHtml(name,'white','white','white'));
				        }
		            }
	                planStopViewList(data.length);
	                equipSummaryTime();
                } else {
                    toastr.error(res.message);
                }
                $('#my-spinner').hide();
            }
		});
	}

	//하단 테이블 헤드 표시
	function dateLineInsert(value) {
		$('#planStopSomTable thead').empty();
		let html1 = '<tr>';
		html1 += '<th rowspan="2" class="text-center align-middle" style="min-width:120px;">작업장</th>';
		html1 += '<th rowspan="2" class="text-center align-middle" style="min-width:120px;">설비명</th>';
		html1 += '<th rowspan="2" class="text-center align-middle" style="min-width:100px;">누적값</th>';
		let html2 = '<tr>';
		
		for(let i = 1; i<=value; i++) {
			html1 += '<th class="text-center day'+i+'" id="day'+i+'" style="min-width:100px;"></th>';
			html2 += '<th class="text-center day'+i+'" id="date'+i+'" style="min-width:100px;"></th>';
		}
		html1 += '</tr>';
		html2 += '</tr>';
		$('#planStopSomTable thead').append(html1);
		$('#planStopSomTable thead').append(html2);
		//dateLineTable.draw();
	}

	//하단 테이블 설비 표시
	function planStopViewList(value) {
		$('#planStopSomTable tbody').empty();
		
		if(stopType=='001') {
			if(equipCd!='') {
				for(let i = 0; i<equip001List.length; i++) {
					if(equipCd==equip001List[i].equipCd) {
						let equipHtml = '<tr>';
						equipHtml += '<td class="text-center">'+equip001List[i].prcNmNm+'</td>';
						equipHtml += '<td class="text-center">'+equip001List[i].equipNm+'</td>';
						equipHtml += '<td class="text-center" id="'+equip001List[i].equipCd+'Sum"></td>';
						for(let k = 1; k<=value; k++) {
							equipHtml += '<td class="text-center day'+k+'" id="'+equip001List[i].equipCd+"_"+k+'"></td>';
						}
						equipHtml += '<tr>';
						$('#planStopSomTable tbody').append(equipHtml);
						return false;
					}
				}
			} else {
				for(let i = 0; i<equip001List.length; i++) {
					let equipHtml = '<tr>';
					equipHtml += '<td class="text-center">'+equip001List[i].prcNmNm+'</td>';
					equipHtml += '<td class="text-center">'+equip001List[i].equipNm+'</td>';
					equipHtml += '<td class="text-center" id="'+equip001List[i].equipCd+'Sum"></td>';
					for(let k = 1; k<=value; k++) {
						equipHtml += '<td class="text-center day'+k+'" id="'+equip001List[i].equipCd+"_"+k+'"></td>';
					}
					equipHtml += '<tr>';
					$('#planStopSomTable tbody').append(equipHtml);
				}
			}
		} else {
			if(equipCd!='') {
				for(let i = 0; i<equip002List.length; i++) {
					if(equipCd==equip002List[i].equipCd) {
						let equipHtml = '<tr>';
						equipHtml += '<td class="text-center">'+equip002List[i].prcNmNm+'</td>';
						equipHtml += '<td class="text-center">'+equip002List[i].equipNm+'</td>';
						equipHtml += '<td class="text-center" id="'+equip002List[i].equipCd+'Sum"></td>';
						for(let k = 1; k<=value; k++) {
							equipHtml += '<td class="text-center day'+k+'" id="'+equip002List[i].equipCd+"_"+k+'"></td>';
						}
						equipHtml += '<tr>';
						$('#planStopSomTable tbody').append(equipHtml);
						return false;
					}
				}
			} else {
				for(let i = 0; i<equip002List.length; i++) {
					let equipHtml = '<tr>';
					equipHtml += '<td class="text-center">'+equip002List[i].prcNmNm+'</td>';
					equipHtml += '<td class="text-center">'+equip002List[i].equipNm+'</td>';
					equipHtml += '<td class="text-center" id="'+equip002List[i].equipCd+'Sum"></td>';
					for(let k = 1; k<=value; k++) {
						equipHtml += '<td class="text-center day'+k+'" id="'+equip002List[i].equipCd+"_"+k+'"></td>';
					}
					equipHtml += '<tr>';
					$('#planStopSomTable tbody').append(equipHtml);
				}
			}
		}
	}

	//설비 데이터 표시
	function equipSummaryTime() {
		console.log(moment(searchMonthVal).format('YYYYMM'))
		//월, 설비별 누적 시간 조회
	    $.ajax({
			url: '<c:url value="bm/planStopMonthSummaryList"/>',
            type: 'POST',
            async: false,
            data: {					
            	'searchMonth'	:	function(){return moment(searchMonthVal).format('YYYYMM');},
            	'stopType'		:	function(){return stopType;},
            	'equipCd'		:	function(){return equipCd;}
            },
            async : false,
            beforeSend: function() {
                //$('#my-spinner').show();
            },
            success: function (res) {
            	var data = res.data;
                for(var i=0;i<data.length;i++) {
					$('#'+data[i].equipCd+'Sum').text(data[i].sumTime);
                }
            }
		});

		//일, 설비별 누적 시간 조회
		$.ajax({
			url: '<c:url value="bm/planStopDaySummaryList"/>',
            type: 'POST',
            async: false,
            data: {					
            	'searchMonth'	:	function(){return moment(searchMonthVal).format('YYYYMM');},
            	'stopType'		:	function(){return stopType;},
            	'equipCd'		:	function(){return equipCd;}
            },
            async : false,
            beforeSend: function() {
                //$('#my-spinner').show();
            },
            success: function (res) {
            	var data = res.data;
                for(var i=0;i<data.length;i++) {
                    let equipDate = parseInt(data[i].stopDate.substr(6,2));
					$('#'+data[i].equipCd+'_'+equipDate).text(data[i].sumTime);
                }
            }
		});
	}

	function selectBoxAppend2(obj, id, sVal, flag, value)
	{
		if(value=='batch') {
			let selectHtml = '';
			
			if(flag == '1') {
				selectHtml += "<option value=''>"+ "전체" +"</option>";
		   	} else if(flag == '2') {
		   		selectHtml += "<option value=''>"+ "선택" +"</option>";
		   	}
		   	if(id=="batchEquipCd") {
		   		for(key in obj) {
					selectHtml += "<option value="+obj[key].equipCd+">"+obj[key].equipNm+"</option>";
				}
			} else {
				for(key in obj) {
					selectHtml += "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
				}
			}
			$('#' + id).empty();
			$('#' + id).append(selectHtml);
		} else {
			let selectHtml = '';
			if(id=='timeCode') {
				selectHtml += '<select id="'+id+value+'" name="'+id+'" onchange="selectUpdate(\''+value+'\', \'001\');" class="custom-select mw-100">';
			} else {
				selectHtml += '<select id="'+id+value+'" name="'+id+'" class="custom-select mw-100">';
			}
			
			
			if(flag == '1') {
				selectHtml += "<option value=''>"+ "전체" +"</option>";
		   	} else if(flag == '2') {
		   		selectHtml += "<option value=''>"+ "선택" +"</option>";
		   	}
		   	if(id=="equipCd") {
		   		for(key in obj) {
					var option;
					if(obj[key].equipCd == sVal ) {
						selectHtml += "<option value="+ obj[key].equipCd+ " selected>"+obj[key].equipNm+"</option>";
					} else {
						selectHtml += "<option value="+obj[key].equipCd+">"+obj[key].equipNm+"</option>";
					}
				}
			} else {
				for(key in obj) {
					var option;
					if(obj[key].baseCd == sVal ) {
						selectHtml += "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
					} else {
						selectHtml += "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
					}
				}
			}
			
			selectHtml += '</select>';
			return selectHtml;
		}
		
	}

	//disabled 처리
	function uiProc(flag) {
		$("select[name=equipCd]").attr("disabled", flag);
		$("input[name=stopDate]").attr("disabled", flag);
		$("select[name=timeCode]").attr("disabled", flag);
		$("input[name=startTime]").attr("disabled", flag);
		$("input[name=endTime]").attr("disabled", flag);

		if(flag) {
			$('input[name=startTime]').css({'background' : '#F6F7F9'});
			$('input[name=endTime]').css({'background' : '#F6F7F9'});
		} else {
			$('input[name=startTime]').css({'background' : '#FFFFFF'});
			$('input[name=endTime]').css({'background' : '#FFFFFF'});
		}
	}

	
	// 정지항목 change
	function selectUpdate(value, type) {
		if(type=="001") {
			let timeCodeValue = $('#timeCode'+value).val();

			$('#planStopTable').DataTable().$('tr.selected').find('div[name=startHtml]').empty();
			$('#planStopTable').DataTable().$('tr.selected').find('div[name=endHtml]').empty();
			
			if(timeCodeValue=='') {
			} else {
				let startTimeValue = '';
				let endTimeValue = '';
				
				if(stopType=='001') {
					for(let i=0; i<stopCode001.length; i++) {
						if(stopCode001[i].baseCd==timeCodeValue) {
							startTimeValue = stopCode001[i].etc1;
							endTimeValue = stopCode001[i].etc2;
						}
					}	
				} else {
					for(let i=0; i<stopCode002.length; i++) {
						if(stopCode002[i].baseCd==timeCodeValue) {
							startTimeValue = stopCode002[i].etc1;
							endTimeValue = stopCode002[i].etc2;
						}
					}
				}
				let startTimeHtml = '';
				let endTimeHtml = '';
				if(startTimeValue=='') {
					startTimeHtml += '<input type="time" class="form-control mw-100" name="startTime">';
					endTimeHtml += '<input type="time" class="form-control mw-100" name="endTime">';
				} else {
					let startHourValue = startTimeValue.substr(0, 2);
					let startMinuteValue = startTimeValue.substr(2, 2);
					let endHourValue = endTimeValue.substr(0, 2);
					let endMinuteValue = endTimeValue.substr(2, 2);
					startTimeHtml += '<input type="time" class="form-control mw-100" name="startTime" value="'+startHourValue + ":" + startMinuteValue +'" readonly>';
					endTimeHtml += '<input type="time" class="form-control mw-100" name="endTime" value="'+endHourValue + ":" + endMinuteValue +'" readonly>';
				}
				$('#planStopTable').DataTable().$('tr.selected').find('div[name=startHtml]').append(startTimeHtml);
				$('#planStopTable').DataTable().$('tr.selected').find('div[name=endHtml]').append(endTimeHtml);
			}
		} else {
			let timeCodeValue = $('#batchTimeCode').val();
			
			$('#batchStartHtml').empty();
			$('#batchEndHtml').empty();
			
			if(timeCodeValue=='') {
			} else {
				let startTimeValue = '';
				let endTimeValue = '';
				
				if(stopType=='001') {
					for(let i=0; i<stopCode001.length; i++) {
						if(stopCode001[i].baseCd==timeCodeValue) {
							startTimeValue = stopCode001[i].etc1;
							endTimeValue = stopCode001[i].etc2;
						}
					}	
				} else {
					for(let i=0; i<stopCode002.length; i++) {
						if(stopCode002[i].baseCd==timeCodeValue) {
							startTimeValue = stopCode002[i].etc1;
							endTimeValue = stopCode002[i].etc2;
						}
					}
				}
				let startTimeHtml = '';
				let endTimeHtml = '';
				if(startTimeValue=='') {
					startTimeHtml += '<input type="time" class="form-control mw-100" id="batchStartTime">';
					endTimeHtml += '<input type="time" class="form-control mw-100" id="batchEndTime">';
				} else {
					let startHourValue = startTimeValue.substr(0, 2);
					let startMinuteValue = startTimeValue.substr(2, 2);
					let endHourValue = endTimeValue.substr(0, 2);
					let endMinuteValue = endTimeValue.substr(2, 2);
					startTimeHtml += '<input type="time" class="form-control mw-100" id="batchStartTime" value="'+startHourValue + ":" + startMinuteValue +'" readonly>';
					endTimeHtml += '<input type="time" class="form-control mw-100" id="batchEndTime" value="'+endHourValue + ":" + endMinuteValue +'" readonly>';
				}
				console.log(startTimeHtml)
				console.log(endTimeHtml)
				$('#batchStartHtml').append(startTimeHtml);
				$('#batchEndHtml').append(endTimeHtml);
			}
		}
	}
	
	// 조회조건
	function equipSelectUpdate() {
		if($('#searchType').val()=='001') {
			$('#searchEquipCd').empty();
			let equipSelectHtml = '<option vlaue="">전체</option>';
			for(let i =0; i<equip001List.length; i++) {
				equipSelectHtml += '<option value="'+equip001List[i].equipCd+'">'+equip001List[i].equipNm+'</option>';
			}
			$('#searchEquipCd').append(equipSelectHtml);
		} else {
			selectBoxAppend(equip002List, "searchEquipCd", "", "2");
			$('#searchEquipCd').empty();
			let equipSelectHtml = '<option vlaue="">전체</option>';
			for(let i =0; i<equip002List.length; i++) {
				equipSelectHtml += '<option value="'+equip002List[i].equipCd+'">'+equip002List[i].equipNm+'</option>';
			}
			$('#searchEquipCd').append(equipSelectHtml);
		}
	}
</script>
</body>
</html>
