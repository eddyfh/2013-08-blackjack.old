#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', @endRound, @)

  endRound: ->
    if @get('playerHand').scores()[0] > 21
      console.log 'Player busts!'
    else
      @get('dealerHand').dealerTurn()
    if @get('dealerHand').scores()[0] > 21
      console.log 'Dealer busts!'
    else if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
      console.log 'Player loses!'
    else
      console.log 'Player wins!'
    alert('Next game')
    @trigger('gameOver')

      # console.log @get('dealerHand')
      # for card in @get('dealerHand')
      #   if !card.get('revealed')
      #     card.flip()
      # console.log @get('dealerHand').scores()
