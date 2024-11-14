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
	<div id="main" style="display: grid; padding: 0px; position: relative;
							height: 100vh; background-color: #111217;
							grid-template-areas:	'aside header'
													'aside section';
							grid-template-rows: 84px 1fr;
							grid-template-columns: 110px 1fr">
		<div id="header" class="container-fluid" style="grid-area: header; background-color: #111217; padding: 0px 10px 0px 10px; width: calc(100vw - 110px);">
			<div class="d-flex flex-wrap align-items-center justify-content-center" style="height: 100%; justify-content: flex-start!important;">
				<div class="d-flex align-items-center text-decoration-none h-100" style="margin-right: auto!important; font-size: 2rem;">
					<span id="subTitle"></span>
					<span style="padding: 0px 5px;">&#62;</span>
					<span id="title" data-title="후가공"></span>
				</div>
				<div class="d-flex align-items-center text-decoration-none h-100" style="font-size: 2rem; color: #ffffff;">
					충북 테스트배드 <span style="color: #ffff00; font-size: 3rem; margin-left: 10px;">MES 모니터링 관제 시스템</span>
				</div>
				<div id="nowTime" class="d-flex flex-wrap align-items-center text-decoration-none h-100" style="margin-left: auto!important; font-size: 2rem;"></div>
			</div>
	    </div>
	    
		<div id="aside" style="grid-area: aside; background-color: #db2848cc; width: 110px; height: 100vh;
								left: calc(2rem - 200px);
								overflow: auto; z-index: 10000; overflow: hidden; transition: all 0.3s ease;">
			<div style="text-align: center; padding: 10px;">
				<img class="pr-2" src="/resources/assets/monitoring/img/cbtp_logo.png?ver=1.0">
			</div>
			<div id="asideCtl"
				style="position: absolute; top: 0; right: 0; z-index: 10001;
						height: 100vh; padding: 0px 5px; width: 2rem; text-align: center;
						cursor: pointer; display: none;">
				<input type="checkbox" class="btn_toggle_arrowLR" id="btn_toggle_arrowLR_1" checked>
				<label for="btn_toggle_arrowLR_1" style="margin-top: 49vh; color: #ffffff; filter: invert(1);"></label>
			</div>
			<div>
				<ul class="list-unstyled nonScrollTable" style="font-size: 0.5rem; color: #ffffff; padding: 10px 10px 10px 10px; height: calc(100vh - 84px); overflow: auto;">
					<li>대시보드</li>
					<li class="dtl_item ps-1" onClick="location.href='mtsc1000';">- 레이저</li>
					<li class="dtl_item ps-1" onClick="location.href='mtsc2000';">- 후가공</li>
					<li class="mb-3"></li>
					<li>관리지표별</li>
					<li class="ps-1">- 레이저</li>
					<li class="dtl_item ps-2" id="mtsc1010" data-title="레이저">생산진행모니터링</li>
					<li class="dtl_item ps-2" id="mtsc1020" data-title="레이저">생산목표대비실적</li>
					<li class="dtl_item ps-2" id="mtsc1030" data-title="레이저">제조조건모니터링</li>
					<li class="dtl_item ps-2" id="mtsc1040" data-title="레이저">품질목표대비실적</li>
					<li class="dtl_item ps-2" id="mtsc1050" data-title="레이저">설비종합효율</li>
					<li class="dtl_item ps-2" id="mtsc1060" data-title="레이저">설비가동율현황</li>
					<li class="dtl_item ps-2" id="mtsc1070" data-title="레이저">설비가동/비가동</li>
					<li class="dtl_item ps-2" id="mtsc1080" data-title="레이저">무재해현황판</li>
					<li class="mb-2"></li>
					<li class="ps-1">- 후가공</li>
					<li class="dtl_item ps-2" id="mtsc2010" data-title="후가공">생산진행모니터링</li>
					<li class="dtl_item ps-2" id="mtsc2020" data-title="후가공">생산목표대비실적</li>
					<li class="dtl_item ps-2" id="mtsc2030" data-title="후가공">제조조건모니터링</li>
					<li class="dtl_item ps-2" id="mtsc2040" data-title="후가공">품질목표대비실적</li>
					<li class="dtl_item ps-2" id="mtsc2050" data-title="후가공">설비종합효율</li>
					<li class="dtl_item ps-2" id="mtsc2060" data-title="후가공">설비가동율현황</li>
					<li class="dtl_item ps-2" id="mtsc2070" data-title="후가공">설비가동/비가동</li>
					<li class="dtl_item ps-2" id="mtsc2080" data-title="후가공">무재해현황판</li>
					<li class="mb-3"></li>
					<li>공통</li>
					<li class="dtl_item ps-2" id="mtsc0010" data-title="공통">전기사용량/온도/습도</li>
					<li class="dtl_item ps-2" id="mtsc0030" data-title="공통">환영문구(문구)</li>
					<li class="dtl_item ps-2" id="mtsc0040" data-title="공통">환영문구(이미지)</li>
					<li class="dtl_item ps-2" onClick="window.location.reload()">새로고침</li>
				</ul>
			</div>
		</div>
		<div id="section_2000" style="grid-area: section;
								height: calc(100vh - 84px); background-color: #111217;
								position: relative;
								display: grid; padding: 5px;
								grid-template-areas:	'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0001 view0001 view0001 view0005 view0005 view0006'
														'view0007 view0007 tempHumi view0004 view0004 view0006'
														'view0007 view0007 tempHumi view0004 view0004 view0006'
														'view0007 view0007 tempHumi view0004 view0004 view0006'
														'view0007 view0007 view0003 view0004 view0004 view0006'
														'view0007 view0007 view0003 view0004 view0004 view0006'
														'view0007 view0007 view0003 view0004 view0004 view0006';
								grid-template-rows: repeat(12, calc((100vh - 94px)/12));
								grid-template-columns: repeat(6, 1fr);
								overflow: auto;">
			<div class="gridView" id="tempHumi" style="grid-area: tempHumi; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; text-align: center; background-color: #181b1f;">
				<div class="row justify-content-center h-100">
					<div class="d-flex flex-wrap align-items-center h-100">
						<div class="d-flex align-items-center text-decoration-none" style="font-size: 2rem; color: #f80303; margin-right: 1.5rem;" id="finishTemp">-°C</div>
						<div class="d-flex align-items-center text-decoration-none" style="font-size: 2rem; color: #0572c1;" id="finishHumi">-%</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0001" style="grid-area: view0001; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;
											position: relative;">
						<div class="d-flex flex-wrap align-items-center  h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">생산진행 모니터링</div>
						</div>
						<button type="button" class="btn btn-danger" id="btnEquipStop"
								style="position: absolute; right: 5px; top: calc((1.8rem + 18px - 32px)/2);">설비정지</button>
					</div>
					<div class="row" style="height: calc(100% - 4px - 1.8rem - 18px);">
						<div class="p-0" style="flex: 0 0 auto; width: 100%;">
							<div id="packing" class="carousel slide h-100" data-bs-ride="carousel">
								<div class="carousel-inner h-100">
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#packing" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#packing" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0007" style="grid-area: view0007; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
																	border-bottom: 1px solid #ffffffbb;
																	padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">가동 비가동 현황</div>
						</div>
					</div>
					<div class="row" style="height: calc(100% - 32px);">
						<table class="table table-bordered table-dark p-0" style="font-size: 1.2rem;">
							<thead>
								<tr>
									<th class="text-center align-middle">설비</th>
									<th class="text-center align-middle">지시수량</th>
									<th class="text-center align-middle">실적수량</th>
									<th class="text-center align-middle">실적률</th>
								</tr>
							</thead>
       						<tbody id="equipStatus">
       						</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">전체 전기사용량</div>
						</div>
					</div>
					<div class="row" style="padding: 6px; height: calc(100% - 1.8rem - 18px);">
						<div class="p-0 d-flex align-items-center justify-content-center" style="flex: 0 0 auto; height: 100%; width: 100%;" id="monthStatusDiv">
							<canvas id="monthStatus" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
																	border-bottom: 1px solid #ffffffbb;
																	padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">실적 현황</div>
						</div>
					</div>
					<div class="row" style="padding: 6px; height: calc((100% - 1.8rem - 18px)/2);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; width: 100%; height: 100%;">
							<canvas id="pStatus" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
					<div class="row" style="padding: 0px 6px 6px 6px; height: calc((100% - 1.8rem - 18px)/2);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; width: 100%; height: 100%;">
							<canvas id="qStatus" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
																	border-bottom: 1px solid #ffffffbb;
																	padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">제조조건 모니터링</div>
						</div>
					</div>
					<div class="row" style="padding: 0px 6px 5px 6px; height: calc((100% - 1.8rem - 18px - 10px)/3);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; width: 100%; height: 100%;" id="mCondition_1Div">
							<canvas id="mCondition_1" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
					<div class="row" style="padding: 0px 6px 5px 6px; height: calc((100% - 1.8rem - 18px - 10px)/3);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; width: 100%; height: 100%;" id="mCondition_2Div">
							<canvas id="mCondition_2" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
					<div class="row" style="padding: 0px 6px 0px 6px; height: calc((100% - 1.8rem - 18px - 10px)/3);">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto; width: 100%; height: 100%;" id="mCondition_3Div">
							<canvas id="mCondition_3" style="background-color: #323539; padding: 5px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="gridView" id="view0006" style="grid-area: view0006; margin: 5px; border: 1px solid #ffffffbb; border-radius: 5px; background-color: #181b1f;">
				<div class="container-fluid p-0 h-100">
					<div class="row justify-content-center" style="height: calc(1.8rem + 18px);
											border-bottom: 1px solid #ffffffbb;
											padding: 0px 5px;">
						<div class="d-flex flex-wrap align-items-center justify-content-center h-100">
							<div class="d-flex align-items-center text-decoration-none" style="font-size: 1.8rem;">종합효율</div>
						</div>
					</div>
					<div class="row">
						<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; width: 100%; height: 210px; width: 100%;">
							<canvas id="workStatusPie1" style="display:inline;"></canvas>
						</div>
						<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; width: 100%; height: 210px; width: 100%;">
							<canvas id="workStatusPie2" style="display:inline;"></canvas>
						</div>
						<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; width: 100%; height: 210px; width: 100%;">
							<canvas id="workStatusPie3" style="display:inline;"></canvas>
						</div>
						<div class="workStatusPie p-0 text-center" style="flex: 0 0 auto; width: 100%; height: 210px; width: 100%;">
							<canvas id="workStatusPie4" style="display:inline;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<!-- 상세 영역 -->
			<div id="dtlView"
				style="position: absolute; top: 0; left: 0; z-index: 9999;
						height: calc(100vh - 84px);
						background-color: #111217; padding: 5px;
						transition: all 0.4s ease;">
			</div>
		</div>
	</div>
	
	<!-- 설비정지 경고 modal -->
	<div class="modal fade" id="equipStopModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="color: #000000;">
						<i class="fa-solid fa-triangle-exclamation text-warning"></i> 경고
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="color: #000000;">
					설비를 정지하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnEquipStopModalY" data-bs-dismiss="modal" style="width: 100px;">
						예
					</button>
					<button type="button" class="btn btn-secondary" id="btnEquipStopModalN" data-bs-dismiss="modal" style="width: 100px;">
						아니요
					</button>
				</div>
			</div>
		</div>
	</div>
