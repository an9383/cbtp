<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<%-- <%@include file="./header.jsp" %> --%>
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
			padding: 40px 0px 0px 0px;">
		
		<!-- 닫기 버튼 -->
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"	style="position: absolute; top: 10px; right:10px; color: #ffff00; cursor: pointer; font-size: 30px; margin-left: auto"></i>
		<div class="row"  style="margin: 0px;
								height: calc(100vh - 45px); 
								background-color: #171823;
								position: relative;
								display: grid; padding: 5px;
								grid-template-areas:	'leftcolT . rightcolT'
														'. . .'
														'middlecolB middlecolB middlecolB';
								grid-template-rows: 42vh 4px 53vh;
								grid-template-columns: 1fr 4px 1fr;
								overflow: auto;">
	    <div class="row" style="background-color: #181b1f; height: 42vh;" id="leftcolT">
	    	<div style="flex: 0 0 99.5%; max-width: 99.5%; background-color: #22252b; border: 1px solid #ccccdc12; margin: 0.25%; padding: 0.25%;">
	    		<div style="position: relative; height:40vh;">
	    			<canvas id="laserStatus"></canvas>
	    		</div>
	    	</div>
	    </div>
	    <div class="row" style="background-color: #181b1f; height: 42vh;" id="rightcolT">
	    	<div style="flex: 0 0 99.5%; max-width: 99.5%; background-color: #22252b; border: 1px solid #ccccdc12; margin: 0.25%; padding: 0.25%;">
	    		<div style="position: relative; height:40vh;">
	    			<canvas id="afterProcessStatus"></canvas>
	    		</div>
	    	</div>
	    </div>
	    <div class="row" style="background-color: #181b1f; height: 53vh;" id="middlecolB">
	    	<div style="flex: 0 0 99.5%; max-width: 99.5%; background-color: #22252b; border: 1px solid #ccccdc12; margin: 0.25%; padding: 0.25%;">
	    		<div style="position: relative; height:40vh;">
	    			<canvas id="monthStatus"></canvas>
	    		</div>
	    		<div style="position: relative; height:10vh;">
	    			<table class="table table-dark table-striped-columns" id="monthStatusTable">
	    				<colgroup>
	    					<col width="8%">
	    					<col width="8%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
						</colgroup>
	    					<tr>
	    						<td class="text-center align-middle">공장명</td>
	    						<td class="text-center align-middle">누적</td>
	    						<td class="text-center align-middle">1월</td>
	    						<td class="text-center align-middle">2월</td>
	    						<td class="text-center align-middle">3월</td>
	    						<td class="text-center align-middle">4월</td>
	    						<td class="text-center align-middle">5월</td>
	    						<td class="text-center align-middle">6월</td>
	    						<td class="text-center align-middle">7월</td>
	    						<td class="text-center align-middle">8월</td>
	    						<td class="text-center align-middle">9월</td>
	    						<td class="text-center align-middle">10월</td>
	    						<td class="text-center align-middle">11월</td>
	    						<td class="text-center align-middle">12월</td>
	    					</tr>
	    					<tr>
	    						<td class="text-center align-middle">레이저 공장동</td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    					</tr>
	    					<tr>
	    						<td class="text-center align-middle">후가공 공장동</td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	    						<td class="text-end align-middle"></td>
	     					</tr>
	     				</table>
	     			</div>
	     		</div>
	    	</div>
		</div>
	</div>
