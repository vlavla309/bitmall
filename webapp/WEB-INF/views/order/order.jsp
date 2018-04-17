<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/global.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/product.css" rel="stylesheet" type="text/css">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/global.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/cart.js"></script>
	<script type="text/javascript">
		$(function(){
			getCartCookieValue();
		})
	</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<div id="wrapper"><div class="wrap-content">
<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="20"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title1.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="920" class="cmfont">
				<tr><td colspan="5" height="3" bgcolor="#0066CC"></td></tr>
				<tr bgcolor="F2F2F2">
					<td width="80" height="30" align="center">주문일</td>
					<td width="100"  align="center">주문번호</td>
					<td width="290" align="center">제품명</td>
					<td width="100" align="center">금액</td>
					<td width="115" align="center">주문상태</td>
				</tr>
				<tr><td colspan="5" bgcolor="DEDCDD"></td></tr>
				<c:forEach items="${orders}" var="order">
				<tr>
					<td height="30" align="center"><font color="686868">${order.regDate}</font></td>
					<td align="center">
						<a href="${pageContext.servletContext.contextPath }/order/${order.code}"><font color="#0066CC">${order.code}</font></a>
					</td>
					<td><font color="686868">${order.orderItems[0].name} 
						<c:if test="${order.orderItems.size() > 1}">&nbsp;&nbsp;외 ${order.orderItems.size()-1}</c:if>
					</font></td>
					<td align="right"><font color="686868">20,000 원</font></td>
					<td align="center">
						
						<font color="
						<c:choose>
							<c:when test="${order.status=='submit' }">#0066CC</c:when>
							<c:when test="${order.status=='confirm' }">#0066CC</c:when>
							<c:when test="${order.status=='payment' }">#0066CC</c:when>
							<c:when test="${order.status=='shipping' }">#0066CC</c:when>
							<c:when test="${order.status=='done' }">#686868</c:when>
							<c:when test="${order.status=='cancel' }">#D06404</c:when>
						</c:choose>
						
						">
						
						<c:choose>
							<c:when test="${order.status=='submit' }">주문신청</c:when>
							<c:when test="${order.status=='confirm' }">주문확인</c:when>
							<c:when test="${order.status=='payment' }">입금확인</c:when>
							<c:when test="${order.status=='shipping' }">배송중</c:when>
							<c:when test="${order.status=='done' }">주문완료</c:when>
							<c:when test="${order.status=='cancel' }">주문취소</c:when>
						</c:choose>
						</font>
					</td>
				</tr>
				<tr><td colspan="5" background="${pageContext.servletContext.contextPath }/assets/images/line_dot.gif"></td></tr>
				</c:forEach>
				<tr><td colspan="5" height="2" bgcolor="#0066CC"></td></tr>
			</table>
			<br>
		<%-- 	<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="30" class="cmfont" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_prev.gif" align="absmiddle" border="0"> 
						<font color="#FC0504"><b>1</b></font>&nbsp;
						<a href="jumun.jsp?page=2"><font color="#7C7A77">[2]</font></a>&nbsp;
						<a href="jumun.jsp?page=3"><font color="#7C7A77">[3]</font></a>&nbsp;
						<img src="${pageContext.servletContext.contextPath }/assets/images/i_next.gif" align="absmiddle" border="0">
					</td>
				</tr>
			</table> --%>
<div class="wrap-pagination">
					<c:choose>
					<c:when test="${pb.hasPreviousPagination}">
						<a href="${pageContext.servletContext.contextPath}/member/order?pageNo=${pb.startPageNo-1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_prev.gif" alt="이전페이지"/></a>
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
							<c:otherwise><a href="${pageContext.servletContext.contextPath}/member/order?pageNo=${stat.index}${params.shortQueryString}">${stat.index}</a></c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
					</ol>
					<c:choose>
					<c:when test="${pb.hasNextPagination}">
						<a href="${pageContext.servletContext.contextPath}/member/order?pageNo=${pb.endPageNo+1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:when>
					<c:otherwise>
					<a ><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:otherwise>
					</c:choose>
</div>
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
	</div></div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>