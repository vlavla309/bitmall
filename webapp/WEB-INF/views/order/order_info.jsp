<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
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
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title2.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td colspan="6" height="2" bgcolor="8B9CBF"></td></tr>
				<tr>
					<td width="60"  bgcolor="F2F2F2" align="center" height="30"></td>
					<td width="395" bgcolor="F2F2F2" align="center">상품명</td>
					<td width="50"  bgcolor="F2F2F2" align="center">수량</td>
					<td width="90"  bgcolor="F2F2F2" align="center">금액</td>
					<td width="90"  bgcolor="F2F2F2" align="center">합계</td>
				</tr>
				<tr><td colspan="6" bgcolor="DEDCDD"></td></tr>
				<c:forEach items="${orderItems}" var="orderItem">
				<tr>
					<td width="60">
						<a href="product_detail.html?no=0000"><img src="${pageContext.servletContext.contextPath }${orderItem.product.imagePath }" width="50" height="50" border="0"></a>
					</td>
					<td height="52">
						<font color="686868"><strong>${orderItem.name }</strong></font><br>
						<c:if test="${not empty orderItem.option1}"><font color="#0066CC">[${orderItem.option1.parentName}]</font> ${orderItem.option1.name}</c:if>
						<br>
						<c:if test="${not empty orderItem.option2}"><font color="#0066CC">[${orderItem.option2.parentName}]</font> ${orderItem.option2.name}</c:if>
					</td>
					<td align="center"><font color="686868">${orderItem.quantity}</font></td>
					<td align="right"><font color="686868"><fmt:formatNumber value="${orderItem.price}" pattern="#,###"/> 원</font></td>
					<td align="right"><font color="686868"><fmt:formatNumber value="${orderItem.price*orderItem.quantity}" pattern="#,###"/> 원</font></td>
				</tr>
				
				</c:forEach>
			
				<tr><td colspan="6" background="${pageContext.servletContext.contextPath }/assets/images/line_dot.gif"></td></tr>
				<tr><td colspan="6" height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<br><br><br>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title3.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			<c:choose>
			<c:when test="${order.paymentType=='card' }">
			<!-- 카드 결제 -->
			<table border="0" cellpadding="0" cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.code }<font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제금액</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#D06404"><b><fmt:formatNumber value="${order.totalPrice }" pattern="#,###"/> 원</b></font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">카드</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;승인번호</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${card.approveNo }</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;카드종류</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${card.cardType }</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;할부</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">
																<c:choose>
																<c:when test="${card.installment == 'lump'}">
																	일시불
																</c:when>
																<c:otherwise>
																	${card.installment} 개월
																</c:otherwise>
																</c:choose>
																
															</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제카드</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868"> (${card.cardType }:${card.cardNo })</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제자명</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${card.payer}</font></td>
				</tr>
			</table>
			</c:when>
			<c:when test="${order.paymentType=='deposit' }">
			<!-- 무통장 결제 -->
			<table border="0" cellpadding="0" cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.code }<font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제금액</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#D06404"><b><fmt:formatNumber value="${order.totalPrice }" pattern="#,###"/> 원</b></font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">무통장</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;승인번호</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">-</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;카드종류</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">-</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;할부</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">-</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;입금계좌</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">(${deposit.account })</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;입금자명</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${deposit.depositor }</font></td>
				</tr>
			</table>
			</c:when>
			</c:choose>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<br><br><br>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title4.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문자명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.ordererName}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.ordererPhone1}</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.ordererPhone2}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;이메일</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.ordererEmail}</font></td>
				</tr>
				<tr><td height="1" bgcolor="8B9CBF" colspan="4"></td></tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;수취인명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${order.recipientName}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.recipientPhone1}</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${order.recipientPhone2}</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;배달주소</td>
					<c:set var="addr" value="${fn:split(order.recipientAddr,':')}" />
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">[${addr[0]}] &nbsp; ${addr[1]}  </font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;메모</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${fn:replace(order.requirement, newLine, "<br>")}</font></td>
				</tr>
				
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="40" class="cmfont" align="right">
						<a href="jumun.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_list.gif" border="0"></a>&nbsp;&nbsp;&nbsp
					</td>
				</tr>
			</table>


<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
	</div></div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>