describe "Todo model", ->
  describe "when instantiated", ->
    beforeEach ->
      @todo = new Todo(title: "Rake leaves")

    it "should exhibit attributes", ->
      expect(@todo.get("title")).toEqual "Rake leaves"

    it "should set the priority to default", ->
      expect(@todo.get("priority")).toEqual 3
