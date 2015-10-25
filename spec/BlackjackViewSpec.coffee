assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    window.deck = new Deck()
    window.hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49