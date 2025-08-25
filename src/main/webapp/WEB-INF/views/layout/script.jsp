<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script src="<c:url value='/resources/assets/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/pace/pace.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/stacked-menu/stacked-menu.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/parsleyjs/parsley.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/parsleyjs/i18n/ko.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/moment/moment-with-locales.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/popover/js/jquery-popup.js?ver=0.1'/>"></script>
<script src="<c:url value='/resources/assets/vendor/jsBarcode/JsBarcode.all.min.js'/>"></script>
<script src="<c:url value='/resources/assets/vendor/jQuery.print-master/jQuery.print.js'/>"></script> <!-- jqueryPrint -->
<script src="<c:url value='/resources/assets/vendor/jquery-ui-1.13.0.custom/jquery-ui.js?ver=1'/>"></script> <!-- Jquery UI -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="<c:url value='/resources/assets/vendor/LunarCalendar/LunarCalendar.js?ver=1'/>"></script> <!-- LunarCalendar -->
<script src="<c:url value='/resources/assets/vendor/lodash/lodash.js?ver=1'/>"></script> <!-- lodash -->
<script src="<c:url value='/resources/assets/vendor/sortable/Sortable.min.js?ver=1.0'/>"></script> <!-- Sortable -->
<script src="<c:url value='/resources/assets/vendor/jsSimpleConnect/jqSimpleConnect.js?ver=1.4'/>"></script> <!-- jsSimpleConnect -->
<script src="<c:url value='/resources/assets/vendor/jquery-contextMenu/jquery.contextMenu.min.js?ver=1.0'/>"></script> <!-- jquery contextMenu -->
<script src="<c:url value='/resources/assets/vendor/jquery-ui-1.13.0.custom/jquery.ui.position.js?ver=1.0'/>"></script> <!-- jquery ui position -->
<script src="<c:url value='/resources/assets/vendor/bootstrap-toggle/bootstrap-toggle.min.js?ver=1.0'/>"></script> <!-- bootstrap toggle -->
<%-- <script src="<c:url value='/resources/assets/stylesheets/js/alertify.min.js?version=1.13.1'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/buttons.html5.min.js?version=1.5.1'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/buttons.print.min.js?version=1.5.1'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/dataTables.buttons.min.js?version=1.5.1'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/assets/stylesheets/js/datatables.min.js?version=1.10.20'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/jstree.min.js?version=3.2.1'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/jszip.min.js?version=3.1.3'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/pdfmake.min.js?version=0.1.32'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/sum().js?version=1.10.19'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/toastr.min.js?version=2.1.4'/>"></script>
<script src="<c:url value='/resources/assets/stylesheets/js/vfs_fonts.js?version=0.1.32'/>"></script>
<script src="<c:url value='/resources/assets/javascript/theme.min.js'/>"></script>
<script src="<c:url value='/resources/assets/javascript/pages/calendar.js'/>"></script><!--소정추가--> --%>

<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/af-2.3.4/b-1.6.1/cr-1.5.2/fc-3.3.0/fh-3.1.6/kt-2.5.1/r-2.2.3/rg-1.1.1/rr-1.2.6/sc-2.0.1/sp-1.0.1/sl-1.3.1/datatables.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.19/api/sum().js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script src="<c:url value='/resources/assets/javascript/theme.min.js'/>"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<script src="<c:url value='/resources/assets/javascript/pages/calendar.js'/>"></script><!--소정추가-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="<c:url value='/resources/assets/javascript/pages/jquery.mtz.monthpicker.js'/>"></script>
<script src="//cdn.rawgit.com/ashl1/datatables-rowsgroup/v1.0.0/dataTables.rowsGroup.js"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">	<!-- 패스워드 보기 -->

 <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/21.2.7/js/dx.all.js"></script>
