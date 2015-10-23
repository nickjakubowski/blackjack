class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    console.log @scores()
    alert "You lost" if @scores()[0] > 21
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
    console.log @.Dealer
    #flip dealer card
       #calculate score

       #while dealer.score < 17 
          #dealer.hit
          #if score > players and score <= 21
            #dealer wins
           #else if score > 21
             #player wins

