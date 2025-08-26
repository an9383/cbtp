<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">공구관리</a></li>
				<li class="breadcrumb-item active">공구이력카드</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipCodeTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="12%">
								<col width="18%">
								<col width="22%">
								<col width="18%">
								<col width="23%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th style="vertical-align: middle;">NO</th>
									<th style="vertical-align: middle;">구분</th>
									<th style="vertical-align: middle;">공구관리번호</th>
									<th style="vertical-align: middle;">공구명</th>
									<th style="vertical-align: middle;">공구규격</th>
									<th style="vertical-align: middle;">공구크기 (W*L*H)<br>단위:미터</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 44%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand"
						class="closebtn float-right" onclick="closerNav()"> <i
						class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="headTab1">갑지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="headTab2">사진</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="headTab3">을지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab4" id="headTab4">점검이력사항</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<div class="row">
							       	<div style="float: left; width: 50%;">
							       		<table class="table table-bordered mt-1">
											<colgroup>
												<col width="22%"> 
												<col width="30%">
												<col width="18%"> 
												<col width="30%"> 
											</colgroup>
											<tr>
												<th>공구관리번호</th>
												<td colspan="3">
													<input type="text" class="form-control" id="equipNo" name="equipNo" maxlength="50" style="min-width : 100%" disabled>
												</td>
											</tr>
											<tr>
												<th>공구명</th>
												<td><input type="text" class="form-control" id="equipNm" name="equipNm" style="min-width : 100%;" disabled></td>
												<th>공구등급</th>
												<td><input type="text" class="form-control" id="moldGrade" name="moldGrade" maxlength="50" style="min-width : 100%" disabled></td>
											</tr>
											<tr>
												<th>제작사</th>
												<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" maxlength="50" style="min-width : 100%" disabled></td>
												<th>모델명</th>
												<td><input type="text" class="form-control" id="equipModel" style="min-width : 100%" disabled></td>
											</tr>
											<tr>
												<th>제작일자</th>
												<td><input class="form-control" type="text" id="mfcDate" name="mfcDate" style="min-width : 100%" maxlength="10" disabled /></td>
												<th>구입일자</th>
												<td><input class="form-control" type="text" id="purchaseDate" name="purchaseDate" style="min-width : 100%" maxlength="10" disabled /></td>
											</tr>
											<tr>
												<th>설치장소</th>
												<td><input class="form-control" id="prcNm" style="min-width : 100%" disabled></input></td>
												<th>구입가격</th>
												<td><input type="text" class="form-control" id="purchasePrice" style="min-width : 100%; text-align:right;" disabled></td>
											</tr>
											<tr>
												<th>구입처</th>
												<td><input type="text" class="form-control" id="buyCorpNm" name="buyCorpNm" style="min-width : 100%" disabled></td>
											</tr>
											<tr>
												<th colspan="4">A/S</th>
											</tr>
											<tr>
												<th>담당자</th>
												<td><input type="text" class="form-control" id="asChargr" name="asChargr" style="min-width : 100%" disabled></td>
												<th>연락처</th>
												<td><input type="text" class="form-control" id="asPhoneNumber" name="asPhoneNumber" style="min-width : 100%" disabled></td>
											</tr>
										</table>
							      	</div>  
							      	<div style="float: right; width: 50%;">
							      		<div class="card-body col-sm-12 p-1">
											<button type="button" class="btn btn-primary float-right d-none" id="btnSave7">저장</button>
											<button type="button" class="btn btn-primary float-left ml-1" id="btnAdd7" disabled>추가</button>
											<button type="button" class="btn btn-primary float-left ml-1" id="btnEdit7" disabled>수정</button>
											<button type="button" class="btn btn-warning float-left ml-1" id="btnDel7" disabled>삭제</button>
											<button type="button" class="btn btn-danger float-left ml-1" id="btnAllDel7" disabled>전체삭제</button>
										</div>
										<table class="table table-bordered" id="equipDataTable">
											<colgroup>
												<col width="10%">
												<col width="30%">
												<col width="30%">
												<col width="30%">
											</colgroup>
											<thead>
												<tr>
													<th colspan="4">공구제원</th>
												</tr>
												<tr>
													<th>No.</th>
													<th>항목</th>
													<th>단위</th>
													<th>규격</th>
												</tr>
											</thead>
										</table>
							      	</div>
							    </div>
							</form>
							<table class="table table-bordered mt-1 d-none" id="changeHisTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>변경내역</th>
									<td colspan='3'><input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20"></td>
								</tr>
							</table>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">공구사진</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src=""
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr> 
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!--========tab3part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="table-responsive">
								<table class="table table-bordered" id="">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>공구명</th>
										<td class="text-center equipNm"></td>
										<th>공구관리번호</th>
										<td class="text-center equipNo"></td>
									</tr>
								</table>
								<table class="table table-bordered" id="equipRepairHistAdmTable">
									<colgroup>
										<col width="10%">
										<col width="15%">
										<col width="40%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>일자</th>
											<th>구분</th>
											<th>내역</th>
											<th class="text-center">시간(분)</th>
											<th class="text-center">비용</th>
											<th>조치자</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<div class="table-responsive">
								<table class="table table-bordered" id="corrDataListTabTable">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="15%">
