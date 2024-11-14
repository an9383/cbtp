<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- Modal Start-->
	<div class="modal fade" id="layerPopUpModal" tabindex="-1" role="dialog" aria-labelledby="layerPopUpLabel" aria-hidden="true">
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
				<table class="table table-sm table-bordered" id="layerPopUpTable" style="text-align:center">
														
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" class="form-control" id="puFlag"  name="puFlag">
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
                <li class="breadcrumb-item active">사용자권한관리 </li>
               </ol>
              </nav>
             </header> 
          <!-- #main============================================================== -->
		<div class="container-fluid" id="main">
    	<div class="row table-wrap-hid">	
    	   <!--======================== .left-list ========================-->
   			<div class="left-list left-30" id="left-30" style="width:35%;">
            	<div class="card">                  
                	<div class="table-responsive d-none" id="deptDiv">
	                	<table id="departmentTable" class="table table-bordered" style="text-align:center">
	                        <thead class="thead-light">
		                        <tr>
		                       	  <th> 코드 </th>	
		                          <th> 부서명 </th>                                            
	                              <th> 사용여부 </th>                           
	                            </tr>
	                        </thead>
	                    </table>	                    
	                </div>
	                <div class="table-responsive" id="userDiv">
	                	<table id="userTable" class="table table-bordered" style="text-align:center">
	                        <thead class="thead-light">
		                        <tr>
		                       	  <th> ID		 </th>	
		                       	  <th> 사용자이름	</th>
		                       	  <th> 부서명		 </th>                                            
	                              <th> 직위 		</th>                         
	                            </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	            <table class="table table-bordered mt-5" id="changeHisTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th>변경내역</th>
							<td colspan='3'>
								<input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20">
							</td>
						</tr>
					</thead>
				</table>
	        </div>
	       
	        <!-- /.page-section -->	  	
	    <!-- 사이드 페이지 -->
			<div class="right-list right-70" style="width:39%;">
	        	<div class="card" id="formBox">  
					<div id="menuTree" >
				    	     
				    	
					</div>
					<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right mr-1" id="btnSave">저장</button>
					<button type="button" class="btn btn-primary d-none float-right mr-1" id="btnDelete">초기화</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
					</button>					
				</div>
				</div>
			</div>
		</div>	
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>

	menuAuth = 'smsc0030';
	let currentHref = 'smsc0030';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","사용자권한관리");

	let userDepartCheck = "${userDepart}";
	let userNumberCheck = "${userNumber}";
	
	//공통코드 처리 시작
	var authCode = new Array(); // 부서
	<c:forEach items="${authCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	authCode.push(json);
	</c:forEach>
	
	var userNumber = 'kkkk';
	var departmentCd = 'kkk';
	let adminCheck = '';
	
    // 부서목록
    /* let departmentTable = $('#departmentTable').DataTable({
    	language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        scrollX : false,
        searching : false,
        'ajax': {
            url: '<c:url value="/sm/departmentDataList"/>',
            type: 'GET',
            data: {
            	'menuAuth'	: 	menuAuth,
            },
        },        
        columns: [
        	{ data: 'baseCd' },
            { data: 'baseNm' },            
            { data: 'useYnNm'}
            
           
        ],        
        order: [
            [ 0, 'asc' ]
        ],       
        buttons: [
            'copy', 'excel', 'pdf'
        ],
    });
    


    var html1 = '<div class="row">';
    html1 += '&nbsp;<label class="input-label-sm">권한구분</label><div class="form-group input-sub m-0 row">';
    html1 += '<select id="authCd" class="custom-select"></select> '
    html1 += '</div>';  
    html1 += '</div>';
   
	$('#departmentTable_length').html(html1);
	selectBoxAppend(authCode, "authCd", "001", "");  */

    // 사용자목록
    let userTable = $('#userTable').DataTable({
    	language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        scrollX : false,  
        lengthChange: false,
        pageLength : 20,     
        ajax : {
			url : '<c:url value="/sm/matrlUserDataList"/>',
			type : 'GET',
			data : {
				'menuAuth'	: 	menuAuth,
			},
	
		},
        columns: [
           	{ data: 'userId' },
            { data: 'userNm' },            
            { data: 'departmentNm'},
            { data: 'postNm'}
            
           
        ],        
        order: [
            [ 0, 'asc' ]
        ],       
        buttons: [
            'copy', 'excel', 'pdf'
        ],
    });
    


    /* var html2 = '<div class="row">';
    html2 += '&nbsp;<label class="input-label-sm">권한구분</label><div class="form-group input-sub m-0 row">';
    html2 += '<select id="authCd2" class="custom-select"></select> '
    html2 += '</div>';  
    html2 += '</div>';
   
	$('#userTable_length').html(html2);
	selectBoxAppend(authCode, "authCd2", "002", "");  */

    $(document).ready(function (){

    	$.ajax({
            url: '<c:url value="/sm/adminCheck"/>',
            type: 'GET',
            data: {
            },
            success : function(res) {
                if(res.res.adminCheck == 'Y'){
                	adminCheck = 'Y';
                }else{
					adminCheck = '';
                }
            },
            complete : function(){
            	 $.ajax({
         	 		url: '<c:url value="/sm/menuDataList"/>',
         	  	 	type: 'POST',
         	   		data: {
         	   			'menuAuth'	: 	menuAuth,
         	   			'adminCheck' :  adminCheck
         	   		},
         			success: function(result){
         				if( result.result == "ok" ){
             	      		$('#menuTree').jstree({
             	      			core : { data: menuSelect(result)},
             	      			checkbox : {
             	      				"keep_selected_style" : false
             	      			},
             	      			plugins : ["themes", "html_data", "checkbox" ]
             	      		}); 
             			} else {
                 			toastr.error(result.message);
                 		}
         	  		}
         		});    		
            }
		 });
		 
    	
    });
   

	/* $('#authCd').on('change',function(){
		$('#deptDiv').addClass('d-none');
		$('#userDiv').removeClass('d-none');
		$(this).val("001");		
		$('#departmentTable').DataTable().ajax.reload(function(){});	
		userNumber = 'kkkk';
		departmentCd = 'kkk'
        $('#btnSave').addClass('d-none');
        $('#btnDelete').addClass('d-none');
        $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
       
	}); 

	$('#authCd2').on('change',function(){
		$('#userDiv').addClass('d-none');
		$('#deptDiv').removeClass('d-none');
		$(this).val("002");		
		$('#userTable').DataTable().ajax.reload(function(){});	
		userNumber = 'kkkk';
		departmentCd = 'kkk'
        $('#btnSave').addClass('d-none');
        $('#btnDelete').addClass('d-none');
        $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
       
	});*/

	
	// 메인메뉴 상세 정보 보기
	/*$('#departmentTable tbody').on('click', 'tr', function () {		
		
        if ( $(this).hasClass('selected') ) { //select취소될때.
            $(this).removeClass('selected');
            $('#btnSave').addClass('d-none');
            $('#btnDelete').addClass('d-none');
            $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
           
        }
        else { //select될때
        	$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
          
            departmentCd = departmentTable.row('.selected').data().baseCd;
            userNumber = 'kkkk';
            
            //if(userDepartCheck == '관리부'){
   		    	$('#btnSave').removeClass('d-none');
   				$('#btnDelete').removeClass('d-none');
            //} 
            
			$.ajax({
		     		url: '<c:url value="/sm/menuDataList"/>',
		      	 	type: 'POST',
		       		data: {
		       			'menuAuth'	: 	menuAuth,
		       			'departmentCd' : function(){return departmentCd;},
		       			'userNumber' : function(){return userNumber;},
		       			'adminCheck' : adminCheck
		       		},
		    		success: function(result){
	    				if( result.result == "ok" ){
				      		$('#menuTree').jstree({
				      			core : { data: menuSelect(result)},
				      			checkbox : {
				      				"keep_selected_style" : false
				      			},
				      			plugins : ["themes", "html_data", "checkbox" ]
				      		});
				      		$.each(result.check, function(idx, item){
				      			
				      			$('#menuTree').jstree('select_node', item.menuId);
				      			console.log(item.menuId);
				    		});
				      		//$('#menuTree').jstree(true).refresh();
	        			} else {
	            			toastr.error(result.message);
	        			}
		      		}
		    });
        }
   	});*/

	// 메인메뉴 상세 정보 보기
	$('#userTable tbody').on('click', 'tr', function () {		
		
        if ( $(this).hasClass('selected') ) { //select취소될때.
            $(this).removeClass('selected');
            $('#btnSave').addClass('d-none');
            $('#btnDelete').addClass('d-none');
            $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
           
        }
        else { //select될때
        	$('#userTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            $ ('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));
          
            //departmentCd = 'kkk';
            userNumber = userTable.row('.selected').data().userNumber;
            
            //if(userDepartCheck == '관리부'){
   		    	$('#btnSave').removeClass('d-none');
   				$('#btnDelete').removeClass('d-none');
            /*}else{
            	if(userNumberCheck == userNumber){
            		$('#btnSave').removeClass('d-none');
       				$('#btnDelete').removeClass('d-none');
            	}else{
            		$('#btnSave').addClass('d-none');
                    $('#btnDelete').addClass('d-none');
            	}
            }*/
            
			$.ajax({
		     		url: '<c:url value="/sm/menuDataList"/>',
		      	 	type: 'POST',
		       		data: {
		       			'menuAuth'	: 	menuAuth,
		       			//'departmentCd' : function(){return departmentCd;},
		       			'userNumber' : function(){return userNumber;}
		       		},
		    		success: function(result){
	    				if( result.result == "ok" ){
				      		$('#menuTree').jstree({
				      			core : { data: menuSelect(result)},
				      			checkbox : {
				      				"keep_selected_style" : false
				      			},
				      			plugins : ["themes", "html_data", "checkbox" ]
				      		});
				      		$.each(result.check, function(idx, item){
				      			
				      			$('#menuTree').jstree('select_node', item.menuId);
				      			console.log(item.menuId);
				    		});
	        			} else {
	            			toastr.error(result.message);
	        			}
		      		}
		    });
        }
   	});

	
	
	$('#btnSave').on('click',function(){ //저장 버튼 클릭시
		
		var menuId = new Array();		
		var dataArray = new Array();		
		$('#my-spinner').show(function(){
			$.each($("#menuTree").jstree("get_checked",true),function(index){
				console.log($('#menuTree').jstree(true).get_parent(this));
					
				var rowData = new Object();
				menuId[index] = this.id;	
				rowData.menuId = menuId[index];
				rowData.departmentCd = departmentCd;
				rowData.userNumber = userNumber;
				rowData.useYnCd = 'Y';
				
				dataArray.push(rowData);
			});	
		
			$.ajax({		    	
		        url: '<c:url value="/sm/authSave"/>',
		        type: 'POST',
		        async : false,
		        datatype: 'json',
		        data: JSON.stringify(dataArray),
		        contentType : "application/json; charset=UTF-8",
		        success: function(result){
		        	if(result.result == "ok"){
		        		$('#my-spinner').hide();
		        		toastr.success('저장 되었습니다.');       		
		        	}
		        	else{
		        		$('#my-spinner').hide();
		        		toastr.error(result.message);
		        	}
		        	
		        }
			});	 
			
			if (!(!$.trim($('#changeHis').val()))) {
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
//							$('#btnAddConfirm').removeClass('d-none');
//							$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}
		});
		
		
	});	
	
	
	$('#btnDelete').on('click',function(){ //삭제 버튼 클릭시			
		
		$.ajax({		    	
	        url: '<c:url value="/sm/authDelete"/>',
	        type: 'POST',
	        datatype: 'json',
	        data: {
	        	'menuAuth'	: 	menuAuth,
	        	'departmentCd' : departmentTable.row('.selected').data().baseCd
	        },
	        success: function(result){
	        	if(result.result == "ok"){	        		
	        		$('#menuTree').jstree("uncheck_node", $('#menuTree').jstree("get_checked",true));	      			
	     			toastr.success('초기화 되었습니다.');
	        	}
	        	else{
	        		toastr.error(result.message);
	        	}
	        }
		});	   	
	});	
	

	function menuSelect(result){
		 
		var parentData = new Array();
		var childData = new Array();
		var data = new Array();
		var index=0;
		$.each(result.parent, function(idx, item){
			parentData[idx] = {id:item.menuId, parent: '#', text:item.menuNm, state: {
	            opened: false,
	            selected: false
	        }};	
			data[index] = parentData[idx];
			index++;			
		});
		$.each(result.child, function(idx, item){
			childData[idx] = {id:item.menuId, parent: item.upperMenuId, text:item.menuNm};		
			data[index] = childData[idx];			
			index++;
		});		
		
		console.log(data);
		
		return data;
	}
	
	
       
  	
	

// 	function selectBoxAppend(obj, id, sVal, flag)
// 	{
// 		$('#'+ id).empty();

// 		if(flag=='1') {
// 			$('#'+ id).append($("<option>"+ "전체" +"</option>"));
// 	   	} else if(flag=='2') {
// 	   		$('#'+ id).append($("<option>"+ "선택" +"</option>"));
// 	   	}
	   		
// 		for(key in obj) {
// 			var option;
// 			if(obj[key].baseCd == sVal ) {
// 				option = $("<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseCdNm+"</option>");
// 			} else {
// 				option = $("<option value="+obj[key].baseCd+">"+obj[key].baseCdNm+"</option>");
// 			}	
// 			$('#'+ id).append(option);
// 		}

// 	}
   	   	
   	
   	
</script>

</body>
</html>