<script>
	$('#title').text('후가공');
	$('#subTitle').text('대시보드');

	setInterval(function() {
		$('#nowTime').text(moment().format('YYYY.MM.DD HH:mm:ss'));
	},500);

	// 모바일 화면 회전 event
	$(window).on("orientationchange",function(){
		window.location.reload();
	});

	

	let equipList = [];
	let recipeList = [];
	let packingData = [];

	// 메뉴 선택
	$('.dtl_item').on('click', function() {
		$('#my-spinner').show();

		let id = $(this).attr('id');
		let title = $(this).data('title');
		let subTitle = $(this).text();

		if(id == undefined) {
			return false;
		}

		$('#title').text(title);
		$('#subTitle').text(subTitle);

		setTimeout(function() {
			$('#dtlView').empty();
			let html = '';
				html += '<iframe class="w-100" src="/'+id+'"';
				html += '	style="height: calc(100vh - 95px);">';
				html += '</iframe>';
			    
			$('#dtlView').append(html);

			$('#dtlView').find('iframe').off('load');
			$('#dtlView').find('iframe').on('load', function() {
				$('#my-spinner').hide();
				$('#dtlView').css('width','100%');
				$('#section_2000').css('overflow','hidden');
				$('#section_2000').animate({scrollTop: 0}, 0);
			});
		}, 400);
	});

	// 좌측메뉴 열고닫기
	$('#asideCtl').on('click', function() {
		let state = $('#btn_toggle_arrowLR_1').prop('checked');
		if(state) {
			$('#btn_toggle_arrowLR_1').prop('checked',false);
			$('#aside').css('left','0');
		} else {
			$('#btn_toggle_arrowLR_1').prop('checked',true);
			$('#aside').css('left','calc(2rem - 200px)');
		}
	});

	// 상세화면 상태값 조회
	function getDtlMenuStatus() {
		if($('#dtlView').find('iframe').length == 0) {
			return true;
		} else {
			return false;
		}
	}

	
	$(document).ready(function() {

		equipList = getEquipList();
		equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비 목록

		$('#packing').find('.carousel-inner').empty();
		$('#equipStatus').empty();
		
		for(var i=0;i<equipList.length;i++) {
			let equipData = equipList[i];
			$('#packing').find('.carousel-inner').append(makeHtml(equipData));
			$('#equipStatus').append(getEquipStatusHtml(equipData));
		}
		
		$('#packing').find('.carousel-inner').find('.carousel-item').eq(0).addClass('active');

		setPackingData();
		setEquipStatus();
		qStatusUpdate();
		setHumiTempElec();
		chartUpdate();
	});

 	setInterval(function() { if(getDtlMenuStatus()) setPackingData(); }, 5000); // 생산진행 모니터링
 	setInterval(function() { if(getDtlMenuStatus()) setEquipStatus(); }, 5000); // 가동 비가동 현황
 	setInterval(function() { if(getDtlMenuStatus()) qStatusUpdate(); }, 600000); // 품질목표대비
 	setInterval(function() { if(getDtlMenuStatus()) setHumiTempElec(); }, 5000);
 	setInterval(function() { if(getDtlMenuStatus()) chartUpdate(); }, 60000); // 설비종합효율
	setInterval(function() { if(getDtlMenuStatus()) setFinishOperInfo(); }, 5000); // 제조조건 모니터링
