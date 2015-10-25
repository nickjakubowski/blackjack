pScore = 0;  
class window.Hand extends Backbone.Collection
  model: Card


  initialize: (array, @deck, @isDealer) ->

  hit: -> #if @isDealer is true 
    @add(@deck.pop())
    answer = confirm "You lost! New game?" if @maxScore() > 21
    location.reload() if answer == true
    alert "black jack" if @maxScore() == 21
    @last()
    pScore = @maxScore()


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  maxScore: -> 
    if @scores()[1] > 21
      @scores()[0] 
    else
      @scores()[1]   

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: ->
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
   
     @at(0).flip()

     while @maxScore() < 17
      @add(@deck.pop())

     if @maxScore() > 21
      alert "Dealer bust"
      return

     if @maxScore() > pScore
      alert "Dealer wins"
      return

     if pScore > @maxScore()
      alert "Player wins"
      return





