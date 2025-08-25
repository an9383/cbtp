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
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0002 view0003'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005'
									'view0004 view0005' !important;
			grid-template-rows: repeat(25, 60px) !important;
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
		<div class="row"  style="margin: 0px;
								height: calc(100vh - 60px); 
								background-color: #171823;
								position: relative;
								display: grid; padding: 5px;
								grid-template-areas:	'view0001 view0001 view0001 view0001'
														'view0002 view0002 view0003 view0003'
														'view0002 view0002 view0003 view0003'
														'view0002 view0002 view0003 view0003'
														'view0002 view0002 view0003 view0003'
														'view0002 view0002 view0003 view0003'
														'view0002 view0002 view0003 view0003'
														'view0004 view0004 view0005 view0005'
														'view0004 view0004 view0005 view0005'
														'view0004 view0004 view0005 view0005'
														'view0004 view0004 view0005 view0005'
														'view0004 view0004 view0005 view0005'
														'view0004 view0004 view0005 view0005';
								grid-template-rows: repeat(13, calc((100vh - 60px - 13px)/13));
								grid-template-columns: repeat(4, 1fr);
								overflow: auto;">
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle">기준년도</th>
								<th class="text-center align-middle">
									<select class="text-right" id="standardYear" style="color: white; background: #212529; border: none;"></select>
								</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
	    		<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="thisYearPStatusDiv">
						<canvas id="thisYearPStatus"></canvas>
    				</div>
    			</div>
		    </div>
		    <div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.2rem;" id="thisYearPTable">
						<colgroup>
							<col width="10%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
						</colgroup>
						<thead>
							<tr style="height: 3.5rem;">
								<th class="text-center align-middle" id="thisYear"></th>
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
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
	    		<div class="row justify-content-center h-100 w-auto" style="background-color: #22252b; border: 1px solid #ccccdc12; padding: 5px;">
					<div style="position: relative; width:100%;" id="comparePStatusDiv">
						<canvas id="comparePStatus"></canvas>
    				</div>
    			</div>
		    </div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.2rem;" id="comparePTable">
						<colgroup>
							<col width="10%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
							<col width="7.5%">
						</colgroup>
						<thead>
							<tr style="height: 3.5rem;">
								<th class="text-center align-middle">년도</th>
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
    	</div>
	</div>
