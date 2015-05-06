$(window).scroll(function(){

  var wScroll = $(this).scrollTop();



  if(wScroll > $('.working-pics').offset().top - ($(window).height() / 1.2)) {

    $('.working-pics figure').each(function(i){

      setTimeout(function(){
        $('.working-pics figure').eq(i).addClass('is-showing');
      }, 150 * (i+1));
    });

  }

});
