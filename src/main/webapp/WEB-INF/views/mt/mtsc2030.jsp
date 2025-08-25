<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<style>
	::-webkit-calendar-picker-indicator {
       filter: invert(1);
   }
	@media all and (min-width: 951px) and (max-width: 1919px) {
		#dtlMain {
			grid-template-areas:	'view0001 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0004'
									'view0002 view0004'
									'view0002 view0004'
									'view0002 view0004'
									'view0002 view0005'
									'view0002 view0005'
									'view0002 view0005'
									'view0002 view0005'
									'view0002 view0006'
									'view0002 view0006'
									'view0002 view0006'
									'view0002 view0006';
			grid-template-rows: repeat(16, calc((100vh - 55px - 13px)/16));
			grid-template-columns: 2.5fr 7.5fr;
		}
	}
	
	@media all and (min-width: 0px) and (max-width: 950px) {
		#dtlMain {
			grid-template-areas:	'leftcolT'
									'leftcolM'
									'leftcolM'
									'leftcolM'
									'leftcolM'
									'leftcolM'
									'leftcolM'
									'rightcolT'
									'rightcolT'
									'rightcolT'
									'rightcolT'
									'rightcolT'
									'rightcolM'
									'rightcolM'
									'rightcolM'
									'rightcolM'
									'rightcolM'
									'rightcolB'
									'rightcolB'
									'rightcolB'
									'rightcolB'
									'rightcolB' !important;
			grid-template-rows: repeat(22, 40px) !important;
			grid-template-columns: 1fr !important;
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
											grid-template-areas:	'view0001 view0003'
																	'view0002 view0003'
																	'view0002 view0003'
																	'view0002 view0003'
																	'view0002 view0004'
																	'view0002 view0004'
																	'view0002 view0004'
																	'view0002 view0004'
																	'view0002 view0005'
																	'view0002 view0005'
																	'view0002 view0005'
																	'view0002 view0005'
																	'view0002 view0006'
																	'view0002 view0006'
																	'view0002 view0006'
																	'view0002 view0006';
											grid-template-rows: repeat(16, calc((100vh - 55px - 13px)/16));
											grid-template-columns: 2.5fr 7.5fr;
											overflow: auto;">
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<thead>
							<tr>
								<th class="text-center align-middle">생산일자</th>
								<th class="text-center align-middle">
									<input type="date" class="form-control h-100" max="9999-12-31" style="border:none; background-color:#212529; color:#ffffff; font-size: 1.5rem;" id="searchRegDate">
								</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark table-hover p-0 m-0" style="font-size: 1rem;" id='finishOperInfoTable'>
					<thead>
						<tr style="height: 2.5rem;">
							<th class="text-center align-middle">설비명</th>
							<th class="text-center align-middle">작지번호</th>
							<th class="text-center align-middle">제품명</th>
							<th class="text-center align-middle">수량</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="finishTempStatusDiv">
						<canvas id="finishTempStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="finishPressStatusDiv">
						<canvas id="finishPressStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="finishTimeStatusDiv">
						<canvas id="finishTimeStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="view0006" style="grid-area: view0006; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100" style="overflow: auto;">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1rem;" id="finishOperInfoDtlTable">
					<thead>
						<tr style="height: 2.5rem;">
							<th class="text-center align-middle">설비명</th>
							<th class="text-center align-middle">작지번호</th>
							<th class="text-center align-middle">세부작지번호</th>
							<th class="text-center align-middle">제품명</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">전송시간</th>
							<th class="text-center align-middle">온도기준</th>
							<th class="text-center align-middle">온도값</th>
							<th class="text-center align-middle">온도값</th>
							<th class="text-center align-middle">온도값</th>
							<th class="text-center align-middle">온도값</th>
							<th class="text-center align-middle">NG</th>
							<th class="text-center align-middle">압력기준</th>
							<th class="text-center align-middle">압력값</th>
							<th class="text-center align-middle">NG</th>
							<th class="text-center align-middle">시간기준</th>
							<th class="text-center align-middle">시간값</th>
							<th class="text-center align-middle">NG</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
<script>
	let finishOperInfoData = new Object();
	
// 	let finishTempDataArr = new Array();
// 	let finishPressDataArr = new Array();
// 	let finishTimeDataArr = new Array();
// 	let finishLabelArr = new Array();

	$(document).ready(function() {
		$("#searchRegDate").val(moment().format('YYYY-MM-DD'));
		$("#searchRegDate").trigger("change");
	})
	
   	$("#searchRegDate").on("change", function() {
        // 데이터 가져오기
	    $.ajax({
			url : 'mt/finishOperInfoList',
			type : 'post',
			async : false,
			data : {
				'regDate'  	: function() { return moment($("#searchRegDate").val()).format('YYYYMMDD'); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$("#finishOperInfoTable tbody").empty();
					$.each(data, function(index, item) { 
						$("#finishOperInfoTable tbody").append(makeTbody(item))
						$("#"+item.contDtlNo).data('contDtlNo', item.contDtlNo);
						$("#"+item.contDtlNo).data('equipNm', item.equipNm);
						$("#"+item.contDtlNo).data('itemNm', item.itemNm);
						$("#"+item.contDtlNo).data('outputQty', item.outputQty);
						$("#"+item.contDtlNo).data('itemTempMax', item.itemTempMax);
						$("#"+item.contDtlNo).data('itemTempMin', item.itemTempMin);
						$("#"+item.contDtlNo).data('itemPressMax', item.itemPressMax);
						$("#"+item.contDtlNo).data('itemPressMin', item.itemPressMin);
						$("#"+item.contDtlNo).data('itemTimeMax', item.itemTimeMax);
						$("#"+item.contDtlNo).data('itemTimeMin', item.itemTimeMin);
					})
				} else {
					toastr.error(res.message);
				}
			}
		});
	
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 10);
   	});

   	//작지 테이블 그리기
   	function makeTbody(data) {
		let backgroundColor = '#212529';
		
		let html = '';
			html += '';
			html += '<tr id="'+data.contDtlNo+'">';
			html += '	<td class="text-center align-middle">'+data.equipNm+'</td>';
			html += '	<td class="text-center align-middle">'+data.contDtlNo+'</td>';
			html += '	<td class="text-center align-middle">'+data.itemNm+'</td>';
			html += '	<td class="text-center align-middle">'+data.outputQty+'</td>';
			html += '</tr>';
			
		return html;
	}

   	//작지 테이블 그리기
   	function makeDtlTbody(data) {
		let backgroundColor = '#212529';
		let raNg = false;
		let tempNg = false;
		let timeNg = false;

		if (parseFloat(data.temperature) < parseFloat(finishOperInfoData.itemTempMin) || parseFloat(data.temperature) > parseFloat(finishOperInfoData.itemTempMax)) {
			raNg = true;
		}
		if (parseFloat(data.fillPressure) < parseFloat(finishOperInfoData.itemPressMin) || parseFloat(data.fillPressure) > parseFloat(finishOperInfoData.itemPressMax)) {
			tempNg = true;
		}
		if (parseFloat(data.FillNozzle1OpenTime) < parseFloat(finishOperInfoData.itemTimeMin) || parseFloat(data.FillNozzle1OpenTime) > parseFloat(finishOperInfoData.itemTimeMax)) {
			timeNg = true;
		}
		
		let html = '';
			html += '';
			html += '<tr id="'+data.workOrdNo+'">';
			html += '	<td class="text-center align-middle">'+finishOperInfoData.equipNm+'</td>';
			html += '	<td class="text-center align-middle">'+finishOperInfoData.contDtlNo+'</td>';
			html += '	<td class="text-center align-middle">'+finishOperInfoData.contDtlNo+'</td>';
			html += '	<td class="text-center align-middle">'+finishOperInfoData.itemNm+'</td>';
			html += '	<td class="text-center align-middle">'+1+'</td>';
			html += '	<td class="text-center align-middle">'+moment(data.regDate).format("YYYY-MM-DD HH:mm:ss")+'</td>';
			html += '	<td class="text-center align-middle">'+finishOperInfoData.itemTempMin+' ~ '+finishOperInfoData.itemTempMax+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillPvFrontTemp+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillSvFrontTemp+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillPvBackTemp+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillSvBackTemp+'</td>';
			if (raNg) {
				html += '	<td class="text-center align-middle" style="color: red;">NG</td>';
			} else {
				html += '	<td class="text-center align-middle">OK</td>';
			}
			html += '	<td class="text-center align-middle">'+finishOperInfoData.itemPressMin+' ~ '+finishOperInfoData.itemPressMax+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillPressure+'</td>';
			if (tempNg) {
				html += '	<td class="text-center align-middle" style="color: red;">NG</td>';
			} else {
				html += '	<td class="text-center align-middle">OK</td>';
			}
			html += '	<td class="text-center align-middle">'+finishOperInfoData.itemTimeMin+' ~ '+finishOperInfoData.itemTimeMax+'</td>';
			html += '	<td class="text-center align-middle">'+data.fillNozzle1OpenTime+'</td>';
			if (timeNg) {
				html += '	<td class="text-center align-middle" style="color: red;">NG</td>';
			} else {
				html += '	<td class="text-center align-middle">OK</td>';
			}
			html += '</tr>';
			
		return html;
	}
    
	function getIndexList(cnt, postFix) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			result.push((i+1)+postFix);
		}
	}

	// 난수 랜덤 출력
	function getLaserElecList(cnt, max, min) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			let data = Math.random() * (max - min) + min;
			result.push(parseFloat(data.toFixed(2)));
		}
		return result;
	}
    
    Chart.defaults.backgroundColor = '#22252b';
    Chart.defaults.borderColor = '#ccccdc12';
    Chart.defaults.color = '#ffffff';
	
 	// 레이저 공장동(온도)