</script>
<!---------------------------------------- 생산진행 모니터링 ---------------------------------------->
<script>

	// 후가공 설비목록 조회
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

	// 후가공 생산실적 모니터링 조회
	function setPackingData() {
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
				
				for(var i=0;i<equipList.length;i++) {
					let equipData = equipList[i];
					let equipCd = equipData.equipCd;
					let targetQty = startData.dtlOrdCnt;

					$('#'+equipCd+'-equipNm').html(equipData.equipNm);
					$('#'+equipCd+'-workOrdNo').html(RT_data.workOrdNo);
					$('#'+equipCd+'-itemNm').html(RT_data.itemNm);
					$('#'+equipCd+'-targetQty').html(addCommas(parseInt(targetQty)));
					$('#'+equipCd+'-fillTargetQty').html(addCommas(parseInt(targetQty)));

					// 충진
					let fillOutputCount = Math.abs(RT_data.fillOutputCount);
					let fillFaultyCount = 0;
					let fillFairCount = Math.abs(fillOutputCount - fillFaultyCount);
					let fillCountPer = ((fillFairCount) / targetQty * 100).toFixed(1)+'%';
					let fillOperStatus = recentData.FillOperStatus;
					
					$('#'+equipCd+'-fillOutputCount').html(addCommas(fillOutputCount));
					$('#'+equipCd+'-fillFairCount').html(addCommas(fillFairCount));
					$('#'+equipCd+'-fillFaultyCount').html(addCommas(fillFaultyCount));
					$('#'+equipCd+'-fillCountPer').html(fillCountPer);
					switch(fillOperStatus) {
						case false: $('#'+equipCd+'-fillOperStatus').text('비가동').css('color','#ff0000'); break;
						case true: $('#'+equipCd+'-fillOperStatus').text('가동중').css('color','#00ff00'); break;
					}
					

					

					// 캡핑
					let capOutputCount = Math.abs(RT_data.capOutputCount);
					let capFaultyCount = Math.abs(RT_data.wchkExNgCount + RT_data.wchkNgCount);
					let capFairCount = Math.abs(capOutputCount - capFaultyCount);
					let capCountPer = (capFairCount / (targetQty / 8) * 100).toFixed(1)+'%';
					let capOperStatus = recentData.CapOperStatus;
					
					$('#'+equipCd+'-capOutputCount').html(addCommas(capOutputCount));
					$('#'+equipCd+'-capFairCount').html(addCommas(capFairCount));
					$('#'+equipCd+'-capFaultyCount').html(addCommas(capFaultyCount));
					$('#'+equipCd+'-capCountPer').html(capCountPer);
					switch(capOperStatus) {
						case false: $('#'+equipCd+'-capOperStatus').text('비가동').css('color','#ff0000'); break;
						case true: $('#'+equipCd+'-capOperStatus').text('가동중').css('color','#00ff00'); break;
					}


					
					// 박스
					let boxOutputCount = Math.abs(RT_data.boxOutputCount);
					let boxFaultyCount = 0;
					let boxFairCount = Math.abs(boxOutputCount - boxFaultyCount);
					let boxCountPer = ((boxFairCount) / (targetQty / 8 / 10) * 100).toFixed(1)+'%';
					let boxOperStatus = recentData.BoxMoldOperStatus;
					
					$('#'+equipCd+'-boxOutputCount').html(addCommas(boxOutputCount));
					$('#'+equipCd+'-boxFairCount').html(addCommas(boxFairCount));
					$('#'+equipCd+'-boxFaultyCount').html(addCommas(boxFaultyCount));
					$('#'+equipCd+'-boxCountPer').html(boxCountPer);
					switch(boxOperStatus) {
						case false: $('#'+equipCd+'-boxOperStatus').text('비가동').css('color','#ff0000'); break;
						case true: $('#'+equipCd+'-boxOperStatus').text('가동중').css('color','#00ff00'); break;
					}
				}
			}
		});
	}

	// makeHtml
	function makeHtml(equipData) {
		let equipCd = equipData.equipCd;
		
		let html = '';
			html += '<div class="carousel-item h-100" data-bs-interval="5000">';
			html += '<div style="flex: 0 0 auto; width: 100%; background-color: #171823; height: 100%;">';
			html += '	<div style="background-color: #181b1f; border: 1px solid #ccccdc12; margin: 5px; padding: 0px; height: 100%;">';
			html += '		<table class="table table-dark table-bordered m-0" style="font-size: 1.1rem; height: 20%;">';
			html += '			<colgroup>';
			html += '				<col width="15%">';
			html += '				<col width="35%">';
			html += '				<col width="15%">';
			html += '				<col width="35%">';
			html += '			</colgroup>';
			html += '			<tr>';
			html += '				<th class="text-center align-middle">생산라인</th>';
			html += '				<td class="text-center align-middle" id="'+equipCd+'-equipNm">-</td>';
			html += '				<th class="text-center align-middle">작지서</th>';
			html += '				<td class="text-center align-middle" id="'+equipCd+'-workOrdNo">-</td>';
			html += '			</tr>';
			html += '			<tr>';
			html += '				<th class="text-center align-middle">제품</th>';
			html += '				<td class="text-center align-middle" id="'+equipCd+'-itemNm">-</td>';
			html += '				<th class="text-center align-middle">지시수량</th>';
			html += '				<td class="text-center align-middle" id="'+equipCd+'-targetQty">-</td>';
			html += '			</tr>';
			html += '		</table>';
			html += '		<table class="table table-dark table-bordered" style="font-size: 1.1rem; height: calc(80% - 11px); margin-top: 5px; margin-bottom: 0px;">';
			html += '			<colgroup>';
			html += '				<col width="16%">';
			html += '				<col width="16%">';
			html += '				<col width="16%">';
			html += '				<col width="16%">';
			html += '				<col width="16%">';
			html += '				<col width="16%">';
			html += '			</colgroup>';
			html += '			<tbody>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle" colspan="2">충 진</th>';
			html += '					<th class="text-center align-middle" colspan="2">포 장</th>';
			html += '					<th class="text-center align-middle" colspan="2">박 스</th>';
			html += '				</tr>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle">지시수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillTargetQty">-</td>';
			html += '					<th class="text-center align-middle" colspan="2">실적/지시수량</th>';
			html += '					<th class="text-center align-middle" colspan="2">실적/지시수량</th>';
			html += '				</tr>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle">실적수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillOutputCount">-</td>';
			html += '					<td class="text-center align-middle" colspan="2" id="'+equipCd+'-capOutputCount">-</td>';
			html += '					<td class="text-center align-middle" colspan="2" id="'+equipCd+'-boxOutputCount">-</td>';
			html += '				</tr>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle">양품수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillFairCount">-</td>';
			html += '					<th class="text-center align-middle">양품수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-capFairCount">-</td>';
			html += '					<th class="text-center align-middle">양품수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-boxFairCount">-</td>';
			html += '				</tr>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle">불량수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillFaultyCount">-</td>';
			html += '					<th class="text-center align-middle">불량수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-capFaultyCount">-</td>';
			html += '					<th class="text-center align-middle">불량수량</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-boxFaultyCount">-</td>';
			html += '				</tr>';
			html += '					<th class="text-center align-middle">진척률</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillCountPer">-</td>';
			html += '					<th class="text-center align-middle">진척률</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-capCountPer">-</td>';
			html += '					<th class="text-center align-middle">진척률</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-boxCountPer">-</td>';
			html += '				</tr>';
			html += '				<tr>';
			html += '					<th class="text-center align-middle">가동상태</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-fillOperStatus">-</td>';
			html += '					<th class="text-center align-middle">가동상태</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-capOperStatus">-</td>';
			html += '					<th class="text-center align-middle">가동상태</th>';
			html += '					<td class="text-center align-middle" id="'+equipCd+'-boxOperStatus">-</td>';
			html += '				</tr>';
			html += '			</tbody>';
			html += '		</table>';
			html += '	</div>';
			html += '</div>';
			html += '</div>';
			
		return html;
	}

	// 설비정지 버튼 click
	$('#btnEquipStop').on('click', function() {
		$('#equipStopModal').modal('show');
		
	});

	// 설비정지 모달 "예" 버튼 click
	$('#btnEquipStopModalY').on('click', function() {
		$.ajax({
			url: '<c:url value="mt/packingStop"/>',
            type: 'POST',
            data: {
			},
			beforeSend: function() {
				toastr.success('설비를 정지합니다...');
			},
			success : function(res) {
				let result = res.result;
				if(result == 'ok') {
					toastr.success('설비가 정지되었습니다.');
				} else {
					toastr.error(res.message);
				}
			}
		});
	})
