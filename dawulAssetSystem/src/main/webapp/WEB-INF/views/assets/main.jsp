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
<body class="m_bg">
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
   		<header class="clear">
   			<div class="left bg_l cm"><h1><a href="javascript:void(0);" onclick=""></a></h1></div>
        <div class="right bg_r cr">
            <ul class="clear">
                <li class="member color cm">${admin.id} 님이 접속하셨습니다.</li>
                <li class="logout ico"><a href="/" onclick=""></a></li>
                <c:choose> 
                <c:when test="${authorityCode == 4 }">
                	<li class="admin ico2"><a href="admin/admin.jsp?pageNo=1" onclick=""></a></li>
                 </c:when>
                 <c:otherwise>
        			<li class="admin ico2"><a href="" onclick=""></a></li>
        		  </c:otherwise>
        		</c:choose>
            </ul>
        </div>
   		</header>
   		<!-- //header -->
   		<!-- container -->
    	<div id="container2">
   			<div class="m_word">
	            <p>사용하고자 하는 서비스를 선택하세요.</p>
	            <p>단, 부여받은 권한의 사용만 가능합니다.</p>
        	</div>
        	<ul class="m_menu cm clear">
            <li>
                <span class="ico use"></span>
                <p class="txt">Usage Status</p>
                <p class="txt2">사용 현황</p>
                <span class="line"></span>
                <span id="useStatusIndex" class="btn cm"><a id="useStatusIndexLink" href="" onclick=""><span>바로가기</span></a></span>
            </li>
            <li>
                <span class="ico assets"></span>
                <p class="txt">Asset Status</p>
                <p class="txt2">자산 현황</p>
                <span class="line"></span>
                <span id="assetsStatusIndex" class="btn cm"><a id="assetsStatusIndexLink" href="/assets/pcList?pageNo=1&asideCateCode=1&searchWord=" onclick=""><span>바로가기</span></a></span>
            </li>
            <li>
                <span class="ico cashier"></span>
                <p class="txt">Cashier Status</p>
                <p class="txt2">출납 현황</p>
                <span class="line"></span>
                <span id="rentalStatusIndex" class="btn cm"><a id="rentalStatusIndexLink" href="" onclick=""><span>바로가기</span></a></span>
            </li>
        </ul>
        	
   		</div>
	</div>
</body>
</html>