// 	function makeFinishTempStatus() { 
		const finishTempStatus = new Chart(
			document.getElementById('finishTempStatus'),
			{
				data: {
					labels: [],
					datasets: [{
						type: 'line',
						label: '온도PV앞',
						backgroundColor: '#70DBED',
						borderColor: '#70DBED',
						data: [],
						pointRadius: 0
					}, {
						type: 'line',
						label: '온도SV앞',
						backgroundColor: '#5195CE',
						borderColor: '#5195CE',
						data: [],
						pointRadius: 0
					}, {
						type: 'line',
						label: '온도PV뒤',
						backgroundColor: '#0A50A1',
						borderColor: '#0A50A1',
						data: [],
						pointRadius: 0
					}, {
						type: 'line',
						label: '온도SV뒤',
						backgroundColor: '#0A437C',
						borderColor: '#0A437C',
						data: [],
						pointRadius: 0
					}]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							}
						},
			            y: {
				            grid: {
				            	display: true,
								color: '#cccccc22'
					        },
			                min: 160, 
					        max: 170,
// 			                min: (finishOperInfoData.itemTempMin == undefined) ? parseFloat(finishOperInfoData.itemTempMin) - 2 : 160, 
// 			                max: (finishOperInfoData.itemTempMax == undefined) ? parseFloat(finishOperInfoData.itemTempMax) + 2 : 170,
			                ticks: {
			                    stepSize: 1
			                }
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							        yMin: 160, 
									yMax: 160,
// 							        yMin: (finishOperInfoData.itemTempMin == undefined) ? parseFloat(finishOperInfoData.itemTempMin) : 160, 
// 							        yMax: (finishOperInfoData.itemTempMin == undefined) ? parseFloat(finishOperInfoData.itemTempMin) : 160,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							        yMin: 170, 
									yMax: 170,
// 							        yMin: (finishOperInfoData.itemTempMax == undefined) ? parseFloat(finishOperInfoData.itemTempMax) : 170, 
// 									yMax: (finishOperInfoData.itemTempMax == undefined) ? parseFloat(finishOperInfoData.itemTempMax) : 170,
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
							display: false,
							font : {
								size : 10
							}
						}
					},
				},
			}
		);
