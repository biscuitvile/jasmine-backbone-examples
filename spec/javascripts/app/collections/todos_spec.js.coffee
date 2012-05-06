describe "Todos collection", ->
  beforeEach ->
    @todo = sinon.stub(window, "Todo")
    @model = new Backbone.Model
      id: 5
      title: "Foo"
    @todo.returns @model
    @todos = new Todos()
    @todos.model = Todo
    @todos.add
      id: 5
      title: "Foo"

  afterEach ->
    @todo.restore()

  it "should add a model", ->
    expect(@todos.length).toEqual 1

  it "should find a model by id", ->
    expect(@todos.get(5).get("id")).toEqual 5

