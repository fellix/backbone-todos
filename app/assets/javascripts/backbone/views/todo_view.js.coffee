class BackboneTodos.Views.TodoView extends Backbone.View
  tagName: "li",
  className: "todo-item",
  template: JST["backbone/templates/todo_view"],
  
  events: {
    "dblclick .todo-content": "edit",
    "keypress .todo-input": "updateOnEnter",
    "click .todo-destroy": "remove"
  },
  
  initialize: ->
    _.bindAll(@, 'render');
    @model.bind('change', @render)
    
  render: ->
    $(@el).html(@template(@model.toJSON()))
    @input = @$(".todo-input > input")
    $(@el).attr("id", "todo-#{@model.id}")
    @
  
  edit: ->
    $(@el).addClass("todo-editing")
    @input.focus()
  
  updateOnEnter: (e) ->
    return if e.keyCode != 13
    @model.save({name: @input.attr('value')})
    $(@el).removeClass("todo-editing")
  
  remove: (e) ->
    e.preventDefault()
    @model.destroy() if confirm("Are you sure?")