<script src="/node_modules/devextreme-aspnet-data/js/dx.aspnet.data.js"></script>
<script>
    // 토스트 메시지가 2초후 사라짐
    toastr.options.timeOut = 2000;
 
    // moment 언어 설정
    moment.locale('ko');

    //dataTables 한글화
    let lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
        "infoEmpty" : "0건",
        "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };

    Chart.register(ChartDataLabels); // chart js datalabel;

 	// 휠 스크롤 확대축소할 때 datatable draw해서 깨지는 현상 복구 처리
    $(window).on('mousewheel', function(event){
        if(event.originalEvent.ctrlKey) {
        	$('.dataTables_wrapper').each(function(index, node) {
    			let datatableId = $(node).attr('id').split('_')[0];
    			$('#'+datatableId).DataTable().draw();
    		});
        	toastr.warning('scroll');
        }
    });

	function selectBoxAppend(obj, id, sVal, flag)
	{
		$('#'+ id).empty();

		if(flag == '1') {
			$('#'+ id).append($("<option value=''>"+ "전체" +"</option>"));
	   	} else if(flag == '2') {
	   		$('#'+ id).append($("<option value=''>"+ "선택" +"</option>"));
	   	}
	   		
		for(key in obj) {
			var option;
			if(obj[key].baseCd == sVal ) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>");
				} else {
				option = $("<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>");
			}	
			$('#'+ id).append(option);
		}

	}

	function selectBoxHtml(obj, id, sVal, row, meta)
	{
		//$('#'+ id).empty();
		//var shtml = '<select id="'+ id +'" class="mySelect" data-col="' + meta.col + '" onChange="locateChange()"><option value="">선택</option>';
		var shtml = '<select class="custom-select custom-select-sm" id="'+ id +'" data-col="' + meta.col + '"><option value="">선택</option>';
		//var shtml = '<select class="mySelect" data-col="' + meta.col + '" ><option value="">선택</option>';
		
		var option;
		for(key in obj) {
			var tmp; 
			if(obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}	


	function myFunction(x) {
		x.classList.toggle("change");
	}
	function openrNav() {
		document.getElementById("myrSidenav").style.display = "block";
		document.getElementById("arrowLeft").style.display = "none";
		document.getElementById("main").style.marginRight = "0";
	}
	function closerNav() {
		document.getElementById("myrSidenav").style.display = "none";
		document.getElementById("arrowLeft").style.display = "block";
		document.getElementById("main").style.marginRight = "10px";
	}
	function myrFunction(x) {
		x.classList.toggle("change");
	}

	function openrNav2() {
		document.getElementById("rfSidenav").style.display = "block";
		document.getElementById("arrowLeft").style.display = "none";
		document.getElementById("main").style.marginRight = "0";
	}
	function closerNav2() {
		document.getElementById("rfSidenav").style.display = "none";
		document.getElementById("arrowLeft").style.display = "block";
		document.getElementById("main").style.marginRight = "10px";
	}

	$(function() {
		var state = true;
		$("#left-width-btn").click(function() {
			{
				$("#left-list").animate({
					width : "71%"
				}, 200);
				$("#arrow-left").animate({
					display : "none"
				}, 200);
			}

			state = !state;
		});

		$("#left-width-btn").click(function() {
			{
				$("#left-list").animate({
					width : "71%"
				}, 200);
				$("#arrow-left").animate({
					display : "none"
				}, 200);
			}

			state = !state;
		});
	});
	$(function() {
		var state = true;
		$("#left-expand").click(function() {
			{
				$("#left-list").animate({
					width : "100%"
				}, 200);
			}
			state = !state;
		});

		$("#left-expand2").click(function() {
			{
				$("#left-list").animate({
					width : "100%"
				}, 200);
			}
			state = !state;
		});

	});
	
	function isNull(obj) {

		return (typeof obj != "undefined" && obj != null && obj != "") ? false : true;

	}
	
	// 시스템 공통코드 Modal
	// @param = 시스템그룹코드
	// @param = selectBox cdID
	// @param = selectBox nmID
	var commonCdPopUpTable
	function commonCdModal(baseGroupCd, cdId, nmId) {
		commonCdPopUpTable = $('#commonCdPopUpTable').DataTable({
	        dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			destroy: true,
	        language: lang_kor,
	        paging: true,
	        info: true,
	        ordering: true,
	        processing: true,
	        autoWidth: false,
	        //scrollX : true,
	        pageLength: 20,	
			ajax: {
					url: '<c:url value="systemCommonCodeDataList"/>',
					type: 'GET',
					data: {
						'baseGroupCd': baseGroupCd
				},
			},
			columns: [
				{ data: 'useYnNm' },
	  			{ data: 'baseCd' },
	  			{ data: 'baseNm' },
	  			{ data: 'baseAbbr' },
	  			{ data: 'etc1' },
	  			{ data: 'etc2' },
	  			{ data: 'etc3' },
	  			{ data: 'etc4' },
	  			{ data: 'etc5' },
	  			{ data: 'baseDesc' }
	  		],
	  		columnDefs: [
	        ],
	  		order: [
	  			[ 1, 'asc' ],
	  		],
	  		buttons: [
	        ],	  		
		});
		
		$('#commonCdPopUpTable tbody').on('click', 'tr', function () {
	    	var data = commonCdPopUpTable.row( this ).data();
	    	$('#'+cdId).val(data.baseCd);
	    	$('#'+nmId).val(data.baseNm);
	    	$('#commonCdPopUpModal').modal('hide');
	    });
		 
		 $('#commonCdPopUpModal').modal('show');
	}

	// 보기
	$('#info').on('click', function() {
		$.ajax({
			url : '<c:url value="/sm/info"/>',
			type : 'GET',
			data : {
				
			},
			success : function(res) {
				let data = res.data;

				if(res.result == "ok"){		
					
					// 보기
					$('#userNmModal').val(data.userNm);
					$('#userNumberModal').val(data.userNumber);
					$('#userIdModal').val(data.userId);
					$('#postCdModal').val(data.postNm);
					$('#departmentCdModal').val(data.departmentNm);
					$('#chargrDutyModal').val(data.chargeDutyNm);		
				
					$('#infoPopUpModal').modal('show');	
				} else {
					toastr.error(res.message);
				}
			}
		});
	});



	//숫자만 입력, 길이, 소수점 세자리까지 제한
	$('.number-float3').keyup(function (event) {
 		if ( !(	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46 || event.which == 109|| event.which == 110 || event.which == 189 || event.which == 190)	) {
			$('.number-float3').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			});
			toastr.warning('양수(+)만 입력해주세요.');
			event.preventDefault();
			$(this).val("0");
 			$(this).select();
			return false;
		}
 		if ($(this).val() == "00") {
			$(this).val("0");
			$(this).select();
			return false;
		}
 		if ($(this).attr("maxlength") < $(this).val().length) {
			toastr.warning('최대 입력 글자를 초과하였습니다.');
			$(this).val("0");
 			$(this).select();
			return false;
		}
 		if ( parseFloat($(this).attr("max")) < parseFloat($(this).val())) {
			toastr.warning('최대 크기를 초과하였습니다.');
			$(this).val("0");
 			$(this).select();
			return false;
		}
 		if ( parseFloat($(this).attr("min")) > parseFloat($(this).val())) {
			toastr.warning('최소 크기를 초과하였습니다.');
			$(this).val("0");
 			$(this).select();
			return false;
		}

 		var _pattern3 = /^\d*[.]\d{3}$/;	//누르고있는 키는 예외처리 안됨
        if (_pattern3.test( $(this).val())) {
        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
        	$(this).val("0");
 			$(this).select();
            return false;
		}
	});

	
	
	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} 

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	}

	//입력값에 '/'확인하여 '%2f'로 모두 변환
	function replaceSlash(data) {
		return data.replace(/\//gi, "%2f");
	}

	//입력값에 '%2f'확인하여 '/'로 모두 변환
	function replaceAll(data) {
		return data.split("%2f").join("/");
	}
	
	/*
	$.ajax({
	    url: '<c:url value="/asideMenu"/>',
	    type: 'POST',
	    data: {      
	    },    
	    success: function (res) {
	       
	        var upperMenu = "";
	        
	        var menuUpperId= new Array();
	        
	       
	       
	        	 $.each(res.result, function(idx, item){ 
	 	        	
	  	           if(item.menuUpperId == null){
	  	        	   upperMenu += '<li class="menu-item has-child append-data">';
	  	        	   upperMenu += '<a href="#" class="menu-link append-data-a">';
	  	        	   upperMenu += '<span class="menu-icon far fa-file-alt"></span>';	       
	  	        	   upperMenu += '<span class="menu-text">' + item.menuNm +'</span>';
	  	        	   upperMenu += '</a>';
	  	        	   upperMenu += '<ul class="menu" id='+item.menuId +'></ul>';	        	   
					   upperMenu += '</li>';
	  	           } 
	  	        });
	        	 
		        $('#aside').append(upperMenu);
		        
	        	$.each(res.result, function(idx, item){ 
	  		        if(item.menuUpperId != null){
	  		        	var subMenu = "";
	  		        	subMenu += '<li class="menu-item">';
	  		        	subMenu += '<a href="<c:url value="' + item.menuPath + '"/>" id=' + item.menuId + ' class="menu-link" tabindex="-1">'+item.menuNm+'</a>';
	  		        	subMenu += '</li>';
	  		        	
	  		        	$('#'+item.menuUpperId).append(subMenu);
	  		        	
	  		        	
	  	          	}
	  	        });
	        	$(document).on('click','.has-child',function(){
	        		if ( $(this).hasClass('has-open') ) {
	        			$(this).removeClass('has-open');
	        		} else{
	        			$(this).addClass('has-open');
	        		}
	        		
	        		 
	        	});
	    },
	    complete : function(){
	    	
	    }
	});
	*/


	/*
	let current = null;
	let controllerUrl = null;
	let subControllerUrl = null;
	let viewMainTable = null;
	let mainTable = '';
	let formItems = null;				// 메인항목 - 등록, 수정에 보여줄 항목
	let viewItems = null;				// 메인항목 - 보기에 보여줄 항목
	let theadItems = null;				// 메인항목 - 테이블 항목
	let columns = null;					// 메인항목 - 목록, 칼럼(columns)
	let orderLot = null;				// 메인항목 - 목록, 정렬(orderLot)
	let columnDefs = null;				// 메인항목 - 목록, 칼럼상태(columnDefs)
	let subTable = '';
	let subFormItems = null;			// 서브항목 - 등록, 수정에 보여줄 항목
	let subViewItems = null;			// 서브항목 - 보기에 보여줄 항목
	let subTheadItems = null;			// 서브항목 - 테이블 항목
	let subColumns = null;				// 서브항목 - 목록, 칼럼(columns)
	let subOrderLot = null;				// 서브항목 - 목록, 정렬(orderLot)
	let subColumnDefs = null;			// 서브항목 - 목록, 칼럼상태(columnDefs)
	let searchData = null;
	let showAddAfterViewDetail = false;	// 상세보기가 선택된 상태에서 등록을 누른경우, 취소하면 다시 상세보기항목을 보여주기 위해서 사용
	 */

	 /* Get the documentElement (<html>) to display the page in fullscreen */
	 var elem = document.documentElement;

	 /* View in fullscreen */
	 function openFullscreen() {
	   if (elem.requestFullscreen) {
	     elem.requestFullscreen();
	   } else if (elem.webkitRequestFullscreen) { /* Safari */
	     elem.webkitRequestFullscreen();
	   } else if (elem.msRequestFullscreen) { /* IE11 */
	     elem.msRequestFullscreen();
	   }
	 }

	 /* Close fullscreen */
	 function closeFullscreen() {
	   if (document.exitFullscreen) {
	     document.exitFullscreen();
	   } else if (document.webkitExitFullscreen) { /* Safari */
	     document.webkitExitFullscreen();
	   } else if (document.msExitFullscreen) { /* IE11 */
	     document.msExitFullscreen();
	   }
	 }

	// 숫자 천단위 표기 
	function numberFormat(node, returnType) {
		node.value = node.value.replace(/[^0-9\.]/g,'');
		
		if(node.value.split('.').length > 2) { // .이 두개 이상 있을 경우
			node.value = $(node).data('temp');
		} else {
			if(node.value.length != 1) { // 첫번째 입력이 아닐 경우
				if(node.value.split('.')[0].length != 1) { // 0.몇이 아닐 경우
					if(node.value.split('.')[0].slice(0,1) == '0') {
						node.value = node.value.substring(1)
					}
				}
			}
		}
		if(node.value.slice(0, 1) == '.')  { // 제일 앞 자리가 .일경우
			node.value = "0"+node.value;
		}

		if(node.value.split('.').length == 2) { // float타입일 경우
			node.value = node.value.split('.')[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '.' + node.value.split('.')[1];
		} else {
			node.value = node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		if(returnType == 'int') { // int타입으로 리턴할 경우
			node.value = node.value.split('.')[0];
		} else if(returnType == 'float') { // float타입으로 리턴할 경우
			node.value = node.value;
		}
		
		
		$(node).data('temp',node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}

	// 비밀번호 변경
	$('#passChange').on('click', function() {
		$('#nowPassword').val("");
		$('#changePassword').val("");
		$('#changePassword2').val("");
		$('#nowPassword').attr("disabled",false);
		$('#changePassword').attr("disabled",false);
		$('#changePassword2').attr("disabled",false);
		$('#passChangePopUpModal').modal('show');	
	});
	 
	// 비밀번호 변경
	$('#passChangePopUpSave').on('click', function() {
		if($('#changePassword').val() !=  $('#changePassword2').val()){
			toastr.warning("변경할 비밀번호가 일치하지 않습니다.");
			return false;
		}
		if($('#changePassword').val().length < 4){
			toastr.warning("비밀번호는 4자리 이상으로 입력해주세요");
			return false;
		}
		/* if(PasswordString($.trim($('#changePassword').val()))){
			toastr.warning("비밀번호는 4자리 이상 20자리 이하 특수문자&숫자&영문(대+소문자)조합으로 해주세요");			
			return false;
		} */
		
		$.ajax({
			url : '<c:url value="/sm/passChange"/>',
			type : 'POST',
			data : {
				'nowPass' : $('#nowPassword').val(),
				'changePassword' : $('#changePassword').val(),
			},
			success : function(res) {
				let data = res.data;
				$('#nowPassword').attr("disabled",true);
				$('#changePassword').attr("disabled",true);
				$('#changePassword2').attr("disabled",true);
				if(res.result == "ok"){	
					toastr.success("패스워드가 변경되었습니다.");
					$('#passChangePopUpModal').modal('hide');				
					
				} else {
					toastr.error(res.message, '', {timeOut: 5000});
					$('#passChangePopUpModal').modal('hide');				
				}
			}
		});
	});




	//소숫점 이하 0제거
	var number = "0";
	function rmDecimal(number){
		let tmp = number + "";
		//소숫점이 있을 경우
		if(tmp.indexOf(".")>0){
			number = tmp.replace(/(0+$)/, "");
			
			let numberArr = number.split('.');
			if(numberArr[1]==""){
				number = number.replace('\.','');
			}
		}
		return addCommas(number);
	}

	//출력 천단위(,)표시, 소수점 이하 숫자 표시
	function ouputNumberAutoComma(number){
		if(isNaN(number)) {
			number = 0;
		}
		var number = number;
		var integer = number;
		var point = number.indexOf(".");
		var decimal = "";

		//소숫점 존재
		if(point>0){
			integer = number.substr(0,point);
			decimal = number.substr((point+1),number.length);
		}

		integer = addCommas(uncomma(integer.replace(/,/g,'')));
		decimal = decimal.replace(/(0+$)/, "");
		
		if(point>0){
			return integer+"."+decimal;
		}else{
			return integer;
		}
	}

	//입력 천단위(,)표시, 소수점 이하 숫자 표시
	function inputNumberAutoComma(number){
		console.log('number:'+number)
		if(isNaN(number)) {
			number = 0;
		}
		var number = number;
		var integer = number;
		var point = number.indexOf(".");
		var decimal = "";

		//첫번째 수부터 소숫점 기호(.) 사용 방지
		if(number.charAt(0)=="."){
			toastr.warning("첫번째 수부터 소숫점 기호(.)를 사용할 수 없습니다.");
			return "";
		}

		//소숫점 존재
		if(point>0){
			integer = number.substr(0,point);
			decimal = number.substr((point+1),number.length);
			if(isFinite(decimal)==false){
				toastr.warning("문자를 입력하실 수 없습니다.");
				return "";
			} 
		}

		integer = integer.replace(/,/g,'');
		if(isFinite(integer)==false){
			toastr.warning("문자를 입력하실 수 없습니다.");
			$(this).val("");
			return "";
		}

		integer = addCommas(uncomma(integer));
		if(point>0){
			return integer+"."+decimal;
		}else{
			return integer;
		}
	}

	
</script>
