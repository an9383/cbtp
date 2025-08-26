<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<c:set var="today" value="<%=new Date()%>"/>
<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" var="today" />
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" var="tomorrow" />
<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
<fmt:formatDate value="${yesterday}" type="DATE" pattern="yyyy-MM-dd" var="yesterday" />
<c:set var="sevenDaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*7*1000)%>"/>
<fmt:formatDate value="${sevenDaysAgo}" type="DATE" pattern="yyyy-MM-dd" var="sevenDaysAgo" />

<%@include file="../layout/body-top.jsp" %>

<div class="page">
    <div class="page-inner">
        <div class="row">
            <div class="col-md-6 bg-wh">
                <div class="page-section">
                    <form id="searchForm" class="form-inline mb-1">
                        <div class="form-row">
							<input type="date" class="form-control form-control-sm ml-1" name="searchStartDate" value="${sevenDaysAgo}">
							~
							<input type="date" class="form-control form-control-sm ml-1" name="searchEndDate" value="${today}">
							<input type="text" class="form-control form-control-sm ml-1" name="contact_name" placeholder="사용자명 검색" style="width: 120px;">
                            <button type="button" class="btn btn-xs btn-info ml-1" id="btnSearch">조회</button>
							<button type="button" class="btn btn-xs btn-secondary ml-1" id="btnSearchClear">취소</button>
                        </div>
                    </form>
                    <table id="loginTable" class="table table-bordered table-hover" style="width:100%;">
                        <thead>
                        	<tr>
                        		<th>번호</th>
                        		<th>사용자명</th>
                        		<th>유형</th>
                        		<th>IP주소</th>
                        		<th>시간</th>
                           	</tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <!-- /.page-section -->
            </div>
            
            <!-- 사이드 페이지 -->
            <div class="col-md-6">
            	<!-- 
                <div class="side-section">

                </div>
                 -->
            </div>
        </div>
    </div>
</div>

<%@include file="../layout/bottom.jsp" %>
<%@include file="../layout/script_search.jsp" %>
<%@include file="../layout/script.jsp" %>
<script>	
    let currentPage = 'smSc0120';
    $('#'+currentPage+'Menu').closest('.has-child','li').addClass('has-open');
    $('#'+currentPage+'Menu').css('color','#0000FF');

    let loginTable = $('#loginTable').DataTable({
		dom : '<"top">rt<"bottom"p><"clear">',
		language: lang_kor,
		paging: true,
		pageLength: 20,
        pagingType: 'full_numbers',
        info: true,
		ordering: true,
		processing: true,
		autoWidth: false,
        ajax: {
            url: '<c:url value="/login/list"/>',
            type: 'GET',
            data: function(d) {
                // 시작날짜
                if ($('#searchForm input[name=searchStartDate]').val()) {
                    d.searchStartDate = $('#searchForm input[name=searchStartDate]').val().replaceAll('-', '');
                }

                // 종료날짜
                if ($('#searchForm input[name=searchEndDate]').val()) {
                    d.searchEndDate = $('#searchForm input[name=searchEndDate]').val().replaceAll('-', '');
                }

                // 사용자명 검새
                if ($('#searchForm input[name=contact_name]').val()) {
                    d.contact_name = $('#searchForm input[name=contact_name]').val();
                }
                
            },
        },
        rowId: 'login_no',
        columns: [
            { data: 'login_no' },
            { data: 'contact_name' },
            {
            	render: function(data, type, row) {
                    if (row['gubun']=="login") {
                        return '로그인';
                    } else {
                        return '로그아웃';
                    }
                }
            },
            {
            	render: function(data, type, row) {
                    if (row['ip_addr']) {
                        return row['ip_addr'];
                    } else {
                        return '';
                    }
                }
            },
            {
                render: function(data, type, row) {
                    return moment(row['save_date']+""+row['save_time'],'YYYYMMDDHHmmss').format('YYYY-MM-DD HH:ss');
                }
            },
        ],
        order: [
            [ 0, 'desc' ]
        ],
        initComplete: function(settings, json) {
        },
    });
</script>
</body>


</html>
