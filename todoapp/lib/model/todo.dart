class ToDo {
  String? id;
  String? todoText;
  bool? isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'this is memo', isDone: true),
      ToDo(id: '02', todoText: 'hello rahu', isDone: true),
      ToDo(id: '03', todoText: 'mango tengo'),
      ToDo(id: '04', todoText: 'todoText'),
      ToDo(id: '05', todoText: 'dhfjhdkfj'),
      ToDo(id: '06', todoText: 'hello there')
    ];
  }
}