</script>
<!---------------------------------------- 생산진행 모니터링 ---------------------------------------->
<!---------------------------------------- 가동 비가동 현황 ---------------------------------------->
<script>
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
	
	// 기간별 LASER 실적조회
	function getLaserOperInfoCntByDate(startDatetime, endDatetime) {
		let result = '';
		$.ajax({
			url: '<c:url value="mt/laserOperInfoCntByDate"/>',
	        type: 'POST',
	        async: false,
	        data: {
	            'prcNm'			: '002',
	        	'startDatetime'	: startDatetime,
	        	'endDatetime'	: endDatetime
	        },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}
	
	// 가동 비가동 현황 html
	function getEquipStatusHtml(equipData) {
		let html = '';
			html += '';
			html += '<tr id="equipStatus_'+equipData.equipCd+'">';
			html += '	<td class="text-center align-middle">'+equipData.equipNm+'</td>';
			html += '	<td class="text-center align-middle" id="dtlOrdCnt_'+equipData.equipCd+'">0</td>';
			html += '	<td class="text-center align-middle" id="workOrdCnt_'+equipData.equipCd+'">0</td>';
			html += '	<td class="text-center align-middle" id="workCntPer_'+equipData.equipCd+'">0%</td>';
			html += '</tr>';
		return html;
	}

	// 설비 가동 비가동 현황 적용
	function setEquipStatus() {
		// schedule 목록
		let orderList = [];

		// 기간별 계획목록 조회
		let assignLst = getAdvPlanScheduleLstByDate(moment().format('YYYYMMDD0000'), moment().format('YYYYMMDD2359'));
		
		// 기간별 계획정지 목록조회
		let planStopLst = getPlanStopLstByDateGroup('', moment().format('YYYYMMDD0000'), moment().format('YYYYMMDD2359'));
		
		// 기간별 공장력 목록조회
		let factCalLst = getFactoryCalendarLstByDate(moment().format('YYYYMMDD'), moment().format('YYYYMMDD'));

		// 기간별 LASER 실적조회
		let workCntList = getLaserOperInfoCntByDate(moment().format('YYYY-MM-DD 00:00:00.000'), moment().format('YYYY-MM-DD 23:59:59.999'));

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
				
				for(var i=0;i<equipList.length;i++) {
					let equipData = equipList[i];
					let equipCd = equipData.equipCd;
					let targetQty = startData.dtlOrdCnt;

					// 충진
					let fillOutputCount = RT_data.fillOutputCount;
					let fillFaultyCount = 0;
					let fillFairCount = fillOutputCount - fillFaultyCount;
					let fillCountPer = ((fillFairCount) / targetQty * 100).toFixed(1)+'%';
					
					$('#dtlOrdCnt_'+equipCd).text(addCommas(parseInt(targetQty)));
					$('#workOrdCnt_'+equipCd).html(addCommas(fillOutputCount));
					$('#workCntPer_'+equipCd).html(((fillOutputCount) / parseInt(targetQty) * 100).toFixed(1)+'%');
					
				}
			}
		});
	}
