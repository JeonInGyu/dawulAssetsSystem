<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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