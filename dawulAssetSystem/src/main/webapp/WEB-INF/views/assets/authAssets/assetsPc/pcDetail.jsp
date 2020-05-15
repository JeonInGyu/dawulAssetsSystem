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
        	<div>
		    	<div class="dropdown left">
		    		<div onclick="" class="drop_btn cl" data-toggle="dropdown" tabindex="0"><span class="txt">자산 현황</span><span class="caret"></span></div>
		    		<div class="dropdown-menu">
						<ul>
							<li><a href="../../authUse/use.jsp?asideCateCode=1&pageNo=1" onclick="">사용 현황</a></li>
                       		<li><a href="../assetsPc/pc.jsp?asideCateCode=0&pageNo=1" onclick="">자산 현황</a></li>
                       		<li><a href="../../authRental/authRentalStatus/rental.jsp?pageNo=1" onclick="">출납 현황</a></li>
						</ul>	    		
		    		</div>
		    	</div>
		    	<div class="pipe"></div>
		    	<div class="dropdown left2">
		             <div class="drop_btn cl" data-toggle="dropdown" tabindex="0"><span class="txt">PC 현황</span><span class="caret"></span></div>
		             <div class="dropdown-menu">
		                 <ul>
		                   	<li><a href="../assetsPc/pc.jsp?asideCateCode=0&pageNo=1" onclick="">PC 현황</a></li>
		                     <li><a href="../assetsEmployee/employee.jsp?asideCateCode=0&pageNo=1" onclick="">직원 현황</a></li>
		                     <li><a href="../assetsIp/ip.jsp" onclick="">IP 현황</a></li>
		                     <li><a href="../assetsEquipment/equipment.jsp?asideCateCode=0&pageNo=1" onclick="">장비 현황</a></li>
		                     <li><a href="../assetsSoftware/software.jsp?asideCateCode=0&pageNo=1" onclick="">소프트웨어 현황</a></li>
		                 	<li><a href="../authRentalManager/rentalEquipmentMng.jsp?pageNo=1" onclick="">장비 출납 관리</a></li>
		                 </ul>
		             </div>
		         </div>
	       	</div>
	       	
    		<!-- title -->
            <h2>PC 현황 – 상세<span></span></h2>
            <!-- //title -->
	       	
	       	   <!-- content -->
            <div class="content2 mCustomScrollbar scrollbar" data-mcs-theme="minimal-dark"><!-- 스트롤 영역 --><!-- LJW : 현 페이지에서는 class="content2"로 사용 -->
            	 <!-- table --> 
                <div class="border d_form">
                	<form id="pcUpdate" name="pcUpdate" action="" method="post">
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
                                                <div class="drop_btn cl" data-toggle="dropdown"><span id="spanTxt1" class="txt">${pcDetailList.maincate_pc_name}</span><span class="caret"></span></div>
                                                <div class="dropdown-menu3">
                                                <ul id="">
                                                	<c:forEach items="${pcMainCateList}" var="pcMainCateList">
                                               	 		<li><a href="javascript:void(0);" onclick="">${pcMainCateList.maincate_pc_name}</a></li>
                                               	 	 </c:forEach>
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
                                        		<div class="drop_btn cl" data-toggle="dropdown"><span id="spanTxt1" class="txt">${pcDetailList.area_name}</span><span class="caret"></span></div>
                                        		<div class="dropdown-menu3">
                                        			<ul id="">
	                                       				<c:forEach items="${pcAreaCateList}" var="pcAreaCateList">
	                                               	 		<li><a href="javascript:void(0);" onclick="">${pcAreaCateList.area_name}</a></li>
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
                                       			<div class="drop_btn cl" data-toggle="dropdown"><span id="spanTxt1" class="txt">${pcDetailList.assets_kinds}</span><span class="caret"></span></div>
                                        		<div class="dropdown-menu3">
                                        			<ul id="">
	                                       				<c:forEach items="${pcSubCateList}" var="pcSubCateList">
	                                               	 		<li><a href="javascript:void(0);" onclick="">${pcSubCateList.assets_kinds}</a></li>
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
                                        <td class="tl"><span class="color4" id="">${pcDetailList.cpu}</span></td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">메모리</span></td>
                                        <td class="tl"><span class="color4" id="">${pcDetailList.memory}</span></td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">메인보드</span></td>
                                        <td class="tl"><span class="color4" id="">${pcDetailList.mainBoard}</span></td>
                                        <td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">비디오카드</span></td>
                                        <td class="tl"><span class="color4" id="">${pcDetailList.videoCard}</span></td>
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
                    	<li class="btn_A cm" onclick="">수정</li>
                       	<li class="blank"></li>
                       	<li class="btn_B cm" onclick="">삭제</li>
                        <li class="blank"></li>
                        <li class="btn_F cm" onclick="location.href=''">목록</li>
                    </ul>
                </div>
                <!-- //btn -->
            </div>
        </section>
    
    </div>
</div>
</body>
</html>