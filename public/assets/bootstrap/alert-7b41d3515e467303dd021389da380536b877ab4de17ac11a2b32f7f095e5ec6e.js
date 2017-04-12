/* ========================================================================
 * Bootstrap: alert.js v3.3.7
 * http://getbootstrap.com/javascript/#alerts
 * ========================================================================
 * Copyright 2011-2016 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
+function(e){"use strict";function t(t){return this.each(function(){var n=e(this),i=n.data("bs.alert");i||n.data("bs.alert",i=new r(this)),"string"==typeof t&&i[t].call(n)})}var n='[data-dismiss="alert"]',r=function(t){e(t).on("click",n,this.close)};r.VERSION="3.3.7",r.TRANSITION_DURATION=150,r.prototype.close=function(t){function n(){a.detach().trigger("closed.bs.alert").remove()}var i=e(this),o=i.attr("data-target");o||(o=i.attr("href"),o=o&&o.replace(/.*(?=#[^\s]*$)/,""));var a=e("#"===o?[]:o);t&&t.preventDefault(),a.length||(a=i.closest(".alert")),a.trigger(t=e.Event("close.bs.alert")),t.isDefaultPrevented()||(a.removeClass("in"),e.support.transition&&a.hasClass("fade")?a.one("bsTransitionEnd",n).emulateTransitionEnd(r.TRANSITION_DURATION):n())};var i=e.fn.alert;e.fn.alert=t,e.fn.alert.Constructor=r,e.fn.alert.noConflict=function(){return e.fn.alert=i,this},e(document).on("click.bs.alert.data-api",n,r.prototype.close)}(jQuery);