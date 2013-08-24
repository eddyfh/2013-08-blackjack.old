#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'result', 'blah'
    @get('playerHand').on('stand', @endRound, @)

  endRound: ->
    result
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()
    if @get('playerHand').scores() > 21
      result = 'Player loses!'
    else
      @get('dealerHand').dealerTurn(playerScore)
      if @get('dealerHand').scores() > 21
        result = 'Player wins!'
      else if @get('dealerHand').scores() > @get('playerHand').scores()
        result = 'Player loses!'
      else
        result = 'Player wins!'
    @set 'result', result
    @trigger('gameOver', @)

  gameResult: ->
    @get('result')
