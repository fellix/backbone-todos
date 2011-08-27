describe "List Input", ->
  beforeEach =>
    @view = new BackboneTodos.Views.AppView()
  
  context 'creating a new list', =>
    beforeEach =>
      sinon.spy @view, 'createOnEnter'
      
      @view.render()
      $(@view.input).keypress(data: "a")
      $(@view.input).keypress(data: "b")
      $(@view.input).keypress(data: "c")
      $(@view.input).keypress(data: 13)
      
      it "should create the list", =>
        expect(@view.createOnEnter).ToHaveBeenCalledOnce()
      