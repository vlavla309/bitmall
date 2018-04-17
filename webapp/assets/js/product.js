$(function(){
  const sortValue = $("#sortVal").val();
  console.log(sortValue);
  if(sortValue!=""){
	  $(".btn-sort[data-value="+sortValue+"]").addClass("this");
  }
  
  $(".btn-sort").click(function(evt){
	  evt.preventDefault();
	  const sortType=$(this).data("value");
	  
	  $("#sortVal").val(sortType);
	  $("#form-product-list").submit();
  });
});

let setTotalPrice = function(){
	let totalPrice=0;
	$(".form-product").each(function(index, item){
		console.log("index:"+index);
		let quantity = $("[name=quantity]",item).val();
		let price = parseInt($("[name=price]",item).val());
		totalPrice += quantity * price;
	});
	console.log(totalPrice);
	$("#td-totalPrice").html("<font color=''#0066CC'><b>총 합계금액</font></b> : 상품대금("+numberWithCommas(totalPrice)+"원) + 배송료(2,500원) = <font color='#FF3333'><b>"+numberWithCommas(totalPrice+2500)+" 원</b></font>&nbsp;&nbsp;");
	return totalPrice;
}