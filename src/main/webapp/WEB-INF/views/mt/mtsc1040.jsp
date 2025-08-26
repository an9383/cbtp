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
	<style>
		@media all and (min-width: 0px) and (max-width: 1700px) {
			#dtlMain {
				grid-template-areas:	'view0001'
										'view0002'
										'view0002'
										'view0002'
										'view0002'
										'view0002'
										'view0003'
										'view0003'
										'view0003'
										'view0003'
										'view0003'
										'view0004'
										'view0004'
										'view0004'
										'view0004'
										'view0004' !important;
				grid-template-rows: repeat(16, 75px) !important;
				grid-template-columns: 1fr !important;
			}
		}
	</style>
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
											grid-template-areas:	'view0001 view0001 view0001 view0001'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0004 view0004 view0004 view0004'
																	'view0004 view0004 view0004 view0004'
																	'view0004 view0004 view0004 view0004'
																	'view0004 view0004 view0004 view0004'
																	'view0004 view0004 view0004 view0004';
											grid-template-rows: repeat(11, calc((100vh - 55px - 13px)/11));
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
									<select class="text-right" id="searchDate" onchange="dataSearch();"
											style="color: white; background: #212529; border: none; padding: 0px 5px; font-size: 1.5rem;"></select>
								</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">불량률 추이현황</div>
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: calc(100% - 43px); width: 100%;">
						<canvas id="faultyPercentGrape" style="background-color: #323539; padding: 5px;"></canvas>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">불량 유형별 누적 점유율</div>
						</div>
					</div>
					<div class="row" style="height: calc(100% - 43px);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: 100%; width: 50%;">
							<div id="faultyView" class="workStatusPie p-0" style="width: 80%;">
								<canvas id="faultyPie"></canvas>
							</div>
						</div>
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: 100%; width: 50%;">
							<div style="width:100%; height: 100%; overflow:auto; padding: 5px;">
								<table class="table table-bordered table-dark p-0" id="faultyTable"
									style="font-size: 1.5rem; white-space:nowrap; border-collapse:collapse">
									<thead>
										<tr style="height: 3.5rem;">
											<th class="text-center align-middle">유형</th>
											<th class="text-center align-middle">불량수량</th>
											<th class="text-center align-middle">점유율</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100" style="overflow:auto;">
					<table class="table table-bordered table-dark p-0" id="yearTable" style="font-size: 1.5rem;">
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
								<th class="text-center align-middle" id="year">2022년</th>
								<th class="text-center align-middle" id="month1">1월</th>
								<th class="text-center align-middle" id="month2">2월</th>
								<th class="text-center align-middle" id="month3">3월</th>
								<th class="text-center align-middle" id="month4">4월</th>
								<th class="text-center align-middle" id="month5">5월</th>
								<th class="text-center align-middle" id="month6">6월</th>
								<th class="text-center align-middle" id="month7">7월</th>
								<th class="text-center align-middle" id="month8">8월</th>
								<th class="text-center align-middle" id="month9">9월</th>
								<th class="text-center align-middle" id="month10">10월</th>
								<th class="text-center align-middle" id="month11">11월</th>
								<th class="text-center align-middle" id="month12">12월</th>									
							</tr>
							<tr>
								<th class="text-center align-middle">생산총수량</th>
								<td class="text-end align-middle" id="A1"></td>
								<td class="text-end align-middle" id="A2"></td>
								<td class="text-end align-middle" id="A3"></td>
								<td class="text-end align-middle" id="A4"></td>
								<td class="text-end align-middle" id="A5"></td>
								<td class="text-end align-middle" id="A6"></td>
								<td class="text-end align-middle" id="A7"></td>
								<td class="text-end align-middle" id="A8"></td>
								<td class="text-end align-middle" id="A9"></td>
								<td class="text-end align-middle" id="A10"></td>
								<td class="text-end align-middle" id="A11"></td>
								<td class="text-end align-middle" id="A12"></td>
							</tr>
							<tr>
								<th class="text-center align-middle">양품수량</th>
								<td class="text-end align-middle" id="B1"></td>
								<td class="text-end align-middle" id="B2"></td>
								<td class="text-end align-middle" id="B3"></td>
								<td class="text-end align-middle" id="B4"></td>
								<td class="text-end align-middle" id="B5"></td>
								<td class="text-end align-middle" id="B6"></td>
								<td class="text-end align-middle" id="B7"></td>
								<td class="text-end align-middle" id="B8"></td>
								<td class="text-end align-middle" id="B9"></td>
								<td class="text-end align-middle" id="B10"></td>
								<td class="text-end align-middle" id="B11"></td>
								<td class="text-end align-middle" id="B12"></td>
							</tr>
							<tr>
								<th class="text-center align-middle">불량수량</th>
								<td class="text-end align-middle" id="C1"></td>
								<td class="text-end align-middle" id="C2"></td>
								<td class="text-end align-middle" id="C3"></td>
								<td class="text-end align-middle" id="C4"></td>
								<td class="text-end align-middle" id="C5"></td>
								<td class="text-end align-middle" id="C6"></td>
								<td class="text-end align-middle" id="C7"></td>
								<td class="text-end align-middle" id="C8"></td>
								<td class="text-end align-middle" id="C9"></td>
								<td class="text-end align-middle" id="C10"></td>
								<td class="text-end align-middle" id="C11"></td>
								<td class="text-end align-middle" id="C12"></td>
							</tr>
							<tr>
								<th class="text-center align-middle">불량률(%)</th>
								<td class="text-end align-middle" id="D1"></td>
								<td class="text-end align-middle" id="D2"></td>
								<td class="text-end align-middle" id="D3"></td>
								<td class="text-end align-middle" id="D4"></td>
								<td class="text-end align-middle" id="D5"></td>
								<td class="text-end align-middle" id="D6"></td>
								<td class="text-end align-middle" id="D7"></td>
								<td class="text-end align-middle" id="D8"></td>
								<td class="text-end align-middle" id="D9"></td>
								<td class="text-end align-middle" id="D10"></td>
								<td class="text-end align-middle" id="D11"></td>
								<td class="text-end align-middle" id="D12"></td>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
