<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<body>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
	<div class="container-fluid"
		style="position: relative; background-color: #111217;
			height: 100vh; width: 100vw;
			padding: 40px 0px 0px 0px;">
		
		<!-- 닫기 버튼 -->
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"
			style="position: absolute; top: 10px; right: 10px;
					color: #ffff00; cursor: pointer; font-size: 30px;"></i>
		<div class="row" style="background-color: #171823; height: calc(100vh - 45px); margin: 0px;">
        	<div class="col-md-12 mt-3" style="text-align:center;">
				<img src="data:image/jpg;base64," id="welcomeImg" style="height: 69rem;width: 100%;text-align:center;">
			</div>
		</div>
	</div>
<script>
	$('#headerMainName').text('환영문구(이미지)');
	$('#headerSubName').text('이미지');
	$.ajax({
		url: '<c:url value="mm/welcomeRead"/>',
	    type: 'POST',
		success : function(res) {
			let data = res.data;
			if(data.welcomeImg != null) {
				var blob = new Blob([base64ToArrayBuffer(data.welcomeImg)], { type: 'image' });
	    		var file = new File([blob], 'img', { lastModified: new Date().getTime(), type: 'image' });
				$('#welcomeImg').attr('src','data:image/jpg;base64,'+getImgBase64(file));
			}
		}
	});
	
	// 이미지 파일 base64변환
	function getImgBase64(files) {
		var imgForm = new FormData();
		imgForm.append('file-0',files);
	
		var base64 = '';
		$.ajax({
	        url: '<c:url value="ut/getImgBase64"/>',
	        data: imgForm,
	        beforeSend: function() {
	            // $('#my-spinner').show();
	        },
	        processData: false,
	        contentType: false,
	        async: false,
	        type: 'POST',
	        success: function(res){
	            if(res.result == "ok"){ //응답결과
	            	base64 = res.data;
	            } else {
	            	toastr.error(res.message);
	        	}
	      },
	      error: function(xhr,textStatus,error){
	                              
	          console.log("textStatus: "+xhr.status+", error: "+error);
	          alert("예상치 못한 오류가 발생했습니다.");
	          
	      }
	    });
	    return base64;
	}
	
	function base64ToArrayBuffer(base64) {
	    const binaryString = window.atob(base64); // Comment this if not using base64
	    const bytes = new Uint8Array(binaryString.length);
	    return bytes.map((byte, i) => binaryString.charCodeAt(i));
		}
</script>
</body>
</html>