$(window).scroll(function(){

  var wScroll = $(this).scrollTop();
  var $headline = $('.parallax-window');
  $nav = $('nav');
  navHeight = 75;




  if (document.getElementsByClassName('working-pics')[0]){

     if(wScroll > $('.working-pics').offset().top - ($(window).height() / 1.2)) {

        $('.working-pics figure').each(function(i){

         setTimeout(function(){
        $('.working-pics figure').eq(i).addClass('is-showing');
      }, 150 * (i+1));
    });

  }
 }

  if (document.getElementsByClassName('parallax-window')[0]){

    var scrollTop = $(this).scrollTop(),
      headlineHeight = $headline.outerHeight() - navHeight,
      navOffset = $nav.offset().top;

 

		  if (navOffset > headlineHeight) {
		    $nav.addClass('scrolled');
		  } else {
		    $nav.removeClass('scrolled');
		  }
      //console.log(navOffset);

      if (navOffset ==0){
       
        $nav.addClass('scrolled');
      }
 }
 

  




});
