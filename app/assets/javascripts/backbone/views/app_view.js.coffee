class BackboneTodos.Views.AppView extends Backbone.View
  template: JST["backbone/templates/home"],
  
  events: {
    "keypress #new-list" : "createOnEnter"
  },
  
  initialize: ->
    _.bindAll(@, 'addOne', 'addAll', 'render')

    @lists = new BackboneTodos.Collections.ListsCollection

    @lists.bind('add',     @addOne)
    @lists.bind('refresh', @addAll)
    @lists.bind('all',     @addAll)

    @lists.fetch()
    
  addOne: (list) ->
    view = new BackboneTodos.Views.ListView({model: list}).render().el
    $(view).appendTo($("#todo-list"))
    
  addAll: ->
    $("#todo-list").html("")
    @lists.each(@addOne)
  
  render: ->
    $(@el).html(@template())
    $("#todo-list").html("")
    @input = @$("#new-list")
    @
  
  createOnEnter: (e) ->
    return if e.keyCode != 13
    @lists.create({
      name: @input.attr("value")
    })
    @input.attr("value", "")