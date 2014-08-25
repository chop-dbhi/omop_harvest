define(["jquery"],function(e){var t=function(e,t){t=t||{};var i=e.outerWidth(),n=e.children(".panel-toggle");return t.full!==!1&&n[0]?i-n.outerWidth():i},i=function(t,i){this.element=e(t),this.options=e.extend({side:"left",closed:!1},i),this.opened=!0,this.side="right"===this.options.side||this.element.hasClass("panel-right")?"right":"left",this.element.addClass("panel-"+this.side),(this.options.closed===!0||this.element.hasClass("closed"))&&(this.opened=!1,this.element.addClass("closed").hide());var n=this;return this.element.on("click",".panel-toggle",function(){n.toggle()}),this};i.prototype={constructor:i,open:function(e){if(!this.opened){e=e||{},this.opened=!0;var i={},n={};i[this.side]=-t(this.element,e),n[this.side]=0,this.element.css(i).show().stop(),e.animate!==!1?this.element.animate(n,300):this.element.css(n),this.element.removeClass("closed")}},close:function(e){if(this.opened){e=e||{},this.opened=!1;var i={},n=t(this.element,e);i[this.side]=-n,this.element.stop(),e.animate!==!1?this.element.animate(i,300):this.element.css(i),this.element.addClass("closed")}},toggle:function(){this.opened?this.close():this.open()},isOpen:function(){return this.opened},isClosed:function(){return!this.opened}},e.fn.panel=function(t,n){"object"==typeof t&&(n=t),this.each(function(){var o=e(this),s=o.data("panel");s||(s=new i(this,n),o.data("panel",s)),"string"==typeof t&&s[t](n)})},e.fn.panel.Constructor=i,e(function(){e(".panel").panel(),e("[data-toggle*=panel]").each(function(){var t=e(this);t.on("click",function(){var i;i=t.data("target")?e(t.data("target")):t.parent(),i.panel("toggle")})})})});
//@ sourceMappingURL=jquery-panels.js.map