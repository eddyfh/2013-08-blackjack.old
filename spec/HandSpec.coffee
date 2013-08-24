describe 'hand', ->
  hand = null
  king = new Card
    rank: 0
    suit: 0
  ace = new Card
    rank: 1
    suit: 0
  ace2 = new Card
    rank: 1
    suit: 0
  two = new Card
    rank: 2
    suit: 0
  six = new Card
    rank: 6
    suit: 0
  deck = [six, ace]
  beforeEach ->


  it "should equal 21 when dealt king and ace", ->
    hand = new Hand [king, ace]
    expect(hand.scores()).toBe 21

  it "should equal 12 when dealt 2 aces", ->
    hand = new Hand [ace2, ace]
    expect(hand.scores()).toBe 12

  it "should reveal dealer card when it is dealer's turn", ->
    hand = new Hand [king.flip(), king]
    expect(hand.at(0).get('revealed')).toBe false
    hand.dealerTurn()
    expect(hand.at(0).get('revealed')).toBe true

  it "Dealer should hit when score is less than 17", ->
    hand = new Hand [king.flip(), two], new Deck()
    hand.dealerTurn 13
    expect(hand.scores()).not.toEqual 12
