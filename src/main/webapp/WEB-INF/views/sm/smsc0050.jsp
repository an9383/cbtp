<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- Modal Start-->
	<div class="modal fade" id="userPopUpModal" tabindex="-1"
		role="dialog" aria-labelledby="userPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="layerPopUpLabel">사용자승인등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table class="table table-sm table-bordered" id="userPopUpTable" style="text-align: center">
						<thead>
							<tr>
								<th colspan="2">승인명</th>
								<th colspan="4"></th>
							</tr>
							<tr>
								<th>NO</th>
								<th>아이디</th>
								<th>성명</th>
								<th>부서</th>
								<th>직위</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btnPopUpSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
        <!--header ============================================================== -->
             <header class="page-title-bar row">
              <nav aria-label="breadcrumb" class="breadcrumb-padding">
               <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="#">시스템관리</a>
                </li>
                <li class="breadcrumb-item active">사용자승인관리</li>
               </ol>
              </nav>
             </header> 
    
	<div class="container-fluid" id="main">
    	<div class="row table-wrap-hid">	
                  <!--======================== .left-list ========================-->
   			<div class="left-list left-30" id="left-30" style="width:25%;">
            	<div class="card">                  
                	<div class="table-responsive">
	                	<table id="approvalAuthAdmTable" class="table table-bordered" style="text-align:center">
	                        <thead class="thead-light">
		                        <tr>
	                              <th style="max-width:100px;">승인코드</th> 
	                              <th style="max-width:100px;">승인명</th>
	                              <th style="max-width:100px;">사용여부</th>                            
	                            </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	  	
	    	<!-- 사이드 페이지 -->
			<div class="right-list right-70" id="myrSidenav" style="width:74%;">
	        	<div class="card" id="formBox">
					<div class="table-responsive">
						<div class="card-body col-sm-12 p-1 mb-2">
							<button type="button" class="btn btn-primary float-left mr-1"
								id="btnAdd">등록</button>
							<button class="btn btn-primary d-none"
								id="btnAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-warning float-left"
								id="btnDel">삭제</button>
							<button class="btn btn-warning d-none"
								id="btnDelConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
				    	<table id="subMenuTable" class="table table-bordered" style="text-align:center">
				    		<colgroup>
								<col width="3%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
								    <th>NO</th>
								    <th>아이디</th>
								    <th>성명</th>
								    <th>부서</th>
								    <th>직위</th>
								    <th>비고</th>
							    </tr>
							</thead>
						</table>      
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>   

	menuAuth = 'smsc0050';
	let currentHref = 'smsc0050';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "사용자승인관리");

	var baseCd = '';
	var baseAbbr = '';
	var userId = '';
	var apprCd = '';
	var current = 'userId';		//중복처리
	
	//사용자승인관리 왼쪽 목록조회
	let baseGroupCd = "083";
	let approvalAuthAdmTable = $('#approvalAuthAdmTable') .DataTable( {
		dom : "<'row'<'col-sm-3'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/commonCodeList"/>',
			type : 'GET',
			data : {
				'baseGroupCd' : function() { return baseGroupCd; }
			},
		},
		//rowId: 'baseGroupCd', // id값 할당
		columns : [
			{ data : 'baseCd'	},	//승인코드
			{ data : 'baseNm'	},	//승인명
			{ data : 'useYnNm'	}	//사용여부
		],
		order: [
			[ 0, 'asc' ],
		],
		buttons: [],
	});
	
	
	//사용자승인관리 왼쪽 테이블 클릭 시
	$('#approvalAuthAdmTable tbody').on('click','tr',function() {
		
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#approvalAuthAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		baseCd = approvalAuthAdmTable.row(this).data().baseCd;
		baseAbbr = approvalAuthAdmTable.row(this).data().baseAbbr;
		console.log(baseCd);
		console.log(baseAbbr);
		
		$('#subMenuTable').DataTable().ajax.reload();
	});
	
	
	//사용자승인관리 오른쪽 목록조회
	let subMenuTable = $('#subMenuTable').DataTable({
		dom : "<'row'<'col-sm-3'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="sm/approvalAuthAdmList"/>',
			type : 'GET',
			data : {
				'apprDesc' : function() { return baseAbbr; }
			},
		},
// 		rowId: 'baseGroupCd'
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				},
				'className' : 'text-center'
			},
			{ data : 'userId' 		},	//아이디
			{ data : 'userNm' 		},	//이름
			{ data : 'departmentNm' },	//부서
			{ data : 'postNm' 		},	//직위
			{ data : 'userDesc' 	},	//비고
		],
		order: [
			[ 0, 'asc' ],
		],
		buttons: [],
	});

	//사용자승인관리 오른쪽 테이블 클릭 시
	$('#subMenuTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#subMenuTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		userId = subMenuTable.row(this).data().userId;
		apprCd = subMenuTable.row(this).data().apprCd;
		console.log(userId);
		console.log(apprCd);
	});
	
	
	//등록버튼 클릭 시
	$('#btnAdd').on('click', function(){
		if ($('#approvalAuthAdmTable tbody tr').hasClass('selected')=='') {
			toastr.warning("등록할 목록을 선택해주세요.");
			return false;
		}
		$('#userPopUpModal').modal('show');
		$('#userPopUpTable').DataTable().ajax.reload(function(){}); 
	});

	
	//삭제버튼 클릭 시
	$('#btnDel').on('click', function(){
		if ($('#subMenuTable tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 목록을 선택해주세요.");
			return false;
		}
		$('#deleteModal').modal('show');
	});

	//모달 삭제 클릭 시
	$('#btnDeleteConfirm').on('click', function(){
		//삭제
		$.ajax({
			url : '<c:url value="sm/approvalAuthAdmDelete"/>',
			type : 'POST',
			data : {
				'userId' 		: 	function(){return userId;},
				'apprCd'  		: 	function(){return apprCd;}		
				},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
	                toastr.success('삭제되었습니다.');
					$('#subMenuTable').DataTable().ajax.reload();
					userId='';
					apprCd='';
					$('#deleteModal').modal('hide');
				} else {
					toastr.error(res.message);
				}
			},
		});
	});
	
	
	//사용자 팝업테이블 목록조회
	let userPopUpTable = $('#userPopUpTable').DataTable({
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
       	pageLength: 15,
       	select: {
            style: 'multi',
            toggleable: true,
            items: 'row'
        },
		ajax : {
			url : '<c:url value="/sm/matrlUserDataList"/>',
			type : 'GET',
			data : {
				'menuAuth'	: 	menuAuth,
			},
		},
		rowId : 'matrlUser',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					},
					'className' : 'text-center'
				},
				{ data : 'userId' 		},	//아이디
				{ data : 'userNm' 		},	//이름
				{ data : 'departmentNm' },	//부서
				{ data : 'postNm' 		},	//직위
				{ data : 'userDesc' 	},	//비고
			],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
		order : [0, 'asc'],
       buttons: [],
	});

	
	//저장버튼 클릭 시
	$('#btnPopUpSave').on('click', function(){

		var x = userPopUpTable.rows('.selected').data().length;

		if (x == 0) {
			toastr.warning("저장할 목록을 선택해주세요.");
			return false;
		}

		var isCheck = false;
		
		if(['userId'].includes(current)){
			for(var i=0;i<x;i++) {
				$.ajax({
					url : '<c:url value="sm/approvalAuthAdmList"/>',
					type: 'GET',
					dataType: 'json',
					async: false,
					data: {
						'apprDesc' : function() { return baseAbbr;},
						'userId' : $.trim(userPopUpTable.rows('.selected').data()[i].userId),
					},
					success: function(res) {
// 						console.log(userPopUpTable.rows('.selected').data()[i].userId);
// 						console.log(res.data.length);
// 						console.log(res.data);
						if (res.data.length != 0) {
							var userNm = userPopUpTable.rows('.selected').data()[i].userNm;
								toastr.warning(userNm+'님은 이미 등록 되었습니다.');
								isCheck = true;
								return false;
						}
					},
				});
			}
		}
			
		if (isCheck == true)
			return false;

		var array = new Array();
		for(var i=0;i<x;i++) {
			var rowData = new Object();

			rowData.baseCd = baseCd		//메뉴ID
			rowData.baseAbbr = baseAbbr	//메뉴패스
			rowData.userId = userPopUpTable.rows('.selected').data()[i].userId	//사용자 ID

			array.push(rowData);
// 			console.log(array);
		}
		
		 var data = JSON.stringify(array);
		 
		 var url = '<c:url value="sm/approvalAuthAdmCreate"/>';
			
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'arrayData' : 	function(){return data;}
			},
			success: function (res) {
				let data = res.data;

				if (res.result == 'ok') {
						toastr.success('등록되었습니다.');
				} else {
					toastr.error(res.message);
				}
            },
            complete : function() {
            	$('#subMenuTable').DataTable().ajax.reload();
            	$('#userPopUpModal').modal('hide');
			}
		});
	});
   
</script>

</body>
</html>
