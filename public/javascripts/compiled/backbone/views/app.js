(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Views.AppView = (function() {
    __extends(AppView, Backbone.View);
    function AppView() {
      AppView.__super__.constructor.apply(this, arguments);
    }
    AppView.prototype.el = $("#taskapp");
    AppView.prototype.initialize = function() {
      this.lists = new BackboneTodos.Collections.ListsCollection;
      _.bindAll(this, 'addOne', 'addAll', 'render');
      this.input = this.$("#new-list");
      this.lists.bind('add', this.addOne);
      this.lists.bind('refresh', this.addAll);
      return this.lists.fetch();
    };
    AppView.prototype.addOne = function(list) {};
    AppView.prototype.addAll = function() {
      return this.lists.each(this.addOne);
    };
    return AppView;
  })();
}).call(this);
