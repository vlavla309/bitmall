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
			$("#btn-order-submit").click(function(){
				let jsonStr = ObjToJsonArrStr(".form-product");
			    console.log(jsonStr);
			    let $form = $('#form-order');

			    const ordererPhone1 = $("input[name=o_tel1]" ).val() + $("input[name=o_tel2]" ).val() + $("input[name=o_tel3]" ).val();
			    const ordererPhone2 = $("input[name=o_phone1]" ).val() + $("input[name=o_phone2]" ).val() + $("input[name=o_phone3]" ).val();
			    const ordererAddr = $("input[name=o_zip1]" ).val() + $("input[name=o_zip2]" ).val() + $("input[name=o_juso]" ).val();
			    const recipientPhone1 = $("input[name=r_tel1]" ).val() + $("input[name=r_tel2]" ).val() + $("input[name=r_tel3]" ).val();
			    const recipientPhone2 = $("input[name=r_phone1]" ).val() + $("input[name=r_phone2]" ).val() + $("input[name=r_phone3]" ).val();
			    const recipientAddr = $("input[name=r_zip1]" ).val() + $("input[name=r_zip2]" ).val() + $("input[name=r_juso]" ).val();
				
			   
				
			    console.log("주문자 정보");
				console.log(ordererPhone1);
				console.log(ordererPhone2);
				console.log(ordererAddr);
				console.log("수령인 정보");
				console.log(recipientPhone1);
				console.log(recipientPhone2);
				console.log(recipientAddr);
				
				const input_ordererPhone1 = $("<input type='hidden' value="+ordererPhone1+" name='ordererPhone1'>");
				const input_ordererPhone2 = $("<input type='hidden' value="+ordererPhone2+" name='ordererPhone2'>");
				const input_ordererAddr = $("<input type='hidden' value="+ordererAddr+" name='ordererAddr'>");
				
				const input_recipientPhone1 = $("<input type='hidden' value="+recipientPhone1+" name='recipientPhone1'>");
				const input_recipientPhone2 = $("<input type='hidden' value="+recipientPhone2+" name='recipientPhone2'>");
				const input_recipientAddr = $("<input type='hidden' value="+recipientAddr+" name='recipientAddr'>");
				
				let data = $("<input type='hidden' value="+jsonStr+" name='data'>");
				
				
				
				$form.append(input_ordererPhone1).append(input_ordererPhone2).append(input_ordererAddr).append(input_recipientPhone1).append(input_recipientPhone2).append(input_recipientAddr).append(data);
			    $form.submit();
			});
			
		})

			function Check_Value() {
				if (!form2.ordererName.value) {
					alert("주문자 이름이 잘 못 되었습니다.");	form2.ordererName.focus();	return;
				}
				if (!form2.o_tel1.value || !form2.o_tel2.value || !form2.o_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	form2.o_tel1.focus();	return;
				}
				if (!form2.o_phone1.value || !form2.o_phone2.value || !form2.o_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	form2.o_phone1.focus();	return;
				}
				if (!form2.ordererEmail.value) {
					alert("이메일이 잘 못 되었습니다.");	form2.ordererEmail.focus();	return;
				}
				if (!form2.o_zip1.value || !form2.o_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	form2.o_zip1.focus();	return;
				}
				if (!form2.o_juso.value) {
					alert("주소가 잘 못 되었습니다.");	form2.ordererEmail.focus();	return;
				}

				if (!form2.recipientName.value) {
					alert("받으실 분의 이름이 잘 못 되었습니다.");	form2.recipientName.focus();	return;
				}
				if (!form2.r_tel1.value || !form2.r_tel2.value || !form2.r_tel3.value) {
					alert("전화번호가 잘 못 되었습니다.");	form2.r_tel1.focus();	return;
				}
				if (!form2.r_phone1.value || !form2.r_phone2.value || !form2.r_phone3.value) {
					alert("핸드폰이 잘 못 되었습니다.");	form2.r_phone1.focus();	return;
				}
				if (!form2.recipientEmail.value) {
					alert("이메일이 잘 못 되었습니다.");	form2.recipientEmail.focus();	return;
				}
				if (!form2.r_zip1.value || !form2.r_zip2.value) {
					alert("우편번호가 잘 못 되었습니다.");	form2.r_zip1.focus();	return;
				}
				if (!form2.r_juso.value) {
					alert("주소가 잘 못 되었습니다.");	form2.recipientEmail.focus();	return;
				}

				form2.submit();
			}

			function FindZip(zip_kind) 
			{
				window.open("zipcode.jsp?zip_kind="+zip_kind, "", "scrollbars=no,width=500,height=250");
			}

			function SameCopy(str) {
				if (str == "Y") {
					form2.recipientName.value = form2.ordererName.value;
					form2.r_zip1.value = form2.o_zip1.value;
					form2.r_zip2.value = form2.o_zip2.value;
					form2.r_juso.value = form2.o_juso.value;
					form2.r_tel1.value = form2.o_tel1.value;
					form2.r_tel2.value = form2.o_tel2.value;
					form2.r_tel3.value = form2.o_tel3.value;
					form2.r_phone1.value = form2.o_phone1.value;
					form2.r_phone2.value = form2.o_phone2.value;
					form2.r_phone3.value = form2.o_phone3.value;
					form2.recipientEmail.value = form2.ordererEmail.value;
				}
				else {
					form2.recipientName.value = "";
					form2.r_zip1.value = "";
					form2.r_zip2.value = "";
					form2.r_juso.value = "";
					form2.r_tel1.value = "";
					form2.r_tel2.value = "";
					form2.r_tel3.value = "";
					form2.r_phone1.value = "";
					form2.r_phone2.value = "";
					form2.r_phone3.value = "";
					form2.recipientEmail.value = "";
				}
			}

			</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<div id="wrapper">
