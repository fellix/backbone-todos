class BackboneTodos.Views.TodoView extends Backbone.View
  tagName: "li",
  className: "todo-item",
  template: JST["backbone/templates/todo_view"],
  
  events: {
    "dblclick .todo-content": "edit",
    "keypress .todo-input": "updateOnEnter"
  },
  
  initialize: ->
    _.bindAll(@, 'render');
    @model.bind('change', @render)
    
  render: ->
    $(@el).html(@template(@model.toJSON()))
    @input = @$(".todo-input")
    $(@el).attr("id", "todo-#{@model.id}")
    @
  
  edit: ->
    $(@el).addClass("editing")
    @input.focus()
  
  updateOnEnter: (e) ->
    return if e.keyCode != 13
    @model.save({name: @input.attr('value')})
    $(@el).removeClass("editing")