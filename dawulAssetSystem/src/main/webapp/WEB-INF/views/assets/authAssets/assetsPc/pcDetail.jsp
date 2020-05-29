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
	    
	    function pcSpanTxtChange1(mode){
	    	$("#pcMenu1 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt1").text($(e).children('a').text());
	    		}
	    	});
	    }
	    function pcSpanTxtChange2(mode){
	    	$("#pcMenu2 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt2").text($(e).children('a').text());
	    		}
	    	});
	    }
	    function pcSpanTxtChange3(mode){
	    	$("#pcMenu3 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt3").text($(e).children('a').text());
	    		}
	    	});
	    }
	    
	    function createMemo(){
	    	var createMemo = "";
	    	if(document.getElementById("createMemo") != null){
	    		createMemo = document.getElementById("createMemo").value;
	    	}
	    	
	    	document.getElementById("memo").value = createMemo;
	    }
	    
    </script>
	
	<!-- 드롭다운 -->
	<script charset='UTF-8' src="<c:url value="/resources/static/plugin/bootstrap.min.js" />"></script>
	<!-- //드롭다운 -->
</head>
<body>
<!-- wrap -->
<div id="wrap">
	<!-- header -->
    <jsp:include page="../../include/header.jsp" flush="false"/>
    <!-- //header -->
    
     <!-- container -->
    <div id="container" class="clear">
    	
    	<!-- aside -->
    	<jsp:include page="../../include/aside.jsp" flush="false"/>
    	
    	<!-- section -->
        <section>
	       	<jsp:include page="../../include/header2.jsp" flush="false"/>
	       	
    		<!-- title -->
            <h2>PC 현황 – 상세<span></span></h2>
            <!-- //title -->
	       	
	       	   <!-- content -->
            <div class="content2 mCustomScrollbar scrollbar" data-mcs-theme="minimal-dark"><!-- 스트롤 영역 --><!-- LJW : 현 페이지에서는 class="content2"로 사용 -->
            	 <!-- table --> 
                <div class="border d_form">
                	<form id="pcUpdate" name="pcUpdate" action="/assets/pcUpdate" method="post">
                		<fieldset>
                			 <legend></legend>
                			 <table class="type">
                			 	<thead>
                                    <tr>
                                        <th scope="col" class="kind"><span>타이틀</span></th>
                                        <th scope="col"><span>내용</span></th>
                                        <th scope="col" class="sbtn"><span></span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${pcDetailList}" var="pcDetailList">
                                	<tr>
                                		<td><span class="color3">PC 코드</span></td>
                                        <td class="tl"><span class="color4" id="">${pcDetailList.pc_code}</span></td>
                                        <td>
                                        	<div class="btn_C cm"><a href="javascript:void(0);" onclick="">이력</a></div><!-- 추가 버튼 : class="btn_C" -->
                                        </td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">대 분류</span></td>
                                        <td class="tl">
                                        	<div class="dropdown3">
                                                <div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt1" class="txt">${pcDetailList.maincate_pc_name}</span><span class="caret"></span></div>
                                                <div class="dropdown-menu3">
                                                <ul id="pcMenu1">
                                                	<c:choose> 
	        											<c:when test="${pcDetailList.regist_Flag == 'T'}" >
		                                                	<c:forEach items="${pcMainCateList}" var="pcMainCateList" varStatus="pcMainCateStatus">
		                                                		<c:if test="${pcMainCateList.maincate_pc_name != '통계'}">
		                                               	 			<li><a href="javascript:void(0);" onclick="pcSpanTxtChange1(${pcMainCateStatus.count-2})">${pcMainCateList.maincate_pc_name}</a></li>
		                                               	 		</c:if>
		                                               	 	 </c:forEach>
                                               	 	 	</c:when>
                                               	 	 	<c:otherwise>
                                               	 	 		<li><a href="javascript:void(0);" onclick="">사용현황 해제 후 변경 가능합니다.</a></li>
                                               	 	 	</c:otherwise>
                                               	 	 </c:choose>
                                                </ul>
                                                </div>
	                                        </div>
                                        </td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">군</span></td>
                                        <td class="tl">
                                        	<div class="dropdown3">
                                        		<div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt2" class="txt">${pcDetailList.area_name}</span><span class="caret"></span></div>
                                        		<div class="dropdown-menu3">
                                        			<ul id="pcMenu2">
	                                       				<c:forEach items="${pcAreaCateList}" var="pcAreaCateList" varStatus="pcAreaCateStatus">
	                                               	 		<li><a href="javascript:void(0);" onclick="pcSpanTxtChange2(${pcAreaCateStatus.count-1})">${pcAreaCateList.area_name}</a></li>
	                                               	 	</c:forEach>
                                        			</ul>
                                        		</div>
                                        	</div>
                                        </td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">종류</span></td>
                                        <td class="tl">
                                        	<div class="dropdown3">
                                       			<div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt3" class="txt">${pcDetailList.assets_kinds}</span><span class="caret"></span></div>
                                        		<div class="dropdown-menu3">
                                        			<ul id="pcMenu3">
	                                       				<c:forEach items="${pcSubCateList}" var="pcSubCateList" varStatus="pcSubCateStatus">
	                                               	 		<li><a href="javascript:void(0);" onclick="pcSpanTxtChange3(${pcSubCateStatus.count-1})">${pcSubCateList.assets_kinds}</a></li>
	                                               	 	</c:forEach>
                                        			</ul>
                                        		</div>
                                        	</div>
                                        </td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">모델명</span></td>
                                        <td class="tl"><span class="color4" id="">${pcDetailList.model_Name}</span></td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">CPU</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												<td class="tl"><span class="color4" id="">${pcDetailList.cpu}</span></td>
												<input style="display:none" type="text" id="cpu" name="cpu" class="cl" placeholder="직접입력" value="${pcDetailList.cpu}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="cpu" name="cpu" class="cl" placeholder="직접입력" value="${pcDetailList.cpu}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">메모리</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.memory}</span></td>
												<input style="display:none" type="text" id="memory" name="memory" class="cl" placeholder="직접입력" value="${pcDetailList.memory}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="memory" name="memory" class="cl" placeholder="직접입력" value="${pcDetailList.memory}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">메인보드</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.mainBoard}</span></td>
												<input style="display:none" type="text" id="mainBoard" name="mainBoard" class="cl" placeholder="직접입력" value="${pcDetailList.mainBoard}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="mainBoard" name="mainBoard" class="cl" placeholder="직접입력" value="${pcDetailList.mainBoard}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">비디오카드</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.videoCard}</span></td>
												<input style="display:none" type="text" id="videoCard" name="videoCard" class="cl" placeholder="직접입력" value="${pcDetailList.videoCard}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="videoCard" name="videoCard" class="cl" placeholder="직접입력" value="${pcDetailList.videoCard}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                		
                                        <td></td>
                                	</tr>
                                	
                                	<tr>
                                		<td><span class="color3">하드디스크</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.hardDisk}</span></td>
												<input style="display:none" type="text" id="hardDisk" name="hardDisk" class="cl" placeholder="직접입력" value="${pcDetailList.hardDisk}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="hardDisk" name="hardDisk" class="cl" placeholder="직접입력" value="${pcDetailList.hardDisk}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	
                                	<tr>
                                		<td><span class="color3">디스크 용량</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.diskVolume}</span></td>
												<input style="display:none" type="text" id="diskVolume" name="diskVolume" class="cl" placeholder="직접입력" value="${pcDetailList.diskVolume}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="diskVolume" name="diskVolume" class="cl" placeholder="직접입력" value="${pcDetailList.diskVolume}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	
                                	<tr>
                                		<td><span class="color3">MAC 주소</span></td>
                                		<c:choose> 
        									<c:when test="${asideCateCode != '2' && asideCateCode != '4'}" >
												 <td class="tl"><span class="color4" id="">${pcDetailList.user_Mac}</span></td>
												<input style="display:none" type="text" id="user_Mac" name="user_Mac" class="cl" placeholder="직접입력" value="${pcDetailList.user_Mac}">                               		
                               				</c:when>
                               				<c:otherwise>
                               					<td class="tl"><input type="text" id="user_Mac" name="user_Mac" class="cl" placeholder="직접입력" value="${pcDetailList.user_Mac}"></td>
                               				</c:otherwise>				
                           				</c:choose>
                                        <td></td>
                                	</tr>
                                	
                                	<tr>
                                        <td><span class="color3">구매처</span></td>
                                    	<td class="tl"><input type="text" id="purchase_Space" name="purchase_Space" class="cl" placeholder="직접입력" value="${pcDetailList.purchase_Space}"></td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><span class="color3">구매날짜</span></td>
                                    	<td class="tl"><input type="text" id="purchase_Data" name="purchase_Data" class="cl" placeholder="직접입력" value="${pcDetailList.purchase_Data}"></td>
                                        <td></td>
                                    </tr>
                                	
                                		<c:choose> 
        									<c:when test="${asideCateCode != '4'}" >
												 <input style="display:none" type="text" id="disposal_Data" name="disposal_Data" class="cl" placeholder="직접입력" value="${pcDetailList.disposal_Data}">
                               				</c:when>
                               				<c:otherwise>
                               					<tr>
                                				 	<td><span class="color3">폐기 날짜</span></td>
                               						<td class="tl"><input type="text" id="disposal_Data" name="disposal_Data" class="cl" placeholder="직접입력" value="${pcDetailList.disposal_Data}"></td>
                              						<td></td>
                                				</tr>
                               				</c:otherwise>				
                           				</c:choose>
                                	
                                	<tr>
                                        <td><span class="color3">메모</span></td>
                                        <td class="memo tl">
                                        	<label for="">입력</label>
                                            <textarea id="createMemo" name="memo"></textarea>
                                            <input style="display:none" type="text" id="memo" class="cl" placeholder="" value="">
                                    	<td></td>
                                    </tr>    
                                	
                                	</c:forEach>
                                </tbody>
                                
                			 </table>
                			 
                		</fieldset>
                	</form>
                </div>
                
                 <!-- btn -->
                <div class="btn2 cm">
                    <ul class="clear">
                    	<li class="btn_A cm" onclick="createMemo(); document.getElementById('pcUpdate').submit();">수정</li>
                    	<c:forEach items="${pcDetailList}" var="pcDetailList" >
                       		<c:if test="${pcDetailList.regist_Flag == 'F'}">
                       			<li class="blank"></li>
                       			<li class="btn_B cm" onclick="location.href='/assets/pcDelete?asideCateCode=${asideCateCode}&pageNo=1&pcCode=${pcCode}&searchWord='">삭제</li>
                       		</c:if>
                       	</c:forEach>
                        <li class="blank"></li>
                        <li class="btn_F cm" onclick="location.href='/assets/pcList?asideCateCode=1&pageNo=1&searchWord='">목록</li>
                    </ul>
                </div>
                <!-- //btn -->
            </div>
        </section>
    
    </div>
</div>
</body>
</html>