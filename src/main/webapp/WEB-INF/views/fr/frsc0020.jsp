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
				<li class="breadcrumb-item"><a href="#">통합자료(후가공)</a></li>
				<li class="breadcrumb-item active">통합자료(후가공)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row table-wrap-hid">
			<div class="left-list" id="" style="width: 10%;">
				<table id="departmentTable" class="table table-bordered m-0">
					<thead class="thead-light">
						<tr><th>항목</th></tr>
						<tr id="allDepartMent"><td>전체 (가나다 순)</td></tr>
					</thead>
				</table>
			</div>
			<div class="left-list" id="" style="width: 88%;">
				<div class="card">
					<div class="" style="background-color: #ffffff;">
						<div class="card-body p-0">
							<input class="form-control-lg ml-2 mt-2 mw-100 float-left" type="text" id="textSearch" placeholder="통합검색" style="width:20vw;">
							<button type="button" class="btn btn-primary mr-2 mt-2 float-right" id="btnFileAdd" style="font-size:1rem">등록</button>
						</div>
					</div>
				
					<input type="file" class="d-none" id="fileMain" multiple>
					<table id="fileReferenceTable" class="table table-bordered m-0">
						<colgroup>
							<col width="9%">
							<col width="9%">
							<col width="18%">
							<col width="9%">
							<col width="7%">
							<col width="11%">
							<col width="7%">
							<col width="7%">
							<col width="15%">
							<col width="8%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th style="padding:0.35rem !important;">항목</th>
								<th style="padding:0.35rem !important;">관리No</th>
								<th>파일명</th>
								<th style="padding:0.35rem !important;">Rev. No</th>
								<th>파일종류</th>
								<th>파일연동</th>
								<th>부서명</th>
								<th style="padding:0.35rem !important;">담당자</th>
								<th style="padding:0.35rem !important;">비고</th>
								<th style="padding:0.35rem !important;">관리</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<script>
	let currentHref = "frsc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "통합자료(후가공)");

	let departmentCd = '';
	const gubunVal = '001';
	let dragAble = true;

	function _promise_() {
		return new Promise(function(resolve, reject) {
			resolve();
		});
	}

	//공통코드
	let fileGubunList = new Array();
	<c:forEach items="${fileGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	fileGubunList.push(json);
	</c:forEach>
	
	let fileItemList = new Array();
	<c:forEach items="${fileItem}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	fileItemList.push(json);
	</c:forEach>
	

	// 담당자 목록 조회
	let userList = [];
	function getUserList() {
		$.ajax({
			url: '<c:url value="sm/matrlUserDataList"/>',
            type: 'GET',
            async: false,
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let data = res.data;
				userList = data; // 사용자 목록
				$('#my-spinner').hide();
			}
		});
	}
	getUserList();

	// 담당자 변경할 때 항목 변경
	function setDepartment(node, idx) {
		console.log(node);
		let userNumber = node.value;
		let index = userList.findIndex(d => d.userNumber == userNumber);
		let departmentNm = userList[index].departmentNm;
		$('#fileReferenceTable tbody').find('tr#'+idx).find('td').eq(6).html(departmentNm);
	}

	// 통합자료(후가공) 목록조회
	let fileReferenceTable = $('#fileReferenceTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		paging : true,
		searching: true,
		pageLength : 100000000, 
		scrollY: "70vh",
		ajax : {
			url : '<c:url value="fr/fileReferenceList"/>',
			type : 'POST',
			data : {
				'gubun' : gubunVal,
				'fileManagerDepartmentCd' : function(){return departmentCd;},
				'fileInfo3' : function(){return "002";}
			},
		},
		select: false,
		rowId: 'idx',
		columns : [
			{//항목
				data : 'fileInfo1',
				className : 'text-center',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<select class="form-control text-center p-0" id="fileItem-'+idx+'" disabled>';
						html += '	<option value="">선택</option>';
					for(var i=0;i<fileItemList.length;i++) {
						if(fileItemList[i].baseCd == data) {
							html += '	<option value="'+fileItemList[i].baseCd+'" selected>'+fileItemList[i].baseNm+'</option>';
						} else {
							html += '	<option value="'+fileItemList[i].baseCd+'">'+fileItemList[i].baseNm+'</option>';
						}
					}
						html += '</select>';
					return html;
				}
			},
			{//관리No
				data : 'fileInfo2',
				className : 'text-center p-0',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<input class="form-control mw-100" type="text" id="fileManageNo-'+idx+'" value="'+(data==null?'':data)+'" disabled>';
					return html;
				}
			},
			{//파일명
				data : 'fileName',
				className : 'text-center',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					return '<a href="fr/fileReferenceRead?idx='+idx+'">'+data+'</a>';
				}
			},
			{//Rev. No
				data : 'fileInfo3',
				className : 'text-center p-0',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<input class="form-control mw-100" type="text" id="fileRevNo-'+idx+'" value="'+(data==null?'':data)+'" disabled>';
					return html;
				}
			},
			{//파일종류
				data : 'fileName',
				className : 'text-center',
				render : function(data, type, row, meta) {
					let length = data.split('.').length;
					
					return data.split('.')[length-1];
				}
			},
			{//파일연동
				data : 'fileGubun',
				className : 'text-center',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<select class="form-control text-center p-0" id="fileGubun-'+idx+'" disabled>';
						html += '	<option value="">선택</option>';
					for(var i=0;i<fileGubunList.length;i++) {
						if(fileGubunList[i].baseCd == data) {
							html += '	<option value="'+fileGubunList[i].baseCd+'" selected>'+fileGubunList[i].baseNm+'</option>';
						} else {
							html += '	<option value="'+fileGubunList[i].baseCd+'">'+fileGubunList[i].baseNm+'</option>';
						}
					}
						html += '</select>';
					return html;
				}
			},
			{//부서명
				data : 'fileManagerDepartmentNm',
				className : 'text-center'
			},
			{//담당자
				data : 'fileManagerNm',
				className : 'text-center p-0',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<select class="form-control text-center p-0" id="fileManager-'+idx+'" onchange="setDepartment(this,\''+idx+'\')" disabled>';
					for(var i=0;i<userList.length;i++) {
						if(userList[i].userNumber == row['fileManager']) {
							html += '<option value="'+userList[i].userNumber+'" selected>'+userList[i].userNm+'</option>';
						} else {
							html += '<option value="'+userList[i].userNumber+'">'+userList[i].userNm+'</option>';
						}
					}
						html += '</select>';
					return html;
				}
			},
			{//비고
				data : 'fileDesc',
				className : 'text-center p-0',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<input class="form-control mw-100" type="text" id="fileDesc-'+idx+'" value="'+(data==null?'':data)+'" disabled>';
					return html;
				}
			},
			{//관리
				className : 'text-center p-0',
				render : function(data, type, row, meta) {
					let idx = row['idx'];
					let html = '';
						html += '<button type="button" class="btn btn-danger float-right mr-2 btnDelete" id="btnDelete-'+idx+'" onclick="fileDelete('+idx+')">삭제</button>';
						html += '<button type="button" class="btn btn-warning float-right mr-2 btnEdit" id="btnEdit-'+idx+'" onclick="fileEdit('+idx+')">수정</button>';
						html += '<button type="button" class="btn btn-secondary float-right mr-2 d-none btnCancle" id="btnCancle-'+idx+'" onclick="fileCancle('+idx+')">취소</button>';
						html += '<button type="button" class="btn btn-primary float-right mr-2 d-none btnSave" id="btnSave-'+idx+'" onclick="fileSave('+idx+')">저장</button>';
					return html;
				}
			},
