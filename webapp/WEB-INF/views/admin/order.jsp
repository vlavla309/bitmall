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
			const dateFormat = "yy-mm-dd";
			const from = $("#beginDate").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				from.datepicker("option", "dateFormat", dateFormat);
				$("#form-search").submit();
			});
			
			const to = $("#endDate").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				to.datepicker("option", "dateFormat", dateFormat);
				$("#form-search").submit();
			});

			$("#status").change(function(){
				$("#form-search").submit();
			});
			
			$(".btn-order-delete").click(function(){
				alert("아직..ㅎㅎ")
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
modelAttribute  ="orderParam"
id="form-search" 
name="form1" 
method="get" 
action="">
<table width="920" border="0" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td align="left"  width="100" valign="bottom">&nbsp 주문수 : <font color="#FF0000">${pb.totalItemCount}</font></td>
		<td align="right" width="650" valign="bottom">
			기간 : 
			<form:input id="beginDate" path="beginDate"/>
			 - 
			<form:input id="endDate" path="endDate"/> &nbsp
			<form:select id="status" path="status">
			 	<form:option value="all" >전체</form:option>	
			 	<form:option value="submit">주문신청</form:option>
				<form:option value="confirm">주문확인</form:option>
				<form:option value="payment">입금확인</form:option>
				<form:option value="shipping">배송중</form:option>
				<form:option value="done">주문완료</form:option>
				<form:option value="cancel">주문취소</form:option>
			</form:select>
			 &nbsp 
			 <form:select path="searchType">
			 	<form:option value="code" >주문번호</form:option>	
			 	<form:option value="orderer">고객명</form:option>
				<form:option value="product">상품명</form:option>
			</form:select>
			<form:input id='searchValue'  path="searchValue"/>&nbsp
		</td>
		<td align="left" width="50" height="50" valign="bottom">
			<form:button>검색</form:button>
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form:form>

<table width="920" border="1" cellspacing="0" cellpadding="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="130"  align="center">주문번호</td>
    <td width="100"  align="center">주문일</td>
	  <td width="160" align="center">상품명</td>
		<td width="40"  align="center">제품수</td>	
		<td width="80"  align="center">총금액</td>
    <td width="95"  align="center">주문자</td>
		<td width="50"  align="center">결재</td>
    <td width="135" align="center">주문상태</td>
    <td width="50"  align="center">삭제</td>
	</tr>
	<c:forEach items="${orders}" var="order">
	<tr bgcolor="#F2F2F2" height="23">
		<form method="post" action="${pageContext.servletContext.contextPath}/admin/order/edit/${order.code}"> 
		<td width="70"  align="center"><a class="ordercode" href="${pageContext.servletContext.contextPath }/admin/order/${order.code}?${params.queryString}">${order.code}</a></td>
		<td width="70"  align="center">${order.regDate}</td>
		<td width="250" align="left">
			&nbsp;${order.orderItems[0].name} 
			<c:if test="${order.orderItems.size() > 1}">&nbsp;&nbsp;외 ${order.orderItems.size()-1}</c:if>
		</td>	
		<td width="40" align="center">${order.orderItems.size()}</td>	
		<td width="70"  align="right"><fmt:formatNumber value="${order.totalPrice}" pattern="#,###"/>원</td>	
		<td width="65"  align="center">${order.ordererName }</td>	
		<td width="50"  align="center">
			<c:choose>
			<c:when test="${order.paymentType == 'card' }">
			카드
			</c:when>
			<c:when test="${order.paymentType == 'deposit' }">
			무통장
			</c:when>
			</c:choose>
		</td>	
		<td width="135" align="center" valign="bottom">
			<select class='orderStatus' name="status" style="font-size:9pt; color:black">
				<option value="submit" <c:if test="${order.status == 'submit'}">selected</c:if>>주문신청</option>
				<option value="confirm" <c:if test="${order.status eq 'confirm'}">selected</c:if>>주문확인</option>
				<option value="payment" <c:if test="${order.status eq 'payment'}">selected</c:if>>입금확인</option>
				<option value="shipping" <c:if test="${order.status eq 'shipping'}">selected</c:if>>배송중</option>
				<option value="done" <c:if test="${order.status eq 'done'}">selected</c:if>>주문완료</option>
				<option value="cancel" <c:if test="${order.status eq 'cancel'}">selected</c:if>>주문취소</option>
			</select>&nbsp;
			<input data-code="${order.code}" class="btn-order-edit" type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
		</td>	
		<td width="50" align="center" valign="bottom">
			<a class="btn-order-delete" href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
		</td> 
		</form>
	</tr>
	</c:forEach>
</table>
<br>
<div class="wrap-pagination">
					<c:choose>
					<c:when test="${pb.hasPreviousPagination}">
						<a href="${pageContext.servletContext.contextPath}/admin/order?pageNo=${pb.startPageNo-1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_prev.gif" alt="이전페이지"/></a>
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
							<c:otherwise><a href="${pageContext.servletContext.contextPath}/admin/order?pageNo=${stat.index}${params.shortQueryString}">${stat.index}</a></c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
					</ol>
					<c:choose>
					<c:when test="${pb.hasNextPagination}">
						<a href="${pageContext.servletContext.contextPath}/admin/order?pageNo=${pb.endPageNo+1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:when>
					<c:otherwise>
					<a ><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:otherwise>
					</c:choose>
</div>
</div>
</div>
</body>
</html>