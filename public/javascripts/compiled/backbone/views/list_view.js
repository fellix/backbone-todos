(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Views.ListView = (function() {
    __extends(ListView, Backbone.View);
    function ListView() {
      ListView.__super__.constructor.apply(this, arguments);
    }
    ListView.prototype.tagName = "li";
    ListView.prototype.className = "list";
    ListView.prototype.template = JST["backbone/templates/list_view"];
    ListView.prototype.events = {
      "click .add-todo": "renderTodoForm",
      "dblclick .list-value": "edit",
      "keypress .list-input": "updateOnEnter",
      "click .list-destroy": "remove"
    };
    ListView.prototype.initialize = function() {
      _.bindAll(this, 'addOne', 'addAll', 'render');
      this.model.bind('change', this.render);
      this.todos = new BackboneTodos.Collections.TodosCollection(this.model.id);
      this.todos.bind('add', this.addOne);
      this.todos.bind('all', this.addAll);
      return this.todos.fetch();
    };
    ListView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      this.input = this.$(".list-input");
      $(this.el).attr("id", "list-" + this.model.id);
      return this;
    };
    ListView.prototype.addOne = function(todo) {
      var view;
      view = new BackboneTodos.Views.TodoView({
        model: todo
      }).render().el;
      return $(view).appendTo(this.$(".todos"));
    };
    ListView.prototype.addAll = function() {
      this.$(".todos").html("");
      return this.todos.each(this.addOne);
    };
    ListView.prototype.renderTodoForm = function() {
      var view;
      view = new BackboneTodos.Views.NewTodo(this.todos).render().el;
      return this.$(".todo-form").html(view);
    };
    ListView.prototype.edit = function() {
      $(this.el).addClass("editing");
      return this.input.focus();
    };
    ListView.prototype.updateOnEnter = function(e) {
      if (e.keyCode !== 13) {
        return;
      }
      this.model.save({
        name: this.input.attr('value')
      });
      return $(this.el).removeClass("editing");
    };
    ListView.prototype.remove = function(e) {
      e.preventDefault();
      if (confirm("Are you sure?")) {
        return this.model.destroy({
          error: function(model, response) {
            return alert("Can't remove this list! Sorry!");
          }
        });
      }
    };
    return ListView;
  })();
}).call(this);
