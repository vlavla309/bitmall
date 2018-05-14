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
	<link href="${pageContext.servletContext.contextPath }/assets/css/member.css" rel="stylesheet" type="text/css">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/global.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/cart.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/RegularExpression.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	let isValidId=false;
	$(function(){
		getCartCookieValue();
		$("#id").keydown(function(){
			$(".success", $("#id").parent()).hide();
			isValidId=false;
		})
		
		
		$("#btn-check-id").click(function(){
			$(".error", $("#id").parent()).hide();
			$(".success", $("#id").parent()).hide();
			const id = $("#id").val();

			if(regId.test(id) == false){
				 showError($("#id"), "아이디는 4~20개의 영소문자 및 숫자.");
				return false;
			}
			$.ajax( {
			    url : "${pageContext.servletContext.contextPath}/api/member/checkid",
			    type: "get",
			    dataType: "json",
			    data: {"id":id},
				//contentType: "application/json",
			    success: function(response){
			       if(response.data.trim() == "notExist"){
			    	   console.log(response.message);
			    	   isValidId=true;
			    	   showSuccess($("#id"), "사용가능한 아이디.");
			    	   return;
			       }
			       
			       if(response.data == "exist"){
			    	   showError($("#id"), "이미 존재하는 아이디.");
			    	   return;
			       }
			      
			    },
			    error: function( jqXHR, status, error ){
			    	console.error( "Sorry ^^; " );
			    	console.error( status + "^^ : " + error );
			    }

			   });
			
		});
		
		$("#btn-member-add").click(function(evt){
			evt.preventDefault();
			$(".error").hide();
			$(".success").hide();
			
			if(validate() != true){
				return false;
			}
			
			if(isValidId==false){
				showError($("#id"), "아이디 중복확인을 먼저 하세요.");
				return false;
			}
			
			const phone1 = $("input[name=tel1]").val()+"-"+$("input[name=tel2]").val()+"-"+$("input[name=tel3]").val();
			const phone2 = $("input[name=cell1]").val()+"-"+$("input[name=cell2]").val()+"-"+$("input[name=cell3]").val();
			const inputPhone1 = $("<input type='hidden' value="+phone1+" name='phone1'/>");
			const inputPhone2 = $("<input type='hidden' value="+phone2+" name='phone2'/>");
			const $form= $("#form-member").append(inputPhone1).append(inputPhone2);
			$form.submit();
		});
		
		$(".btn-post").click(function(evt){
			postCode($("#zipCode"), $("#addr"));
		});
		
		const validate = function($form){
			console.log("벨리데이션 ㄱㄱ");
			let result = true;
			const $id = $("[name=id]", $form);
			const $password = $("[name=password]", $form);
			const $password_confirm = $("[name=password_confirm]", $form);
			const $name = $("[name=name]", $form);
			const $phone1_1 = $("[name=tel1]", $form);
			const $zipCode = $("[name=zipCode]", $form);
			const $address = $("[name=address]", $form);
			const $email = $("[name=email]", $form);
			
			const phone1 = $("input[name=tel1]").val()+"-"+$("input[name=tel2]").val()+"-"+$("input[name=tel3]").val();
			const phone2 = $("input[name=cell1]").val()+"-"+$("input[name=cell2]").val()+"-"+$("input[name=cell3]").val();
			
			if(regId.test($id.val()) == false){
				//console.log("어 아이디 잘못됨");
				showError($id,"아이디는 4~20개의 영소문자 및 숫자");
				result = false;
			}	
		
			if(regPassword.test($password.val()) == false){
				//console.log("어 비밀번호 잘못됨");
				showError($password,"비밀번호는 8~20개의 영소문자 및 숫자");
				result = false;
			}
			
			if(($password.val() == $password_confirm.val()) == false){
				//console.log("어 비밀번호가 다름");
				showError($password_confirm,"비밀번호가 같지 않습니다.");
				result = false;	
			}
			
			if(regName.test($name.val()) == false){
				//console.log("어 이름 잘못됨");
				showError($name,"이름은 2~20글자 영대소문자한글");
				result = false;
			}
			
			if(regPhone.test(phone1) == false){
				//console.log("어 전화번호1 잘 못됨");
				showError($phone1_1,"올바른 전화번호를 입력해주세요.");
				result = false;
			}
			
			if(($zipCode.val().trim() != "") == false){
				//console.log("어 주소");
				showError($zipCode,"올바른 주소를 입력해주세요.");
				result = false;
			}
			
			
			
			if(($address.val().trim() != "") == false){
				//console.log("어 주소");
				showError($zipCode,"올바른 주소를 입력해주세요.");
				result = false;
			}
			
			
			if(regEmail.test($email.val()) == false){
				//console.log("어 이메일 잘 못됨");
				showError($email, "올바른 이메일 입력해주세요.");
				result = false;
			}
			
			return result;
		}
		
		const showError = function($target, message, $errorParent){
			let $error=$(".error",$target.parent());
			$error.text(message);
			$error.show();
		}
		
		const showSuccess = function($target, message, $successParent){
			let $success=$(".success");
			console.log($success)
			$success.text(message);
			$success.show();
		}
		
	})
	</script>
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<div id ="wrapper">
<div class="wrap-content">
		<!-------------------------------------------------------------------------------------------->	
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/login_title2.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<form id="form-member" name="form2" method="post" action="">
			<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
				<tr>
					<td align="center" bgcolor="efefef">
						<table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>아이디</b></font>
											</td>
											<td>
												<input type="text" id="id" name="id" maxlength = "12" value="" size="20" class="cmfont1"> 
												<a id="btn-check-id" href="#"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0"></a>
												<p class="error" style="display:none"></p><span class="success" style="display:none"></span>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호</b></font>
											</td>
											<td>
												<input TYPE="password" name="password" maxlength = "20" size="20" class="cmfont1">
												<p class="error" style="display:none"></p>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호 확인</b></font>
											</td>
											<td>
												<input TYPE="password" name="password_confirm" maxlength = "20" size="20" class="cmfont1">
												<p class="error" style="display:none"></p>
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>이 름</b></font>
											</td>
											<td>
												<input type="text" name="name" maxlength = "10" value = "" size="20" class="cmfont1">
												<p class="error" style="display:none"></p>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>생년월일</b></font>
											</td>
											<td>
												<input type="date" name='birthDate' class="cmfont1"/> 
												<p class="error" style="display:none"></p>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>전화 번호</b></font>
											</td>
											<td>
												<input type="text" name='tel1' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" name='tel2' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" name='tel3' size = "4" maxlength = "4" value = "" class="cmfont1">
												<span class="error" style="display:none">아이디는 4~20개의 영소문자 및 숫자</span>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<input type="text" name='cell1' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" name='cell2' size = "4" maxlength = "4" value = "" class="cmfont1"><font color="898989">-</font>
												<input type="text" name='cell3' size = "4" maxlength = "4" value = "" class="cmfont1">
												<span class="error" style="display:none">아이디는 4~20개의 영소문자 및 숫자</span>
											</td>
										</tr>
										<tr>
											<td width="127" height="25">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td>
												<input type="text" id="zipCode" name='zipCode' size = "4" maxlength = "5" value = "" class="cmfont1"><font color="898989"></font>
												<a class="btn-post" href="#"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a>
												<span class="error" style="display:none">아이디는 4~20개의 영소문자 및 숫자</span>
											</td>
										</tr>
										<tr>
											<td width="127" height="20">
											</td>
											<td>
												<input type="text" id="addr" name='address' size = "50" maxlength = "200" value = "" class="cmfont1"><br>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>E-Mail</b></font>
											</td>
											<td>
												<input type="email" name='email' size = "30" maxlength = "50" value = "" class="cmfont1">
												<p class="error" style="display:none"></p>
											</td>
										</tr>
									</table>
			
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td height="45" align="right">
						<!-- <button id="btn-member-add" type="button">가입하기</button> -->
						<input id="btn-member-add" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" border="0">&nbsp;&nbsp;
						<a><img src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0"></a> 
					</td>
				</tr>
			</table>
			</form>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	
		</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>