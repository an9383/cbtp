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
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0003' !important;
			grid-template-rows: repeat(21, 60px) !important;
			grid-template-columns: 1fr !important;
		}
	}
	
	@media all and (min-width: 0px) and (max-width: 950px) {
		#dtlMain {
			display: block;
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
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"
			style="position: absolute; top: 10px; right: 10px;
					color: #ffff00; cursor: pointer; font-size: 30px;"></i>
		<div class="row" id="dtlMain" style="margin: 0px;
											height: calc(100vh - 55px); 
											background-color: #171823;
											position: relative;
											display: grid; padding: 5px;
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
																	'view0002 view0003'
																	'view0002 view0003'
																	'view0002 view0003';
											grid-template-rows: repeat(16, calc((100vh - 55px - 13px)/16));
											grid-template-columns: repeat(2, 1fr);
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
									<input type="month" id="searchDate" style="color: #ffffff; background: #212529; border: none; font-size: 1.5rem;" onchange="dataSearch();">
								</th>
								<th class="text-center align-middle">
									<select id="equipCd" style="color: #ffffff; background: #212529; border: none; font-size: 1.5rem;" onchange="dataSearch();"></select>
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
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">월별</div>
						</div>
					</div>
					<div class="row">
						<div style="flex: 0 0 auto; width: 70%;">
							<div class="row">
								<div class="workStatusPie p-0" style="flex: 0 0 auto; height: 210px; width: 50%;">
									<canvas id="monthPie1" style="display:inline;"></canvas>
								</div>
								<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
									<canvas id="monthPie2" style="display:inline;"></canvas>
								</div>
								<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
									<canvas id="monthPie3" style="display:inline;"></canvas>
								</div>
								<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
									<canvas id="monthPie4" style="display:inline;"></canvas>
								</div>
							</div>
						</div>
						<div style="flex: 0 0 auto; width: 30%; padding: 5px;">
							<table class="table table-bordered table-dark p-0" id="yearTable" style="font-size: 1.5rem; height: 100%;">
								<colgroup>
									<col width="40%">
									<col width="60%">
								</colgroup>
								<thead>
									<tr style="height: 3.5rem;">
										<th class="text-center align-middle">용어</th>
										<th class="text-center align-middle">값</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="text-center align-middle">부하시간</th>
										<td id="a1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">가동시간</th>
										<td id="b1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">이론CT</th>
										<td id="c1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">생산량</th>
										<td id="d1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">투입수량</th>
										<td id="e1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">불량수량</th>
										<td id="f1" class="text-end align-middle"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div style="flex: 0 0 auto; width: 100%; padding: 5px;">
							<table id="monthEquipDataTable" class="table table-bordered table-dark p-0" style="font-size: 1.5rem; height: 100%;">
								<colgroup>
									<col width="16%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
								</colgroup>
								<thead>
									<tr style="height: 3.5rem;">
										<th class="text-center align-middle">설비명</th>
										<th class="text-center align-middle">부하시간</th>
										<th class="text-center align-middle">가동시간</th>
										<th class="text-center align-middle">이론CT</th>
										<th class="text-center align-middle">생산량</th>
										<th class="text-center align-middle">투입수량</th>
										<th class="text-center align-middle">불량수량</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #111217;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">년 누적</div>
						</div>
					</div>
					<div class="row">
						<div style="flex: 0 0 auto; width: 70%;">
							<div class="row">
								<div class="workStatusPie p-0" style="flex: 0 0 auto; height: 210px; width: 50%;">
								<canvas id="yearPie1" style="display:inline;"></canvas>
							</div>
							<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
								<canvas id="yearPie2" style="display:inline;"></canvas>
							</div>
							<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
								<canvas id="yearPie3" style="display:inline;"></canvas>
							</div>
							<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; height: 210px; width: 50%;">
								<canvas id="yearPie4" style="display:inline;"></canvas>
							</div>
							</div>
						</div>
						<div style="flex: 0 0 auto; width: 30%; padding: 5px;">
							<table class="table table-bordered table-dark p-0" id="yearTable" style="font-size: 1.5rem; height: 100%;">
								<colgroup>
									<col width="40%">
									<col width="60%">
								</colgroup>
								<thead>
									<tr style="height: 3.5rem;">
										<th class="text-center align-middle">용어</th>
										<th class="text-center align-middle">값</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="text-center align-middle">부하시간</th>
										<td id="A1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">가동시간</th>
										<td id="B1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">이론CT</th>
										<td id="C1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">생산량</th>
										<td id="D1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">투입수량</th>
										<td id="E1" class="text-end align-middle"></td>
									</tr>
									<tr>
										<th class="text-center align-middle">불량수량</th>
										<td id="F1" class="text-end align-middle"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div style="flex: 0 0 auto; width: 100%; padding: 5px;">
							<table id="yearEquipDataTable" class="table table-bordered table-dark p-0" style="font-size: 1.5rem; height: 100%;">
								<colgroup>
									<col width="16%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
								</colgroup>
								<thead>
									<tr style="height: 3.5rem;">
										<th class="text-center align-middle">설비명</th>
										<th class="text-center align-middle">부하시간</th>
										<th class="text-center align-middle">가동시간</th>
										<th class="text-center align-middle">이론CT</th>
										<th class="text-center align-middle">생산량</th>
										<th class="text-center align-middle">투입수량</th>
										<th class="text-center align-middle">불량수량</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
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

	//조회 버튼 클릭
	function dataSearch() {
		chartUpdate();	
	}

	function chartUpdate() {
		
		let monthPie1_1 = 0;
		let monthPie1_2 = 0;
		let monthPie2_1 = 0;
		let monthPie2_2 = 0;
		let monthPie3_1 = 0;
		let monthPie3_2 = 0;
		let monthPie4_1 = 0;
		let monthPie4_2 = 0;

		let yearPie1_1 = 0;
		let yearPie1_2 = 0;
		let yearPie2_1 = 0;
		let yearPie2_2 = 0;
		let yearPie3_1 = 0;
		let yearPie3_2 = 0;
		let yearPie4_1 = 0;
		let yearPie4_2 = 0;

		let a1 = 0;
		let b1 = 0;
		let c1 = 0;
		let d1 = 0;
		let e1 = 0;
		let f1 = 0;

		let A1 = 0;
		let B1 = 0;
		let C1 = 0;
		let D1 = 0;
		let E1 = 0;
		let F1 = 0;

		let monthEquipDataList;
		let yearEquipDataList;
		
		$.ajax({
			url: '<c:url value="mt/equipTotalEfficiencyDataRead"/>',
	        type: 'POST',
	        async : false,
	        data: {
	            'mainGubun'	:	'001',
	            'searchDate':	$('#searchDate').val().replace(/-/g,""),
	            'equipCd'	:	$('#equipCd').val(),
			},
			beforeSend : function(){
				//처리중..
				$('#my-spinner').show();
			},
			success : function(res) {
				/*
				if($('#equipCd').val()=='') {
					a1 = res.a1 * equipCode.length;
				} else {
					a1 = res.a1;
				}
				*/
				a1 = res.a1;
				b1 = res.b1;
				c1 = res.c1;
				d1 = res.d1;
				e1 = res.e1;
				f1 = res.f1;
				     
				A1 = res.A1;
				B1 = res.B1;
				C1 = res.C1;
				D1 = res.D1;
				E1 = res.E1;
				F1 = res.F1;

				monthEquipDataList = res.monthEquipTotalDataList;
				yearEquipDataList = res.yearEquipTotalDataList;
				
				monthPie1_1 = res.momthTimeOperationPercent;
				if(monthPie1_1>100) {
					monthPie1_2 = 0;
				} else {
					monthPie1_2 = 100 - monthPie1_1;
				}
				monthPie2_1 = res.momthFairQtyPercent;
				if(monthPie2_1>100) {
					monthPie2_2 = 0;
				} else {
					monthPie2_2 = 100 - monthPie2_1;
				}
				monthPie3_1 = res.momthEquipEfficiencyPercent;
				if(monthPie3_1>100) {
					monthPie3_2 = 0;
				} else {
					monthPie3_2 = 100 - monthPie3_1;
				}
				monthPie4_1 = res.momthPerformanceOperationPercent;
				if(monthPie4_1>100) {
					monthPie4_2 = 0;
				} else {
					monthPie4_2 = 100 - monthPie4_1;
				}

				yearPie1_1 = res.yearTimeOperationPercent;
				if(yearPie1_1>100) {
					yearPie1_2 = 0;
				} else {
					yearPie1_2 = 100 - yearPie1_1;
				}
				yearPie2_1 = res.yearFairQtyPercent;
				if(yearPie2_1>100) {
					yearPie2_2 = 0;
				} else {
					yearPie2_2 = 100 - yearPie2_1;
				}
				yearPie3_1 = res.yearEquipEfficiencyPercent;
				if(yearPie3_1>100) {
					yearPie3_2 = 0;
				} else {
					yearPie3_2 = 100 - yearPie3_1;
				}
				yearPie4_1 = res.yearPerformanceOperationPercent;
				if(yearPie4_1>100) {
					yearPie4_2 = 0;
				} else {
					yearPie4_2 = 100 - yearPie4_1;
				}
			}
		});

		
		monthPie1.data.datasets[0].data = [monthPie1_1.toFixed(1),monthPie1_2.toFixed(1)];
		monthPie1.update();
		monthPie2.data.datasets[0].data = [monthPie2_1.toFixed(1),monthPie2_2.toFixed(1)];
		monthPie2.update();
		monthPie3.data.datasets[0].data = [monthPie3_1.toFixed(1),monthPie3_2.toFixed(1)];
		monthPie3.update();
		monthPie4.data.datasets[0].data = [monthPie4_1.toFixed(1),monthPie4_2.toFixed(1)];
		monthPie4.update();


		yearPie1.data.datasets[0].data = [yearPie1_1.toFixed(1),yearPie1_2.toFixed(1)];
		yearPie1.update();
		yearPie2.data.datasets[0].data = [yearPie2_1.toFixed(1),yearPie2_2.toFixed(1)];
		yearPie2.update();
		yearPie3.data.datasets[0].data = [yearPie3_1.toFixed(1),yearPie3_2.toFixed(1)];
		yearPie3.update();
		yearPie4.data.datasets[0].data = [yearPie4_1.toFixed(1),yearPie4_2.toFixed(1)];
		yearPie4.update();

		//월별 데이터 표에 표시
		let a1_h = Math.floor(a1/3600000);
		let a1_m = Math.floor(a1%3600000/60000);
		let a1_s = Math.floor(a1%3600000%60000/1000);
		let a1_ms = Math.floor(a1%3600000%60000%1000);
		let a1_text = '';
		if(a1_h>0) {
			a1_text = a1_h + 'h';
		}
		if(a1_m>0) {
			a1_text = a1_text + a1_m + 'm';
		}
		if(a1_text=='') {
			a1_text = '-';
		}
		$('#a1').text(a1_text);
		
		let b1_h = Math.floor(b1/3600000);
		let b1_m = Math.floor(b1%3600000/60000);
		let b1_s = Math.floor(b1%3600000%60000/1000);
		let b1_ms = Math.floor(b1%3600000%60000%1000);
		let b1_text = '';
		if(b1_h>0) {
			b1_text = b1_h + 'h';
		}
		if(b1_m>0) {
			b1_text = b1_text + b1_m + 'm';
		}
		if(b1_text=='') {
			b1_text = '-';
		}
		$('#b1').text(b1_text);

		let c1_h = Math.floor(c1/3600000);
		let c1_m = Math.floor(c1%3600000/60000);
		let c1_s = Math.floor(c1%3600000%60000/1000);
		let c1_ms = Math.floor(c1%3600000%60000%1000);
		let c1_text = '';
		if(c1_h>0) {
			c1_text = c1_h + 'h';
		}
		if(c1_m>0) {
			c1_text = c1_text + c1_m + 'm';
		}
		if(c1_text=='') {
			c1_text = '-';
		}
		$('#c1').text(c1_text);
		
		$('#d1').text(d1);
		$('#e1').text(e1);
		$('#f1').text(f1);

		//년 누적 데이터 표시
		let A1_h = Math.floor(A1/3600000);
		let A1_m = Math.floor(A1%3600000/60000);
		let A1_s = Math.floor(A1%3600000%60000/1000);
		let A1_ms = Math.floor(A1%3600000%60000%1000);
		let A1_text = '';
		if(A1_h>0) {
			A1_text = A1_h + 'h';
		}
		if(A1_m>0) {
			A1_text = A1_text + A1_m + 'm';
		}
		if(A1_text=='') {
			A1_text = '-';
		}
		$('#A1').text(A1_text);
		
		let B1_h = Math.floor(B1/3600000);
		let B1_m = Math.floor(B1%3600000/60000);
		let B1_s = Math.floor(B1%3600000%60000/1000);
		let B1_ms = Math.floor(B1%3600000%60000%1000);
		let B1_text = '';
		if(B1_h>0) {
			B1_text = B1_h + 'h';
		}
		if(B1_m>0) {
			B1_text = B1_text + B1_m + 'm';
		}
		if(B1_text=='') {
			B1_text = '-';
		}
		$('#B1').text(B1_text);

		let C1_h = Math.floor(C1/3600000);
		let C1_m = Math.floor(C1%3600000/60000);
		let C1_s = Math.floor(C1%3600000%60000/1000);
		let C1_ms = Math.floor(C1%3600000%60000%1000);
		let C1_text = '';
		if(C1_h>0) {
			C1_text = C1_h + 'h';
		}
		if(C1_m>0) {
			C1_text = C1_text + C1_m + 'm';
		}
		if(C1_text=='') {
			C1_text = '-';
		}
		$('#C1').text(C1_text);
		$('#D1').text(D1);
		$('#E1').text(E1);
		$('#F1').text(F1);

		equipDataListUpdate(monthEquipDataList, 'month');
		equipDataListUpdate(yearEquipDataList, 'year');
		
		$('#my-spinner').hide();
	}

	function equipDataListUpdate(dataList, dateType) {
		
		if(dateType=='month') {
			$('#monthEquipDataTable tbody').empty();
		} else {
			$('#yearEquipDataTable tbody').empty();
		}
		for(let i=0; i<dataList.length; i++) {
			let html = '<tr>';
			html += '<th class="text-center align-middle">'+dataList[i].equipNm+'</th>';

			let loadTime_h = Math.floor(dataList[i].loadTime/3600000);
			let loadTime_m = Math.floor(dataList[i].loadTime%3600000/60000);
			let loadTime_text = '';
			if(loadTime_h>0) {
				loadTime_text = addCommas(loadTime_h) + 'h';
			}
			if(loadTime_m>0) {
				loadTime_text = loadTime_text + addCommas(loadTime_m) + 'm';
			}
			if(loadTime_text=='') {
				loadTime_text = '0';
			}
			
			html += '<td class="text-end align-middle">'+ loadTime_text +'</td>';

			let processTime_h = Math.floor(dataList[i].processTime/3600000);
			let processTime_m = Math.floor(dataList[i].processTime%3600000/60000);
			let processTime_text = '';
			if(processTime_h>0) {
				processTime_text = addCommas(processTime_h) + 'h';
			}
			if(processTime_m>0) {
				processTime_text = processTime_text + addCommas(processTime_m) + 'm';
			}
			if(processTime_text=='') {
				processTime_text = '0';
			}
			html += '<td class="text-end align-middle">'+ processTime_text +'</td>';
			
			let theoryCt_h = Math.floor(dataList[i].theoryCt/3600000);
			let theoryCt_m = Math.floor(dataList[i].theoryCt%3600000/60000);
			let theoryCt_text = '';
			if(theoryCt_h>0) {
				theoryCt_text = addCommas(theoryCt_h) + 'h';
			}
			if(theoryCt_m>0) {
				theoryCt_text = theoryCt_text + addCommas(theoryCt_m) + 'm';
			}
			if(theoryCt_text=='') {
				theoryCt_text = '0';
			}
			console.log(theoryCt_h)
			console.log(theoryCt_m)
			html += '<td class="text-end align-middle">'+ theoryCt_text +'</td>';
			html += '<td class="text-end align-middle">'+addCommas(parseFloat(dataList[i].productionQty))+'</td>';
			html += '<td class="text-end align-middle">'+addCommas(parseFloat(dataList[i].inputQty))+'</td>';
			html += '<td class="text-end align-middle">'+addCommas(parseFloat(dataList[i].faultyQty))+'</td>';
			html += '</tr>';

			if(dateType=='month') {
				$('#monthEquipDataTable tbody').append(html);
			} else {
				$('#yearEquipDataTable tbody').append(html);
			}
		}
	}


	// 시간가동율
	const monthPie1 = new Chart(
		document.getElementById('monthPie1'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#3CA6A6',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '시간가동율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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

	// 양품율
	const monthPie2 = new Chart(
		document.getElementById('monthPie2'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#014034',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '양품율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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

	//종합효율
	const monthPie3 = new Chart(
		document.getElementById('monthPie3'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#F2E3D5',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '종합효율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#000000',
						font: {
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

	// 성능가동율
	const monthPie4 = new Chart(
		document.getElementById('monthPie4'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#026773',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '성능가동율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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

	// 시간가동율
	const yearPie1 = new Chart(
		document.getElementById('yearPie1'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#3CA6A6',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '시간가동율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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

	// 양품율
	const yearPie2 = new Chart(
		document.getElementById('yearPie2'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#014034',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '양품율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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

	//설비효율
	const yearPie3 = new Chart(
		document.getElementById('yearPie3'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#F2E3D5',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '종합효율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#000000',
						font: {
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

	// 성능가동율
	const yearPie4 = new Chart(
		document.getElementById('yearPie4'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [0, 100],
					backgroundColor:[
						'#026773',
						'#db2848'
					],
					borderColor: '#181b1f',
					hoverOffset: 4
				}]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '성능가동율',
						position: 'bottom',
						color: '#ffffff',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: '#ffffff',
						font: {
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
	
	$(document).ready(function() {
		chartUpdate();
	});
</script>
</body>
</html>