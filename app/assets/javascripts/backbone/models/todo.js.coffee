class BackboneTodos.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:{}
  
class BackboneTodos.Collections.TodosCollection extends Backbone.Collection
  model: BackboneTodos.Models.Todo
  
  initialize: (list_id) ->
    @url = "/lists/#{list_id}/todos"