</script>
<!---------------------------------------- 가동 비가동 현황 ---------------------------------------->
<!---------------------------------------- 전체 전기사용량 ---------------------------------------->
<script>

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

	function makeZero(data) {
		if (data < 10)
			return "0" + data;
		else
			return data;
	}
	
	function getIndexList(cnt, postFix) {
		let result = [];
		for(var i=0;i<cnt;i++) {
			result.push((i+1)+postFix);
		}
		return result;
	}
	
	//전체 공장동
// 	function makeMonthStatus() {
	let momentStatusData = [laserDataArrM, afterProcessDataArrM];
	const monthStatus = new Chart(
		document.getElementById('monthStatus'),
		{
			type: 'bar',
			data: {
				labels: getIndexList(12, '월'),
				datasets: [
				{
					label: '후가공공장동(kWh)',
					backgroundColor: '#609fd2',
					borderColor: '#5195ce',
					data: [],
				}
				]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				scales: {
					x: {
						grid: {
							display: true,
							color: '#cccccc22'
						},
		                display: true,
		                font: {
			                size: 5,
			                color: '#ffffff',
			            },
			            ticks: {
		                	color: '#ffffff',
			            }
		            },
		            y: {
		            	grid: {
		            		display: true,
							color: '#cccccc22'
						},
		                display: true,
		                font: {
			                size: 5,
			                color: '#ffffff',
			            },
			            ticks: {
		                	color: '#ffffff',
			            },
			            suggestedMin: 0,
		                suggestedMax: 1500
		            }
		        },
				plugins: {
					legend: {
						position: 'top',
						display: false,
					},
					title: {
						display: false,
						text: '전체 공장동',
						font: {
							size: 20
						}
					},
					datalabels : {
						display: false
					}
				}
			}
		}
	);
