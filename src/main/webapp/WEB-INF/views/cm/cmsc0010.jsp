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
				<li class="breadcrumb-item"><a href="#">공통</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="bbsListTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="55%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>번호</th>
									<th class="text-center">제목</th>
									<th>등록자</th>
									<th>등록일</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand"
						class="closebtn float-right" onclick="closerNav()"><i
						class="mdi mdi-close"></i></a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
						<a class="nav-link active show"
							data-toggle="tab" href="#tab1" id="reviewShow1">기본정보</a></li>
						<!-- <li class="nav-item" id="reviewShow">
						<a class="nav-link" data-toggle="tab" href="#tab2" id="reviewShow2">댓글</a></li> -->
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">

							<!--상단 버튼 part-->
							<div class="card-body col-sm-12 p-1">
								<!-- <button type="button" class="btn btn-success float-right ml-3"
									id="btnReply">답변</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button> -->
								 <button type="button" class="btn btn-danger float-right mr-1"
									id="btnDel">삭제</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnEdit">수정</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAdd">등록</button>
								<button class="btn btn-warning d-none"
									id="btnEditConfirmLoading" type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form" method="post" enctype="multipart/form-data">
								<!--제목-->
								<div class="form-group m-0 mt-2">
									<input type="text" class="form-control-auto mb-3"
										placeholder="제목을 입력해주세요" name="bbsTitle" id="bbsTitle">
								</div>

								<!--텍스트-->
								<textarea class="textarea_box" name="bbsContent" id="bbsContent"></textarea>
								
								
								<!--첨부파일1-->
								<div class="form-group m-0 mr-2 mt-2 row p-0 d-none" id="fl01">
									<label for="fl1" class="mr-2">첨부파일1</label>
									<a href="/cm/downloadFile" id="file1" ><span id="fl1"></span></a>
								</div>
								
								<!--첨부파일2-->
								<div class="form-group m-0 mr-2 mt-2 row p-0 d-none" id="fl02">
									<label for="fl2" class="mr-2">첨부파일2</label>
									<a href="/cm/downloadFile" id="file2" ><span id="fl2"></span></a>
								</div>
								
								<!--첨부파일2-->
								<div class="form-group m-0 mr-2 mt-2 row p-0 d-none" id="fl03">
									<label for="fl3" class="mr-2">첨부파일3</label>
									<a href="/cm/downloadFile" id="file3" ><span id="fl3"></span></a>
								</div>
									
									
								<!--파일업로드1-->
								<div class="form-group" id="tf01" >
									<label for="tf1" class="mt-3">첨부파일1</label>
									<div class="custom-file mt-2">
										<input type="file" class="custom-file-input" id="tf1" name="tf1" value="">
										<label class="custom-file-label" for="tf1" id="tfvalue">파일을 선택해주세요</label>
									</div>
								</div>

								<!--파일업로드2-->
								<div class="form-group mt-3 d-none"  id="tf02">
									<label for="tf2">첨부파일2</label>
									<div class="custom-file mt-2">
										<input type="file" class="custom-file-input" id="tf2" name="tf2" value="">
										<label class="custom-file-label" for="tf2">파일을 선택해주세요</label>
									</div>
								</div>

								<!--파일업로드3-->
								<div class="form-group mt-3 d-none"  id="tf03" >
									<label for="tf3">첨부파일3</label>
									<div class="custom-file mt-2">
										<input type="file" class="custom-file-input" id="tf3" name="tf3" value="">
										<label class="custom-file-label" for="tf3">파일을 선택해주세요</label>
									</div>
								</div>
								
								<hr>
								
								 <!--댓글-->
								<!--
								<div class="form-group m-0 mr-2 mt-2 row p-0">
									<input type="text" class="form-control-auto mr-3 d-none"
										placeholder="댓글을 입력해주세요" id="bbsReContent" style="width: 90%;">
									<a id="reSave" href=""><button class="btn btn-primary d-none" id="btnReSave">입력</button></a>
								</div> -->
							</form>

							<div class="mt-2">
								<button type="button" class="btn btn-primary d-none float-right"
									id="btnSave">저장</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span>처리중
								</button>
							</div>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<!-- .table-responsive -->
							<div class="table-responsive">
								<table id="matrlCdTable" class="table table-bordered">

									<colgroup>
										<col width="10%">
										<col width="80%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th style="min-width: 60px;">번호</th>
											<th style="min-width: 110px;">내용</th>
											<th style="min-width: 110px;">등록자</th>
											<th style="min-width: 110px;">등록일</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!--====end====tab2 part=====-->

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
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>
<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "cmsc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	let viewIdx;
	let sideView = 'add';
	$(document).attr("title","공지사항"); 

	var bbsNo=0;
	var bbsReSeq;
	var bbsReLevel;
	var attchFileNm1;
	uiProc(true);

	//파일 저장 시간 가져오기
	var now=new Date();
	var year=now.getFullYear();
	var mon=now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var str=year+""+mon;

	$('#saveBtnModal').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
	});

	$("#dealCorpNm").attr("disabled", true);
	
	// 게시글 목록
	let bbsListTable = $('#bbsListTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : true,
						ordering : false,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						pageLength : 20,
						ajax : {
							url : '<c:url value="/cm/bbsList"/>',
							type : 'GET',
							data : {},
						},
						columns : [
// 								{
// 									data : 'bbsNo'
// 								},
						    	{	
						    		render: function(data, type, row, meta) {		
										return meta.row + meta.settings._iDisplayStart + 1 ;
					    			}
						    	},
								{
									data : 'bbsTitle',
									'className' : 'text-left'
								},
								{
									data : 'userNm'
								},
								{
									  render : function(data, type, row) {
										return moment(row['regDate']).format(
												'YYYY-MM-DD HH:mm');
									}

								} ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '검사항목'
						}, 'print' ],
					});

	// 게시글 상세보기
	$('#bbsListTable tbody')
			.on(
					'click',
					'tr',
					function() {

						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							console.log("등록중입니다.");
							return false;
						}

						if ($(this).hasClass('selected')) {
						
						} else {
							$('#bbsListTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}

						
						bbsNo = bbsListTable.row(this).data().bbsNo;
						
						$('#bbsReContent').val('');
						$('#reviewShow1').tab('show');
						$('#btnReply').attr('disabled', false); //답변버튼
						$('#btnEdit').attr('disabled', false); //수정버튼
						$('#btnSave').addClass('d-none'); // 저장버튼
						$('#bbsReContent').removeClass('d-none');
						$('#btnReSave').removeClass('d-none');
						$('#reviewShow').removeClass('d-none');
						$('#tf01').addClass('d-none');
						$('#fl01').removeClass('d-none');
						
						//선택 행 데이터 불러오기
						$.ajax({
							url : '<c:url value="/cm/bbsRead"/>',
							type : 'GET',
							data : {
								'bbsNo' : bbsNo
							},
							success : function(res) {
								let data = res.data;
								sideView = 'edit';
								attchFileNm1=data.attchFileNm1;
							    
								$('#form input[name="bbsTitle"]').val(
										data.bbsTitle);
								$('#form textarea[name="bbsContent"]').val(
										data.bbsContent);
								$('#fl1').text(
										data.attchFileNm1);
								$('#fl2').text(
										data.attchFileNm2);
								$('#fl3').text(
										data.attchFileNm3);
								
								$('#file1').attr('href','/cm/downloadFile?bbsNo='+bbsNo+'&fileNo=1');
								$('#file2').attr('href','/cm/downloadFile?bbsNo='+bbsNo+'&fileNo=2');
								$('#file3').attr('href','/cm/downloadFile?bbsNo='+bbsNo+'&fileNo=3');
								
								}
						});

						//댓글 목록 보기
						let matrlCdTable = $('#matrlCdTable')
								.DataTable(
										{
											dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
													+ "<'row'<'col-sm-12'tr>>"
													+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
											language : lang_kor,
											paging : true,
											info : true,
											ordering : true,
											processing : true,
											autoWidth : false,
											destroy : true,
											lengthChange : false,
											pageLength : 20,
											ajax : {
												url : '<c:url value="/cm/bbsReList"/>',
												type : 'GET',
												data : {
													'bbsNo' : bbsNo
												},
											},
											columns : [
													{
														data : 'bbsSeq',
														'className' : 'text-center'
													},
													{
														data : 'bbsContent'
													},
													{
														data : 'userNm',
														'className' : 'text-center'
													},
													{
														render : function(data,
																type, row) {
															return moment(
																	row['regDate'])
																	.format(
																			'YYYY-MM-DD hh:mm');
														},
														'className' : 'text-center'
													} ],
											order : [ [ 0, 'desc' ] ],
											buttons : [ 'copy', {
												extend : 'excel',
												title : '검사항목'
											}, 'print' ],
										});
					});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';

		
		$('#form').each(function() {
			this.reset();
		});

		$('#tfvalue').text('파일을 선택해주세요');
		
		//화면처리        
		uiProc(false);
		$('#btnReply').attr('disabled', true); //답변버튼
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#bbsReContent').addClass('d-none');
		$('#btnReSave').addClass('d-none');
		$('#reviewShow').addClass('d-none');
		$('#bbsTitle').attr('readonly', false);
		$('#tf01').removeClass('d-none');
		$('#fl01').addClass('d-none');
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		
		if (sideView != 'edit') {
			toastr.error("수정할 목록을 선택해 주세요!");
			return false;
		}
		$('#tfvalue').text(attchFileNm1);
		
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#bbsReContent').addClass('d-none');
		$('#btnReSave').addClass('d-none');
		$('#reviewShow').addClass('d-none');
		$('#tf01').removeClass('d-none');
		$('#fl01').addClass('d-none');
	});

	// 답변폼
	$('#btnReply').on('click', function() {
		if (sideView != 'edit') {
			toastr.error("답변할 목록을 선택해 주세요!");
			return false;
		}
		sideView ='reply';

		$('#tfvalue').text('파일을 선택해주세요');
		
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#bbsTitle').val(' Re:) '+$('#form input[name="bbsTitle"]').val());
		$('#bbsContent').val('');
		$('#baseInfoCd').attr('disabled', true);
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#bbsReContent').addClass('d-none');
		$('#btnReSave').addClass('d-none');
		$('#reviewShow').addClass('d-none');
		$('#bbsTitle').attr('readonly', true);
		$('#tf01').removeClass('d-none');
		$('#tf02').addClass('d-none');
		$('#tf03').addClass('d-none');
		$('#fl01').addClass('d-none');
		$('#fl02').addClass('d-none');
		$('#fl03').addClass('d-none');
		
	});

	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.error("삭제할 목록을 선택해 주세요!");
			return false;
		}

		var url = '<c:url value="/cm/bbsDelete"/>';
		
		$.ajax({
			url : url,
			type : 'post',
			data : {
					'bbsNo' : bbsNo
				},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					
					toastr.success('삭제되었습니다.');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#form').each(function() {
					this.reset();
				});
				$('#bbsListTable').DataTable().ajax.reload(function() {
				});
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
	});
		
	// 게시판 글 저장 처리
	$('#btnSave').on('click', function() {

		var formData=new FormData(document.getElementById('form'));
		formData.append('bbsNo',bbsNo);
		formData.append('attchPath',str);

		//입력값 검사
		if (!$.trim($('#bbsTitle').val())) {
			toastr.warning('제목을 입력해주세요.');
			$('#bbsTitle').focus();
			return false;
		}

		if (!$.trim($('#bbsContent').val())) {
			toastr.warning('내용을 입력해주세요.');
			$('#bbsContent').focus();
			return false;
		}

		var url = '<c:url value="/cm/bbsCreate"/>';

		if (sideView == "edit") {
			
			url = '<c:url value="/cm/bbsUpdate"/>';
			
		}else if(sideView == "reply"){
			
			url = '<c:url value="/cm/bbsReply"/>';
		}

		$.ajax({
			url : url,
			type : 'post',
			data : formData,
		    processData: false,
            contentType: false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {

					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					}else {
						toastr.success('등록되었습니다.');
						
					}
					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
				$('#bbsListTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
	});

	// 댓글 저장 처리
	$('#btnReSave').on('click', function(e) {
		e.preventDefault()
		
		//입력값 검사
		if (!$.trim($('#bbsReContent').val())) {
			toastr.error('내용을 입력해주세요.');
			$('#bbsReContent').focus();
			return false;
		}

		var url = '<c:url value="/cm/bbsReCreate"/>';
		

		$.ajax({
			url : url,
			type : 'POST',
			data : {	
				'bbsNo' : bbsNo,
				'bbsContent' : $('#bbsReContent').val(),
			},

			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					uiProc(true);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				
				$('#matrlCdTable').DataTable().ajax.reload(function() {});
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
				$('#bbsReContent').val('');
				$('#reviewShow2').tab('show');
			}
		});
		
		
	});

	function uiProc(flag) {
		$("#bbsTitle").attr("disabled", flag);
		$("#bbsContent").attr("disabled", flag);
		$("#tf1").attr("disabled", flag);
		
	}
</script>
</body>
</html>
