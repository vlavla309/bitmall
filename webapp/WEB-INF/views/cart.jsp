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
	<link href="${pageContext.servletContext.contextPath }/assets/css/cart.css" rel="stylesheet" type="text/css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/global.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/cart.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/product.js"></script>
	<script type="text/javascript">
		$(function(){
			setTotalPrice();
			$(".btn-buy").click(function(evt){
				evt.preventDefault();
				console.log("click:구매버튼");
				
				if($(".form-product").length < 1){
					alert("주문할 상품이 없습니다.");
					return false;	
				}

				let jsonStr = ObjToJsonArrStr(".form-product");
				
				let $form = $('<form></form>');
				let data = $("<input type='hidden' value="+jsonStr+" name='data'>");
				let cart = $("<input type='hidden' value='cart' name='cart'>");
				$form.attr('action', '${pageContext.servletContext.contextPath}/order/add').attr('method', 'post').appendTo('body').append(data).append(cart);
			    console.log(jsonStr);
			    $form.submit();
			});
			
			
			$(".btn-delete-cart").click(function(evt){
				evt.preventDefault();
				let targetNo = $(this).data("value");
				console.log("click:장바구니삭제버튼 : "+targetNo);
				let target=$(".form-product").filter(function(index){
					return $(this).data("value")==targetNo;
				});
				
				
				target.remove();
				console.log(target[0]);
				setCartCookieValue(ObjToJsonArrStr('.form-product'));
				window.location.reload();
				/* 
				let jsonStr = ObjToJsonArrStr(".form-product");
				let $form = $('<form></form>');
				let data = $("<input type='hidden' value="+jsonStr+" name='data'>");
				$form.attr('action', '${pageContext.servletContext.contextPath}/order/add').attr('method', 'get').appendTo('body').append(data);
			    console.log(jsonStr);
			    $form.submit(); */
			});
		});
	</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<div id ="wrapper">
	<div class="header-title">
		<h1>cart</h1>
	</div>
	<div id ="wrap-cart" class="wrap-content">
		<c:forEach items="${cartItems}" var="item" varStatus="stat">
			<form class="form-product" data-value="${stat.index}">
				<input type="hidden" name="productNo" value="${item.productNo}">
				<input type="hidden" name="quantity" value="${item.quantity}">
				<input type="hidden" name="price" value="${item.price}">
				<input type="hidden" name="optionNo1" value="${item.optionNo1}"/>
				<input type="hidden" name="optionNo2" value="${item.optionNo2}"/>
			</form>
		</c:forEach>
		<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="420" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="80"  align="center">가격</td>
					<td width="90"  align="center">합계</td>
					<td width="50"  align="center">삭제</td>
				</tr>
			<c:forEach items="${cartItems}" var="item"  varStatus="stat">
					<tr bgcolor="#FFFFFF">
					<td height="60" align="center">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="${pageContext.servletContext.contextPath }/product/${item.productNo}"><img src="${pageContext.servletContext.contextPath }${item.product.imagePath}" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="product_detail.jsp?no=0000"><font color="#0066CC">${item.product.name}</font></a><br>
									<c:if test="${item.optionNo1 != 0}">[${item.option1.parentName}]</font> ${item.option1.name} </c:if>
									<c:if test="${item.optionNo2 != 0}">[${item.option2.parentName}]</font> ${item.option2.name} </c:if>
								</td>
							</tr>
						</table>
					</td>
					<td align="center"><font color="#464646">${item.quantity }&nbsp개</font></td>
					<%-- <td align="center"><input type="number" name="quantity" value="${item.quantity }"/></td> --%>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${item.price }" pattern="#,###"/></font> 원</td>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${item.quantity *  item.price}" pattern="#,###"/></font> 원</td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
						<a class="btn-delete-cart" href = "#" data-value="${stat.index}"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
					</td>
				</tr>
				
				</c:forEach>
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tbody><tr>
								<td bgcolor="#F0F0F0"><img src="/bitmall/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0" id="td-totalPrice">
									<font color="#0066CC"><b>총 합계금액</b></font> : 상품대금(132,000원) + 배송료(2,500원) = <font color="#FF3333"><b>134,500원</b></font>&nbsp;&nbsp;
								</td>
							</tr>
						</tbody></table>
					</td>
				</tr>
		</table>
		<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="44">
					<td width="710" align="center" valign="middle">
						<%-- <a href="index.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0"></a>&nbsp;&nbsp;
						<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0"></a>&nbsp;&nbsp; --%>
						<button class="btn-buy" type="button"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></button>
					</td>
				</tr>
			</table>
	</div>

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	
<%-- 
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center" style="margin:auto;">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
		</td>
		<td width="10"></td>
		<td valign="top">


			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0"></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="420" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="80"  align="center">가격</td>
					<td width="90"  align="center">합계</td>
					<td width="50"  align="center">삭제</td>
				</tr>
				<tr>
					<form name="form2" method="post" action="">
					<td height="60" align="center" bgcolor="#FFFFFF">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="product_detail.jsp?product_num=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="product_detail.jsp?product_num=0000">제품명</a><br>
									<font color="#0066CC">[옵션사항]</font> 옵션1
								</td>
							</tr>
						</table>
					</td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="text" name="num1" size="3" value="1" class="cmfont1">&nbsp<font color="#464646">개</font>
					</td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">70,200</font></td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">70,200</font></td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
						<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
					</td>
					</form>
				</tr>
				<tr>
					<form name="form2" method="post" action="">
					<td height="60" align="center" bgcolor="#FFFFFF">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="product_detail.jsp?product_num=0000"><img src="${pageContext.servletContext.contextPath }/assets/images/product/0000_s.jpg" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="product_detail.jsp?product_num=0000">제품명2</a><br>
									<font color="#0066CC">[옵션사항]</font> 옵션2
								</td>
							</tr>
						</table>
					</td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="text" name="num2" size="3" value="1" class="cmfont1">&nbsp<font color="#464646">개</font>
					</td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">60,000</font></td>
					<td align="center" bgcolor="#FFFFFF"><font color="#464646">60,000</font></td>
					<td align="center" bgcolor="#FFFFFF">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>
						<a href = "#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp
					</td>
					</form>
				</tr>
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(132,000원) + 배송료(2,500원) = <font color="#FF3333"><b>134,500원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="44">
					<td width="710" align="center" valign="middle">
						<a href="index.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0"></a>&nbsp;&nbsp;
						<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0"></a>&nbsp;&nbsp;
						<button class="btn-buy" type="button"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br><br>
  --%>
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	


	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>