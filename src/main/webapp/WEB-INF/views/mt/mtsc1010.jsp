<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<body>
	<style>
		@media all and (min-width: 0px) and (max-width: 1700px) {
			#laser > div {
				width: 100% !important;
				height: 90% !important;
			}
		}
	</style>
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
					color: #ffff00; cursor: pointer; font-size: 2rem;"></i>
		<div class="row" id="laser" style="background-color: #171823; height: calc(100vh - 55px); margin: 0px;">
		</div>
	</div>
    <script>

		// 레이저 설비목록 조회
		function getEquipList() {
			let result = [];
			$.ajax({
				url: '<c:url value="bm/equipCodeAdmList"/>',
	            type: 'GET',
	            async: false,
	            data: {
					'mainGubun' : function(){return '001';},
					'prcNm' : function(){return '001';},
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

		// 가공중인 LASER 설비 가공데이터 조회
		function getLaserData() {
			let result = [];
			$.ajax({
				url: '<c:url value="mt/laserOperInfoLstByEquipCd"/>',
	            type: 'POST',
	            async: false,
	            data: {
				},
				success : function(res) {
					let data = res.data;
					result = data;
				}
			});
			return result;
		}

    	
    	

    	let equipList = [];
		let recipeList = [];
		

		// makeHtml
		function makeHtml(equipData, recipeData) {
			let pnl_x = '';
			let pnl_y = '';

			// 레시피데이터가 있을 경우 -> 가공중
			if(recipeData.length != 0) {
				let max_recipe_no = _.maxBy(recipeData, function(v) { return parseInt(v.recipeNo); }).recipeNo;
				pnl_x = _.filter(recipeData, function(v) { return v.recipeNo == max_recipe_no; })[0].sizeX;
				pnl_y = _.filter(recipeData, function(v) { return v.recipeNo == max_recipe_no; })[0].sizeY;
			}
			
			let html = '';
			html += '<div style="flex: 0 0 auto; width: 50%; background-color: #171823; height: 50%;">';
			html += '	<div style="background-color: #181b1f; border: 1px solid #ccccdc12; margin: 5px; padding: 0px; height: calc(100% - 6px);">';
			html += '		<table class="table table-dark table-bordered m-0" style="font-size: 1.1rem; height: 100%;">';
			html += '			<colgroup>';
			html += '				<col width="15%">';
			html += '				<col width="35%">';
			html += '				<col width="15%">';
			html += '				<col width="35%">';
			html += '			</colgroup>';
			html += '			<tr style="height: 10%;">';
			html += '				<th class="text-center align-middle">설비명</th>';
			html += '				<td class="text-center align-middle" colspan="3">'+equipData.equipNm+'</td>';
			html += '			</tr>';
			html += '			<tr style="height: 10%;">';
			html += '				<th class="text-center align-middle">제품명</th>';
			html += '				<td class="text-center align-middle" colspan="3" id="itemNm_'+equipData.equipCd+'"></td>';
			html += '			</tr>';
			html += '			<tr style="height: 10%;">';
			html += '				<th class="text-center align-middle">홀 갯수</th>';
			html += '				<td class="text-center align-middle" id="hallCount_'+equipData.equipCd+'"></td>';
			html += '				<th class="text-center align-middle">가공시간</th>';
			html += '				<td class="text-center align-middle" id="processTime_'+equipData.equipCd+'"></td>';
			html += '			</tr>';
			html += '			<tr style="height: 10%;">';
			html += '				<th class="text-center align-middle">범례</th>';
			html += '				<td class="text-center align-middle" colspan="3">';
			html += '					<div class="progress" style="height: 100%; font-size: 1rem;">';
			html += '						<div class="progress-bar" style="width: 25%; color: #000000; background-color: #F2E3D5;">미가공</div>';
			html += '						<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #3CA6A6;">가공대기</div>';
			html += '						<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #026773;">가공중</div>';
			html += '						<div class="progress-bar" style="width: 25%; color: #ffffff; background-color: #009679;">가공완료</div>';
			html += '					</div>';
			html += '				</td>';
			html += '			</tr>';
			html += '			<tr style="height: 50%">';
			html += '				<th class="text-center align-middle">도면</th>';
		if(recipeData.length != 0) { // 가공중일 경우
			html += '				<td colspan="3" id="'+equipData.equipCd+'" style="text-align: center; vertical-align: middle; height: 50%;">';
			html += '					<canvas id="canvas_'+equipData.equipCd+'" width="'+(parseFloat(pnl_x)*10)+'" height="'+(parseFloat(pnl_y)*10)+'"';
			html += '							style="display: inline; height: 100%; background-color: #323539;" >';
			html += '					</canvas>';
		} else { // 비가동중일 경우
			html += '				<td colspan="3" id="'+equipData.equipCd+'" style="text-align: center; vertical-align: middle; height: 100%;">';
			html += '					<div class="text-center"';
			html += '						style="font-weight: 900; font-size: 2rem; color: #ff0000;';
			html += '								animation: 1s step-end 0s infinite normal none running blink-effect;">';
			html += '						NOT working <i class="fas fa-exclamation-triangle"></i>';
			html += '					</div>';
		}
			html += '				</td>';
			html += '			</tr>';
			html += '			<tr style="height: 10%;">';
			html += '				<th class="text-center align-middle">진척률</th>';
			html += '				<td colspan="3">';
			html += '					<div class="progress" style="height: 100%; font-size: 1rem; background-color:#ffffff60">';
			html += '						<div class="progress-bar progress-bar-striped progress-bar-animated" id="progressBar_'+equipData.equipCd+'"></div>';
			html += '					</div>';
			html += '				</td>';
			html += '			</tr>';
			html += '		</table>';
			html += '	</div>';
			html += '</div>';
				
			return html;
		}

		// 원형홀 생성
		function makeCircle(ctx, x, y, width, height, data) {
			let color = '#F2E3D5';
			if(data.workStatus != null) { // 가공완료
				color = '#009679';
			} else if(data.workStatusPrev != null) { // 가공중
				color = '#026773';
			} else if(data.workStatusPrev2 != null) { // 가공예정
				color = '#3CA6A6';
			} else {
				color = '#F2E3D5';
			}
			
			ctx.beginPath();
			ctx.arc(x*10, y*10, width*10/2, 0, Math.PI*2);
			ctx.stroke();
			ctx.fillStyle = color;
			ctx.fill();
		}

		// 사각형홀 생성
		function makeRectangle(ctx, x, y, width, height, data) {
			let color = '#F2E3D5';
			if(data.workStatus != null) { // 가공완료
				color = '#009679';
			} else if(data.workStatusPrev != null) { // 가공중
				color = '#026773';
			} else if(data.workStatusPrev2 != null) { // 가공예정
				color = '#3CA6A6';
			} else {
				color = '#F2E3D5';
			}

			ctx.fillStyle  = color;
			ctx.fillRect((x-(width)/2)*10, (y-(height)/2)*10, width*10, height*10);
		}

		// 가운데가 비어있는 사각형홀 생성
		function makeEmptyRectangle(ctx, x, y, width, height, data) {
			let color = '#F2E3D5';
			if(data.workStatus != null) { // 가공완료
				color = '#009679';
			} else if(data.workStatusPrev != null) { // 가공중
				color = '#026773';
			} else if(data.workStatusPrev2 != null) { // 가공예정
				color = '#3CA6A6';
			} else {
				color = '#F2E3D5';
			}

			ctx.strokeStyle  = color;
			ctx.strokeRect(0, 0, width*10, height*10);
		}

		function drawEquipData() {
			recipeList = getLaserData(); // 가공중인 데이터 조회

			// 가공중인 데이터가 있을 경우
			if(recipeList.length != 0) {
				for(var i=0;i<equipList.length;i++) {
					let equipData = equipList[i];
					let recipe = _.filter(recipeList, function(v) { return v.equipCd == equipData.equipCd; });
					
					let pnl_x = '';
					let pnl_y = '';

					// 레시피데이터가 있을 경우 -> 가공중 or 측정중
					if(recipe.length != 0) {
						$('#itemNm_'+equipData.equipCd).text(recipe[0].itemNm);
						$('#hallCount_'+equipData.equipCd).text(recipe[0].hallCount+' EA');
						$('#processTime_'+equipData.equipCd).text(recipe[0].processTime+' 분');

						// 가공상태가 T이거나 측정상태가 T인 경우 -> 일시정지
						if(recipe[0].nowWorkStatus == 'T' || recipe[0].nowCheckStatus == 'T') {
							$('#'+equipData.equipCd).empty();
							let html = '';
								html += '<div class="text-center"';
								html += '	style="font-weight: 900; font-size: 2rem; color: #ffff00;';
								html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
								html += '	일시정지 <i class="fas fa-exclamation-triangle"></i>';
								html += '</div>';
							$('#'+equipData.equipCd).append(html);

							let max = recipe.length + 1; // 100%를 보이지 않게하기 위함
							let now = _.filter(recipe, function(v) { return v.workStatus != null; }).length;
							
							$('#progressBar_'+equipData.equipCd).css('width',(now/max*100).toFixed(1)+'%').css('background-color','#009679').text((now/max*100).toFixed(1)+'%');
						}
						// 가공상태가 R이거나 측정상태가 R인 경우 -> 일시정지해제
						else if(recipe[0].nowWorkStatus == 'R' || recipe[0].nowCheckStatus == 'R') {
							$('#'+equipData.equipCd).empty();
							let html = '';
								html += '<div class="text-center"';
								html += '	style="font-weight: 900; font-size: 2rem; color: #ff7f00;';
								html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
								html += '	일시정지해제 <i class="fas fa-exclamation-triangle"></i>';
								html += '</div>';
							$('#'+equipData.equipCd).append(html);

							let max = recipe.length + 1; // 100%를 보이지 않게하기 위함
							let now = _.filter(recipe, function(v) { return v.workStatus != null; }).length;
							
							$('#progressBar_'+equipData.equipCd).css('width',(now/max*100).toFixed(1)+'%').css('background-color','#009679').text((now/max*100).toFixed(1)+'%');
						}
						else {
							// 가공중일 경우
							if(recipe[0].processStatus == 'W') {
								if(recipe[0].nowWorkStatus == 'S' || recipe[0].nowWorkStatus == 'E') { // 가공중
									let max_recipe_no = _.maxBy(recipe, function(v) { return parseInt(v.recipeNo); }).recipeNo;
									pnl_x = _.filter(recipe, function(v) { return v.recipeNo == max_recipe_no; })[0].sizeX;
									pnl_y = _.filter(recipe, function(v) { return v.recipeNo == max_recipe_no; })[0].sizeY;
									
									$('#'+equipData.equipCd).empty();
									let html = '';
										html += '<canvas id="canvas_'+equipData.equipCd+'" width="'+(parseFloat(pnl_x)*10)+'" height="'+(parseFloat(pnl_y)*10)+'"';
										html += '		style="display: inline; height: 95%; background-color: #323539;" >';
										html += '</canvas>';
									$('#'+equipData.equipCd).append(html);

									let canvas = $('#canvas_'+equipData.equipCd)[0];

									for(var j=0;j<recipe.length;j++) {
										let recipeData = recipe[j];
										if(recipeData.recipeGb == 'Cutting') { // Cutting일 경우
											// 가운데 빈 사각형
											makeEmptyRectangle(canvas.getContext('2d'),
													parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
													parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
										} else if(recipeData.recipeGb == 'Marking') {
											// 사각형
											makeRectangle(canvas.getContext('2d'),
													parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
													parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
										} else { // 그 밖의 경우
											// 원
											makeCircle(canvas.getContext('2d'),
													parseFloat(recipeData.xaxis), parseFloat(recipeData.yaxis),
													parseFloat(recipeData.sizeX), parseFloat(recipeData.sizeY), recipeData);
										}
									}
									let max = recipe.length + 1; // 100%를 보이지 않게하기 위함
									let now = _.filter(recipe, function(v) { return v.workStatus != null; }).length;
									console.log(recipe);
									console.log(_.filter(recipe, function(v) { return v.workStatus != null; }));
									$('#progressBar_'+equipData.equipCd).css('width',(now/max*100).toFixed(1)+'%').css('background-color','#009679').text((now/max*100).toFixed(1)+'%');
								} else { // 가공취소 or 비가동
									$('#itemNm_'+equipData.equipCd).text('');
									$('#hallCount_'+equipData.equipCd).text('');
									$('#processTime_'+equipData.equipCd).text('');
									
									$('#'+equipData.equipCd).empty();
									let html = '';
										html += '<div class="text-center"';
										html += '	style="font-weight: 900; font-size: 2rem; color: #ff0000;';
										html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
										html += '	NOT working <i class="fas fa-exclamation-triangle"></i>';
										html += '</div>';
									$('#'+equipData.equipCd).append(html);
									$('#progressBar_'+equipData.equipCd).css('width','0%').css('background-color','#009679').text('');
								}
							}
							// 측정중일 경우
							else if(recipe[0].processStatus == 'C') {
								if(recipe[0].nowCheckStatus == 'S') { // 측정중
									$('#'+equipData.equipCd).empty();
									let html = '';
										html += '<div class="text-center"';
										html += '	style="font-weight: 900; font-size: 2rem; color: #00ff00;';
										html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
										html += '	측정중... <i class="fa-solid fa-microscope"></i>';
										html += '</div>';
									$('#'+equipData.equipCd).append(html);
									$('#progressBar_'+equipData.equipCd).css('width','0%').css('background-color','#009679').text('');
								} else { // 측정취소 or 비가동
									$('#itemNm_'+equipData.equipCd).text('');
									$('#hallCount_'+equipData.equipCd).text('');
									$('#processTime_'+equipData.equipCd).text('');
									
									$('#'+equipData.equipCd).empty();
									let html = '';
										html += '<div class="text-center"';
										html += '	style="font-weight: 900; font-size: 2rem; color: #ff0000;';
										html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
										html += '	NOT working <i class="fas fa-exclamation-triangle"></i>';
										html += '</div>';
									$('#'+equipData.equipCd).append(html);
									$('#progressBar_'+equipData.equipCd).css('width','0%').css('background-color','#009679').text('');
								}
							}
						}
					} else { // 비가동
						$('#itemNm_'+equipData.equipCd).text('');
						$('#hallCount_'+equipData.equipCd).text('');
						$('#processTime_'+equipData.equipCd).text('');
						
						$('#'+equipData.equipCd).empty();
						let html = '';
							html += '<div class="text-center"';
							html += '	style="font-weight: 900; font-size: 2rem; color: #ff0000;';
							html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
							html += '	NOT working <i class="fas fa-exclamation-triangle"></i>';
							html += '</div>';
						$('#'+equipData.equipCd).append(html);
						$('#progressBar_'+equipData.equipCd).css('width','0%').css('background-color','#009679').text('');
					}
				}
			} else { // 가공중인 설비가 없을 경우
				for(var i=0;i<equipList.length;i++) {
					let equipData = equipList[i];

					$('#itemNm_'+equipData.equipCd).text('');
					$('#hallCount_'+equipData.equipCd).text('');
					$('#processTime_'+equipData.equipCd).text('');
					
					$('#'+equipData.equipCd).empty();
					let html = '';
						html += '<div class="text-center"';
						html += '	style="font-weight: 900; font-size: 2rem; color: #ff0000;';
						html += '			animation: 1s step-end 0s infinite normal none running blink-effect;">';
						html += '	NOT working <i class="fas fa-exclamation-triangle"></i>';
						html += '</div>';
					$('#'+equipData.equipCd).append(html);
					$('#progressBar_'+equipData.equipCd).css('width','0%').css('background-color','#009679').text('');
				}
			}
		}

		

		let time = 1;
		$(document).ready(function() {
			$('#laser').empty();

			recipeList = getLaserData();
			equipList = getEquipList();
			equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비 목록
			for(var i=0;i<equipList.length;i++) {
				let equipData = equipList[i];
				let recipe = _.filter(recipeList, function(v) { return v.equipCd == equipData.equipCd; });

				$('#laser').append(makeHtml(equipData, recipe));
				let canvas = $('#canvas_'+equipData.equipCd)[0];
			}

			drawEquipData();

			setInterval(function() {
				drawEquipData();
			}, 5000);
		});
    </script>
</body>
</html>