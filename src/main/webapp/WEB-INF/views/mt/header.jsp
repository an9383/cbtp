<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<body>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
	<header>
		<div class="container-fluid" style="height: 35px;
											background-color: #181b1f;
											border-bottom: 1px solid #55555550;
											padding: 0px 5px;">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		        <div id="headerSubName" class="d-flex align-items-center text-decoration-none" style="font-size: 20px;"></div>
				<%-- <div class="dropdown text-end">
					<a href="#" class="d-block link-dark text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-gear" style="font-size: 25px; color: #ffffff;"></i>
					</a>
					<ul class="dropdown-menu text-small">
						<li><a class="dropdown-item" href="#" onClick="window.location.reload()">새로고침</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/main">MES 이동</a></li>
						<c:forEach var="menuList" items="${userAuth}">
							<c:if test="${menuList.upperMenuId == 'M00363'}">
								<li><a class="dropdown-item" href="<c:url value="${menuList.menuPath}"/>">${menuList.menuNm}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div> --%>
			</div>
	    </div>
	</header>