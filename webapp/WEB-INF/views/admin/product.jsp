<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".btn-product-delete").click(function(){
				alert("아직.. ㅎㅎ");
			});
			
			$("#status, #icon, #categoryNo").change(function(){
				$("#form-search").submit();
			});
		});
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<div id ="wrapper">
	<div class="wrap-content">

<form:form 
modelAttribute  ="productParam"
id="form-search" 
name="form1" 
method="get" 
action="">
<table width="800" border="0" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td align="left"  width="150" valign="bottom">&nbsp 제품수 : <font color="#FF0000">${pb.totalItemCount}</font></td>
		<td align="right" width="600" valign="bottom">
			<form:select id="status" path="status">
				<form:option value="">상품상태</form:option>
				<form:option value="onsale">판매중</form:option>
				<form:option value="nosale">판매중지</form:option>
				<form:option value="soldout">품절</form:option>
			</form:select>
			&nbsp 
			<form:select id="icon" path="icon">
				<form:option value="no">아이콘 선택</form:option>
				<form:option value="isNew">New</form:option>
				<form:option value="isHit">Hit</form:option>
				<form:option value="isSale">Sale</form:option>
			</form:select>
			&nbsp 
			<form:select id="categoryNo" path="categoryNo">
				<form:option value="0">분류선택</form:option>
				<c:forEach items="${categories}" var="category">
					<form:option value="${category.no }">${category.name}</form:option>
				</c:forEach>
			</form:select>
			&nbsp 
			
			<form:select id="searchType" path="searchType">
				<form:option value="name">제품이름</form:option>
				<form:option value="code">제품번호</form:option>
			</form:select>
			<form:input path="searchValue"/>
			&nbsp
		</td>
		<td align="left" width="120" valign="bottom">
			<form:button >검색</form:button>
			&nbsp;
			<a href="${pageContext.servletContext.contextPath}/admin/product/add"><input type="button" value="새상품"></a>
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form:form>

<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">제품분류</td>
		<td width="100" align="center">제품코드</td>
		<td width="280" align="center">제품명</td>
		<td width="70"  align="center">판매가</td>
		<td width="50"  align="center">상태</td>
		<td width="120" align="center">이벤트</td>
		<td width="80"  align="center">수정/삭제</td>
	</tr>
	<c:forEach items="${products}" var="product">
	<tr bgcolor="#F2F2F2" height="23">	
		<td width="100">&nbsp 
		<c:forEach items="${categories}" var="category">
			<c:if test="${category.no ==  product.categoryNo}">${category.name}</c:if>
		</c:forEach>
		</td>
		<td width="100">&nbsp ${product.code}</td>
		<td width="280">&nbsp ${product.name}</td>	
		<td width="70"  align="right"><fmt:formatNumber value="${product.price}" pattern="#,###"/> 원&nbsp</td>	
		<td width="50"  align="center">
		<c:choose>
		<c:when test="${product.status == 'onsale'}">판매중</c:when>
		<c:when test="${product.status == 'nosale'}">판매중지</c:when>
		<c:when test="${product.status == 'soldout'}">품절</c:when>
		</c:choose>
		</td>	
		<td width="120" align="center">
		<c:if test="${product.isNew == true }">New </c:if>
		<c:if test="${product.isHit == true }">Hit </c:if>
		<c:if test="${product.isSale == true }">Sale (<fmt:formatNumber value="${product.discountRate}" pattern="#"/>%)</c:if>
		</td>	
		<td width="80"  align="center">
			<a href="${pageContext.servletContext.contextPath}/admin/product/edit/${product.no}?${params.queryString}">수정</a>
			<a class="btn-product-delete" href="#">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
<br>
<br>
<div class="wrap-pagination">
					<c:choose>
					<c:when test="${pb.hasPreviousPagination}">
						<a href="${pageContext.servletContext.contextPath}/admin/product?pageNo=${pb.startPageNo-1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_prev.gif" alt="이전페이지"/></a>
					</c:when>
					<c:otherwise>
					<a ><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_prev.gif" alt="이전페이지"/></a>
					</c:otherwise>
					</c:choose>
					<ol class="pagination">
					<c:forEach begin="${pb.startPageNo}" end="${pb.endPageNo}" varStatus="stat">
						<li>
						<c:choose>
							<c:when test="${stat.index == params.pageNo}"><a class="this">${stat.index}</a></c:when>
							<c:when test="${stat.index > pb.countTotalPage}"><a class="deactive">${stat.index}</a></c:when>
							<c:otherwise><a href="${pageContext.servletContext.contextPath}/admin/product?pageNo=${stat.index}${params.shortQueryString}">${stat.index}</a></c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
					</ol>
					<c:choose>
					<c:when test="${pb.hasNextPagination}">
						<a href="${pageContext.servletContext.contextPath}/admin/product?pageNo=${pb.endPageNo+1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:when>
					<c:otherwise>
					<a ><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="다음페이지"/></a>
					</c:otherwise>
					</c:choose>
</div>
</div></div>
</body>
</html>