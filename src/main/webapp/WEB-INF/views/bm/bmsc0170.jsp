<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp"%>
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">품목정보관리(스페어)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 53%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="itemPartAdmTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="25%">
								<col width="20%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>품번</th>
									<th>품명</th>
									<th>규격</th>
									<th class="text-center">안전재고</th>
									<th>적용설비</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
	
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 46%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item">
									<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2">스페어사진</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab3Nav" data-toggle="tab" href="#tab3">관련자료</a>
								</li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">신규등록</button>	
								<button type="button" class="btn btn-success float-right mr-1" id="btnPrint">바코드 출력</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<%-- <table class="table table-bordered">
				                    	<colgroup>
				                           <col width="20%"> 
				                           <col width="30%">
				                           <col width="20%">
				                           <col width="30%">
				                        </colgroup>
				                        <tr>   
				                           <th>*구분</th>
				                           <td colspan="3">
				                              	<div class="row">
				                                 	<div class="custom-control custom-radio row">
				                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" disabled> 
				                                    	<label class="custom-control-label input-label-sm" for="mg1">사출</label>
				                                 	</div>
				                                 	<div class="custom-control custom-radio row">
				                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" disabled> 
				                                    	<label class="custom-control-label input-label-sm" for="mg2">봉제</label>
				                                	</div>
				                            	</div>
				                        	</td>
				                    	</tr>
				                    </table> --%>
									<table class="table table-bordered" id="">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>품목구분</th>
											<td><input type="text" class="form-control" id="itemGubun" name="itemGubun" value="스페어" disabled style="min-width:100%" maxlength="20"/></td>
											<th>공급사</th>
											<td><input type="text" class="form-control" id="itemCus" name="itemCus" style="min-width:100%" maxlength="50"></td>
										</tr>
										<tr>
											<th>품번</th>
											<td><input type="text" class="form-control" id="itemCd" name="itemCd" style="min-width:100%" maxlength="20"/></td>
											<th>품명</th>
											<td><input type="text" class="form-control" id="itemNm" name="itemNm" style="min-width:100%" maxlength="50"></td>
										</tr>
										<tr>
											<th>스페어창고</th>
											<td><input type="text" class="form-control" id="spaWhse" name="spaWhse" style="min-width:100%"></td>
											<th>바코드NO</th>
											<td colspan="3"><input type="text" class="form-control" id="spaBarcode" name="spaBarcode" style="min-width:100%" maxlength="15" disabled="disabled"></td>
										</tr>
										<tr>
											<th>단위</th>
											<td><select class="custom-select" id="itemUnit" style="min-width:100%"></select></td>
											<th>규격</th>
											<td><input type="text" class="form-control" id="spaSpec" name="spaSpec" style="min-width:100%" maxlength="128"></td>
										</tr>
										<tr>
											<th>안전재고</th>
											<td><input type="text" class="form-control" id="spaSafyStock" name="spaSafyStock" style="min-width:100%" maxlength="50"></td>
											<th>적용설비</th>
											<td><input type="text" class="form-control" id="spaEquip" name="spaEquip" style="min-width:100%" maxlength="20"></td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3">
												<input type="text" class="form-control" id="itemDesc" name="itemDesc" maxlength="128" style="min-width: 100%;">
											</td>
										</tr>
										<!--==========/table 내용 추가==========-->
									</table>
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
						<!--====start====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">스페어사진</th>
										</tr>
										<tr>
											<th>사진1</th>
											<th>사진2</th>
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
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd1"
															name="imgAdd1" onchange="imageUpload(1)"> <label
															id="imgName1" class="custom-file-label" for="imgAdd1"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(1);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd2"
															name="imgAdd2" onchange="imageUpload(2)"> <label
															id="imgName2" class="custom-file-label" for="imgAdd2"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(2);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>사진3</th>
											<th>사진4</th>
										</tr>
										<tr>
											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile3" src="" 
														name="imageFile3" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4" src=""
														name="imageFile4" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd3"
															name="imgAdd3" onchange="imageUpload(3)"> <label
															id="imgName3" class="custom-file-label" for="imgAdd3"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(3);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd4"
															name="imgAdd4" onchange="imageUpload(4)"> <label
															id="imgName4" class="custom-file-label" for="imgAdd4"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(4);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>					
						</div>
						<!--====end====tab2 part=====-->
						<!--====start====tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary d-none float-right d-none" id="btnAttachSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachAdd">추가</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemPartAttachDataTable">
										<colgroup>
											<col width="7%">
											<col width="10%">
											<col width="33%">
											<col width="50%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>등록자</th>
												<th>내용</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "53%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});
	
	let currentHref = "bmsc0170";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","품목정보관리(스페어)"); 

	uiProc(true);
	let sideView = 'add';
	var activeTab = '기본정보';
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	var itemCd;
	var urlData = null;
	var itemCdArr = [];
	var itemSeq = null;
	var mainGubunList = '';

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	//공통코드 처리 시작
	var itemUnit = new Array();
	<c:forEach items="${itemUnit}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemUnit.push(json);
	</c:forEach>

	var mainGubun = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubun.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	selectBoxAppend(itemUnit, "itemUnit", "", "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#tab1Nav').tab('show');
		$('#btnSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		$('#mainGubun2').attr('disabled', false);
	});
	
	//기본정보 탭
	$('#tab1Nav').on('click', function() {
		uiProc(true);
		$('#mainGubun2').attr('disabled', false);
		$('#itemGubun2').attr('disabled', false);
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
	});

	//스페어사진 탭
	$('#tab2Nav').on('click', function() {
		imgPrint();
	});
	
	//관련자료 탭
	$('#tab3Nav').on('click', function() {
		$('#btnAttachAdd').removeClass('d-none');
		$('#btnAttachDel').removeClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#itemPartAttachDataTable').DataTable().ajax.reload();
	});

	// 목록
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : '001',
				'itemGubun' : function(){return "005";},
			},
		},
		rowId : 'itemCd',
		columns : [
			{
				data : 'itemCd',
				'className' : 'text-center'
			}, 
			{
				data : 'itemNm',
				'className' : 'text-center'
			}, 
			{
				data : 'spaSpec',
				'className' : 'text-center'
			}, 
			{
				data : 'spaSafyStock',
				render : function(data, type, row, meta) {
					return rmDecimal(data);
				},
				'className' : 'text-right'
			}, 
			{
				data : 'spaEquip',
				'className' : 'text-center'
			}, 
		],
		order : [ [ 1, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	// 보기
	$('#itemPartAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnAttachSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#tab1Nav').tab('show');

		if ($(this).hasClass('selected')) {
		} else {
			$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		//중요 키 값 가져오기
		itemSeq = itemPartAdmTable.row(this).data().itemSeq;
		itemCd = itemPartAdmTable.row(this).data().itemCd;
		itemRev = itemPartAdmTable.row(this).data().itemRev;
		
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#tab2Nav').removeClass('disabled');
		$('#tab3Nav').removeClass('disabled');

		$.ajax({
			url : '<c:url value="/bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'itemSeq' : itemSeq
			},
			success : function(res) {
				let data = res.data;
				let statusYn = res.statusYn;

				if (res.result == 'ok') {
					sideView = 'edit';
					// 사출/봉제
					if(data.mainGubun == '001'){
						$('#mg1').prop('checked', true);
					}else if(data.mainGubun == '002'){
						$('#mg2').prop('checked', true);
					}
					
					//상세보기
					$('#itemCd').val(data.itemCd);
					$('#itemNm').val(data.itemNm);
					$('#spaBarcode').val(data.spaBarcode);
					$('#itemCus').val(data.itemCus);
					$('#spaSpec').val(data.spaSpec);
					console.log(data.spaSafyStock)
					$('#spaSafyStock').val(rmDecimal(data.spaSafyStock));
					$('#spaEquip').val(data.spaEquip);
					$('#itemDesc').val(data.itemDesc);
					$('#spaWhse').val(data.spaWhse);

					selectBoxAppend(itemUnit, "itemUnit", data.itemUnit, "");
					
					uiProc(true);

				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	/* var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="mainGubun2" onChange="mainOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';

	$('#itemPartAdmTable_length').html(html1);
	
	selectBoxAppend(mainGubun, "mainGubun2", "", "1"); */

	/* function mainOnchange(){
		mainGubunList = $("#mainGubun2 option:selected").val();
		$("#mainGubun").val(mainGubunList).prop("selected", true);
		
		$('#itemPartAdmTable').DataTable().ajax.reload();
		
	} */

	//기본정보 등록 버튼
	$('#btnAdd').on('click', function() {
		sideView = 'add';

		//행 선택 취소
		$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		//상세정보 초기화
		$('#form').each(function() {
			this.reset();
		});

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		
		//seq 찾기
		$.ajax({
			url : '<c:url value="/bm/getItemCdSeq"/>',
			type : 'POST',
			async : false,
			data : {},
			success : function(res) {
				data = res.itemCdSeq;
				itemSeq = data;
			}
		});
		//선택박스 처리
		selectBoxAppend(itemUnit, "itemUnit", "", "");
		uiProc(false);
		$('#btnSave').removeClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#mainGubun2').attr('disabled', true);
	});

	
	//기본정보 수정 버튼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		
		uiProc(false);
		
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#mainGubun2').attr('disabled', true);

		$('#changeHisTable').removeClass('d-none');
	});

	//삭제
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		
		$.ajax({
			url : '<c:url value="bm/itemInfoAdmDelete"/>',
			type : 'POST',
			data :{
				'itemSeq' : function() {return itemSeq;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#itemPartAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
	});

	//기본정보 저장 처리
	$('#btnSave').on('click',function() {
		if (activeTab == "기본정보") {
			
			/* if ($('input[name=mainGubun]:checked').val() == '' || $('input[name=mainGubun]:checked').val() == undefined) {
				toastr.warning('구분을 선택해 주세요.');
				$('#mg1').focus();
				return false;
			} */

			if (!$('#itemCus').val()) {
				toastr.warning('공급사를 입력해 주세요.');
				$('#itemCus').focus();
				return false;
			}
			
			if (!$('#itemCd').val()) {
				toastr.warning('품번을 입력해 주세요.');
				$('#itemCd').focus();
				return false;
			}
			
			var itemCdCheck = false;
			
			if(sideView == 'add' || sideView == 'edit'){
				$.ajax({
					url : '<c:url value="bm/itemPartDtlList"/>',
					type : 'GET',
					async : false,
					data : {
						'itemCd' : function() {return $('#itemCd').val();},
					},
					success : function(res) {
						let data = res.data;
						
						if(data != null && itemSeq != data.itemSeq){
							itemCdCheck = true;
						}
					}
				});
			}
		
			if (itemCdCheck) {
				toastr.warning('중복된 품번 입니다.');
				$('#itemCd').focus();
				return false;
			}
			
			if (!$('#itemNm').val()) {
				toastr.warning('품명을 입력해 주세요.');
				$('#itemNm').focus();
				return false;
			}
			
			if (!$('#spaWhse').val()) {
				toastr.warning('스페어 창고를 선택해 주세요.');
				$('#spaWhse').focus();
				return false;
			}
			
			var url = '/bm/itemPartAdmCreate';
			if (sideView == "edit") {
				url = '/bm/itemPartAdmUpdate';
			} else if (sideView == "rev") {
				url = '/bm/itemPartRevCreate';
			}

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'itemSeq' 	: itemSeq,
					'mainGubun'   : "001",
					'itemGubun' : "005",
					'itemCd' : $('#itemCd').val(),
					'itemNm' : $('#itemNm').val(),
					'spaBarcode' : $('#spaBarcode').val(),
					'itemCus' : $('#itemCus').val(),
					'spaWhse' : $("#spaWhse").val(),
					'itemUnit' : $('#itemUnit').val(),
					'spaSpec' : $('#spaSpec').val(),
					'spaSafyStock' : $('#spaSafyStock').val().replace(/,/g,''),
					'spaEquip' : $('#spaEquip').val(),
					'itemDesc' : $('#itemDesc').val(),
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						// 보기
						$('#itemPartAdmTable').DataTable().ajax.reload(function() {});
						uiProc(true);
						$('#btnSave').addClass('d-none');
						$('#btnAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
						$('#btnDel').attr('disabled', false);
						$('#mainGubun2').attr('disabled', false);
						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else if (sideView == "add") {
							toastr.success('신규 등록되었습니다.');
						}

						itemCd = $('#itemCd').val();
						sideView = 'edit';
					} else if (res.result == "exist") {
						toastr.error("이미 등록된 코드입니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});

			if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
				var url = '/sm/systemChangeLogCreate';

				$.ajax({
					url : url,
					type : 'POST',
					async : false,
					data : {
						'changeHis'  : $('#changeHis').val(),
						'menuPath'  : currentHref,
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success('변경내역이 등록되었습니다.');
							$('#changeHisTable').addClass('d-none');
							$('#changeHis').val('');
						} else {
							toastr.error(res.message);
						}
					}
				});
			}else{
				$('#changeHisTable').addClass('d-none');
			}
		}
	});

	//관련자료 목록조회
	let itemPartAttachDataTable = $('#itemPartAttachDataTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="/bm/itemPartAttachDataList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function() {return itemSeq;},
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					}
				},
				{
					data : 'regNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return userNm;
						}
					}
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return '<input class="form-control" type="text" id="contents" name="contents" style="min-width:100%;"/>';
						}
					}
				},
				{
					data : 'fileNm',
					render : function(data, type, row, meta) {

						var html;

						if (data != null) {
							html = '<a href="/bm/itemPartAttachFileDownload?itemSeq='
									+ row['itemSeq']
									+ '&itemRev='
									+ row['itemRev']
									+ '&itemAttachSeq='
									+ row['itemAttachSeq']
									+ '">'
									+ data + '</a>';
						} else {
							html = '<div class="custom-file" disabled>'
							html += '<input type="file" class="custom-file-input" id="fileNm_'
									+ meta.row
									+ '" name="file" onchange=uploadWorkStandard("'
									+ meta.row + '"); />'
							html += '<label class="custom-file-label" for="fileNm_'+meta.row+'">파일을 선택해주세요.</label></div>'
						}

						return html;
					}
				} ],
		columnDefs : [ {
			"targets" : [ 0, 1 ],
			"className" : "text-center"
		},

		],
		buttons : []
	});

	//데이터 클릭 시
	$('#itemPartAttachDataTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemPartAttachDataTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemAttachSeq = itemPartAttachDataTable.row(this).data().itemAttachSeq;
		console.log("itemAttachSeq = " + itemAttachSeq);
	
		status = "choice";
	});

	//추가버튼
	$('#btnAttachAdd').on('click', function() {
		/* if(status != "choice"){
			toastr.warning("관련자료 항목을 선택해주세요.");
		} */
		$('#itemPartAttachDataTable').DataTable().row.add({}).draw(false);

		$('#btnAttachAdd').attr('disabled', true);
		$('#btnAttachDel').attr('disabled', true);

		$('#btnAttachSave').removeClass('d-none');

	});

	//삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (status != "choice") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="bm/itemPartAttachDataDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {
					return itemSeq;
				},
				'itemRev' : function() {
					return itemRev;
				},
				'itemAttachSeq' : function() {
					return itemAttachSeq;
				},

			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					status = '';
				} else {
					toastr.error(res.message);
				}
				$('#itemPartAttachDataTable').DataTable().ajax.reload();
			}
		});

	});

	//저장 버튼 클릭
	$('#btnAttachSave').on('click', function() {
		if (activeTab == "관련자료") {

			if (!$.trim($('input[name=file]').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#file').focus();
				return false;
			}

			var formData = new FormData(document.getElementById("form3"));
			formData.append('itemSeq', itemSeq);

			$.ajax({
				url : '<c:url value="bm/itemPartAttachDataCreate" />',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(res) {
					if (res.result == 'ok') {
						// 보기
						toastr.success('등록되었습니다.');
						status = '';
					} else {
						toastr.error(res.message);
					}

					$('#itemPartAttachDataTable').DataTable().ajax.reload();
					$('#btnAttachSave').addClass('d-none');
					$('#btnAttachAdd').attr('disabled', false);
					$('#btnAttachDel').attr('disabled', false);
				}
			});

		}
	});

	//이미지 등록
	function imageUpload(value) {

		var fileListView = "";

		var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("itemSeq", itemSeq);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
					imgPrint();
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				} else if (data.result == "sizeError") {
					toastr.error('사진 용량이 너무 큽니다. (1메가 이하로 올려 주세요.)');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				}
				
			}
		});
	}

	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageDelete"/>',
			type : 'POST',
			data : {
				'itemSeq' : function(){return itemSeq;},
				//'imageFile'			:		function(){a=null; a=$('#imgName'+number).text(); return a;},
				'value' : function(){return value;},

			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					imgPrint();
				}

			},
			error : function(xhr, textStatus, error) {

				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
		$('#imgAdd' + value).val("");
		$('#imgName' + number).val("");
		$('#imgName' + number).text("");
		$('#imgName' + number).attr("src", "");

	}

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeq;},
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
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src",
							"data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
				}
				if (data.imageFile3 == null) {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
				}
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src",
							"data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
				}
				if (data.imageFile4 == null) {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}


	//숫자 콤마생성
	$(document).on('keyup', "#spaSafyStock",  function(evt) { //입력시 콤마 추가
		var costSum = 0;
		if ($(this).val() == "") {
			$(this).val("0");
			$(this).select();
		}
		//입력 정규식 0~9 .
		reg = /[^0-9.]/gi;
		let poQty = $(this).val().replace(/,/g, '');
		if (reg.test(poQty)) {
			poQty = poQty.replace(reg, '');
			$(this).val(rmDecimal(poQty));
			return false;
		}
		$(this).val(rmDecimal(poQty));

	});
	
	function uiProc(flag) {
		$("#itemCd").attr("disabled", flag);
		$("#itemNm").attr("disabled", flag);
		$("#spaBarcode").attr("disabled", flag);
		$("#itemCus").attr("disabled", flag);
		$("#spaWhse").attr("disabled", flag);
		$("#itemUnit").attr("disabled", flag);
		$("#spaSpec").attr("disabled", flag);
		$("#spaSafyStock").attr("disabled", flag);
		$("#spaEquip").attr("disabled", flag);
		$("#itemDesc").attr("disabled", flag);
		$("#mg1").attr("disabled", flag);
		$("#mg2").attr("disabled", flag);
	}

	
	//바코드 출력 버튼 클릭시
	$('#btnPrint').on('click',function(){
		var obj = new Object();
		
	    obj.cd = $('#itemCd').val();
	    obj.nm = $('#itemNm').val() //품명
	    obj.spec = $('#spaSpec').val() //규격
	    obj.equip = $('#spaEquip').val() //적용설비
	    obj.barcode = $('#spaBarcode').val() //바코드
	
	    labelPrint(obj,"")
	});

	
	function labelPrint(data, action) {
		console.log("data:"+data.itemCd);
		let cmds = {};
		   
	   	let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	
	      //행
	      cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	
	      //열
	      cmd += "{LC;0210,0035,0210,0320,0,5|}";
	      cmd += "{LC;0650,0035,0650,0110,0,5|}";
	      cmd += "{LC;0810,0035,0810,0110,0,5|}";
	    /*   cmd += "{LC;0350,0180,0350,0320,0,5|}";
	      cmd += "{LC;0505,0180,0505,0320,0,5|}";
	      cmd += "{LC;0655,0180,0655,0320,0,5|}";
	      cmd += "{LC;0800,0180,0800,0320,0,5|}"; */
	      
	      //데이터
	      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=   품번|}";
	      cmd += "{PV23;0230,0090,0040,0040,01,0,00,B="+data.cd+"|}";
	      cmd += "{PV23;0015,0160,0040,0040,01,0,00,B=   품명|}";
	      cmd += "{PV23;0230,0160,0040,0040,01,0,00,B="+data.nm+"|}";
	      cmd += "{PV23;0015,0230,0040,0040,01,0,00,B=   규격|}";
	      cmd += "{PV23;0230,0230,0040,0040,01,0,00,B="+data.spec+"|}"; 
	      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B= 적용설비|}";
	      cmd += "{PV23;0230,0300,0040,0040,01,0,00,B="+data.equip+"|}";
	      cmd += "{PV23;0670,0090,0040,0040,01,0,00,B=사업부|}";
	      cmd += "{PV23;0820,0090,0040,0040,01,0,00,B=  사출|}";
	      
	      cmd += "{XB03;0220,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.barcode+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
	
