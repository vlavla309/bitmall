<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%-- <jsp:include page="/WEB-INF/views/include/search.jsp"/> --%>
<div id="wrapper">
	<div id = 'wrap-index-item'>
		<ul>
			<li><a href="${pageContext.servletContext.contextPath}/product"><img src = "${pageContext.servletContext.contextPath}/assets/images/main_item2.jpg"/></a></li>
			<li><a href="${pageContext.servletContext.contextPath}/product"><img src = "${pageContext.servletContext.contextPath}/assets/images/main_item1.jpg"/></a></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<div id = 'wrap-products'>
			<div class="product-list-header">
				<h1>New Arrival</h1>
			</div>
			<ul id = 'product-list'>
				<c:forEach items="${products}" var="product">
				<li class ='wrap-product'>
					<div class='wrap-img'>
						<a href="${pageContext.servletContext.contextPath}/product/${product.no}?${params.queryString}">
							<img class='img-product' src="${pageContext.servletContext.contextPath }${product.imagePath}">
						</a>
					</div>
					<div class='wrap-info'>
						<strong class='name'>
							<a href="${pageContext.servletContext.contextPath}/product/${product.no}?${params.queryString}">${product.name}</a>
							<c:if test="${product.isNew == true}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">
								</c:if> <c:if test="${product.isHit == true}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddl" vspace="1">
								</c:if> <c:if test="${product.isSale == true}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1">
								</c:if>
							</strong>
						
						<div>
						<ul>
							<li class="description">
							${product.description}
							</li>
							<li class="sale-price">
							<c:choose>
							<c:when test="${product.isSale == true}">
							<b><fmt:formatNumber value="${product.price * (1-product.discountRate/100)}" pattern="#,###"/> 원</b> 
							</c:when>
							<c:otherwise><b><fmt:formatNumber value="${product.price}" pattern="#,###"/> 원</b></c:otherwise>
							</c:choose>
							</li>
							<li class="price">
							<c:if test="${product.isSale == true}">
							<fmt:formatNumber value="${product.price}" pattern="#,###"/> 원
							</c:if>
							</li>
						</ul>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
</div>

<%-- 
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

		<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<!---- 화면 우측(신상품) 시작 -------------------------------------------------->	
			<table width="767" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="60">
						<img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
					</td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0">
				<!---1번째 줄-->
				<tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=1"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1"> 
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">20%</font>
								</td>
							</tr>
							<tr><td height="20" align="center"><strike>89,000 원</strike><br><b>70,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 												
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

				</tr>
				<tr><td height="10"></td></tr>
				<!---2번째 줄-->
				<tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
				<!---3번째 줄-->
				<tr>
					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hot.gif" align="absmiddle" vspace="1"> <img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" >
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>

					<td width="150" height="205" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
							<tr> 
								<td align="center"> 
									<a href="product_detail.jsp?no=109469"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="120" height="140" border="0"></a>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr> 
								<td height="20" align="center">
									<a href="product_detail.jsp?no=109469"><font color="444444">상품명1</font></a>&nbsp; 									
								</td>
							</tr>
							<tr><td height="20" align="center"><b>89,000 원</b></td></tr>
						</table>
					</td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->

		</td>
	</tr>
</table>
<br><br>
  --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>