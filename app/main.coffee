new AppView(model: new App()).$el.appendTo 'body'


# class window.Game extends Backbone.Model


#   initialize: ->
#     #make a wallet for each player
#     #create listner for win and loss
#     # winner gets + 10, loser -10
#     @set 'wallet', 100
#     @newGame(@get 'wallet')
#     @on 'newGame', ->
#       @newGame(@get 'wallet')
#     , @

#   render: ->
#     @get('game').$el.appendTo 'body'

#   newGame: (wallet)->
#     console.log @
#     #@set 'wallet', wallet
#     console.log @get('wallet')
#     @set 'game', new AppView(model: new App())
#     @render()
#     @get('game').model.on 'gameOver', =>
#       #update wallet
#       if (@get('game').model.gameResult() == 'Player wins!')
#         @set 'wallet', @get 'wallet' + 10
#       else @set 'wallet', @get 'wallet' -10
#       if (confirm @get('game').model.gameResult())
#         $('body').html('')
#         @trigger 'newGame'


# new Game()

# Game{wallet: 100}
# on newGame, get wallet 

# create
#view = AppView(model: new App())
#game = view.get(model)