<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<div id ="wrapper">
	<div class="wrap-content">
<form:form 
modelAttribute  ="product"
id="form-edit" 
name="form1" 
method="post" 
action=""
enctype="multipart/form-data">
	<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    	<td width="700" bgcolor="#F2F2F2">
    		<form:select path="categoryNo">
    			<c:forEach items="${categories }" var="category">
    				<form:option value="${category.no}">${category.name}</form:option>
    			</c:forEach>
    		</form:select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:input name="code" path="code"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:input name="name" path="name"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:input name="brand" path="brand"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:input type="number" name="price" path="price"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td width="700"  bgcolor="#F2F2F2">
    		
			<form:select path="optionNo1">
				<form:option value="0">옵션1</form:option>
    			<c:forEach items="${options }" var="option">
    			<form:option value="${option.no}">${option.name}</form:option>
    			</c:forEach>
    		</form:select> &nbsp; &nbsp; 
			
			<form:select path="optionNo2">
				<form:option value="0">옵션2</form:option>
    			<c:forEach items="${options }" var="option">
    			<form:option value="${option.no}">${option.name}</form:option>
    			</c:forEach>
    		</form:select> &nbsp; &nbsp; 
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:textarea id="description" name="description" path="description"  rows="4" cols="70"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    	<td width="700"  bgcolor="#F2F2F2">
    		<form:radiobutton path="status" value="onsale"/> 판매중
    		<form:radiobutton path="status" value="nosale"/> 판매중지
    		<form:radiobutton path="status" value="soldout"/> 품절
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:checkbox path="isNew"/> New &nbsp;&nbsp;
			<form:checkbox path="isHit"/> Hit &nbsp;&nbsp;
			<form:checkbox path="isSale" onclick="console.log(form1.discountRate);"/> Sale &nbsp;&nbsp;
			<%-- <form:checkbox path="isSale" onclick="form1.discountRate.disabled=!form1.discountRate.disabled;"/> Sale &nbsp;&nbsp; --%>	
			할인율 : <form:input name="discountRate" path="discountRate" maxlength="2" disabled="true"/> %
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">등록일</td>
		<td width="700"  bgcolor="#F2F2F2">
			<form:input type="text" path="regDate" readonly="true"/>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700"  bgcolor="#F2F2F2">

			<table border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<input type='hidden' name='imagename1' value='s001_1.jpg'>
									&nbsp;<input type="checkbox" name="checkno1" value="1"> <b>이미지1</b>: ${productImages[0].name}
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" name="image1" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td>
									<input type='hidden' name='imagename2' value='s001_2.jpg'>
									&nbsp;<input type="checkbox" name="checkno2" value="1"> <b>이미지2</b>: ${productImages[1].name}
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" name="image2" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td>
									<input type='hidden' name='imagename3' value=''>
									&nbsp;<input type="checkbox" name="checkno3" value="1"> <b>이미지3</b>: ${productImages[3].name}
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" name="image3" size="20" value="찾아보기">
								</td>
							</tr> 
							<tr>
								<td><br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를 하세요.</td>
							</tr> 
				  	</table>
						<br><br><br><br><br>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  valign="middle">&nbsp;
									<c:forEach items="${productImages}" var="image" >
									<img src="${pageContext.servletContext.contextPath }/${image.path }" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/${image.path }')">&nbsp;
									</c:forEach>
								</td>
							</tr>				 
						</table>
					</td>
					<td>
						<td align="right" width="310"><img name="big" src="${pageContext.servletContext.contextPath }/${productImages[0].path}" width="300" height="300" border="1"></td>
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>

<br>
<table width="800" border="0" cellspacing="0" cellpadding="5">
	<tr> 
		<td align="center">
			<input type="submit" value="수정하기"> &nbsp;&nbsp
			<a href="${pageContext.servletContext.contextPath}/admin/product?${params.queryString}"><input type="button" value="이전화면"></a>
		</td>
	</tr>
</table>
</form:form>
<form name="form1" method="post" action="" enctype="multipart/form-data">


</form>
</div></div>
</body>
</html>
