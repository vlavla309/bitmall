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
	
			$(".btn-buy").click(function(){
				console.log("click:구매버튼");
				if(!checkValue()){
					return false;
				}
				
				let jsonStr = ObjToJsonArrStr(".form-product");
				
				let $form = $('<form></form>');
				let data = $("<input type='hidden' value="+jsonStr+" name='data'>");
				$form.attr('action', '${pageContext.servletContext.contextPath}/order/add').attr('method', 'POST').appendTo('body').append(data);
			    $form.submit();
			});
			
			$(".btn-add-cart").click(function(){
				console.log("click:장바구니 추가");
				if(!checkValue()){
					return false;
				}
				addCart(formToObject($('.form-product')));
				window.location.href="${pageContext.servletContext.contextPath}/cart"
			})
		});
		
		const checkValue = function(){
			const optionVal1 = $("select[name=optionNo1]").val();
			const optionVal2 = $("select[name=optionNo2]").val();
			const quantityVal = $("input[name=quantity]").val();
			/* 
			console.log(optionVal1);
			console.log(optionVal2);
			console.log(quantityVal);
			 */
			if(optionVal1 == 0){
				alert("옵션1을 선택하세요.");
				return false;
			}
			
			if(optionVal2 == 0){
				alert("옵션2을 선택하세요.");
				return false;
			}
			
			if(quantityVal <= 0){
				alert("구매 수량은 최소 한개 이상입니다.");
				return false;
			}
			
			return true;
		}
	</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<%-- <jsp:include page="/WEB-INF/views/include/search.jsp"/> --%>
