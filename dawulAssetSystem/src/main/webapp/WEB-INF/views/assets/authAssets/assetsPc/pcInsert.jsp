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
	
	<link rel="stylesheet" href="<c:url value="/resources/static/plugin/jquery-ui.min.css" />">
	<script src="<c:url value="/resources/static/plugin/jquery-ui.min.js" />"></script>
	<script src="<c:url value="/resources/static/plugin/datepicker-ko.js" />"></script>
	
	<script type="text/javascript">
	    $(document).ready(function() {
	    	datePicker();
	    	
	        $(".scrollbar").mCustomScrollbar({
	            scrollInertia:100,
	            mouseWheel:{scrollAmount:180}
	        });
	    });
	    
	    function pcSpanTxtChange1(mode, maincate_pc_code){
	    	$("#pcMenu1 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt1").text($(e).children('a').text());
	    			
	    			
					document.getElementById("maincate_pc_code").value = maincate_pc_code;
	    		}
	    	});
	    }
	    function pcSpanTxtChange2(mode, area_Code, area_Name){
	    	$("#pcMenu2 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt2").text($(e).children('a').text());
	    			
	    			document.getElementById("area_Code").value = area_Code;
	    			document.getElementById("area_Name").value = area_Name;
	    		}
	    	});
	    }
	    function pcSpanTxtChange3(mode, assetsCode, assetsName){
	    	$("#pcMenu3 > li").each(function(index,e) {
	    		if(index==mode) {
	    			$("#pcSpanTxt3").text($(e).children('a').text());
	    			
	    			document.getElementById("assets_Code").value = assetsCode;
	    			document.getElementById("assets_kinds").value = assetsName;
	    		}
	    	});
	    }
	    
	    function datePicker(){
	    	$("#purchase_Data").datepicker();
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
            <h2>PC 현황 – 추가<span></span></h2>
            <!-- //title -->
	       	
	       	<!-- content -->
            <div class="content2 mCustomScrollbar scrollbar" data-mcs-theme="minimal-dark"><!-- 스트롤 영역 --><!-- LJW : 현 페이지에서는 class="content2"로 사용 -->
            	<!-- table --> 
                <div class="border d_form">
					<form id="pcInsert" name="pcInsert" action="" method="post">
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
                                	<tr>
                                		<td><span class="color3">대분류 *</span></td>
                                		<td class="tl">
                                			<div class="dropdown3">
                                				<div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt1" class="txt">선택해주세요.</span><span class="caret"></span></div>
                                				<div class="dropdown-menu3">
                                					<ul id="pcMenu1">
														<c:forEach items="${pcMainCateList}" var="pcMainCateList" varStatus="pcMainCateStatus">
															<c:if test="${pcMainCateList.maincate_pc_name != '통계'}">                                					
                                								<li><a href="javascript:void(0);" onclick="pcSpanTxtChange1(${pcMainCateStatus.count-2},${pcMainCateList.maincate_pc_code})">${pcMainCateList.maincate_pc_name}</a></li>
                                							</c:if>
                                						</c:forEach>
                                						<input type="text" style="display:none" id="maincate_pc_code" name="maincate_pc_code" value="1">
                                					</ul>
                                				</div>
                                			</div>
                                		</td>
                                		<td></td>
                                	</tr>
                                	<tr>
                                		<td><span class="color3">군 *</span></td>
                                		<td class="tl">
                                			<div class="dropdown3">
                                				<div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt2" class="txt">선택해주세요.</span><span class="caret"></span></div>
                                				<div class="dropdown-menu3">
                                					<ul id="pcMenu2">
                                						<c:forEach items="${pcAreaCateList}" var="pcAreaCateList" varStatus="pcAreaCateStatus">
                                							<li><a href="javascript:void(0);" onclick="pcSpanTxtChange2(${pcAreaCateStatus.count-1}, ${pcAreaCateList.area_Code}, '${pcAreaCateList.area_name}')">${pcAreaCateList.area_name}</a></li>
                                						</c:forEach>
                                						<input style="display:none" id="area_Code" name="area_Code" value="1">
                                						<input style="display:none" id="area_Name" name="area_Name" value="업무망">
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
                                				<div class="drop_btn cl" data-toggle="dropdown"><span id="pcSpanTxt3" class="txt">선택해주세요.</span><span class="caret"></span></div>
                                				<div class="dropdown-menu3">
                                					<ul id="pcMenu3">
                                						<c:forEach items="${pcSubCateList}" var="pcSubCateList" varStatus="pcSubCateStatus">
                                							<li><a href="javascript:void(0);" onclick="pcSpanTxtChange3(${pcSubCateStatus.count-1}, '${pcSubCateList.assets_Code}', '${pcSubCateList.assets_kinds}')">${pcSubCateList.assets_kinds}</a></li>
                                						</c:forEach>
                                						<input style="display:none" id="assets_Code" name="assets_Code" value="DW-DEV-101-D00">
                                						<input style="display:none" id="assets_kinds" name="assets_kinds" value="데스크탑">
                                					</ul>
                                				</div>
                                			</div>
                                		</td>
                                		<td></td>
                                	</tr>
									<tr>
                                        <td><span class="color3">모델명</span></td><!-- LJW : class="color3" -->
                                        <td class="tl">
                                            <input type="text" id="model_Name" name="model_Name" class="cl" placeholder="" value="조립PC">
                                            <p>(예) 조립PC, LG gram</p>
                                        </td>
                                        <td></td>
                                    </tr>                                	
                                	<tr>
                                        <td><span class="color3">CPU *</span></td>
                                       	<td class="tl">
                                       		<input type="text" id="cpu" name="cpu" class="cl" placeholder="" value=" Intel(R)">
                                       		<p>예) Intel(R) Core(TM) i7 CPU 860 @ 2.80GHz (제조사 : GenuineIntel)<p>
                                       	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">메모리 *</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="memory" name="memory" class="cl" placeholder="" value="1000M">
                                            	<p>예) 8,183M<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">메인보드 *</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="mainBoard" name="mainBoard" class="cl" placeholder="" value="P55A-UD3R">
                                            	<p>예) P55A-UD3R (제조사 : Gigabyte Technology Co., Ltd.)<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><span class="color3">비디오 카드 *</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="videoCard" name="videoCard" class="cl" placeholder="" value="ATI Radeon HD 4800">
                                            	<p>예) ATI Radeon HD 4800 Series<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">하드디스크 *</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="hardDisk" name="hardDisk" class="cl" placeholder="" value="Model No.1 : WDC WD3200AAJS-00L7A0">
                                            	<p>예) Model No.1 : WDC WD3200AAJS-00L7A0, Type : IDE, Size : 298GB|Model No.2 : TOSHIBA THNSNJ128GCSU, Type : IDE, Size : 119GB	<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">디스크 용량 *</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="diskVolume" name="diskVolume" class="cl" placeholder="" value="C Drive : 총 용량 : 122,101MB">
                                            	<p>예) C Drive : 총 용량 : 122,101MB 사용가능용량 : 67,305MB 드라이브포맷 : NTFS|D Drive : 총 용량 : 305,242MB 사용가능용량 : 305,081MB 드라이브포맷 : NTFS<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">MAC 주소*</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="user_Mac" name="user_Mac" class="cl" placeholder="" value="-">
                                            	<p>경고) MAC 주소가 정확하게 일치하지 않는 PC자산은 폐기로 이동됩니다.<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">구매처</span></td>
                                        	<td class="tl">
                                            	<input type="text" id="purchase_Space" name="purchase_Space" class="cl" placeholder="" value="11번가">
                                            	<p>예) 11번가, G마켓<p>
                                        	</td>
                                        <td></td>
                                    </tr>
                                	<tr>
                                        <td><span class="color3">구매날짜</span></td>
                                        	<td class="tl">
                                            	<input onclick="datePicker();" type="text" id="purchase_Data" name="purchase_Data" class="cl" value="" placeholder="클릭하세요.">
                                        	</td>
                                        <td></td>
                                    </tr>
									<tr>
                                        <td><span class="color3">메모</span></td>
                                        <td class="memo tl">
                                            <label for="">입력</label>
                                            <textarea id="createMemo" name="memo"></textarea>
                                            <input style="display:none" type="text" id="memo" class="cl" placeholder="" value="">
                                        </td>
                                        <td></td>
                                    </tr>                                	
                                </tbody>
							</table>
						</fieldset>
					</form>	                
                </div>
                
                <!-- btn -->
                <div class="btn2 cm">
                    <ul class="clear">
                        <!-- <li class="btn_A cm" onclick="document.getElementById('pcInsert').submit();">추가</li> -->
                        <li class="btn_A cm" onclick="document.getElementById('pcInsert').submit();">추가</li>
                        <li class="blank"></li>
                        <li class="btn_F cm" onclick="location.href = ''">목록</li>
                    </ul>
                </div>
                <!-- //btn -->
            </div>
	       	
        </section>
    
    </div>
</div>
</body>
</html>