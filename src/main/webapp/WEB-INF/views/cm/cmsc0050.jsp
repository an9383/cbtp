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
	                <h5 class="page-title mr-sm-auto">&nbsp;&nbsp;자재코드목록</h5>
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
	                    <table id="matrlCdTable" class="table table-bordered">
	                        <thead>
	                        <tr>
                              <th> 자재시퀀스 </th>	                        
                              <th> 자재코드 </th>
                              <th> 자재명 </th>
                              <th> 이니셜 </th>
                              <th> 재질 </th>
                              <th> 구분(연질/경질) </th>
                              <th> 면취(압연)</th>
                              <th> 두께 </th>
                              <th> 폭 </th>
                              <th> 너비 </th>
                              <th> 길이 </th>
                              <th> 피치 </th>
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
    let currentPage = 'matrlCd';
	var matrlQuty = "${matrlQuty}"; 
		    
    // 목록
    let matrlCdTable = $('#matrlCdTable').DataTable({
        language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        ajax: {
            url: '<c:url value="/bm/matrlCdDataList"/>',
            type: 'GET',
            data: {
            },
            /*
            success : function(res) {
                console.log(res);
            }
            */
        },
        rowId: 'matrlSeq',
        columns: [
            { data: 'matrlSeq' },           
            { data: 'matrlCd' },
            { data: 'matrlNm' },
            { data: 'matrlInitial' },
            { data: 'qutyNm' },
            { data: 'gubunNm' },
            { data: 'chamferYnNm' },
            { data: 'thickness' },
            { data: 'depth' }, 
            { data: 'width' },
            { data: 'length' },                       
            { data: 'pitch' }                                              
        ],
        columnDefs: [
        	{ "targets": [0], "visible" : false },           
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
    $('#matrlCdTable tbody').on('click', 'tr', function () {
    	var matrlSeq = matrlCdTable.row( this ).data().matrlSeq;
        console.log("matrlSeq = " + matrlSeq);

        $.ajax({
            url: '<c:url value="/bm/matrlCdData"/>',
            type: 'GET',
            data: {
                'matrlSeq': matrlSeq
            },
            success: function (res) {
                let data = res.data;
                if(matrlQuty == "alni") {
					$(opener.document).find('#alni_matrlCd').val(data.matrlCd);
					$(opener.document).find('#alni_matrlNm').val(data.matrlNm);
					$(opener.document).find('#alni_qutyNm').val(data.qutyNm);
					$(opener.document).find('#alni_gubunNm').val(data.gubunNm); 
					$(opener.document).find('#alni_chamferYnNm').val(data.chamferYnNm)					             
					$(opener.document).find('#alni_thickness').val(data.thickness);
					$(opener.document).find('#alni_depth').val(data.depth);
					$(opener.document).find('#alni_length').val(data.length);
					$(opener.document).find('#alni_width').val(data.width);
					$(opener.document).find('#alni_pitch').val(data.pitch);
					$(opener.document).find('#alni_surfaceTrtmtNm').val(data.surfaceTrtmtNm);
                } else {
					$(opener.document).find('#film_matrlCd').val(data.matrlCd);
					$(opener.document).find('#film_matrlNm').val(data.matrlNm);
					$(opener.document).find('#film_qutyNm').val(data.qutyNm);
					$(opener.document).find('#film_gubunNm').val(data.gubunNm);
					$(opener.document).find('#film_chamferYnNm').val(data.chamferYnNm)						              
					$(opener.document).find('#film_thickness').val(data.thickness);
					$(opener.document).find('#film_depth').val(data.depth);
					$(opener.document).find('#film_length').val(data.length);
					$(opener.document).find('#film_width').val(data.width);
					$(opener.document).find('#film_pitch').val(data.pitch);
					$(opener.document).find('#film_pitch').val(data.pitch);
				}
				
				window.close();
            }
        });
    });

   	
</script>

</body>
</html>
