<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<aside>
	<ul class="mn">
		<c:if test="${assetsTitle == 'PC'}">
			<c:forEach items="${pcMainCateList}" var="pcMainCateList">
				<!-- snb -->
				 <c:choose> 
	                <c:when test="${pcMainCateList.maincate_pc_code == asideCateCode}">
		    			<li class="on"><a href="/assets/pcList?asideCateCode=${pcMainCateList.maincate_pc_code}&pageNo=1&searchWord=" onclick="">${pcMainCateList.maincate_pc_name}</a></li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="off"><a href="/assets/pcList?asideCateCode=${pcMainCateList.maincate_pc_code}&pageNo=1&searchWord=" onclick="">${pcMainCateList.maincate_pc_name}</a></li>
		    		</c:otherwise>
		    	</c:choose>
			</c:forEach>
		</c:if>
    </ul>
</aside>