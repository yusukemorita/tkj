/* ========================================================================
 * Bootstrap: tab.js v3.3.7
 * http://getbootstrap.com/javascript/#tabs
 * ========================================================================
 * Copyright 2011-2016 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
+function(e){"use strict";function t(t){return this.each(function(){var i=e(this),r=i.data("bs.tab");r||i.data("bs.tab",r=new n(this)),"string"==typeof t&&r[t]()})}var n=function(t){this.element=e(t)};n.VERSION="3.3.7",n.TRANSITION_DURATION=150,n.prototype.show=function(){var t=this.element,n=t.closest("ul:not(.dropdown-menu)"),i=t.data("target");if(i||(i=t.attr("href"),i=i&&i.replace(/.*(?=#[^\s]*$)/,"")),!t.parent("li").hasClass("active")){var r=n.find(".active:last a"),o=e.Event("hide.bs.tab",{relatedTarget:t[0]}),s=e.Event("show.bs.tab",{relatedTarget:r[0]});if(r.trigger(o),t.trigger(s),!s.isDefaultPrevented()&&!o.isDefaultPrevented()){var a=e(i);this.activate(t.closest("li"),n),this.activate(a,a.parent(),function(){r.trigger({type:"hidden.bs.tab",relatedTarget:t[0]}),t.trigger({type:"shown.bs.tab",relatedTarget:r[0]})})}}},n.prototype.activate=function(t,i,r){function o(){s.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!1),t.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded",!0),a?(t[0].offsetWidth,t.addClass("in")):t.removeClass("fade"),t.parent(".dropdown-menu").length&&t.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!0),r&&r()}var s=i.find("> .active"),a=r&&e.support.transition&&(s.length&&s.hasClass("fade")||!!i.find("> .fade").length);s.length&&a?s.one("bsTransitionEnd",o).emulateTransitionEnd(n.TRANSITION_DURATION):o(),s.removeClass("in")};var i=e.fn.tab;e.fn.tab=t,e.fn.tab.Constructor=n,e.fn.tab.noConflict=function(){return e.fn.tab=i,this};var r=function(n){n.preventDefault(),t.call(e(this),"show")};e(document).on("click.bs.tab.data-api",'[data-toggle="tab"]',r).on("click.bs.tab.data-api",'[data-toggle="pill"]',r)}(jQuery);