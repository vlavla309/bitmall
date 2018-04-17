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


<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

      <!-- 하위 상품목록 -->

			
			<div id = 'wrap-products'>
			<!-- form2 시작 -->
			<form id="form-product-list" name="form2" method="get" action="">
			<input type="hidden" name="pageNo" value="${params.pageNo }"/>
			<c:if test="${not empty params.searchType}">
				<input type="hidden" name="searchType" value="${params.searchType}"/>
				<input type="hidden" name="searchValue" value="${params.searchValue}"/>
			</c:if>
			<c:if test="${params.categoryNo != 0 || params.categoryNo != ''}">
				<input type="hidden" name="categoryNo" value="${params.categoryNo }"/>
			</c:if>
			<input type="hidden" id="sortVal" name="sort" value="${params.sort }"/>
			<div class="header-title">
				<h1>
				<c:choose>
				<c:when test="${not empty category}">
					${category.name}
				</c:when>
				<c:otherwise>Product</c:otherwise>
				</c:choose>
				</h1>
				<div id = "menu-sort">
					<p>
						<c:if test="${not empty params.searchType}">
						<strong>"${params.searchValue}"</strong>로 검색한 결과
						</c:if>
						<b>${pb.totalItemCount}</b> 개의 상품
					<p>
				
					<ul>
						<li><a href="" class="btn-sort" data-value="new">신상품</a></li>
						<li><a href="" class="btn-sort" data-value="name">상품명</a></li>
						<li><a href="" class="btn-sort" data-value="lowest">낮은가격</a></li>
						<li><a href="" class="btn-sort" data-value="highest">높은가격</a></li>
					</ul>
				</div>
			</div>
			
			</form>
			<!-- form2 -->
			
			
			
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
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">
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
				<div class="wrap-pagination">
					<c:choose>
					<c:when test="${pb.hasPreviousPagination}">
						<a href="${pageContext.servletContext.contextPath}/product?pageNo=${pb.startPageNo-1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_prev.gif" alt="이전페이지"/></a>
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
							<c:otherwise><a href="${pageContext.servletContext.contextPath}/product?pageNo=${stat.index}${params.shortQueryString}">${stat.index}</a></c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
					</ol>
					<c:choose>
					<c:when test="${pb.hasNextPagination}">
						<a href="${pageContext.servletContext.contextPath}/product?pageNo=${pb.endPageNo+1}${params.shortQueryString}"><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:when>
					<c:otherwise>
					<a ><img src="${pageContext.servletContext.contextPath}/assets/images/btn_page_next.gif" alt="이전페이지"/></a>
					</c:otherwise>
					</c:choose>
				</div>
			</div>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/product.js"></script>
</body>
</html>