</script>
<script>
	
	//웹 서버를 접속한다.
	var webSocket = new WebSocket("ws://localhost:9998");
	// 웹 서버와의 통신을 주고 받은 결과를 출력할 오브젝트를 가져옵니다.
	var messageTextArea = document.getElementById("installedPrinterName");
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
		toastr.success('인쇄 서버에 연결되었습니다.')
		$('#wsStateView').text('연결됨');
		$('#wsStateView').css('color','#19FF00');
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
		toastr.error('인쇄 서버가 종료되었습니다.')
		$('#wsStateView').text('연결끊김');
		$('#wsStateView').css('color','#FF0004');
	};
	// 소켓 통신 중에 에러가 발생되면 호출되는 함수
	webSocket.onerror = function(message){
		toastr.warning('현재 인쇄프로그램이 종료되어있습니다. 인쇄프로그램을 시작해주세요.')
	};
	// 소켓 서버로 부터 메시지가 오면 호출되는 함수.
	webSocket.onmessage = function(message){
		// 출력 area에 메시지를 표시한다.
		console.log(message);
	};
	// 서버로 메시지를 전송하는 함수
	function sendMessage(cmd){
		if(webSocket.readyState == 1) {
			webSocket.send(cmd);
		} else {
			toastr.error('인쇄 서버와의 연결을 확인해주세요.');
			//webSocket = new WebSocket("ws://localhost:9998");
		}
	}

</script>
   	

</body>
</html>
