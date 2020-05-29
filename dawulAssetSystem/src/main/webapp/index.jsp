<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
<body style="overflow: hidden;">
	<!-- wrap -->
	<div id="wrap">
		<div class="login">
		<div class="con">
            <div class="title">다울 업무운영 장비관리시스템</div>
            <div class="txt">아이디/비밀번호를 입력하세요.</div>
            <form id="login" name="login" action="/assets/main" method="post">
                <ul class="account d_form clear">
                    <li>
                        <label for="">아이디 입력</label>
                        <input type="text" id="id" name="id" value="" class="cl" placeholder="아이디" onkeydown="if(event.keyCode == 13){document.getElementById('login').submit();}">
                    </li>
                    <li>
                        <label for="">비밀번호 입력</label>
                        <input type="password" id="pwd" name="pwd" value="" class="cl" placeholder="비밀번호" onkeydown="if(event.keyCode == 13){document.getElementById('login').submit();}">
                    </li>
                    <li class="btn cm"><a href="javascript:login.submit();" onclick=""><span>로그인</span></a></li>
                </ul>
            </form>
        </div>
		<!-- inventory open -->
        <!-- <div class="con">
            <div class="title">장비 출납 신청</div>
            <div class="txt">장비 출납 시 신청하기 버튼을 눌러주세요.</div>
            <form>
                <ul class="account d_form clear">
                    <li class="btn bg_btn cm"><a href="javascript:openInventory();" onclick=""><span>신청하기</span></a></li>
                </ul>
            </form>
        </div> -->	
		<!-- //inventory open -->
        <div class="copyright">© Dawul Company Corp.</div>
		</div>
	</div>
	
</body>
</html>
