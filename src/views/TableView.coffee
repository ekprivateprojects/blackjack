class window.TableView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="plus-bet" data-bet="5">Plus $5</button>
    <button class="minus-bet" data-bet="5">Minus $5</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('currentPlayer').hit()
    'click .stand-button': -> @model.get('currentPlayer').stand()
    'click .plus-bet': -> @model.get('currentPlayer').plusBet()
    'click .minus-bet': -> @model.get('currentPlayer').minusBet()

  initialize: ->

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()

    @$('.dealer-hand-container').html new PlayerView({model: @model.get 'dealer'}).el

    players = @model.get 'players'
    @$('.player-hand-container').append players.map (player) ->
      new PlayerView({model : player}).$el


