

$('.container > ul > li').click(function(){
  if(!$(this).hasClass('active')){
    $('li.active').removeClass('active');
    $(this).addClass('active');
  }
});