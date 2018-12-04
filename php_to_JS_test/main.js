$(function(){
  $.ajax({
//  type:   "POST",
  url:    "./xmlload2.php",
//  data:   '東大浦',//変数化するべき
  success: function(data){
    document.write(data);//変数化するべき
    }
  });
});
