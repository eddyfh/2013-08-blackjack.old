class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    result =  @add(@deck.pop()).last()
    if @.scores() > 21 then @stand()
    result

  stand: ->
    @trigger('stand', @)

  dealerTurn: (playerScore) ->
    @at(0).flip()
    @hit() while @scores() < 17 && @scores() < playerScore

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false

    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce && score < 12 then score + 10 else score