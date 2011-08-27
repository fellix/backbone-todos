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
    AppView.prototype.template = JST["backbone/templates/home"];
    AppView.prototype.events = {
      "keypress #new-list": "createOnEnter"
    };
    AppView.prototype.initialize = function() {
      _.bindAll(this, 'addOne', 'addAll', 'render');
      this.lists = new BackboneTodos.Collections.ListsCollection;
      this.lists.bind('add', this.addOne);
      this.lists.bind('refresh', this.addAll);
      this.lists.bind('all', this.addAll);
      return this.lists.fetch();
    };
    AppView.prototype.addOne = function(list) {
      var view;
      view = new BackboneTodos.Views.ListView({
        model: list
      }).render().el;
      return $(view).appendTo($("#todo-list"));
    };
    AppView.prototype.addAll = function() {
      $("#todo-list").html("");
      return this.lists.each(this.addOne);
    };
    AppView.prototype.render = function() {
      $(this.el).html(this.template());
      $("#todo-list").html("");
      this.input = this.$("#new-list");
      return this;
    };
    AppView.prototype.createOnEnter = function(e) {
      if (e.keyCode !== 13) {
        return;
      }
      this.lists.create({
        name: this.input.attr("value")
      });
      return this.input.attr("value", "");
    };
    return AppView;
  })();
}).call(this);
