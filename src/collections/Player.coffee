class window.Player extends Backbone.Collection
  collection: Hand

  initialize: (params) ->
    @numHands = 0
    @isDealer = params.isDealer
    @bank = params.bank
    @deck = params.deck
    @currentHand = params.hand

    @.on 'split', ->@split
    @.on 'bust',  ->@bust
    @.on 'stand', ->@stand

  hit: ->
    @get 'currentHand'.hit()

  stand: ->
    if @numHands < @.length
      @currentHand.set 'chosen', false
      @currentHand = @[++@numHands]
      @currentHand.set 'chosen', true
      @trigger('switchedHands')
    else
      @numHands = 0
      @trigger 'turnOver'

  plusBet: ->
    @currentHand.plusBet()

  minusBet: ->
    @currentHand.minusBet()

  split: ->
    hand = @.get 'currentHand'
    console.log(hand)
    @.add(new Hand([hand.remove()], hand.get('deck')))

  bust: ->
    @currentHand = @.get 'currentHand'
    @trigger 'bust'

  lose: ->
    console.log('lose')
    @bank -= @currentHand.get 'bet'
    @.remove(@currentHand)
    @currentHand = null
