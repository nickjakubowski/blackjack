# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('standNow', @get('dealerHand').play , @get('dealerHand') ) 
  
  iAmDealer: ->
    alert "hello I'm the dealer"





