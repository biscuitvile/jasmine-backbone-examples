describe "Todo model", ->
  beforeEach ->
    @todo = new Todo(title: "Rake leaves")
    collection = url: "/todos"
    @todo.collection = collection

  describe "when instantiated", ->
    it "should exhibit attributes", ->
      expect(@todo.get("title")).toEqual "Rake leaves"

    it "should set the priority to default", ->
      expect(@todo.get("priority")).toEqual 3

  describe "url", ->
    describe "when no id is set", ->
      it "should set the url to the collection url", ->
        expect(@todo.url()).toEqual "/todos"

    describe "when an id is set", ->
      it "returns the collection url and its id", ->
        @todo.id = 1
        expect(@todo.url()).toEqual "/todos/1"

  it "requires a title", ->
    eventSpy = sinon.spy()
    @todo.bind "error", eventSpy
    @todo.save "title": ''
    expect(eventSpy).toHaveBeenCalledOnce()
    expect(eventSpy).toHaveBeenCalledWith @todo, "title can't be blank"
