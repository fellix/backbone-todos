(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  describe("List Input", function() {
    beforeEach(__bind(function() {
      return this.view = new BackboneTodos.Views.AppView();
    }, this));
    return context('creating a new list', __bind(function() {
      return beforeEach(__bind(function() {
        sinon.spy(this.view, 'createOnEnter');
        this.view.render();
        $(this.view.input).keypress({
          data: "a"
        });
        $(this.view.input).keypress({
          data: "b"
        });
        $(this.view.input).keypress({
          data: "c"
        });
        $(this.view.input).keypress({
          data: 13
        });
        return it("should create the list", __bind(function() {
          return expect(this.view.createOnEnter).ToHaveBeenCalledOnce();
        }, this));
      }, this));
    }, this));
  });
}).call(this);
