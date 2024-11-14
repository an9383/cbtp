<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
				<li class="breadcrumb-item"><a href="#">시스템관리</a></li>
				<li class="breadcrumb-item active">사용자관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 66%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="matrlUserTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th style= "width: 5%">아이디</th>
									<th style= "width: 5%">성명</th>
									<th style= "width: 5%">부서</th>
									<th style= "width: 5%">직위</th>
									<th style= "width: 5%">담당</th>
									<th style= "width: 5%">상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 33%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()"> <i class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-warning float-right" id="btnDel">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="formRight" enctype="multipart/form-data">
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*성명</th>
									<td>
										<input type="text" class="form-control" id="userNm" name="userNm" maxlength="10">
									</td>
									<th>사번코드</th>
									<td>
										<input type="text" class="form-control" id="userNumber" name="userNumber" disabled>
									</td>

								</tr>
								<tr>
									<th>*아이디</th>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="userId" name="userId" maxlength="20" onpaste="return false;" oncopy="return false;">
											<button type="button" class="btn btn-primary d-none" id="checkBtn">중복</button>
											<button type="button" class="btn btn-primary d-none" id="changeBtn">수정</button>
										</div>
									</td>
									<th>*비밀번호</th>
									<td colspan="3">
										<div class="form-password2">
											<input type="password" class="form-control" id="userPw" name="userPw" style="min-width:100%" maxlength="10" onpaste="return false;" oncopy="return false;">
											<span id="passwordCheckText"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>
										<select class="custom-select" id="departmentCd"></select>
									</td>
<!-- 									<th>*사업장</th> -->
<!-- 									<td> -->
<!-- 										<select class="custom-select" id="workplaceCd"></select> -->
<!-- 									</td> -->
									<th>직위</th>
									<td>
										<select class="custom-select" id="postCd"></select>
									</td>
								</tr>
								<tr>
									<th>담당</th>
									<td>
										<select class="custom-select" id="chargeDuty"></select>
									</td>
									<th>상태</th>
									<td>
										<select class="custom-select" id="empCd"></select>
									</td>
								</tr>
								<tr>
									<th>입사일</th>
									<td>
										<div class="form-group input-sub m-0">
											<input class="form-control" type="text" id="joinDate" name="joinDate" maxlength="10" disabled />
											<button onclick="fnPopUpCalendar(joinDate,joinDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="joinDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>퇴사일</th>
									<td>
										<div class="form-group input-sub m-0">
											<input class="form-control" type="text" id="resignDate" name="resignDate" maxlength="10" disabled />
											<button onclick="fnPopUpCalendar(resignDate,resignDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="resignDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
								</tr>
<!-- 								<tr> -->
<!-- 									<th>*구분</th> -->
<!-- 									<td> -->
<!-- 										<select class="custom-select" id="teamCd"></select> -->
<!-- 									</td> -->
<!-- 									<th>*공수인원구분</th> -->
<!-- 									<td> -->
<!-- 										<select class="custom-select" id="personalGubun"></select> -->
<!-- 									</td> -->
<!-- 								</tr> -->
								<tr>
									<th>Admin 권한설정</th>
									<td>
										<input type="checkbox" class="form-control" id="adminCheck">
									</td>
									<th>사진유무</th>
									<td><select class="custom-select" id="imageYn" disabled></select></td> 
								</tr>
								<tr>
