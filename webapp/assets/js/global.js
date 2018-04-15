$(function(){
	$(".menu-right > div").mouseover(function(){
		$("ul", this).css("display","block");
		//$("ul", this).fadeIn;
	});
	
	$(".menu-right > div").mouseout(function(){
		$("ul", this).css("display","none");
	});
	
	
	$(".menu-left > div").mouseover(function(){
		$("ul", this).css("display","block");
		//$("ul", this).fadeIn;
	});
	
	$(".menu-left > div").mouseout(function(){
		$("ul", this).css("display","none");
	});
});
let formToObject = function(item){
	console.log(item)
	console.log($("[name=productNo]",item));
	let productNo = $("[name=productNo]",item).val();
	let price = parseInt($("[name=price]",item).val());
	let optionNo1 = $("[name=optionNo1]",item).val();
	let optionNo2 = $("[name=optionNo2]",item).val();
	
	let quantity = $("[name=quantity]",item).val();
	/*
	console.log("productNo:"+productNo);
	console.log("price:"+price);
	console.log("optionNo1:"+optionNo1);
	console.log("optionNo2:"+optionNo2);
	console.log("quantity:"+quantity);
	*/
	let orderItem={};
	orderItem.productNo=productNo;
	orderItem.price=price;
	orderItem.optionNo1=optionNo1;
	orderItem.optionNo2=optionNo2;
	orderItem.quantity=quantity;
	
	return orderItem;
}

let ObjToJsonArrStr = function(formSelector){
	let orderItems=[];
	
	$(formSelector).each(function(index, item){
		console.log("index:"+index);
		
		orderItems.push(formToObject(item));
	});
	
	return JSON.stringify(orderItems);
}