class BackboneTodos.Views.NewTodo extends Backbone.View
  className: "well"
  template: JST["backbone/templates/new_todo"],
  
  events:{
    "submit form" : "createTodo",
    "click .close-form": "close"
  }
  
  initialize: (todoList) ->
    _.bindAll(@, 'render')
    @todos = todoList
    
  render: ->
    $(@el).html(@template())
    @input = @$(".new-todo")
    @
  
  createTodo: (e) ->
    e.preventDefault()
    @todos.create({
      name: @input.attr('value'),
      done: false
    })
    @input.attr('value', '')
  
  close: (e) ->
    e.preventDefault()
    $(@el).remove()