(function(){var e;$(document).ready(function(){return e.initialize(),console.log("new.coffee called")}),e={initialize:function(){return $(window).width()>600?($(".new_map").css({width:$(".yield_container").width()-$(".new_form").outerWidth(!0),height:.8*($(window).height()-$(".footer").outerHeight(!0)-$(".blank_div").outerHeight(!0))}),console.log("yield_container width = "+$(".yield_container").width()+", form width =  "+$(".new_form").outerWidth(!0)),console.log("new.coffee called")):$(".new_map").css({height:.9*($(window).height()-$(".new_form").offset().top-$(".new_form").outerHeight(!0))})}}}).call(this);