// 	}



	

	function setHumiTempElec() {
		// 전체 전기사용량 데이터 가져오기
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
					afterProcessDataArr = new Array();				// 후가공 공장동 전기 사용량 데이터
					afterProcessDataArrM = new Array(12).fill(0);	// 후가공 공장동 월별 전기 사용량 데이터
					
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

					monthStatus.data.datasets[0].data = afterProcessDataArrM;
					monthStatus.update();
					
					//차트 초기화
// 					$('#monthStatus').remove();
// 					$('#monthStatusDiv').append('<canvas id="monthStatus"><canvas>');
					
// 					makeMonthStatus();
				} else {
					toastr.error(res.message);
				}
			},
		});


		// 온습도 데이터 가져오기
		$.ajax({
			url : 'mt/controllSystemFinish',
			type : 'post',
			async : false,
			data : {
				'startDate'  	: function() { return moment().subtract(2, 'H').format("YYYY-MM-DDTHH:mm:ss"); },
				'endDate'  		: function() { return moment().format("YYYY-MM-DDTHH:mm:ss"); },
			},
			success : function(res) {
				// 습도
				$("#finishHumi").empty();
				$("#finishTemp").empty();

				if(res.data == undefined || res.data == null) {
					$("#finishHumi").append("-%");
					$("#finishTemp").append("-°C");
				} else {
					$("#finishHumi").append(res.data.airCondHumi + "%");
					$("#finishTemp").append((parseFloat(res.data.airCondTemp) / 10).toFixed(1) + "°C");
				}
				
			}
		});
	}
