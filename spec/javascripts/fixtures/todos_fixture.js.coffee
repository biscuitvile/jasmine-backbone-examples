beforeEach ->
  @fixtures = Todos:
    valid:
      status: "OK"
      version: "1.0"
      response:
        todos: [
          id: 1
          title: "Paint the fence"
        ,
          id: 2
          title: "Wash the dog"
         ]
