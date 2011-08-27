(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Models.Todo = (function() {
    __extends(Todo, Backbone.Model);
    function Todo() {
      Todo.__super__.constructor.apply(this, arguments);
    }
    Todo.prototype.paramRoot = 'todo';
    Todo.prototype.defaults = {};
    return Todo;
  })();
  BackboneTodos.Collections.TodosCollection = (function() {
    __extends(TodosCollection, Backbone.Collection);
    function TodosCollection() {
      TodosCollection.__super__.constructor.apply(this, arguments);
    }
    TodosCollection.prototype.model = BackboneTodos.Models.Todo;
    TodosCollection.prototype.initialize = function(list_id) {
      return this.url = "/lists/" + list_id + "/todos";
    };
    return TodosCollection;
  })();
}).call(this);
