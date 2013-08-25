class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      cardView = new CardView(model: card).$el
      if (card.get('suitName') == 'Spades') then cardView.addClass('spades')
      if (card.get('suitName') == 'Clubs') then cardView.addClass('clubs')
      if (card.get('suitName') == 'Diamonds') then cardView.addClass('diamonds')
      if (card.get('suitName') == 'Hearts') then cardView.addClass('hearts')
      cardView
    @$('.score').text @collection.scores()
