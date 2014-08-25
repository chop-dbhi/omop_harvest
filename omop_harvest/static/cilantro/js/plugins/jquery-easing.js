define(["jquery"],function(e){e.easing.jswing=e.easing.swing,e.extend(e.easing,{def:"easeOutQuad",swing:function(t,i,n,o,s){return e.easing[e.easing.def](t,i,n,o,s)},easeInQuad:function(e,t,i,n,o){return n*(t/=o)*t+i},easeOutQuad:function(e,t,i,n,o){return-n*(t/=o)*(t-2)+i},easeInOutQuad:function(e,t,i,n,o){return(t/=o/2)<1?n/2*t*t+i:-n/2*(--t*(t-2)-1)+i},easeInCubic:function(e,t,i,n,o){return n*(t/=o)*t*t+i},easeOutCubic:function(e,t,i,n,o){return n*((t=t/o-1)*t*t+1)+i},easeInOutCubic:function(e,t,i,n,o){return(t/=o/2)<1?n/2*t*t*t+i:n/2*((t-=2)*t*t+2)+i},easeInQuart:function(e,t,i,n,o){return n*(t/=o)*t*t*t+i},easeOutQuart:function(e,t,i,n,o){return-n*((t=t/o-1)*t*t*t-1)+i},easeInOutQuart:function(e,t,i,n,o){return(t/=o/2)<1?n/2*t*t*t*t+i:-n/2*((t-=2)*t*t*t-2)+i},easeInQuint:function(e,t,i,n,o){return n*(t/=o)*t*t*t*t+i},easeOutQuint:function(e,t,i,n,o){return n*((t=t/o-1)*t*t*t*t+1)+i},easeInOutQuint:function(e,t,i,n,o){return(t/=o/2)<1?n/2*t*t*t*t*t+i:n/2*((t-=2)*t*t*t*t+2)+i},easeInSine:function(e,t,i,n,o){return-n*Math.cos(t/o*(Math.PI/2))+n+i},easeOutSine:function(e,t,i,n,o){return n*Math.sin(t/o*(Math.PI/2))+i},easeInOutSine:function(e,t,i,n,o){return-n/2*(Math.cos(Math.PI*t/o)-1)+i},easeInExpo:function(e,t,i,n,o){return 0==t?i:n*Math.pow(2,10*(t/o-1))+i},easeOutExpo:function(e,t,i,n,o){return t==o?i+n:n*(-Math.pow(2,-10*t/o)+1)+i},easeInOutExpo:function(e,t,i,n,o){return 0==t?i:t==o?i+n:(t/=o/2)<1?n/2*Math.pow(2,10*(t-1))+i:n/2*(-Math.pow(2,-10*--t)+2)+i},easeInCirc:function(e,t,i,n,o){return-n*(Math.sqrt(1-(t/=o)*t)-1)+i},easeOutCirc:function(e,t,i,n,o){return n*Math.sqrt(1-(t=t/o-1)*t)+i},easeInOutCirc:function(e,t,i,n,o){return(t/=o/2)<1?-n/2*(Math.sqrt(1-t*t)-1)+i:n/2*(Math.sqrt(1-(t-=2)*t)+1)+i},easeInElastic:function(e,t,i,n,o){var s=1.70158,r=0,a=n;if(0==t)return i;if(1==(t/=o))return i+n;if(r||(r=.3*o),a<Math.abs(n)){a=n;var s=r/4}else var s=r/(2*Math.PI)*Math.asin(n/a);return-(a*Math.pow(2,10*(t-=1))*Math.sin((t*o-s)*2*Math.PI/r))+i},easeOutElastic:function(e,t,i,n,o){var s=1.70158,r=0,a=n;if(0==t)return i;if(1==(t/=o))return i+n;if(r||(r=.3*o),a<Math.abs(n)){a=n;var s=r/4}else var s=r/(2*Math.PI)*Math.asin(n/a);return a*Math.pow(2,-10*t)*Math.sin((t*o-s)*2*Math.PI/r)+n+i},easeInOutElastic:function(e,t,i,n,o){var s=1.70158,r=0,a=n;if(0==t)return i;if(2==(t/=o/2))return i+n;if(r||(r=o*.3*1.5),a<Math.abs(n)){a=n;var s=r/4}else var s=r/(2*Math.PI)*Math.asin(n/a);return 1>t?-.5*a*Math.pow(2,10*(t-=1))*Math.sin((t*o-s)*2*Math.PI/r)+i:.5*a*Math.pow(2,-10*(t-=1))*Math.sin((t*o-s)*2*Math.PI/r)+n+i},easeInBack:function(e,t,i,n,o,s){return void 0==s&&(s=1.70158),n*(t/=o)*t*((s+1)*t-s)+i},easeOutBack:function(e,t,i,n,o,s){return void 0==s&&(s=1.70158),n*((t=t/o-1)*t*((s+1)*t+s)+1)+i},easeInOutBack:function(e,t,i,n,o,s){return void 0==s&&(s=1.70158),(t/=o/2)<1?n/2*t*t*(((s*=1.525)+1)*t-s)+i:n/2*((t-=2)*t*(((s*=1.525)+1)*t+s)+2)+i},easeInBounce:function(t,i,n,o,s){return o-e.easing.easeOutBounce(t,s-i,0,o,s)+n},easeOutBounce:function(e,t,i,n,o){return(t/=o)<1/2.75?n*7.5625*t*t+i:2/2.75>t?n*(7.5625*(t-=1.5/2.75)*t+.75)+i:2.5/2.75>t?n*(7.5625*(t-=2.25/2.75)*t+.9375)+i:n*(7.5625*(t-=2.625/2.75)*t+.984375)+i},easeInOutBounce:function(t,i,n,o,s){return s/2>i?.5*e.easing.easeInBounce(t,2*i,0,o,s)+n:.5*e.easing.easeOutBounce(t,2*i-s,0,o,s)+.5*o+n}})});
//@ sourceMappingURL=jquery-easing.js.map