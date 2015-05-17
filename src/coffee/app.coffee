game = {}

# MODEL
game.DishList = ->
    m.request
        method: "GET"
        url: "http://127.0.0.1:8000/api/dishes/?format=json"

game.vm = {}
game.vm.init = ->
    @dishes = new game.DishList()

# VIEW
game.view = ->
    game.vm.dishes().map (dish) ->
        m "span", dish.description

# CONTROLLER
game.controller = ->
    game.vm.init()

# RENDER
m.mount document,
    controller: game.controller
    view: game.view
