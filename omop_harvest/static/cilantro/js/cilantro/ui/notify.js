define(["underscore","backbone","marionette"],function(e,t,i){var n=t.Model.extend({defaults:{level:"info",timeout:4e3,dismissable:!0,header:null,message:""}}),o=i.ItemView.extend({className:"alert",template:"notification",ui:{dismiss:"[data-dismiss]",header:"h4",message:"div"},events:{"click [data-dismiss]":"dismiss",mouseover:"hold",mouseout:"release"},dismiss:function(){clearTimeout(this._dismissTimer)},hold:function(){this._startTime&&(clearTimeout(this._dismissTimer),this.$el.stop().show())},release:function(){if(this._startTime){var e=this._startTime+this.model.get("timeout"),t=Math.max(e-(new Date).getTime(),1e3),i=this;this._dismissTimer=setTimeout(function(){i.$el.fadeOut()},t)}},onRender:function(){this.$el.addClass("alert-"+this.model.get("level")),this.ui.header.toggle(!!this.model.get("header")),this.ui.dismiss.toggle(this.model.get("dismissable"));var e=this.model.get("timeout");e&&(this._startTime=(new Date).getTime(),this.release())}}),s=i.CollectionView.extend({className:"notifications",itemView:o,constructor:function(n){n=n||{},n.collection||(n.collection=new t.Collection),i.CollectionView.prototype.constructor.call(this,n),e.bindAll(this,"notify")},notify:function(e){"string"==typeof e&&(e={message:e});var t=new n(e);return this.collection.add(t),this.children.findByModel(t)}});return{Notifications:s,Notification:o}});
//@ sourceMappingURL=notify.js.map