<%-- 										<col width="30%"> --%>
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>점검일자</th>
											<th>실행일자</th>
											<th>작성자</th>
											<th>점검 자료</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered" id="corrDataFileTable">
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--====end====tab4 part=====-->
					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
			<!--===========================================-->
			<!-- /.card -->
			<!--===========================================-->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">공구이력카드 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>자산코드</th>
								<th>자산구분</th>
								<th>매입가</th>
								<th>공구관리번호</th>
								<th>공구명</th>
								<th>공정코드</th>
								<th>공구규격</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>공구조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대공구</th>
								<th>제작일자</th>
								<th>제작사</th>
								<th>소모품</th>
								<th>공구규격</th>
								<th>구입처</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>
<%= request.getParameter("equipCd") %>
<%= request.getParameter("equipGubun") %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "55%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
		state = !state;
	});

	let menuAuth = 'tosc0020';
	let currentHref = "tosc0020";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "공구이력카드"); 
	
	let beforeEquipCd = "${param.equipCd}";
	let beforeEquipGubun = "${param.equipGubun}";
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	let selectCheck1 = '';
	let selectCheck2 = '';
	var mainGubun = '002';
	var equipCd = 'x';
	var serverDate = "${serverDateTo}"
	var index=0;
	var equipGubunVal = '';
	var mainEquipCd = ' ';
	var equipGubun = ' ';
	var tempCorrWillDate = serverDate;
	var userNm = "${userNm}";
	var userNumber = "${userNumber}";

	equipNm = '';
	equipNo = '';

	var equipGubunCode = new Array();
	<c:forEach items = "${equipGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	equipGubunCode.push(json);
	</c:forEach>

	selectBoxAppend(equipGubunCode, "equipGubun", "", "2");
	
// 	$('#saveBtnModalY').on('click', function() {
// 		$('#btnAdd7').attr('disabled', true);
// 		$('#btnEdit7').attr('disabled', false);
// 		$('#btnDel7').attr('disabled', true);
// 		$('#btnAllDel7').attr('disabled', true);
// 		$('#btnSave7').addClass('d-none');
// 	});
	
