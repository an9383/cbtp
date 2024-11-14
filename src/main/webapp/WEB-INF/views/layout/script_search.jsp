<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
    // 검색
    $("#searchForm input[name=contact_name]").keydown(function(key) {
        if (key.keyCode == 13) {
            $('#loginTable').DataTable().ajax.reload( function () {});
        }
    });

    // 검색
    $('#btnSearch').on('click', function(e) {
        $('#loginTable').DataTable().ajax.reload( function () {});
    });

    // 검색 취소
    $('#btnSearchClear').on('click',function() {
        $('#searchForm input[name=contact_name]').val('');
        $('#loginTable').DataTable().ajax.reload( function () {});
    });
</script>
