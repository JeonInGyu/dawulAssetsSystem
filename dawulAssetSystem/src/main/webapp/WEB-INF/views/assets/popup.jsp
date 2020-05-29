<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>다울 업무운영 장비관리시스템</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/static/css/default.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/static/css/layout.css" />">
	
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/static/plugin/jquery.mCustomScrollbar.css" />">
	<script charset='UTF-8' src="<c:url value="/resources/static/plugin/jquery-1.12.2.js" />"></script>
	<script charset='UTF-8' src="<c:url value="/resources/static/plugin/jquery.mCustomScrollbar.concat.min.js" />"></script>
	
	<script type="text/javascript">
	    $(document).ready(function() {
	        $(".scrollbar").mCustomScrollbar({
	            scrollInertia:100,
	            mouseWheel:{scrollAmount:180}
	        });
	    });
    </script>
	
	<!-- 드롭다운 -->
	<script charset='UTF-8' src="<c:url value="/resources/static/plugin/bootstrap.min.js" />"></script>
	<!-- //드롭다운 -->
</head>
<body>
	<c:if test="${msg == 1}">
		<!-- login fail alert -->
		<div id="loginFailAlert" class="pop_bg" style="">
		    <div class="p_alert">
		        <!-- title -->
		        <div class="title cl">
		            <span class="txt">알림</span>
		        </div>
		        <!-- //title -->
		        <!-- con -->
		        <div class="con cm">
		        	    아이디 또는 패스워드가 틀립니다.
		        </div>
		        <!-- //con -->
		        <!-- btn -->
		        <div class="btn cm">
		            <ul class="clear">
		                <li class="btn_A cm" onclick="location.href='/'">확인</li>
		            </ul>
		        </div>
		        <!-- //btn -->
		    </div>
		</div>
		<!-- //login fail alert -->
	</c:if>
	
	
</body>
</html>