</script>
<!---------------------------------------- 전체 전기사용량 ---------------------------------------->
<!---------------------------------------- 제조조건 모니터링 ---------------------------------------->
<script>
	let finishCarousel = document.getElementById('packing')
	finishCarousel.addEventListener('slide.bs.carousel', function (item) {
		//setFinishOperInfo(item.to);
	})
	
	function setFinishOperInfo(step = 0) {
// 	  	let activeEquipCd = equipList[step].equipCd; // 바뀔 설비코드
// 	  	let recipeByEquipCd = _.groupBy(recipeList, 'equipCd'); // 설비코드 그룹화로 정렬
	  	let stageCount = 0;
	  	let tempPressTimeVal;
	
// 	  	if (recipeByEquipCd[activeEquipCd] != undefined) {
// 		  	let activeWorkOrdNo = recipeByEquipCd[activeEquipCd][0].workOrdNo;
	
		  	$.ajax({
				url: '<c:url value="mt/finishOperInfoDtlList"/>',
	            type: 'POST',
	            async: false,
	            data: {
// 					'workOrdNo' : function() {return activeWorkOrdNo;},s
				},
				success : function(res) {
					tempPressTimeVal = res.data;
					stageCount = tempPressTimeVal.length;
				}
			});
// 	  	}
		
		let finishPFTempDataArr = new Array(stageCount).fill(null);
		let finishSFTempDataArr = new Array(stageCount).fill(null);
		let finishPBTempDataArr = new Array(stageCount).fill(null);
		let finishSBTempDataArr = new Array(stageCount).fill(null);
		let finishPressDataArr = new Array(stageCount).fill(null);
		let finishTimeDataArr = new Array(stageCount).fill(null);
		let finishLabelArr = new Array(stageCount).fill(null);
		
		$.each(tempPressTimeVal, function(index, item) {
			finishPFTempDataArr[index] = (item.fillPvFrontTemp == undefined) ? null : item.fillPvFrontTemp;
			finishSFTempDataArr[index] = (item.fillSvFrontTemp == undefined) ? null : item.fillSvFrontTemp;
			finishPBTempDataArr[index] = (item.fillPvBackTemp == undefined) ? null : item.fillPvBackTemp;
			finishSBTempDataArr[index] = (item.fillSvBackTemp == undefined) ? null : item.fillSvBackTemp;
			finishPressDataArr[index] = (item.fillPressure == undefined) ? null : item.fillPressure;
			finishTimeDataArr[index] = (item.fillNozzle1OpenTime == undefined) ? null : item.fillNozzle1OpenTime;
			finishLabelArr[index] = '';
		})
		
		//차트 초기화
// 		$('#mCondition_1').remove();
// 		$('#mCondition_1Div').append('<canvas id="mCondition_1"><canvas>');
// 		$('#mCondition_2').remove();
// 	 	$('#mCondition_2Div').append('<canvas id="mCondition_2"><canvas>');
// 		$('#mCondition_3').remove();
// 	 	$('#mCondition_3Div').append('<canvas id="mCondition_3"><canvas>');
	
// 		makeMCondition_1(finishLabelArr, finishTempDataArr);
// 		makeMCondition_2(finishLabelArr, finishPressDataArr);
// 		makeMCondition_3(finishLabelArr, finishTimeDataArr);

		finishPFTempDataArr = _.reverse(finishPFTempDataArr);
		finishSFTempDataArr = _.reverse(finishSFTempDataArr);
		finishPBTempDataArr = _.reverse(finishPBTempDataArr);
		finishSBTempDataArr = _.reverse(finishSBTempDataArr);
		finishPressDataArr = _.reverse(finishPressDataArr);
		finishTimeDataArr = _.reverse(finishTimeDataArr);

		mCondition_1.data.labels = finishLabelArr;
		mCondition_2.data.labels = finishLabelArr;
		mCondition_3.data.labels = finishLabelArr;
		mCondition_1.data.datasets[0].data = finishPFTempDataArr;
		mCondition_1.data.datasets[1].data = finishSFTempDataArr;
		mCondition_1.data.datasets[2].data = finishPBTempDataArr;
		mCondition_1.data.datasets[3].data = finishSBTempDataArr;
		mCondition_2.data.datasets[0].data = finishPressDataArr;
		mCondition_3.data.datasets[0].data = finishTimeDataArr;
		mCondition_1.update();
		mCondition_2.update();
		mCondition_3.update();
	}
	
// 	makeMCondition_1(finishLabelArr, finishTempDataArr);
// 	makeMCondition_2(finishLabelArr, finishPressDataArr);
// 	makeMCondition_3(finishLabelArr, finishTimeDataArr);
	
