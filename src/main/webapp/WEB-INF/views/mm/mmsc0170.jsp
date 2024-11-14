<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">재고현황(제품)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="p-0" style="flex: 0 0 32%; max-width: 32%;">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="itemInfoAdmTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>품목번호</th>
									<th>모델</th>
									<th>품명</th>
									<th class="text-center">재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="p-0" style="flex: 0 0 18%; max-width: 18%;">
				<div class="row p-0" style="height:10vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table class="table table-bordered m-0">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>모델</th>
									<td id="itemModeLNm"></td>
									<th>재고수량</th>
									<td class="text-right" id="realQty"></td>
								</tr>
								<tr>
									<th>품목번호</th>
									<td colspan='3' id="spCd"></td>
								</tr>
								<tr>
									<th>품명</th>
									<td colspan='3' id="spNm"></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="row p-0 mb-2" style="height:26vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table id="locationToStockPaymentTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>구역</th>
									<th class="text-center">재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="row p-0 mb-2" style="height:50vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table id="locationToLotTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>생산일자</th>
									<th>LOT NO</th>
									<th class="text-center">재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="p-0" style="flex: 0 0 48%; max-width: 48%;">
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" style="height:4vh; background-color:#ffffff;">
						<div class="float-right mt-1" style="display: inline;">
							<span class="mr-2">선입선출 순서</span>
							<span class="badge mr-2" style="background-color: #ed1c24; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #20b2aa; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #66ccff; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #0000ff; width:50px; font-size: 0.725rem;">&nbsp;</span>
						</div>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" id="locationList" style="height:62vh; background-color:#ffffff;">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" style="height:20vh; background-color:#ffffff;">
						<div class="row">
							<div class="col-md-5">
								<div style="display: inline-flex;">
									<label class="input-label-lg">구역</label>
									<input class="form-control-lg" type="text" id="locationCd" readonly>
								</div>
							</div>
							<div class="col-md-7">
								<table id="floorToStockPaymentTable" class="table table-bordered m-0">
									<thead class="thead-light">
										<tr>
											<th>품목번호</th>
											<th>모델</th>
											<th>품명</th>
											<th class="text-center">재고수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<script>
	let currentHref = "mmsc0170";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "재고현황(제품)");

	let tmMon = moment().format('YYYY-MM');
	let tmDate = moment().format('YYYY-MM-DD');
	let startDateVal = moment().subtract('1','y').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemGubunVal = "001";
	
	let spCdVal = '';
	let locationNoVal = '';
	let areaCdNmVal = '';
	let floorCdVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);
	
	// 원자재 목록조회
	let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "70vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmList"/>',
			type : 'GET',
			data : {
				'tmMon' : function() {return tmMon.substring(0,7).replace(/-/g, '');},
				'tmDate' : function() {return tmDate.replace(/-/g, '');},
				'mainGubun' : function() {return "001"},
				//'spType' : function() {return "001"},
				'locationCd'	:	'002',
				'realQtyOption' : function() {return "Y";},
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ data : 'spCd', className : 'text-center' },
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'spNm', className : 'text-center' },
			{ data : 'realQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});

	//품목 선택
	$('#itemInfoAdmTable tbody').on('click','tr',function() {
		let data = itemInfoAdmTable.row(this).data();
		spCdVal = data.itemSeq;
		$('.boxFloor').css('background-color','#ffffff').css('color','#000000');

		$('#itemModeLNm').text(data.itemModelNm);
		$('#realQty').text(addCommas(parseFloat(data.realQty)));
		$('#spCd').text(data.spCd);
		$('#spNm').text(data.spNm);
		
		$.ajax({
			url: '<c:url value="tm/locationDateToStockPayment"/>',
			type : 'POST',
			async: false,
			data : {
				'locationCd'	:	'002',
				'spCd'			:	function(){ return spCdVal; }
			},
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let data = res.data;
				let tmGroupList = []; // 구역별 재고현황
				let count = 0;
				for(var i=0;i<data.length;i++) {
					if(parseFloat(data[i].sumQty) > 0) { // 재고가 0보다 클 경우
						console.log("aa");
						if(count==0) { // 선입선출 1번째
							data[i].type = '001';
							tmGroupList.push(data[i]);
						} else if(count==1) { // 선입선출 2번째
							data[i].type = '002';
							tmGroupList.push(data[i]);
						} else if(count==2) { // 선입선출 3번째
							data[i].type = '003';
							tmGroupList.push(data[i]);
						} else if(count==3) { // 선입선출 4번째
							data[i].type = '004';
							tmGroupList.push(data[i]);
						} else { // 그밖의 모든 항목
							data[i].type = '005';
							tmGroupList.push(data[i]);
						}
						count++;
					}
				}
				tmGroupList.sort((a,b) => parseInt(b.type) - parseInt(a.type));
				boxFloorBlink(tmGroupList);
				$('#my-spinner').hide();
			}
		});
		locationToStockPaymentTable.ajax.reload(function(){});
		locationToLotTable.clear().draw();
	});

	// 원자재 창고별 현재고 목록조회
	let locationToStockPaymentTable = $('#locationToStockPaymentTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "20vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmAreaList"/>',
			type : 'GET',
			data : {
				'tmMon' 		: function() {return tmMon.substring(0,7).replace(/-/g, '');},
				'mainGubun' 	: function() {return "001"},
				'locationCd'	:	'002',
				'realQtyOption' : function() {return "Y";},
				'itemSeq'		:	function(){ return spCdVal; }
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ className : 'text-center',
				render : function(data, type, row, meta) {
					return row['areaNm']+'/'+row['floorNm'];
				}
			},
			{ data : 'realQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});

	// 원자재 창고별 현재고 선택
	$('#locationToStockPaymentTable tbody').on('click','tr',function() {
		let data = locationToStockPaymentTable.row(this).data();
		locationNoVal = data.locationNo;
		locationToLotTable.ajax.reload(function(){});
	});

	// 창고별 LOT 목록조회
	let locationToLotTable = $('#locationToLotTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "40vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/locationToLot"/>',
			type : 'POST',
			data : {
				'locationCd'	:	'002',
				'spCd'			:	function(){ return spCdVal; },
				'locationNo'	:	function(){ return locationNoVal }
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ data : 'spDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY/MM/DD');
				}
			},
			{ data : 'barcodeNo', className : 'text-center'},
			{ data : 'spQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});
	
	// 위치별 품목 재고 목록조회
	let floorToStockPaymentTable = $('#floorToStockPaymentTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "20vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/floorToStockPayment"/>',
			type : 'POST',
			data : {
				'locationCd'	:	'002',
				'areaCdNm'		:	function(){return areaCdNmVal;},
            	'floorCd'		:	function(){return floorCdVal;}
			},
		},
		columns : [
			{ data : 'itemCd', className : 'text-center' },
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'itemNm', className : 'text-center' },
			{ data : 'sumQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			}
		],
		columnDefs : [],
		buttons : [],
		order : []
	});
	

	//박스 생성
	function makeBox(id, x, y, width, height, data) {
		let backgroundColor = ""; // 상자 배경색
		if(data.type == 'G') {
			backgroundColor = '#e6e6e6';
		} else {
			backgroundColor = '#5c81cb';
		}

		let floorLength = data.floorList.length;
		
		
		let html = '';
			html += '<div class="container-fluid p-2 boxArea" style="position: absolute; top:'+y+'px; left:'+x+'px;';
			html += '													width:'+width+'px; height:'+height+'px; background-color:'+backgroundColor+';';
			html += '													border-radius: 10px; box-shadow: 2px 1px 10px '+backgroundColor+'; ">';
			html += '	<div class="row" style="height:35px;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">'+data.title+'</span></div>';
			html += '	<div class="row" id="'+id+'" style="height:'+(parseInt(height)-55)+'px; border: 0 solid #ffffff">';
		for(var i=0;i<floorLength;i++) {
			html += '		<div class="col-md-4 mb-1 p-1 text-center boxFloor" data-areacdnm="'+id+'" data-floorcd="'+data.floorList[i]+'"';
			html += '															 id="'+id+'-'+data.floorList[i]+'" ';
			html += '															 style="background-color: #ffffff; border-radius: 10px;';
			html += '																	height:100%;';
			html += '																	overflow:auto; font-size:15px; border: 1px solid #cccccc">';
			html += '			<span>'+data.floorList[i]+'</span>';
			html += '		</div>';
		}
			html += '	</div>';
			html += '</div>';
		$('#locationList').append(html);
	}

	//화살표 생성
	function makeArrow(x, y, width, height, data) {
		let html = '';
			
		if(data.direction == 'up') {
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; width:0px; height:0px;';
			html += '													border-left: '+width/2+'px solid transparent;';
			html += '													border-right: '+width/2+'px solid transparent;';
			html += '													border-bottom: '+height/3+'px solid #707276;';
			html += '													border-radius: 5px;">';
			html += '</div>';
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)+parseInt(height)/3)+'px; left:'+(parseInt(x)+parseInt(width)/4)+'px; background-color: #707276;';
			html += '													width:'+width/2+'px; height:'+height/3*2+'px; border-radius: 0 0 5px 5px;">';
			html += '	<div class="row align-items-center" style="color:#ffffff; height:100%">';
			for(var i=0;i<data.title.split('').length;i++) {
				html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*2/5+'px; font-weight:700;">'+data.title.split("")[i]+'</div>';
			}
			html += '	</div>';
			html += '</div>';
		} else if(data.direction == 'down') {
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; background-color: #707276;';
			html += '													width:'+width/2+'px; height:'+height/3*2+'px; border-radius: 5px 5px 0 0;">';
			html += '	<div class="row align-items-center" style="color:#ffffff; height:100%">';
			for(var i=0;i<data.title.split('').length;i++) {
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*2/5+'px; font-weight:700;">'+data.title.split("")[i]+'</div>';
			}
			html += '	</div>';
			html += '</div>';
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)+parseInt(height)/3*2)+'px; left:'+(parseInt(x)-parseInt(width)/4)+'px; width:0px; height:0px;';
			html += '													border-top: '+height/3+'px solid #707276;';
			html += '													border-left: '+width/2+'px solid transparent;';
			html += '													border-right: '+width/2+'px solid transparent;';
			html += '													border-radius: 5px;">';
			html += '</div>';
		}
		$('#locationList').append(html);
	}

	//선 그리기
	function makeLine(x, y, width, height, data) {
		let html = '';
			
		if(data.lineDirection == 'vert') { // 가로줄
			html += '<hr class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; background-color: transparent;';
			html += '													width:'+width+'px; height:0px; color: #ffffff;';
			html += '													border: none; border-top: '+height+'px '+data.lineType+' '+data.lineColor+'; ">';
			if(data.prefix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-top: '+height*3/2+'px solid transparent;';
				html += '													border-right: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-bottom: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
			if(data.surfix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x+width)+'px; width:0px; height:0px;';
				html += '													border-top: '+height*3/2+'px solid transparent;';
				html += '													border-left: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-bottom: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
		} else if(data.lineDirection == 'hori') { // 세로줄
			html += '<hr class="container-fluid p-0" style="position: absolute; top:'+(y+(width/2))+'px; left:'+(x-(width/2))+'px; background-color: transparent;';
			html += '													width:'+width+'px; height:0px; color: #ffffff; transform: rotate(90deg); ';
			html += '													border: none; border-top: '+height+'px '+data.lineType+' '+data.lineColor+'; ">';
			if(data.prefix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-left: '+height*3/2+'px solid transparent;';
				html += '													border-bottom: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-right: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
			if(data.surfix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(width)+(height*3/2)+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-left: '+height*3/2+'px solid transparent;';
				html += '													border-top: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-right: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
		}
		
		
		$('#locationList').append(html);
	}

	//도형 생성
	function makeFigure(x, y, width, height, data) {
		let html = '';
			html += '<div class="container-fluid p-0 overflow-hidden" style="position: absolute; top:'+y+'px; left:'+x+'px;';
			html += '										width:'+width+'px; height:'+height+'px; background-color:'+data.backgroundColor+';';
			html += '										border: 2px solid '+data.borderColor+'; color:'+data.fontColor+'; ';
			html += '										border-radius: 10px; box-shadow: 2px 1px 10px '+data.borderColor+'; ">';
			html += '	<div class="row"><span class="text-center w-100" style="font-size:'+data.fontSize+'px; font-weight: 900;">'+data.text+'</span></div>';
			html += '	</div>';
			html += '</div>';
		$('#locationList').append(html);
	}

	// 제목
	makeFigure(10, 10, 800, 35, {backgroundColor: '#31869b', text: '완제품 창고 레이아웃', fontSize: '20', fontColor: '#ffffff', borderColor: '#31869b'});

	makeBox('G1', 80, 135, 300, 350, {type: 'G', title: 'G1', floorList: ['G1-1','G1-2','G1-3']});
	makeBox('G2', 390, 135, 300, 350, {type: 'G', title: 'G2', floorList: ['G2-1','G2-2','G2-3']});
	
	makeArrow(720, 240, 40, 170, {direction: 'up', title: '선입선출'});

	// 입고
	makeLine(635, 460, 70, 5, {lineDirection: 'hori', lineColor: '#0000ff', lineType: 'dotted', prefix: true, surfix: false});
	makeFigure(610, 530, 50, 25, {backgroundColor: '#ffffff', text: '입고', fontSize: '15', fontColor: '#000000', borderColor: '#0000ff'});

	// 출고
	makeLine(635, 55, 90, 5, {lineDirection: 'hori', lineColor: '#ff0000', lineType: 'dotted', prefix: true, surfix: false});
	makeFigure(610, 100, 50, 25, {backgroundColor: '#ffffff', text: '출고', fontSize: '15', fontColor: '#000000', borderColor: '#ff0000'});
		
	
	// 창고정보 조회
	function getLocationAdmList() {
		$.ajax({
			url: '<c:url value="bm/locationAdmList"/>',
            type: 'GET',
            async: false,
            data: {
            	'useYn'	:	'001'
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				console.log(res.data);
				$('#my-spinner').hide();
			}
		});
	}

	// 창고 표시
	function blinkBox(id, type) {
		if(type == '001') {
			$('#'+id).css('background-color','#ed1c24').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
		} else if(type == '002') {
			$('#'+id).css('background-color','#20b2aa').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
		} else if(type == '003') {
			$('#'+id).css('background-color','#66ccff').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
		} else if(type == '004') {
			$('#'+id).css('background-color','#0000ff').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
		} else {
			//$('#'+id).css('background-color','#00ff00').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
		}
	}

	// 위치 표시
	function boxFloorBlink(floorList) {
		for(var i=0;i<floorList.length;i++) {
			blinkBox(floorList[i].areaNm+'-'+floorList[i].floorNm, floorList[i].type);
		}
	}

	$(document).ready(function() {
		getLocationAdmList();
		// $('.boxArea').draggable();

		// 구역 click
		$('.boxFloor').on('click',function() {
			
			let locationCd = $(this).attr('id');
			areaCdNmVal = $(this).data('areacdnm');
			floorCdVal = $(this).data('floorcd');

			$('#locationCd').val(areaCdNmVal+'/'+floorCdVal);
			floorToStockPaymentTable.ajax.reload(function(){});
		});
	});
</script>
</body>
</html>