class window.Game extends Backbone.Model

  initialize: ->
    @newGame()

  render: ->
    console.log "render in main"
    @get('game').$el.appendTo 'body'

  newGame: ->
    @set 'game', new AppView(model: new App())
    @render()
    @get('game').model.on 'gameOver', =>
      console.log 'asdf'
      if (confirm @get('game').gameResult())
        console.log "recognized game over in main"
        $('body').html('')
        @newGame()

new Game()