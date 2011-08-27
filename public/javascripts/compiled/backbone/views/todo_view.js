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
    TodoView.prototype.events = {
      "dblclick .todo-content": "edit",
      "keypress .todo-input": "updateOnEnter",
      "click .todo-destroy": "remove"
    };
    TodoView.prototype.initialize = function() {
      _.bindAll(this, 'render');
      return this.model.bind('change', this.render);
    };
    TodoView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      this.input = this.$(".todo-input");
      $(this.el).attr("id", "todo-" + this.model.id);
      return this;
    };
    TodoView.prototype.edit = function() {
      $(this.el).addClass("editing");
      return this.input.focus();
    };
    TodoView.prototype.updateOnEnter = function(e) {
      if (e.keyCode !== 13) {
        return;
      }
      this.model.save({
        name: this.input.attr('value')
      });
      return $(this.el).removeClass("editing");
    };
    TodoView.prototype.remove = function(e) {
      e.preventDefault();
      if (confirm("Are you sure?")) {
        return this.model.destroy();
      }
    };
    return TodoView;
  })();
}).call(this);
