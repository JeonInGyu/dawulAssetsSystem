<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<header class="clear">
	<div class="left cm"><h1><a href="../../index.jsp" onclick=""></a></h1></div>
	<div class="right cr">
		<ul class="clear">
			<li class="member cm">${admin}  님이 접속하셨습니다.</li>
            <li class="home"><a href="../../index.jsp" onclick=""></a></li>
            <li class="logout"><a href="../../login/logoutProc.jsp" onclick=""></a></li>
            <c:choose> 
                <c:when test="${authorityCode == 4 }">
            		<li class="admin"><a href="../../admin/admin.jsp?pageNo=1" onclick=""></a></li>
            	</c:when>
                 <c:otherwise>
					<li class="admin"><a href="../../login/myStatusInfo.jsp" onclick=""></a></li>                 
                 </c:otherwise>
              </c:choose>
		</ul>
	</div>
</header>