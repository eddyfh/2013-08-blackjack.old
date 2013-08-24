describe 'BlackjackView', ->
  view = null

  beforeEach ->
    view = new AppView({model: new App()})
    spyOn(AppView.prototype, 'render')

  it "should render the view", ->
    console.log view
    expect(view.render).toHaveBeenCalled()


