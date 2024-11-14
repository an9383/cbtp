<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-popup.jsp" %>
<div class="page has-sidebar has-sidebar-expand-lg">
	<div class="row">
			<div style="width:100%">	
	        <header class="page-title-bar">
	            <!-- floating action -->
	            <button type="button" class="btn btn-success btn-floated"><span class="fa fa-plus"></span></button> <!-- /floating action -->
	            <!-- title and toolbar -->
	
	            <!-- title and toolbar -->
	            <div class="d-md-flex align-items-md-start">
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;거래처목록</h5>
<!-- 	                <div class="btn-toolbar">
	                    <button type="button" class="btn btn-success">Excel</button>	                
	                    &nbsp;
	                    <button type="button" class="btn btn-primary" id="btnShowCreate">조회</button>
	                </div> -->
	            </div>
	            <!-- /title and toolbar -->
	
	        </header>
	
	        <!-- .page-section -->
	        <div class="page-section">
	            <div class="card card-fluid">
	                <div class="card-body">
	                    <table id="dealCorpTable" class="table table-bordered">
	                        <thead>
	                        <tr>
	                            <th>거래처코드</th>
	                            <th>거래처명</th>
	                            <th>이니셜</th>
	                            <th>대표자</th>
	                            <th>국가명</th>
	                            <th>사업자번호</th>
	                            <th>법인번호</th>
	                            <th>업태</th>
	                            <th>종목</th>
	                        </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	
	    </div>
    </div>
</div>

<%@include file="../layout/bottom.jsp" %>
<script>
    let currentPage = 'dealCorp';

       // 목록
    let dealCorpTable = $('#dealCorpTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="/bm/dealCorpDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'dealCorpCd',
        columns: [
            { data: 'dealCorpCd' },
            { data: 'dealCorpNm' },
            { data: 'initial' },
            { data: 'presidentNm' },
            { data: 'country' },
            { data: 'corpNo' },
            { data: 'registNo' },
            { data: 'bizCond' }, 
            { data: 'bizType' }                                              
        ],
        columnDefs: [
            {
                //'targets': [0],
                //'orderable': false,
                //'searchable': false,
            },
        ],
        order: [
            [ 1, 'asc' ]
        ],

        buttons: [
            'copy', 'excel', 'pdf', 'print'
        ],
    });

    // 보기
    $('#dealCorpTable tbody').on('click', 'tr', function () {
    	var dealCorpCd = dealCorpTable.row( this ).data().dealCorpCd;
    	var dealCorpNm = dealCorpTable.row( this ).data().dealCorpNm;
        console.log("dealCorpCd = " + dealCorpCd);

        //url로 받은 get값들 찾기
        var getParameters = function (paramName) {
            // 리턴값을 위한 변수 선언
            var returnValue;

            // 현재 URL 가져오기
            var url = location.href;

            // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
            var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

            // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
            for (var i = 0; i < parameters.length; i++) {
                var varName = parameters[i].split('=')[0];
                if (varName.toUpperCase() == paramName.toUpperCase()) {
                    returnValue = parameters[i].split('=')[1];
                    return decodeURIComponent(returnValue);

                }
            }
        };

        //get으로 받은 변수(id)로 부모창에 전달
//         if(dealCorpCdUrl != null) {
// 			$(opener.document).find('#' + dealCorpCdUrl).val(dealCorpCd);
// 			$(opener.document).find('#' + dealCorpNmUrl).val(dealCorpNm);
//         } else {
			$(opener.document).find('#dealCorpCd').val(dealCorpCd);
			$(opener.document).find('#dealCorpNm').val(dealCorpNm);
//         } 	

		window.close();
    });
//         $.ajax({
//             url: '<c:url value="/bm/dealCorpData"/>',
//             type: 'GET',
//             data: {
//                 'dealCorpCd': dealCorpCd
//             },
//             success: function (res) {
//                 let data = res.data;

//                 $('#dealCorpCd').val(data.dealCorpCd);
//                 $('#dealCorpNm').val(data.dealCorpNm);
//                 $('#initial').val(data.initial);
//                 $('#presidentNm').val(data.presidentNm);
//                 $('#country').val(data.country);
//                 $('#corpNo').val(data.corpNo);
//                 $('#registNo').val(data.registNo);
//                 $('#bizCond').val(data.bizCond);
//                 $('#bizType').val(data.bizType);
//                 $('#addrNo').val(data.addrNo);
//                 $('#addrBase').val(data.addrBase);
//                 $('#addrDtl').val(data.addrDtl);
//                 $('#telNo').val(data.telNo);
//                 $('#faxNo').val(data.faxNo);
//                 $('#emailAddr').val(data.addrDtl);
//                 $('#tax').val(data.tax);
//                 $('#officeChrger').val(data.officeChrger);
//                 $('#bizChrger').val(data.bizChrger);
//                 $('#dealGubun').val(data.dealGubun);
//                 $('#useYnCd').val(data.useYnCd);
//                 $('#dealCorpDesc').val(data.dealCorpDesc);
//             }        
//         });
   


   	
</script>

</body>
</html>
