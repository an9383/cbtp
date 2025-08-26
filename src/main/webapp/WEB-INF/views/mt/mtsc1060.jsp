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
		::-webkit-calendar-picker-indicator {
			filter: invert(1);
		}
		@media all and (min-width: 0px) and (max-width: 1700px) {
			#dtlMain {
				grid-template-areas:	'view0001'
										'view0002'
										'view0002'
										'view0002'
										'view0002'
										'view0002'
										'view0004'
										'view0004'
										'view0004'
										'view0004'
										'view0004'
										'view0003'
										'view0003'
										'view0003'
										'view0003'
										'view0003'
										'view0005'
										'view0005'
										'view0005'
										'view0005'
										'view0005' !important;
				grid-template-rows: repeat(21, 60px) !important;
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
											width: 100%; 
											background-color: #171823;
											position: relative;
											display: grid; padding: 5px;
											grid-template-areas:	'view0001 view0001 view0001 view0001'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0002 view0002 view0003 view0003'
																	'view0004 view0004 view0005 view0005'
																	'view0004 view0004 view0005 view0005'
																	'view0004 view0004 view0005 view0005'
																	'view0004 view0004 view0005 view0005'
																	'view0004 view0004 view0005 view0005';
											grid-template-rows: repeat(11, calc((100vh - 55px - 13px)/11));
											grid-template-columns: repeat(4, 1fr);
											overflow: auto;">
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center h-100">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="50%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle">조회년월</th>
								<th class="text-center align-middle">
									<input type="month" id="searchDate" style="color: white; background: #212529; border: none;" onchange="dataSearch();">
								</th>
								<th class="text-center align-middle">
									<select id="equipCd" style="color: white; background: #212529; border: none;" onchange="dataSearch();"></select>
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
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">설비 가동률 [월]</div>
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: calc(100% - 43px); width: 100%;">
						<canvas id="equipMonthData" style="background-color: #323539; padding: 5px;"></canvas>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">설비 가동률 [년]</div>
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: calc(100% - 43px); width: 100%;">
						<canvas id="equipYearData" style="background-color: #323539; padding: 5px;"></canvas>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0004"
				style="grid-area: view0004; margin: 5px; max-width: calc(100vw - 27px); border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100" style="overflow:auto;">
					<table class="table table-bordered table-dark p-0" id="monthTable" style="font-size: 1.2rem; white-space:nowrap; border-collapse:collapse">
						<thead></thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100">
					<table class="table table-bordered table-dark p-0" id="yearTable" style="font-size: 1.2rem;">
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
							<tr style="height: 2.5rem;">
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
								<th class="text-center align-middle">보유시간<br>(단위h)</th>
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
								<th class="text-center align-middle">가동시간<br>(단위h)</th>
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
								<th class="text-center align-middle">정지시간<br>(단위h)</th>
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
								<th class="text-center align-middle">시간가동률</th>
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
							<tr>
								<th class="text-center align-middle">성능가동율</th>
								<td class="text-end align-middle" id="E1"></td>
								<td class="text-end align-middle" id="E2"></td>
								<td class="text-end align-middle" id="E3"></td>
								<td class="text-end align-middle" id="E4"></td>
								<td class="text-end align-middle" id="E5"></td>
								<td class="text-end align-middle" id="E6"></td>
								<td class="text-end align-middle" id="E7"></td>
								<td class="text-end align-middle" id="E8"></td>
								<td class="text-end align-middle" id="E9"></td>
								<td class="text-end align-middle" id="E10"></td>
								<td class="text-end align-middle" id="E11"></td>
								<td class="text-end align-middle" id="E12"></td>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script>

	var equipCode = new Array();
	<c:forEach items="${equipList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipCode.push(json);
	</c:forEach>
	selectBoxAppend(equipCode, "equipCd", "", "1");
	$('#searchDate').val(moment().format('yyyy-MM'));
	
	function selectBoxAppend(obj, id, sVal, flag)
	{
		$('#'+ id).empty();

		if(flag == '1') {
			$('#'+ id).append($("<option value=''>"+ "전체" +"</option>"));
	   	} else if(flag == '2') {
	   		$('#'+ id).append($("<option value=''>"+ "선택" +"</option>"));
	   	}
	   		
		for(key in obj) {
			var option;
			if(obj[key].baseCd == sVal ) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>");
				} else {
				option = $("<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>");
			}	
			$('#'+ id).append(option);
		}

	}