// 	}

	// 레이저 공장동(온도)
// 	function makeFinishPressStatus() { 
		const finishPressStatus = new Chart(
			document.getElementById('finishPressStatus'),
			{
				type: 'line',
				data: {
					labels: [],
					datasets: [{
						label: '°C',
						backgroundColor: '#f2830c',
						borderColor: '#f2830c',
				        borderWidth: 1,
						data: [],
						pointRadius: 0
					}]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							}
						},
			            y: {
				            grid: {
				            	display: true,
								color: '#cccccc22'
					        },
			                min: 60, 
					        max: 70,
// 			                min: (finishOperInfoData.itemPressMin == undefined) ? parseFloat(finishOperInfoData.itemPressMin) - 2 : 60, 
// 					        max: (finishOperInfoData.itemPressMax == undefined) ? parseFloat(finishOperInfoData.itemPressMax) + 2 : 70,
			                ticks: {
			                    stepSize: 1
			                }
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							        yMin: 60, 
									yMax: 60,
// 							        yMin: (finishOperInfoData.itemPressMin == undefined) ? parseFloat(finishOperInfoData.itemPressMin) : 60, 
// 									yMax: (finishOperInfoData.itemPressMin == undefined) ? parseFloat(finishOperInfoData.itemPressMin) : 60,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							        yMin: 70, 
									yMax: 70,
// 							        yMin: (finishOperInfoData.itemPressMax == undefined) ? parseFloat(finishOperInfoData.itemPressMax) : 70, 
// 									yMax: (finishOperInfoData.itemPressMax == undefined) ? parseFloat(finishOperInfoData.itemPressMax) : 70,
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
							text: '후가공 공장동(압력)',
							font: {
								size: 20
							}
						},
						datalabels : {
							display: false,
							font : {
								size : 10
							}
						}
					},
				},
			}
		);
// 	}
	
	// 레이저 공장동(온도)
