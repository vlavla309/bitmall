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
	<link href="${pageContext.servletContext.contextPath }/assets/css/order.css" rel="stylesheet" type="text/css">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/global.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/cart.js"></script>
	<script type="text/javascript">
		$(function(){
			getCartCookieValue();
			
			$(".btn-order-inquire").click(function(){
				const orderCode = $("#orderCode").val();
				console.log(orderCode);
				location.href="${pageContext.servletContext.contextPath}/order/"+orderCode;
			});
		})
	</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<%-- <jsp:include page="/WEB-INF/views/include/search.jsp"/> --%>
<div id="wrapper">
<div class="wrap-content">
<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<!---- 화면 우측(로그인) S -------------------------------------------------->	
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="47"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="720">
				<tr>
					<td width="747" align="center" valign="top">
						<table border="0" cellpadding="0" cellspacing="8" width="523" bgcolor="E9E9E9">
							<tr>
								<td height="210" align="center" bgcolor="white">
									<table border="0" height="120" cellpadding="0" cellspacing="0" width="440">
										<tr>
											<td width="120" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image1.gif" width="110" height="90" border="0"></td>
											<td width="320">
												<table border="0" cellpadding="0" cellspacing="0" width="320">
													<tr>
														<td height="35">
															<p style="padding-left:10px;"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image2.gif" width="220" height="21" border="0"></p>
														</td>
													</tr>
												</table>
												<table border="0" cellpadding="0" cellspacing="0" width="320">
													<!-- form2 시작 ------>
													<form name = "form2" method = "post" action = "${pageContext.servletContext.contextPath }/member/auth">
													<input type="hidden" name="returnURI" value="${pageContext.servletContext.contextPath }/member/order">
													<tr>
														<td width="220" height="25">
															<p style="padding-left:10px;">
															<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/login_id.gif" width="40" height="13" border="0"> 
															<input type="text" name="id" size="20" maxlength="12" class="cmfont1">
															</p>
														</td>
														<td width="100" rowspan="2">
															<input type="image" align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_login.gif" width="50" border="0">
														</td>
													</tr>
													<tr>
														<td width="220" height="25">
															<p style="padding-left:10px;">
															<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/login_pw.gif" width="40" height="13" border="0"> 
															<input type="password" name="password" size="20" maxlength="12" class="cmfont1">
															</p>
														</td>
													</tr>
													</form>
													<!--form2 끝 ------>
												</table>
											</td>
										</tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="512">
										<tr><td height="15"></td></tr>
										<tr><td height="2" bgcolor="E9E9E9"></td></tr>
										<tr><td height="15"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="511">
										<tr>
											<td align="center">
												<table border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/login_image6.gif" border="0"></td>
														<td height="30">
															<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_id.gif" width="64" height="19" border="0" align="absmiddle"></a> &nbsp; 
															<a href="#" onfocus="this.blur()"><img src="${pageContext.servletContext.contextPath }/assets/images/b_pw.gif" width="64" height="19" border="0" align="absmiddle"></a>
														</td>
													</tr>
												</table>												
											</td>
										</tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="512">
										<tr><td height="15"></td></tr>
										<tr><td height="2" bgcolor="E9E9E9"></td></tr>
										<tr><td height="15"></td></tr>
									</table>
									
									<table border="0" height="120" cellpadding="0" cellspacing="0" width="440">
										<tr>
											<td style="text-align: center;">
												<h1>비회원 주문조회</h1>
											</td>
										</tr>
										<tr>
											<td style="text-align: center;">
												<p> <strong>주문번호</strong> <input type="text" id="orderCode" name="code" size="20" maxlength="30" class="cmfont1"><button class="btn-order-inquire">조회하기</button></p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			
			
		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>