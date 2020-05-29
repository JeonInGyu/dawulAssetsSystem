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
				  
	        checked();
	    });
	    
	    function search(asideCateCode){
	    	var searchWord = document.getElementById("searchWord").value;
	    	
	    	location.href = "/assets/pcSearchList?" + "&asideCateCode=" + asideCateCode + "&pageNo=1&searchWord=" + searchWord;				    	
	    }
	    
	    /* 체크박스 전체선택, 전체해제 */
	    function checkBoxAll(){
	          if( $("#th_checkAll").is(':checked') ){
	            $("input[name=pcCheckBox]").prop("checked", true);
	          }else{
	            $("input[name=pcCheckBox]").prop("checked", false);
	          }
	    }

	    function checked(){
	        $('.checks').click(function(event) {
	            var children = $(this).children().attr('id');
	            
	            if($("#" + children).is(":checked")){
	            	$("#" + children).prop("checked", false);
	            }else{
	            	$("#" + children).prop("checked", true);
	            }
	        });
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
	        <c:forEach items="${pcMainCateList}" var="pcMainCateList">
	        	<c:choose> 
	        		<c:when test="${pcMainCateList.maincate_pc_code == asideCateCode}">
						<h2 id="pcTitleSpan">PC 현황(${pcMainCateList.maincate_pc_name}) – 리스트<span></span><span></span></h2>	        		
	        		</c:when>
	        	</c:choose>
	        </c:forEach>
	         
	         <!-- 장비 사용 현황 -->
	         <c:forEach items="${pcSideCount}" var="pcSideCount" end="1">
		        <div class="device"> 
		         	검색 결과 중 사용 - <span class="color">총(${pcSideCount.pcTotalCount} 개)</span> : <span class="color2">등록(${pcSideCount.pcRTCount} 개)</span> / <span class="color3">미등록(${pcSideCount.pcRFCount} 개)</span><br>
	            	PC - <span class="color">데스크탑</span> : <span>총 ${pcSideCount.pcDesktopCount}개 </span> , <span class="color">노트북 </span> : <span>총 ${pcSideCount.pcNoteBookCount} 개 </span><br>
		        </div>
	        </c:forEach>
	        <!-- //장비 사용 현황 -->
	        
            <div class="guide">
                <div class="dropdown4">
                    <div class="drop_btn" data-toggle="dropdown"></div>
                    <div class="dropdown-menu4">
                        <div class="arrow"></div>
                        <ul class="clear">
                            <li class="txt">주의 사항</li>
                            <li class="stxt">* PC는 업무용, 보조용, 서버, 미분류, 폐기로 나뉘어 있습니다.</li>
                            <li class="stxt">* 리스트를 클릭하시면 상세정보를 확인하실 수 있습니다. </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 가이드 -->
            
     	    <!-- search -->
            <div class="search clear">
                <div class="dropdown2">
                    <div class="drop_btn cl" data-toggle="dropdown" tabindex="0"><span id="spanTxt1" class="txt">전체</span></div>
                </div>
                <!-- //select -->
                <!-- input -->
                <div class="fl d_form">
                    <form id="pcSearchList" name="pcSearchList" action="" method="get">
                        <fieldset>
                            <legend>검색</legend>
                            <label for="">검색어 입력</label>
                    		<input type="text" id="searchWord" name="searchWord" class="cl" value="${searchWord}" placeholder="검색어를 입력하세요." onkeydown="javascript:if(event.keyCode==13)form.submit();">
                    		<button type="button" onclick="search(${asideCateCode});"></button>
                        </fieldset>
                    </form>
                </div>
                <!-- //input -->
            </div>
            <!-- //search -->
	         
	        <div class="btn">
	         	<ul class="clear">
	         		<li class="btn_A cm" onclick="location.href = '/assets/pcInsertList'">추가</li>
                    <li class="blank"></li>
                    <li class="btn_B cm" onclick="document.getElementById('pcMultiDelete').submit();">삭제</li>
                   	<li class="blank"></li>
                   	<li class="btn_E cm" onclick="location.href = '">엑셀</li>
                    <li class="blank"></li>
                    <li class="btn_F cm" onclick="">새로고침</li>
	         	</ul>
	        </div>
	         
	         <div class="content3 mCustomScrollbar scrollbar" data-mcs-theme="minimal-dark"><!-- 스트롤 영역 -->
	         
	         	 <!-- table --> 
	         	 <div class="border">
					<form id="pcMultiDelete" name="pcMultiDelete" action="/assets/pcMultiDelete" method="post">
						<table class="type">
							<caption></caption>
							<colgroup>
                                <!-- 01 --><col style="max-width:3%;">
                                <!-- 02 --><col style="width:5%;">
                                <!-- 03 --><col style="width:5%;">
                                <!-- 04 --><col style="width:6%;">
                                <!-- 05 --><col style="width:;">
                                <!-- 06 --><col style="width:6%;">
                                <!-- 07 --><col style="width:17%;">
                                <!-- 08 --><col style="width:17%;">
                                <!-- 09 --><col style="width:7%;">
                                <!-- 10 --><col style="width:6%;">
                                <!-- 11 --><col style="max-width:3%;">
                            </colgroup>
							<thead>
	                            <tr>
	                            	<th scope="col" class="num"><span>번호</span></th><!-- 번호는 항상 class="num" 사용 -->
	                            	<th scope="col" class="cursor"><span>pc 코드</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>군</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>종류</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>CPU</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>메모리</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>메인보드</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>비디오카드</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>모델명</span><i class="t"></i></th>
	                            	<th scope="col" class="cursor"><span>등록여부</span><i class="t"></i></th>
	                            	<!-- <th scope="col" class="check"><span>삭제</span></th> -->
	                            	<th scope="col" class="check"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkBoxAll()"/></th>
	                            </tr>
	                        </thead>
							<tbody>
								<c:forEach items="${pcList}" var="pcList"  varStatus="status">
									<tr onclick="location.href = '/assets/pcDetail?pcCode=${pcList.pc_code}&asideCateCode=${asideCateCode}&regist_Flag=${pcList.regist_Flag}'" style="cursor: pointer;">
										<td><span>${status.index + 1}</span></td>
										<td><span>${pcList.pc_code}</span></td>
										<td><span>${pcList.area_name}</span></td>
										<td><span>${pcList.sub_category}</span></td>
										<td><span>${pcList.cpu}</span></td>
										<td><span>${pcList.memory}</span></td>
										<td><span>${pcList.mainBoard}</span></td>
										<td><span>${pcList.videoCard}</span></td>
										<td><span>${pcList.model_Name}</span></td>
										<c:choose> 
		        							<c:when test="${pcList.regist_Flag == 'T' && pcList.department1 != null && pcList.position1 != null}" >
												<td><span class="color2">사용 / ${pcList.department1} ${pcList.position1} ${pcList.name1}<br></span></td>
												<td><div class="checks"></div></td>
											</c:when>
											<c:when test="${pcList.regist_Flag == 'T' && pcList.department1 != null}" >
												<td><span class="color2">사용 / ${pcList.department1}<br></span></td>
												<td><div class="checks"></div></td>
											</c:when>
											<c:when test="${pcList.regist_Flag == 'T' && pcList.department2 != null && pcList.position2 != null}" >
												<td><span class="color2">사용 / ${pcList.department2} ${pcList.position2} ${pcList.name2}<br></span></td>
												<td><div class="checks"></div></td>
											</c:when>
											<c:when test="${pcList.regist_Flag == 'T' && pcList.department2 != null}" >
												<td><span class="color2">사용 / ${pcList.department2}<br></span></td>
												<td><div class="checks"></div></td>
											</c:when>
											<c:otherwise>
												<td><span class="color">미사용</span></td>
												<td onclick="event.cancelBubble = true;"><div class="checks"><input id="checkbox${status.index}" type="checkbox" name="pcCheckBox" value="${pcList.pc_code}"><label></label></div></td>
											</c:otherwise>
										</c:choose>
								</tr>
								</c:forEach>
							</tbody>
							
						</table>
					</form> 	 
	         	 </div>
	         	 <!-- //table -->
	         	 <!-- page -->
                <div class="page_bx">
                    <div class="page clear">
                    	<span class="off"><a href="" onclick="">&lt;&lt;</a></span>
                    	<c:if test="${prev}">
                        	<span class="off"><a href="/assets/pcList?asideCateCode=${asideCateCode}&pageNo=${startPageNum - 1}&searchWord=" onclick="">&lt;</a></span>
                        </c:if>
                        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
                        	<c:choose> 
       							<c:when test="${num == pageNo}">
       								<span class="on"><a href="/assets/pcList?asideCateCode=${asideCateCode}&pageNo=${num}&searchWord=" onclick="">${num}</a></span>
       							</c:when>
       							<c:otherwise>
       								<span class="off"><a href="/assets/pcList?asideCateCode=${asideCateCode}&pageNo=${num}&searchWord=" onclick="">${num}</a></span>
       							</c:otherwise>
       						</c:choose>
                        </c:forEach>
                        <c:if test="${next}">
          					<span class="off"><a href="/assets/pcList?asideCateCode=${asideCateCode}&pageNo=${endPageNum + 1}&searchWord=" onclick="">&gt;</a></span>
          				</c:if>
                     	<span class="off"><a href="" onclick="">&gt;&gt;</a></span>
                    </div>
                </div>
	         </div>
	         
	    </section>
	</div>
	
	<!-- footer -->
   	<jsp:include page="../../include/footer.jsp" flush="false"/>
	
</div>
</body>
</html>