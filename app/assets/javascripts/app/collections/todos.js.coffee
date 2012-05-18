  class window.Todos extends Backbone.Collection
    model: window.Todo
    url: "/todos"
    comparator: (todo) ->
      todo.get('priority')
    parse: (res) ->
      res.response.todos
