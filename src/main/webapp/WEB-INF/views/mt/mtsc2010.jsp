<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<style>
	@media all and (min-width: 951px) and (max-width: 1919px) {
		#dtlMain {
			grid-template-areas:	'view0002 view0006 view0006'
									'view0002 view0006 view0006'
									'view0002 view0006 view0006'
									'view0002 view0006 view0006'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005'
									'view0003 view0004 view0005' !important;
			grid-template-rows: repeat(12, 60px) !important;
			grid-template-columns: 1fr 1fr 1fr !important;
		}
	}
	
	@media all and (min-width: 0px) and (max-width: 950px) {
		#dtlMain {
			grid-template-areas:	'view0002'
									'view0002'
									'view0002'
									'view0006'
									'view0006'
									'view0006'
									'view0003'
									'view0003'
									'view0003'
									'view0003'
									'view0004'
									'view0004'
									'view0004'
									'view0004'
									'view0005'
									'view0005'
									'view0005'
									'view0005' !important;
			grid-template-rows: repeat(19, 60px) !important;
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
											grid-template-areas:	'view0002 view0006 view0006 view0006'
																	'view0002 view0006 view0006 view0006'
																	'view0002 view0006 view0006 view0006'
																	'view0002 view0006 view0006 view0006'
																	'view0002 view0006 view0006 view0006'
																	'view0002 view0006 view0006 view0006'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005'
																	'view0002 view0003 view0004 view0005';
											grid-template-rows: repeat(14, 60px);
											grid-template-columns: 1fr 1fr 1fr 1fr;
											overflow: auto;">
			<div class="gridView" id="view0002" style="grid-area: view0002; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark table-hover p-0 m-0" style="font-size: 1.5rem;" id='packingOperInfoEquipTable'>
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle p-2">라인목록</th>
								<th class="text-center align-middle p-2">상태</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div class="gridView" id="view0003" style="grid-area: view0003; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle p-2" colspan='4'>충진 공정</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border: #171823;">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">지시 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capOrdCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">실적 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capInputCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823;">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">양품 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capOutputCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">불량수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capFaultyCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823;">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">진척률</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capRate" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">상태</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="capOperStatus" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
    			</div>
    		</div>
			<div class="gridView" id="view0004" style="grid-area: view0004; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle p-2" colspan='4'>비닐포장 공정</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border: #171823; height: 33.3%">
								<td colspan='4' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">실적/지시 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="packCalCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823; height: 33.3%">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">양품 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="packOutputCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">불량수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="packFaultyCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823;">
								<td style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">경량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="wchkUnderCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">정량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="wchkRqtCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">과량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="wchkOverCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">NG</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="wchkNgCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823; height: 33.3%">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">진척률</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="packRate" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">상태</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="packOperStatus" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
    			</div>
    		</div>
			<div class="gridView" id="view0005" style="grid-area: view0005; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle p-2" colspan='4'>박스포장 공정</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border: #171823;">
								<td colspan='4' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">실적/지시 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="boxCalCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823;">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">양품 수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="boxOutputCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">불량수량</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="boxFaultyCount" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr style="border: #171823;">
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">진척률</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="boxRate" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
								<td colspan='2' style="background: #171823; padding: 0px;">
									<div class="w-100 h-100" style="padding: 5px;">
										<div class="h-100" style="border-radius:10px;height: 100%;background: #cdd7e5; padding: 5px;">
											<h5 class="mnt_card_tit" style="color: #124082;">상태</h5>
											<div class="" style="margin-top: 10px;">
												<h1 class="text-green" style="text-align:center; margin:0;"><span id="boxOperStatus" class="resetValue" style="color: #124082;">-</span></h1>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
    			</div>
    		</div>
    		<div class="gridView" id="view0006" style="grid-area: view0006; margin: 5px; text-align: center; border: 1px solid #ffffffbb; border-radius: 5px;" >
				<div class="row justify-content-center">
					<table class="table table-bordered table-dark p-0 m-0" style="font-size: 1.5rem;">
						<colgroup>
							<col width="30%">
							<col width="70%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center align-middle p-2" colspan='2' style="font-size: 1.5rem" id="infoTitle">후가공</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="text-center align-middle p-2">제품</th>
								<td class="text-center align-middle p-2 resetValue" id="infoItem">-</td>
							</tr>
							<tr>
								<th class="text-center align-middle p-2">수주처</th>
								<td class="text-center align-middle p-2 resetValue" id="infoWorkOrdNo">-</td>
							</tr>
							<tr>
								<th class="text-center align-middle p-2">진행중</th>
								<td class="text-center align-middle p-2 resetValue" id="infoProcess">-</td>
							</tr>
							<tr>
								<th class="text-center align-middle p-2">진행률</th>
								<td class="text-center align-middle p-2 resetValue" id="infoProcessPer">-</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<script>
	$(document).ready(function() {
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
				data = _.filter(data, function(v) { return v.useYn == '001'; }); // 사용중인 설비 목록
				if(res.result=="ok"){
					$("#packingOperInfoEquipTable tbody").empty();
					$.ajax({
						url: '<c:url value="mt/packingOperInfoTodayData"/>',
			            type: 'POST',
			            data: {
						},
						success : function(res) {
							let recentData = JSON.parse(res.packing);
							$.each(data, function(index, item) { 
								$("#packingOperInfoEquipTable tbody").append(makeTbody(item, recentData));
								$('#'+item.equipCd).data('data',item);
							});
							
							// 첫번째 설비 선택처리
							$('#packingOperInfoEquipTable tbody').find('tr').eq(0).trigger('click');
						}
					});
				}
			}
		});
	})
	
	//테이블 그리기
   	function makeTbody(data, operData) {
		let equipCd = data.equipCd;
		let equipNm = data.equipNm;
		
		let html = '';
			html += '<tr id="'+equipCd+'">';
			html += '	<td class="text-center align-middle p-2" id="'+equipCd+'_equipNm">'+equipNm+'</td>';
		if(operData.FillOperStatus == '0') {
			html += '	<td class="text-center align-middle p-2" id="'+equipCd+'_equipStatus" style="color: #ff0000;">비가동</td>';
		} else if(operData.FillOperStatus == '1') {
			html += '	<td class="text-center align-middle p-2" id="'+equipCd+'_equipStatus" style="color: #00ff00;">가동</td>';
		}
			html += '</tr>';
			
		return html;
	}

	// 라인 목록 click
   	$("#packingOperInfoEquipTable tbody").on("click", "tr", function() {
   		let equipData = $(this).data('data');
   		let equipCd = equipData.equipCd;
   		let equipNm = equipData.equipNm;

   		$.ajax({
			url: '<c:url value="mt/packingOperInfoTodayData"/>',
            type: 'POST',
            data: {
			},
			beforeSend: function() {
				$('#my-spinner').show();
			},
			success : function(res) {
				let startData = res.data[0];
				let recentData = JSON.parse(res.packing);
				let RT_data = {};

				if(res.data.length == 0) {
					toastr.warning('후가공 실적데이터가 존재하지 않습니다.');
					$('#my-spinner').hide();
					return false;
				}
				
				RT_data.workOrdNo = startData.workOrdNo;
				RT_data.equipNm = startData.equipNm;
				RT_data.itemNm = startData.itemNm;

				let targetQty = startData.dtlOrdCnt;

				// 충진
				RT_data.fillOutputCount = parseInt(recentData.FillOutputCount) - parseInt(startData.fillOutputCount); // 충진 실적수량

				// 중량
				RT_data.wchkUnderCount = parseInt(recentData.WchkUnderCount) - parseInt(startData.wchkUnderCount); // 중량 경량
				RT_data.wchkRqtCount = parseInt(recentData.WchkRqtCount) - parseInt(startData.wchkRqtCount); // 중량 정량
				RT_data.wchkOverCount = parseInt(recentData.WchkOverCount) - parseInt(startData.wchkOverCount); // 중량 과량
				RT_data.wchkExNgCount = parseInt(recentData.WchkExNgCount) - parseInt(startData.wchkExNgCount); // 중량 금속검출 및 이중진입개수
				RT_data.wchkNgCount = parseInt(recentData.WchkNgCount) - parseInt(startData.wchkNgCount); // 중량 NG개수

				// 캡핑
				RT_data.capOutputCount = parseInt(recentData.CapOutputCount) - parseInt(startData.capOutputCount); // 캡핑 실적수량
				RT_data.capUnit = parseInt(recentData.CapUnit) - parseInt(startData.capUnit); // 캡핑 포장단위

				// 로봇
				RT_data.boxOutputCount = parseInt(recentData.ArticulRobotOutputCount) - parseInt(startData.articulRobotOutputCount); // 로봇 적재 실적수량

				// 충진공정
				
				
				
				// 충진
				let fillOutputCount = RT_data.fillOutputCount;
				let fillFaultyCount = 0;
				let fillFairCount = fillOutputCount - fillFaultyCount;
				let fillCountPer = ((fillFairCount) / targetQty * 100).toFixed(1)+'%';
				let fillOperStatus = recentData.FillOperStatus;

				$('#capOrdCount').text(addCommas(parseInt(targetQty))); // 지시수량
				$('#capInputCount').text(addCommas(fillOutputCount)); // 실적수량
				$('#capOutputCount').text(addCommas(fillFairCount)); // 양품수량
				$('#capFaultyCount').text(addCommas(fillFaultyCount)); // 불량수량
				$('#capRate').text(fillCountPer); // 진척률
				switch(fillOperStatus) {
					case false: $('#capOperStatus').text('비가동').css('color','#ff0000'); break;
					case true: $('#capOperStatus').text('가동중').css('color','#00ff00'); break;
				}

				

				// 캡핑
				let capOutputCount = RT_data.capOutputCount;
				let capFaultyCount = RT_data.wchkExNgCount + RT_data.wchkNgCount;
				let capFairCount = capOutputCount - capFaultyCount;
				let capCountPer = (capFairCount / (targetQty / 8) * 100).toFixed(1)+'%';
				let capOperStatus = recentData.CapOperStatus;
				let wchkUnderCount = RT_data.wchkUnderCount;
				let wchkRqtCount = RT_data.wchkRqtCount;
				let wchkOverCount = RT_data.wchkOverCount;
				let wchkNgCount = RT_data.wchkNgCount;
				
				$('#packCalCount').text(addCommas(parseInt(capOutputCount))); // 지시수량
				$('#packInputCount').text(addCommas(capOutputCount)); // 실적수량
				$('#packOutputCount').text(addCommas(capFairCount)); // 양품수량
				$('#packFaultyCount').text(addCommas(capFaultyCount)); // 불량수량
				$('#wchkUnderCount').text(addCommas(wchkUnderCount)); // 경량
				$('#wchkRqtCount').text(addCommas(wchkRqtCount)); // 정량
				$('#wchkOverCount').text(addCommas(wchkOverCount)); // 과량
				$('#wchkNgCount').text(addCommas(wchkNgCount)); // NG
				$('#packRate').text(capCountPer); // 진척률
				switch(capOperStatus) {
					case false: $('#packOperStatus').text('비가동').css('color','#ff0000'); break;
					case true: $('#packOperStatus').text('가동중').css('color','#00ff00'); break;
				}


				
				// 박스
				let boxOutputCount = RT_data.boxOutputCount;
				let boxFaultyCount = 0;
				let boxFairCount = boxOutputCount - boxFaultyCount;
				let boxCountPer = ((boxFairCount) / (targetQty / 8 / 10) * 100).toFixed(1)+'%';
				let boxOperStatus = recentData.BoxMoldOperStatus;

				$('#boxCalCount').text(addCommas(parseInt(boxOutputCount))); // 지시수량
				$('#boxInputCount').text(addCommas(boxOutputCount)); // 실적수량
				$('#boxOutputCount').text(addCommas(boxFairCount)); // 양품수량
				$('#boxFaultyCount').text(addCommas(boxFaultyCount)); // 불량수량
				$('#boxRate').text(boxCountPer); // 진척률
				switch(boxOperStatus) {
					case false: $('#boxOperStatus').text('비가동').css('color','#ff0000'); break;
					case true: $('#boxOperStatus').text('가동중').css('color','#00ff00'); break;
				}

				$("#infoTitle").text(equipNm);
		   		$("#infoItem").text(RT_data.itemNm);
		   		$("#infoWorkOrdNo").text(RT_data.workOrdNo);
		   		$("#infoProcess").text(addCommas(fillOutputCount) + ' / ' + addCommas(parseInt(targetQty)));
		   		$('#infoProcessPer').text(((fillOutputCount) / parseInt(targetQty) * 100).toFixed(1)+'%');

		   		$('#my-spinner').hide();
			}
		});
   	});
</script>
</body>
</html>