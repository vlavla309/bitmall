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