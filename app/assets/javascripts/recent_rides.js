$(document).ready(function () {
    //rotation speed and timer
    var speed = 3000;
    
    var run1 = setInterval(rotate1, speed);
    var slides = $('.slide1');
    var container = $('#slides1 ul');
    var elm = container.find(':first-child').prop("tagName");
    var item_height = container.height();
    var previous = 'prev1'; //id of previous button
    var next = 'next1'; //id of next button
    slides.height(item_height/3); //set the slides to the correct pixel width
    container.parent().height(item_height);
    container.height(slides.length * item_height/3); //set the slides container to the correct total width
    container.find(elm + ':first').before(container.find(elm + ':last'));
    resetSlides();

    // to change the colour of buttons on hover
    $('#prev1').hover(function(){
    $('#prev1').animate({opacity: 0.5}, 50, 'swing');
    },function(){
        $('#prev1').animate({opacity: 1}, 50, 'swing');
        });
   
    $('#next1').hover(function(){
    $('#next1').animate({opacity: 0.5}, 50, 'swing');
    },function(){
        $('#next1').animate({opacity: 1}, 50, 'swing');
        });
    

    // change the colour of button on hover
    $('#prev1').hover(function(){
        $('#prev1').animate({opacity: 0.5}, 50, 'swing');
        },function(){
            $('#prev1').animate({opacity: 1}, 50, 'swing');
        });
    $('#next1').hover(function(){
        $('#next1').animate({opacity: 0.5}, 50, 'swing');
        },function(){
            $('#next1').animate({opacity: 1}, 50, 'swing');
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
                'top': item_height/3 * -2.15
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
        clearInterval(run1);
    }).mouseleave(function () {
        run1 = setInterval(rotate1, speed);
    });
    
    
    function resetSlides() {
        //and adjust the container so current is in the frame
        container.css({
            'top': -1.1* item_height/3
        });
    }
    
});
//a simple function to click next link
//a timer will call this function, and the rotation will begin

function rotate1() {
    $('#next1').click();
}