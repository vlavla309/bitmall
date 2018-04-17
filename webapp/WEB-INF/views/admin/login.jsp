<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<input type="hidden" name="no" value="${authUser.no}">

<form name="form1" action="/ad/product" method="post">

<table  bordercolor="purple" border width='330' cellpadding='4' cellspacing='0'>
	<tr>
		<td>
			<table bgcolor="#feffd7" border="0" width="330" cellpadding='0' cellspacing='0'>
				<tr>
					<td width="324" colspan="2" bgcolor='#F0E8C6' height="42" align='center'>
            			<b>쇼핑몰&nbsp;&nbsp;운영자 관리</b>
	        		</td>
			  	</tr>
			    <tr>
					<td width="106" height="5">&nbsp;</td>
					<td width="212" height="5">&nbsp;</td>
			    </tr>
				<tr>
					<td width="106" valign="middle" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/id.gif" width="20" height="16" border="0"></td>
					<td width="212" valign='center'>&nbsp;<input type="text" name="adminid" maxlength="12" size="14"></td>
				</tr>
			    <tr>
					<td width="106" valign="middle" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/pw.gif" width="75" height="16" border="0"></td>
					<td width="212" valign='center'>
		          		&nbsp;<input type="password" name="adminpw" maxlength="12" size="14">
					</td>
			    </tr>
				<tr>
					<td width="324" colspan="2" align='center'>
						<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/login.gif" width="72" height="30" border="0">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form></div></div>
</body>
</html>