<script>
	//select 년도 입력, 올해로 기본값 지정
	var dt = new Date();
	var com_year = dt.getFullYear();
	      
	// 년도 표기 (2022 ~ 2121)
	for(let i=0;i<10;i++) {
		let year = moment('2022').add('y',i).format('YYYY');
		$('#searchDate').append('<option value="'+year+'">'+year+'</option>')
	}
	
	$("#searchDate").val(moment().format('YYYY')).prop("selected", true);
</script>
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>
	let searchCount = 0;

	// 불량률 추이현황 그래프
	const faultyPercentGrape = new Chart(
		document.getElementById('faultyPercentGrape'),
		{
			data: {
				labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
				datasets: [{
					type: 'line',
					label: '불량률',
					backgroundColor: '#00ff00',
					borderColor: '#00ff00',
					data: [99.69, 91.67, 84.94, 100, 99.58, 55, 91, 99.81, 62.21, 92.31, 94.69, 100],
					yAxisID: 'y2',
				}, {
					type: 'bar',
					label: '생산총수량',
					backgroundColor: '#0572c1',
					borderColor: '#0572c1',
					data: [0.3, 0.2, 0.3, 0.2, 0.3, 0.2, 0.18, 0.15, 0.11, 0.1, 0.08, 0.1],
					yAxisID: 'y1',
				}, {
					type: 'bar',
					label: '불량수량',
					backgroundColor: '#ffff00',
					borderColor: '#ffff00',
					data: [0.31, 0.25, 0.60, 0.27, 0.42, 0.70, 0.40, 0.19, 0.12, 0.23, 0.06, 0],
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
		                suggestedMax: 750,
		                position: 'left',
		                ticks: {
		                	color: '#ffffff',
		                	callback: function(v) {
				                return addCommas(v);
				            }
			            }
		            },
		            y2: {
		            	grid: {
		            		display: false
						},
		                suggestedMin: 0,
		                suggestedMax: 10,
		                position: 'right',
		                ticks: {
		                	color: '#ffffff',
		                	callback: function(v) {
				                return v + '%';
				            }
			            }
		            }
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
	
	//검색
	function dataSearch() {
		$('#year').text($('#searchDate').val()+'년');
		monthDataRead();	
	}

	//월별 테이블 내용 불러오기
	function monthDataRead() {
		let dataArray = new Array();
		for(let i = 1; i<=12; i++) {
			let rowData = new Object();
			rowData.mainGubun = '001';
			let dayValue = '';
			if(i<10) {
				dayValue = '0' + i;
			} else {
				dayValue = i;
			}
			rowData.searchYear = $('#searchDate').val();
			rowData.searchDate = $('#searchDate').val() + dayValue;
			dataArray.push(rowData);
		}

		$.ajax({
			url: '<c:url value="mt/faultyPercentYearList"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
            async : false,
            success: function (res) {
                if(res.result == 'ok') {
	                let grapeDataList = res.grapeDataList;
	                let pieDataList = res.pieDataList;
	                dataInsert(grapeDataList, 'grape');
	        		dataInsert(pieDataList, 'pie');
                } else {
                    toastr.error(res.message);
                }
			}
		});
		
	}

	//데이터 표시
	function dataInsert(dateCount, dataType) {

		if(dataType == 'grape') {
			//그래프 값
			let faultyPercentList = new Array();	//불량률
			let productionQtyGrape = new Array();	//생산수량
			let faultyQtyGrape = new Array();		//불량수량
			let maxYValue = 0;						//y 최대값
			for(let i=1; i<=dateCount.length; i++) {
				//생산수량
				let productionQty = dateCount[i-1].productionQty;
				//불량수량
				let faultyQty = dateCount[i-1].faultyQty;
				if(faultyQty==0) {
					$('#D'+i).text('0%');
					faultyPercentList.push("");
				} else {
					$('#D'+i).text(addCommas(parseFloat((faultyQty/productionQty*100).toFixed(1)))+'%');
					faultyPercentList.push((faultyQty/productionQty*100).toFixed(1));
				}
				$('#A'+i).text(addCommas(parseFloat(productionQty)));
				$('#B'+i).text(addCommas(parseFloat((productionQty-faultyQty))));
				$('#C'+i).text(addCommas(parseFloat(faultyQty)));
				productionQtyGrape.push(productionQty);
				faultyQtyGrape.push(faultyQty);
				if(maxYValue<productionQty) {
					maxYValue = productionQty;
				}
			}
			faultyPercentGrape.options.scales.y1.suggestedMax = maxYValue;
			faultyPercentGrape.data.datasets[0].data = faultyPercentList;
			faultyPercentGrape.data.datasets[1].data = productionQtyGrape;
			faultyPercentGrape.data.datasets[2].data = faultyQtyGrape;
			faultyPercentGrape.update();
		} else {
			$('#faultyTable tbody').empty();
			let totalFaultyQty = 0;
			let faultyPercentList = new Array();	//불량률
			let faultyNm = new Array();				//불량이름
			let pieColor = new Array();
			for(let i=0; i<dateCount.length; i++) {
				totalFaultyQty += parseFloat(dateCount[i].faultyQty);
			}

			for(let i=0; i<dateCount.length; i++) {
				let html = '<tr>';
				html += '<td class="text-center align-middle">'+dateCount[i].faultyNm+'</td>';
				html += '<td class="text-end align-middle">'+dateCount[i].faultyQty+'</td>';
				if(totalFaultyQty==0) {
					html += '<td class="text-end align-middle">0%</td>';
					faultyPercentList.push(0);
				} else {
					html += '<td class="text-end align-middle">'+(dateCount[i].faultyQty/totalFaultyQty*100).toFixed(1)+'%</td>';
					faultyPercentList.push((dateCount[i].faultyQty/totalFaultyQty*100).toFixed(1));
				}
				html += '</tr>';
				$('#faultyTable tbody').append(html);
				pieColor.push(colorList[i]);
				faultyNm.push(dateCount[i].faultyNm);
			}
			/*
			//맨 처음 한번만 색 랜덤으로 지정하도록 처리
			if(searchCount==0) {
				faultyPie.data.datasets[0].backgroundColor = pieColor;
				searchCount++;
			}
			*/

			let percentSum = 0;
			for(let k = 0; k<faultyPercentList.length; k++) {
				percentSum += parseFloat(faultyPercentList[k]);
			}
			
			if(percentSum>0) {
				$('#faultyView').empty();
				$('#faultyView').append('<canvas id="faultyPie"></canvas>');
				// 불량 유형별 누적 점유율
				const faultyPie = new Chart(
					document.getElementById('faultyPie'),
					{
						type: 'pie',
						data: {
							datasets: [{
								label: 'my',
								data: [],
								backgroundColor:[
								],
								borderColor: '#181b1f',
								hoverOffset: 4
							}]
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
									text: '',
									position: 'bottom',
									color: '#ffffff',
									font: {
										size: 20
									}
								},
								datalabels: {
									color: '#ffffff',
									font: {
										text: '123',
										size: 15,
										weight: 'bold'
									},
									formatter: function(value, context) {
										return value+'%';
									}
								},
							},
						}
					}
				)
				faultyPie.data.datasets[0].backgroundColor = pieColor;
				faultyPie.data.labels = faultyNm;
				faultyPie.data.datasets[0].data = faultyPercentList;
				faultyPie.update();
			} else {
				$('#faultyView').empty();
				$('#faultyView').append('<div class="d-flex align-items-center text-decoration-none justify-content-center" style="font-size: 3rem;">불량 없음</div>');
			}
		}
	}

	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} 
</script>
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>

	$(document).ready(function() {
		$('#year').text($('#searchDate').val()+'년');
		monthDataRead();
	});

	//휠 스크롤 확대축소할 때
	$(window).on('resize', function(event){
	});

	let colorList = ['#ff6384','#ff9f40','#ffcd56','#4bc0c0','#36a2eb','#9966ff','#c9cbcf',
		'#ff6384','#ff9f40','#ffcd56','#4bc0c0','#36a2eb','#9966ff','#c9cbcf',
		'#ff6384','#ff9f40','#ffcd56','#4bc0c0','#36a2eb','#9966ff','#c9cbcf',
		'#ff6384','#ff9f40','#ffcd56','#4bc0c0','#36a2eb','#9966ff','#c9cbcf',
		'#ff6384','#ff9f40','#ffcd56','#4bc0c0','#36a2eb','#9966ff','#c9cbcf'];
</script>
</body>
</html>