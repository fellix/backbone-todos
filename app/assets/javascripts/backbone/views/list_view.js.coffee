class BackboneTodos.Views.ListView extends Backbone.View
  tagName: "li",
  className: "list",
  template: JST["backbone/templates/list_view"],
  
  events: {
    "click .add-todo" : "renderTodoForm",
    "dblclick .list-value": "edit",
    "keypress .list-input": "updateOnEnter",
    "click .list-destroy": "remove"
  },
  
  initialize: ->
    _.bindAll(@, 'addOne', 'addAll', 'render');
    @model.bind('change', @render)
    @todos = new BackboneTodos.Collections.TodosCollection(@model.id)
    @todos.bind('add',     @addOne)
    @todos.bind('all',     @addAll)

    @todos.fetch()
    
  render: ->
    $(@el).html(@template(@model.toJSON()))
    @input = @$(".list-input")
    $(@el).attr("id", "list-#{@model.id}")
    @
  
  
  addOne: (todo) ->
    view = new BackboneTodos.Views.TodoView({model: todo}).render().el
    $(view).appendTo(@$(".todos"))
    
  addAll: ->
    @$(".todos").html("")
    @todos.each(@addOne)
  
  renderTodoForm: (e) ->
    e.preventDefault()
    view = new BackboneTodos.Views.NewTodo(@todos).render().el
    @$(".todo-form").html(view)
  
  edit: ->
    $(@el).addClass("editing")
    @input.focus()
  
  updateOnEnter: (e) ->
    return if e.keyCode != 13
    @model.save({name: @input.attr('value')})
    $(@el).removeClass("editing")
  
  remove: (e) ->
    e.preventDefault()
    @model.destroy({error: (model, response) ->
      alert("Can't remove this list! Sorry!")
    }) if confirm("Are you sure?")