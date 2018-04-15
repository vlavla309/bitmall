const cartExpires = 2; //장바구니 쿠키 유효기간 (일)

let getCartCookieValue = function(){
	let cookieValue = $.cookie("cart");
	if(cookieValue == null){
		cookieValue = "[]";
		$.cookie("cart", cookieValue,{expires:2 , path:'/'});
	}
	return cookieValue;
}

let setCartCookieValue = function(cookieValue){
	$.cookie("cart", cookieValue,{expires:2 , path:'/'});
}

let addCart = function(obj){
	let cookieValue = getCartCookieValue();
	let cart = JSON.parse(cookieValue);
	console.log(cookieValue);
	
	let isEqual = false;
	cart.forEach(function(elem, index, array){
		let productNo = elem.productNo;
		let optionNo1 = elem.optionNo1;
		let optionNo2 = elem.optionNo2;
		
		if(productNo == obj.productNo && optionNo1 == obj.optionNo1 && optionNo2 == obj.optionNo2){
			isEqual = true;
			array.splice(index,1);
			return;
		}
		
	})
	
	cart.push(obj);
	console.log(JSON.stringify(cart));
	setCartCookieValue(JSON.stringify(cart));
}