// 	function makeFinishTimeStatus() { 
		const finishTimeStatus = new Chart(
			document.getElementById('finishTimeStatus'),
			{
				type: 'line',
				data: {
					labels: [],
					datasets: [{
						label: '°C',
						backgroundColor: '#f2830c',
						borderColor: '#f2830c',
				        borderWidth: 1,
						data: [],
						pointRadius: 0
					}]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							}
						},
			            y: {
				            grid: {
				            	display: true,
								color: '#cccccc22'
					        },
			                min: 15, 
					        max: 25,
// 			                min: (finishOperInfoData.itemTimeMin == undefined) ? parseFloat(finishOperInfoData.itemTimeMin) - 2 : 0, 
// 							max: (finishOperInfoData.itemTimeMax == undefined) ? parseFloat(finishOperInfoData.itemTimeMax) + 2 : 10,
			                ticks: {
			                    stepSize: 1
			                }
			            }
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
					    annotation: {
					      	annotations: {
					        	line1: {
							        type: 'line',
							        yMin: 15, 
									yMax: 15,
// 							        yMin: (finishOperInfoData.itemTimeMin == undefined) ? parseFloat(finishOperInfoData.itemTimeMin) : 0, 
// 									yMax: (finishOperInfoData.itemTimeMin == undefined) ? parseFloat(finishOperInfoData.itemTimeMin) : 0,
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							        yMin: 25, 
									yMax: 25,
// 							        yMin: (finishOperInfoData.itemTimeMax == undefined) ? parseFloat(finishOperInfoData.itemTimeMax) : 10, 
// 									yMax: (finishOperInfoData.itemTimeMax == undefined) ? parseFloat(finishOperInfoData.itemTimeMax) : 10,
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
							text: '후가공 공장동(시간)',
							font: {
								size: 20
							}
						},
						datalabels : {
							display: false,
							font : {
								size : 10
							}
						}
					},
				},
			}
		);
// 	}



	//작지번호 선택시
   	$("#finishOperInfoTable tbody").on("click", "tr", function() {
   		finishOperInfoData = $(this).data();
   	   	
   		$.ajax({
			url : 'mt/finishOperInfoDtlList',
			type : 'post',
			async : false,
			data : {
				'contDtlNo' 	: function() { return finishOperInfoData.contDtlNo; },
				'regDate'  	: function() { return moment($("#searchRegDate").val()).format('YYYYMMDD'); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$("#finishOperInfoDtlTable tbody").empty();
					
					let finishPFTempDataArr = new Array().fill(null);
					let finishSFTempDataArr = new Array().fill(null);
					let finishPBTempDataArr = new Array().fill(null);
					let finishSBTempDataArr = new Array().fill(null);
					let finishPressDataArr = new Array().fill(null);
					let finishTimeDataArr = new Array().fill(null);
					let finishLabelArr = new Array().fill(null);
					
					$.each(data, function(index, item) {
						$("#finishOperInfoDtlTable tbody").append(makeDtlTbody(item));
						finishPFTempDataArr[index] = (item.fillPvFrontTemp == undefined) ? null : item.fillPvFrontTemp;
						finishSFTempDataArr[index] = (item.fillSvFrontTemp == undefined) ? null : item.fillSvFrontTemp;
						finishPBTempDataArr[index] = (item.fillPvBackTemp == undefined) ? null : item.fillPvBackTemp;
						finishSBTempDataArr[index] = (item.fillSvBackTemp == undefined) ? null : item.fillSvBackTemp;
						finishPressDataArr[index] = (item.fillPressure == undefined) ? null : item.fillPressure;
						finishTimeDataArr[index] = (item.fillNozzle1OpenTime == undefined) ? null : item.fillNozzle1OpenTime;
						finishLabelArr[index] = '';
					})

					finishPFTempDataArr = _.reverse(finishPFTempDataArr);
					finishSFTempDataArr = _.reverse(finishSFTempDataArr);
					finishPBTempDataArr = _.reverse(finishPBTempDataArr);
					finishSBTempDataArr = _.reverse(finishSBTempDataArr);
					finishPressDataArr = _.reverse(finishPressDataArr);
					finishTimeDataArr = _.reverse(finishTimeDataArr);

					finishTempStatus.data.labels = finishLabelArr;
					finishPressStatus.data.labels = finishLabelArr;
					finishTimeStatus.data.labels = finishLabelArr;
					finishTempStatus.data.datasets[0].data = finishPFTempDataArr;
					finishTempStatus.data.datasets[1].data = finishSFTempDataArr;
					finishTempStatus.data.datasets[2].data = finishPBTempDataArr;
					finishTempStatus.data.datasets[3].data = finishSBTempDataArr;
					finishPressStatus.data.datasets[0].data = finishPressDataArr;
					finishTimeStatus.data.datasets[0].data = finishTimeDataArr;
					finishTempStatus.update();
					finishPressStatus.update();
					finishTimeStatus.update();
				} else {
					toastr.error(res.message);
				}
			}
		});
   	})
	   	
	function makeZero(data) {
		if (data < 10)
			return "0" + data;
		else
			return data;
	}
</script>
</body>
</html>