<c:forEach items="${orderItems}" var="item" varStatus="stat">
			<form class="form-product" data-value="${stat.index}">
				<input type="hidden" name="productNo" value="${item.productNo}">
				<input type="hidden" name="quantity" value="${item.quantity}">
				<input type="hidden" name="price" value="${item.quantity *  item.price}">
				<input type="hidden" name="optionNo1" value="${item.optionNo1}"/>
				<input type="hidden" name="optionNo2" value="${item.optionNo2}"/>
			</form>
</c:forEach>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<%-- <jsp:include page="/WEB-INF/views/include/navigation.jsp"/> --%>
		</td>
		<td width="10"></td>
		<td valign="top">

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

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="440" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="100" align="center">가격</td>
					<td width="100" align="center">합계</td>
				</tr>
				
				<c:forEach items="${orderItems}" var="orderItem" >
					<tr bgcolor="#FFFFFF">
					<td height="60" align="center">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td width="60">
									<a href="${pageContext.servletContext.contextPath }/product/${orderItem.productNo}"><img src="${pageContext.servletContext.contextPath }${orderItem.product.imagePath}" width="50" height="50" border="0"></a>
								</td>
								<td class="cmfont">
									<a href="product_detail.jsp?no=0000"><font color="#0066CC">${orderItem.product.name}</font></a><br>
									<c:if test="${orderItem.optionNo1 != 0}">[${orderItem.option1.parentName}]</font> ${orderItem.option1.name} </c:if>
									<c:if test="${orderItem.optionNo2 != 0}">[${orderItem.option2.parentName}]</font> ${orderItem.option2.name} </c:if>
								</td>
							</tr>
						</table>
					</td>
					<td align="center"><font color="#464646">${orderItem.quantity }&nbsp개</font></td>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${orderItem.price }" pattern="#,###"/></font> 원</td>
					<td align="center"><font color="#464646"><fmt:formatNumber value="${orderItem.quantity *  orderItem.price}" pattern="#,###"/></font> 원</td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금(132,000원) + 배송료(2,500원) = <font color="#FF3333"><b>134,500 원</b></font>&nbsp;&nbsp
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br>

			<!-- 주문자 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>

			<!-- form2 시작  -->
			<form id="form-order" name="form2" method="post" action="${pageContext.servletContext.contextPath}/order/pay">
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5">
						<font size="2" color="#B90319"><b>주문자 정보</b></font>
					</td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text"   name="ordererName" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_tel1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="o_tel2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="o_tel3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_phone1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="o_phone2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="o_phone3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="ordererEmail" size="50" maxlength="50" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_zip1" size="3" maxlength="3" value="" class="cmfont1" > -
									<input type="text" name="o_zip2" size="3" maxlength="3" value="" class="cmfont1" >
									<a href="javascript:FindZip(1)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="o_juso" size="50" maxlength="200" value="" class="cmfont1" ><br>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<!-- 배송지 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자정보와 동일</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="radio" name="same" onclick="SameCopy('Y')">예 &nbsp;
									<input type="radio" name="same" onclick="SameCopy('N')">아니오
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>받으실 분 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="recipientName" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="r_tel1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="r_tel2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="r_tel3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="r_phone1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="r_phone2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" name="r_phone3" size="4" maxlength="4" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="recipientEmail" size="50" maxlength="50" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="r_zip1" size="3" maxlength="3" value="" class="cmfont1" > -
									<input type="text" name="r_zip2" size="3" maxlength="3" value="" class="cmfont1" >
									<a href="javascript:FindZip(2)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" name="r_juso" size="50" maxlength="200" value="" class="cmfont1" ><br>
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>배송시요구사항</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<textarea name="o_desc" cols="60" rows="3" class="cmfont1"></textarea>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="center">
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
						
						<button type="button" id="btn-order-submit">진행</button>
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			
			</form>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>