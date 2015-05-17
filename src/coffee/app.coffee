game = {}

# COMPONENTS
game.DishComponent =
    view: (ctrl, dish) ->
        m "div.dish", [
            dish.images.map (img) ->
                m "img",
                    src: img.image
            m "span.description", dish.description
        ]

# MODEL
game.Dish = {}
game.Dish.list = () ->
    m.request
        method: "GET"
        url: "http://127.0.0.1:8000/api/dishes/?format=json"

game.vm = {}
game.vm.init = ->
    @dishes = game.Dish.list()

# VIEW
game.view = ->
    [
        m "h1", "How many calories?",
        game.vm.dishes().map (dish) -> m.component game.DishComponent, dish
    ]

# CONTROLLER
game.controller = ->
    game.vm.init()

# RENDER
m.mount document,
    controller: game.controller
    view: game.view
