<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<form name="form1" action="${pageContext.servletContext.contextPath}/admin/product/add" method="post" enctype="multipart/form-data" >
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    <td width="700" bgcolor="#F2F2F2">
			<select name="categoryNo">
				<option value="0" selected>상품분류를 선택하세요</option>
				<c:forEach items="${categories}" var="category">
					<option value="${category.no }">${category.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="code" value="" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="name" value="" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="brand" value="" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="text" name="price" value="" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td width="700" bgcolor="#F2F2F2">
			<select name="optionNo1">
				<option value="0" selected="selected">없음</option>
				<c:forEach items="${options}" var="option">
					<option value="${option.no}">${option.name}</option>	
				</c:forEach>
			</select> &nbsp; &nbsp; 
			
			<select name="optionNo2">
				<option value="0" selected="selected">없음</option>
				<c:forEach items="${options}" var="option">
					<option value="${option.no}">${option.name}</option>	
				</c:forEach>
			</select> &nbsp; &nbsp; 
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700" bgcolor="#F2F2F2">
			<textarea name="description" rows="10" cols="80"></textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    <td width="700" bgcolor="#F2F2F2">
			<input type="radio" name="status" value="onSale" checked> 판매중
			<input type="radio" name="status" value="notOnSale"> 판매중지
			<input type="radio" name="status" value="soldOut"> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700" bgcolor="#F2F2F2">
			<input type="checkbox" name="isNew" value="1"/> New &nbsp;&nbsp;	
			<input type="checkbox" name="isHit" value="1"/> Hit &nbsp;&nbsp;	
			<input type="checkbox" name="isSale" value="1" onclick="form1.discountRate.disabled=!form1.discountRate.disabled;"> Sale
			할인율 : <input type="text" name="discountRate" value="0" size="3" maxlength="3" disabled> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700" bgcolor="#F2F2F2">
			<b>이미지1</b>: <input type="file" name="img-file" size="30" value="찾아보기"><br>
			<b>이미지2</b>: <input type="file" name="img-file" size="30" value="찾아보기"><br>
			<b>이미지3</b>: <input type="file" name="img-file" size="30" value="찾아보기"><br>
		</td>
	</tr>
</table>
<br>
<table width="800" border="0" cellspacing="0" cellpadding="7">
	<tr> 
		<td align="center">
			<input type="submit" value="등록하기"> &nbsp;&nbsp;
			<a href="product.jsp"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
