<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<style>
	@media all and (min-width: 951px) and (max-width: 1919px) {
		#dtlMain {
			grid-template-areas:	'view0001 view0001'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0002 view0002'
									'view0007 view0007'
									'view0007 view0007'
									'view0007 view0007'
									'view0003 view0004'
									'view0003 view0004'
									'view0003 view0004'
									'view0003 view0004'
									'view0003 view0004'
									'view0003 view0004'
									'view0005 view0006'
									'view0005 view0006'
									'view0005 view0006'
									'view0005 view0006'
									'view0005 view0006'
									'view0005 view0006'
									'view0008 view0008'
									'view0008 view0008'
									'view0008 view0008'
									'view0008 view0008' !important;
			grid-template-rows: repeat(32, 60px) !important;
			grid-template-columns: 1fr 1fr !important;
		}
	}
	
	@media all and (min-width: 0px) and (max-width: 950px) {
		#dtlMain {
			display: block !important;
		}
	}
</style>
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
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"	style="position: absolute; top: 10px; right:10px; color: #ffff00; cursor: pointer; font-size: 30px; margin-left: auto"></i>
		<div class="row" id="dtlMain" style="margin: 0px;
											height: calc(100vh - 55px); 
											background-color: #171823;
											position: relative;
											display: grid; padding: 5px;
											grid-template-areas:	'view0001 . . .'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0003 view0004'
																	'view0002 view0002 view0005 view0006'
																	'view0002 view0002 view0005 view0006'
																	'view0002 view0002 view0005 view0006'
																	'view0002 view0002 view0005 view0006'
																	'view0002 view0002 view0005 view0006'
																	'view0002 view0002 view0005 view0006'
																	'view0007 view0007 view0008 view0008'
																	'view0007 view0007 view0008 view0008'
																	'view0007 view0007 view0008 view0008';
											grid-template-rows: repeat(16, calc((100vh - 55px)/16));
											grid-template-columns: repeat(4, 1fr);
											overflow: auto;">
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center h-100" style="border: 1px solid #ffffffbb;">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 2rem;">
						<thead>
							<tr>
								<th class="text-center align-middle">기준년도</th>
								<th class="text-center align-middle standardYear"></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; text-align: center; border-radius: 5px;" >
	    		<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ffffffbb; padding: 5px;">
					<div style="position: relative; width:100%;">
						<canvas id="monthStatus"></canvas>
    				</div>
    			</div>
		    </div>
		    <div class="gridView" id="view0007" style="grid-area: view0007; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center" style="border: 1px solid #ffffffbb;">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;" id="powerTable">
						<thead>
							<tr>
								<th class="text-center align-middle standardYear"></th>
								<th class="text-center align-middle">1월</th>
								<th class="text-center align-middle">2월</th>
								<th class="text-center align-middle">3월</th>
								<th class="text-center align-middle">4월</th>
								<th class="text-center align-middle">5월</th>
								<th class="text-center align-middle">6월</th>
								<th class="text-center align-middle">7월</th>
								<th class="text-center align-middle">8월</th>
								<th class="text-center align-middle">9월</th>
								<th class="text-center align-middle">10월</th>
								<th class="text-center align-middle">11월</th>
								<th class="text-center align-middle">12월</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ffffffbb; padding: 5px;">
					<div style="position: relative; width:100%;">
						<canvas id="laserTempStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ffffffbb; padding: 5px;">
					<div style="position: relative; width:100%;">
						<canvas id="laserHumiStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ffffffbb; padding: 5px;">
					<div style="position: relative; width:100%;">
						<canvas id="afterProcessTempStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0006" style="grid-area: view0006; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ffffffbb; padding: 5px;">
					<div style="position: relative; width:100%;">
						<canvas id="afterProcessHumiStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0008" style="grid-area: view0008; margin: 5px; text-align: center; border-radius: 5px;" >
				<div class="row justify-content-center" style="border: 1px solid #ffffffbb;">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;" id="tempTable">
						<thead>
							<tr>
								<th class="text-center align-middle standardDay"></th>
								<td class="text-center align-middle">0시</td>
								<td class="text-center align-middle">1시</td>
								<td class="text-center align-middle">2시</td>
								<td class="text-center align-middle">3시</td>
								<td class="text-center align-middle">4시</td>
								<td class="text-center align-middle">5시</td>
								<td class="text-center align-middle">6시</td>
								<td class="text-center align-middle">7시</td>
								<td class="text-center align-middle">8시</td>
								<td class="text-center align-middle">9시</td>
								<td class="text-center align-middle">10시</td>
								<td class="text-center align-middle">11시</td>
								<td class="text-center align-middle">12시</td>
								<td class="text-center align-middle">13시</td>
								<td class="text-center align-middle">14시</td>
								<td class="text-center align-middle">15시</td>
								<td class="text-center align-middle">16시</td>
								<td class="text-center align-middle">17시</td>
								<td class="text-center align-middle">18시</td>
								<td class="text-center align-middle">19시</td>
								<td class="text-center align-middle">20시</td>
								<td class="text-center align-middle">21시</td>
								<td class="text-center align-middle">22시</td>
								<td class="text-center align-middle">23시</td>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
    	</div>
	</div>
