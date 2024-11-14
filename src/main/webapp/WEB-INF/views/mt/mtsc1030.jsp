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
	@media all and (min-width: 951px) and (max-width: 1700px) {
		#dtlMain {
			grid-template-areas:	'leftcolT rightcolT'
									'leftcolM rightcolT'
									'leftcolM rightcolT'
									'leftcolM rightcolT'
									'leftcolM rightcolT'
									'leftcolM rightcolM'
									'leftcolM rightcolM'
									'leftcolM rightcolM'
									'leftcolM rightcolM'
									'leftcolM rightcolM'
									'leftcolM rightcolB'
									'leftcolM rightcolB'
									'leftcolM rightcolB'
									'leftcolM rightcolB'
									'leftcolM rightcolB' !important;
			grid-template-rows: repeat(15, 60px) !important;
			grid-template-columns: 2.5fr 7.5fr !important;
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
											grid-template-areas:	'leftcolT rightcolT'
																	'leftcolM rightcolT'
																	'leftcolM rightcolT'
																	'leftcolM rightcolT'
																	'leftcolM rightcolT'
																	'leftcolM rightcolM'
																	'leftcolM rightcolM'
																	'leftcolM rightcolM'
																	'leftcolM rightcolM'
																	'leftcolM rightcolM'
																	'leftcolM rightcolB'
																	'leftcolM rightcolB'
																	'leftcolM rightcolB'
																	'leftcolM rightcolB'
																	'leftcolM rightcolB';
											grid-template-rows: repeat(15, calc((100vh - 55px - 13px)/15));
											grid-template-columns: 2.5fr 7.5fr;
											overflow: auto;">
			<div class="gridView" id="leftcolT" style="grid-area: leftcolT; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle">생산일자</th>
								<th class="text-center align-middle">
									<input type="date" class="form-control h-100" style="border:none; background-color:#212529; color:#ffffff; font-size: 1.5rem;" id="searchRegDate">
								</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="gridView" id="leftcolT" style="grid-area: leftcolM; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark table-hover p-0 m-0" style="font-size: 1rem;" id='laserOperInfoTable'>
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
			<div class="gridView" id="rightcolT" style="grid-area: rightcolT; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="laserPowerStatusDiv">
						<canvas id="laserPowerStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="rightcolM" style="grid-area: rightcolM; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="laserTempStatusDiv">
						<canvas id="laserTempStatus"></canvas>
    				</div>
    			</div>
    		</div>
			<div class="gridView" id="rightcolB" style="grid-area: rightcolB; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100" style="overflow: auto;">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1rem;" id="laserOperInfoDtlTable">
					<thead>
						<tr style="height: 2.5rem;">
							<th class="text-center align-middle">설비명</th>
							<th class="text-center align-middle">작지번호</th>
							<th class="text-center align-middle">세부작지번호</th>
							<th class="text-center align-middle">제품명</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">전송시간</th>
							<th class="text-center align-middle">출력기준</th>
							<th class="text-center align-middle">출력값</th>
							<th class="text-center align-middle">NG</th>
							<th class="text-center align-middle">온도기준</th>
							<th class="text-center align-middle">온도값</th>
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
	let laserOperInfoData = new Object();
	let laserTempDataArr = new Array();
	let laserTempLabelArr = new Array();
	let laserPowerDataArr = new Array();
	let laserPowerLabelArr = new Array();

	$(document).ready(function() {
		$("#searchRegDate").val(moment().format('YYYY-MM-DD'));
		$("#searchRegDate").trigger("change");
	})
	
   	$("#searchRegDate").on("change", function() {
        // 데이터 가져오기
	    $.ajax({
			url : 'mt/laserOperInfoList',
			type : 'post',
			async : false,
			data : {
				'regDate'  	: function() { return moment($("#searchRegDate").val()).format('YYYYMMDD'); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$("#laserOperInfoTable tbody").empty();
					$.each(data, function(index, item) { 
						$("#laserOperInfoTable tbody").append(makeTbody(item))
						$("#"+item.contDtlNo).data('contDtlNo', item.contDtlNo);
						$("#"+item.contDtlNo).data('equipNm', item.equipNm);
						$("#"+item.contDtlNo).data('itemNm', item.itemNm);
						$("#"+item.contDtlNo).data('outputQty', item.outputQty);
						$("#"+item.contDtlNo).data('itemPowerMax', item.itemPowerMax);
						$("#"+item.contDtlNo).data('itemPowerMin', item.itemPowerMin);
						$("#"+item.contDtlNo).data('itemTempMax', item.itemTempMax);
						$("#"+item.contDtlNo).data('itemTempMin', item.itemTempMin);
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

   	//작지번호 선택시
   	$("#laserOperInfoTable tbody").on("click", "tr", function() {
   		laserOperInfoData = $(this).data();
   	   	
   		$.ajax({
			url : 'mt/laserOperInfoDtlList',
			type : 'post',
			async : false,
			data : {
				'contDtlNo' 	: function() { return laserOperInfoData.contDtlNo; },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$("#laserOperInfoDtlTable tbody").empty();
					
					$.each(data, function(index, item) { 
						$("#laserOperInfoDtlTable tbody").append(makeDtlTbody(item));
						laserTempDataArr[index] = (item.laserTemperature == '') ? null : item.laserTemperature;
						laserPowerDataArr[index] = (item.laserRa == '') ? null : item.laserRa;
						laserTempLabelArr[index] = '';
						laserPowerLabelArr[index] = '';
					})
					
					//차트 초기화
					$('#laserPowerStatus').remove();
					$('#laserPowerStatusDiv').append('<canvas id="laserPowerStatus"><canvas>');
					$('#laserTempStatus').remove();
				 	$('#laserTempStatusDiv').append('<canvas id="laserTempStatus"><canvas>');
					
					makeLaserTempStatus();
					makeLaserPowerStatus();
				} else {
					toastr.error(res.message);
				}
			}
		});
   	})

   	//작지 테이블 그리기
   	function makeDtlTbody(data) {
		let backgroundColor = '#212529';
		let raNg = false;
		let tempNg = false;

		if (parseFloat(data.laserTemperature) < parseFloat(laserOperInfoData.itemTempMin) || parseFloat(data.laserTemperature) > parseFloat(laserOperInfoData.itemTempMax)) {
			raNg = true;
		}
		if (parseFloat(data.laserTemperature) < parseFloat(laserOperInfoData.itemTempMin) || parseFloat(data.laserTemperature) > parseFloat(laserOperInfoData.itemTempMax)) {
			tempNg = true;
		}
		
		let html = '';
			html += '';
			html += '<tr id="'+data.mes_WorkOrdNo+'">';
			html += '	<td class="text-center align-middle">'+laserOperInfoData.equipNm+'</td>';
			html += '	<td class="text-center align-middle">'+laserOperInfoData.contDtlNo+'</td>';
			html += '	<td class="text-center align-middle">'+data.mes_WorkOrdNo+'</td>';
			html += '	<td class="text-center align-middle">'+laserOperInfoData.itemNm+'</td>';
			html += '	<td class="text-center align-middle">'+1+'</td>';
			html += '	<td class="text-center align-middle">'+moment(data.regDate).format("YYYY-MM-DD HH:mm:ss")+'</td>';
			html += '	<td class="text-center align-middle">'+laserOperInfoData.itemPowerMin+' ~ '+laserOperInfoData.itemPowerMax+'</td>';
			html += '	<td class="text-center align-middle">'+data.laserRa+'</td>';
			if (raNg) {
				html += '	<td class="text-center align-middle" style="color: red;">NG</td>';
			} else {
				html += '	<td class="text-center align-middle">OK</td>';
			}
			html += '	<td class="text-center align-middle">'+laserOperInfoData.itemTempMin+' ~ '+laserOperInfoData.itemTempMax+'</td>';
			html += '	<td class="text-center align-middle">'+data.laserTemperature+'</td>';
			if (tempNg) {
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
	
	// 레이저 공장동(출력)
	function makeLaserPowerStatus() { 
		const laserPowerStatus = new Chart(
			document.getElementById('laserPowerStatus'),
			{
				type: 'line',
				data: {
					labels: laserPowerLabelArr,
					datasets: [{
						label: '°C',
						backgroundColor: '#f2830c',
						borderColor: '#f2830c',
				        borderWidth: 1,
						data: laserPowerDataArr,
						pointRadius: 0
					}]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false,
							}
						},
			            y: {
				            grid: {
				            	display: true,
								color: '#cccccc22'
					        },
			                min: parseFloat(laserOperInfoData.itemPowerMin) - 0.02,
			                max: parseFloat(laserOperInfoData.itemPowerMax) + 0.02,
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
							    	yMin: parseFloat(laserOperInfoData.itemPowerMin),
							        yMax: parseFloat(laserOperInfoData.itemPowerMin),
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: parseFloat(laserOperInfoData.itemPowerMax),
							        yMax: parseFloat(laserOperInfoData.itemPowerMax),
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
							text: '출력',
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
	}

	// 레이저 공장동(온도)
	function makeLaserTempStatus() { 
		const laserTempStatus = new Chart(
			document.getElementById('laserTempStatus'),
			{
				type: 'line',
				data: {
					labels: laserTempLabelArr,
					datasets: [{
						label: '°C',
						backgroundColor: '#f2cc0c',
						borderColor: '#f2cc0c',
				        borderWidth: 1,
						data: laserTempDataArr,
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
			                min: parseFloat(laserOperInfoData.itemTempMin) - 2,
			                max: parseFloat(laserOperInfoData.itemTempMax) + 2,
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
							    	yMin: parseFloat(laserOperInfoData.itemTempMin),
							        yMax: parseFloat(laserOperInfoData.itemTempMin),
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: parseFloat(laserOperInfoData.itemTempMax),
							        yMax: parseFloat(laserOperInfoData.itemTempMax),
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
							text: '냉각수 온도',
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