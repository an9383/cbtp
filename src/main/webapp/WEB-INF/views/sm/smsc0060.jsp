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
				<li class="breadcrumb-item active">IP접근제어관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 49%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="ipAccessControlAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>IP주소</th>
									<th>변경이력</th>
									<th>비고</th>
									<th>사용유무</th>
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
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 50%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()"> <i class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="form">
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="10%">
									<col width="25%">
									<col width="10%">
									<col width="25%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								<tr>
									<th>*IP주소</th>
									<td>
										<input type="text" class="form-control" id="ipAddr" name="ipAddr">
									</td>
									<th>저장일</th>
									<td>
										<div class="form-group input-sub m-0">
											<input class="form-control" type="text" id="ipRegDate" name="ipRegDate" disabled />
											<button onclick="fnPopUpCalendar(ipRegDate,ipRegDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="ipRegDateCalendar" type="button" disabled>
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>사용유무</th>
									<td>
										<select class="custom-select" id="useYn"></select>
									</td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="5">
										<input type="text" class="form-control" id="ipDesc" name="ipDesc" style="min-width:100%">
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
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
				width : "49%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});


	menuAuth = 'smsc0060';
	let currentHref = 'smsc0060';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","IP접근제어관리");
	
	let sideView = 'add';
	var ipNoVal = null;
	var ipRegDateCal =  "${serverDate}";
	
	$('#ipRegDate').val(ipRegDateCal);
	
	
	uiProc(true);

	//공통코드 처리 시작
	var useYnCode = new Array(); // 부서
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	//공통코드 처리 종료  

	selectBoxAppend(useYnCode, "useYn", "", "");


    $('#saveBtnModalY').on('click',function() {
    	uiProc(true);
    	$('#btnSave').addClass('d-none');  //저장버튼
    	$('#btnEdit').attr('disabled',false);  // 수정버튼
    });

	
	// 목록
	let ipAccessControlAdmTable = $('#ipAccessControlAdmTable').DataTable({
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
			url : '<c:url value="/sm/list"/>',
			type : 'GET',
			data : {
			},
		/*
		success : function(res) {
		    console.log(res);
		}
		 */
		},
		rowId : 'ipNo',
		columns : [
				
				{ 
					render : function(data,type,row,meta){
						return meta.row+1;
					}
				},
				{ data : 'ipAddr' },
				{ data : 'ipRegDate' ,
					render : function(data,type,row,meta){
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{ data : 'ipDesc' },
				{ data : 'useYn' },
			],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
		order : [ [ 0, 'asc' ] ],
        buttons: [
            {
                extend: 'copy',
                title: 'IP접근제어관리',
            },
            {
                extend: 'excel',
                title: 'IP접근제어관리',
            },
            {
                extend: 'print',
                title: 'IP접근제어관리',
            }
        ],
	});

	// 보기
	$('#ipAccessControlAdmTable tbody').on('click', 'tr', function() {
		
		if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}

		if($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#ipAccessControlAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
    	
		ipNoVal = ipAccessControlAdmTable.row(this).data().ipNo;
		
		$('#btnSave').addClass('d-none'); // 저장버튼
		
		$.ajax({
			url : '<c:url value="/sm/read"/>',
			type : 'GET',
			data : {
				'ipNo' : ipNoVal
			},
			success : function(res) {
				let data = res.data;

				if(res.result == "ok"){
					sideView = 'edit';
					
					// 보기
					$('#ipAddr').val(data.ipAddr);
					$('#ipRegDate').val(moment(data.ipRegDate).format('YYYY-MM-DD'));
					$('#ipDesc').val(data.ipDesc);
					
					//화면처리
					uiProc(true);
					
					//선택박스 처리
					selectBoxAppend(useYnCode, "useYn", data.useYn, "");
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		
		$('#form').each(function() {
			this.reset();
		});
		
		//화면처리        
		uiProc(false);
		$('#btnEdit').attr('disabled',true);
		$('#btnSave').removeClass('d-none');
		$('#ipRegDate').val(ipRegDateCal);
		
		//선택박스처리
		selectBoxAppend(useYnCode, "useYn", "", "");
		
	});


	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		uiProc(false);
		sideView = 'edit';
		
		$('#btnSave').removeClass('d-none');

	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {
		if (!$.trim($('#ipAddr').val())) {
			toastr.warning('IP주소를 입력해 주세요.');
			$('#ipAddr').focus();
			return false;
		}
		
		var url = '/sm/create';
		if (sideView == "edit") {
			url = '/sm/update'
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'ipNo'			:	ipNoVal,
				'ipAddr'		:	$('#ipAddr').val(),
				'ipRegDate'		:	$('#ipRegDate').val().replace(/-/g,''),
				'useYn'			:	$('#useYn option:selected').val(),
				'ipDesc'		:	$('#ipDesc').val(),
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {

					uiProc(true);
					$('#btnSave').addClass('d-none');
					$('#btnEdit').attr('disabled',false);
					$('#ipAccessControlAdmTable').DataTable().ajax.reload(function(){});
					
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}					
				} else if (res.result == 'exist') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
	});



	function uiProc(flag) {
		$("#ipAddr").attr("disabled", flag);
		$("#ipRegDateCalendar").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#ipDesc").attr("disabled", flag);
	}
	
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
