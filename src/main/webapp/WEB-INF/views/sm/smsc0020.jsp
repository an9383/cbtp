<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% 
	String adminCheck = session.getAttribute("adminCheck").toString();
%>
<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- Modal Start-->
	<div class="modal fade" id="layerPopUpModal" tabindex="-1"
		role="dialog" aria-labelledby="layerPopUpLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="layerPopUpLabel">사용자 메뉴 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table class="table table-sm table-bordered" id="layerPopUpTable">
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="layerPopUpSave">저장</button>
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
                <li class="breadcrumb-item active">사용자메뉴관리 </li>
               </ol>
              </nav>
             </header> 
    
	<div class="container-fluid" id="main">
    	<div class="row table-wrap-hid">	
                  <!--======================== .left-list ========================-->
   			<div class="left-list left-30" id="left-30" style="width:30%;">
            	<div class="card">                  
                	<div class="table-responsive">
	                	<table id="upperMenuTable" class="table table-bordered" style="text-align:center">
	                        <thead class="thead-light">
		                        <tr>
		                          <th style="max-width:30px;">메뉴순서</th> 
	                              <th style="max-width:70px;">메뉴ID</th> 
	                              <th style="max-width:100px;">메뉴명</th>                            
	                            </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	  	
	    <!-- 사이드 페이지 -->
			<div class="right-list right-70" id="myrSidenav" style="width:69%;">
	        	<div class="card" id="formBox">  
					<div class="table-responsive">
				    	<table id="subMenuTable" class="table table-bordered" style="text-align:center">
							<thead class="thead-light">
								<tr>
									<th>메뉴순서</th>
								    <th>메뉴ID</th>
								    <th>상위메뉴</th>
								    <th>메뉴명</th>
								    <th>메뉴경로</th>
								    <th>구분</th>
								    <th>미사용여부</th>
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

	menuAuth = 'smsc0020';
	let currentHref = 'smsc0020';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","사용자메뉴관리");
	
	let userDepartCheck = "${userDepart}";
	let userNumberCheck = "${userNumber}";

	let adminCheck = "<%=adminCheck%>";

    // 상위목록
    let upperMenuTable = $('#upperMenuTable').DataTable({
    	dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
    	language : lang_kor,
        paging : true,
        info : true,
        ordering : true,
        processing : true,
        autoWidth : false,
        pageLength : -1,
        scrollY : '70vh',
        ajax : {
            url: '<c:url value="/sm/menuInfoDataList"/>',
            type: 'GET',
            data: {
            	'menuAuth' : function(){ return menuAuth; },
            },
        },        
        rowReorder : {
    		dataSrc : 'menuOrder'
   		},
        columns: [
        	{//메뉴순서
        		data: 'menuOrder'
        	},
            {//메뉴ID
        		data: 'menuId'
        	},
            {//메뉴명
        		data: 'menuNm'
        	},
        ],        
        order: [
            [ 0, 'asc' ]
        ],       
        buttons: [],
        columDefs : [
        	{ orderable: true, className: 'reorder', targets: 0 },
        	{ orderable: false, targets: '_all' }
        ],
        drawCallback : function() {
	    	$("#upperMenuTable_filter").find("label").addClass("m-0");
	    	if( adminCheck != 'Y' ){
		    	//console.log("관리자계정이 아닐 때 ");
        		$('#upperMenuAdd').addClass('d-none');
        		$('#upperMenuEdit').addClass('d-none');
        		$('#upperMenuDelete').addClass('d-none');
        		
        		$('#subMenuAdd').addClass('d-none');
        		$('#subMenuEdit').addClass('d-none');
        		$('#subMenuDelete').addClass('d-none');
        	} 
        }
    });
    
    var htmlMenu = '<button class="btn btn-primary float-left mr-1" type="button" id="upperMenuAdd">등록</button>&nbsp;' +
    '<button class="btn btn-warning float-left mr-1" type="button" id="upperMenuEdit">수정</button>' + 
    '<button class="btn btn-danger float-left mr-1" type="button" id="upperMenuDelete">삭제</button>'+
    '<button class="btn btn-primary float-left mr-1" type="button" id="upperMenuSave">저장</button>&nbsp;';
    
	$('#upperMenuTable_length').html(htmlMenu);
	$('#upperMenuTable_filter').html('<label>검색 : <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="systemCommonGroupCd" style="width:110px"> </label>');
	
	// 하위목록
    var menuId= "0";     
          
	let subMenuTable = $('#subMenuTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8' l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        pageLength: -1,
        scrollY : "70vh",
   	    ajax: {
			url: '<c:url value="/sm/subMenuInfoDataList"/>',
			type: 'GET',
 	        data: {
				'menuAuth'	: function(){ return menuAuth; },
 	   	        'menuId'	: function(){ return menuId; },
			}
		},
   	    rowReorder : {
   			dataSrc : 'menuOrder'
   		},
		columns: [
			{//메뉴순서
				data: 'menuOrder'
			},
			{//메뉴ID
				data: 'menuId'
			},
  	        {//상위메뉴
				data: 'upperMenuId'
			}, 
  	        {//메뉴명
				data: 'menuNm'
			},
  	        {//메뉴경로
				data: 'menuPath'
			},
  	        {//구분
				data : 'mainGubun',
  	  	        render : function ( data, type, row, meta ) {
  	  	  	        if ( data == '001' ) {
  	  	  	            return '레이저';
  	  	  	        } else if ( data == '002' ) {
  	  	  	  	        return '후가공';
	  	  	  	    } else if ( data == '003' ) {
		  	  	  	    //2023.10.30 해당 코드부분 공통코드화하려고했는데 신인철 상무이사님께서 정밀가공 외에 더 들어갈 일 없다고 추가하라고하심
  	  	  	  	        return '정밀가공';
	  	  	  	    } else {
		  	  	  	    return '공통';
					} 
  		  	  	}
	  	  	},
			{//미사용여부
	  	  		data : 'useYn' ,
				render : function ( data, type, row, meta ) {
					if ( data == 'Y' ) {
						return '미사용';
					} else {
						return '사용';
					}
				}
			},   
		],        
  	    order : [
			[ 0, 'asc' ]
  	    ],
		buttons : [],
		columnDefs: [
			{ orderable: true, className: 'reorder', targets: 0 },
  	    	{ orderable: false, targets: '_all' }
		],
		drawCallback : function() {
			$("#subMenuTable_filter").find("label").addClass("m-0");
		}
	});
	
    var htmlSubMenu = '<button class="btn btn-primary float-left mr-1" type="button" id="subMenuAdd">등록</button>&nbsp;' + 
    '<button class="btn btn-warning float-left mr-1" type="button" id="subMenuEdit">수정</button>' + 
    '<button class="btn btn-danger float-left mr-1" type="button" id="subMenuDelete">삭제</button>'+
    '<button class="btn btn-primary float-left mr-1" type="button" id="subMenuSave">저장</button>&nbsp;';
	$('#subMenuTable_length').html(htmlSubMenu);
	
	//상위메뉴 등록버튼
   	$('#upperMenuAdd').click(function () {
   		addHtml("upperMenuAdd", "");   		
   		seq();
   		$('#puUpperMenuNm').val();
   		$('#layerPopUpLabel').text('메인메뉴 등록');
   		$('#layerPopUpModal').modal('show');
   	});

	//상위메뉴 수정버튼
   	$('#upperMenuEdit').click(function () {
   		var data = upperMenuTable.row('.selected').data();
   		if(data == null || data == undefined ) {
   			toastr.warning("수정할 메뉴를 선택해 주세요.");
   		} else {
	   		addHtml("upperMenuEdit", data);
	   		$('#puUpperMenuId').val(data.menuId);	
	   		$('#puUpperMenuNm').val(data.menuNm);	   	 
	   		$('#layerPopUpLabel').text('메인메뉴 수정');
	   		$('#layerPopUpModal').modal('show');
   	   	}
   	});  
	
   	var upperMenuId;
   	
  	//상위메뉴 삭제버튼
   	$('#upperMenuDelete').click(function () {
   		var data = upperMenuTable.row('.selected').data();
   		if(data == null || data == undefined ) {
   			toastr.warning("삭제할 메뉴를 선택해 주세요.");
   		} else {
	   		addHtml("upperMenuDelete", data);
	   		upperMenuId = data.upperMenuId;	
	   		$('#puUpperMenuId').val(data.menuId);	
	   		$('#puUpperMenuNm').val(data.menuNm);	   	 
	   		$('#layerPopUpLabel').text('메인메뉴 삭제');
	   		$('#layerPopUpModal').modal('show');
   	   	}
   	}); 

	//상위메뉴 저장버튼
   	$('#upperMenuSave').click(function () {
   		menuOrderSave('upperMenuTable','upper');
   	});  
   	
   	
   //하위메뉴 등록버튼
	$('#subMenuAdd').click(function () {
   		var data = upperMenuTable.row('.selected').data();
   		if (data == null || data == undefined ) {
   			toastr.warning("등록할 메뉴목록를 선택해 주세요.");
   		} else {
	   		addHtml("subMenuAdd");	   		
	   		seq();	
	   		$('#puSubUpperMenuId').val(data.menuId);	   		   		
	   		
	   		$('#layerPopUpLabel').text('메뉴등록');
	   		$('#layerPopUpModal').modal('show');
   		}
   	});
   
	let beforeMenuId;
	//하위메뉴 수정버튼
   	$('#subMenuEdit').click(function () {
   		var dataGrp = upperMenuTable.row('.selected').data();
   		if(dataGrp == null || dataGrp == undefined ) {
   			toastr.warning("수정할 메인 메뉴을 선택해 주세요.");
   			return;
   		}    		
   		var data = subMenuTable.row('.selected').data();
   		if(data == null || data == undefined ) {
   			toastr.warning("수정할 서브 메뉴을 선택해 주세요.");
   		} else {
   	   		  	   		   	   	
	   		addHtml("subMenuEdit");
   	   		$('#puSubMenuId').val(data.menuId);
	   		$('#puSubUpperMenuId').val(data.upperMenuId);
	   		$('#puSubMenuNm').val(data.menuNm);
	   		$('#puSubMenuPath').val(data.menuPath);	    		
	   		$('#useYn').val(data.useYn);	
	   		$('#mainGubun').val(data.mainGubun);
	   		$('#layerPopUpLabel').text('메뉴수정');
	   		$('#layerPopUpModal').modal('show');
	   		beforeMenuId = data.menuId;
   		}	
   	});  
	
  	//하위메뉴 삭제버튼
   	$('#subMenuDelete').click(function () {
   		var dataGrp = upperMenuTable.row('.selected').data();
   		if(dataGrp == null || dataGrp == undefined ) {
   			toastr.warning("삭제할 메인 메뉴을 선택해 주세요.");
   			return;
   		}    		
   		var data = subMenuTable.row('.selected').data();
   		if(data == null || data == undefined ) {
   			toastr.warning("삭제할 서브 메뉴을 선택해 주세요.");
   		} else {
	   		addHtml("subMenuDelete");
	   		upperMenuId = data.upperMenuId;
	   		$('#puUpperMenuId').val(data.menuId);
	   		$('#puSubUpperMenuId').val(data.upperMenuId);
	   		$('#puUpperMenuNm').val(data.menuNm);
	   		$('#puSubMenuPath').val(data.menuPath);	 		
	   				
	   		$('#layerPopUpLabel').text('메뉴삭제');
	   		$('#layerPopUpModal').modal('show');
   		}	
   	});  


  	//하위메뉴 저장버튼
   	$('#subMenuSave').click(function () {
   		menuOrderSave('subMenuTable','sub');
   	});  

	//상위/하위 저장버튼
   	function menuOrderSave(table,param){
		var dataArray = new Array();
   		
   		$('#'+table+' tbody tr').each(function(index,item){
			var rowData = new Object();
			
			rowData.beforeMenuId = $(this).find('td').eq(1).text();
			rowData.menuId = $(this).find('td').eq(1).text();
			rowData.menuOrder = index+1;
			
			if(param=="upper"){
				rowData.menuNm = $(this).find('td').eq(2).text();
				rowData.upperMenuId = '';
				rowData.menuPath = '';
				rowData.useYn = '';
			}else{
				rowData.menuNm = $(this).find('td').eq(3).text();
				rowData.upperMenuId = $(this).find('td').eq(2).text();
				rowData.menuPath = $(this).find('td').eq(4).text();
				rowData.useYn = $(this).find('td').eq(6).text()=="미사용"?"Y":'';
				rowData.mainGubun = $(this).find('td').eq(5).text();
			}
   			dataArray.push(rowData);
   	   	})

   	   	$.ajax({
			url : '<c:url value="sm/menuInfoOrderUpdate"/>',
			type : 'POST',
			datatype : 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				//처리중..
				$('#my-spinner').show();
			},
			success : function(res){
				if (res.result == 'ok') {
					//처리완료..
					$('#my-spinner').hide();
					toastr.success("저장되었습니다.");

					if(param=="upper"){
						$('#upperMenuTable').DataTable().ajax.reload();
					}else{
						$('#subMenuTable').DataTable().ajax.reload();
					}
				}else{
					toastr.error(res.message);
				}
			}
   	   	})
   	}
   		
   	
   	//저장버튼 클릭시
	$('#layerPopUpSave').click(function(){
   	   	let puFlag = $('#puFlag').val();

   	   	if ( puFlag == "upperMenuAdd" || puFlag == "upperMenuEdit" ) {
   	   		upperMenuProc(puFlag);
   	   	} else if(puFlag == "subMenuAdd" || puFlag == "subMenuEdit") {
   	   		subMenuProc(puFlag);
   	   	} else {
   	   		deleteMenuProc(puFlag);
   	   	}
   	}); 
   	
	
	// 메인메뉴 상세 정보 보기
	$('#upperMenuTable tbody').on('click', 'tr', function () {

        if ( $(this).hasClass('selected') ) {
//             $(this).removeClass('selected');
        }
        else {
        	$('#upperMenuTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        		
        menuId = upperMenuTable.row( this ).data().menuId;
	    console.log("menuId = " + menuId);
   		$('#subMenuTable').DataTable().ajax.reload(null, false);
   	});
       

	// 서브메뉴 선택
	$('#subMenuTable tbody').on('click', 'tr', function () {

        if ( $(this).hasClass('selected') ) {
//             $(this).removeClass('selected');
        }
        else {
        	$('#subMenuTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
   	});
	
	
  	//메인메뉴 등록
	function upperMenuProc(puFlag)
	{
	    if ( !$.trim($('#puUpperMenuId').val()) ) {
	        toastr.warning('메뉴ID를 입력해 주세요.');
	        $('#puUpperMenuId').focus();
	        return false;
	    }
	
	    if ( !$.trim($('#puUpperMenuNm').val()) ) {
	        toastr.warning('메뉴명을 입력해 주세요.');
	        $('#puUpperMenuNm').focus();
	        return false;
	    }	
	    
	    var upperMenuURL = "";
	    var upperMenuMsg = "";
	    if(puFlag == "upperMenuAdd") {
	    	upperMenuURL = '<c:url value="/sm/menuInfoCreate"/>';	    	
	    	upperMenuMsg = '메인메뉴가 등록 되었습니다.';	    
	    } else {
	    	upperMenuURL = '<c:url value="/sm/menuInfoUpdate"/>';
	    	upperMenuMsg = '메인메뉴가 수정 되었습니다.';
	    }
	    
	    $.ajax({
	        url: upperMenuURL,
	        type: 'POST',
	        data: {
	        	'menuAuth'	: 	menuAuth,
	        	'menuId': $('#puUpperMenuId').val(),
	        	'beforeMenuId'  : $('#puUpperMenuId').val(),
	            'menuNm': $('#puUpperMenuNm').val(),	            
	            'regId': 'reg_id',
	            'updId': 'upd_id',
	        },
	        beforeSend: function() {
	        },
	        success: function (res) {
	            let data = res.data;
	            if (res.result == 'ok') {
	            	toastr.success(upperMenuMsg);
		            $('#upperMenuTable').DataTable().ajax.reload(null, false); //등록 후 테이블 리로드	            	
	            	$('#layerPopUpModal').modal('hide');
	            } else {
	                toastr.error(res.message);
	            }
	        },
	        complete:function(){

	        }
	    });
	}

	//서브메뉴 등록,수정
	function subMenuProc(puFlag){
	    if ( !$.trim($('#puSubMenuId').val()) ) {
	        toastr.warning('메뉴ID를 확인해 주세요.');
	        $('#puSubMenuId').focus();
	        return false;
	    }
	    if ( !$.trim($('#puSubUpperMenuId').val()) ) {
	        toastr.warning('상위메뉴를 입력해 주세요.');
	        $('#puSubUpperMenuId').focus();
	        return false;
	    }	
	    if ( !$.trim($('#puSubMenuNm').val()) ) {
	        toastr.warning('메뉴명을 입력해 주세요.');
	        $('#puSubMenuNm').focus();
	        return false;
	    }
	    if ( !$.trim($('#puSubMenuPath').val()) ) {
	        toastr.warning('메뉴경로를 입력해 주세요.');
	        $('#puSubMenuPath').focus();
	        return false;
	    }
	    
	    let subMenuURL;
	    let subMenuMsg;
	    if ( puFlag == "subMenuAdd" ) {
	    	subMenuURL = '<c:url value="/sm/menuInfoCreate"/>';
	    	subMenuMsg = '서브메뉴가 등록 되었습니다.';	    	
	    } else {
	    	subMenuURL = '<c:url value="/sm/menuInfoUpdate"/>';
	    	subMenuMsg = '서브메뉴가 수정 되었습니다.';
	    }
	    $.ajax({
	        url: subMenuURL,
	        type: 'POST',
	        data: {
	        	'userNumber'	: function(){ return userNumberCheck; },
	        	'menuAuth'		: function(){ return menuAuth; },
				'menuId'		: function(){ return $('#puSubMenuId').val(); },
				'upperMenuId'	: function(){ return $('#puSubUpperMenuId').val(); },
				'menuNm'		: function(){ return $('#puSubMenuNm').val(); },
				'menuOrder'		: function(){ return ''; },
				'menuPath'		: function(){ return $('#puSubMenuPath').val(); },
				'useYn'			: function(){ return $('#useYn').val(); },
				'mainGubun'		: function(){ return $('#mainGubun').val(); },
				'regId'			: function(){ return 'reg_id'; },
				'beforeMenuId' 	: function(){ return beforeMenuId; },
	        },
	        beforeSend: function() {
	        },
	        success: function (res) {
	            let data = res.data;
	            if (res.result == 'ok') {
	            	toastr.success(subMenuMsg);
	            	$('#layerPopUpModal').modal('hide');
	            	$('#subMenuTable').DataTable().ajax.reload(null, false);
	            } else {
	            	$('#puSubMenuId').focus();
	                toastr.error(res.message);
	            }
	        },
	        complete:function(){
	        }
	    });
	}	 
	
	//메뉴 삭제하기
	function deleteMenuProc(puFlag){
	    var deleteMenuURL = "";
	    var deleteMenuMsg = "";
	    if(puFlag == "upperMenuDelete") {
	    	deleteMenuURL = '<c:url value="/sm/menuInfoDelete"/>';	    	
	    	deleteMenuMsg = '메인메뉴가 삭제 되었습니다.';	    
	    } else {
	    	deleteMenuURL = '<c:url value="/sm/menuInfoDelete"/>';
	    	deleteMenuMsg = '서브메뉴가 삭제 되었습니다.';
	    }
	    
	    $.ajax({
	        url: deleteMenuURL,
	        type: 'POST',
	        data: {
	        	'menuAuth'	: 	menuAuth,
	            'menuId': $('#puUpperMenuId').val(),
	            'upperMenuId': upperMenuId,
	        },
	        beforeSend: function() {
	        },
	        success: function (res) {
	            let data = res.data;
	            if (res.result == 'ok') {
	            	//toastr.success(deleteMenuMsg);
	            	
	            	if(puFlag == "upperMenuDelete"){
	            		$('#upperMenuTable').DataTable().ajax.reload(null, false); //삭제 후 그룹 테이블 리로드	
	            	}        	
		            $('#subMenuTable').DataTable().ajax.reload(null, false); //삭제 후 코드 테이블 리로드	            	
	            	$('#layerPopUpModal').modal('hide');
	            	
	            	setTimeout(function(){
	            		if(puFlag == "upperMenuDelete"){
	            			$('#upperMenuSave').trigger('click');
		            	}else{
		            		$('#subMenuSave').trigger('click');
			            }
		            },150)
	            } else {
	                toastr.error(res.message);
	            }
	        },
	        complete:function(){

	        }
	    });
	}
   	
	function addHtml(flag)
   	{
   	   	var html;
   	   	if(flag == "upperMenuAdd" || flag == "upperMenuEdit") { //upperMenu수정
			html = '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">메뉴ID</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puUpperMenuId" name="puMenuId" style="min-width: 100%;" disabled></td>';	
			html += '</tr>';
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*메뉴명</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puUpperMenuNm" style="min-width: 100%;" name="puMenuNm"></td>';
			html += '</tr>';	
			$('#layerPopUpSave').text("저장");
			$('#layerPopUpTable').html(html);
			$('#puFlag').val(flag);
   	   	}else if(flag == "subMenuAdd" || flag == "subMenuEdit") { // subMenu수정 
			html = '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">메뉴ID</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubMenuId" name="puSubMenuId" style="min-width: 100%;" disabled></td>';	
			html += '</tr>';
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">상위메뉴</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubUpperMenuId" name="puSubUpperMenuId" style="min-width: 100%;" disabled></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*메뉴명</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubMenuNm" name="puSubMenuNm" style="min-width: 100%;"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*메뉴경로</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubMenuPath" name="puSubMenuPath" style="min-width: 100%;"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*구분</td>';
	  	  	//2023.10.30 해당 코드부분 공통코드화하려고했는데 신인철 상무이사님께서 정밀가공 외에 더 들어갈 일 없다고 추가하라고하심
			html += '<td style="width: 100px"><select class="custom-select" id="mainGubun" name="mainGubun" style="min-width: 100%;"><option value="000">공통</option><option value="001">레이저</option></option><option value="002">후가공</option><option value="003">정밀가공</option></td>';	
			html += '</tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*미사용</td>';
			html += '<td style="width: 100px"><select class="custom-select" id="useYn" name="useYn" style="min-width: 100%;"><option value="">사용</option><option value="Y">미사용</option></td>';	
			html += '</tr>';
			$('#layerPopUpSave').text("저장");
			$('#layerPopUpTable').html(html);
			$('#puFlag').val(flag);
   	   	}else {
	   	   	html = '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">메뉴ID</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puUpperMenuId" name="puMenuId" style="min-width: 100%;" disabled></td>';	
			html += '</tr>';
			if(flag == "subMenuDelete"){
				html += '<tr>';
				html += '<td class="align-middle" style="width: 80px; text-align: center;">상위메뉴</td>';
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubUpperMenuId" name="puSubUpperMenuId" style="min-width: 100%;" disabled></td>';
				html += '</tr>';
			}
			html += '<tr>';
			html += '<td class="align-middle"  style="width: 80px; text-align: center;">*메뉴명</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puUpperMenuNm" name="puMenuNm" style="min-width: 100%;" disabled></td>';
			html += '</tr>';
			if(flag == "subMenuDelete"){
				html += '<tr>';
				html += '<td class="align-middle" style="width: 80px; text-align: center;">*메뉴경로</td>';
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puSubMenuPath" name="puSubMenuPath" style="min-width: 100%;" disabled></td>';
				html += '</tr>';
			}
			html += '<tr>';
			html += '<td class="align-middle" style="width: 80px; text-align: center;">*미사용</td>';
			html += '<td style="width: 100px"><select disabled class="custom-select" id="useYn" name="useYn" style="min-width: 100%;"><option value="">사용</option><option value="Y">미사용</option></td>';	
			html += '</tr>';
			$('#layerPopUpSave').text("삭제");
			$('#layerPopUpTable').html(html);
			$('#puFlag').val(flag);
   	   	}
   	   	
   	}
   	
   	function seq(){ //메뉴ID생성 시퀀스
   		$.ajax({
   			url : '/sm/menuIdCreate',
	        type : 'POST',
	        async : false,
	        data: {
	        	'menuAuth' : function(){ return menuAuth; },
	        },
	        success: function (res) {
	        	$('#puSubMenuId').val(res.data.menuId);
	        	$('#puUpperMenuId').val(res.data.menuId);
	        }
   		});
   	}
   	
</script>

</body>
</html>