<script>

   	let laserTempData;			// 레이저 온도 데이터
   	let laserHumiData;			// 레이저 습도 데이터
   	let afterProcessTempData;	// 후가공 온도 데이터
   	let afterProcessHumiData;	// 후가공 습도 데이터

   	let laserTempDataArr = new Array(24).fill(null);		// 레이저 온도 데이터 배열 
   	let laserHumiDataArr = new Array(24).fill(null);		// 레이저 습도 데이터 배열
   	let afterProcessTempDataArr = new Array(24).fill(null);	// 후가공 온도 데이터 배열
   	let afterProcessHumiDataArr = new Array(24).fill(null);	// 후가공 습도 데이터 배열

   	let laserData;
   	let afterProcessData;
   
   	let laserDataM;				// 레이저 공장동 데이터 (월)
   	let afterProcessDataM;		// 후가공 공장동 데이터 (월)
   	
   	let laserDataArr = new Array();						// 레이저 공장동 전기 사용량 데이터
   	let laserDataArrM = new Array(12).fill(0);			// 레이저 공장동 월별 전기 사용량 데이터
   	let afterProcessDataArr = new Array();				// 후가공 공장동 전기 사용량 데이터
   	let afterProcessDataArrM = new Array(12).fill(0);	// 후가공 공장동 월별 전기 사용량 데이터
   	
   	let timeArr = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'];
   	let monthArr = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];

   	let rangeArr = new Array();		// 최댓값 최솟값 배열
	<c:forEach items="${tempHumiRangeCd}" var="info">
	var json = new Object();
	json.min = "${info.etc2}";
	json.max = "${info.etc3}";
	rangeArr.push(json);
	</c:forEach>
	
	$(document).ready(function() {
		$(".standardYear").append(moment().format("YYYY년"));
		$(".standardDay").append(moment().format("MM월DD일"));
		
		// 온습도 데이터 가져오기
        $.ajax({
			url : 'mt/controllSystemLaserList',
			type : 'post',
			async : false,
			data : {
				'startDate' : function() { return moment().format("YYYY-MM-DD"); },
				'endDate'  	: function() { return moment().subtract(-1, 'd').format("YYYY-MM-DD"); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					
					$.each(res.data, function(index, item) {
						laserHumiDataArr[item.beDate] = item == undefined || item == '' ? null : parseFloat(item.laserRoomHumi) / 10;
						laserTempDataArr[item.beDate] = item == undefined || item == '' ? null : parseFloat(item.laserRoomTemp) / 10;
					});
// 					laserTempData = _.filter(data, {'factoryGubun' : '001', 'beCd' : '003'});
// 					laserHumiData = _.filter(data, {'factoryGubun' : '001', 'beCd' : '002'});

// 					laserTempData = _.groupBy(laserTempData, 'beDateHour');
// 					laserHumiData = _.groupBy(laserHumiData, 'beDateHour');
					
// 					$.each(timeArr, function(index, item) {
// 						laserTempData[item] = _.maxBy(laserTempData[item], 'beDate');
// 						laserHumiData[item] = _.maxBy(laserHumiData[item], 'beDate');
						
// 						laserTempDataArr[index] = laserTempData[item] == undefined || laserTempData[item] == '' ? null : parseFloat(laserTempData[item].beData);
// 						laserHumiDataArr[index] = laserHumiData[item] == undefined || laserHumiData[item] == '' ? null : parseFloat(laserHumiData[item].beData);
// 					});

					makeLaserTempStatus();
					makeLaserHumiStatus();
				} else {
					toastr.error(res.message);
				}
			},
		});

    	// 온습도 데이터 가져오기
		$.ajax({
			url : 'mt/controllSystemFinishList',
			type : 'post',
			async : false,
			data : {
				'startDate' : function() { return moment().format("YYYY-MM-DD"); },
				'endDate'  	: function() { return moment().subtract(-1, 'd').format("YYYY-MM-DD"); },
			},
			success : function(res) {
				
				$.each(res.data, function(index, item) {
					afterProcessHumiDataArr[item.beDate] = item == undefined || item == '' ? null : parseFloat(item.airCondHumi);
					afterProcessTempDataArr[item.beDate] = item == undefined || item == '' ? null : parseFloat(item.airCondTemp) / 10;
				});
				
				makeAfterProcessHumiStatus();
				makeAfterProcessTempStatus();
			}
		});

     	// 전기사용량 데이터 가져오기
        $.ajax({
			url : 'mt/controllSystemList',
			type : 'post',
			async : false,
			data : {
				'beDate'  	: function() { return moment().format('YYYY'); },
				'beCd' 		: function() { return '001'; },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					laserData = _.filter(data, {'factoryGubun' : '001'});
					afterProcessData = _.filter(data, {'factoryGubun' : '002'});
					
					laserDataM = _.groupBy(laserData, 'beDateMonth')
					afterProcessDataM = _.groupBy(afterProcessData, 'beDateMonth')
					
					$.each(monthArr, function(index, item) {
						laserDataM[item] = _.groupBy(laserDataM[item], 'beDateDay');
						afterProcessDataM[item] = _.groupBy(afterProcessDataM[item], 'beDateDay');
					});
					
					$.each(monthArr, function(index, month) {
						for(let i = 1; i <= new Date(moment().format("YYYY"), month, 0).getDate(); i++) {
							let day = makeZero(i);
							laserDataM[month][day] = _.groupBy(laserDataM[month][day], 'beDateHour');
							afterProcessDataM[month][day] = _.groupBy(afterProcessDataM[month][day], 'beDateHour');
						};
					});

					$.each(monthArr, function(indexM, month) {
						for(let i = 1; i <= new Date(moment().format("YYYY"), month, 0).getDate(); i++) {
							let day = makeZero(i);
							$.each(timeArr, function(index, time) {
								laserDataM[month][day][time] = _.maxBy(laserDataM[month][day][time], 'beDate');
								afterProcessDataM[month][day][time] = _.maxBy(afterProcessDataM[month][day][time], 'beDate');
	
								if (moment().format('MM') == month && moment().format('DD') == day) {
									laserDataArr.push(laserDataM[month][day][time] == undefined ? null : parseFloat(laserDataM[month][day][time].beData));
									afterProcessDataArr.push(afterProcessDataM[month][day][time] == undefined ? null : parseFloat(afterProcessDataM[month][day][time].beData));
								}
	
								laserDataArrM[indexM] += parseFloat(laserDataM[month][day][time] == undefined ? 0 : laserDataM[month][day][time].beData)
								afterProcessDataArrM[indexM] += parseFloat(afterProcessDataM[month][day][time] == undefined ? 0 : afterProcessDataM[month][day][time].beData)
							});
						};
						if (laserDataArrM[indexM] == 0) {
							laserDataArrM[indexM] = null;
						} else {
							laserDataArrM[indexM] = parseFloat((laserDataArrM[indexM]).toFixed(2));
						}
						if (afterProcessDataArrM[indexM] == 0) {
							afterProcessDataArrM[indexM] = null;
						} else {
							afterProcessDataArrM[indexM] = parseFloat((afterProcessDataArrM[indexM]).toFixed(2));
						}
					});
					makeMonthStatus();
				} else {
					toastr.error(res.message);
				}
			},
		});
	});
	  	
	function getIndexList(cnt, postFix) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			result.push((i+1)+postFix);
		}
		return result;
	}
	
	// 난수 랜덤 출력
	function getLaserElecList(cnt, max, min) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			let data = Math.random() * (max - min) + min;
			result.push(data.toFixed(2));
		}
		return result;
	}
	   
	   Chart.defaults.backgroundColor = '#181b1f';
	   Chart.defaults.borderColor = '#ccccdc12';
	   Chart.defaults.color = '#ffffff';

	// 레이저 공장동(온도)
	function makeLaserTempStatus() { 
		const laserTempStatus = new Chart(
			document.getElementById('laserTempStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#f2cc0c',
						borderColor: '#f2cc0c',
						data: laserTempDataArr,
					}]
				},
				options: {
					responsive: true,
					scales: {
			            y: {
			            	grid: {
								display: false,
							},
			                suggestedMin: 00,
			                suggestedMax: 40
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[2].min,
							        yMax: rangeArr[2].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[2].max,
							        yMax: rangeArr[2].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '레이저 공장동(온도)',
							font: {
								size: 20
							}
						},
						datalabels : {
							font : {
								size : 10
							}
						}
					},
				},
			}
		);

		//테이블에 행 추가
		let appendTr = '<tr>';
		appendTr += '<th>온도(L)</th>';
		$.each(laserTempDataArr, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#tempTable").append(appendTr);
		
	}
	
	// 후가동 공장동(온도)
	function makeAfterProcessTempStatus() {
		const afterProcessTempStatus = new Chart(
			document.getElementById('afterProcessTempStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: '°C',
						backgroundColor: '#f2cc0c',
						borderColor: '#f2cc0c',
						data: afterProcessTempDataArr,
					}]
				},
				options: {
					responsive: true,
					scales: {
			            y: {
			                suggestedMin: 00,
			                suggestedMax: 40
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[5].min,
							        yMax: rangeArr[5].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[5].max,
							        yMax: rangeArr[5].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '후가공 공장동(온도)',
							font: {
								size: 20
							}
						},
						datalabels : {
							font : {
								size : 10
							}
						}
					}
				}
			}
		);

		//테이블에 행 추가
		let appendTr = '<tr>';
		appendTr += '<th>온도(C)</th>';
		$.each(afterProcessTempDataArr, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#tempTable").append(appendTr);
	}

	// 레이저 공장동(습도)
	function makeLaserHumiStatus() {
		const laserHumiStatus = new Chart(
			document.getElementById('laserHumiStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: '%',
						backgroundColor: '#609fd2',
						borderColor: '#5195ce',
						data: laserHumiDataArr,
					}]
				},
				options: {
					responsive: true,
					scales: {
			            y: {
			                suggestedMin: 00,
			                suggestedMax: 100
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[1].min,
							        yMax: rangeArr[1].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[1].max,
							        yMax: rangeArr[1].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '레이저 공장동(습도)',
							font: {
								size: 20
							}
						},
						datalabels : {
							font : {
								size : 10
							}
						}
					}
				}
			}
		);

		//테이블에 행 추가
		let appendTr = '<tr>';
		appendTr += '<th>습도(L)</th>';
		$.each(laserHumiDataArr, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#tempTable").append(appendTr);
	}

	// 후가동 공장동(습도)
	function makeAfterProcessHumiStatus() {
		const afterProcessHumiStatus = new Chart(
			document.getElementById('afterProcessHumiStatus'),
			{
				type: 'line',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: '%',
						backgroundColor: '#609fd2',
						borderColor: '#5195ce',
						data: afterProcessHumiDataArr,
					}]
				},
				options: {
					responsive: true,
					scales: {
			            y: {
			                suggestedMin: 00,
			                suggestedMax: 100
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							    	yMin: rangeArr[4].min,
							        yMax: rangeArr[4].min,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: rangeArr[4].max,
							        yMax: rangeArr[4].max,
							        borderColor: '#25f325',
							        borderWidth: 2,
					        	},
					      	}
					    },
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '후가공 공장동(습도)',
							font: {
								size: 20
							}
						},
						datalabels : {
							font : {
								size : 10
							}
						}
					}
				}
			}
		);

		//테이블에 행 추가
		let appendTr = '<tr>';
		appendTr += '<th>습도(C)</th>';
		$.each(afterProcessHumiDataArr, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#tempTable").append(appendTr);
	}

	// 전체 공장동
    function makeMonthStatus() {
		let momentStatusData = [laserDataArrM, afterProcessDataArrM];
		const monthStatus = new Chart(
			document.getElementById('monthStatus'),
			{
				type: 'bar',
				data: {
					labels: getIndexList(12, '월'),
					datasets: [{
						label: '레이저공장동(kWh)',
						backgroundColor: '#f3586a',
						borderColor: '#f24055',
						data: laserDataArrM,
					},
					{
						label: '후가공공장동(kWh)',
						backgroundColor: '#609fd2',
						borderColor: '#5195ce',
						data: afterProcessDataArrM,
					}
					]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '전체 공장동',
							font: {
								size: 20
							}
						}
					}
				}
			}
		);

		//테이블에 행 추가
		//레이저
		let appendTr = '<tr>';
		appendTr += '<td>레이저</td>';
		$.each(laserDataArrM, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#powerTable").append(appendTr);

		//후가공
		appendTr = '<tr>';
		appendTr += '<td>후가공</td>';
		$.each(afterProcessDataArrM, function(index, item) {
			if (item != null) {
				appendTr += '<td>'+item+'</td>';
			} else {
				appendTr += '<td>-</td>';
			}
		})
		appendTr += '</tr>';
		$("#powerTable").append(appendTr);
		
// 		$('#monthStatusTable').find('tr').eq(1).find('td').eq(1).text(new Intl.NumberFormat('ko').format(_.sum(momentStatusData[0])));
// 		for(var i=0;i<momentStatusData[0].length;i++) {
// 			$('#monthStatusTable').find('tr').eq(1).find('td').eq(i+2).text(momentStatusData[0][i]);
// 		}
// 		$('#monthStatusTable').find('tr').eq(2).find('td').eq(1).text(new Intl.NumberFormat('ko').format(_.sum(momentStatusData[1])));
// 		for(var i=0;i<momentStatusData[1].length;i++) {
// 			$('#monthStatusTable').find('tr').eq(2).find('td').eq(i+2).text(momentStatusData[1][i]);
// 		}
    }

	function makeZero(data) {
		if (data < 10)
			return "0" + data;
		else
			return data;
	}
</script>
</body>
</html>