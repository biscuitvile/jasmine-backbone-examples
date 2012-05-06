class window.Todo extends Backbone.Model
  defaults:
    priority: 3

  validate: (attrs) ->
    "title can't be blank" if !attrs.title
