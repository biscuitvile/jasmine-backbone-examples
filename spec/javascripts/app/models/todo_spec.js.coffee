describe "Todo model", ->
  describe "when instantiated", ->
    it "should exhibit attributes", ->
      todo = new Todo(title: "Rake leaves")
      expect(todo.get("title")).toEqual "Rake leaves"