// 			{//첨부일자
// 				data : 'fileInputDate',
// 				className : 'text-center p-0',
// 				render : function(data, type, row, meta) {
// 					let idx = row['idx'];
// 					let html = '';
// 						html += '<input class="form-control text-center mw-100" type="date" id="fileInputDate-'+idx+'" value="'+moment(data).format('YYYY-MM-DD')+'" disabled>';
// 					return html;
// 				}
// 			},
		],
		columnDefs : [],
		buttons : [],
		order : [],
		drawCallback: function() {
		    $('#fileReferenceTable_filter').addClass('d-none');
		}
	});

	// 통합검색
	$('#textSearch').on('keyup',function() {
		$('#fileReferenceTable_filter').find('input').val($(this).val());
		$('#fileReferenceTable_filter').find('input').trigger('keyup');
	});

	

	// 파일 추가 버튼 click
	$('#btnFileAdd').on('click',function() {
		$('#fileMain').click();
	});

	// 파일 등록
	$('#fileMain').on('change',function() {
        $('#my-spinner').show();
        setTimeout(function(){
    		let formData = new FormData();
			let fileInput = document.getElementById("fileMain"); //id로 파일 태그를 호출
			let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

			if(files.length != 0) { // 파일을 선택했을 경우
				for(var i=0;i<files.length;i++) {
		        	let fileType = files[i].name.split('.')[files[i].name.split('.').length-1];
		        	let fileName = files[i].name.slice(0,(fileType.length*-1)-1);
		            
		        	formData.append('file-'+i,files[i]);
		        	formData.append("gubun",gubunVal);
		            formData.append("fileName",files[i].name);
		            formData.append("fileInfo3","002");
		        }
				$.ajax({
		            url: '<c:url value="fr/fileReferenceAdd"/>',
		            data: formData,
		            processData: false,
		            contentType: false,
		            async: false,
		            type: 'POST',
		            success: function(data){
		                if(data.result == "ok"){ //응답결과
		                    toastr.success('저장되었습니다.');
		                    fileReferenceTable.ajax.reload(); // 목록조회
		                    console.log("등록자 사번코드 : " + data.userNumber);
		                } else {
		                	toastr.error(res.message);
		            	}
		            },
		           	error: function(xhr,textStatus,error){
		               	console.log("textStatus: "+xhr.status+", error: "+error);
		               	alert("예상치 못한 오류가 발생했습니다.");
		            }
		        });
			}
			$('#my-spinner').hide();
        },100);
	})
	
	// 파일 다운로드
	function fileDownload(idx) {
		$('#my-spinner').show();
		location.href = 'fr/fileReferenceRead?idx='+idx;
        setTimeout(function() {
        	$('#my-spinner').hide();
        },100);
	}

	//파일 삭제
	function fileDelete(idx) {
		$('#btnDeleteConfirm').data('idx',idx);
		$('#deleteModal').modal('show');
	}

	//삭제 모달 삭제버튼 click
	$('#btnDeleteConfirm').on('click',function() {
		let idx = $(this).data('idx');
		$.ajax({
			url: '<c:url value="fr/fileReferenceRemove"/>',
            type: 'POST',
            async: false,
            data: {
            	'idx'	:	idx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == "ok"){ //응답결과
					toastr.success('삭제되었습니다.');
                } else {
                	toastr.error(res.message);
            	}
				fileReferenceTable.ajax.reload(); // 목록조회
				$('#my-spinner').hide();
				$('#deleteModal').modal('hide');
			}
		});
	});

	// 파일 수정 버튼 click
	function fileEdit(idx) {
		$('#textSearch').attr('disabled', true); // 통합검색
		
		$('#btnFileAdd').attr('disabled', true); // 등록버튼
		$('.btnDelete').attr('disabled', true); // 삭제버튼
		$('.btnEdit').attr('disabled', true); // 수정버튼
		
		$('#btnDelete-'+idx).addClass('d-none'); // 삭제버튼
		$('#btnEdit-'+idx).addClass('d-none'); // 수정버튼
		$('#btnSave-'+idx).removeClass('d-none'); // 저장버튼
		$('#btnCancle-'+idx).removeClass('d-none'); // 취소버튼
		
		$('#fileItem-'+idx).attr('disabled', false); //항목 입력란
		$('#fileManageNo-'+idx).attr('disabled', false); //관리No 입력란
		$('#fileRevNo-'+idx).attr('disabled', false); //Rev. No 입력란
		$('#fileGubun-'+idx).attr('disabled', false); //파일연동 입력란
		$('#fileManager-'+idx).attr('disabled', false); //담당자 입력란
		$('#fileDesc-'+idx).attr('disabled', false); //비고 입력란
// 		$('#fileInputDate-'+idx).attr('disabled',false); //첨부일자 입력란
		
	}

	// 파일 저장 버튼 click
	function fileSave(idx) {
		$.ajax({
			url: '<c:url value="fr/fileReferenceEdit"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	idx,
                'fileGubun'		:	$('#fileGubun-'+idx).val(),
                'fileManager'	:	$('#fileManager-'+idx).val(),
            	'fileDesc'		:	$('#fileDesc-'+idx).val(),
            	'fileInfo1'		:	$('#fileItem-'+idx).val(),
            	'fileInfo2'		:	$('#fileManageNo-'+idx).val(),
            	'fileInfo3'		:	$('#fileRevNo-'+idx).val(),
            	'fileInputDate'	:	'',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == "ok"){ //응답결과
					toastr.success('수정되었습니다.');
					$('#textSearch').attr('disabled', false); // 통합검색
					$('#btnFileAdd').attr('disabled',false); // 등록버튼
					$('.btnDelete').attr('disabled',false); // 삭제버튼
					$('.btnEdit').attr('disabled',false); // 수정버튼
					$('#btnDelete-'+idx).removeClass('d-none'); // 삭제버튼
					$('#btnEdit-'+idx).removeClass('d-none'); // 수정버튼
					$('#btnSave-'+idx).addClass('d-none'); // 저장버튼
					$('#btnCancle-'+idx).addClass('d-none'); // 취소버튼
					
					$('#fileItem-'+idx).attr('disabled', true); //항목 입력란
					$('#fileManageNo-'+idx).attr('disabled', true); //관리No 입력란
					$('#fileRevNo-'+idx).attr('disabled', true); //Rev. No 입력란
					$('#fileGubun-'+idx).attr('disabled', true); //파일연동 입력란
					$('#fileManager-'+idx).attr('disabled', true); //담당자 입력란
					$('#fileDesc-'+idx).attr('disabled', true); //비고 입력란
// 					$('#fileInputDate-'+idx).attr('disabled',true); // 첨부일자란
                } else {
                	toastr.error(res.message);
            	}
				fileReferenceTable.ajax.reload(); // 목록조회
				$('#my-spinner').hide();
			}
		});
		
	}

	// 파일 취소 버튼 click
	function fileCancle(idx) {
		$('#textSearch').attr('disabled', false); // 통합검색
		
		$('#btnFileAdd').attr('disabled',false); // 등록버튼
		$('.btnDelete').attr('disabled',false); // 삭제버튼
		$('.btnEdit').attr('disabled',false); // 수정버튼
		
		$('#btnDelete-'+idx).removeClass('d-none'); // 삭제버튼
		$('#btnEdit-'+idx).removeClass('d-none'); // 수정버튼
		$('#btnSave-'+idx).addClass('d-none'); // 저장버튼
		$('#btnCancle-'+idx).addClass('d-none'); // 취소버튼
		
		$('#fileItem-'+idx).attr('disabled', true); //항목 입력란
		$('#fileManageNo-'+idx).attr('disabled', true); //관리No 입력란
		$('#fileRevNo-'+idx).attr('disabled', true); //Rev. No 입력란
		$('#fileGubun-'+idx).attr('disabled', true); //파일연동 입력란
		$('#fileManager-'+idx).attr('disabled', true); //담당자 입력란
		$('#fileDesc-'+idx).attr('disabled', true); //비고 입력란
// 		$('#fileInputDate-'+idx).attr('disabled',true); // 첨부일자란
		
	}

	// 파일 드롭 다운
    function fileDropDown() {
        var dropZone = $("#fileReferenceTable").parent();
        //Drag기능 
        dropZone.on('dragenter', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.attr('style', 'position: relative; overflow: auto; height: 70vh; width: 100%; background-color:#ffffff !important;');
        });
        dropZone.on('dragleave', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.attr('style', 'position: relative; overflow: auto; height: 70vh; width: 100%; background-color:#ffffff !important;');
        });
        dropZone.on('dragover', function(e) {
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.attr('style', 'position: relative; overflow: auto; height: 70vh; width: 100%; background-color:#e6f4fa !important;');
        });
        dropZone.on('drop', function(e) {
        	e.preventDefault();
        	let formData = new FormData();
    		let fileInput = document.getElementById("fileMain"); //id로 파일 태그를 호출
    		let files = e.originalEvent.dataTransfer.files; //업로드한 파일들의 정보를 넣는다.
        	$('#my-spinner').show();
        	setTimeout(function(){
	            // 드롭다운 영역 css
	            dropZone.attr('style', 'position: relative; overflow: auto; height: 70vh; width: 100%; background-color:#ffffff !important;');
	            if(dragAble) {
	            	
	                
	                for(var i=0;i<files.length;i++) {
	                	let fileType = files[i].name.split('.')[files[i].name.split('.').length-1];
	                	let fileName = files[i].name.slice(0,(fileType.length*-1)-1);
	                    
	                	formData.append('file-'+i,files[i]);
	                	formData.append("gubun",gubunVal);
	                    formData.append("fileName",files[i].name);
	                }

	                $.ajax({
	                    url: '<c:url value="fr/fileReferenceAdd"/>',
	                    data: formData,
	                    processData: false,
	                    contentType: false,
	                    async: false,
	                    type: 'POST',
	                    success: function(res){
	                        if(res.result == "ok"){ //응답결과
	                            toastr.success('저장되었습니다.');
	                            fileReferenceTable.ajax.reload(); // 목록조회
	                        } else {
	                        	toastr.error(res.message);
	                    	}
	                    },
	                   	error: function(xhr,textStatus,error){
	                       	console.log("textStatus: "+xhr.status+", error: "+error);
	                       	alert("예상치 못한 오류가 발생했습니다.");
	                    },
	                });
	            }
            	$('#my-spinner').hide();
            },100);
        });
    }

    setTimeout(function() {
    	//fileDropDown();
    }, 100);

    // 부서목록
    let departmentTable = $('#departmentTable').DataTable({
        dom : '',
    	language: lang_kor,
        paging: false,
        info: false,
        ordering: false,
        processing: true,
        autoWidth: false,
        scrollX : false,  
        lengthChange: false,
        searching : false,
        pageLength : 20,     
        ajax : {
			url : '<c:url value="/bm/commonCodeList"/>',
			type : 'GET',
			data : {
				'baseGroupCd'	: 	'146',
			},
		},
        columns: [
           	{//항목
           		data: 'baseNm'
           	},
        ],        
        order: [
            [ 0, 'asc' ]
        ],       
        buttons: [
            'copy', 'excel', 'pdf'
        ],
    });

	$('#departmentTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		departmentCd = departmentTable.row(this).data().baseCd;
		$('#fileReferenceTable').DataTable().ajax.reload();
	});


	//전체 선택시
	$('#allDepartMent').on('click',function(){
		$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
		
		departmentCd = '';
		$('#fileReferenceTable').DataTable().ajax.reload();
	})

    
</script>
</body>
</html>