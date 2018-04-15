<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id = 'header'>
	<div id = "wrap-header-logo">
	<h1><a href="${pageContext.servletContext.contextPath }">BIT MALL</a></h1>
	</div>
	<%-- <div class = "menu-left">
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/product">Products</a></li>
			<li><a href="#">About</a></li>
		</ul>
	</div> --%>
	<div class="menu-right">
			<div class="info">
				<img src="${pageContext.servletContext.contextPath }/assets/images/info_icon.png">
				&nbsp;
				<c:choose>
				<c:when test="${empty authMember}">
				<ul class="info-list" style="display: none;">
					<li><a href="${pageContext.servletContext.contextPath }/member/login" class="xans-element- xans-layout xans-layout-statelogoff log ">LOGIN
					</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/member/join" class="xans-element- xans-layout xans-layout-statelogoff log ">JOIN
					</a></li>
					<li><a href="/myshop/index.html" class="xans-element- xans-layout xans-layout-statelogoff log ">MY PAGE </a></li>
					<li><a href="/myshop/order/list.html" class="xans-element- xans-layout xans-layout-statelogoff log ">주문조회 </a></li>
					<li></li>
					<li></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="info-list" style="display: none;">
					<li><a href="${pageContext.servletContext.contextPath }/member/logout" class="xans-element- xans-layout xans-layout-statelogoff log ">LOGOUT
					</a></li>
					<li><a href="/myshop/index.html" class="xans-element- xans-layout xans-layout-statelogoff log ">MY PAGE </a></li>
					<li></li>
					<li></li>
				</ul>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="bag">
				<img src="${pageContext.servletContext.contextPath }/assets/images/bag_icon.png">
				&nbsp;
				<ul class="info-list" style="display: none;">
					<li><a href="${pageContext.servletContext.contextPath}/cart" class="xans-element- xans-layout xans-layout-statelogoff log ">CART </a></li>
				</ul>
			</div>
			<div class="search">
				<img src="${pageContext.servletContext.contextPath }/assets/images/search_icon.png">
				&nbsp;
				<ul class="info-list" style="display: none;">
					<form id="searchBarForm" name="" action="" method="get" enctype="">
						<li class="xans-element- xans-layout xans-layout-searchheader ">
							<!--
                    $product_page=/product/detail.html
                    $category_page=/product/list.html
                -->
							<fieldset class="key_rel">
								<input id="keyword" name="searchValue" class="input-search" placeholder="SEARCH" value="" type="text">
								<input type="image" class="btn-search" src="${pageContext.servletContext.contextPath }/assets/images/search_icon.png" alt="검색">
							</fieldset>
						</li>
					</form>
				</ul>
			</div>
		<!-- 메뉴  끝  -->
	</div>
	<div class="menu-left">
			<div class="product">
				<span><a href="${pageContext.servletContext.contextPath }/product">Product</a></span>
				<ul class="category-list" style="display: none;">
					<c:forEach items="${categories}" var="category">
						<li><a href="${pageContext.servletContext.contextPath }/product?categoryNo=${category.no}">${category.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="board">
				<span>board</span>
				<ul class="info-list" style="display: none;">
					<li><a href="${pageContext.servletContext.contextPath}/board/faq" class="xans-element- xans-layout xans-layout-statelogoff log ">FAQ </a></li>
					<li><a href="${pageContext.servletContext.contextPath}/board/qna" class="xans-element- xans-layout xans-layout-statelogoff log ">QNA </a></li>
				</ul>
			</div>
			<div class="about">
				<span>About</span>
				<%-- <ul class="info-list" style="display: none;">
					<li><a href="${pageContext.servletContext.contextPath}/cart" class="xans-element- xans-layout xans-layout-statelogoff log ">CART </a></li>
				</ul> --%>
			</div>
	</div>
	<!-- 메뉴  시작 -->

	
</header><%-- 
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
		<td>
			<!--  상단 왼쪽 로고  -------------------------------------------->
			<table border="0" cellspacing="0" cellpadding="0" width="182">
				<tr>
					<td>
						<a href="/ad" onclick="<input type='hidden' name='no' value='${authUser.no }'>" title="no" id="no" >
						<input type="hidden" name="no" value="${authUser.no }">
						<img src="${pageContext.servletContext.contextPath }/assets/images/top_logo.gif" width="182" height="40" border="0">
						</a>
					</td>
				</tr>
			</table>
		</td>
		<td align="right" valign="bottom">
			<!--  상단메뉴 시작 (main_topmemnu.jsp) : Home/로그인/회원가입/장바구니/주문배송조회/즐겨찾기추가  ---->	
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
	<c:choose>		
		<c:when test="${empty authUser }">
			<td><a href="/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="/user/member_login"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="/user/member_agree"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand"></td>
		</c:when>
		
		<c:otherwise>
			<td><a href="/"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu01.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 로그아웃 -->
			<td><a href="/user/member_logout"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu02_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<!-- 회원정보수정 -->
			<td><a href="/user/member_modify/${authUser.no }"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu03_1.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="cart"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu05.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11"></td>
			<td><a href="jumun"><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu06.gif" border="0"></a></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu08.gif" style="cursor:hand"></td>

		</c:otherwise>
	</c:choose>	
				</tr>
				
				
			</table>
			<!--  상단메뉴 끝 (main_topmemnu.php)  ---------->	
		</td>
	</tr>
</table>

<!--  상단 메인 이미지 --------------------------------------------------->
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image0.jpg" width="182" height="175"></td>
	  <td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image1.jpg" width="777" height="175"></td>
	</tr>
</table> --%>