<script>
	let thisYearData = new Array(5); // 생산목표(단위EA), 총생산량, 양품수량, 불량수량, 달성률
	let lastYearData = new Array(1); // 양품수량
	let beforeYearData = new Array(1); // 양품수량
	
	let thisYearVal = moment().format("YYYY"); // 올해
	let lastYearVal = moment().subtract(1, 'y').format("YYYY"); // 작년
	let beforeYearVal = moment().subtract(2, 'y').format("YYYY"); // 재작년
	
	let titleArr = ['생산목표(단위EA)', '총생산량', '양품수량', '불량수량'];
	
	// 년도 표기 (2022 ~ 2121)
	for(let i=0;i<100;i++) {
		let year = moment('2022').add('y',i).format('YYYY');
		$('#standardYear').append('<option value="'+year+'">'+year+'</option>')
	}

	$(document).ready(function() {		
		$("#standardYear").val(thisYearVal); // 기준년도
		
		//차트 초기화
		$('#thisYearPStatus').remove();
		$('#thisYearPStatusDiv').append('<canvas id="thisYearPStatus"><canvas>');
		$('#comparePStatus').remove();
	 	$('#comparePStatusDiv').append('<canvas id="comparePStatus"><canvas>');
	 	
		setProdTargetTotalList(thisYearVal, lastYearVal, beforeYearVal);
	});

	//년도가 바뀔 시
	$("#standardYear").on("change", function() {
		thisYearVal = $("#standardYear").val(); // 올해
		lastYearVal = $("#standardYear").val() - 1; // 작년
		beforeYearVal = $("#standardYear").val() - 2; // 재작년
		
		//차트 초기화
		$('#thisYearPStatus').remove();
		$('#thisYearPStatusDiv').append('<canvas id="thisYearPStatus"><canvas>');
		$('#comparePStatus').remove();
	 	$('#comparePStatusDiv').append('<canvas id="comparePStatus"><canvas>');
		
		setProdTargetTotalList(thisYearVal, lastYearVal, beforeYearVal)
	})
	
	//데이터 조회 및 그래프 그리기
	function setProdTargetTotalList(thisYearVal, lastYearVal, beforeYearVal) {
		// 올해
		$("#thisYear").empty();
		$("#thisYear").append(thisYearVal + '년');

		// 이번년도 생산목표대비 값 불러오기
		$.ajax({
			url : 'mt/prodTargetFinishList',
			type : 'post',
			async : false,
			data : {
				'salesYear'  : function() { return thisYearVal; },
			},
			success : function(res) {
				let monthData = _.groupBy(res.data, 'salesMon'); // 월별 데이터 정렬
				
				let totalArr = new Array(12).fill(null);  	// 목표수량
				let prodArr = new Array(12).fill(null);   	// 생산수량
				let fairArr = new Array(12).fill(null); 	// 양품수량
				let faultyArr = new Array(12).fill(null); 	// 불량수량
				let achieveArr = new Array(12).fill(0); 	// 달성률
				
				$.each(monthData, function(index, item) {
					let monthVal = item[0].salesMon - 1; // 배열이기에 월에서 숫자 1을 빼준다
					let achievePercent = 0;
					let targetQty = (item[0] == undefined) ? null : checkNull(item[0].prodTotalQty); 	// 목표수량
					let prodQty = (item[1] == undefined) ? null : checkNull(item[1].prodTotalQty); 		// 총생산량
					let faultyQty = (item[2] == undefined) ? null : checkNull(item[2].prodTotalQty); 	// 불량수량
					
					totalArr[monthVal] = targetQty; 	// 목표수량
					prodArr[monthVal] = prodQty; 	// 생산수량
					faultyArr[monthVal] = faultyQty; // 불량수량
					fairArr[monthVal] = (prodQty == null || faultyQty == null) ? null : prodQty - faultyQty; // 양품수량
					achieveArr[monthVal] = checkNull(prodQty / targetQty, 3) * 100; // 달성률
				});
				
				thisYearData[0] = totalArr;
				thisYearData[1] = prodArr;
				thisYearData[2] = fairArr;
				thisYearData[3] = faultyArr;
				thisYearData[4] = achieveArr;
			}
		});
		
		// 저번년도 생산목표대비 값 불러오기
		$.ajax({
			url : 'mt/prodTargetFinishList',
			type : 'post',
			async : false,
			data : {
				'salesYear'  : function() { return lastYearVal; },
			},
			success : function(res) {
				let monthData = _.groupBy(res.data, 'salesMon'); // 월별 데이터 정렬
				let fairArr = new Array(12).fill(null); 	// 양품수량

				$.each(monthData, function(index, item) {
					let monthVal = item[0].salesMon - 1; // 배열이기에 월에서 숫자 1을 빼준다
					let prodQty = (item[1] == undefined) ? null : checkNull(item[1].prodTotalQty); 		// 총생산량
					let faultyQty = (item[2] == undefined) ? null : checkNull(item[2].prodTotalQty); 	// 불량수량
					
					fairArr[monthVal] = (prodQty == null || faultyQty == null) ? null : prodQty - faultyQty; // 양품수량
				});
				
				lastYearData[0] = fairArr;
			}
		});
		
		// 재작년도 생산목표대비 값 불러오기
		$.ajax({
			url : 'mt/prodTargetFinishList',
			type : 'post',
			async : false,
			data : {
				'salesYear'  : function() { return beforeYearVal; },
			},
			success : function(res) {
				let monthData = _.groupBy(res.data, 'salesMon'); // 월별 데이터 정렬
				let fairArr = new Array(12).fill(null); 	// 양품수량
				
				$.each(monthData, function(index, item) {
					let monthVal = item[0].salesMon - 1; // 배열이기에 월에서 숫자 1을 빼준다
					let prodQty = (item[1] == undefined) ? null : checkNull(item[1].prodTotalQty); 		// 총생산량
					let faultyQty = (item[2] == undefined) ? null : checkNull(item[2].prodTotalQty); 	// 불량수량
					
					fairArr[monthVal] = (prodQty == null || faultyQty == null) ? null : prodQty - faultyQty; // 양품수량
				});

				beforeYearData[0] = fairArr;
			}
		});

		makeThisYearPStatus(thisYearData);
		makeComparePStatus(thisYearData, lastYearData, beforeYearData);
	}
	
	
	//목표대비실적(이번년도)
	function makeThisYearPStatus(thisYearData) {
		const pStatus = new Chart(
			document.getElementById('thisYearPStatus'),
			{
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
					datasets: [{
						type: 'line',
						label: '달성률',
						backgroundColor: '#00ff00',
						borderColor: '#00ff00',
						data: thisYearData[4],
						yAxisID: 'y2',
					}, {
						type: 'bar',
						label: '목표',
						backgroundColor: '#3CA6A6',
						borderColor: '#3CA6A6',
						data: thisYearData[0],
						yAxisID: 'y1',
					}, {
						type: 'bar',
						label: '실적',
						backgroundColor: '#db2848',
						borderColor: '#db2848',
						data: thisYearData[1],
						yAxisID: 'y1',
					}, ]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: true,
								color: '#cccccc22'
							},
							ticks: {
								color: '#ffffff',
							}
						},
			            y1: {
			            	grid: {
			            		display: true,
								color: '#cccccc22'
							},
			                suggestedMin: 0,
			                suggestedMax: 6000,
			                position: 'left',
			                ticks: {
			                	color: '#ffffff',
			                	callback: function(v) {
					                return v + '';
					            }
				            },
			            },
			            y2: {
			            	grid: {
								display: false,
							},
			                suggestedMin: 0,
			                suggestedMax: 120,
			                position: 'right',
			                ticks: {
			                	color: '#ffffff',
			                	callback: function(v) {
					                return v + '%';
					            }
				            }
			            },
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '생산목표대비(금년)',
							color: '#ffffff',
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

		//테이블에 행 추가
		$("#thisYearPTable tbody").empty();
		for (let i = 0; i < 4; i++) {
			let appendTr = '<tr>';
			appendTr += '<td>'+titleArr[i]+'</td>';
			$.each(thisYearData[i], function(index, item) {
				if (item != null) {
					appendTr += '<td class="text-end align-middle">'+addCommas(parseFloat(item))+'</td>';
				} else {
					appendTr += '<td class="text-center align-middle">-</td>';
				}
			})
			appendTr += '</tr>';
			$("#thisYearPTable").append(appendTr);
		}
	}
	
	//목표대비실적(저번년도)
	function makeComparePStatus(thisYearData, lastYearData, beforeYearData) {
		const pStatus = new Chart(
			document.getElementById('comparePStatus'),
			{
				data: {
					labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
					datasets: [{
						type: 'line',
						label: thisYearVal + "년",
						backgroundColor: '#00ff00',
						borderColor: '#00ff00',
						data: thisYearData[2],
						yAxisID: 'y1',
					}, {
						type: 'line',
						label: lastYearVal + "년",
						backgroundColor: '#3CA6A6',
						borderColor: '#3CA6A6',
						data: lastYearData[0],
						yAxisID: 'y1',
					}, {
						type: 'line',
						label: beforeYearVal + "년",
						backgroundColor: '#db2848',
						borderColor: '#db2848',
						data: beforeYearData[0],
						yAxisID: 'y1',
					}, ]
				},
				options: {
					responsive: true,
					scales: {
						x: {
							grid: {
								display: true,
								color: '#cccccc22'
							},
							ticks: {
								color: '#ffffff',
							}
						},
			            y1: {
			            	grid: {
			            		display: true,
								color: '#cccccc22'
							},
			                suggestedMin: 0,
			                suggestedMax: 6000,
			                position: 'left',
			                ticks: {
			                	color: '#ffffff',
			                	callback: function(v) {
					                return v + '';
					            }
				            },
			            },
			        },
					maintainAspectRatio: false,
					plugins: {
						autocolors: false,
						legend: {
							display: false,
							position: 'top',
						},
						title: {
							display: true,
							text: '생산실적추이(연도별)',
							color: '#ffffff',
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

		//테이블에 행 추가
		$("#comparePTable tbody").empty();
		
		let appendTr = '<tr>';
		appendTr += '<td>'+beforeYearVal+'년</td>';
		$.each(beforeYearData[0], function(index, item) {
			if (item != null) {
				appendTr += '<td class="text-end align-middle">'+addCommas(parseFloat(item))+'</td>';
			} else {
				appendTr += '<td class="text-center align-middle">-</td>';
			}
		})
		appendTr += '</tr>';
		$("#comparePTable").append(appendTr);
		
		appendTr = '<tr>';
		appendTr += '<td>'+lastYearVal+'년</td>';
		$.each(lastYearData[0], function(index, item) {
			if (item != null) {
				appendTr += '<td class="text-end align-middle">'+addCommas(parseFloat(item))+'</td>';
			} else {
				appendTr += '<td class="text-center align-middle">-</td>';
			}
		})
		appendTr += '</tr>';
		$("#comparePTable").append(appendTr);
		
		appendTr = '<tr>';
		appendTr += '<td>'+thisYearVal+'년</td>';
		$.each(thisYearData[2], function(index, item) {
			if (item != null) {
				appendTr += '<td class="text-end align-middle">'+addCommas(parseFloat(item))+'</td>';
			} else {
				appendTr += '<td class="text-center align-middle">-</td>';
			}
		})
		appendTr += '</tr>';
		$("#comparePTable").append(appendTr);
	}

	function checkNull(value, point = null) {
		let funcResult = 0;
		if (value == null && point == null) {
			return null;
		} else if (value != null && point == null) {
			return parseFloat(value);
		} else if (value != null && point != null) {
			return parseFloat(value).toFixed(point);
		}
	}
	
</script>
</body>
</html>

