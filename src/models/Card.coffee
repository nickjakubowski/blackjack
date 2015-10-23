class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      revealed: true
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  stand: ->
    @get('dealerHand') console.log
    #flip dealer card
       #calculate score

       #while dealer.score < 17 
          #dealer.hit
          #if score > players and score <= 21
            #dealer wins
           #else if score > 21
             #player wins

  flip: ->
    @set 'revealed', !@get 'revealed'
    @

