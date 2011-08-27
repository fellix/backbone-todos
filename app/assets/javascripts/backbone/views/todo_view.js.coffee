class BackboneTodos.Views.TodoView extends Backbone.View
  tagName: "li",
  className: "todo-item",
  template: JST["backbone/templates/todo_view"],
  
  initialize: ->
    _.bindAll(@, 'render');
    @model.bind('change', @render)
    
  render: ->
    $(@el).html(@template(@model.toJSON()))
    $(@el).attr("id", "todo-#{@model.id}")
    @