// 	function makeMCondition_1(labelArr, dataArr) {
	// 출력
		const mCondition_1 = new Chart(
			document.getElementById('mCondition_1'),
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
					animation: {
						duration: 0
				    },
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							},
							ticks: {
			                	color: '#ffffff',
				            }
						},
			            y: {
			            	grid: {
			            		display: true,
								color: '#cccccc22'
							},
			                suggestedMin: 160,
			                suggestedMax: 170,
			                ticks: {
			                	color: '#ffffff',
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
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: 170,
							        yMax: 170,
							        borderColor: '#00ff00',
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
							text: '온         도',
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
// 	}
// 	function makeMCondition_2(labelArr, dataArr) {
	// 온도
		const mCondition_2 = new Chart(
			document.getElementById('mCondition_2'),
			{
				type: 'line',
				data: {
					labels: [],
					datasets: [{
						label: '압력',
						backgroundColor: '#70DBED',
						borderColor: '#70DBED',
						data: [],
						pointRadius: 0
					}]
				},
				options: {
					animation: {
						duration: 0
				    },
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							},
							ticks: {
			                	color: '#ffffff',
				            }
						},
			            y: {
			            	grid: {
			            		display: true,
								color: '#cccccc22'
							},
			                suggestedMin: 60,
			                suggestedMax: 70,
			                ticks: {
			                	color: '#ffffff',
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
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: 70,
							        yMax: 70,
							        borderColor: '#00ff00',
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
							text: '압         력',
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
// 	}
// 	function makeMCondition_3(labelArr, dataArr) {
		// 온도
		const mCondition_3 = new Chart(
			document.getElementById('mCondition_3'),
			{
				type: 'line',
				data: {
					labels: [],
					datasets: [{
						label: '시간',
						backgroundColor: '#70DBED',
						borderColor: '#70DBED',
						data: [],
						pointRadius: 0
					}]
				},
				options: {
					animation: {
						duration: 0
				    },
					responsive: true,
					scales: {
						x: {
							grid: {
								display: false
							},
							ticks: {
			                	color: '#ffffff',
				            }
						},
			            y: {
			            	grid: {
			            		display: true,
								color: '#cccccc22'
							},
			                suggestedMin: 15,
			                suggestedMax: 25,
			                ticks: {
			                	color: '#ffffff',
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
							        borderColor: '#ff0000',
							        borderWidth: 2,
					        	},
					        	line2: {
							        type: 'line',
							    	yMin: 25,
							        yMax: 25,
							        borderColor: '#00ff00',
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
							text: '시         간',
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
// 	}
</script>
<!---------------------------------------- 제조조건 모니터링 ---------------------------------------->
<!---------------------------------------- 실적 현황 ---------------------------------------->
<script>
	let thisYearData = new Array(5)

	$(document).ready(function() {
		let thisYearVal = moment().format("YYYY"); // 올해
	
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
	
		makeThisYearPStatus(thisYearData);
	});
	
	
	//목표대비실적(이번년도)
	function makeThisYearPStatus(thisYearData) {
		const pStatus = new Chart(
			document.getElementById('pStatus'),
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
							text: '생산목표대비',
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
	}
	// 품질목표대비
	const qStatus = new Chart(
		document.getElementById('qStatus'),
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
		                suggestedMax: 1,
		                position: 'left',
		                ticks: {
		                	color: '#ffffff',
		                	callback: function(v) {
				                return v;
				            }
			            }
		            },
		            y2: {
		            	grid: {
							display: false,
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
						text: '품질목표대비',
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
<!---------------------------------------- 실적 현황 ---------------------------------------->
<!---------------------------------------- 현재날짜의 품질목표대비 읽어오기 ---------------------------------------->
<script>
	function qStatusUpdate() {
		let dataArray = new Array();
		let grapeDataList;
		for(let i = 1; i<=12; i++) {
			let rowData = new Object();
			rowData.mainGubun = '002';
			let dayValue = '';
			if(i<10) {
				dayValue = '0' + i;
			} else {
				dayValue = i;
			}
			rowData.searchYear = moment().format('YYYYMM');
			rowData.searchDate = moment().format('YYYY') + dayValue;
			dataArray.push(rowData);
		}
// 		// console.log(dataArray)
		$.ajax({
			url: '<c:url value="mt/faultyPercentYearList"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
            async : false,
            success: function (res) {
                if(res.result == 'ok') {
	                grapeDataList = res.grapeDataList;
                } else {
                    toastr.error(res.message);
                }
			}
		});
		
		let faultyPercentList = new Array();	//불량률
		let productionQtyGrape = new Array();	//생산수량
		let faultyQtyGrape = new Array();		//불량수량
		let maxYValue = 0;						//y 최대값
		for(let i=1; i<=grapeDataList.length; i++) {
			//생산수량
			let productionQty = grapeDataList[i-1].productionQty;
			//불량수량
			let faultyQty = grapeDataList[i-1].faultyQty;
			if(faultyQty==0) {
				faultyPercentList.push("");
			} else {
				faultyPercentList.push((faultyQty/productionQty*100).toFixed(1));
			}
			productionQtyGrape.push(productionQty);
			faultyQtyGrape.push(faultyQty);
			if(maxYValue<productionQty) {
				maxYValue = productionQty;
			}
		}
// 		// console.log(faultyPercentList)
// 		// console.log(productionQtyGrape)
// 		// console.log(faultyQtyGrape)
		qStatus.options.scales.y1.suggestedMax = maxYValue;
		qStatus.data.datasets[0].data = faultyPercentList;
		qStatus.data.datasets[1].data = productionQtyGrape;
		qStatus.data.datasets[2].data = faultyQtyGrape;
		qStatus.update();
	}
</script>
<!---------------------------------------- 현재날짜의 풀질목표대비 읽어오기 ---------------------------------------->
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>
	//종합효율
	const workStatusPie1 = new Chart(
		document.getElementById('workStatusPie1'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
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
	
	// 시간가동율
	const workStatusPie2 = new Chart(
		document.getElementById('workStatusPie2'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
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
	
	// 성능가동율
	const workStatusPie3 = new Chart(
		document.getElementById('workStatusPie3'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
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
	
	// 양품율
	const workStatusPie4 = new Chart(
		document.getElementById('workStatusPie4'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
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

	function chartUpdate() {
		
		let monthPie1_1 = 0;
		let monthPie1_2 = 0;
		let monthPie2_1 = 0;
		let monthPie2_2 = 0;
		let monthPie3_1 = 0;
		let monthPie3_2 = 0;
		let monthPie4_1 = 0;
		let monthPie4_2 = 0;
		
		$.ajax({
			url: '<c:url value="mt/equipTotalEfficiencyDataReadToDashboard"/>',
	        type: 'POST',
	        async : false,
	        data: {
	            'mainGubun'	:	'002',
	            'searchDate':	moment().format('yyyyMM'),
			},
			success : function(res) {
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
			}
		});
		
		workStatusPie1.data.datasets[0].data = [monthPie3_1.toFixed(1),monthPie3_2.toFixed(1)];
		workStatusPie1.update();
		workStatusPie2.data.datasets[0].data = [monthPie1_1.toFixed(1),monthPie1_2.toFixed(1)];
		workStatusPie2.update();
		workStatusPie3.data.datasets[0].data = [monthPie4_1.toFixed(1),monthPie4_2.toFixed(1)];
		workStatusPie3.update();
		workStatusPie4.data.datasets[0].data = [monthPie2_1.toFixed(1),monthPie2_2.toFixed(1)];
		workStatusPie4.update();
	}
</script>
<!---------------------------------------- 종합효율 ---------------------------------------->
<script>
	//휠 스크롤 확대축소할 때
	$(window).on('resize', function(event){
	});
</script>
</body>
</html>