// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(document).on('turbo:load',function(){
    setTimeout(function(){
        $("#alert-content").hide(3000)
        $(".messages").hide(3000)
    },1000);
});
$(document).on('turbo:render',function(){
    setTimeout(function(){
        $("#alert-content").hide(3000)
        $(".messages").hide(3000)
    },1000);
});
