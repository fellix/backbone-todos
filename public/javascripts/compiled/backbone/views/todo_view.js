(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Views.TodoView = (function() {
    __extends(TodoView, Backbone.View);
    function TodoView() {
      TodoView.__super__.constructor.apply(this, arguments);
    }
    TodoView.prototype.tagName = "li";
    TodoView.prototype.className = "todo-item";
    TodoView.prototype.template = JST["backbone/templates/todo_view"];
    TodoView.prototype.initialize = function() {
      _.bindAll(this, 'render');
      return this.model.bind('change', this.render);
    };
    TodoView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      $(this.el).attr("id", "todo-" + this.model.id);
      return this;
    };
    return TodoView;
  })();
}).call(this);
