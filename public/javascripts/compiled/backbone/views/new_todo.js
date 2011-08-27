(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Views.NewTodo = (function() {
    __extends(NewTodo, Backbone.View);
    function NewTodo() {
      NewTodo.__super__.constructor.apply(this, arguments);
    }
    NewTodo.prototype.template = JST["backbone/templates/new_todo"];
    NewTodo.prototype.events = {
      "submit form": "createTodo",
      "click .close-form": "close"
    };
    NewTodo.prototype.initialize = function(todoList) {
      _.bindAll(this, 'render');
      return this.todos = todoList;
    };
    NewTodo.prototype.render = function() {
      $(this.el).html(this.template());
      this.input = this.$(".new-todo");
      return this;
    };
    NewTodo.prototype.createTodo = function(e) {
      e.preventDefault();
      this.todos.create({
        name: this.input.attr('value'),
        done: false
      });
      return this.input.attr('value', '');
    };
    NewTodo.prototype.close = function(e) {
      e.preventDefault();
      return $(this.el).remove();
    };
    return NewTodo;
  })();
}).call(this);