<!-- 									<th>입퇴유무</th> -->
<!-- 									<td> -->
<!-- 										<select class="custom-select" id="empCd"></select> -->
<!-- 									</td> -->
									<th>비고</th>
									<td colspan="4">
										<input type="text" class="form-control" style="max-width : 100%" id="userDesc" name="userDesc" maxlength="256">
									</td>
								</tr>
								
								<tr>
									<th colspan="4">사진</th>
								</tr>
								
								<tr>
									<td colspan="4">
										<div class="custom-file" style="height: 150px; text-align: center;">
											<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
												name="imageFile1" style="max-width: 100%; max-height: 100%">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										
										<div class="form-group">										
											<div class="custom-file" style="width: 90%;">
												<input type="file" class="custom-file-input" id="imgAdd1"
													name="imgAdd1" accept="image/*"> <label
													id="imgName1" class="custom-file-label" for="imgAdd1"></label>
											</div>
											<div class="rightsidebar-close"
												style="width: 10%; padding-top: 4px;">
												<button type="button" class="btn" name="closeBtn1"
													id="closeBtn1">
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
				<table class="table table-bordered mt-5 d-none" id="changeHisTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<th>변경내역</th>
						<td colspan='3'><input type="text" class="form-control" style="max-width: 100%"
							id="changeHis" maxlength="20"></td>
					</tr>
				</table>
				<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
					</button>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>

	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "66%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});


	menuAuth = 'smsc0010';
	let currentHref = 'smsc0010';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","사용자관리");
	
	let viewIdx;
	let sideView = 'add';
	uiProc(true);
	let check = 0;
	let userDepartCheck = "${userDepart}";
	let userNumberCheck = "${userNumber}";

	//공통코드 처리 시작
	var departmentCode = new Array(); // 부서
	<c:forEach items="${departmentCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	departmentCode.push(json);
	</c:forEach>

	var empCode = new Array(); // 입퇴유무
	<c:forEach items="${empCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	empCode.push(json);
	</c:forEach>

	var chargeDuty = new Array(); // 담당업무
	<c:forEach items="${chargeDuty}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	chargeDuty.push(json);
	</c:forEach>

	var postCode = new Array(); // 직위
	<c:forEach items="${postCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	postCode.push(json);
	</c:forEach>

	var teamCode = new Array(); // 조편성
	<c:forEach items="${teamCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	teamCode.push(json);
	</c:forEach>

	var workplaceCode = new Array(); // 사업장
	<c:forEach items="${workplaceCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	workplaceCode.push(json);
	</c:forEach>

	var acknowledgment = new Array(); // 승인권한
	<c:forEach items="${acknowledgment}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	acknowledgment.push(json);
	</c:forEach>

	var personalGubun = new Array(); // 공수인원구분
	<c:forEach items="${personalGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	personalGubun.push(json);
	</c:forEach>

	var imageYnGubun = new Array(); // 사진유무
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	imageYnGubun.push(json);
	</c:forEach>
	//공통코드 처리 종료  

	selectBoxAppend(departmentCode, "departmentCd", "", "2");
	selectBoxAppend(empCode, "empCd", "Y", "2");
	selectBoxAppend(chargeDuty, "chargeDuty", "", "2");
	selectBoxAppend(postCode, "postCd", "", "2");
	selectBoxAppend(teamCode, "teamCd", "", "2");
	selectBoxAppend(workplaceCode, "workplaceCd", "", "2");
	selectBoxAppend(acknowledgment, "acknowledgment", "", "2");
	selectBoxAppend(personalGubun, "personalGubun", "", "2");
	selectBoxAppend(imageYnGubun, "imageYn", "", "2");
	$("#userNumber").attr("disabled", true);

	 
    $('#saveBtnModalY').on('click',function() {
    	uiProc(true);
    	$('#btnSave').addClass('d-none');
    	$('#btnAdd').attr('disabled', false);
    	$('#btnEdit').attr('disabled', false);
    	$('#btnDel').attr('disabled', false);
    	$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
    });

    
	// 목록
	let matrlUserTable = $('#matrlUserTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange: false,
        pageLength: 20,
		ajax : {
			url : '<c:url value="/sm/matrlUserDataList"/>',
			type : 'GET',
			data : {
				'menuAuth'	: 	menuAuth,
			},
		/*
		success : function(res) {
		    console.log(res);
		}
		 */
		},
		rowId : 'userNumber',
		columns : [
				
				{ data : 'userId' },
				{ data : 'userNm' },
				{ data : 'departmentNm' },
				{ data : 'postNm' },
				{ data : 'chargeDutyNm' },
				{ data : 'empNm' }
			],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
		order : [ [ 0, 'asc' ] ],
        buttons: [
            {
                extend: 'copy',
                title: '사용자관리',
            },
            {
                extend: 'excel',
                title: '사용자관리',
            },
            {
                extend: 'print',
                title: '사용자관리',
            }
        ],
        drawCallback : function() {
        	var api = this.api();
        	for(var i = 0; i < api.data().count(); i++) {
        		if (api.row(i).data().empNm == '퇴사'){
        			$('#'+api.row(i).data().userNumber).css("background-color", "#f4f4f4");
        			$('#'+api.row(i).data().userNumber).css("color", "black");
            	}
        	}
        	/* if(userDepartCheck != '관리부'){
        		$('#btnAdd').addClass('d-none');
        		$('#btnEdit').addClass('d-none');
        		$('#btnDel').addClass('d-none');
        	} */
        }
	});
	
	let userId = '';
	// 보기
	$('#matrlUserTable tbody').on('click', 'tr', function() {
		
		if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
    	
		matrlUser = matrlUserTable.row(this).data().userNumber;
		$('#btnSave').addClass('d-none'); // 저장버튼
		$.ajax({
			url : '<c:url value="/sm/matrlUserData"/>',
			type : 'GET',
			data : {
				'menuAuth'	: 	menuAuth,
				'userNumber' : matrlUser
			},
			success : function(res) {
				let data = res.data;

				if(res.result == "ok"){
					sideView = 'edit';
					userId = data.userId
					
					// 보기
					if (data.userImageFile != null) {
						$('#imageFile1').attr("src","data:image/jpg;base64," + data.userImageFile);
						$('#imgName1').text(data.userImageFileNm);
					} else{
						$('#imageFile1').attr("src", '');
						$('#imgName1').text('');
					}
					$('#userNumber').val(data.userNumber);
					$('#userNm').val(data.userNm);
					if(data.joinDate != null && data.joinDate != ''){
						$('#joinDate').val(moment(data.joinDate).format('YYYY-MM-DD'));
					}
					if(data.resignDate != null && data.resignDate != ''){
						$('#resignDate').val(moment(data.resignDate).format('YYYY-MM-DD'));
					}else{
						$('#resignDate').val("");
					}
					$('#userId').val(data.userId);
					$('#userPw').val("");
					$('#userDesc').val(data.userDesc);
					
					//화면처리
					uiProc(true);
					/* if(userDepartCheck != '관리부'){
						if(userNumberCheck == data.userNumber){
			        		$('#btnEdit').removeClass('d-none');
			        	}else{
			        		$('#btnEdit').addClass('d-none');
			        	}
					} */
					if(data.adminCheck == 'Y'){
						$('#adminCheck').prop('checked',true);
					}else{
						$('#adminCheck').prop('checked',false);
					}
					//선택박스 처리
					selectBoxAppend(departmentCode, "departmentCd", data.departmentCd, "");
					selectBoxAppend(empCode, "empCd", data.empCd, "");
					selectBoxAppend(chargeDuty, "chargeDuty", data.chargeDuty, "");
					selectBoxAppend(postCode, "postCd", data.postCd, "");
					selectBoxAppend(teamCode, "teamCd", data.teamCd, "2");
					selectBoxAppend(workplaceCode, "workplaceCd", data.workplaceCd, "");
					selectBoxAppend(personalGubun, "personalGubun", data.personalGubun, "2");
					selectBoxAppend(imageYnGubun, "imageYn", data.imageYn, "2");
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//아이디 중복버튼
	$('#checkBtn').on('click', function() {
		var checkId = $('#userId').val();
		if(KeyString($.trim($('#userId').val()))){
			toastr.warning("아이디는 4글자 이상 20글자 이하의 영어&숫자조합입니다.");
			$('#userId').val("");
			return false;
		}
		$.ajax({
			url : '<c:url value="/sm/checkIdData"/>',
			type : 'POST',
			data : {
				'menuAuth'	: 	menuAuth,
				'userId' : checkId
			},
			success : function(res) {
				if(res.result == "ok"){
					if (res.res != null) {
						if (checkId == res.res.userId) {
							toastr.error('이미 존재하는 아이디입니다.');
							$('#userId').val("");
							$('#userId').focus();
							check = 0;
							return false;
						} else {
							alert("사용가능한 아이디입니다.");
							$('#checkBtn').addClass('d-none');
							$('#changeBtn').removeClass('d-none');
							$("#userId").attr("disabled", true);
							//$('#userId').css({'width': '100%'});
							check = 1;
						}
					} else if (res.res == null) {
						alert("사용가능한 아이디입니다.");
						$('#checkBtn').addClass('d-none');
						$('#changeBtn').removeClass('d-none');
						$("#userId").attr("disabled", true);
						//$('#userId').css({'width': '100%'});
						check = 1;
					}
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//아이디 수정버튼
	$('#changeBtn').on('click', function() {
		check = 0;
		$('#checkBtn').removeClass('d-none');
		$('#changeBtn').addClass('d-none');
		$("#userId").attr("disabled", false);
		$("#userId").val('');
		$("#userId").focus();
	})

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		check = 0;
		
		userId = '';
		$('#imgName1').text("파일을 선택해주세요");
		$('#imageFile1').attr("src", " ");
		$('#imgAdd1').val("");
		$('#adminCheck').prop('checked',false);
		$('#userNm').val("");
		$('#userId').val("");
		$('#joinDate').val("");
		$('#resignDate').val("");
		$('#userDesc').val("");
		
		$('#matrlUserTable').find('tr.selected').removeClass('selected');
		$('#userId').css({'width': '66%'});
		$('#form').each(function() {
			this.reset();
		});
		$('#btnEdit').attr('disabled',true);
		$('#btnDel').attr('disabled',true);
		$.ajax({
   			url: '/sm/userNumberCreate',
	        type: 'POST',
	        data: {
	        	'menuAuth'	: 	menuAuth,
	        },
	        success: function (res) {
		        if (res.result == "ok") {
	        		$('#userNumber').val(res.data.userNumber);
		        } else {
			        toastr.error(res.message);
				}
	        }
   		});
   		
		//화면처리        
		uiProc(false);
		//선택박스처리
		selectBoxAppend(departmentCode, "departmentCd", "", "2");
		selectBoxAppend(empCode, "empCd", "Y", "2");
		selectBoxAppend(chargeDuty, "chargeDuty", "", "2");
		selectBoxAppend(postCode, "postCd", "", "2");
		selectBoxAppend(teamCode, "teamCd", "", "2");
		selectBoxAppend(workplaceCode, "workplaceCd", "", "2");
		selectBoxAppend(imageYnGubun, "imageYn", "", "2");
		$('#btnSave').removeClass('d-none');
		$('#checkBtn').removeClass('d-none');
	});

	$('#matrlUserTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
			$('#checkBtn').addClass('d-none');
		} else {
			$('#matrlUserTable').DataTable().$('tr.selected').removeClass('selected');
			$('#checkBtn').addClass('d-none');
			$(this).addClass('selected');
		}
		$('#userId').css({'width': '100%'});
		menuId = matrlUserTable.row(this).data().menuId;
		console.log("menuId = " + menuId);
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		//alert(sideView);        
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		uiProc(false);
		$("#userId").attr("disabled", true);
		sideView = 'edit';
		$("#userNumber").attr("disabled", true);
		$('#checkBtn').addClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#changeHisTable').removeClass('d-none');

	});
	
	// 삭제품
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		
		$.ajax({
			url : '<c:url value="sm/matrlUserDelete"/>',
			type : 'POST',
			data :{
				'userNumber' : matrlUser,
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#matrlUserTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	// 이미지 삭제
	$('#closeBtn1').on('click', function(){
		$.ajax({
			url : '<c:url value="sm/imageDelete"/>',
			type : 'POST',
			data :{
				'userNumber' : matrlUser,
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('파일이 삭제되었습니다.');
					$('#imgName1').text("파일을 선택해주세요");
					$('#imageFile1').attr("src", " ");
					$('#imgAdd1').val("");
				}else {
					toastr.error(res.message);
				}
			}
		});
	});
	let adminCheck = '';
	// 저장 처리
	$('#btnSave').on('click', function() {
		if (!$.trim($('#userNm').val())) {
			toastr.warning('성명을 입력해 주세요.');
			$('#userNm').focus();
			return false;
		}
		if (!$.trim($('#userId').val())) {
			toastr.warning('아이디를 입력해주세요.');
			$('#userId').focus();
			return false;
		}
		if (sideView == "add" && check == 0) {
			toastr.warning('아이디 중복체크를 해주세요');
			$('#checkBtn').focus();
			return false;
		}
		if(sideView == "add" && !$.trim($('#userPw').val())){
			toastr.warning("비밀번호를 입력해주세요.");
			$('#userPw').focus();
			return false;
		} 	
		if(sideView == "add" && $.trim($('#userPw').val()).length < 4){
			toastr.warning("비밀번호는 4자리 이상입력해주세요.");
			$('#userPw').val("");
			$('#userPw').focus();
			return false;
		}
		if(sideView == "edit" && ($.trim($('#userPw').val()).length != 0 && $.trim($('#userPw').val()).length < 4)){
			toastr.warning("비밀번호는 4자리 이상입력해주세요.");
			$('#userPw').val("");
			return false;
		}
		if ($("#workplaceCd option:selected").val() == "") {
			toastr.warning('사업장을 선택해 주세요.');
			$('#workplaceCd').focus();
			return false;
		}
		if ($("#teamCd option:selected").val() == "") {
			toastr.warning('구분을 선택해 주세요.');
			$('#teamCd').focus();
			return false;
		}
		if ($("#personalGubun option:selected").val() == "") {
			toastr.warning('공수인원구분 선택해 주세요.');
			$('#personalGubun').focus();
			return false;
		}
		/* if ($.trim($('#userPw').val())) {
			toastr.warning('비밀번호는 영문+숫자+특수문자로 입력해 주세요.');
			$('#userPw').focus();
			return false;
		} */
		
		//if ($("#postCd option:selected").val() == "") {
		//	toastr.warning('직위를 선택해 주세요.');
		//	$('#postCd').focus();
		//	return false;
		//}
		//if (!$.trim($('#departmentCd option:selected').val())) {
		//	toastr.warning('부서를 선택해 주세요.');
		//	$('#departmentCd').focus();
		//	return false;
		//}
		//if ($("#chargeDuty option:selected").val() == "") {
		//	toastr.warning('담당을 선택해 주세요.');
		//	$('#chargeDuty').focus();
		//	return false;
		//}
		//if (!$.trim($('#joinDate').val())) {
		//	toastr.warning('입사일을 선택해 주세요.');
		//	$('#joinDateCalendar').focus();
		//	return false;
		//}
		//if ($("#teamCd option:selected").val() == "") {
		//	toastr.warning('조편성을 선택해 주세요.');
		//	$('#teamCd').focus();
		//	return false;
		//}
		//if ($("#empCd option:selected").val() == "") {
		//	toastr.warning('입퇴유무를 선택해 주세요.');
		//	$('#empCd').focus();
		//	return false;
		//}
		/* if( $('#adminCheck').prop('checked') ){
			adminCheck = 'Y';
		}else{
			adminCheck = '';
		} */
		var url = '/sm/matrlUserCreate';
		if (sideView == "edit") {
			url = '/sm/matrlUserUpdate'
		}
		
		var formData = new FormData(document.getElementById("formRight")); //ajax로 넘길 data

		//if( formData.get('imgAdd1').size >= 1000000 ){
		//	toastr.warning('사진의 용량이 너무큽니다.(1MB 이하로 올려 주세요.)');
		//	return false;
		//} 
		if( $('#adminCheck').prop('checked') ){
			formData.append('adminCheck','Y');
		}else{
			formData.append('adminCheck','');
		}
		var joinDataValue = $('#joinDate').val().replace(/-/g,"");
		var resignDateValue = $('#resignDate').val().replace(/-/g,"");
		formData.set('menuAuth',menuAuth);
		formData.set('userNumber',$('#userNumber').val());
		formData.set('userId',$('#userId').val());
		formData.set('userNm',$('#userNm').val());
		formData.set('userPw',$('#userPw').val());
		formData.set('departmentCd',$('#departmentCd option:selected').val());
		formData.set('workplaceCd',$('#workplaceCd option:selected').val());
		formData.set('postCd',$('#postCd option:selected').val());
		formData.set('chargeDuty',$('#chargeDuty option:selected').val());
		formData.set('joinDate', joinDataValue);
		formData.set('resignDate', resignDateValue);
		formData.set('empCd',$('#empCd option:selected').val());
		formData.set('teamCd',$('#teamCd option:selected').val());
		formData.set('personalGubun',$('#personalGubun option:selected').val());
		formData.set('userDesc',$('#userDesc').val());
		formData.set('imageYn',$('#imageYn option:selected').val());
		formData.append('imageStatus1', $('#imgAdd1').val()); 
		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : formData,
			processData : false,
			contentType : false,
			/* data : {
				'menuAuth'		: 	menuAuth,
				'userNumber'	:	$('#userNumber').val(),
				'userId'		:	$('#userId').val(),
				'userNm'		:	$('#userNm').val(),
				'userPw'		:	$('#userPw').val(),
				'departmentCd'	:	$('#departmentCd option:selected').val(),
				'workplaceCd'	:	$('#workplaceCd option:selected').val(),
				'postCd'		:	$('#postCd option:selected').val(),
				'chargeDuty'	:	$('#chargeDuty option:selected').val(),
				'joinDate'		:	$('#joinDate').val().replace(/-/g,""),
				'resignDate'	:	$('#resignDate').val().replace(/-/g,""),
				'empCd'			:	$('#empCd option:selected').val(),
				'teamCd'		:	$('#teamCd option:selected').val(),
				'personalGubun'	:	$('#personalGubun option:selected').val(),
				'userDesc'		:	$('#userDesc').val(),
				'adminCheck'    :   adminCheck
			}, */
			beforeSend : function() {
				// $('#btnAddConfirm').addClass('d-none');
				// $('#btnAddConfirmLoading').removeClass('d-none');
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
					// 보기
					$('#userNumber').val(data.userNumber);
					$('#matrlUserTable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#changeBtn').addClass('d-none');
					$('#btnSave').addClass('d-none');
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					$('#userId').css({'width': '100%'});
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}					
					$('#imageFile1').attr("src","data:image/jpg;base64," + data.userImageFile);
					$('#imgName1').text(data.userImageFileNm);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#checkBtn').addClass('d-none');
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
				},
				complete : function() {
//						$('#btnAddConfirm').removeClass('d-none');
//						$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}
	});


	function uiProc(flag) {
		$("#userId").attr("disabled", flag);
		$("#userNm").attr("disabled", flag);
		$("#userPw").attr("disabled", flag);
		$("#postCd").attr("disabled", flag);
		$("#departmentCd").attr("disabled", flag);
		$("#chargeDuty").attr("disabled", flag);
		$("#teamCd").attr("disabled", flag);
		$("#joinDate").attr("disabled", flag);
		$("#joinDateCalendar").attr("disabled", flag);		
		$("#resignDate").attr("disabled", flag);
		$("#resignDateCalendar").attr("disabled", flag);		
		$("#empCd").attr("disabled", flag);
		$("#userDesc").attr("disabled", flag);
		$("#workplaceCd").attr("disabled", flag);
		$("#acknowledgment").attr("disabled", flag);
		$("#personalGubun").attr("disabled", flag);
		$("#adminCheck").attr("disabled", flag);
		$("#imgAdd1").attr("disabled", flag);
		$("#closeBtn1").attr("disabled", flag);
		$("#imageYn").attr("disabled", flag);
	}
	
	$('#adminCheck').change(function(){
		if( $('#adminCheck').prop('checked') ){
			$.ajax({
				url : '<c:url value="/sm/checkAdmin"/>',
				type : 'POST',
				data : {
					'adminCheck' : 'Y'
				},
				success : function(res) {
					if(res.result == "ok"){
						if (res.res != null) {
							if ('Y' == res.res.adminCheck && userId != res.res.userId) {
								toastr.error('관리자가 이미 존재합니다.');
								$('#adminCheck').prop('checked',false);
								return false;
							} else if( userId != res.res.userId ){
								toastr.success('관리자로 설정 가능합니다.');

							}
						} else if (res.res == null) {
							toastr.success('관리자로 설정 가능합니다.');
						}
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});
	/* $('#userId').keyup(function (event) {
 		if ( (	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 65 && event.which <= 90) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 20)	) {
			$('userId').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			});
		}
		else {
			toastr.warning('영문&숫자만 입력가능합니다.');
			$(this).val("");
			event.preventDefault();
			//$(this).val($(this).val().slice(0,-1));
			return false;
		}
	}); */
	
	function KeyString(elm)
	{			
	    var pattern = /^[a-zA-Z0-9+]{4,20}$/;
		var match = pattern.exec(elm);
		var matchStatus = Boolean(match);
		
	    if(!matchStatus)
	    {	        
	        elm='';
	    }
	    
	    return !matchStatus;
	}
	
	function PassString(elm)
	{			
	    var pattern =  /^(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{4,20}$/;
		var match = pattern.exec(elm);
		var matchStatus = Boolean(match);
		
	    if(!matchStatus)
	    {	        
	        elm='';
	    }
	    
	    return !matchStatus;
	}
	
	
</script>

</body>
</html>
