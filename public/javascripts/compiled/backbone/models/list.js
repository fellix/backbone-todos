(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  BackboneTodos.Models.List = (function() {
    __extends(List, Backbone.Model);
    function List() {
      List.__super__.constructor.apply(this, arguments);
    }
    List.prototype.paramRoot = 'list';
    List.prototype.defaults = {};
    return List;
  })();
  BackboneTodos.Collections.ListsCollection = (function() {
    __extends(ListsCollection, Backbone.Collection);
    function ListsCollection() {
      ListsCollection.__super__.constructor.apply(this, arguments);
    }
    ListsCollection.prototype.model = BackboneTodos.Models.List;
    ListsCollection.prototype.url = '/lists';
    return ListsCollection;
  })();
}).call(this);
