class window.CardView extends Backbone.View
  className: 'card'

  #template: _.template '<%= rankName %> of <%= suitName %>'
  # template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'
  template: _.template '<%= rankName %> of <%= suitName %>'
  #@template.$attr "background-image",  
  #img/ "rankname" + "-" "suitName" + ".png"

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