</script>
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>

	//검색
	function dataSearch() {
		let dateCount = 0;
		$.ajax({
			url: '<c:url value="bm/factoryCalendarHolidayList"/>',
            type: 'POST',
            data: {					
            	'searchMonth'	:	$('#searchDate').val().replace(/-/g,""),
            },
            async : false,
            success: function (res) {
                if(res.result == 'ok') {
	                let data = res.data;
	                dateCount = data.length;
                } else {
                    toastr.error(res.message);
                }
			}
		});
		$('#year').text(moment($('#searchDate').val().replace(/-/g,"")).format('YYYY')+'년');
		dateLineInsert(dateCount);
		monthDataRead(dateCount);
	}

	//월별 테이블 헤드 표시
	function dateLineInsert(dateCount) {
		$('#monthTable thead').empty();
		$('#monthTable tbody').empty();
		let html1 = '<tr style="height: 2.5rem;">';
		html1 += '<th class="text-center align-middle" style="min-width: 170px;">기준일</th>';
		let html2 = '<tr>';
		html2 += '<th class="text-center align-middle">보유시간<br>(단위m)</th>';
		let html3 = '<tr>';
		html3 += '<th class="text-center align-middle">가동시간<br>(단위m)</th>';
		let html4 = '<tr>';
		html4 += '<th class="text-center align-middle">정지시간<br>(단위m)</th>';
		let html5 = '<tr>';
		html5 += '<th class="text-center align-middle">시간가동률</th>';
		let html6 = '<tr>';
		html6 += '<th class="text-center align-middle">성능가동율</th>';
		
		for(let i = 1; i<=dateCount; i++) {
			html1 += '<th class="text-center align-middle day'+i+'" id="date'+i+'" style="min-width: 100px;">'+i+'일</th>';
			html2 += '<td class="text-end align-middle day'+i+'" id="a'+i+'" style="min-width: 70px;"></td>';
			html3 += '<td class="text-end align-middle day'+i+'" id="b'+i+'" style="min-width: 70px;"></td>';
			html4 += '<td class="text-end align-middle day'+i+'" id="c'+i+'" style="min-width: 70px;"></td>';
			html5 += '<td class="text-end align-middle day'+i+'" id="d'+i+'" style="min-width: 70px;"></td>';
			html6 += '<td class="text-end align-middle day'+i+'" id="e'+i+'" style="min-width: 70px;"></td>';
		}
		html1 += '</tr>';
		html2 += '</tr>';
		html3 += '</tr>';
		html4 += '</tr>';
		html5 += '</tr>';
		html6 += '</tr>';
		$('#monthTable thead').append(html1);
		$('#monthTable tbody').append(html2);
		$('#monthTable tbody').append(html3);
		$('#monthTable tbody').append(html4);
		$('#monthTable tbody').append(html5);
		$('#monthTable tbody').append(html6);
		//dateLineTable.draw();
	}

	//월별 테이블 내용 불러오기
	function monthDataRead(dateCount) {
		let dataArray = new Array();
		for(let i = 1; i<=dateCount; i++) {
			let rowData = new Object();
			rowData.mainGubun = '001';
			rowData.equipCd = $('#equipCd').val();
			let dayValue = '';
			if(i<10) {
				dayValue = '0' + i;
			} else {
				dayValue = i;
			}
			if(i<=12) {
				rowData.searchMonth = $('#searchDate').val().substring(0,4) + dayValue;
			}
			rowData.searchDate = $('#searchDate').val().replace(/-/g,"") + dayValue;
			dataArray.push(rowData);
		}

		$.ajax({
			url: '<c:url value="mt/equipOperatingPercentMonthList"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
            async : false,
            success: function (res) {
                if(res.result == 'ok') {
	                let monthDataList = res.monthDataList;
	                let yearDataList = res.yearDataList;
	                dataInsert(monthDataList, 'month');
	        		dataInsert(yearDataList, 'year');
                } else {
                    toastr.error(res.message);
                }
			}
		});
		
	}

	//데이터 표시
	function dataInsert(dateCount, dataType) {
		//그래프 값
		let holdTimeGrape = new Array();		//보유시간
		let operationGrape = new Array();		//가동시간
		let upTimeGrape = new Array();			//시간가동률
		let xLineGrape = new Array();			//x선
		
		for(let i=1; i<=dateCount.length; i++) {
			console.log(i)
			//보유시간
			let holdTime = dateCount[i-1].holdTime;
			if($('#equipCd').val()=='') {
				holdTime = holdTime * equipCode.length;
			}
				
			//가동시간
			let operationTime = dateCount[i-1].operationTime;
			//정지시간
			let stopTime = holdTime - operationTime;
			//성능가동율 분자
			let processTime = dateCount[i-1].processTime;
			if(i==1) {
				console.log('operationTime : ' + operationTime )
				console.log('processTime : ' + processTime )
			}
			if(dataType=='month') {
				if(holdTime==0) {
					$('#d'+i).text('0%');
					upTimeGrape.push(0);
				} else {
					$('#d'+i).text(addCommas(parseFloat((operationTime/holdTime*100).toFixed(1)))+'%');
					upTimeGrape.push((operationTime/holdTime*100).toFixed(1));
				}
				if(operationTime==0) {
					$('#e'+i).text('0%');
				} else {
					$('#e'+i).text(addCommas(parseFloat((processTime/operationTime*100).toFixed(1)))+'%');
				}
				$('#a'+i).text(addCommas(parseFloat(parseFloat(holdTime).toFixed(1))));
				$('#b'+i).text(addCommas(parseFloat(parseFloat(operationTime).toFixed(1))));
				$('#c'+i).text(addCommas(parseFloat(parseFloat(stopTime).toFixed(1))));
				xLineGrape.push(i+'일');
			} else {
				if(holdTime==0) {
					$('#D'+i).text('0%');
					upTimeGrape.push(0);
				} else {
					$('#D'+i).text(addCommas(parseFloat((operationTime/holdTime*100).toFixed(1)))+'%');
					upTimeGrape.push((operationTime/holdTime*100).toFixed(1));
				}
				if(operationTime==0) {
					$('#E'+i).text('0%');
				} else {
					$('#E'+i).text(addCommas(parseFloat((processTime/operationTime*100).toFixed(1)))+'%');
				}
				$('#A'+i).text(addCommas(parseFloat(parseFloat(holdTime).toFixed(1))));
				$('#B'+i).text(addCommas(parseFloat(parseFloat(operationTime).toFixed(1))));
				$('#C'+i).text(addCommas(parseFloat(parseFloat(stopTime).toFixed(1))));
			}
			holdTimeGrape.push(parseFloat(holdTime).toFixed(1));
			operationGrape.push(parseFloat(operationTime).toFixed(1));
		}
		if(dataType=='month') {
			console.log(holdTimeGrape)
			console.log(operationGrape)
			console.log(upTimeGrape)
			console.log(xLineGrape)
			equipMonthData.data.labels = xLineGrape;
			equipMonthData.data.datasets[0].data = upTimeGrape;
			equipMonthData.data.datasets[1].data = holdTimeGrape;
			equipMonthData.data.datasets[2].data = operationGrape;
			equipMonthData.update();
		} else {
			console.log(upTimeGrape)
			equipYearData.data.datasets[0].data = upTimeGrape;
			equipYearData.data.datasets[1].data = holdTimeGrape;
			equipYearData.data.datasets[2].data = operationGrape;
			equipYearData.update();
		}
	}
	
	// 월별 설비가동률
	const equipMonthData = new Chart(
		document.getElementById('equipMonthData'),
		{
			data: {
				labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
				datasets: [{
					type: 'line',
					label: '시간가동률',
					backgroundColor: '#00ff00',
					borderColor: '#00ff00',
					data: [],
					yAxisID: 'y2',
				}, {
					type: 'bar',
					label: '보유시간',
					backgroundColor: '#0572c1',
					borderColor: '#0572c1',
					data: [],
					yAxisID: 'y1',
				}, {
					type: 'bar',
					label: '가동시간',
					backgroundColor: '#ffff00',
					borderColor: '#ffff00',
					data: [],
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
		                suggestedMax: 1440,
		                position: 'left',
		                ticks: {
		                	color: '#ffffff',
		                	callback: function(v) {
				                return addCommas(v) + '분';
				            }
			            }
		            },
		            y2: {
		            	grid: {
		            		display: false
						},
		                suggestedMin: 0,
		                suggestedMax: 100,
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


	// 월별 설비가동률
	const equipYearData = new Chart(
		document.getElementById('equipYearData'),
		{
			data: {
				labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월', ],
				datasets: [{
					type: 'line',
					label: '시간가동률',
					backgroundColor: '#00ff00',
					borderColor: '#00ff00',
					data: [],
					yAxisID: 'y2',
				}, {
					type: 'bar',
					label: '보유시간',
					backgroundColor: '#0572c1',
					borderColor: '#0572c1',
					data: [],
					yAxisID: 'y1',
				}, {
					type: 'bar',
					label: '가동시간',
					backgroundColor: '#ffff00',
					borderColor: '#ffff00',
					data: [],
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
				                return addCommas(v) + '시간';
				            }
			            }
		            },
		            y2: {
		            	grid: {
		            		display: false
						},
		                suggestedMin: 0,
		                suggestedMax: 100,
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






	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} 
</script>
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>

	$(document).ready(function() {
		let dateCount = 0;
		$.ajax({
			url: '<c:url value="bm/factoryCalendarHolidayList"/>',
            type: 'POST',
            data: {					
            	'searchMonth'	:	$('#searchDate').val().replace(/-/g,""),
            },
            async : false,
            success: function (res) {
                if(res.result == 'ok') {
	                let data = res.data;
	                dateCount = data.length;
                } else {
                    toastr.error(res.message);
                }
			}
		});
		$('#year').text(moment($('#searchDate').val().replace(/-/g,"")).format('YYYY')+'년');
		dateLineInsert(dateCount);
		monthDataRead(dateCount);
	});

	//휠 스크롤 확대축소할 때
	$(window).on('resize', function(event){
	});
</script>
</body>
</html>