<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	
<div id="wrapper">
	<div id="wrap-product-detail">
		<header>
			<h1>Product</h1>
		</header>
		<!-- 상품정보 시작-->
		<section>
			<form class="form-product">
			<header id="product-info">
					<div class="wrap-img-product">
						<a href="#"><img class='img-product' src="${pageContext.servletContext.contextPath }${product.imagePath}" alt="상품메인이미지"></a>
					</div>
					
					<div class="wrap-info-product">
						<input type="hidden" name="productNo" value="${product.no}">
						<input type="hidden" name="price" value="${product.price * (1-product.discountRate/100)}">
						<ol>
							<li>
								<strong>제품명</strong>
								<span>
									${product.name}
									<c:if test="${product.isHit}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">
									</c:if>
									<c:if test="${product.isNew}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">
									</c:if>
									<c:if test="${product.isSale}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1">
									</c:if>
								</span>
							</li>
							<li>
								<strong>소비자가</strong>
								<span class="price"><fmt:formatNumber value="${product.price}" pattern="#,###"/> 원</span>
							</li>
							<li>
								<strong>판매가</strong>
								<span class="sale-price">
									<c:choose>
									<c:when test="${product.isSale == true}">
										<b><fmt:formatNumber value="${product.price * (1-product.discountRate/100)}" pattern="#,###"/> 원</b> 
									</c:when>
									<c:otherwise>
										<b><fmt:formatNumber value="${product.price}" pattern="#,###"/> 원</b>
									</c:otherwise>
									</c:choose>
								</span>
							</li>
							<li>
								<strong>옵션</strong>
								<span>
									<c:choose>
									<c:when test="${product.optionNo1 == 0 && product.optionNo2 == 0}">
										<span>Free</span>									
									</c:when>
									<c:otherwise>
										<c:if test="${product.optionNo1 != 0}">
											<select name="optionNo1" class="cmfont1">
												<option value="0">${options1[0].parentName}</option>
												<c:forEach items="${options1}" var="option">
													<option value="${option.no}">${option.name}</option>
												</c:forEach>
											</select>
										</c:if> &nbsp;
										<c:if test="${product.optionNo2 != 0}">
											<select name="optionNo2" class="cmfont1">
												<option value="0">${options2[0].parentName}</option>
												<c:forEach items="${options2}" var="option">
													<option value="${option.no}">${option.name}</option>
												</c:forEach>
											</select>
										</c:if>
									</c:otherwise>
									</c:choose>
								</span>
							</li>
							<li>
								<strong>수량</strong>
								<span><input type='number' name='quantity' min="1" value='1'/></span>
							</li>
						</ol>
						<c:choose>
							<c:when test="${product.status == 'onsale'}">
								<button type="button" class="btn-buy">바로 구매</button>
								<button type="button" class="btn-add-cart" >장바구니 담기</button>
							</c:when>
							<c:when test="${product.status == 'nosale'}">
								<button type="button" class="btn-buy-impossible" disabled="disabled">판매 중지</button>
							</c:when>
							<c:when test="${product.status == 'soldout'}">
								<button type="button" class="btn-buy-impossible" disabled="disabled">품절</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn-buy-impossible" disabled="disabled">구매 불가</button>
							</c:otherwise>
						</c:choose>
						
					</div>
			</header>
			</form>
			<article id="product-desc">
				<a class="flag" name="detail"></a>
				<div class="desc-title">
					<ul>
						<li class="this"><a href="#detail">Detail</a></li>
						<li><a href="#delivery">Delivery / Return</a></li>
						<li><a href="#review">Review</a></li>
					</ul>
				</div>
				<div class="detail">
					<p>${fn:replace(product.description, newLine, "<br>")}</p>
			
					<c:forEach items="${productImages}" var="image">
					<p><img class='image-product' src="${pageContext.servletContext.contextPath }${image.path}"></p>
					</c:forEach>
				</div>
				<a class="flag" id="delivery"></a>
				<div class="desc-title">
					<ul>
						<li><a href="#detail">Detail</a></li>
						<li class="this"><a href="#delivery">Delivery / Return</a></li>
						<li><a href="#review">Review</a></li>
					</ul>
				</div>
				<div class="delivery">
					<h3>배송정보</h3>
                        

                        <div class="title">제품 안정인증정보</div>
                        <ul>
                        <li>본 상품은 KC공급자적합성평가확인서를 통해 인증을 필하였습니다.</li>

                        </ul>

                        <div class="title">배송</div>
                        <ul>
                        <li>카드승인/현금입금 확인 후 2~5일 이내에 전국 무료배송(2만5천원이상 구매시) 됩니다.(단, 제주도 및 도서지역은 추가로 발생되는 배송비를 고객님께서 부담 하셔야 합니다.)</li>
                        <li>별도의 선물 포장은 불가합니다.</li>
                        <li>사이즈 및 무게는 기준에 따라 약간의 오차가 있을 수 있으며,  모니터 사양에 따라 색상이 다르게 보일 수 있습니다.</li>
                        <li>동시 판매되는 상품은 주문 후 상품을 준비 하는 과정에 이미 판매가 완료되어 상품의 발송이 늦어지거나 품절 될 수도 있습니다.
                        <br>이 경우 고객님께 즉시 알려드리고 환불처리 해 드리오니, 이점 넓은 마음으로 양해해 주시기 바랍니다.</li>
                        <li>주문배송문의 : 비트몰 고객센터 02-1234-1234</li>
                        </ul>
                        
                        <div class="title">교환, 환불</div>
                        <ul>
                        	<li>상품수령 후 7일 이내에 사용하지 않은 제품에 한해서만 교환/환불이 가능하며,  반품한 제품이 판매처에 입고된 후에 결제에 대한 환불이 진행 됩니다. </li>
                        	<li>불량인 경우라도 사용한 제품에 대해서는 교환/환불이 안 될 수 있으니  제품 인수 후 꼼꼼한 확인 부탁 드립니다.</li>
                        	<li>상품불량이나 파손 등 하자에 의한 반송비용은 업체에서 부담하며,  고객변심으로 인한 교환 / 반품은 고객님께서 부담하셔야 합니다.</li>
                        	<li>TAG 및  박스, 포장 등의 손상이 있으면 반품/교환이 되지 않습니다.</li>
						</ul>
                        <div class="title">A/S</div>
                        <ul>
                        <li>전국 백화점 비트몰 매장 및 구입처에서 A/S 받으실 수 있습니다.</li>
                        <li>제품의 종류 및 상태에 따라 수선비 차이가 있으므로 꼭 가까운 매장에 문의바랍니다 </li>
                        <li>품질보증기준 : 구입일로부터 1년 (관련법 및 소비자분쟁해결기준에 따름)</li>
                        <li>A/S 문의 : ㈜비트몰 소비자 상담실 070-1234-1234(1234)</li>
                        </ul>
                        
                        <div class="title">LAUNDRY &amp; FABRIC CARE</div>
                        <ul>
                        <li>물에 젖었을 때 직사광선이나 열로 직접 건조하면 변질될 수 있으니 통풍이 잘 되는 그늘에서 건조하시기 바랍니다. </li>
                        <li>가죽전용 크림으로 주 1회 정도 손질하여 주시면 제품을 오래 사용하실 수 있습니다.<br>(단, 소재가 세무 종류일 경우에는 구두솔 및 고무지우개만 사용하십시오.)</li>
                        <li>오염되었을 때는 가죽전용 크림으로 세척하시고 일반세척제나 벤졸을 절대로 사용하지 마십시오.</li>
                        <li>보존시에는 온도나 습기가 높은 곳을 피하십시오.</li>
                        <li>가죽 염료는 수성이므로 면,마, 린넨 등의 흰 천연 섬유에 오염될 염려가 있으므로 습기,땀 등에 주의를 요합니다.</li>
                        <li>천연가죽(스웨이드) 제품은 물에 젖었을 경우 물이 빠질 수 있습니다.</li>
                        <li>에나멜 가죽 및 합성피혁은 다른 소재와 밀착시 색이 이염되는 현상이 있사오니, 취급 또는 보관시 주의하십시오.</li>
                        <li>볼펜이나 신문, 잡지 등에 색이 이염될 수 있으니 주의 바랍니다.</li>
                        </ul>
                        
				</div>
				
				<a class="flag" name="review"></a>
				<div class="desc-title">
					<ul>
						<li><a href="#detail">Detail</a></li>
						<li><a href="#delivery">Delivery / Return</a></li>
						<li class="this"><a href="#review">Review</a></li>
					</ul>
				</div>
				<div class="review">
					<h3>리뷰</h3>
					<p>리뷰 리스트</p>
				</div>		
			</article>
			
		</section>
		<!-- 상품 정보 끝 -->

			<%--
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!-- form2 시작  -->
			 
			<form name="form2" method="post" action="">
			<input type="hidden" name="no" value="0000">
			<input type="hidden" name="kind" value="insert">

			<table border="0" cellpadding="0" cellspacing="0" width="745">
				<tr>
					<td width="335" align="center" valign="top">
						<!-- 상품이미지 -->
						<table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
							<tr>
								<td bgcolor="white" align="center">
									<img class='img-product' src="${pageContext.servletContext.contextPath }${product.imagePath}" height="315" border="0" align="absmiddle" ONCLICK="Zoomimage('0000')" STYLE="cursor:hand">
								</td>
							</tr>
						</table>
					</td>
					<td width="410 " align="center" valign="top">
						<!-- 상품명 -->
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<tr>
								<td width="80" height="45" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>제품명</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<font color="282828">${product.name}</font><br>
									<c:if test="${product.isHit}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">
									</c:if>
									<c:if test="${product.isNew}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">
									</c:if>
									<c:if test="${product.isSale}">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1">
									</c:if>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 시중가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>소비자가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td width="289" style="padding-left:10px">
								<font color="666666" style="text-decoration:line-through;">${product.price}원</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 판매가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>판매가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px"><font color="0288DD"><b>
								<c:choose>
								<c:when test="${product.isSale}">
								${product.price * (1-product.discountRate/100) }
								</c:when>
								<c:otherwise>${product.price }</c:otherwise>
								</c:choose> 
								원
								</b></font></td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 옵션 -->
							<c:if test="not empty ${product.optionNo1} && not empty ${product.optionNo2}">
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>옵션선택</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
								<c:if test="not empty ${product.optionNo1}">
									<select name="opts1" class="cmfont1">
										<option value="">선택하세요</option>
										<option value="1">빨강</option>
										<option value="2">흰색</option>
									</select>
								</c:if> &nbsp;
								<c:if test="not empty ${product.optionNo1}">
									<select name="opts2" class="cmfont1">
										<option value="">선택하세요</option>
										<option value="3">L</option>
										<option value="4">M</option>
										<option value="5">S</option>
									</select>
								</c:if> &nbsp;
									
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							</c:if>
							<!-- 수량 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>수량</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="text" name="num" value="1" size="3" maxlength="5" class="cmfont1"> <font color="666666">개</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="70" align="center">
									<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp;
									<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="absmiddle"></a>
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="30" align="center">
									<img src="${pageContext.servletContext.contextPath }/assets/images/product_text1.gif" border="0" align="absmiddle">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			
			<!-- form2 끝  -->

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="200" valign=top style="line-height:14pt">
						${fn:replace(product.description, newLine, "<br>")}
						<br>
						<br>
						<center>
							<c:forEach items="${productImages}" var="image">
							<img class='image-product' src="${pageContext.servletContext.contextPath }${image.path}"><br>
							</c:forEach>
						</center>
					</td>
				</tr>
			</table>
			
			<!-- 교환배송정보 -->
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td align="center" class="cmfont">배송정보 어쩌고저쩌고........</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
			</table>
 --%>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>