// 	var equipArr = ['001', '003', '004'];
	//공구정보 목록
	let equipCodeTable = $('#equipCodeTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/toolCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return mainGubun;},
// 				'equipArr' : function(){return equipArr;},
			},
		},
		rowId : 'equipCd',
		columns : [ 
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{
				data : 'equipGubunNm'
			}, 
			{
				data : 'equipNo'
			}, 
			{
				data : 'equipNm'
			}, 
			{
				data : 'equipType'
			},
			{	
				data : 'equipWidth'	
			},
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '공구이력카드',
		}, {
			extend : 'excel',
			title : '공구이력카드',
		}, {
			extend : 'print',
			title : '공구이력카드',
		}, ],
		drawCallback: function() {
            var api = this.api();
            if(beforeEquipCd != '') {
               api.row('#' + beforeEquipCd).select();
               equipCd = beforeEquipCd;
               mainEquipCd = equipCd;
               equipGubun = beforeEquipGubun;
               equipCodeTableRead();
            }
          $('#productNoTable_filter').addClass('d-none');
      	}
	});

	var  html = '<div class="row">';
	html += '<label class="input-label-sm">구분</label>'; 
	html += '<select class="custom-select" id="equipGubun2">';
	html +=	'</select>';
    html += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html += '<a href="/bm/toolBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html += '</div>';

	$('#equipCodeTable_length').html(html);
	
	selectBoxAppend(equipGubunCode, "equipGubun2", "", "1");

	//구분 선택시
	$('#equipGubun2').on('change', function() {
		equipGubunVal = $('#equipGubun2 option:selected').val();
		$('#equipCodeTable').DataTable().ajax.reload(function () {});
    });
	
	//공구정보 상세정보 보기
	$('#equipCodeTable tbody').on('click','tr',function() {
		equipCd = equipCodeTable.row(this).data().equipCd;
		mainEquipCd = equipCodeTable.row(this).data().equipCd;
		equipGubun = equipCodeTable.row(this).data().equipGubun;
		equipNm = equipCodeTable.row(this).data().equipNm;
		equipNo = equipCodeTable.row(this).data().equipNo;
		
		equipCodeTableRead();
	});

	function equipCodeTableRead (){
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right ml-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($('#btnSave2').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		$('#headTab1').tab('show');
		
		if ($('#equipCodeTable tbody tr#'+equipCd).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
			$('#equipCodeTable tbody tr#'+equipCd).addClass('selected');
		}

		
		$.ajax({
			url : '<c:url value="bm/toolCodeAdmRead"/>',
			type : 'GET',
			data : {
				'equipCd' : function() {
					return equipCd;
				},
			},
			success : function(res) {
				let data = res.data;
				$('input:radio[name=mainGubun]:radio[value='+data.mainGubun+']').prop('checked',true);
				$('#equipNo').val(data.equipNo);
				$('#moldGrade').val(data.moldGradeNm);
				$('#equipNm').val(data.equipNm);
				$('.equipNo').text(data.equipNo);
				$('.equipNm').text(data.equipNm);
				$('#equipInitial').val(data.equipInitial);
				$('#equipType').val(data.equipType);
				$('#moldLocation').val(data.moldLocation);
				$('#equipCavity').val(data.equipCavity);
				$('#mfcDate').val(moment(data.mfcDate).format('YYYY-MM-DD'));
				endDateVal = data.endDate==null?'':moment(data.endDate).format('YYYY-MM-DD');
				$('#endDate').val(endDateVal);
				$('#mfcCorpCd').val(data.mfcCorpCd);
				$('#assetCd').val(data.assetCd);
				buyAmtVal = data.buyAmt==null?"":addCommas(data.buyAmt);
				$('#buyAmt').val(buyAmtVal);
				$('#equipCond').val(data.equipCond);
				$('#upperAmt').val(data.upperAmt);
				$('#lowerAmt').val(data.lowerAmt);
				$('#ancEquipNm').val(data.ancEquipNm);
				$('#ancDate').val(moment(data.ancDate).format('YYYY-MM-DD'));
				$('#ancCorpCd').val(data.ancCorpCd);
				$('#expNm').val(data.expNm);
				$('#ancEquipType').val(data.ancEquipType);
				$('#buyCorpNm').val(data.buyCorpNm);
				$('#equipDesc').val(data.equipDesc);
				$('#prcNm').val(data.prcRealNm);

				$('#asChargr').val(data.asChargr);
				$('#asPhoneNumber').val(data.asPhoneNumber);

// 				$('#equipmanageNo').val(data.equipmanageNo);
				$('#equipModel').val(data.equipModel);
				$('#equipWidth').val(data.equipWidth == null ? "0.00" : addCommas(data.equipWidth));
				$('#equipLength').val(data.equipLength == null ? "0.00" : addCommas(data.equipLength));
				$('#equipHeight').val(data.equipHeight == null ? "0.00" : addCommas(data.equipHeight));
				$('#purchaseDate').val(data.purchaseDate == "" ? "" : moment(data.purchaseDate).format('YYYY-MM-DD'));
				$('#purchasePrice').val(data.purchasePrice == null ? "0" : addCommas(data.purchasePrice));
				
				$('#imageFile1Con').val(data.imageFile1Con);
				$('#imageFile2Con').val(data.imageFile2Con);
				$('#imageFile3Con').val(data.imageFile3Con);
				$('#imageFile4Con').val(data.imageFile4Con);
				$('tr[name=partTr1]').addClass("d-none");
				$('tr[name=partTr2]').addClass("d-none");
				$('tr[name=partTr3]').addClass("d-none");
				$('tr[name=partTr4]').addClass("d-none");
				$('tr[name=partTr5]').addClass("d-none");

				$('td[name=partImage1]').addClass("d-none");
				$('td[name=partImage2]').addClass("d-none");
				$('td[name=partImage3]').addClass("d-none");
				$('td[name=partImage4]').addClass("d-none");
				$('td[name=partImage5]').addClass("d-none");
				$('td[name=partImage6]').addClass("d-none");
				$('td[name=partImage7]').addClass("d-none");
				$('td[name=partImage8]').addClass("d-none");
				$('td[name=partImage9]').addClass("d-none");
				$('td[name=partImage10]').addClass("d-none");

				
				imageReset();
				setTimeout(function() {
					$('#equipDataTable').DataTable().ajax.reload();
				}, 150);
				
				$('#headTab2').removeClass('disabled');
				$('#headTab3').removeClass('disabled');
				$('#headTab4').removeClass('disabled');
				
				$('#btnAdd7').attr('disabled', true);
				$('#btnEdit7').attr('disabled', false);
				$('#btnDel7').attr('disabled', true);
				$('#btnAllDel7').attr('disabled', true);
				$('#btnSave7').addClass('d-none');
			}
		});
	}
	//사진 탭 클릭시
	$('#headTab2').on('click', function() {
		$.ajax({
			url : '<c:url value="/bm/toolCodeImgRead"/>',
			data : {
				'equipCd' : equipCd
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src",
							"data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
				}
				if (data.imageFile1 == null) {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
				}
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src",
							"data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
				}
				if (data.imageFile2 == null) {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
				}

				if(data.imageFile1Con!=null) {
					$('#imageFile1Con').text(data.imageFile1Con);
				} else {
					$('#imageFile1Con').text(' ');
				}

				if(data.imageFile2Con!=null) {
					$('#imageFile2Con').text(data.imageFile2Con);
				} else {
					$('#imageFile2Con').text(' ');
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
		//주생산공구일때만 부대공구 보여주기
		if(equipGubun == "001") {
			$.ajax({
				url : '<c:url value="/bm/toolCodePartImgRead"/>',
				data : {
					'mainEquipCd' : function(){return equipCd;},
				},
				type : 'GET',
				success : function(res) {
					let dataCount = 1;
					//데이터가 하나 이상 있으면  부대 공구하고 표시 없으면 표시 x
					if(res.data.length>0) {
						$('tr[name=partTrTitle]').removeClass('d-none');
					} else {
						$('tr[name=partTrTitle]').addClass("d-none");
					}
					
					for(let i = 0; i<res.data.length; i++) {
						
						if(dataCount%2 ==1){
							//이미지와 공구명이 나오는 행 표시
							$('tr[name=partTr'+(parseInt(dataCount/2)+1)+']').removeClass("d-none");
						}
						//이미지와 공구명이 나오는 칸 표시
						$('td[name=partImage'+dataCount+']').removeClass('d-none');

						//공구명 표시
						$('#imagePartNm'+dataCount).text(res.data[i].equipNm);

						//사진이 있으면 사진 표시
						if(res.data[i].imageFile1Con!=null) {
							$('#imagePartFile'+dataCount).attr("src", "data:image/jpg;base64," + res.data[i].imageFile1Con);
						} else {
							$('#imagePartFile'+dataCount).attr("src", "");
						}
						console.log(dataCount)
						dataCount++;
					}
					
					
					
					
				},
				error : function(xhr, textStatus, error) {
					alert("예상치 못한 오류가 발생했습니다.");
				}
			});
		}
	});

	//을지 탭 선택시
	$('#headTab3').on('click', function() {
		$('#equipRepairHistAdmTable').DataTable().ajax.reload(function(){});
		
		setTimeout(function(){
			equipRepairHistAdmTable.draw();
			equipRepairHistAdmTable.draw();
			equipRepairHistAdmTable.draw();
		}, 170); 
	});
	

	//사진 초기화 함수
	function imageReset() {
		//공구 사진 초기화
		$('#imageFile1').attr("src", " ");
		$('#imageFile2').attr("src", " ");

		//부대공구 사진 초기화
		$('#imagePartFile1').attr("src", " ");
		$('#imagePartFile2').attr("src", " ");
		$('#imagePartFile3').attr("src", " ");
		$('#imagePartFile4').attr("src", " ");
		$('#imagePartFile5').attr("src", " ");
		$('#imagePartFile6').attr("src", " ");
		$('#imagePartFile7').attr("src", " ");
		$('#imagePartFile8').attr("src", " ");
		$('#imagePartFile9').attr("src", " ");
		$('#imagePartFile10').attr("src", " ");

		//부대공구 이름 초기화
		$('#imagePartNm1').text('');
		$('#imagePartNm2').text('');
		$('#imagePartNm3').text('');
		$('#imagePartNm4').text('');
		$('#imagePartNm5').text('');
		$('#imagePartNm6').text('');
		$('#imagePartNm7').text('');
		$('#imagePartNm8').text('');
		$('#imagePartNm9').text('');
		$('#imagePartNm10').text('');
	}

	//공구제원 테이블
	let equipDataTable = $('#equipDataTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '17vh',
		ajax : {
			url : '<c:url value="bm/toolDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return equipCd;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'equipPart',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="equipPart" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="equipPart" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			}, 
			{
				data : 'equipUnit',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="equipUnit" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="equipUnit" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			}, 
			{
				data : 'equipDc',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="equipDc" value="'+data+'" style="min-width : 100%; text-align:center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="equipDc" value="" style="min-width : 100%; text-align:center;" />';
					}
				}
			}, 
		],
		order : [],
		buttons : [],
		columnDefs : []
	});


	//수리이력테이블
	let equipRepairHistAdmTable = $('#equipRepairHistAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 100000000,
		scrollY: '60vh',
		ajax : {
			url : '<c:url value="em/equipRepairHistAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'mainGubun' : function(){return '002'},
				'equipCd' : function(){return equipCd;},
			},
		},
		columns : [
			//일자 구분, 내역, 시간(분), 비용, 조치자
			{
				data : 'troubleDate',
				render : function(data, type, row){
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{
				data : 'equipGubunNm',
				'className' : 'text-center'
			}, 
			{
				data : 'troubleCont',
				'className' : 'text-center'
			},
			{
				data: 'changeTime',
				render: function(data, type, row, meta) {
					return addCommas(data);
				}, 
				"className": "text-right" 	
			},
			{
				data: 'totalCost',
				render: function(data, type, row, meta) {
					return addCommas(data);
				}, 
				"className": "text-right" 	
			},
			{
				data : 'repairMan',
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	function uiProc7(flag) {
		$('#btnAdd7').attr('disabled', flag);
		$('#btnDel7').attr('disabled', flag);
		$('#btnAllDel7').attr('disabled', flag);
		$('input[name=equipPart]').attr('disabled', flag);
		$('input[name=equipUnit]').attr('disabled', flag);
		$('input[name=equipDc]').attr('disabled', flag);
	}

	//공구제원 수정 버튼
	$('#btnEdit7').on('click', function() {
		uiProc7(false);
		selectCheck2 = '';
		$('#btnSave7').removeClass('d-none');
	});

	//공구제원 추가버튼
	$('#btnAdd7').on('click', function() {
		$('#equipDataTable').DataTable().row.add({}).draw(false);
	});
	
	//공구제원 삭제 버튼
	$('#btnDel7').on('click', function() {
		if($('#equipDataTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		if (equipDataRowCheck == '') {
			toastr.warning('삭제할 데이터를 선택해주세요.');
			return false;
		}

		$('#equipDataTable').DataTable().row('.selected').remove().draw();
		equipDataRowCheck = '';
	});

	//공구제원 전체 삭제 버튼
	$('#btnAllDel7').on('click', function() {
		if($('#equipDataTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		$('#equipDataTable').DataTable().clear().draw();
		equipDataRowCheck = '';
	});
	
	//공구제원 저장 버튼
	$('#btnSave7').on('click',function() {
		var check = true;
		var dataArray = new Array();
		if (equipDataTable.data().count() != 0) {
			$('#equipDataTable tbody tr').each(function(index, item) {
				var rowData = new Object();
				rowData.equipCd = equipCd;
				rowData.equipPart = $(this).find('td input[name=equipPart]').val();
				rowData.equipUnit = $(this).find('td input[name=equipUnit]').val();
				rowData.equipDc = $(this).find('td input[name=equipDc]').val();
				dataArray.push(rowData);
			});
		} else {
			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.equipPart = 'noData';
			rowData.equipUnit = 'noData';
			rowData.equipDc = 'noData';
			dataArray.push(rowData);
		}
		

		if (check == true) {
			$.ajax({
				url : '<c:url value="/bm/toolDataCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success("저장되었습니다.");
						$('#equipDataTable').DataTable().ajax.reload();
						uiProc7(true);
						$('#btnSave7').addClass('d-none');
						equipDataRowCheck = '';
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
				}
			});
		}
	});
	
	let equipDataRowCheck = '';
	
	$('#equipDataTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
			//selectCheck2 = "";
			//return false;
		} else {
			$('#equipDataTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		equipDataRowCheck = "edit";
	});
	
	// 테이블 행 더블클릭
	$('#equipCodeTable tbody').on('dblclick','tr',function() {
		window.location.href = "emsc0040";
	});
	
	//점검이력사항 버튼 Event
	$('#headTab4').on('click', function() {
		$('#corrDataFileTable').DataTable().clear().draw();
		$('#corrDataListTabTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataListTabTable.draw();
			corrDataFileTable.draw();
			corrDataFileTable.draw();
			corrDataListTabTable.draw();
		},300);
	});
	
	//점검이력사항 목록조회
	let corrDataListTabTable = $('#corrDataListTabTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return equipCd;},
				'corrGubun' : function() {return '002';},
			},
		},
		rowId : 'mitCd',
		columns : [
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						var html = '<input class="form-control" type="date" id="" value="'+moment(data).format('YYYY-MM-DD')+'" name="" style="min-width : 100%;" disabled/>';
						html += '<input class="form-control" type="hidden" id="" value="'+row['corrSeq']+'" name=""/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name="" style="min-width : 100%;" disabled/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name=""  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name=""  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" name="" style="width:100%" disabled/>';
					}else{
						return '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					
					if(data == null){
						var html = '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" for=""></label></div></form>';
						return html;
					} else {
						var html = '<a name="" href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+equipCd+'&corrSeq='+row['corrSeq']+'&corrGubun='+row['corrGubun']+'">'+data+'</a>';
						html += '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file d-none" name="">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" id="" for="">'+data+'</label></div></form>';
						return html;
					}
	            }
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [4], visible : false},
		]
	});
	
	let corrGubun = '';
	let corrSeq = '';
	
	//공구정보 상세정보 보기
	$('#corrDataListTabTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#corrDataListTabTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		corrGubun = corrDataListTabTable.row(this).data().corrGubun;
		corrSeq = corrDataListTabTable.row(this).data().corrSeq;
		
		$('#corrDataFileTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		},300);
	});
	
	let corrDataFileTable = $('#corrDataFileTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return equipCd;},
				'attachGubun' : function(){return 'CD';},
				'attachType' : function(){return corrGubun;},
				'etc1' : function(){return corrSeq;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					var tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachType='+corrGubun+'&etc1='+corrSeq+'&attachGubun=CD">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		],
		order : [ [ 0, 'asc' ], ],
	});

</script>
</body>
</html>
