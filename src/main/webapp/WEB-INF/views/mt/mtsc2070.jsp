<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<body>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
	<div class="container-fluid"
		style="position: relative; background-color: #111217;
			height: 100vh; width: 100vw;
			padding: 50px 0px 0px 0px;">
		
		<!-- 닫기 버튼 -->
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"
			style="position: absolute; top: 10px; right: 10px;
					color: #ffff00; cursor: pointer; font-size: 30px;"></i>
		<div class="row" id="dtlMain" style="margin: 0px;
											height: calc(100vh - 55px); 
											background-color: #171823;
											position: relative;
											display: grid; padding: 5px;
											grid-template-areas:	'view0001'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002'
																	'view0002';
											grid-template-rows: repeat(13, calc((100vh - 55px - 13px)/13));
											grid-template-columns: 1fr;
											overflow: auto;">
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div style="flex: 0 0 auto; width: 100%; height: 100%;">
					<div class="progress" id="equipStatus" style="height: 100%; font-size: 1.5rem;"></div>
				</div>
			</div>
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div style="flex: 0 0 auto; width: 100%; height: 100%; overflow: auto;">
					<table class="table table-bordered table-dark p-0" id="equipStatusTable" style="font-size: 1.5rem;">
						<colgroup>
							<col width="30%">
							<col width="15%">
							<col width="25%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr style="height: 3.5rem;">
								<th class="text-center align-middle">No</th>
								<th class="text-center align-middle">라인명</th>
								<th class="text-center align-middle">현재진행</th>
								<th class="text-center align-middle">작업량</th>
								<th class="text-center align-middle">일누적량</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script>

	let equipList = [];
	let equipStatus = [0, 0, 0, 0, 0];

	// 설비 목록조회
	function getEquipList() {
		let result = [];
		$.ajax({
			url: '<c:url value="bm/equipCodeAdmList"/>',
            type: 'GET',
            async: false,
            data: {
				'mainGubun' : function(){return '001';},
				'prcNm' : function(){return '002';},
				'equipGubun' : function(){return '001';},
				'listGubun' : function(){return '002';},
			},
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	//APS 기간별 계획목록조회
	function getAdvPlanScheduleLstByDate(startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="wm/advPlanScheduleLstByDate"/>',
	        type: 'POST',
	        async: false,
	        data: {
	        	'prcNm'		: '002',
	        	'startDate' : startDate,
	        	'endDate'	: endDate
	        },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}
	
	// APS 기간별 계획목록조회
	function getAdvPlanScheduleLstByStartEndDate(data) {
		let result = '';
		$.ajax({
			url: '<c:url value="wm/advPlanScheduleLstByStartEndDate"/>',
	        type: 'POST',
	        async: false,
	        data: {
	            'idx'			: data.idx,
	        	'planStartDate'	: data.planStartDate,
	        	'planEndDate'	: data.planEndDate,
	        	'planEquipCd'	: data.planEquipCd,
	        },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}
	
	// 계획정지 기간별 목록조회
	function getPlanStopLstByDateGroup(equipCd, startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="bm/planStopLstByDateGroup"/>',
	        type: 'POST',
	        async: false,
	        data: {
	            'equipCd'	: equipCd,
	        	'startDate' : startDate,
	        	'endDate'	: endDate
	        },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}
	
	// 공장력 기간별 목록조회
	function getFactoryCalendarLstByDate(startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="bm/factoryCalendarListByDate"/>',
	        type: 'POST',
	        async: false,
	        data: {
	            'factoryType'	: '002',
	        	'startDate'		: startDate,
	        	'endDate'		: endDate
	        },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	function makeTbody(data) {
		let equipCd = data.equipCd;
		let equipNm = data.equipNm;

		let html = '';
			html += '';
			html += '<tr id="'+equipCd+'">';
			html += '	<td rowspan="2" class="text-center align-middle">';
			html += '		<img src="/resources/assets/monitoring/img/finish_equip_img.png?ver=1.0" style="height: 100%; width: 50%;">';
			html += '	</td>';
			html += '	<td rowspan="2" class="text-center align-middle" id="'+equipCd+'_equipNm">'+equipNm+'</td>';
			html += '	<td class="text-center align-middle" id="'+equipCd+'_itemNm">-</td>';
			html += '	<td rowspan="2" class="text-center align-middle" id="'+equipCd+'_workQty">-</td>';
			html += '	<td rowspan="2" class="text-center align-middle" id="'+equipCd+'_dailyQty">-</td>';
			html += '</tr>';
			html += '<tr>';
			html += '	<td class="text-center align-middle" id="'+equipCd+'_workOrdNo"></td>';
			html += '</tr>';
			
		return html;
	}

	// 설비 가동/비가동 현황 조회
	function getEquipStatusList() {
		// schedule 목록
		let orderList = [];

		// 기간별 계획목록 조회
		let assignLst = getAdvPlanScheduleLstByDate(moment().format('YYYYMMDD0000'), moment().format('YYYYMMDD2359'));
		
		// 기간별 계획정지 목록조회
		let planStopLst = getPlanStopLstByDateGroup('', moment().format('YYYYMMDD0000'), moment().format('YYYYMMDD2359'));
		
		// 기간별 공장력 목록조회
		let factCalLst = getFactoryCalendarLstByDate(moment().format('YYYYMMDD'), moment().format('YYYYMMDD'));

		// CAPA 계산
		let capaList = [];
		
		// 공장력 시간 기록
		for(var i=0;i<factCalLst.length;i++) {
			let data = factCalLst[i];
			for(var j=0;j<equipList.length;j++) {
				let equipData = equipList[j];
				let obj = {};
				obj.equipCd = equipData.equipCd;
				obj.planDate = data.factoryDate;
				obj.startDatetime = data.startTime;
				obj.endDatetime = data.endTime;
				obj.totalCapa = parseInt(data.runningTime) * 60; // 분단위로 입력
				obj.workingCapa = 0;
				obj.dtlOrdCnt = 0;
				capaList.push(obj);
			}
		}

		// 계획정지 시간 기록
		for(var i=0;i<planStopLst.length;i++) {
			let data = planStopLst[i];
			let equipCd = data.equipCd;
			let planDate = moment(data.startDatetime,'YYYYMMDDHHmmss').format('YYYYMMDD');
			let stopTime = moment(data.endDatetime,'YYYYMMDDHHmmss').diff(moment(data.startDatetime,'YYYYMMDDHHmmss'), 'm');
			let index = _.findIndex(capaList, function(v) { return v.equipCd == equipCd && v.planDate == planDate; });
			if(index != -1) {
				capaList[index].totalCapa = capaList[index].totalCapa - stopTime;
			}
		}

		for(var i=0;i<assignLst.length;i++) {
			let data = assignLst[i];
			let obj = {};
			obj.idx = data.idx;
			obj.contDtlNo = data.contDtlNo;
			obj.shipReqDate = data.shipReqDate;
			obj.dtlOrdCnt = data.planQty;
			obj.equipCd = data.planEquipCd;
			obj.planStartDate = data.planStartDate;
			obj.planEndDate = data.planEndDate;
			obj.ordState = data.planState;
			obj.readyTime = data.readyTime;
			obj.processTime = data.processTime;
			obj.itemSeq = data.itemCd;
			obj.itemNm = data.itemNm;
			obj.dealCorpNm = data.dealCorpNm;
			orderList.push(obj);
		}

		let date = moment().format('YYYY-MM-DD');
		for(var i=0;i<orderList.length;i++) {
			let data = orderList[i];
			let equipData = _.filter(equipList, function(v) { return v.equipCd == data.equipCd; })[0];
			let index = _.findIndex(capaList, function(v) { return v.equipCd == equipData.equipCd; });
			if(index != -1) {
				// 현재일 공장력 정보
				let factoryData = factCalLst[0];
				let workingCapa = 0;
				let dtlOrdCnt = 0;
				// console.log(date);
				// console.log(data.equipCd);
				// 계획 시작일과 종료일이 현재일자에 포함되지 않을 경우
				if(moment(moment(date).format('YYYYMMDD0000'),'YYYYMMDD0000').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0 &&
					moment(moment(date).format('YYYYMMDD2359'),'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) <= 0) {
					// console.log("계획 시작일과 종료일이 현재일자에 포함되지 않을 경우");

					// 가동시간
					workingCapa = moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
				}
				// 계획 시작일이 현재일자에 포함되지 않을 경우 -> 계획 마지막날
				else if(moment(moment(date).format('YYYYMMDD0000'),'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0) {
					// console.log("계획 시작일이 현재일자에 포함되지 않을 경우 -> 계획 마지막날");

					// 계획 시작일이 공장력 시작일시 이후일 경우
					if(moment(data.planStartDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm')) >= 0) {
						// 가동시간
						workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
					} else {
						// 가동시간
						workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
					}
					// 가동시간
					workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
				}
				// 계획 종료일이 현재일자에 포함되지 않을 경우 -> 계획 첫날
				else if(moment(moment(date).format('YYYYMMDD2359'),'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) <= 0) {
					// console.log("계획 종료일이 현재일자에 포함되지 않을 경우 -> 계획 첫날");

					// 계획 종료일이 공장력 종료일시 이전일 경우
					if(moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) >= 0) {
						// 가동시간
						workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
					} else {
						// 가동시간
						workingCapa = moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
					}
				}
				// 계획이 하루짜리일 경우
				else {
					// console.log("계획이 하루짜리일 경우");
					// 가동시간
					workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
				}
				let stopList = _.filter(planStopLst, function(v) { return v.equipCd == data.equipCd && moment(v.startDatetime,'YYYYMMDDHHmmss').format('YYYYMMDD') == moment(date).format('YYYYMMDD')});
				// console.log(stopList);
				let stopTime = 0;
				for(var s=0;s<stopList.length;s++) {
					let stopData = stopList[s];
					if(moment(stopData.startDatetime,'YYYYMMDDHHmmss').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0 && moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(stopData.endDatetime,'YYYYMMDDHHmmss')) >= 0) {
						stopTime = stopTime + moment(stopData.endDatetime,'YYYYMMDDHHmmss').diff(moment(stopData.startDatetime,'YYYYMMDDHHmmss'), 'm');
					}
				}
				
				// console.log('workingCapa: '+workingCapa);
				// console.log('stopTime: '+stopTime);
				capaList[index].workingCapa = capaList[index].workingCapa + workingCapa - stopTime;

				// 가공수량
				if(moment(moment(date).format('YYYYMMDD0000'),'YYYYMMDD0000').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0 &&
					moment(moment(date).format('YYYYMMDD2359'),'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) <= 0) {
					dtlOrdCnt = (workingCapa - stopTime - parseInt(data.readyTime))/parseInt(data.processTime)*60;
				} else {
					dtlOrdCnt = (workingCapa - stopTime)/parseInt(data.processTime)*60;
				}
				// console.log(capaList[index].dtlOrdCnt);
				capaList[index].dtlOrdCnt = capaList[index].dtlOrdCnt + Math.floor(dtlOrdCnt);
				// console.log('dtlOrdCnt: '+Math.floor(dtlOrdCnt));
			}
		}

		$.ajax({
			url: '<c:url value="mt/packingOperInfoTodayData"/>',
            type: 'POST',
            data: {
			},
			success : function(res) {
				let startData = res.data[0];
				let recentData = JSON.parse(res.packing);
				let RT_data = {};
				RT_data.workOrdNo = startData.workOrdNo;
				RT_data.equipNm = startData.equipNm;
				RT_data.itemNm = startData.itemNm;

				// 충진
				RT_data.fillOutputCount = parseInt(recentData.FillOutputCount) - parseInt(startData.fillOutputCount); // 충진 실적수량

				// 중량
				RT_data.wchkExNgCount = parseInt(recentData.WchkExNgCount) - parseInt(startData.wchkExNgCount); // 중량 금속검출 및 이중진입개수
				RT_data.wchkNgCount = parseInt(recentData.WchkNgCount) - parseInt(startData.wchkNgCount); // 중량 NG개수

				// 캡핑
				RT_data.capOutputCount = parseInt(recentData.CapOutputCount) - parseInt(startData.capOutputCount); // 캡핑 실적수량
				RT_data.capUnit = parseInt(recentData.CapUnit) - parseInt(startData.capUnit); // 캡핑 포장단위

				// 로봇
				RT_data.boxOutputCount = parseInt(recentData.ArticulRobotOutputCount) - parseInt(startData.articulRobotOutputCount); // 로봇 적재 실적수량

				equipStatus = [0, 0, 0, 0, 0];
				for(var i=0;i<equipList.length;i++) {
					let equipData = equipList[i];
					let equipCd = equipData.equipCd;
					let equipNm = equipData.equipNm;
					let targetQty = 8000;

					if(recentData.FillStartSignal == '0') {
						equipStatus[4]++;
						$('#'+equipCd).find('td').eq(0).css('background-color','#323539');
					} else if(recentData.FillStartSignal == '1') {
						equipStatus[0]++;
						$('#'+equipCd).find('td').eq(0).css('background-color','#009676');
					}

					$('#'+equipCd+'_equipNm').text(equipNm);
					$('#'+equipCd+'_itemNm').text(RT_data.itemNm);
					$('#'+equipCd+'_workOrdNo').text(RT_data.workOrdNo);

					// 충진
					let fillOutputCount = RT_data.fillOutputCount;
					let fillFaultyCount = 0;
					let fillFairCount = fillOutputCount - fillFaultyCount;
					let fillCountPer = ((fillFairCount) / targetQty * 100).toFixed(1)+'%';

					// 가동 비가동 현황
					let dtlOrdCnt = _.filter(capaList, function(v) { return v.equipCd == equipData.equipCd; })[0].dtlOrdCnt;

					$('#'+equipCd+'_workQty').html(addCommas(fillOutputCount) + ' / ' + addCommas(parseInt(dtlOrdCnt)) + '<br> ( ' + ((fillOutputCount) / parseInt(dtlOrdCnt) * 100).toFixed(1)+'% )');
					$('#'+equipCd+'_dailyQty').html(addCommas(fillOutputCount));
				}

				for(var i=0;i<equipStatus.length;i++) {
					// 가동중
					if(i == 0) {
						$('#equipStatus_'+i).text('가동중('+equipStatus[i]+')');
					} else if(i == 1) { // 일시정지
						$('#equipStatus_'+i).text('일시정지('+equipStatus[i]+')');
					} else if(i == 2) { // 중지
						$('#equipStatus_'+i).text('중지('+equipStatus[i]+')');
					} else if(i == 3) { // 측정중
						$('#equipStatus_'+i).text('측정중('+equipStatus[i]+')');
					} else if(i == 4) { // 비가동
						$('#equipStatus_'+i).text('비가동('+equipStatus[i]+')');
					}
				}
			}
		});
	}

	$(document).ready(function() {
		equipList = getEquipList();
		equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비 목록
		
		$('#equipStatusTable').find('tbody').empty();
		
		for(var i=0;i<equipList.length;i++) {
			let equipData = equipList[i];
			$('#equipStatusTable').find('tbody').append(makeTbody(equipData))
		}

		// 설비 상태별 항목표시
		
		$('#equipStatus').empty();
		for(var i=0;i<equipStatus.length;i++) {
			// 가동중
			if(i == 0) {
				$('#equipStatus').append('<div class="progress-bar" id="equipStatus_'+i+'" style="width: 100%; color: #ffffff; background-color: #009676;">가동중(0)</div>');
			} else if(i == 1) { // 일시정지
				$('#equipStatus').append('<div class="progress-bar" id="equipStatus_'+i+'" style="width: 100%; color: #000000; background-color: #ffff00;">일시정지(0)</div>');
			} else if(i == 2) { // 중지
				$('#equipStatus').append('<div class="progress-bar" id="equipStatus_'+i+'" style="width: 100%; color: #000000; background-color: #ff7f00;">중지(0)</div>');
			} else if(i == 3) { // 측정중
				$('#equipStatus').append('<div class="progress-bar" id="equipStatus_'+i+'" style="width: 100%; color: #000000; background-color: #00ff00;">측정중(0)</div>');
			} else if(i == 4) { // 비가동
				$('#equipStatus').append('<div class="progress-bar" id="equipStatus_'+i+'" style="width: 100%; color: #ffffff; background-color: #323539;">비가동(0)</div>');
			}
		}

		
		getEquipStatusList();
	});

	setInterval(function() { getEquipStatusList(); }, 5000); // 가동 비가동 현황
</script>
</body>
</html>