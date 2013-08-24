#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'wallet', 100
    @newGame()


  endRound: ->
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()
    if @get('playerHand').scores() > 21
      result = 'Player loses!'
      @set 'wallet', @get('wallet')-10
    else
      @get('dealerHand').dealerTurn(playerScore)
      if @get('dealerHand').scores() > 21
        result = 'Player wins!'
        @set 'wallet', (@get 'wallet')+10
      else if @get('dealerHand').scores() > @get('playerHand').scores()
        result = 'Player loses!'
        @set 'wallet', (@get 'wallet')-10
      else if @get('dealerHand').scores() < @get('playerHand').scores()
        result = 'Player wins!'
        @set 'wallet', (@get 'wallet')+10
      else
        result = 'tie'
    if (confirm "#{result} Your chip count is now #{@get('wallet')}")
      @newGame()

  newGame: ->
    console.log @get 'wallet'
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @trigger 'render', @
    @get('playerHand').on('stand', @endRound, @)

