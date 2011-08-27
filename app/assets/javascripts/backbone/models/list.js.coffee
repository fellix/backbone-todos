class BackboneTodos.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults:{}
  
class BackboneTodos.Collections.ListsCollection extends Backbone.Collection
  model: BackboneTodos.Models.List
  url: '/lists'