game = {}

# COMPONENTS
game.DishComponent =
    view: (ctrl, dish) ->
        m "div.dish",
            m "div.images",
                dish.images.map (img) ->
                    m "img",
                        src: img.image
            m "span.description", dish.description

# MODEL
game.Dish =
    list: ->
        m.request
            method: "GET"
            url: "http://127.0.0.1:8000/api/dishes/?format=json"

game.Login =
    view: ->
        [
            m "h1", "Login"
        ]

game.Main =
    controller: ->
        dishes: game.Dish.list()

    view: (ctrl) ->
        [
            m ".container-fluid", [
                m "h1", "How many calories?"
                m "div.dishes",
                    ctrl.dishes().map (dish) -> m.component game.DishComponent, dish
            ]
        ]

# ROUTES
m.route.mode = "hash"

m.route document.body, "/game",
    "/login": game.Login
    "/game": game.Main
