class window.PlayerView extends Backbone.View
  className: 'player'

  template: _.template '
    <h2>
      <% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)
      <% if(!isDealer){ %> Bank: $<%=bank%> <% } %>
    </h2>'

  initialize: (params) ->
    @.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$el.append @model.map (hand) ->
     console.log('this should be a hand')
     console.log(hand)
     new HandView({collection: hand}).$el

