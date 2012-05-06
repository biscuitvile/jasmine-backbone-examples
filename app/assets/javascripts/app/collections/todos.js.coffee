class window.Todos extends Backbone.Collection
  model: window.Todo
  comparator: (todo) ->
    todo.get('priority')