<script>
   	$('#headerMainName').text('사용현황');
   	$('#headerSubName').text('전기 사용량');

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

   	$('#my-spinner').show();
   	
    $(document).ready(function() {
        
        // 데이터 가져오기
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
									laserDataArr.push(laserDataM[month][day][time] == undefined ? null : laserDataM[month][day][time].beData);
									afterProcessDataArr.push(afterProcessDataM[month][day][time] == undefined ? null : afterProcessDataM[month][day][time].beData);
								}
	
								laserDataArrM[indexM] += parseFloat(laserDataM[month][day][time] == undefined ? 0 : laserDataM[month][day][time].beData)
								afterProcessDataArrM[indexM] += parseFloat(afterProcessDataM[month][day][time] == undefined ? 0 : afterProcessDataM[month][day][time].beData)
							});
						};
						laserDataArrM[indexM] = parseFloat((laserDataArrM[indexM]).toFixed(2));
						afterProcessDataArrM[indexM] = parseFloat((afterProcessDataArrM[indexM]).toFixed(2));
					});

					makeLaserStatus();
					makeAfterProcessStatus();
					makeMonthStatus();
				} else {
					toastr.error(res.message);
				}
			},
		});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 10);
		setInterval(function() {
			$('#nowTime').text(moment().format('YYYY년 MM월 DD일 HH시 mm분 ss초'));
		},500);
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
			result.push(parseFloat(data.toFixed(2)));
		}
		return result;
	}
    
    Chart.defaults.backgroundColor = '#22252b';
    Chart.defaults.borderColor = '#ccccdc12';
    Chart.defaults.color = '#ffffff';
    

    // 레이저 공장동
    function makeLaserStatus() {
		const laserStatus = new Chart(
			document.getElementById('laserStatus'),
			{
				type: 'bar',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: 'kWh',
						backgroundColor: '#f3586a',
						borderColor: '#f24055',
						data: laserDataArr,
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							position: 'top',
						},
						title: {
							display: true,
							text: '레이저 공장동',
							font: {
								size: 20
							}
						}
					}
				}
			}
		);
    }

    // 후가공 공장동
    function makeAfterProcessStatus() {
		const afterProcessStatus = new Chart(
			document.getElementById('afterProcessStatus'),
			{
				type: 'bar',
				data: {
					labels: getIndexList(24, ''),
					datasets: [{
						label: 'kWh',
						backgroundColor: '#609fd2',
						borderColor: '#5195ce',
						data: afterProcessDataArr,
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							position: 'top',
						},
						title: {
							display: true,
							text: '후가공 공장동',
							font: {
								size: 20
							}
						}
					}
				}
			}
		);
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
						data: momentStatusData[0],
					},
					{
						label: '후가공공장동(kWh)',
						backgroundColor: '#609fd2',
						borderColor: '#5195ce',
						data: momentStatusData[1],
					}
					]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
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
		
		$('#monthStatusTable').find('tr').eq(1).find('td').eq(1).text(new Intl.NumberFormat('ko').format(_.sum(momentStatusData[0])));
		for(var i=0;i<momentStatusData[0].length;i++) {
			$('#monthStatusTable').find('tr').eq(1).find('td').eq(i+2).text(momentStatusData[0][i]);
		}
		$('#monthStatusTable').find('tr').eq(2).find('td').eq(1).text(new Intl.NumberFormat('ko').format(_.sum(momentStatusData[1])));
		for(var i=0;i<momentStatusData[1].length;i++) {
			$('#monthStatusTable').find('tr').eq(2).find('td').eq(i+2).text(momentStatusData[1][i]);
		}
    }

    function testData(gubun, cd, date) {
		for (var i = 0; i < 24; i++) { // 일
		
			var factoryGubun = gubun;
			var beCd = cd;
			var beDate = '2022'+date + makeZero(i) + parseInt(Math.random() * (58 - 10) + 10)
			
			var max = 0;
			var min = 0;
			
			if (cd == '001') {
				max = 2;
				min = 0;
			} else if (cd == '002') {
// 				m'2022'00;
				min = 0;
			} else {
				max = 24;
				min = 19;
			}
			var beData = Math.random() * (max - min) + min;
			var regId = 'laserAdmin'

			$.ajax({
				url : 'mt/controllSystemCreate',
				type : 'post',
				async : false,
				data : {
					'factoryGubun'	: function() { return factoryGubun; },
					'beCd'			: function() { return beCd; },
					'beDate'		: function() { return beDate; },
					'beData'		: function() { return beData.toFixed(2); },
					'regId'			: function() { return regId; },
				}
	    	});
		}
		console.log("등록완료");
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