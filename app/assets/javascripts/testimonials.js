$(document).ready(function () {
    //rotation speed and timer
    var speed = 3000;
    
    var run2 = setInterval(rotate2, speed);
    var slides = $('.slide');
    var container = $('#slides ul');
    var elm = container.find(':first-child').prop("tagName");
    var item_height = container.height();
    var previous = 'prev2'; //id of previous button
    var next = 'next2'; //id of next button
    slides.height(item_height); //set the slides to the correct pixel width
    container.parent().height(item_height);
    container.height(slides.length * item_height); //set the slides container to the correct total width
    container.find(elm + ':first').before(container.find(elm + ':last'));
    resetSlides();
    // to change the colour of buttons on hover
    $('#prev2').hover(function(){
    $('#prev2').animate({opacity: 0.5}, 50, 'swing');
    },function(){
        $('#prev2').animate({opacity: 1}, 50, 'swing');
        });
    
    $('#next2').hover(function(){
    $('#next2').animate({opacity: 0.5}, 50, 'swing');
    },function(){
        $('#next2').animate({opacity: 1}, 50, 'swing');
        });
    
    
    //if user clicked on prev button
    
    $('#buttons a').click(function (e) {
        //slide the item
        
        if (container.is(':animated')) {
            return false;
        }
        if (e.target.id == previous) {
            container.stop().animate({
                'top': 0
            }, 1500, function () {
                container.find(elm + ':first').before(container.find(elm + ':last'));
                resetSlides();
            });
        }
        
        if (e.target.id == next) {
            container.stop().animate({
                'top': item_height * -2
            }, 1500, function () {
                container.find(elm + ':last').after(container.find(elm + ':first'));
                resetSlides();
            });
        }
        
        //cancel the link behavior            
        return false;
        
    });
    
    //if mouse hover, pause the auto rotation, otherwise rotate it    
    container.parent().mouseenter(function () {
        clearInterval(run2);
    }).mouseleave(function () {
        run2 = setInterval(rotate2, speed);
    });
    
    
    function resetSlides() {
        //and adjust the container so current is in the frame
        container.css({
            'top': -1 * item_height
        });
    }
    
});
//a simple function to click next link
//a timer will call this function, and the rotation will begin

function rotate2() {
    $('#next2').click();
}