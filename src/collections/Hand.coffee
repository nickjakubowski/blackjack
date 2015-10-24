pscore = 0
class window.Hand extends Backbone.Collection
  model: Card


  initialize: (array, @deck, @isDealer) ->

  hit: -> #if @isDealer is true 
       #while
    @add(@deck.pop())
    console.log @
    answer = confirm "You lost! New game?" if @scores()[0] > 21
    location.reload() if answer == true
    alert "black jack" if @scores()[0] == 21
    @last()


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: ->
    pscore = @scores()[0]
    #console.log @model.get('dealerHand')
    @trigger 'standNow'
    #@isDealer = true
    #@trigger 'standing'
    #game switches to dealer
       #dealer.flip()
      #while dealer < 17 
      #dealer.hit
         #if dealer hand > 21
           #player wins

      #if dealer.hand > 17 and > player hand\
         #player loses

  play: ->
    console.log pscore
    @at(0).flip()
    while @scores()[0] < 17 and @scores()[1] < 17
      @add(@deck.pop())

    if @scores()[0] > pscore and @scores()[0] < 21
      alert 'You lose'

    #not properly recording aces value of 1



