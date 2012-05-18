describe "Todos collection", ->
  beforeEach ->
    @todo = sinon.stub(window, "Todo")
    @todos = new Todos()
    @todo1 = new Backbone.Model
      id: 1
      title: "Todo 1"
      priority: 3
    @todo2 = new Backbone.Model
      id: 2
      title: "Todo 2"
      priority: 2
    @todo3 = new Backbone.Model
      id: 3
      title: "Todo 3"
      priority: 1

  afterEach ->
    @todo.restore()

  describe "when instantiated with a model literal", ->
    beforeEach ->
      @model = new Backbone.Model(id: 5, title: "Foo")
      @todo.returns @model
      @todos.model = Todo
      @todos.add(id: 5, title: "Foo")

    it "should add a model", ->
      expect(@todos.length).toEqual 1

    it "should find a model by id", ->
      expect(@todos.get(5).get("id")).toEqual 5

  it "orders models by priority", ->
    @todos.add [@todo1, @todo2, @todo3]
    expect(@todos.at(0)).toBe @todo3
    expect(@todos.at(1)).toBe @todo2
    expect(@todos.at(2)).toBe @todo1

  describe "when fetching models from the server", ->
    beforeEach ->
      @fixture = @fixtures.Todos.valid
      @server = sinon.fakeServer.create()
      @server.respondWith "GET", "/todos", @validResponse(@fixture)

    afterEach ->
      @server.restore()

    it "should make the correct request", ->
      @todos.fetch()
      expect(@server.requests.length).toEqual 1
      expect(@server.requests[0].method).toEqual 'GET'
      expect(@server.requests[0].url).toEqual '/todos'
