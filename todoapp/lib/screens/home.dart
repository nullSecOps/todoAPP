import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Stack(children: [
          Container(
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All Todos',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      for (ToDo todo in todoList)
                        TodoItem(
                          todo0: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: () {},
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: 'Add New Todo'),
                  ),
                )),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(0)),
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 6, 83, 146),
                        minimumSize: Size(60, 60),
                        elevation: 10),
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: tdBlack,
                size: 30,
              )),
          Text(
            'Todo App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 35,
            width: 35,
            child: CircleAvatar(
              backgroundImage: AssetImage('Assest/profile.png'),
            ),
          )
        ],
      ),
    );
  }
}

void _handleToDoChange(ToDo todo) {
  var prev = todo.isDone;
  todo.isDone = false;
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
            ),
            hintText: 'search..',
            hintStyle:
                TextStyle(fontWeight: FontWeight.normal, color: tdBlack)),
      ),
    );
  }
}
