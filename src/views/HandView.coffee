class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<div></div>'

  initialize: (params) ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    console.log("this should also be a hand")
    console.log(@collection)
    # @$el.append @collection.map (card) ->
    #  new CardView({model: card}).$el
