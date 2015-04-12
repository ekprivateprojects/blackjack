# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Table extends Backbone.Model
  initialize: ->
    @.set 'deck', deck = new Deck()
    @.set 'players', []

    # instantiate players
    for i in [0...2]
      hand = new Hand([deck.pop(), deck.pop()], @deck)
      player = new Player({hand: hand, isDealer: false, deck: @deck, bank: 100})
      player.on 'bust', ->@bust(player)
      player.on 'turnOver', ->@stand(player)
      player.on 'switchedHands', ->@trigger 'update'

      p = @.get 'players'
      p.push player

    #set current player
    @.set 'currentPlayer', @.get 'players'[0]

    #instantiate dealer
    hand = new Hand([deck.pop(), deck.pop()], @deck)
    dealer = new Player({hand: hand, isDealer: true, deck: @deck})
    dealer.on 'bust', @dealerBust
    dealer.on 'stand', @dealerStand
    @set 'dealer', dealer

  bust: (player) ->
    player.lose()

  stand: (player) ->
    # in the player
    #   how many hands
    #     if last hand
    #       go to next player
    #         if last player
    #           go to to dealer

  dealerBust: ->
    #go through round
    #give bets back.
    `
    players.forEach(function(player) {
      player.win()
    });
    `


  dealerStand: ->
