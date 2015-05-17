game = {}

game.ImageViewer =
    controller: (images) ->
        current = m.prop 0
        {
            current: current
            next: ->
                current (current() + 1) % images.length
        }

    view: (ctrl, images) ->
        m ".image",
            m "img",
                src: images[ctrl.current()].image
                onclick: ctrl.next

game.DishComponent =
    view: (ctrl, dish) ->
        m "div.dish",
            m.component game.ImageViewer, dish.images
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

game.Guess =
    controller: ->
        {
            calories: m.prop 250
        }

    view: (ctrl, dish) ->
        m ".sliders", [
            m "strong", "Calories:"
            m ".calory_guess", ctrl.calories()
            m "input[type='range']", {
                min: 50
                max: 1000
                step: 25
                oninput: m.withAttr "value", ctrl.calories
                value: ctrl.calories()
            }
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
